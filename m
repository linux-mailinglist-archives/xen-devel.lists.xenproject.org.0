Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1633E2CEA55
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 09:59:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44220.79289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6vd-0007kl-44; Fri, 04 Dec 2020 08:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44220.79289; Fri, 04 Dec 2020 08:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6vd-0007kM-13; Fri, 04 Dec 2020 08:59:01 +0000
Received: by outflank-mailman (input) for mailman id 44220;
 Fri, 04 Dec 2020 08:58:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c9tS=FI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kl6vb-0007kH-AJ
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 08:58:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c7b661c-fb8e-41ed-82a6-d8adc48280cf;
 Fri, 04 Dec 2020 08:58:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85EE1ACC6;
 Fri,  4 Dec 2020 08:58:57 +0000 (UTC)
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
X-Inumbo-ID: 6c7b661c-fb8e-41ed-82a6-d8adc48280cf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607072337; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nOSvgadS6oqi9y2g+N25P/SfFQDdmEoS8APBzeBXww8=;
	b=RI9BaDaPX/DSW/U7jZ6oiAbr8uqV6kZuHHaAlLWBFZ+PSKCW3fjmDOWv1XJcQ/UB0yRfsI
	LFSKsQoa2OzB4TltMGs9e6tS9LdPzolTMyqGUKgmx/W/yefz8wlI9uOo5tTdmu4bV/I3JY
	mXO0x7Q/lwgvdJifpOMhNxK5iWUteCE=
Subject: Re: [PATCH v2 11/17] xen/hypfs: add getsize() and findentry()
 callbacks to hypfs_funcs
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-12-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <57d62a37-b953-a4fa-8c73-79336d634cb0@suse.com>
Date: Fri, 4 Dec 2020 09:58:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201201082128.15239-12-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.12.2020 09:21, Juergen Gross wrote:
> @@ -197,28 +235,12 @@ static struct hypfs_entry *hypfs_get_entry_rel(struct hypfs_entry_dir *dir,
>              end = strchr(path, '\0');
>          name_len = end - path;
>  
> -        again = false;
> +        entry = dir->e.funcs->findentry(dir, path, name_len);
> +        if ( IS_ERR(entry) || !*end )
> +            return entry;
>  
> -        list_for_each_entry ( entry, &dir->dirlist, list )
> -        {
> -            int cmp = strncmp(path, entry->name, name_len);
> -            struct hypfs_entry_dir *d = container_of(entry,
> -                                                     struct hypfs_entry_dir, e);
> -
> -            if ( cmp < 0 )
> -                return ERR_PTR(-ENOENT);
> -            if ( !cmp && strlen(entry->name) == name_len )
> -            {
> -                if ( !*end )
> -                    return entry;
> -
> -                again = true;
> -                dir = d;
> -                path = end + 1;
> -
> -                break;
> -            }
> -        }
> +        path = end + 1;
> +        dir = container_of(entry, struct hypfs_entry_dir, e);
>      }

Looking at patch 15 my understanding is that "dir" may get invalidated
by the call to the ->findentry() hook above. That is, use of dir has
to be avoided between the two calls. This isn't at all obvious, so I
wonder whether at least a comment wouldn't want adding to avoid future
mistakes.

And of course the same comment applies to the IS_ERR() use here vs NULL
coming back that I already gave for the ->enter() call site.

Jan

