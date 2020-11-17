Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3FE2B62E7
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 14:34:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28990.58143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf17K-00031o-A9; Tue, 17 Nov 2020 13:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28990.58143; Tue, 17 Nov 2020 13:33:54 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf17K-00031P-77; Tue, 17 Nov 2020 13:33:54 +0000
Received: by outflank-mailman (input) for mailman id 28990;
 Tue, 17 Nov 2020 13:33:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kf17I-00031K-Uh
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 13:33:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bc85bba-86a0-40a7-b550-2c8300eb2c26;
 Tue, 17 Nov 2020 13:33:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 203FFAC23;
 Tue, 17 Nov 2020 13:33:50 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kf17I-00031K-Uh
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 13:33:52 +0000
X-Inumbo-ID: 6bc85bba-86a0-40a7-b550-2c8300eb2c26
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6bc85bba-86a0-40a7-b550-2c8300eb2c26;
	Tue, 17 Nov 2020 13:33:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605620030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=79ygoGHAAzlFJx2jZakVEWODcUmCwXL7xp6xX6/cLQw=;
	b=rVhXgS1E/IualgL2ea8ecYlaYis0FVa0+UFqvvmAjUCdzNLk9tQE7Q4kc4KfCZmFgbo/Ya
	vX4cq3ZFS4N2g42O5YDDdI+6HLxYa5gGSmZoNnQ3brUJabLLRO8mzGhHwwJ0zWl0LA2ZND
	KP3e/ById11grW7mzSj1+QTN1kONl+0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 203FFAC23;
	Tue, 17 Nov 2020 13:33:50 +0000 (UTC)
Subject: Re: [PATCH 09/12] xen/hypfs: add support for id-based dynamic
 directories
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-10-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6f8c0d3d-73f6-d10f-182a-8bf76856bf09@suse.com>
Date: Tue, 17 Nov 2020 14:33:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201026091316.25680-10-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.2020 10:13, Juergen Gross wrote:
> --- a/xen/common/hypfs.c
> +++ b/xen/common/hypfs.c
> @@ -257,6 +257,82 @@ unsigned int hypfs_getsize(const struct hypfs_entry *entry)
>      return entry->size;
>  }
>  
> +int hypfs_read_dyndir_id_entry(struct hypfs_entry_dir *template,
> +                               unsigned int id, bool is_last,
> +                               XEN_GUEST_HANDLE_PARAM(void) *uaddr)
> +{
> +    struct xen_hypfs_dirlistentry direntry;
> +    char name[12];

Perhaps better tie this literal 12 to the one used for declaring
struct hypfs_dyndir_id's name[] field, such that an eventual
change will need making in exactly one place?

> +    unsigned int e_namelen, e_len;
> +
> +    e_namelen = snprintf(name, sizeof(name), "%u", id);
> +    e_len = HYPFS_DIRENTRY_SIZE(e_namelen);
> +    direntry.e.pad = 0;
> +    direntry.e.type = template->e.type;
> +    direntry.e.encoding = template->e.encoding;
> +    direntry.e.content_len = template->e.funcs->getsize(&template->e);
> +    direntry.e.max_write_len = template->e.max_size;
> +    direntry.off_next = is_last ? 0 : e_len;
> +    if ( copy_to_guest(*uaddr, &direntry, 1) )
> +        return -EFAULT;
> +    if ( copy_to_guest_offset(*uaddr, HYPFS_DIRENTRY_NAME_OFF, name,
> +                              e_namelen + 1) )
> +        return -EFAULT;
> +
> +    guest_handle_add_offset(*uaddr, e_len);
> +
> +    return 0;
> +}
> +
> +static struct hypfs_entry *hypfs_dyndir_findentry(struct hypfs_entry_dir *dir,
> +                                                  const char *name,
> +                                                  unsigned int name_len)
> +{
> +    struct hypfs_dyndir_id *data;

const? (also in read_dyndir below)

> +    data = hypfs_get_dyndata();
> +    if ( !data )
> +        return ERR_PTR(-ENOENT);
> +
> +    /* Use template with original findentry function. */
> +    return data->template->e.funcs->findentry(data->template, name, name_len);

Why does this pass the address of the template? If it truly is
(just) a template, then its dirlist ought to be empty at all
times? If otoh the "template" indeed gets used as a node in the
tree then perhaps it wants naming differently? "Stem" would come
to mind, but likely there are better alternatives. I've also
considered the German "Statthalter", but its English translations
don't seem reasonable to me here. And "placeholder" has kind of a
negative touch. (Also in this case some of my "const?" remarks
may be irrelevant.)

Further this and ...

> +static int hypfs_read_dyndir(const struct hypfs_entry *entry,
> +                             XEN_GUEST_HANDLE_PARAM(void) uaddr)
> +{
> +    struct hypfs_dyndir_id *data;
> +
> +    data = hypfs_get_dyndata();
> +    if ( !data )
> +        return -ENOENT;
> +
> +    /* Use template with original read function. */
> +    return data->template->e.funcs->read(&data->template->e, uaddr);

... this using the template's funcs is somewhat unexpected, but
with the functions acting as the entry's .findentry() / .read()
hooks is obviously the right thing (and if the template is more
that what the word says, the consideration may become
inapplicable anyway). The implication is that the hooks
themselves can't be replaced, if need be down the road.

> +struct hypfs_entry *hypfs_gen_dyndir_entry_id(struct hypfs_entry_dir *template,
> +                                              unsigned int id)
> +{
> +    struct hypfs_dyndir_id *data;
> +
> +    data = hypfs_alloc_dyndata(sizeof(*data), alignof(*data));
> +    if ( !data )
> +        return ERR_PTR(-ENOMEM);
> +
> +    data->template = template;
> +    data->id = id;

I can't seem to spot any consumer of this field: Is it really
needed?

> --- a/xen/include/xen/hypfs.h
> +++ b/xen/include/xen/hypfs.h
> @@ -50,6 +50,15 @@ struct hypfs_entry_dir {
>      struct list_head dirlist;
>  };
>  
> +struct hypfs_dyndir_id {
> +    struct hypfs_entry_dir dir;       /* Modified copy of template. */
> +    struct hypfs_funcs funcs;         /* Dynamic functions. */
> +    struct hypfs_entry_dir *template; /* Template used. */

const?

> @@ -150,6 +159,11 @@ struct hypfs_entry *hypfs_dir_findentry(struct hypfs_entry_dir *dir,
>                                          unsigned int name_len);
>  void *hypfs_alloc_dyndata(unsigned long size, unsigned long align);
>  void *hypfs_get_dyndata(void);
> +int hypfs_read_dyndir_id_entry(struct hypfs_entry_dir *template,

const?

> +                               unsigned int id, bool is_last,
> +                               XEN_GUEST_HANDLE_PARAM(void) *uaddr);
> +struct hypfs_entry *hypfs_gen_dyndir_entry_id(struct hypfs_entry_dir *template,

const?

Jan

