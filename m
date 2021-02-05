Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D43310C62
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 15:02:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81737.151150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l81gr-0006UA-2c; Fri, 05 Feb 2021 14:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81737.151150; Fri, 05 Feb 2021 14:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l81gq-0006Tl-Vg; Fri, 05 Feb 2021 14:02:28 +0000
Received: by outflank-mailman (input) for mailman id 81737;
 Fri, 05 Feb 2021 14:02:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IalI=HH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l81gp-0006Tb-8S
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 14:02:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fdb8e56-6a1f-4a22-8888-130bf227abe3;
 Fri, 05 Feb 2021 14:02:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 91B35ACAC;
 Fri,  5 Feb 2021 14:02:25 +0000 (UTC)
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
X-Inumbo-ID: 4fdb8e56-6a1f-4a22-8888-130bf227abe3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612533745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cOerHE3BM3EUcL+/lKl+NMf0+GAK72MtEO1QWCoUE/Q=;
	b=sDlmpV5zw5K4pxOE2DyuPoh9cwpPlWEHxOM54D4wrqDTlr/V+whLIOpSddHQgCJQTANrbj
	fqJQ7qjXZcYz3G+eKwrCj9TiGJkY03M2+cKMJZDT/F1PCMljdsW3CScnktG/afRly8GIud
	jDaGeMcVpoP7nQ4847JJumUQ7BAQWh8=
Subject: Re: [PATCH] x86/HVM: support emulated UMIP
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Tamas K Lengyel
 <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5a8b1c37-5f53-746f-ba87-778d4d980d99@suse.com>
 <c717bd30-27b2-625d-576e-eb41a7192c55@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <78ed8806-20e3-cb67-829f-916504e5654a@suse.com>
Date: Fri, 5 Feb 2021 15:02:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c717bd30-27b2-625d-576e-eb41a7192c55@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.02.2021 15:10, Andrew Cooper wrote:
> On 29/01/2021 11:45, Jan Beulich wrote:
>> +        {
>> +            u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
>> +
>> +            if ( v->arch.hvm.guest_cr[4] & X86_CR4_UMIP )
>> +            {
>> +                value &= ~X86_CR4_UMIP;
>> +                ASSERT(vmcb_get_cr_intercepts(vmcb) & CR_INTERCEPT_CR0_READ);
> 
> It occurs to me that adding CR0 read exiting adds a lot of complexity
> for very little gain.

Actually, upon second look - why do you say "adding CR0 read
exiting"? This is only an assertion. No other changes are
being made to CR0 interception (apart from the few lines in
the handling of the respective #VMEXIT).

Jan

