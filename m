Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A29C2C6A1
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 15:31:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155382.1484880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFvaI-0004qY-PF; Mon, 03 Nov 2025 14:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155382.1484880; Mon, 03 Nov 2025 14:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFvaI-0004oW-Ll; Mon, 03 Nov 2025 14:31:02 +0000
Received: by outflank-mailman (input) for mailman id 1155382;
 Mon, 03 Nov 2025 14:31:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zlLP=5L=bounce.vates.tech=bounce-md_30504962.6908bc9e.v1-f7909f804308400482c3b0eb5c5bfc8f@srs-se1.protection.inumbo.net>)
 id 1vFvaH-0004d2-3H
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 14:31:01 +0000
Received: from mail132-29.atl131.mandrillapp.com
 (mail132-29.atl131.mandrillapp.com [198.2.132.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4f882f8-b8c1-11f0-980a-7dc792cee155;
 Mon, 03 Nov 2025 15:30:56 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-29.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4d0Ysp2t1pz7lmQ8N
 for <xen-devel@lists.xenproject.org>; Mon,  3 Nov 2025 14:30:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f7909f804308400482c3b0eb5c5bfc8f; Mon, 03 Nov 2025 14:30:54 +0000
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
X-Inumbo-ID: b4f882f8-b8c1-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1762180254; x=1762450254;
	bh=L7zIdZfhJrcK0CvzFBqxXipuXKZ6lGMx0oTZecMnioI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=wdXnUlS2qcql4DimBJl3zQShA5bS66quqgqGDmmxHGBISRLTCh7FymjkVGqug91kq
	 jelqYZ9Zq+q9EBpMLzkV2uEjwG2/FCC+v2OpjvWYlta45MEaBjWo0ZmiO9jPULydCA
	 VicHi1IaYIiuv1WNzWf9dPHHo+QmFY8ZAh3j6KFZtDjTTPCsIacbzfAVW6toQNBjVu
	 nAXK3xC+rLEl3rPKsRyS7tEa1PWraQBjNruUSbjJP6nUmGlcCyrwSi1zFKv/gVIx/Y
	 8/AQA2ZTPIRk+K81llA0Lq3AAq8kAFZvqLHzqhm+oli05FwSH85hio2pSaUxUXUefx
	 9l/+bGAGhBW6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1762180254; x=1762440754; i=teddy.astie@vates.tech;
	bh=L7zIdZfhJrcK0CvzFBqxXipuXKZ6lGMx0oTZecMnioI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SrPZeHnrt4xKQf2A8qeRGAA6OZLZ4qvwyjNeBG+jloJDOszrML4ZbkCrO1nDOykLB
	 yzeDyaQy9tCMaG08paWhduom9G8dN6FLuXUL1PAy4QQfDqNg4zkc3jzCAmoLzKpAre
	 Bfa18SPB7rQLJ0GJcv6BNGbaSm8HV3nu5yA3l21Lj+AOapdSLULFCC3XsNeFdWTz3C
	 u7Cf4e6R7eWdXq48YwTXZcs1GD/x+osWsCITXc38DEgevysvZo19/icTLCtvl2MnhQ
	 z5HctcF/GGqfRwjct8y6uR2NFcXZHABFsXItqMH6BCtqiOP/LPrbGnskJ/2XHpzUrg
	 BJFpqCThMei+A==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=20for-4.22=20v2=202/3]=20x86/platform:=20Expose=20DTS=20sensors=20MSR?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1762180253397
Message-Id: <ed81804d-16db-4fce-88b6-12dc165e73a0@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1761752801.git.teddy.astie@vates.tech> <1001287258cf9652c749c66c6565478085a8657c.1761752801.git.teddy.astie@vates.tech> <22e53531-73e4-40e9-a45e-2c5f59852ce4@suse.com>
In-Reply-To: <22e53531-73e4-40e9-a45e-2c5f59852ce4@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f7909f804308400482c3b0eb5c5bfc8f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251103:md
Date: Mon, 03 Nov 2025 14:30:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 30/10/2025 =C3=A0 14:54, Jan Beulich a =C3=A9crit=C2=A0:
> On 29.10.2025 16:59, Teddy Astie wrote:
>> --- a/xen/arch/x86/include/asm/msr-index.h
>> +++ b/xen/arch/x86/include/asm/msr-index.h
>> @@ -115,6 +115,9 @@
>>   #define  MCU_OPT_CTRL_GDS_MIT_DIS           (_AC(1, ULL) <<  4)
>>   #define  MCU_OPT_CTRL_GDS_MIT_LOCK          (_AC(1, ULL) <<  5)
>>   
>> +#define MSR_DTS_TEMPERATURE_TARGET          0x000001a2
>> +#define MSR_DTS_PACKAGE_THERM_STATUS        0x000001b1
> 
> Where are the DTS infixes coming from? The SDM doesn't have such. We try =
to
> stay as close as reasonable to the SDM / PM names, with the exception tha=
t
> typically we omit IA32 infixes.
> 

I got confused with the naming of MSRs (and their lack of IA32 prefix) 
in the upper list of MSR. I guess it should be MSR_PACKAGE_THERM_STATUS 
and MSR_TEMPERATURE_TARGET.

> I'd also like to note that unlike the two THERM_STATUS, MSR_TEMPERATURE_T=
ARGET
> (as per the absence if an IA32 infix in the SDM) isn't an architectural M=
SR,
> and hence I'm not entirely convinced we can "blindly" expose it. (Interes=
tingly
> in Linux code there is an IA32 infix.)
> 

We only perform rdmsr_safe on this MSR, so I don't think there is much 
problem with it as I don't expect Intel to reuse this MSR number for 
something else (at worst, it is going to not be implemented and would 
gracefully fail).

Some parts of this MSR slightly change, but the one (tjmax) that is 
interesting in here is consistent across the architectures.

>> @@ -86,6 +87,11 @@ static bool msr_read_allowed(unsigned int msr)
>>   
>>       case MSR_MCU_OPT_CTRL:
>>           return cpu_has_srbds_ctrl;
>> +
>> +    case MSR_IA32_THERM_STATUS:
>> +    case MSR_DTS_TEMPERATURE_TARGET:
>> +    case MSR_DTS_PACKAGE_THERM_STATUS:
>> +        return raw_cpu_policy.basic.pm.dts;
> 
> This, aiui (and according to related comments I got from Andrew on remote=
ly
> similar changes I was doing) wants to use host_policy. Hence why that oth=
er
> prereq change is needed that I talked about (and that iirc I reproduced o=
n
> the other sub-thread).
> 

yes

> Jan



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



