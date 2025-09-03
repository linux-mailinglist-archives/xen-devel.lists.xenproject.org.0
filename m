Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E820B422F0
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 16:03:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108364.1458508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uto4m-0002fV-QQ; Wed, 03 Sep 2025 14:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108364.1458508; Wed, 03 Sep 2025 14:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uto4m-0002ds-Ma; Wed, 03 Sep 2025 14:03:04 +0000
Received: by outflank-mailman (input) for mailman id 1108364;
 Wed, 03 Sep 2025 14:03:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f3Ul=3O=bounce.vates.tech=bounce-md_30504962.68b84a92.v1-3136e414752a4831a9435bcdc14b04ae@srs-se1.protection.inumbo.net>)
 id 1uto4l-0002dm-CA
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 14:03:03 +0000
Received: from mail180-6.suw31.mandrillapp.com
 (mail180-6.suw31.mandrillapp.com [198.2.180.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b314addd-88ce-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 16:03:00 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-6.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4cH47k25TVz2K38gB
 for <xen-devel@lists.xenproject.org>; Wed,  3 Sep 2025 14:02:58 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3136e414752a4831a9435bcdc14b04ae; Wed, 03 Sep 2025 14:02:58 +0000
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
X-Inumbo-ID: b314addd-88ce-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756908178; x=1757178178;
	bh=w02FzrMXrW2vpcm0Fd62ghUMs7LKHJeX3vUiusZSv4E=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=nfkcUW/hhG1Yck0tIBDLXv4Jvsqcmy+RWc2fdKPMisA0qk0FSI3IaBTjQXlyUqHai
	 kSVk2LqeURrtqjmNcjpWx/d6MCYRYlYX+Bz1WEVWsBzIFxNrxAE5xEVlwFr0OdDzGt
	 HDjkc5pHoKHvJvrBaXnmaNkK9A9tZj6dK4wFOa629kgFLujoRg1rW4VaddR66jroMG
	 Sn7bYIYfIqbMaLljux21tnUyAJ0nVHBdUaprwGJ3S1kCEY13CGqQgp3Iq+WotmKDWn
	 TmwZrZcy8mAPKF1XilKM0ZweTeXDi/NIFcvBStWcp9dbx9j1uYhKPEQGXN4HJzYDYh
	 LvKSB8/Tk9YGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756908178; x=1757168678; i=teddy.astie@vates.tech;
	bh=w02FzrMXrW2vpcm0Fd62ghUMs7LKHJeX3vUiusZSv4E=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=02/inHDZPaEL3NI3+BwHQmMGSwpyAz7RO/CdImXFay0KEXvUzPZL+eSgp/uxah010
	 Jgb5kJHxSCZWXzkoWJrFDRiV+KPvLAa8LQIAmGAf2KzTLM8XRRqgB6j+fViqtJbRTw
	 m5AOK2gFtEhoNdGHXws03e2r+UTZcg6u0NSEXO76PUvofuroTHdm0ZX/QvQJPdSDFS
	 aiC4q9V955Q03CVwswNGVRgYyO52SNLyJHRYoPQcpCyfOAGaZmKYoZw4MydBXOF2ip
	 jja1eLH4u9odRDuVL/YhWNIfCi/sUM1QtnlqWtXRdE34z4EAXOWDIyHNrqevC8r5an
	 oR4KOiGApIHwg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RESEND=20PATCH=20v2=202/3]=20hvmloader:=20Update=20to=20SMBIOS=202.6?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756908177349
Message-Id: <f2180c69-49f8-429d-9ec2-ca3233287ef3@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1756460430.git.teddy.astie@vates.tech> <57c674cc364d3b8f4c6d03533b9e2b45728d2c19.1756460430.git.teddy.astie@vates.tech> <d422e3d6-48c5-478a-bf76-6aa39492d767@suse.com> <fdb2b2d2-a9d8-42ad-b9fc-e99905f5dbba@vates.tech> <0190dbe1-4583-49c1-86c1-9bcb57844315@suse.com>
In-Reply-To: <0190dbe1-4583-49c1-86c1-9bcb57844315@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3136e414752a4831a9435bcdc14b04ae?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250903:md
Date: Wed, 03 Sep 2025 14:02:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 02/09/2025 =C3=A0 16:10, Jan Beulich a =C3=A9crit=C2=A0:
> On 02.09.2025 15:24, Teddy Astie wrote:
>> Le 02/09/2025 =C3=A0 14:38, Jan Beulich a =C3=A9crit=C2=A0:
>>> On 29.08.2025 11:58, Teddy Astie wrote:
>>>> @@ -505,7 +505,22 @@ smbios_type_1_init(void *start, const char *xen_v=
ersion,
>>>>        p->version_str =3D 3;
>>>>        p->serial_number_str =3D 4;
>>>>    
>>>> -    memcpy(p->uuid, uuid, 16);
>>>> +    /*
>>>> +     * Xen toolstack uses big endian UUIDs, however GUIDs (which requ=
irement
>>>> +     * is clarified by SMBIOS >=3D 2.6) has the first 3 components ap=
pearing as
>>>> +     * being little endian and the rest as still being big endian.
>>>> +     */
>>>
>>> The SMBIOS spec I'm looking at (2.7.1) doesn't mention the term GUID at=
 all
>>> (except of course when discussing the EFI System Table entry). It's all=
 UUID
>>> there. Here and in the description I think this needs expressing better=
, to
>>> not raise extra questions.
>>
>> Yes (this is also true for SMBIOS 3.9.0 spec). Not sure how to express
>> that aside saying that UUID encoding differs between SMBIOS
>> specification and Xen representation.
> 
> Maybe
> 
>      /*
>       * Xen toolstack uses big endian UUIDs, whereas the UUIDs used by SM=
BIOS,
>       * also known as GUIDs, have the first 3 components appearing in lit=
tle
>       * endian (with this requirement clarified by SMBIOS >=3D 2.6).
>       */
> 
> ?
> 

Sounds good to me.

>>>> @@ -736,6 +751,22 @@ smbios_type_4_init(
>>>>        p->l2_cache_handle =3D 0xffff; /* No cache information structur=
e provided. */
>>>>        p->l3_cache_handle =3D 0xffff; /* No cache information structur=
e provided. */
>>>>    
>>>> +    /*
>>>> +     * We have a smbios type 4 table per vCPU (which is per socket),
>>>> +     * which means here that we have 1 socket per vCPU.
>>>> +     */
>>>> +    p->core_count =3D p->core_enabled =3D p->thread_count =3D 1;
>>>
>>> Might we be better off keeping them all at 0 (unknown)?
>>
>> Making it Unknown would feel a bit weird, unless we only keep only one
>> (instead of the number of vCPUs) of these table with core_count,
>> core_enabled, thread_count as 0 (unknown) ?
> 
> I don't see how unknown or not is related to how many structure instances
> we surface. Your suggestion of using 1 in all three fields isn't quite
> what we'd like to present to guests. Once we sort virtual topology in Xen=
,
> we may want to expose sane values here. Yet if we expose 1-s now, that
> adjustment would need to happen in lock-step with the hypervisor changes.
> Whereas when we expose "unknown" that can be done at a convenient later
> time.
> 

It's mostly regarding this snippet that I am not sure it is a good idea 
to expose "unknown" counts.

     for ( cpu_num =3D 1; cpu_num <=3D vcpus; cpu_num++ )
         do_struct(smbios_type_4_init(p, cpu_num, cpu_manufacturer));

AFAIU, we have as much smbios type 4 tables as we have vCPUs, things 
would be very confusing if the CPU count of each exposed "socket" (per 
vcpu) is unknown.

To me, either we should have 1 smbios type 4 table (i.e one socket) with 
unknown core count, or what we currently have, but with one core per 
"socket".

>>>> +    /*
>>>> +     * We set 64-bits, execute protection and enhanced virtualization=
.
>>>> +     * We don't set Multi-Core (bit 3) because this individual proces=
sor
>>>> +     * (as being a single vCPU) is only having one core.
>>>> +     *
>>>> +     * SMBIOS specification says that these bits don't state anything
>>>> +     * regarding the actual availability of such features.
>>>> +     */
>>>> +    p->processor_characteristics =3D 0x64;
>>>
>>> Unless nested virt is enabled for the guest, I think we'd better avoid
>>> setting the Enhanced Virtualization bit.
>>
>> I am not sure how to interpret the SMBIOS spec on this
>>
>>   > Enhanced Virtualization indicates that the processor can execute
>>   > enhanced virtualization instructions. This bit does not indicate the
>>   > present state of this feature
>>
>> I see it as: Virtualization is available or can be enabled (with nested
>> virtualization).
>> Or as : We have virtualization related instructions.
> 
> You want to view what we expose to the guest from the guest's perspective
> on its own little world, I think.
> 

Most softwares will expose it as-is as said in the SMBIOS specification; 
i.e "Enhanced Virtualization". Especially since it's not bound to 
hardware (here virtualized) capability.
But yes, it would make more sense to only expose it when we have 
meaningful nested virtualization.

>>>> --- a/tools/firmware/hvmloader/smbios_types.h
>>>> +++ b/tools/firmware/hvmloader/smbios_types.h
>>>> @@ -147,6 +147,11 @@ struct smbios_type_4 {
>>>>        uint8_t serial_number_str;
>>>>        uint8_t asset_tag_str;
>>>>        uint8_t part_number_str;
>>>> +    uint8_t core_count;
>>>> +    uint8_t core_enabled;
>>>> +    uint8_t thread_count;
>>>> +    uint16_t processor_characteristics;
>>>> +    uint16_t processor_family_2;
>>>>    } __attribute__ ((packed));
>>>>    
>>>>    /* SMBIOS type 7 - Cache Information */
>>>> @@ -185,6 +190,9 @@ struct smbios_type_9 {
>>>>        uint16_t slot_id;
>>>>        uint8_t slot_characteristics_1;
>>>>        uint8_t slot_characteristics_2;
>>>> +    uint16_t sgn_base;
>>>> +    uint8_t bus_number_base;
>>>> +    uint8_t devfn_base;
>>>
>>> Where do the _base suffixes come from? Nothing like that is said in the
>>> spec I'm looking at. Also "sgn" is imo too much of an abbreviation.
>>>
>>
>> My version of the specification (3.9.0) says
>>
>> 0Dh 2.6+ Segment Group Number (Base)
>> 0Fh 2.6+ Bus Number (Base)
>> 10h 2.6+ Device/Function Number (Base)
> 
> Without any clarification what "(Base)" means, afaics.
> 

Not a lot is said, apart that there are also "Peer" devices (SMBIOS 
3.2+) defined as (7.10.9 Peer Devices)

 > Because some slots can be partitioned into smaller electrical widths,
 > additional peer device Segment/Bus/Device/Function are defined. These
 > peer groups are defined in Table 52. The base device is the lowest
 > ordered Segment/Bus/Device/Function and is listed first (offsets
 > 0Dh-11h). Peer devices are listed in the peer grouping section.

With Table 52 having the same layout as the segment/bus/... values we 
have for the "base" ones.

>> Regarding sgn, maybe we can use `segment` instead ?
> 
> Why not segment_group or seg_group (seeing how devfn also is an abbreviat=
ion)?
> And if we omit _number there and on devfn, it's hard to see why it should=
n't
> be just "bus" then as well.

So overall

  uint16_t segment_group;
  uint8_t bus;
  uint8_t devfn;

?

segment_group looks a bit off compared with the rest.
We could use `seg` like we do in Xen PCI code, as it is about PCI 
segment here.

> 
> Jan

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



