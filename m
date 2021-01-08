Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD65F2EF4F5
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 16:38:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63648.112967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtqD-0005jb-Af; Fri, 08 Jan 2021 15:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63648.112967; Fri, 08 Jan 2021 15:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtqD-0005jF-7F; Fri, 08 Jan 2021 15:38:17 +0000
Received: by outflank-mailman (input) for mailman id 63648;
 Fri, 08 Jan 2021 15:38:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tJ2=GL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kxtqB-0005jA-Af
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 15:38:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efa5b7e6-0042-4512-bee6-15153a3ab0e6;
 Fri, 08 Jan 2021 15:38:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8105AAD89;
 Fri,  8 Jan 2021 15:38:13 +0000 (UTC)
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
X-Inumbo-ID: efa5b7e6-0042-4512-bee6-15153a3ab0e6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610120293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nn6HPY4yJDUjBBIi4BmkXFmESHtgqGjNNQkl09oNOqc=;
	b=L5e2c2wuBNmVTaHZB5GIWKg/veHoe4x9vibQLm4ZR82oDgzAGvaEmgQIKXpE8QUF14xWVm
	vjNcltt+uwYv8ErvDGliWScqLiueamBcUTORXMk3O0wd/aLUr1G5oPz+n+EGyueclZtYIa
	ff6Jf/bEYBGnjNa+XkAHU6VaMYIYdcw=
Subject: Re: [PATCH RFC 1/3] xen/hypfs: add support for bool leafs in dynamic
 directories
To: Juergen Gross <jgross@suse.com>
Cc: paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201209161618.309-1-jgross@suse.com>
 <20201209161618.309-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e37ff901-1d40-b5ef-61ec-9a51bcedbc37@suse.com>
Date: Fri, 8 Jan 2021 16:38:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201209161618.309-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.12.2020 17:16, Juergen Gross wrote:
> --- a/xen/common/hypfs.c
> +++ b/xen/common/hypfs.c
> @@ -501,17 +501,26 @@ int hypfs_read_dir(const struct hypfs_entry *entry,
>      return 0;
>  }
>  
> -int hypfs_read_leaf(const struct hypfs_entry *entry,
> -                    XEN_GUEST_HANDLE_PARAM(void) uaddr)
> +static int hypfs_read_leaf_off(const struct hypfs_entry *entry,
> +                               XEN_GUEST_HANDLE_PARAM(void) uaddr,
> +                               void *off)
>  {
>      const struct hypfs_entry_leaf *l;
>      unsigned int size = entry->funcs->getsize(entry);
> +    const void *ptr;
>  
>      ASSERT(this_cpu(hypfs_locked) != hypfs_unlocked);
>  
>      l = container_of(entry, const struct hypfs_entry_leaf, e);
> +    ptr = off ? off + (unsigned long)l->u.content : l->u.content;

This is very irritating - you effectively add together two
pointers. And even if this was correct for some reason, it
would seem better readable as

    ptr = l->u.content + (unsigned long)off;

to me.

> --- a/xen/include/xen/hypfs.h
> +++ b/xen/include/xen/hypfs.h
> @@ -160,6 +160,8 @@ static inline void hypfs_string_set_reference(struct hypfs_entry_leaf *leaf,
>      HYPFS_FIXEDSIZE_INIT(var, XEN_HYPFS_TYPE_BOOL, nam, contvar, \
>                           &hypfs_bool_wr_funcs, 1)
>  
> +#define HYPFS_STRUCT_ELEM(type, elem)    (((type *)NULL)->elem)

Kind of similar here - this very much looks like a NULL
deref, avoidable by a user only if it takes the address of
the construct. If there's really some non-pointer value
to be encoded here, it would be better to avoid misuse by
making the construct safe in a self-contained way.

Jan

