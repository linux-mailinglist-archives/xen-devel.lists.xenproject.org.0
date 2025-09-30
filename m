Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F20BACF61
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 15:03:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134297.1472247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3a0k-0004ZO-AZ; Tue, 30 Sep 2025 13:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134297.1472247; Tue, 30 Sep 2025 13:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3a0k-0004XR-7R; Tue, 30 Sep 2025 13:03:18 +0000
Received: by outflank-mailman (input) for mailman id 1134297;
 Tue, 30 Sep 2025 13:03:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jGVa=4J=bounce.vates.tech=bounce-md_30504962.68dbd511.v1-a5137b709c9c4a2688812d9ae99bb066@srs-se1.protection.inumbo.net>)
 id 1v3a0i-0004XL-M5
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 13:03:16 +0000
Received: from mail177-10.suw61.mandrillapp.com
 (mail177-10.suw61.mandrillapp.com [198.2.177.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d312ca74-9dfd-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 15:03:15 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-10.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4cbdXK3qgsz5Qnvdr
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 13:03:13 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a5137b709c9c4a2688812d9ae99bb066; Tue, 30 Sep 2025 13:03:13 +0000
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
X-Inumbo-ID: d312ca74-9dfd-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1759237393; x=1759507393;
	bh=nVkUW10tz1ndJ3cdjbzVv4cAu+37K8/HQfBTRvus01M=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hKoKaSFZUVjOc/UJ6Sgi8vSn2m64q86YsOceznV5j/sl2ppIOP2SfMKk/Chsy2JRB
	 MaU4uoaMaZsO8wrS8K7wt5C4652e5r4BrluWxUxBFC6u6cTn0HxY4+riX6JGSS1Ny0
	 PAHvs1/xWLIUvX0FW1vSf0RtPHDgcB9PmRWGgp4iAIfajG/FpUO5RzM2c3M/dSjMO3
	 keuYKQnk+XIM1Uhnq2qP1+VSbjT//cz82a3kW8OmVz0nLcH9U5Y4VRDjUMhgUOT2qP
	 QFAGKk01NGuO9DLyEIFAyhlbDPZtB+BZ6EO9JSimhE22eKloxLar7qzGTLVhWZmjkI
	 rVCGTCgOPPDdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1759237393; x=1759497893; i=teddy.astie@vates.tech;
	bh=nVkUW10tz1ndJ3cdjbzVv4cAu+37K8/HQfBTRvus01M=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SZ1S/S57VNtVZU63KjN8yLaoXVlnM5Ge3f3L8QQHNtan3By6T58StBdhNcvcuPAOf
	 c8AW5VzC1Lnj0EU0x4uod+kyFQFG4TfS/KvFwIiNvCrhP0BU0JQDwc2xp2toTP7OrQ
	 K6D20cvCb66+Dxcf1yGTZ7LddN6hfSTpKpDELHOoOa8Uv2LuumRaoia7KZ2z/cLAoy
	 2QRyObhs6MA/4ZEYWyFSA5XzFkgBKISYntGlNrC0QZnE0YYL9ZOibWMTOnypauxNda
	 SHZxgmQ32k94zQwhfDeDtxyOMctZGd0+PyuvrTkaE/DkFwKB4PePVHgS+GlxweuUid
	 szTeRKYvH35qg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20for-4.21=201/2]=20x86/AMD:=20avoid=20REP=20MOVSB=20for=20Zen3/4?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1759237392193
Message-Id: <6f211ab0-b671-4ea6-88e9-f5cf7fe27a63@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com> <6bcaa5b7-4e34-40c9-85e6-48a0a5869b86@suse.com> <485889ed-2820-4bb3-b450-88553dbb719e@vates.tech> <446909d8-f446-42f0-a236-47d5d64ea908@suse.com>
In-Reply-To: <446909d8-f446-42f0-a236-47d5d64ea908@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a5137b709c9c4a2688812d9ae99bb066?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250930:md
Date: Tue, 30 Sep 2025 13:03:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 25/09/2025 =C3=A0 15:02, Jan Beulich a =C3=A9crit=C2=A0:
> On 25.09.2025 14:18, Teddy Astie wrote:
>> Le 25/09/2025 =C3=A0 12:48, Jan Beulich a =C3=A9crit=C2=A0:
>>> Along with Zen2 (which doesn't expose ERMS), both families reportedly
>>> suffer from sub-optimal aliasing detection when deciding whether REP MO=
VSB
>>> can actually be carried out the accelerated way. Therefore we want to
>>> avoid its use in the common case (memset(), copy_page_hot()).
>>
>> s/memset/memcpy (memset probably uses rep stosb which is not affected II=
UC)
> 
> Oops, yes.
> 
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Question is whether merely avoiding REP MOVSB (but not REP MOVSQ) is go=
ing
>>> to be good enough.
>>
>> This probably wants to be checked with benchmarks of rep movsb vs rep
>> movsq+b (current non-ERMS algorithm). If the issue also occurs with rep
>> movsq, it may be preferable to keep rep movsb even considering this issu=
e.
> 
> Why? Then REP MOVSB is 8 times slower than REP MOVSQ.
> 

It doesn't match my observations while quickly benching rep movsb vs rep 
movsq+b (fallback) with varying alignments/sizes on Zen3/4 (Ryzen and EPYC)=
.

It's very sensitive to size and aligment, but in many (but not all) 
cases, rep movsb is significantly faster than rep movsq+b. The worst 
cases (mentioned bug) are much slower in both cases, though rep movsq+b 
tend to perform better in these cases.

So unfortunately it's not as simple as rep movsb being (almost) always 
slower, especially with the varied copy sizes and aligments that does 
grant_copy. That's what I would prefer having more data to have a better 
picture.

>>> --- a/xen/arch/x86/cpu/amd.c
>>> +++ b/xen/arch/x86/cpu/amd.c
>>> @@ -1386,6 +1386,10 @@ static void cf_check init_amd(struct cpu
>>>    
>>>    =09check_syscfg_dram_mod_en();
>>>    
>>> +=09if (c =3D=3D &boot_cpu_data && cpu_has(c, X86_FEATURE_ERMS)
>>> +=09    && c->family !=3D 0x19 /* Zen3/4 */)
>>> +=09=09setup_force_cpu_cap(X86_FEATURE_XEN_REP_MOVSB);
>>> +
>>
>> May it be fixed through a (future ?) microcode update, especially since
>> rep movs is microcoded on these archs ?
> 
> I don't know, but I also don't expect that to happen.
> 
> Jan
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



