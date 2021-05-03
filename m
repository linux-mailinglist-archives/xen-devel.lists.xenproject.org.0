Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09075371406
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 13:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121521.229205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldWSP-000154-QK; Mon, 03 May 2021 11:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121521.229205; Mon, 03 May 2021 11:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldWSP-00014f-Mi; Mon, 03 May 2021 11:09:45 +0000
Received: by outflank-mailman (input) for mailman id 121521;
 Mon, 03 May 2021 11:09:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldWSN-00013p-QV
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 11:09:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 872018e6-1c35-485d-bd7f-bf6278e55303;
 Mon, 03 May 2021 11:09:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1293FAE5E;
 Mon,  3 May 2021 11:09:42 +0000 (UTC)
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
X-Inumbo-ID: 872018e6-1c35-485d-bd7f-bf6278e55303
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620040182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KcKhOmqJ+i3Zi3fnzQJWf5u2EfWduMEp8/Qo/2sKRpI=;
	b=UOFPgIyt3ECtqZdEb63i3yTgQsfeVmJiOhCNnWOf/6mck/xoQYvqwvWP++DNVxE2+7EERh
	YG2EBY2gphESSymW30gQpXNRXMZKG5i0F4f2NQV2kFjPP312MAK/4SdBZxCFmWNgkbBjd/
	aRnwEmoMg0fA/NXIu0PQBKGFTirPYDY=
Subject: Re: [PATCH v3 08/13] libs/guest: make a cpu policy compatible with
 older Xen versions
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-9-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <51ee228a-2d53-2dd4-55cf-233d81ba4958@suse.com>
Date: Mon, 3 May 2021 13:09:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210430155211.3709-9-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.04.2021 17:52, Roger Pau Monne wrote:
> @@ -1086,3 +1075,42 @@ int xc_cpu_policy_calc_compatible(xc_interface *xch,
>  
>      return rc;
>  }
> +
> +int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
> +                                  bool hvm)

I'm concerned of the naming, and in particular the two very different
meanings of "compatible" for xc_cpu_policy_calc_compatible() and this
new one. I'm afraid I don't have a good suggestion though, short of
making the name even longer and inserting "backwards".

Jan

> +{
> +    xc_cpu_policy_t host;
> +    int rc;
> +
> +    host = xc_cpu_policy_init();
> +    if ( !host )
> +    {
> +        errno = ENOMEM;
> +        return -1;
> +    }
> +
> +    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
> +    if ( rc )
> +    {
> +        ERROR("Failed to get host policy");
> +        goto out;
> +    }
> +
> +    /*
> +     * Account for features which have been disabled by default since Xen 4.13,
> +     * so migrated-in VM's don't risk seeing features disappearing.
> +     */
> +    policy->cpuid.basic.rdrand = host->cpuid.basic.rdrand;
> +
> +    if ( hvm )
> +        policy->cpuid.feat.mpx = host->cpuid.feat.mpx;
> +
> +    /* Clamp maximum leaves to the ones supported on 4.12. */
> +    policy->cpuid.basic.max_leaf = min(policy->cpuid.basic.max_leaf, 0xdu);
> +    policy->cpuid.feat.max_subleaf = 0;
> +    policy->cpuid.extd.max_leaf = min(policy->cpuid.extd.max_leaf, 0x1cu);
> +
> + out:
> +    xc_cpu_policy_destroy(host);
> +    return rc;
> +}
> 


