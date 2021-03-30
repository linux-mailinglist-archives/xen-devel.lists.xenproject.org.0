Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BB634ED13
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 18:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103630.197662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRGpP-0000dM-BJ; Tue, 30 Mar 2021 16:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103630.197662; Tue, 30 Mar 2021 16:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRGpP-0000cx-8L; Tue, 30 Mar 2021 16:02:51 +0000
Received: by outflank-mailman (input) for mailman id 103630;
 Tue, 30 Mar 2021 16:02:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRGpN-0000co-8N
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 16:02:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f893969-d87f-428a-9b57-08252bfe948c;
 Tue, 30 Mar 2021 16:02:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B9725AE58;
 Tue, 30 Mar 2021 16:02:45 +0000 (UTC)
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
X-Inumbo-ID: 6f893969-d87f-428a-9b57-08252bfe948c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617120165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=biXeeW4QG/QmGWSileBXMFFHvXOGPsruR/cTGFy1Le4=;
	b=t6qP1Ayetncyn4h7av2yhnl4xkyHR0DqoWKhdF8Nc+Wnamv3BIokDsZyg/nzP1S5M1mUrL
	ayrEs5aWT8Tk5YK4eZEzuQ65P/rxN0v0Vf9vd3Vlc4RS28u6H0rsPE7v4c9LykNH1+A6Vl
	0lZZUuwJTYYxeIp86YemlUUHerp4hbI=
Subject: Re: [PATCH 14/21] libs/guest: introduce helper to check cpu policy
 compatibility
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-15-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8f7a2f44-c006-0f94-8f44-b6b3ee3e9d1f@suse.com>
Date: Tue, 30 Mar 2021 18:02:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210323095849.37858-15-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.03.2021 10:58, Roger Pau Monne wrote:
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -1098,3 +1098,20 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
>      return rc;
>  
>  }
> +
> +bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t p1,
> +                                 const xc_cpu_policy_t p2)
> +{
> +    struct cpu_policy_errors err;

Don't you need an initializer here for ...

> +    int rc = x86_cpu_policies_are_compatible(p1, p2, &err);
> +
> +    if ( !rc )
> +        return true;
> +
> +    if ( err.leaf != -1 )
> +        ERROR("Leaf %#x subleaf %#x is not compatible", err.leaf, err.subleaf);
> +    if ( err.msr != -1 )
> +        ERROR("MSR index %#x is not compatible", err.msr);

... these checks to have a chance of actually triggering? (I'm also
not certain -1 is a good indicator, but I guess we have been using it
elsewhere as well.)

Jan

