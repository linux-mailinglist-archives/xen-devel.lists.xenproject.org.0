Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DB5C1F777
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 11:11:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153445.1483775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEPbc-0003Y4-UU; Thu, 30 Oct 2025 10:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153445.1483775; Thu, 30 Oct 2025 10:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEPbc-0003VJ-RC; Thu, 30 Oct 2025 10:10:08 +0000
Received: by outflank-mailman (input) for mailman id 1153445;
 Thu, 30 Oct 2025 10:10:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cjXm=5H=bounce.vates.tech=bounce-md_30504962.69033978.v1-b29dce87efbd455d956221e9d52bfd0c@srs-se1.protection.inumbo.net>)
 id 1vEPbb-0003UE-Mo
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 10:10:07 +0000
Received: from mail187-33.suw11.mandrillapp.com
 (mail187-33.suw11.mandrillapp.com [198.2.187.33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98b03314-b578-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 11:10:01 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-33.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4cy0Gc3yxTzBsThgs
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 10:10:00 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b29dce87efbd455d956221e9d52bfd0c; Thu, 30 Oct 2025 10:10:00 +0000
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
X-Inumbo-ID: 98b03314-b578-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761819000; x=1762089000;
	bh=Op07uysFkdxYKCi5iyDtoSrHdCyqvqDkUa4fwK+hB9M=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=R9jpaDLo+1NiwDl21FZmXauR3RTA7I+60Mjx0fCKhtURExaOvSpZHT9mV+gpI/+oh
	 upLBnxDpHAUXZCX5nD/TGok1Pj7L7leiwQfQveT/hx7ZSQyqttfYpBl/kDRGhYWULc
	 Zk34cxSElkEJGhYVpsp1CtIjJWVdjart4B3xSVEaBin+C/7v3YQSOq69aTCLh24AKy
	 XzhRqy4msG13ybNT9tqOeLaJ1LTvW3q8pi3gI04/cGq6GbPD0mRAZ8qr4WuFBtbxgM
	 /tymCxfBM2C/c4tkKLsMk/wIYB5URa09Y21R0r+/J9iGphkB0L83qvvUwaw32e+gjf
	 GxZjvLYUnqTWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761819000; x=1762079500; i=teddy.astie@vates.tech;
	bh=Op07uysFkdxYKCi5iyDtoSrHdCyqvqDkUa4fwK+hB9M=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=H1RLWZvrNlq9h9hEzR3udI8NRwH8NOXyYKgOKBU/P3Y9TYg2OH3Q22c9ZNj8Vbp0m
	 1KGwPTd1OPsdr2NQYn07gQ+zq2f6r57J3TwyX5VCS5QOdYnCCPS5ZbJ5Gzh9Cq4zGu
	 kieAuJt87S50vyTU+m4vOIaAVeFyxA/ig4MRt7XD6a5+d6yhPog8q/GMwLR19GhO7O
	 Meyzd3hZbCrmy5qYzp8T2noOhQFgzPUhwaSre9AZI0x76EPHY+OhGIixgwQHdd0KAF
	 H6hWKceHYstEv2BIvGbXQPoyJqewhXc7trhGdg3r4rLNID5EaMDpFvBKSVH/REa2zg
	 kIu/vUzE6FqBQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=20for-4.22=20v2=201/3]=20x86/cpu-policy:=20Infrastructure=20for=20CPUID=20leaf=200x6?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761818999480
Message-Id: <9f578a95-12ab-4e4d-a699-d6ad8a882ab8@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1761752801.git.teddy.astie@vates.tech> <3ad34c3e1de444798dcfe0e673375f28f1a654ec.1761752801.git.teddy.astie@vates.tech> <080c2780-2810-4ba8-8f9c-57c1fc4135f9@suse.com>
In-Reply-To: <080c2780-2810-4ba8-8f9c-57c1fc4135f9@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b29dce87efbd455d956221e9d52bfd0c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251030:md
Date: Thu, 30 Oct 2025 10:10:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 30/10/2025 =C3=A0 08:14, Jan Beulich a =C3=A9crit=C2=A0:
> On 29.10.2025 16:59, Teddy Astie wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>> v2: introduced
> 
> This being a change of mine, I'm not happy for the title to have changed,=
 and
> for the (little bit of) description to have been dropped.
> 
>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>> @@ -121,7 +121,32 @@ struct cpu_policy
>>               uint64_t :64, :64; /* Leaf 0x3 - PSN. */
>>               uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
>>               uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
>> -            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
>> +
>> +            /* Leaf 0x6 - Therm/Perf. */
>> +            struct {
>> +                uint32_t /* a */
>> +                    dts:1,
>> +                    turbo:1,
>> +                    arat:1,
>> +                    :4,
>> +                    hwp:1,
>> +                    hwp_notification:1,
>> +                    hwp_activity_window:1,
>> +                    hwp_epp:1,
>> +                    hwp_plr:1,
>> +                    :1,
>> +                    hdc:1,
>> +                    :2,
>> +                    hwp_peci:1,
>> +                    :2,
>> +                    hw_feedback:1,
>> +                    :12;
>> +                uint32_t /* b */:32;
>> +                uint32_t /* c */ aperfmperf:1,
>> +                    :31;
>> +                uint32_t /* d */:32;
>> +            } pm;
>> +
>>               uint64_t :64, :64; /* Leaf 0x7 - Structured Features. */
>>               uint64_t :64, :64; /* Leaf 0x8 - rsvd */
>>               uint64_t :64, :64; /* Leaf 0x9 - DCA */
> 
> As I had said, this (really: the use of these bits in the host policy) ac=
tually
> requires an adjustment to cpu-policy.c as well, which I'm carrying as a s=
eparate,
> prereq change (re-produced below). May I suggest that your work go on top=
 of mine
> (which I'll post once we have branched 4.21 off)?
> 

I'm ok with it.

> Jan
> 
> x86/cpu-policy: move invocation of recalculate_misc()
> 
> The function is about guest exposure of features / leaves. There's no nee=
d
> for it to be applied on the host policy. In fact doing so gets in the way
> of using the host policy in certain places.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -424,7 +424,6 @@ void __init calculate_host_policy(void)
>       x86_cpu_featureset_to_policy(boot_cpu_data.x86_capability, p);
>       recalculate_xstate(p);
>       recalculate_tile(p);
> -    recalculate_misc(p);
>   
>       /* When vPMU is disabled, drop it from the host policy. */
>       if ( vpmu_mode =3D=3D XENPMU_MODE_OFF )
> @@ -705,6 +704,7 @@ static void __init calculate_pv_max_poli
>       unsigned int i;
>   
>       *p =3D host_cpu_policy;
> +    recalculate_misc(p);
>   
>       guest_common_max_leaves(p);
>   
> @@ -809,6 +809,7 @@ static void __init calculate_hvm_max_pol
>       const uint32_t *mask;
>   
>       *p =3D host_cpu_policy;
> +    recalculate_misc(p);
>   
>       guest_common_max_leaves(p);
>   
> 
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



