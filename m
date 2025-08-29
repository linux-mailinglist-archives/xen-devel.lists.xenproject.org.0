Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F66DB3BC88
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 15:33:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101363.1454466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urzDZ-0004X6-0x; Fri, 29 Aug 2025 13:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101363.1454466; Fri, 29 Aug 2025 13:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urzDY-0004V4-Tr; Fri, 29 Aug 2025 13:32:36 +0000
Received: by outflank-mailman (input) for mailman id 1101363;
 Fri, 29 Aug 2025 13:32:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMIe=3J=bounce.vates.tech=bounce-md_30504962.68b1abf0.v1-c39b5c5a275942f380a4bee75d12fac0@srs-se1.protection.inumbo.net>)
 id 1urzDX-0004Uy-FG
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 13:32:35 +0000
Received: from mail180-6.suw31.mandrillapp.com
 (mail180-6.suw31.mandrillapp.com [198.2.180.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e4e2930-84dc-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 15:32:33 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-6.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4cCzhw3pddz2K27J2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 13:32:32 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c39b5c5a275942f380a4bee75d12fac0; Fri, 29 Aug 2025 13:32:32 +0000
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
X-Inumbo-ID: 9e4e2930-84dc-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756474352; x=1756744352;
	bh=Q/yK30vJKpV/cQx0dBpfD4/srbUBHW3bVd1vwHsbo8o=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=LGgAnaQ71eYNrvErty4mctgC6befGWi3xvcpd1rsfWlPLlyLggikoeqPzrNf8Gc3z
	 I8dJ3iokEkyIaiOW4UofQp06V0Q9Xg+wBLZXSuEaB3drzNWXLD03Loj69iQEPH0vem
	 VodKI0tp26arCrDRp+nB9DEyLiCB9MHR8K2iNl0YmMofyvRojdJqqy0mi1qdW+opXa
	 Aazajih3EPCpbsA+RofoBsU25q/BJOqgAWnepjB+ymX6mVuoH3LCMs4jhvvAo2ILIX
	 lHHiEZjqvsMJHF2FVxUiUDB/3ErAC42Hb5AUpAZQ8MiM/cLt8wvGD4/oh92wA4ltEq
	 M0sbEYwuMBuxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756474352; x=1756734852; i=teddy.astie@vates.tech;
	bh=Q/yK30vJKpV/cQx0dBpfD4/srbUBHW3bVd1vwHsbo8o=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=O2NI+epMjTuPcVVUnhYGXgOwnGtovD6HDJzQ7oLNXyDa5sulBipyt+1Kpan41DvwS
	 7BogfWg9rc2Xz+7yy6c/JciB24Rnfe4m7rON5HB/zJPZS3axrciq0NqB1MT4ow7UzH
	 aWM7affWfWaLZX0RgXnXABspS+1mcOUWoL18PSaB3Md7FoAcr7iMQq/Plfj9lAS6ui
	 iDKdl0m8t5cogt9mP30gbOap2siAdhgm+bLBUuFGaXjuwSyfGA0tKYmu05t5mzae15
	 OX7QU9S60xCpfPvEHQEJ6K9J5i7krqA8QHOMOn6HEM3mlmT67YbYrabTmwKOw6IfsG
	 RUTqTr8/NkD3w==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=204/9]=20hvm:=20Introduce=20"fixed=20memory=20layout"=20feature?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756474350010
Message-Id: <b3c490fc-e1ca-488e-b96c-e059bdbdb466@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1755785258.git.teddy.astie@vates.tech> <640223e5e7ee18a73f62152dd27883bf5978fbfe.1755785258.git.teddy.astie@vates.tech> <5ba550db-5e36-4d98-bce7-cbb3e2d874b9@suse.com>
In-Reply-To: <5ba550db-5e36-4d98-bce7-cbb3e2d874b9@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c39b5c5a275942f380a4bee75d12fac0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250829:md
Date: Fri, 29 Aug 2025 13:32:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 28/08/2025 =C3=A0 14:30, Jan Beulich a =C3=A9crit=C2=A0:
> On 21.08.2025 17:25, Teddy Astie wrote:
>> @@ -686,10 +691,31 @@ static int domain_construct_memmap(libxl__gc *gc,
>>       /* We always own at least one lowmem entry. */
>>       unsigned int e820_entries =3D 1;
>>       struct e820entry *e820 =3D NULL;
>> +    uint64_t highmem_start =3D ((uint64_t)1 << 32);
>>       uint64_t highmem_size =3D
>>                       dom->highmem_end ? dom->highmem_end - (1ull << 32)=
 : 0;
>>       uint32_t lowmem_start =3D dom->device_model ? GUEST_LOW_MEM_START_=
DEFAULT : 0;
>>       unsigned page_size =3D XC_DOM_PAGE_SIZE(dom);
>> +    /* Special region starts at the first 1G boundary after the highmem=
 */
>> +    uint64_t special_region_start =3D
>> +        (highmem_start + highmem_size + GB(1) - 1) & ~(GB(1) - 1);
> 
> That is, inaccessible before entering PAE mode?
> 

Yes, I expect this to be only used by newer guests which hopefully 
aren't limited to 4G range (i.e supports PAE or long mode). The issue of 
trying to put that below 4G is that much of the space is already taken 
for the MMIO hole, so that area would quite complicated with more 
special regions.

> The open-coding of ROUNDUP() also isn't nice, but sadly unavoidable as lo=
ng
> the the macro works in terms of unsigned long.
> 
>> @@ -769,6 +805,40 @@ static int domain_construct_memmap(libxl__gc *gc,
>>           e820[nr].type =3D E820_RAM;
>>       }
>>   
>> +    /* Special regions */
>> +    if (libxl_defbool_val(d_config->b_info.arch_x86.fixed_mem_layout))
>> +    {
>> +        e820[nr].type =3D XEN_HVM_MEMMAP_TYPE_SHARED_INFO;
>> +        e820[nr].addr =3D special_region_offset;
>> +        e820[nr].size =3D page_size;
>> +        special_region_offset +=3D e820[nr].size;
>> +        nr++;
>> +
>> +        if ( gnttab_frame_count )
>> +        {
>> +            e820[nr].type =3D XEN_HVM_MEMMAP_TYPE_GRANT_TABLE;
>> +            e820[nr].addr =3D special_region_offset;
>> +            e820[nr].size =3D gnttab_frame_count * page_size;
>> +            special_region_offset +=3D e820[nr].size;
>> +            nr++;
>> +        }
>> +
>> +        if (d_config->b_info.max_grant_version >=3D 2 && gnttab_status_=
frame_count)
>> +        {
>> +            e820[nr].type =3D XEN_HVM_MEMMAP_TYPE_GNTTAB_STATUS;
>> +            e820[nr].addr =3D special_region_offset;
>> +            e820[nr].size =3D gnttab_status_frame_count * page_size;
>> +            special_region_offset +=3D e820[nr].size;
>> +            nr++;
>> +        }
>> +
>> +        e820[nr].type =3D XEN_HVM_MEMMAP_TYPE_FOREIGN_REG;
>> +        e820[nr].addr =3D special_region_offset;
>> +        e820[nr].size =3D MB(512);
> 
> Can we really know this is going to be enough for all use cases?
> 

Probably not, but we could make this area larger in the future without 
changing this ABI.

>> --- a/xen/include/public/arch-x86/hvm/start_info.h
>> +++ b/xen/include/public/arch-x86/hvm/start_info.h
>> @@ -99,6 +99,13 @@
>>   #define XEN_HVM_MEMMAP_TYPE_DISABLED  6
>>   #define XEN_HVM_MEMMAP_TYPE_PMEM      7
>>   
>> +/* Xen-specific types (OEM-specific range of the ACPI spec) */
>> +#define XEN_HVM_MEMMAP_TYPE_SHARED_INFO   0xF0000001 /* Shared info pag=
e */
>> +#define XEN_HVM_MEMMAP_TYPE_GRANT_TABLE   0xF0000002 /* Grant table pag=
es */
>> +#define XEN_HVM_MEMMAP_TYPE_GNTTAB_STATUS 0xF0000003 /* Grant table sta=
tus page (v2) */
>> +#define XEN_HVM_MEMMAP_TYPE_FOREIGN_REG   0xF0000004 /* Suitable region=
 for grant mappings */
>> +                                                     /* and foreign map=
pings */
> 
> I question it being legitimate for us to introduce new E820 types.
> 

These E820 types are (at least in ACPI specification) in the OEM-defined 
range which seems appropriate for me to use for Xen-specific mappings.

We could use reserved, but we still need a way to tell the OS what each 
of these "reserved" regions actually means (or it is gonna be ignored).

> Jan
Teddy



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



