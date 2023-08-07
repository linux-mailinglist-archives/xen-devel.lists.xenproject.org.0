Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 623F077245C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 14:40:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578341.905794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSzWd-0002r9-FM; Mon, 07 Aug 2023 12:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578341.905794; Mon, 07 Aug 2023 12:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSzWd-0002oW-CH; Mon, 07 Aug 2023 12:39:55 +0000
Received: by outflank-mailman (input) for mailman id 578341;
 Mon, 07 Aug 2023 12:39:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LmzZ=DY=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qSzWb-0002oQ-HK
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 12:39:53 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e143cf6-351f-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 14:39:48 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 9C4115C00CA;
 Mon,  7 Aug 2023 08:39:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Aug 2023 08:39:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Aug 2023 08:39:43 -0400 (EDT)
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
X-Inumbo-ID: 7e143cf6-351f-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1691411986; x=1691498386; bh=xbrcN9ni6V/ifhXltJx9M+NEPI6gpxZebc6
	Dm84OTzY=; b=j0C1hsa8ZzeFo55dSHDvnbO5jIKhf+l24UMjDlDJ7PTwRkXMn0S
	QwAbrJm03KqUmxPXezMgkK8b2gAhRFgZw26fiKOKwvWfskmksJWMETVcsXqXzaxj
	yEtvVSukT4Jd/Po1peBO3trw6J9oavv1sv7vY5rDiIA1Cmhuq3zFekNGZXRV5QSW
	Eef5Z8Qd/e5WOfRtl1vyElMVAtnW2NIKhje8DtUwnIBzNXCq4rK9Cs+VQgaVO+WO
	OrsGDFgXnEmvM7OEAGu6gve8ulu5Xg2oBRmUU+DDH4ypGdIoUeeTrCnAs27BPb71
	eSfVj/jKNPVTQGjpPd1p3EpkUBeWBoEk4hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691411986; x=1691498386; bh=xbrcN9ni6V/if
	hXltJx9M+NEPI6gpxZebc6Dm84OTzY=; b=KoNIZHOsnnXtiX0Hs2uhpCzM1+iIF
	6GY6LkOBcVN4SkAO3FacHJ7T/TGm4Dg3cyX4+2il4iFLjBO11sG6aYg0iNdd6K3n
	SXVOU1PK0V8cQ54qlY1BAJinjKx84Xq8iDiFR5jNVqzEpnDY61F2/atxUwlCKLaY
	r5WNfbaJOgqGwM0MXCKSfI+mmKum4bEcLZo548QyIcUGlkQpZkcWQo6J6Lo3jGgI
	vXPz71WUAV+Q/0Cn+MtgdD2vvYpVavkXRwke/6KF51XQIjqFZ4edjSoyCbIc4Aka
	w7RYLJF2QE0puQZDa7icu5MHdLczKC+2NNKFBd5u3NqXgVYVh0nHuIJrg==
X-ME-Sender: <xms:EubQZLQ1WMvCz0r2BPflUsMsKMJUgYreLkjz9UyA82MUIonkTKyNlQ>
    <xme:EubQZMyxtLb6z-P-579Ms11V_gThJ2yJJgRmKrIlyDCWYUa-SLGvL-u6G5AEXewK9
    pEGH0_D4rxXiMk>
X-ME-Received: <xmr:EubQZA1UHeqaEqITrPsgWhJeREZ4V5qCdjb5Ldwg-os8kWz_P8MMD_s0n7ImKKc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrledtgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffgguffvvehfhfgjtgesghdtreertddtjeenucfhrhhomhepufhimhhonhcu
    ifgrihhsvghruceoshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeeftdefudeltdevhfehkeefhfeutdfhffdugeetffdv
    gfehfeekhfetgedvuefggfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhimhhonhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:EubQZLDj3w6JKEFHQxvg0aGn-Mj9UKLSKlIgSKQFNDB79uAI8XYpqw>
    <xmx:EubQZEjWZz6MxtZOAT8NxOVUqE92yGbBnrIgC3pBTwFrOTlo75KxJA>
    <xmx:EubQZPqIAVgMIGUOxZ5WGMcfCy6sNxl4lzM5B9Z90f1xbod92dE3mA>
    <xmx:EubQZAhHHtDQsUE__wxRHrOtTq9qs7kuXka0LelWZeQrwVhGLSrxZQ>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <0882e0bd-b1c6-91c9-1ccc-d96e012e4f9a@invisiblethingslab.com>
Date: Mon, 7 Aug 2023 14:39:28 +0200
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 04/23] x86: Don't use potentially incorrect
 CPUID values for topology information
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, KarimAllah Ahmed <karahmed@amazon.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Jan_H=2e_Sch=c3=b6nherr?= <jschoenh@amazon.de>,
 Matt Wilson <msw@amazon.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Anthony Liguori <aliguori@amzn.com>,
 xen-devel@lists.xenproject.org
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-5-git-send-email-aliguori@amzn.com>
 <df21a319-b8a4-bb14-ac43-20035d04d4a2@invisiblethingslab.com>
 <d01574a2-962f-20a5-281f-7672a06b5f10@suse.com>
 <ca8bec9e-69d0-0a51-5553-ff8c9423d8bb@invisiblethingslab.com>
 <5fedd7c0-862e-d7c6-431d-6478ae1960b9@suse.com>
Content-Language: en-US
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <5fedd7c0-862e-d7c6-431d-6478ae1960b9@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------REdQ0Uf83wSfWFMIfXj0tc00"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------REdQ0Uf83wSfWFMIfXj0tc00
Content-Type: multipart/mixed; boundary="------------p7HEWvjRNGVEGKLy0KR00SiA";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, KarimAllah Ahmed <karahmed@amazon.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Jan_H=2e_Sch=c3=b6nherr?= <jschoenh@amazon.de>,
 Matt Wilson <msw@amazon.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Anthony Liguori <aliguori@amzn.com>,
 xen-devel@lists.xenproject.org
Message-ID: <0882e0bd-b1c6-91c9-1ccc-d96e012e4f9a@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v2 04/23] x86: Don't use potentially incorrect
 CPUID values for topology information
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-5-git-send-email-aliguori@amzn.com>
 <df21a319-b8a4-bb14-ac43-20035d04d4a2@invisiblethingslab.com>
 <d01574a2-962f-20a5-281f-7672a06b5f10@suse.com>
 <ca8bec9e-69d0-0a51-5553-ff8c9423d8bb@invisiblethingslab.com>
 <5fedd7c0-862e-d7c6-431d-6478ae1960b9@suse.com>
In-Reply-To: <5fedd7c0-862e-d7c6-431d-6478ae1960b9@suse.com>

--------------p7HEWvjRNGVEGKLy0KR00SiA
Content-Type: multipart/mixed; boundary="------------Y0Bpwe3jpar1IaqWoKfUGww7"

--------------Y0Bpwe3jpar1IaqWoKfUGww7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Jan Beulich:
> On 07.08.2023 11:58, Simon Gaiser wrote:
>> Jan Beulich:
>>> On 07.08.2023 10:18, Simon Gaiser wrote:
>>>> Anthony Liguori:
>>>>> From: Jan H. Sch=C3=B6nherr <jschoenh@amazon.de>
>>>>>
>>>>> Intel says for CPUID leaf 0Bh:
>>>>>
>>>>>   "Software must not use EBX[15:0] to enumerate processor
>>>>>    topology of the system. This value in this field
>>>>>    (EBX[15:0]) is only intended for display/diagnostic
>>>>>    purposes. The actual number of logical processors
>>>>>    available to BIOS/OS/Applications may be different from
>>>>>    the value of EBX[15:0], depending on software and platform
>>>>>    hardware configurations."
>>>>>
>>>>> And yet, we're using them to derive the number cores in a package
>>>>> and the number of siblings in a core.
>>>>>
>>>>> Derive the number of siblings and cores from EAX instead, which is
>>>>> intended for that.
>>>>>
>>>>> Signed-off-by: Jan H. Sch=C3=B6nherr <jschoenh@amazon.de>
>>>>> ---
>>>>>  xen/arch/x86/cpu/common.c | 4 ++--
>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
>>>>> index e9588b3..22f392f 100644
>>>>> --- a/xen/arch/x86/cpu/common.c
>>>>> +++ b/xen/arch/x86/cpu/common.c
>>>>> @@ -479,8 +479,8 @@ void detect_extended_topology(struct cpuinfo_x8=
6 *c)
>>>>>     initial_apicid =3D edx;
>>>>> =20
>>>>>     /* Populate HT related information from sub-leaf level 0 */
>>>>> -   core_level_siblings =3D c->x86_num_siblings =3D LEVEL_MAX_SIBLI=
NGS(ebx);
>>>>>     core_plus_mask_width =3D ht_mask_width =3D BITS_SHIFT_NEXT_LEVE=
L(eax);
>>>>> +   core_level_siblings =3D c->x86_num_siblings =3D 1 << ht_mask_wi=
dth;
>>>>> =20
>>>>>     sub_index =3D 1;
>>>>>     do {
>>>>> @@ -488,8 +488,8 @@ void detect_extended_topology(struct cpuinfo_x8=
6 *c)
>>>>> =20
>>>>>             /* Check for the Core type in the implemented sub leave=
s */
>>>>>             if ( LEAFB_SUBTYPE(ecx) =3D=3D CORE_TYPE ) {
>>>>> -                   core_level_siblings =3D LEVEL_MAX_SIBLINGS(ebx)=
;
>>>>>                     core_plus_mask_width =3D BITS_SHIFT_NEXT_LEVEL(=
eax);
>>>>> +                   core_level_siblings =3D 1 << core_plus_mask_wid=
th;
>>>>
>>>>
>>>> On the i5-1135G7 (4 cores with each 2 threads) I'm currently testing=
 on
>>>> I noticed that this changes leads to core_level_siblings =3D=3D 16 a=
nd
>>>> therefore x86_max_cores =3D=3D 8. If read from ebx like before this =
change
>>>> and what Linux is still doing [1] it reads core_level_siblings =3D=3D=
 8 (as
>>>> expected?).
>>>>
>>>> What's the expected semantic here? If it's to derive the actual numb=
er
>>>> of siblings (and therefore cores) in a package as the commit message=

>>>> suggest, the new code can't work even ignoring the example from my t=
est
>>>> system. It will always produce powers of 2, so can't get it right on=
 a
>>>> system with, say, 6 cores.
>>>
>>> The only use of the variable in question is in this statement:
>>>
>>>       c->x86_max_cores =3D (core_level_siblings / c->x86_num_siblings=
);
>>>
>>> Note the "max" in the name. This is how many _could_ be there, not ho=
w
>>> many _are_ there, aiui.
>>
>> I'm indeed not quite sure on the intended semantic, hence the question=

>> (although it's not clear to me what case that "could" would cover here=
).
>=20
> "Could" covers for a number of reasons why APIC IDs may not be contiguo=
us.
> Consider a 6-code system: The APIC IDs need to cover for at least 8 the=
re.
>=20
>> It doesn't have to be identical but Linux says for it's version of the=

>> variable:
>>
>>     The number of cores in a package. This information is retrieved vi=
a
>>     CPUID.
>>
>> And if I look at it's usage in set_nr_sockets in Xen:
>>
>>     nr_sockets =3D last_physid(phys_cpu_present_map)
>>                  / boot_cpu_data.x86_max_cores
>>                  / boot_cpu_data.x86_num_siblings + 1;
>=20
> This validly uses the field in the "max" sense, not in the "actual" one=
=2E

I see, both cases cover APIC IDs not just numbers of logical CPUs.
Thanks for the explanation and the pointer from Andrew in his response.

I just had noticed the, to me, unexpected value, while debugging
something. But based on this explanation things are actually working
as intended here. (The actual problem I was looking for it turned out
to be [1].)

[1]: https://lore.kernel.org/xen-devel/7f158a54548456daba9f2e105d099d2e5e=
2c2f38.1691399031.git.simon@invisiblethingslab.com/

>> It seems to be also be used in this meaning. At least on my test syste=
m
>> I get last_physid =3D=3D 7 (as I would have expected for 8 logical cpu=
s). So
>> dividing this by the 4 (number of cores) and 2 (threads per core) is
>> what I think was intended here.
>=20
> Would you mind providing raw data from your system: Both the raw CPUID
> output for the leaf/leaves of interest here and the APIC IDs of all
> threads?

Sure:

=46rom attached patch:

(XEN) dbg smp_processor_id() =3D 0
(XEN) dbg get_apic_id() =3D 0
(XEN) dbg cpuid_count(0xb, SMT_LEVEL) =3D 0x1, 0x2, 0x100, 0
(XEN) dbg cpuid_count(0xb, 0x1) =3D 0x4, 0x8, 0x201, 0

(XEN) dbg smp_processor_id() =3D 1
(XEN) dbg get_apic_id() =3D 1
(XEN) dbg cpuid_count(0xb, SMT_LEVEL) =3D 0x1, 0x2, 0x100, 0x1
(XEN) dbg cpuid_count(0xb, 0x1) =3D 0x4, 0x8, 0x201, 0x1

(XEN) dbg smp_processor_id() =3D 2
(XEN) dbg get_apic_id() =3D 2
(XEN) dbg cpuid_count(0xb, SMT_LEVEL) =3D 0x1, 0x2, 0x100, 0x2
(XEN) dbg cpuid_count(0xb, 0x1) =3D 0x4, 0x8, 0x201, 0x2

(XEN) dbg smp_processor_id() =3D 3
(XEN) dbg get_apic_id() =3D 3
(XEN) dbg cpuid_count(0xb, SMT_LEVEL) =3D 0x1, 0x2, 0x100, 0x3
(XEN) dbg cpuid_count(0xb, 0x1) =3D 0x4, 0x8, 0x201, 0x3

(XEN) dbg smp_processor_id() =3D 4
(XEN) dbg get_apic_id() =3D 4
(XEN) dbg cpuid_count(0xb, SMT_LEVEL) =3D 0x1, 0x2, 0x100, 0x4
(XEN) dbg cpuid_count(0xb, 0x1) =3D 0x4, 0x8, 0x201, 0x4

(XEN) dbg smp_processor_id() =3D 5
(XEN) dbg get_apic_id() =3D 5
(XEN) dbg cpuid_count(0xb, SMT_LEVEL) =3D 0x1, 0x2, 0x100, 0x5
(XEN) dbg cpuid_count(0xb, 0x1) =3D 0x4, 0x8, 0x201, 0x5

(XEN) dbg smp_processor_id() =3D 6
(XEN) dbg get_apic_id() =3D 6
(XEN) dbg cpuid_count(0xb, SMT_LEVEL) =3D 0x1, 0x2, 0x100, 0x6
(XEN) dbg cpuid_count(0xb, 0x1) =3D 0x4, 0x8, 0x201, 0x6

(XEN) dbg smp_processor_id() =3D 7
(XEN) dbg get_apic_id() =3D 7
(XEN) dbg cpuid_count(0xb, SMT_LEVEL) =3D 0x1, 0x2, 0x100, 0x7
(XEN) dbg cpuid_count(0xb, 0x1) =3D 0x4, 0x8, 0x201, 0x7

=46rom the MADT table:

[02Ch 0044   1]                Subtable Type : 00 [Processor Local APIC]
[02Dh 0045   1]                       Length : 08
[02Eh 0046   1]                 Processor ID : 00
[02Fh 0047   1]                Local Apic ID : 00
[030h 0048   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
                      Runtime Online Capable : 0

[034h 0052   1]                Subtable Type : 00 [Processor Local APIC]
[035h 0053   1]                       Length : 08
[036h 0054   1]                 Processor ID : 01
[037h 0055   1]                Local Apic ID : 02
[038h 0056   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
                      Runtime Online Capable : 0

[03Ch 0060   1]                Subtable Type : 00 [Processor Local APIC]
[03Dh 0061   1]                       Length : 08
[03Eh 0062   1]                 Processor ID : 02
[03Fh 0063   1]                Local Apic ID : 04
[040h 0064   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
                      Runtime Online Capable : 0

[044h 0068   1]                Subtable Type : 00 [Processor Local APIC]
[045h 0069   1]                       Length : 08
[046h 0070   1]                 Processor ID : 03
[047h 0071   1]                Local Apic ID : 06
[048h 0072   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
                      Runtime Online Capable : 0

[04Ch 0076   1]                Subtable Type : 00 [Processor Local APIC]
[04Dh 0077   1]                       Length : 08
[04Eh 0078   1]                 Processor ID : 04
[04Fh 0079   1]                Local Apic ID : 01
[050h 0080   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
                      Runtime Online Capable : 0

[054h 0084   1]                Subtable Type : 00 [Processor Local APIC]
[055h 0085   1]                       Length : 08
[056h 0086   1]                 Processor ID : 05
[057h 0087   1]                Local Apic ID : 03
[058h 0088   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
                      Runtime Online Capable : 0

[05Ch 0092   1]                Subtable Type : 00 [Processor Local APIC]
[05Dh 0093   1]                       Length : 08
[05Eh 0094   1]                 Processor ID : 06
[05Fh 0095   1]                Local Apic ID : 05
[060h 0096   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
                      Runtime Online Capable : 0

[064h 0100   1]                Subtable Type : 00 [Processor Local APIC]
[065h 0101   1]                       Length : 08
[066h 0102   1]                 Processor ID : 07
[067h 0103   1]                Local Apic ID : 07
[068h 0104   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
                      Runtime Online Capable : 0

[06Ch 0108   1]                Subtable Type : 00 [Processor Local APIC]
[06Dh 0109   1]                       Length : 08
[06Eh 0110   1]                 Processor ID : 08
[06Fh 0111   1]                Local Apic ID : FF
[070h 0112   4]        Flags (decoded below) : 00000000
                           Processor Enabled : 0
                      Runtime Online Capable : 0

[074h 0116   1]                Subtable Type : 00 [Processor Local APIC]
[075h 0117   1]                       Length : 08
[076h 0118   1]                 Processor ID : 09
[077h 0119   1]                Local Apic ID : FF
[078h 0120   4]        Flags (decoded below) : 00000000
                           Processor Enabled : 0
                      Runtime Online Capable : 0

[07Ch 0124   1]                Subtable Type : 00 [Processor Local APIC]
[07Dh 0125   1]                       Length : 08
[07Eh 0126   1]                 Processor ID : 0A
[07Fh 0127   1]                Local Apic ID : FF
[080h 0128   4]        Flags (decoded below) : 00000000
                           Processor Enabled : 0
                      Runtime Online Capable : 0

[084h 0132   1]                Subtable Type : 00 [Processor Local APIC]
[085h 0133   1]                       Length : 08
[086h 0134   1]                 Processor ID : 0B
[087h 0135   1]                Local Apic ID : FF
[088h 0136   4]        Flags (decoded below) : 00000000
                           Processor Enabled : 0
                      Runtime Online Capable : 0

[08Ch 0140   1]                Subtable Type : 00 [Processor Local APIC]
[08Dh 0141   1]                       Length : 08
[08Eh 0142   1]                 Processor ID : 0C
[08Fh 0143   1]                Local Apic ID : FF
[090h 0144   4]        Flags (decoded below) : 00000000
                           Processor Enabled : 0
                      Runtime Online Capable : 0

[094h 0148   1]                Subtable Type : 00 [Processor Local APIC]
[095h 0149   1]                       Length : 08
[096h 0150   1]                 Processor ID : 0D
[097h 0151   1]                Local Apic ID : FF
[098h 0152   4]        Flags (decoded below) : 00000000
                           Processor Enabled : 0
                      Runtime Online Capable : 0

[09Ch 0156   1]                Subtable Type : 00 [Processor Local APIC]
[09Dh 0157   1]                       Length : 08
[09Eh 0158   1]                 Processor ID : 0E
[09Fh 0159   1]                Local Apic ID : FF
[0A0h 0160   4]        Flags (decoded below) : 00000000
                           Processor Enabled : 0
                      Runtime Online Capable : 0

[0A4h 0164   1]                Subtable Type : 00 [Processor Local APIC]
[0A5h 0165   1]                       Length : 08
[0A6h 0166   1]                 Processor ID : 0F
[0A7h 0167   1]                Local Apic ID : FF
[0A8h 0168   4]        Flags (decoded below) : 00000000
                           Processor Enabled : 0
                      Runtime Online Capable : 0

If you wanted something else or need more, just let me know.

Simon
--------------Y0Bpwe3jpar1IaqWoKfUGww7
Content-Type: text/x-patch; charset=UTF-8;
 name="detect_extended_topology-dbg.patch"
Content-Disposition: attachment; filename="detect_extended_topology-dbg.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMgYi94ZW4vYXJjaC94ODYv
Y3B1L2NvbW1vbi5jCmluZGV4IGNmY2RhYWNlMTIuLjhhMzVhNWFmZmUgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9jb21t
b24uYwpAQCAtNjI0LDcgKzYyNCwxMSBAQCBib29sIGRldGVjdF9leHRlbmRlZF90b3BvbG9n
eShzdHJ1Y3QgY3B1aW5mb194ODYgKmMpCiAJaWYgKCBjLT5jcHVpZF9sZXZlbCA8IDB4YiAp
CiAJCXJldHVybiBmYWxzZTsKIAorCXByaW50aygiZGJnIHNtcF9wcm9jZXNzb3JfaWQoKSA9
ICV1XG4iLCBzbXBfcHJvY2Vzc29yX2lkKCkpOworCXByaW50aygiZGJnIGdldF9hcGljX2lk
KCkgPSAldVxuIiwgZ2V0X2FwaWNfaWQoKSk7CisKIAljcHVpZF9jb3VudCgweGIsIFNNVF9M
RVZFTCwgJmVheCwgJmVieCwgJmVjeCwgJmVkeCk7CisJcHJpbnRrKCJkYmcgY3B1aWRfY291
bnQoMHhiLCBTTVRfTEVWRUwpID0gJSN4LCAlI3gsICUjeCwgJSN4XG4iLCBlYXgsIGVieCwg
ZWN4LCBlZHgpOwogCiAJLyogQ2hlY2sgaWYgdGhlIGNwdWlkIGxlYWYgMHhiIGlzIGFjdHVh
bGx5IGltcGxlbWVudGVkICovCiAJaWYgKCBlYnggPT0gMCB8fCAoTEVBRkJfU1VCVFlQRShl
Y3gpICE9IFNNVF9UWVBFKSApCkBAIC02NDEsNiArNjQ1LDcgQEAgYm9vbCBkZXRlY3RfZXh0
ZW5kZWRfdG9wb2xvZ3koc3RydWN0IGNwdWluZm9feDg2ICpjKQogCXN1Yl9pbmRleCA9IDE7
CiAJZG8gewogCQljcHVpZF9jb3VudCgweGIsIHN1Yl9pbmRleCwgJmVheCwgJmVieCwgJmVj
eCwgJmVkeCk7CisJCXByaW50aygiZGJnIGNwdWlkX2NvdW50KDB4YiwgJSN4KSA9ICUjeCwg
JSN4LCAlI3gsICUjeFxuIiwgc3ViX2luZGV4LCBlYXgsIGVieCwgZWN4LCBlZHgpOwogCiAJ
CS8qIENoZWNrIGZvciB0aGUgQ29yZSB0eXBlIGluIHRoZSBpbXBsZW1lbnRlZCBzdWIgbGVh
dmVzICovCiAJCWlmICggTEVBRkJfU1VCVFlQRShlY3gpID09IENPUkVfVFlQRSApIHsK

--------------Y0Bpwe3jpar1IaqWoKfUGww7--

--------------p7HEWvjRNGVEGKLy0KR00SiA--

--------------REdQ0Uf83wSfWFMIfXj0tc00
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmTQ5gIACgkQkO9xfO/x
ly8GLw/+L6gzs2QJTuthxUS/32txoUHkgKJrZQRh9ZUsHrPVFNYjedTGJ42XlxIe
Heh+82JuN3PM3xgAxwJPwnYY7AvPunn0L/CZJ/r8wT/hwRozm9UePuqYbLnAbovp
u9s5mdCTK54fr3/6qPFd3JqUcQ/RsjwxMgLVu6VxKAUGs+ZhjqOw6EHTlgAKblP8
KUm9Hh6T4TmAJJOlwDYU48OCZtPs9WTEL05R5kFBLDx1CpHvnIEooyD7owulj/eI
AJg2BDswLu+gatVHmlgRY3a/XtTFYPwq4Mm7u1ABtev8CKSeJc7nIwruvTxdTd8B
FhbWvWaMSBJRsb0AGk/kghiaqO0YNFxXIPqiXqRhDqvxAeFHTTH/B2dKqIb1XB1k
xGgdm+thhrw+m0SzC7D8JT8gmN/IV2krtwOmrnjOa5PFeJ8cKSouSN9zEO7UdCjK
M6ot0jzBU7SOWQMmZ5mVVC2qQSURZ+t9OqUCYjjQmCpszSzwD++b6kezKXQ2M4lF
4JDfazzC71s7BCy3/h6eQ4aFd4soC5VaEeocDyPyoj7KIkctYgH9XER7lmviH2kT
m4ouiB+oXvr4IUeq1ZTUOHnGuNZ0TSUu6j0qro9B16wWQBGPJ0OYXEhelOBGD/mY
NHCA3P/2lsG2L/C7OXeLqefkjUdE8yjXMAlfisaE+NozkKAJ9G0=
=cmOS
-----END PGP SIGNATURE-----

--------------REdQ0Uf83wSfWFMIfXj0tc00--

