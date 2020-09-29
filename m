Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFCA27D092
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 16:05:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214.505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNGFp-0000I1-9u; Tue, 29 Sep 2020 14:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214.505; Tue, 29 Sep 2020 14:05:17 +0000
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
	id 1kNGFp-0000Hc-6I; Tue, 29 Sep 2020 14:05:17 +0000
Received: by outflank-mailman (input) for mailman id 214;
 Tue, 29 Sep 2020 14:05:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNGFn-0000HX-9B
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 14:05:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 671a911b-ea5c-4f9f-b3ee-5e68a999e4b3;
 Tue, 29 Sep 2020 14:05:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DADB2AA55;
 Tue, 29 Sep 2020 14:05:12 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNGFn-0000HX-9B
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 14:05:15 +0000
X-Inumbo-ID: 671a911b-ea5c-4f9f-b3ee-5e68a999e4b3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 671a911b-ea5c-4f9f-b3ee-5e68a999e4b3;
	Tue, 29 Sep 2020 14:05:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601388313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FN3reUgr97foK6aeqU3SOeEGCnEtsEecqdqkYpckf7Q=;
	b=ddglmHuuc+hQRC03lMdxBVx1dnzxivTBVg8RuRtmOWgVkOK9LGPvW8Vvzws8GMIYIl8N2D
	FNVBI5JqWpqxNthfFV26mRzxLwtUQaRGHiAgVWCo23l1CcN01nNJb1FG44vh2ldQQzXT08
	+W0G33GA+KE6wIgYiIvBZZij1m3HEOI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DADB2AA55;
	Tue, 29 Sep 2020 14:05:12 +0000 (UTC)
Subject: Re: [PATCH] tools/cpuid: Plumb nested_virt down into
 xc_cpuid_apply_policy()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20200929134852.9235-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <df563d52-2cca-dc02-55ae-12326e38a8be@suse.com>
Date: Tue, 29 Sep 2020 16:05:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200929134852.9235-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.09.2020 15:48, Andrew Cooper wrote:
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -427,7 +427,7 @@ static int xc_cpuid_xend_policy(
>  
>  int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>                            const uint32_t *featureset, unsigned int nr_features,
> -                          bool pae, bool itsc,
> +                          bool pae, bool itsc, bool nested_virt,

This increasing number of bools next to each other bears an
increasing risk of callers getting the order wrong. Luckily
there's just one within the tree, so perhaps not an immediate
problem.

> @@ -559,7 +559,11 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>          p->extd.itsc = itsc;
>  
>          if ( di.hvm )
> +        {
>              p->basic.pae = pae;
> +            p->basic.vmx = nested_virt;
> +            p->extd.svm = nested_virt;
> +        }
>      }
>  
>      if ( !di.hvm )
> @@ -625,14 +629,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>              }
>              break;
>          }
> -
> -        /*
> -         * These settings are necessary to cause earlier HVM_PARAM_NESTEDHVM
> -         * to be reflected correctly in CPUID.  Xen will discard these bits if
> -         * configuration hasn't been set for the domain.
> -         */
> -        p->basic.vmx = true;
> -        p->extd.svm = true;
>      }

While I can see how the first sentence in the comment has become
irrelevant now, what about the second? It's still odd to see both
svm and vmx getting set to identical values. Therefore perhaps
worth to retain a shorter comment there?

Jan

