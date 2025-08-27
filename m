Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E234AB38AF1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 22:28:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096943.1451470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urMkR-0004nr-Mo; Wed, 27 Aug 2025 20:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096943.1451470; Wed, 27 Aug 2025 20:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urMkR-0004lV-Jl; Wed, 27 Aug 2025 20:27:59 +0000
Received: by outflank-mailman (input) for mailman id 1096943;
 Wed, 27 Aug 2025 20:27:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=USey=3H=bounce.vates.tech=bounce-md_30504962.68af6a4a.v1-2a0aed859c5345c9a2e0e2508231852f@srs-se1.protection.inumbo.net>)
 id 1urMkQ-0004lP-DP
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 20:27:58 +0000
Received: from mail137-3.atl71.mandrillapp.com
 (mail137-3.atl71.mandrillapp.com [198.2.137.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ffe7c86-8384-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 22:27:55 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-3.atl71.mandrillapp.com (Mailchimp) with ESMTP id 4cBx160pB8zBsV7Vb
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 20:27:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2a0aed859c5345c9a2e0e2508231852f; Wed, 27 Aug 2025 20:27:54 +0000
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
X-Inumbo-ID: 4ffe7c86-8384-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756326474; x=1756596474;
	bh=uIgoLoFUdjWJAoXVFFkhpR8DJkcqbSwx4+izNdCQyQ8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jus6/bAkC3X98debskjGPHro05CG6oHvpekWgWzFEaj4XEMwH6s4xUx/DUdMX+b8+
	 1sJtvSlPd3lXU3883vED0zuLNbr0AsG2Fi7pIRrN4OS4MgyI7lOezkKEvaEZSeQsmb
	 ZQMjcBkO/nvx5z9CfQRXdTmI2bk7k3ps78j8U3sa2mtEW/yWJzrG1FU8RFSN1Y3nB3
	 Ogl5Gv7D0lDwkTIb9AMv7a91eqgLc2b+rtPJC7RAGpzphX+O2pYipYoGQpIWDHbVEo
	 zMLXSl7Wmydc+rlmfd/e4ZvE7FfenrYE6mQRkrahv2/KIKp/JCwowTqsTi5G2/tjiq
	 y+BgH8KPBM1aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756326474; x=1756586974; i=teddy.astie@vates.tech;
	bh=uIgoLoFUdjWJAoXVFFkhpR8DJkcqbSwx4+izNdCQyQ8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=uE/isnkaO78k73bClge+mQuDYF0+KUEjjYDSZBb6fuTw/Mo9tfpJmO/Ovo0nY5Oj/
	 X5Y0a9pzEXxGnoMeX41c1DVaxk8/JP9+xjGa8+v+3TPF4NAx0Y2SnIFyIjKf7N+6jS
	 fROzVOYfKDXTChj57JLwBZR9+hWpqRsYZguYswsX/Cx2HNSZi3LbeHNHKyiN4aoE0H
	 SdritnJFLQir1MJO88KXFYc7ij7FuLp3gMewKHovTZgCY6oO9j0DezgUUeOXFZXdk0
	 XjW0xC/8XApoKk5lGbsV5WvwaNriuWMPhlwpZai3POoqTNS9l1uge714KomRYQDsbY
	 Qlx+gzEjZpQ4A==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20hvmloader:=20Update=20to=20SMBIOS=202.6?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756326473096
Message-Id: <74665857-3f0b-43e6-b31f-d498d9e7fdc3@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>
References: <b569a298a6270ae04eaf433f7de9ce1f3e248e5f.1755870287.git.teddy.astie@vates.tech> <6e9b7b96-a506-40ed-95b6-6ad00ba9a27a@citrix.com>
In-Reply-To: <6e9b7b96-a506-40ed-95b6-6ad00ba9a27a@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2a0aed859c5345c9a2e0e2508231852f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250827:md
Date: Wed, 27 Aug 2025 20:27:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 27/08/2025 =C3=A0 19:49, Andrew Cooper a =C3=A9crit=C2=A0:
> On 22/08/2025 2:47 pm, Teddy Astie wrote:
>> Currently, hvmloader uses SMBIOS 2.4, however, when using OVMF, the
>> SMBIOS is patched to 2.8, which has clarified the UUID format (as GUID).
>>
>> In Linux, if the SMBIOS version is >=3D 2.6, the GUID format is used, el=
se
>> (undefined as per SMBIOS spec), big endian is used (used by Xen). Theref=
ore,
>> you have a endian mismatch causing the UUIDs to mismatch in the guest.
>>
>> $ cat /sys/hypervisor/uuid
>> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
>> $ cat /sys/devices/virtual/dmi/id/product_uuid
>> 3fe665e8-303d-0b4f-83e0-8fdfc1e30eb7
>> $ cat /sys/devices/virtual/dmi/id/product_serial
>> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
>>
>> This patch updates the SMBIOS version from 2.4 to 2.6 and fixup the UUID
>> written in the table; which effectively fix this endianness mismatch wit=
h
>> OVMF; while the UUID displayed by Linux is still the same for SeaBIOS.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>> This effectively changes the UUID seen with UEFI guests as it was
>> actually inconsistent with SeaBIOS and SMBIOS expectations.
>> ---
> 
> I agree this is a real bug and needs fixing.=C2=A0 However, ...
> 
> 
>>   tools/firmware/hvmloader/smbios.c | 20 ++++++++++++++++++--
>>   1 file changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/firmware/hvmloader/smbios.c b/tools/firmware/hvmloade=
r/smbios.c
>> index 6bcdcc233a..f4822ae6f8 100644
>> --- a/tools/firmware/hvmloader/smbios.c
>> +++ b/tools/firmware/hvmloader/smbios.c
>> @@ -352,7 +352,7 @@ smbios_entry_point_init(void *start,
>>       memcpy(ep->anchor_string, "_SM_", 4);
>>       ep->length =3D 0x1f;
>>       ep->smbios_major_version =3D 2;
>> -    ep->smbios_minor_version =3D 4;
>> +    ep->smbios_minor_version =3D 6;
>>       ep->max_structure_size =3D max_structure_size;
>>       ep->entry_point_revision =3D 0;
>>       memcpy(ep->intermediate_anchor_string, "_DMI_", 5);
>> @@ -462,7 +462,23 @@ smbios_type_1_init(void *start, const char *xen_ver=
sion,
>>       p->version_str =3D 3;
>>       p->serial_number_str =3D 4;
>>   
>> -    memcpy(p->uuid, uuid, 16);
>> +    /*
>> +     * Xen uses OSF DCE UUIDs which is fully big endian, however,
>> +     * GUIDs (which requirement is clarified by SMBIOS >=3D 2.6) has th=
e
>> +     * first 3 components appearing as being little endian and the rest
>> +     * as still being big endian.
> 
> ... this is not an accurate statement.
> 
> Xen specifically tries to treat a xen_domain_handle_t as an opaque blob.
> 
> The only two areas I can see ascribing any structure are the 'q'
> debugkey (not exactly a strong ABI statement), and the arinc635
> scheduler whose use is buggy (uuids are not unique in Xen; it's the
> domid which is).
> 
> It is an error that a format isn't stated, but the format comes from the
> toolstack.=C2=A0 We'd better hope that all toolstacks use OSF DCE UUIDs, =
or
> this is going to badly wrong.
> 

I agree in principle. maybe OSF DCE UUID is not the proper definition 
(even though it implies the same) but I should rather use RFC 9562 UUIDs 
but refering to the string representation rather than the UUID meaning 
itself.

The RFC 9562 defines the UUID as being sequenced as big endian and 
string represented as > UUID     =3D 4hexOctet "-"
>            2hexOctet "-"
>            2hexOctet "-"
>            2hexOctet "-"
>            6hexOctet
> hexOctet =3D HEXDIG HEXDIG
> DIGIT    =3D %x30-39
> HEXDIG   =3D DIGIT / "A" / "B" / "C" / "D" / "E" / "F"

This matches the UUID encoding provided by XEN_DEFINE_UUID and is used 
by libxl, libvirt and XAPI and considered by Linux when reading the 
UUID. However, it may always not be a "valid" UUID strictly speaking but 
it doesn't really matter since we only care about its binary/string 
representation.

> And on that note, the toolstacks are not the same.=C2=A0 Xapi for example
> uses reads 16 bytes out of /dev/urandom.
> 
> Whatever we end up doing, the fix must include a change to
> xen/include/public/version.h stating the format of the UUID.
> 
Something like

diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index 04fc891353..3241e8dd2b 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -975,6 +975,10 @@ typedef struct dom0_vga_console_info {
  #define xen_vga_console_info dom0_vga_console_info
  #define xen_vga_console_info_t dom0_vga_console_info_t

+/*
+ * The guest handled provided by toolstack encoded as a UUID in
+ * big-endian order. Its string representation follows RFC 9562.
+ */
  typedef uint8_t xen_domain_handle_t[16];

  __DEFINE_XEN_GUEST_HANDLE(uint8,  uint8_t);

?

So that we're converting between big-endian encoded UUID (RFC 9562) and 
Microsoft GUID (which doesn't care about its content but only about its 
endianness regarding formatting).

> ~Andrew
> 

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



