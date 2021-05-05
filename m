Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F24D3734F5
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 08:28:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122796.231617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leB0F-0002xN-E5; Wed, 05 May 2021 06:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122796.231617; Wed, 05 May 2021 06:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leB0F-0002u9-B0; Wed, 05 May 2021 06:27:23 +0000
Received: by outflank-mailman (input) for mailman id 122796;
 Wed, 05 May 2021 06:27:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6083=KA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leB0E-0002u0-3T
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 06:27:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e39df27-9194-47bf-b90d-cfb38bc068f3;
 Wed, 05 May 2021 06:27:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16286AE04;
 Wed,  5 May 2021 06:27:19 +0000 (UTC)
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
X-Inumbo-ID: 5e39df27-9194-47bf-b90d-cfb38bc068f3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620196039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PvU/67kargRclV1BzSMI07cnKNaj4Cl2Fntp3vzI4w4=;
	b=guv7oRC9XIU1Q++iBeh4QtSOYAuzDc7UrAD6k7EygnNNFLVDDWLVZyiXRI0cVZxGHlSs2i
	StqYWa5JB8x5h4nrGrtJI+YUNM+TZC1xFO9zAevA2uiyqnSsiyjAv5MVMa2dM4muAVgpeE
	nQzRPKBdcx/XapfSz2qs0G+X3qcm0pY=
Subject: Re: [PATCH] libs/guest: Don't hide the indirection on xc_cpu_policy_t
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210504185322.19306-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4920e6e0-6cd2-fc20-d426-5b12934a2565@suse.com>
Date: Wed, 5 May 2021 08:27:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210504185322.19306-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.05.2021 20:53, Andrew Cooper wrote:
> Unsure what to do about x86_cpu_policies_are_compatible().  It would be nice
> to have xc_cpu_policy_is_compatible() sensibly const'd, but maybe that means
> we need a struct const_cpu_policy and that smells like it is spiralling out of
> control.

Not sure it would be that bad. In fact, looking at the few uses of struct
cpu_policy in the hypervisor, I wonder if the two contained pointers
couldn't be pointer-to-const right there. Once you've constructed a full
struct cpu_policy instance, it shouldn't typically be modified anymore,
should it? Would require the respective struct arch_domain fields to also
become pointer-to-const. And if the tool stack had any need for a
container with pointer-to-non-const, it could locally define a type,
keeping lib/x86/ tidy.

Jan

