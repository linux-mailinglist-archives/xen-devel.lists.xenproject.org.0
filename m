Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8280279E5A2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 13:02:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601200.937156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgNdW-0003BW-2H; Wed, 13 Sep 2023 11:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601200.937156; Wed, 13 Sep 2023 11:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgNdV-00038X-VY; Wed, 13 Sep 2023 11:02:21 +0000
Received: by outflank-mailman (input) for mailman id 601200;
 Wed, 13 Sep 2023 11:02:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mepq=E5=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qgNdU-00037c-Ar
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 11:02:20 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffe3fa96-5224-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 13:02:18 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id AEC375C01AA;
 Wed, 13 Sep 2023 07:02:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 13 Sep 2023 07:02:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Sep 2023 07:02:12 -0400 (EDT)
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
X-Inumbo-ID: ffe3fa96-5224-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1694602935; x=1694689335; bh=ybp8mdw57do83PPlQuFWgagWRBAQrwYZ84m
	OuzqG5TA=; b=4TvEtiL5gvRyLcrB5j3RK6dzRMsW92jdu3omBY+w+BRnmcr0BI2
	zRLAQd9Csic4v6ubzj5m58f8Q+E730lpvRe9s+uSHbA6FlvSqOlpk6EBQTByOg6u
	ZonUR/+fHvPlK7BJ+jgOu7wujpHAoF0/4XOc2bVVqWKZZfo6CEwK1YWvkwvWG+P1
	O3Xsotrmmprm6xjZy6ctn3UPIjwYRyh/udN+Fg0NxPtyMRBOph5CAaWMYmpBSVwH
	gk7xNDbN7eQZG3JtRF//7g0ENilh1l6JVFHqYCMdV8P2Y6We4TCKnYhWE0DPwMgf
	jpCqHiL3aVSAVvyWocFZ6HKawsPf4I4gOTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1694602935; x=1694689335; bh=ybp8mdw57do83
	PPlQuFWgagWRBAQrwYZ84mOuzqG5TA=; b=KRJZncrTUu4eE3VdrU2FhlyssU3K4
	wIuuCyj1QnlF70ZpTSX3PPGJX3VQTMtt5dLmqyRvHGMLn2C/bHe5SxqddVZeZs46
	RG1ymparWIo8dvjutjTiad0YQAF6zdvO+W0I7xOB/9Ph3Q7sAX/tJjlw+/Cxa2IV
	1GFQ9ZURIO4E5qzl0uWoA2iVoWei3l6yZ859r9grWnxXL0p0wbGw60VoNFwaKeod
	1WQlA22P4bh/GCBtJWWTm50SdNmeFjxEMUvAzqIaqocLBA6TvPxCMw5AfPkk70My
	RIQL5kpy7Ke9pOEHvcfzx++mMlNbE0FctCifvlt9b3ksk6TbL/UKXvsYQ==
X-ME-Sender: <xms:t5YBZVzRuI7driHgscuq5n5Ek9FBKFjdhqpAzitQrNzHIIytzorTFQ>
    <xme:t5YBZVToj-EzhTdPQbw-f8fZSq-j9QtiEfPDiESyH857Jp7r24TvjMkwk-mNLBFNW
    VoNvMKbp-1DyNw>
X-ME-Received: <xmr:t5YBZfW70VHkJGa-IYX3JAjhM5gGZkBP5K0dT4qEN3U8hoMYOPCwjCp_l5bLY_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudeikedgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffggfuvfevfhfhjggtsehgtderredttdejnecuhfhrohhmpefuihhmohhn
    ucfirghishgvrhcuoehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homheqnecuggftrfgrthhtvghrnhepgeefteejvdeugfehtdelveegvddtvdffkeetgfdv
    jefhvdffheetgfevudejjeefnecuffhomhgrihhnpehuvghfihdrohhrghdpkhgvrhhnvg
    hlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:t5YBZXiR6kWzt0g_VArN0bOI0qf1PEubr8kUpxprm3TWnC5H1IlN2Q>
    <xmx:t5YBZXCEdergEzDoPbfjTokA7suYgKs9TCmcZ7loK3B5z0MGyH1yEA>
    <xmx:t5YBZQKgLCFXmKBZvRdkDkFzMzDAf1H-N3WHicdaoOLnLRVs2HpPUQ>
    <xmx:t5YBZeNDFEKBdyleW0W1scfPaM6GYyi0EFNp82L5Ijp3iiVYlGwmWw>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <68147114-080c-1e30-f3e4-f6ad049cb2af@invisiblethingslab.com>
Date: Wed, 13 Sep 2023 13:01:39 +0200
MIME-Version: 1.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries marked as unusable when
 parsing MADT
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20230911101238.18005-1-simon@invisiblethingslab.com>
 <ZQBc4qccWlRJoDqQ@MacBook-MacBook-Pro-de-Roger.local>
Content-Language: en-US
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <ZQBc4qccWlRJoDqQ@MacBook-MacBook-Pro-de-Roger.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZkQ0EavWkoSKICkB6h2NXCKW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZkQ0EavWkoSKICkB6h2NXCKW
Content-Type: multipart/mixed; boundary="------------V0WcUxLcF4lTb94GI8nN3oi9";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <68147114-080c-1e30-f3e4-f6ad049cb2af@invisiblethingslab.com>
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries marked as unusable when
 parsing MADT
References: <20230911101238.18005-1-simon@invisiblethingslab.com>
 <ZQBc4qccWlRJoDqQ@MacBook-MacBook-Pro-de-Roger.local>
In-Reply-To: <ZQBc4qccWlRJoDqQ@MacBook-MacBook-Pro-de-Roger.local>

--------------V0WcUxLcF4lTb94GI8nN3oi9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Roger Pau Monn=C3=A9:
> On Mon, Sep 11, 2023 at 12:12:38PM +0200, Simon Gaiser wrote:
>> Up to version 6.2 Errata B [2] the ACPI spec only defines
>> ACPI_MADT_ENABLE as:
>>
>>     If zero, this processor is unusable, and the operating system
>>     support will not attempt to use it.
>>
>> The bit that later will be ACPI_MADT_ONLINE_CAPABLE is reserved with
>> "Must be zero".
>>
>> Version 6.3 [3] then adds ACPI_MADT_ONLINE_CAPABLE and changes the
>> meaning of ACPI_MADT_ENABLE:
>>
>>     Enabled
>>         If this bit is set the processor is ready for use. If this bit=

>>         is clear and the Online Capable bit is set, system hardware
>>         supports enabling this processor during OS runtime. If this bi=
t
>>         is clear and the Online Capable bit is also clear, this
>>         processor is unusable, and OSPM shall ignore the contents of t=
he
>>         Processor Local APIC Structure.
>>
>>     Online Capbable
>>         The information conveyed by this bit depends on the value of t=
he
>>         Enabled bit. If the Enabled bit is set, this bit is reserved a=
nd
>>         must be zero. Otherwise, if this this bit is set, system
>>         hardware supports enabling this processor during OS runtime.
>>
>> So with conforming firmwares it should be safe to simply ignore the
>> entry if !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE
>>
>> As a precaution against buggy firmwares this change, like Linux [4],
>> ignores ACPI_MADT_ONLINE_CAPABLE completely if MADT revision < 5. Note=

>> that the MADT revision was already increased to 5 with spec version 6.=
2
>> Errata A [1], so before introducing the online capable flag. But it
>> wasn't changed for the new flag, so this is the best we can do here.
>>
>> For previous discussion see thread [5].
>>
>> Link: http://www.uefi.org/sites/default/files/resources/ACPI%206_2_A_S=
ept29.pdf # [1]
>> Link: https://uefi.org/sites/default/files/resources/ACPI_6_2_B_final_=
Jan30.pdf # [2]
>> Link: https://uefi.org/sites/default/files/resources/ACPI_6_3_May16.pd=
f # [3]
>> Link: https://git.kernel.org/torvalds/c/e2869bd7af608c343988429ceb1c2f=
e99644a01f # [4]
>> Link: https://lore.kernel.org/xen-devel/80bae614-052e-0f90-cf13-0e5e4e=
d1a5cd@invisiblethingslab.com/ # [5]
>> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
>> ---
>>  xen/arch/x86/acpi/boot.c | 19 +++++++++++++------
>>  1 file changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
>> index 4a62822fa9..2d0b8a9afc 100644
>> --- a/xen/arch/x86/acpi/boot.c
>> +++ b/xen/arch/x86/acpi/boot.c
>> @@ -77,6 +77,17 @@ static int __init cf_check acpi_parse_madt(struct a=
cpi_table_header *table)
>>  	return 0;
>>  }
>> =20
>> +static bool __init acpi_is_processor_usable(uint32_t lapic_flags)
>> +{
>> +	if (lapic_flags & ACPI_MADT_ENABLED)
>> +		return true;
>> +
>> +	if (madt_revision >=3D 5 && (lapic_flags & ACPI_MADT_ONLINE_CAPABLE)=
)
>> +		return true;
>> +
>> +	return false;
>=20
> So this means that Xen would only support ACPI CPU Hotplug with
> versions of the MADT >=3D 5?  Because with the proposed code non enable=
d
> entries on MADT versions < 5 will be reported as unusable.
>=20
> Will this work with QEMU?  (ie: does QEMU expose a MADT table with
> version >=3D 5)  Otherwise we will loose all possible ways of testing
> ACPI CPU Hotplug.

That's a good question. I just had a look and it looks like QEMU doesn't
use the new revision (and the new flag) (yet?). (But QEMU assigns a
valid APIC ID from the start.)

So why does hotplugging works in Linux then? Turns out that I missed a
later change:

https://git.kernel.org/torvalds/c/fed8d8773b8ea68ad99d9eee8c8343bef9da2c2=
c

So they went back to (mostly) the old logic. So then the above change
isn't a good idea. It's only "mostly" the old logic because in the
meantime Linux also improved the version check, to accurately match the
version that introduced the new flag:

https://git.kernel.org/torvalds/c/a74fabfbd1b7013045afc8cc541e6cab3360ccb=
5

Simon

--------------V0WcUxLcF4lTb94GI8nN3oi9--

--------------ZkQ0EavWkoSKICkB6h2NXCKW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmUBlpYACgkQkO9xfO/x
ly+Vjw/8DmnSmZMfqBD+TpZi5aztYC9mNnl/ODu0B927CjzuBfhHLEErGbWu5BoC
tPTc1tezbt3Ve3dRzKI06JHgrjDt4VfxMhtHwQegdnPqkOAbU38IjBTqPv2ryvyv
CRMcgQ2u5P8S68o6iQr4wZq3HsuWlgz3Fw1Z15ws7c6SUlimBE0kb5nx52buQqaM
aUdUvvEW5WiGcU8w0I+kKq+tjYEczQA73K5TUybbHn2TNSHks+YhMFHo4QrXgbIa
Vi6+BKrGfbJsBehdCfk8ApxakUkessVjtO0zbIRNyGuqtcNsWpxKLg8eODbddeGa
FUhZKbHblGOA221W5O+GZ4gmRc9VMV2IUbVYQuk3PtRejGrrdw183xfNa0RKGzSe
jH2GveZU2fxWQskwvJxxe+fNKe/8TzSOjQ7xTkrkw+I2gc3zVVVuk7j8TooofNsk
1R/5UEzV+D/rW52Gr8KXzzTA/u6byjpyNSCkSleS0AHoCcyfZ2luXeJ7nNAvAq/K
Mkswj69JPi4XnILXMz1LKEZh7UOvGwlva0L68YwO0h8uxIqKfhWFjemmzmSlRxZr
07nPVspbSzSCljgqjbIbwYzqCUUli9FsyfbiDiAAayPKqxWyHLKZkqnItihnWekU
ykkbhAa3xQYL5yUzqLd0zC8FfLZ9FcNwRJhJQ0rRFKNV0sR+US8=
=icWL
-----END PGP SIGNATURE-----

--------------ZkQ0EavWkoSKICkB6h2NXCKW--

