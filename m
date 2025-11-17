Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1793C64422
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 14:05:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163856.1490914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyuu-0008JA-GQ; Mon, 17 Nov 2025 13:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163856.1490914; Mon, 17 Nov 2025 13:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyuu-0008EY-Da; Mon, 17 Nov 2025 13:05:12 +0000
Received: by outflank-mailman (input) for mailman id 1163856;
 Mon, 17 Nov 2025 13:05:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LywI=5Z=bounce.vates.tech=bounce-md_30504962.691b1d80.v1-fe1920fd87564f4d805d8d706c3efd04@srs-se1.protection.inumbo.net>)
 id 1vKyut-0007cl-1u
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 13:05:11 +0000
Received: from mail180-15.suw31.mandrillapp.com
 (mail180-15.suw31.mandrillapp.com [198.2.180.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 090ab518-c3b6-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 14:05:05 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-15.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4d97JJ45bmzPm0b8x
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 13:05:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fe1920fd87564f4d805d8d706c3efd04; Mon, 17 Nov 2025 13:05:04 +0000
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
X-Inumbo-ID: 090ab518-c3b6-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763384704; x=1763654704;
	bh=swdLxmX4Vd3OZetAZ/ZvbpL7Ft6gCy+I4Zt3colhL20=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=NEx2q/sHLrN5yHPi++apLnkHDxBu8nBHmT2gIqRwvxQqnOc6jdq+NjVnC19hIVu0a
	 ZGWMmDEXkze/U4wpUHoFRxZlxcCbJHQ/z/gtzlYJMbdlOYN5+2Hqc+5ZTV4gnqxj7Y
	 VbXxJdiNW7+2oAorCR4DaKnbXWulH2AO9JVHhWsYJg/9uU4ZkHynoxsVANu3AcTpSz
	 dW2VoezjGBkhMk6MOJAdwwOf3I+GfmTmKBS/GXQJmkkqrMHCcLINCYdQA9OUO7aDzV
	 9VSJ81MdicDaZcUddczfByqVemC+NqA0qub3cJQIqlY4hmDHXy7aRM8xoQHA/LRKf9
	 hCVknSPkPHWaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763384704; x=1763645204; i=teddy.astie@vates.tech;
	bh=swdLxmX4Vd3OZetAZ/ZvbpL7Ft6gCy+I4Zt3colhL20=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Nw7wnlK589Ml9yndVArovaPWZNP1kI2rcQqYpTp+j2wiB93QfnP1o8/QbH+JliqtY
	 CHH07pdg5UshrRuWoqUzCliWUKH0R5xmTVGsAiMx1P7EHqrsD65ctHobserHjfXVg3
	 dciwva7vodpA0G0kkTJYnQNVd7ejr4pMyL6Qsf+fxjK0w8e2v71Wb3bF5+2Zq92ao3
	 oGLI04PJ5YTIHjpofjn4WAVvHhRE739MCkuph6OLS1Js2zEjk2q1W0JAQDF+aOGy2+
	 VwurfncxQabZoT/O36sciIXo4fkQxt9bbXwtd8fLeloj9yX6P4QT/xHLPfgwV554y3
	 w1nc+Pu1wMVjw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=201/2]=20amd/iommu:=20Always=20atomically=20update=20DTE?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763384700997
Message-Id: <dcd39051-b2bf-409c-907f-3357ae06cc25@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1762961527.git.teddy.astie@vates.tech> <a14812d39743f5f49614d099bdac6720bf7c4fae.1762961527.git.teddy.astie@vates.tech> <b3ed438d-2b73-4b07-99e5-01e66a833f4d@suse.com>
In-Reply-To: <b3ed438d-2b73-4b07-99e5-01e66a833f4d@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fe1920fd87564f4d805d8d706c3efd04?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251117:md
Date: Mon, 17 Nov 2025 13:05:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 13/11/2025 =C3=A0 12:38, Jan Beulich a =C3=A9crit=C2=A0:
> On 12.11.2025 16:37, Teddy Astie wrote:
>> amd_iommu_set_root_page_table chooses between updating atomically
>> and non-atomically depending on whether the DTE is active or not.
>>
>> This choice existed mostly because cx16 wasn't supposed always available
>> until [1]. Thus we don't need to threat the non-atomic path in a special
>> way anymore.
>>
>> By rearranging slightly the atomic path, we can make it cover all the ca=
ses
>> which improves the code generation at the expense of systematically perf=
orming
>> cmpxchg16b.
>>
>> Also remove unused raw64 fields of ldte, and the deprecated comment as t=
he
>> function actually behaves in a more usual way and can't return >0.
>>
>> [1] 2636fcdc15c7 "x86/iommu: check for CMPXCHG16B when enabling IOMMU"
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>>   xen/drivers/passthrough/amd/iommu_map.c | 78 ++++++++-----------------
>>   1 file changed, 25 insertions(+), 53 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passt=
hrough/amd/iommu_map.c
>> index 320a2dc64c..e3165d93aa 100644
>> --- a/xen/drivers/passthrough/amd/iommu_map.c
>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
>> @@ -154,69 +154,41 @@ static void set_iommu_ptes_present(unsigned long p=
t_mfn,
>>       unmap_domain_page(table);
>>   }
>>   
>> -/*
>> - * This function returns
>> - * - -errno for errors,
>> - * - 0 for a successful update, atomic when necessary
>> - * - 1 for a successful but non-atomic update, which may need to be war=
ned
>> - *   about by the caller.
>> - */
>>   int amd_iommu_set_root_page_table(struct amd_iommu_dte *dte,
>>                                     uint64_t root_ptr, uint16_t domain_i=
d,
>>                                     uint8_t paging_mode, unsigned int fl=
ags)
>>   {
>>       bool valid =3D flags & SET_ROOT_VALID;
>>   
>> -    if ( dte->v && dte->tv )
>> -    {
>> -        union {
>> -            struct amd_iommu_dte dte;
>> -            uint64_t raw64[4];
>> -            __uint128_t raw128[2];
>> -        } ldte =3D { .dte =3D *dte };
>> -        __uint128_t res, old =3D ldte.raw128[0];
>> -        int ret =3D 0;
>> -
>> -        ldte.dte.domain_id =3D domain_id;
>> -        ldte.dte.pt_root =3D paddr_to_pfn(root_ptr);
>> -        ldte.dte.iw =3D true;
>> -        ldte.dte.ir =3D true;
>> -        ldte.dte.paging_mode =3D paging_mode;
>> -        ldte.dte.v =3D valid;
>> -
>> -        res =3D cmpxchg16b(dte, &old, &ldte.raw128[0]);
>> -
>> -        /*
>> -         * Hardware does not update the DTE behind our backs, so the
>> -         * return value should match "old".
>> -         */
>> -        if ( res !=3D old )
>> -        {
>> -            printk(XENLOG_ERR
>> -                   "Dom%d: unexpected DTE %016lx_%016lx (expected %016l=
x_%016lx)\n",
>> -                   domain_id,
>> -                   (uint64_t)(res >> 64), (uint64_t)res,
>> -                   (uint64_t)(old >> 64), (uint64_t)old);
>> -            ret =3D -EILSEQ;
>> -        }
>> +    union {
>> +        struct amd_iommu_dte dte;
>> +        __uint128_t raw128[2];
>> +    } ldte =3D { .dte =3D *dte };
>> +    __uint128_t res, old =3D ldte.raw128[0];
>>   
>> -        return ret;
>> -    }
>> +    ldte.dte.domain_id =3D domain_id;
>> +    ldte.dte.pt_root =3D paddr_to_pfn(root_ptr);
>> +    ldte.dte.iw =3D true;
>> +    ldte.dte.ir =3D true;
>> +    ldte.dte.paging_mode =3D paging_mode;
>> +    ldte.dte.tv =3D true;
>> +    ldte.dte.v =3D valid;
>> +
>> +    res =3D cmpxchg16b(dte, &old, &ldte.raw128[0]);
>>   
>> -    if ( valid || dte->v )
>> +    /*
>> +     * Hardware does not update the DTE behind our backs, so the
>> +     * return value should match "old".
>> +     */
>> +    if ( res !=3D old )
>>       {
>> -        dte->tv =3D false;
>> -        dte->v =3D true;
>> -        smp_wmb();
>> +        printk(XENLOG_ERR
>> +                "Dom%d: unexpected DTE %016lx_%016lx (expected %016lx_%=
016lx)\n",
>> +                domain_id,
>> +                (uint64_t)(res >> 64), (uint64_t)res,
>> +                (uint64_t)(old >> 64), (uint64_t)old);
> 
> Indentation is now off by 1 here.
> 
>> +        return -EILSEQ;
> 
> The downside of this is that all updates can now take this path. Yes, thi=
s shouldn't
> be possible to be taken, but it's a (minor) concern nevertheless. At the =
very least
> such a downside wants, imo, mentioning in the description, even if for no=
thing else
> than to make clear that it was a deliberate choice.
> 

Apparently it doesn't build (debian-bookworm-gcc-arm32-randconfig 
catched it).
ARM does provide MAX_VIRT_CPUS and GUEST_MAX_VCPUS which is 128 or 
lower, but that doesn't map (or not properly) with what we have in x86 
(MAX_VIRT_CPUS=3D8192 is PV-specific, and GUEST_MAX_VCPUS doesn't exist).

I am not sure what to do, looks like many things are redundant here.

> Jan
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



