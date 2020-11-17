Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A21E22B5F42
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 13:38:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28963.58116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf0F1-0005n4-NF; Tue, 17 Nov 2020 12:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28963.58116; Tue, 17 Nov 2020 12:37:47 +0000
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
	id 1kf0F1-0005mf-Jw; Tue, 17 Nov 2020 12:37:47 +0000
Received: by outflank-mailman (input) for mailman id 28963;
 Tue, 17 Nov 2020 12:37:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kf0F0-0005ma-Pl
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 12:37:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bdb9ce39-f8ae-4eaf-a3ab-e0f8e02b0e3b;
 Tue, 17 Nov 2020 12:37:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 07C43AF13;
 Tue, 17 Nov 2020 12:37:45 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kf0F0-0005ma-Pl
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 12:37:46 +0000
X-Inumbo-ID: bdb9ce39-f8ae-4eaf-a3ab-e0f8e02b0e3b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bdb9ce39-f8ae-4eaf-a3ab-e0f8e02b0e3b;
	Tue, 17 Nov 2020 12:37:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605616665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a2W5MJbG4LyDpayhsQW8gGLbqrvmBJMcq+Ai06Mo5Bc=;
	b=d9/nyvfnCfZryZbibtFkmv7QdmaNHz0aPUZ6QcDV0BVFcm6Z2l3pn98GuefMtAKAY70+K8
	DYHQ91mDGfJ2G308X5Tmf6w2rbxklR0tMNJEj114M7fPHR9EMn2frWraJnFr172mLt5t27
	Qp4XLit2QjG99PlQGSv9HUiV8E4fIQc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 07C43AF13;
	Tue, 17 Nov 2020 12:37:45 +0000 (UTC)
Subject: Re: [PATCH 08/12] xen/hypfs: support dynamic hypfs nodes
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-9-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d8653200-fbee-4e87-3e2d-7062879d7b4e@suse.com>
Date: Tue, 17 Nov 2020 13:37:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201026091316.25680-9-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.2020 10:13, Juergen Gross wrote:
> Add a getsize() function pointer to struct hypfs_funcs for being able
> to have dynamically filled entries without the need to take the hypfs
> lock each time the contents are being generated.

But a dynamic update causing a change in size will require _some_
lock, won't it?

> --- a/xen/common/hypfs.c
> +++ b/xen/common/hypfs.c
> @@ -19,28 +19,29 @@
>  CHECK_hypfs_dirlistentry;
>  #endif
>  
> -#define DIRENTRY_NAME_OFF offsetof(struct xen_hypfs_dirlistentry, name)
> -#define DIRENTRY_SIZE(name_len) \
> -    (DIRENTRY_NAME_OFF +        \
> -     ROUNDUP((name_len) + 1, alignof(struct xen_hypfs_direntry)))
> -
>  struct hypfs_funcs hypfs_dir_funcs = {
>      .read = hypfs_read_dir,
> +    .getsize = hypfs_getsize,
> +    .findentry = hypfs_dir_findentry,
>  };
>  struct hypfs_funcs hypfs_leaf_ro_funcs = {
>      .read = hypfs_read_leaf,
> +    .getsize = hypfs_getsize,
>  };
>  struct hypfs_funcs hypfs_leaf_wr_funcs = {
>      .read = hypfs_read_leaf,
>      .write = hypfs_write_leaf,
> +    .getsize = hypfs_getsize,
>  };
>  struct hypfs_funcs hypfs_bool_wr_funcs = {
>      .read = hypfs_read_leaf,
>      .write = hypfs_write_bool,
> +    .getsize = hypfs_getsize,
>  };
>  struct hypfs_funcs hypfs_custom_wr_funcs = {
>      .read = hypfs_read_leaf,
>      .write = hypfs_write_custom,
> +    .getsize = hypfs_getsize,
>  };

With the increasing number of fields that may (deliberately or
by mistake) be NULL, should we gain some form of proactive
guarding against calls through such pointers?

> @@ -88,6 +93,23 @@ static void hypfs_unlock(void)
>      }
>  }
>  
> +void *hypfs_alloc_dyndata(unsigned long size, unsigned long align)

Will callers really need to specify (high) alignment values? IOW ...

> +{
> +    unsigned int cpu = smp_processor_id();
> +
> +    ASSERT(per_cpu(hypfs_locked, cpu) != hypfs_unlocked);
> +    ASSERT(per_cpu(hypfs_dyndata, cpu) == NULL);
> +
> +    per_cpu(hypfs_dyndata, cpu) = _xzalloc(size, align);

... is xzalloc_bytes() not suitable for use here?

> @@ -171,15 +193,34 @@ static int hypfs_get_path_user(char *buf,
>      return 0;
>  }
>  
> +struct hypfs_entry *hypfs_dir_findentry(struct hypfs_entry_dir *dir,
> +                                        const char *name,
> +                                        unsigned int name_len)
> +{
> +    struct hypfs_entry *entry;
> +
> +    list_for_each_entry ( entry, &dir->dirlist, list )
> +    {
> +        int cmp = strncmp(name, entry->name, name_len);
> +
> +        if ( cmp < 0 )
> +            return ERR_PTR(-ENOENT);
> +
> +        if ( !cmp && strlen(entry->name) == name_len )
> +            return entry;
> +    }
> +
> +    return ERR_PTR(-ENOENT);
> +}
> +
>  static struct hypfs_entry *hypfs_get_entry_rel(struct hypfs_entry_dir *dir,
>                                                 const char *path)
>  {
>      const char *end;
>      struct hypfs_entry *entry;
>      unsigned int name_len;
> -    bool again = true;
>  
> -    while ( again )
> +    for ( ;; )

Nit: Strictly speaking another blank is needed between the two
semicolons.

> @@ -275,22 +305,25 @@ int hypfs_read_leaf(const struct hypfs_entry *entry,
>  
>      l = container_of(entry, const struct hypfs_entry_leaf, e);
>  
> -    return copy_to_guest(uaddr, l->u.content, entry->size) ? -EFAULT: 0;
> +    return copy_to_guest(uaddr, l->u.content, entry->funcs->getsize(entry)) ?
> +                                              -EFAULT : 0;

With the intended avoiding of locking, how is this ->getsize()
guaranteed to not ...

> @@ -298,7 +331,7 @@ static int hypfs_read(const struct hypfs_entry *entry,
>          goto out;
>  
>      ret = -ENOBUFS;
> -    if ( ulen < entry->size + sizeof(e) )
> +    if ( ulen < size + sizeof(e) )
>          goto out;

... invalidate the checking done here? (A similar risk looks to
exist on the write path, albeit there we have at least the
->max_size checks, where I hope that field isn't mean to become
dynamic as well.)

Jan

