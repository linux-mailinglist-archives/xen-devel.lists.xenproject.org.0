Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC08BA9D98
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 17:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133006.1471199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3G6o-0001EE-EA; Mon, 29 Sep 2025 15:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133006.1471199; Mon, 29 Sep 2025 15:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3G6o-0001B8-BT; Mon, 29 Sep 2025 15:48:14 +0000
Received: by outflank-mailman (input) for mailman id 1133006;
 Mon, 29 Sep 2025 15:48:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YyJG=4I=bounce.vates.tech=bounce-md_30504962.68daaa38.v1-ea4cab105dc845f49dbe2a8859fbf753@srs-se1.protection.inumbo.net>)
 id 1v3G6m-0001B2-9m
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 15:48:12 +0000
Received: from mail132-16.atl131.mandrillapp.com
 (mail132-16.atl131.mandrillapp.com [198.2.132.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2ed8934-9d4b-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 17:48:10 +0200 (CEST)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-16.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4cb5F46XphzB5pLqG
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 15:48:08 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ea4cab105dc845f49dbe2a8859fbf753; Mon, 29 Sep 2025 15:48:08 +0000
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
X-Inumbo-ID: b2ed8934-9d4b-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1759160888; x=1759430888;
	bh=SPPx8ujwQQeJvrG+ILFgUkEMojt7Pt3i1zlrR2kyPVw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=W+aVuTCYG47ym6rWSiAOhJFcK6g1i+IGCYYDpbKgJOtKcLMPpBpxCZyvdN6lWyZXq
	 3ruabjE7IhA7qqnpg9TeQITNHWyQecIdsZPCXSSxyu3sw3V211afcGA2Tny4gdU7EM
	 M1UUSwk98LBowe19a3i4QsJPJiYC5Ky1Xp3FfHjTLEkXAkeDYIkQFHFluW/lWlO4oT
	 jw9N9E/YszYfZ/70JGrOeWIKExnFxLVGEY12EF7Ssn2pruHrTOfJKibFzzqTzdCRHv
	 AZxMpKmEA06EoADp6Gy5PEWeOy6+1zq2eYYrfv3k8RHPDWAqgcGRTlQaZPoMktiJpI
	 Cz9g/emUI9W9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1759160888; x=1759421388; i=teddy.astie@vates.tech;
	bh=SPPx8ujwQQeJvrG+ILFgUkEMojt7Pt3i1zlrR2kyPVw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=th0Wg5lpL5js5ByV3WTpk3adJ1csHVclyoYjQTB7PLIlQmRZOIT2JseNtAUATmmM/
	 NGCs2u3Qr4Nqv+rO0xUbamj0HQeQaZGOHZW3s8vyo/p4ALmuTc+bAPTYWjo5vk9nWB
	 aiNWT2e+iCVvbjJHOcwpluJcuifMKpcphmwAc1eSU4lfDVcAQuD5m17RnBRQrZfS42
	 ReBQywR6EgqgueiDWCAlmi7lQyOtLaCmFswYfkrdEb6p7A3c8cSsDEqV9V5u9C7YWB
	 d5ef/ACq25m33B707zS9zOCstAFQPmEH2jYzhcFvGOmzrTJk4b2UOl/PMN4j13RlaX
	 vCsSWaLhY8cUA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/hap:=20Inline=20"flush=5Fvcpu"=20in=20"flush=5Ftlb"?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1759160887783
Message-Id: <786ad391-c6ce-465d-b7fc-3d3a3e5fec18@vates.tech>
To: "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <bb570008f237cb77f2c74c5f025375ca6c4f140a.1759148418.git.teddy.astie@vates.tech> <aNqSfAW448rOMCW-@Mac.lan>
In-Reply-To: <aNqSfAW448rOMCW-@Mac.lan>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ea4cab105dc845f49dbe2a8859fbf753?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250929:md
Date: Mon, 29 Sep 2025 15:48:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 29/09/2025 =C3=A0 16:09, Roger Pau Monn=C3=A9 a =C3=A9crit=C2=A0:
> On Mon, Sep 29, 2025 at 12:36:30PM +0000, Teddy Astie wrote:
>> flush_vcpu static function here is only used in one place which is just =
below
>> where it is defined. Inline the function to reduce the noise and clarify
>> what we are doing.
> 
> Did you check that the compiler doesn't inline it already?
> 
> It seems like an obvious optimization for the compiler to do.
> 

I assume that the compiler already does it, it's mostly meant to be a 
cosmetic change.

>> No functional change.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>>   xen/arch/x86/mm/hap/hap.c | 7 +------
>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
>> index 2f69ff9c7b..407c80afab 100644
>> --- a/xen/arch/x86/mm/hap/hap.c
>> +++ b/xen/arch/x86/mm/hap/hap.c
>> @@ -721,11 +721,6 @@ static pagetable_t cf_check hap_update_cr3(struct v=
cpu *v, bool noflush)
>>       return pagetable_null();
>>   }
>>   
>> -static bool flush_vcpu(const struct vcpu *v, const unsigned long *vcpu_=
bitmap)
>> -{
>> -    return !vcpu_bitmap || test_bit(v->vcpu_id, vcpu_bitmap);
> 
> The same construct is used in shadow code also, maybe it would be
> helpful to place the flush_vcpu() helper in a common header as static
> inline?
> 

maybe, but given the simplicity of the function, it does feel a bit 
excessive it for hap code.

> OTOH we don't care much for shadow, so it might be simpler to leave
> shadow as-is and do the change just for HAP, but would be good to
> mention in the commit message why shadow is not adjusted in the same
> way.

Something like

"We only do this for hap where this function is only used once."

?

> 
> Thanks, Roger.
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



