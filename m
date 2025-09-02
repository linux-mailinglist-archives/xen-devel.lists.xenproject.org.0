Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D965B402DC
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 15:25:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106471.1457140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utR0E-0006i6-B1; Tue, 02 Sep 2025 13:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106471.1457140; Tue, 02 Sep 2025 13:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utR0E-0006gB-8C; Tue, 02 Sep 2025 13:24:50 +0000
Received: by outflank-mailman (input) for mailman id 1106471;
 Tue, 02 Sep 2025 13:24:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kxFV=3N=bounce.vates.tech=bounce-md_30504962.68b6f01b.v1-e0f5105993db47728ede90ddeee5c5f4@srs-se1.protection.inumbo.net>)
 id 1utR0C-0006g5-QM
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 13:24:48 +0000
Received: from mail187-26.suw11.mandrillapp.com
 (mail187-26.suw11.mandrillapp.com [198.2.187.26])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3054f18c-8800-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 15:24:44 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-26.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4cGRL32qfzzKsbb7P
 for <xen-devel@lists.xenproject.org>; Tue,  2 Sep 2025 13:24:43 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e0f5105993db47728ede90ddeee5c5f4; Tue, 02 Sep 2025 13:24:43 +0000
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
X-Inumbo-ID: 3054f18c-8800-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756819483; x=1757089483;
	bh=vJ/ShCaCXOV2bm+IUK0oG8GhcrkHPN6D2lP+VDOly90=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=PYdqb8FBrbW+5CF0q3dOviPb9fAm7Odfx13FaZ9r9bRxeBhsf7Yxt6O196zbqVxk6
	 feNlpVQxH/teIl/o7QqTA4F0x584M6a+5vBFMr+A5Op50e4utMmhORT8AtIsDPI4T6
	 Ztpg7U2GZ7wvParAY+Abv0KsaF8sDFnRXU6kPGBj4yYxM5nPTwquYl1kNfP5LV2Txa
	 ShwgTNBtyQimrU62lWT97Y5ZYAimeGk5OssNRLwDI3XYj0M1imWZJS0oBnGD0gqjKT
	 HmSBRdCU6I/R9jx6gLVOiU+rUi+oQwXaGc4NhZZYMUy4u7V6ZZlldNLPLKboTsk2cC
	 C7WEn0YSiY2oQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756819483; x=1757079983; i=teddy.astie@vates.tech;
	bh=vJ/ShCaCXOV2bm+IUK0oG8GhcrkHPN6D2lP+VDOly90=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=bLQl+39lpOxl06ZKOTJRO9Gu+vzqQMEmRrpHaf6I+lfX2Y1LU0f1IB2fBtFh41jKm
	 tHCQnJz5WPvNwtqdBeFvDDhkD3JpOqNA4+wJkXkr/0v94OPOmUt5ULArZXiamNvoZL
	 OIRANyB+gpjRu4KG2AtQ9wZIYpf+/rCW3NDZjdkkmcxf4rvoJtw8yc+gT75E1Ziw+R
	 6pVTY7VF1BFXPzNLQDqF394YtSPSWLgtdjBe5a8ULVEVTUm19At/Q1k9BwOEqzDGLa
	 HLYj7Z9MNvKbaSKOLH8pOIa1Z/WxrIkHgxvEsikQpW/IlwAubP+o49Tn0XziJS7k42
	 Zsdz50oMQ9A5g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RESEND=20PATCH=20v2=202/3]=20hvmloader:=20Update=20to=20SMBIOS=202.6?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756819482291
Message-Id: <fdb2b2d2-a9d8-42ad-b9fc-e99905f5dbba@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1756460430.git.teddy.astie@vates.tech> <57c674cc364d3b8f4c6d03533b9e2b45728d2c19.1756460430.git.teddy.astie@vates.tech> <d422e3d6-48c5-478a-bf76-6aa39492d767@suse.com>
In-Reply-To: <d422e3d6-48c5-478a-bf76-6aa39492d767@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e0f5105993db47728ede90ddeee5c5f4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250902:md
Date: Tue, 02 Sep 2025 13:24:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 02/09/2025 =C3=A0 14:38, Jan Beulich a =C3=A9crit=C2=A0:
> On 29.08.2025 11:58, Teddy Astie wrote:
>> @@ -505,7 +505,22 @@ smbios_type_1_init(void *start, const char *xen_ver=
sion,
>>       p->version_str =3D 3;
>>       p->serial_number_str =3D 4;
>>   
>> -    memcpy(p->uuid, uuid, 16);
>> +    /*
>> +     * Xen toolstack uses big endian UUIDs, however GUIDs (which requir=
ement
>> +     * is clarified by SMBIOS >=3D 2.6) has the first 3 components appe=
aring as
>> +     * being little endian and the rest as still being big endian.
>> +     */
> 
> The SMBIOS spec I'm looking at (2.7.1) doesn't mention the term GUID at a=
ll
> (except of course when discussing the EFI System Table entry). It's all U=
UID
> there. Here and in the description I think this needs expressing better, =
to
> not raise extra questions.
> 

Yes (this is also true for SMBIOS 3.9.0 spec). Not sure how to express 
that aside saying that UUID encoding differs between SMBIOS 
specification and Xen representation.

> As to endian-ness: Since everything from byte 8 onwards are merely bytes,=
 I
> don't think it makes much sense to talk of endian-ness for that latter ha=
lf.
> 

It's more to insist that the byte ordering differs with the first parts.

>> @@ -716,7 +731,7 @@ smbios_type_4_init(
>>   
>>       p->socket_designation_str =3D 1;
>>       p->processor_type =3D 0x03; /* CPU */
>> -    p->processor_family =3D 0x01; /* other */
>> +    p->processor_family =3D p->processor_family_2 =3D 0x01; /* other */
> 
> In the hypervisor we need to avoid such double assignments for Misra's
> sake. I think we're better off avoiding them in hvmloader as well.
> 

yes

>> @@ -736,6 +751,22 @@ smbios_type_4_init(
>>       p->l2_cache_handle =3D 0xffff; /* No cache information structure p=
rovided. */
>>       p->l3_cache_handle =3D 0xffff; /* No cache information structure p=
rovided. */
>>   
>> +    /*
>> +     * We have a smbios type 4 table per vCPU (which is per socket),
>> +     * which means here that we have 1 socket per vCPU.
>> +     */
>> +    p->core_count =3D p->core_enabled =3D p->thread_count =3D 1;
> 
> Might we be better off keeping them all at 0 (unknown)?
> 

Making it Unknown would feel a bit weird, unless we only keep only one 
(instead of the number of vCPUs) of these table with core_count, 
core_enabled, thread_count as 0 (unknown) ?

>> +    /*
>> +     * We set 64-bits, execute protection and enhanced virtualization.
>> +     * We don't set Multi-Core (bit 3) because this individual processo=
r
>> +     * (as being a single vCPU) is only having one core.
>> +     *
>> +     * SMBIOS specification says that these bits don't state anything
>> +     * regarding the actual availability of such features.
>> +     */
>> +    p->processor_characteristics =3D 0x64;
> 
> Unless nested virt is enabled for the guest, I think we'd better avoid
> setting the Enhanced Virtualization bit.
> 

I am not sure how to interpret the SMBIOS spec on this

 > Enhanced Virtualization indicates that the processor can execute
 > enhanced virtualization instructions. This bit does not indicate the
 > present state of this feature

I see it as: Virtualization is available or can be enabled (with nested 
virtualization).
Or as : We have virtualization related instructions.

>> @@ -870,8 +901,8 @@ smbios_type_17_init(void *start, uint32_t memory_siz=
e_mb, int instance)
>>       char buf[16];
>>       struct smbios_type_17 *p =3D start;
>>   
>> -    /* Specification says Type 17 table has length of 1Bh for v2.3-2.6.=
 */
>> -    BUILD_BUG_ON(sizeof(*p) !=3D 27);
>> +    /* Specification says Type 17 table has length of 1Ch for v2.6. */
>> +    BUILD_BUG_ON(sizeof(*p) !=3D 28);
>>   
>>       memset(p, 0, sizeof(*p));
> 
> With this, ...
> 
>> @@ -890,6 +921,7 @@ smbios_type_17_init(void *start, uint32_t memory_siz=
e_mb, int instance)
>>       p->bank_locator_str =3D 0;
>>       p->memory_type =3D 0x07; /* RAM */
>>       p->type_detail =3D 0;
>> +    p->attributes =3D 0;
> 
> ... I don't think we really need this. In fact I was considering to make
> a patch to strip all the unnecessary assignments of zero.
> 
>> --- a/tools/firmware/hvmloader/smbios_types.h
>> +++ b/tools/firmware/hvmloader/smbios_types.h
>> @@ -147,6 +147,11 @@ struct smbios_type_4 {
>>       uint8_t serial_number_str;
>>       uint8_t asset_tag_str;
>>       uint8_t part_number_str;
>> +    uint8_t core_count;
>> +    uint8_t core_enabled;
>> +    uint8_t thread_count;
>> +    uint16_t processor_characteristics;
>> +    uint16_t processor_family_2;
>>   } __attribute__ ((packed));
>>   
>>   /* SMBIOS type 7 - Cache Information */
>> @@ -185,6 +190,9 @@ struct smbios_type_9 {
>>       uint16_t slot_id;
>>       uint8_t slot_characteristics_1;
>>       uint8_t slot_characteristics_2;
>> +    uint16_t sgn_base;
>> +    uint8_t bus_number_base;
>> +    uint8_t devfn_base;
> 
> Where do the _base suffixes come from? Nothing like that is said in the
> spec I'm looking at. Also "sgn" is imo too much of an abbreviation.
> 

My version of the specification (3.9.0) says

0Dh 2.6+ Segment Group Number (Base)
0Fh 2.6+ Bus Number (Base)
10h 2.6+ Device/Function Number (Base)

Regarding sgn, maybe we can use `segment` instead ?

> Jan
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



