Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 626D72DCFF6
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 12:01:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55861.97439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpr21-00011I-E8; Thu, 17 Dec 2020 11:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55861.97439; Thu, 17 Dec 2020 11:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpr21-00010w-B3; Thu, 17 Dec 2020 11:01:13 +0000
Received: by outflank-mailman (input) for mailman id 55861;
 Thu, 17 Dec 2020 11:01:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YGc=FV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpr20-00010r-J8
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 11:01:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d20381c-d3ca-41a2-b072-9fb940ed0d13;
 Thu, 17 Dec 2020 11:01:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 616A8AD5C;
 Thu, 17 Dec 2020 11:01:09 +0000 (UTC)
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
X-Inumbo-ID: 7d20381c-d3ca-41a2-b072-9fb940ed0d13
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608202869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6evqPzX3Evbi4aJ9HknSky1CGCSRblI/dM7uDwmX9Pw=;
	b=QaP61E+Jc0h/TECVh1XLvojjSNfnmglqtYg+HnBrW1eRnx6yXLmQzRYyZTQwNc3sQnvAfz
	n4fhM7vLKfSbhWzkcwpzsCUdZn8OEB8T6ijI8oYFiGCag92bu3LCe3aK8PXaYK3f3OpVSs
	Ta3ODPnsryaKLgL8aixuyVnc6fbpMsw=
Subject: Re: [PATCH v3 4/8] xen/hypfs: support dynamic hypfs nodes
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <beda1152-4cab-2ed2-bc76-e9125f805e3f@suse.com>
Date: Thu, 17 Dec 2020 12:01:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201209160956.32456-5-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.12.2020 17:09, Juergen Gross wrote:
> @@ -158,6 +159,30 @@ static void node_exit_all(void)
>          node_exit(*last);
>  }
>  
> +void *hypfs_alloc_dyndata_size(unsigned long size)
> +{
> +    unsigned int cpu = smp_processor_id();
> +
> +    ASSERT(per_cpu(hypfs_locked, cpu) != hypfs_unlocked);
> +    ASSERT(per_cpu(hypfs_dyndata, cpu) == NULL);
> +
> +    per_cpu(hypfs_dyndata, cpu) = xzalloc_bytes(size);
> +
> +    return per_cpu(hypfs_dyndata, cpu);
> +}
> +
> +void *hypfs_get_dyndata(void)
> +{
> +    ASSERT(this_cpu(hypfs_dyndata));
> +
> +    return this_cpu(hypfs_dyndata);
> +}
> +
> +void hypfs_free_dyndata(void)
> +{
> +    XFREE(this_cpu(hypfs_dyndata));
> +}

In all three cases, would an intermediate local variable perhaps
yield better generated code? (In hypfs_get_dyndata() this may be
less important because the 2nd use is only an ASSERT().)

> @@ -219,6 +244,12 @@ int hypfs_add_dir(struct hypfs_entry_dir *parent,
>      return ret;
>  }
>  
> +void hypfs_add_dyndir(struct hypfs_entry_dir *parent,
> +                      struct hypfs_entry_dir *template)
> +{
> +    template->e.parent = &parent->e;
> +}

I'm struggling with the direction here: This makes the template
point at the parent, but the parent will still have no
"knowledge" of its new templated children. I suppose that's how
it is meant to be, but maybe this could do with a comment, since
it's the opposite way of hypfs_add_dir()?

Also - does this mean parent may not also have further children,
templated or "normal"?

> @@ -177,6 +182,10 @@ struct hypfs_entry *hypfs_leaf_findentry(const struct hypfs_entry_dir *dir,
>  struct hypfs_entry *hypfs_dir_findentry(const struct hypfs_entry_dir *dir,
>                                          const char *name,
>                                          unsigned int name_len);
> +void *hypfs_alloc_dyndata_size(unsigned long size);
> +#define hypfs_alloc_dyndata(type) (type *)hypfs_alloc_dyndata_size(sizeof(type))

This wants an extra pair of parentheses.

As a minor point, I also wonder whether you really want the type
unsafe version to be easily usable. It would be possible to
largely "hide" it by having

void *hypfs_alloc_dyndata(unsigned long size);
#define hypfs_alloc_dyndata(type) ((type *)hypfs_alloc_dyndata(sizeof(type)))

Jan

