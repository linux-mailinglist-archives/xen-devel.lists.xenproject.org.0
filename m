Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB522CDA46
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 16:45:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43792.78659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkqmL-0004SV-FR; Thu, 03 Dec 2020 15:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43792.78659; Thu, 03 Dec 2020 15:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkqmL-0004S6-Bz; Thu, 03 Dec 2020 15:44:21 +0000
Received: by outflank-mailman (input) for mailman id 43792;
 Thu, 03 Dec 2020 15:44:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSHx=FH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkqmJ-0004S1-ER
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 15:44:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 062ed0e9-2bcb-4eb5-ba1b-dcf586605d4f;
 Thu, 03 Dec 2020 15:44:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6A8D6ABE9;
 Thu,  3 Dec 2020 15:44:17 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 062ed0e9-2bcb-4eb5-ba1b-dcf586605d4f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607010257; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=klzws1Zvp8VyV7qej1D8cd+MzGBuegBp5ai6h1JSypU=;
	b=NjGMXeoL48zuoyhSdqxGYoHknBGhKVFejx6v/OC+BBsxQxpsZxg286yBlX9ONhblxvQ5Qn
	olUsITdm2ic/bEl9TAxYcBHicuFB8U7NYXzkhFgx3kk/KksKvtt1ks6VtXN+tlUofuOLx0
	HKYLxo/94QWdB/eESxAWAIiKEuNVXqQ=
Subject: Re: [PATCH v2 14/17] xen/hypfs: add support for id-based dynamic
 directories
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-15-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <369bcb0b-5554-8976-d3fe-5066b3d7cdce@suse.com>
Date: Thu, 3 Dec 2020 16:44:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201201082128.15239-15-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.12.2020 09:21, Juergen Gross wrote:
> --- a/xen/common/hypfs.c
> +++ b/xen/common/hypfs.c
> @@ -355,6 +355,81 @@ unsigned int hypfs_getsize(const struct hypfs_entry *entry)
>      return entry->size;
>  }
>  
> +int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template,
> +                               unsigned int id, bool is_last,
> +                               XEN_GUEST_HANDLE_PARAM(void) *uaddr)
> +{
> +    struct xen_hypfs_dirlistentry direntry;
> +    char name[HYPFS_DYNDIR_ID_NAMELEN];
> +    unsigned int e_namelen, e_len;
> +
> +    e_namelen = snprintf(name, sizeof(name), template->e.name, id);
> +    e_len = DIRENTRY_SIZE(e_namelen);
> +    direntry.e.pad = 0;
> +    direntry.e.type = template->e.type;
> +    direntry.e.encoding = template->e.encoding;
> +    direntry.e.content_len = template->e.funcs->getsize(&template->e);
> +    direntry.e.max_write_len = template->e.max_size;
> +    direntry.off_next = is_last ? 0 : e_len;
> +    if ( copy_to_guest(*uaddr, &direntry, 1) )
> +        return -EFAULT;
> +    if ( copy_to_guest_offset(*uaddr, DIRENTRY_NAME_OFF, name,
> +                              e_namelen + 1) )
> +        return -EFAULT;
> +
> +    guest_handle_add_offset(*uaddr, e_len);
> +
> +    return 0;
> +}
> +
> +static struct hypfs_entry *hypfs_dyndir_findentry(
> +    const struct hypfs_entry_dir *dir, const char *name, unsigned int name_len)
> +{
> +    const struct hypfs_dyndir_id *data;
> +
> +    data = hypfs_get_dyndata();
> +
> +    /* Use template with original findentry function. */
> +    return data->template->e.funcs->findentry(data->template, name, name_len);
> +}
> +
> +static int hypfs_read_dyndir(const struct hypfs_entry *entry,
> +                             XEN_GUEST_HANDLE_PARAM(void) uaddr)
> +{
> +    const struct hypfs_dyndir_id *data;
> +
> +    data = hypfs_get_dyndata();
> +
> +    /* Use template with original read function. */
> +    return data->template->e.funcs->read(&data->template->e, uaddr);
> +}
> +
> +struct hypfs_entry *hypfs_gen_dyndir_entry_id(
> +    const struct hypfs_entry_dir *template, unsigned int id)
> +{
> +    struct hypfs_dyndir_id *data;
> +
> +    data = hypfs_get_dyndata();
> +
> +    data->template = template;
> +    data->id = id;
> +    snprintf(data->name, sizeof(data->name), template->e.name, id);
> +    data->dir = *template;
> +    data->dir.e.name = data->name;

I'm somewhat puzzled, if not confused, by the apparent redundancy
of this name generation with that in hypfs_read_dyndir_id_entry().
Wasn't the idea to be able to use generic functions on these
generated entries?

Also, seeing that other function's name, wouldn't the one here
want to be named hypfs_gen_dyndir_id_entry()?

Jan

