Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CE34C36D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 00:08:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdij0-0004rF-1c; Wed, 19 Jun 2019 22:06:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9VwC=US=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hdiiy-0004r8-CB
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 22:06:36 +0000
X-Inumbo-ID: 803ae052-92de-11e9-8980-bc764e045a96
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 803ae052-92de-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 22:06:35 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k21so1507949edq.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2019 15:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=Baw6yv8Jna8i/y04S5kV8V6fg6+FiJA+Uw2KNDz/zAc=;
 b=cw6OAPFTPFgGFx+ivyHtFspvv3eVuEpmMpdNRxKLF2zHK1CCVcXI869KG+zV4IOJ2U
 RT4fa5tDRVMZZ4NoZR3/K0UOQRI0r3el63ZrOJ+r81HOo9J/hSgbhuuXjEHrQFLuYkjX
 7lNHzoT09zOxcZJvsoQJxz2HrnSuPGPUFtvwawhojb3Jo7Yra+9N5I92s+rIE6mr3IFz
 0plx5og+3C+DP6PTL9Fajdu0M0u+/bnZdQvyvj3hVkRjFg1F2/1Eav9Lerud8bwEAXGS
 3Juk8iS4+N9KMo5zq/rDRgR+UUbLkukqqGwvMiqwuyRqYq66tv9K3faFzohCiNKlCSbm
 zssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=Baw6yv8Jna8i/y04S5kV8V6fg6+FiJA+Uw2KNDz/zAc=;
 b=ZtiUwCfmXwfSt1NVYuAwqG4Iw8FgjD1ARrIae/bfdppgnleR6ROhw6bWwwIhHcjkHt
 XFyEfvQLjKE1qae0WQp5NvIzUwM6IaSWSIYwaApQROt3aNgbGS+7InYzdGVR47AQFNQE
 UUK4IrCgfBkOeuMDOckEIotfp2ZN3T6Oel3gfAZWQHdHKn+fYEbONoIWw7FyEXZg6AB/
 JSlC0h+p759LhR6xRp2UG8gAFLacI/8+HrR2Nbf/akCIh5SsBiauXnSnXJpFUL0fGkFo
 SO8s64dfylfgqXTYX6h14KJLY+GH2bRz3CSm0jjuVmaey/AFm8Is3IVgVg/GHCePdwL4
 hH+g==
X-Gm-Message-State: APjAAAU9O5QmLDUtrSKTnuObqZagB59sZhQlzsGBAZSLlMFmnHGaSd8g
 a8yTTOkJSLz+kXaeziHTkdl/T5wrqx0=
X-Google-Smtp-Source: APXvYqzRrnRTXWJ2sJCtnd7/4xcar2SIJTgT+4Llx5ZLIbWO/d6TtWk/Zbz4VIruI3nvD/AVyu7Z2w==
X-Received: by 2002:aa7:d1da:: with SMTP id g26mr30434034edp.198.1560981993729; 
 Wed, 19 Jun 2019 15:06:33 -0700 (PDT)
Received: from ?IPv6:2001:16b8:66da:e100:1e4b:d6ff:fef9:46e6?
 (200116b866dae1001e4bd6fffef946e6.dip.versatel-1u1.de.
 [2001:16b8:66da:e100:1e4b:d6ff:fef9:46e6])
 by smtp.gmail.com with ESMTPSA id f3sm3466362ejc.15.2019.06.19.15.06.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 15:06:32 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>
References: <287117b9-952c-1a92-26e0-9597df936c27@gmail.com>
 <62194faf-0bf8-61b8-a69f-e41934fb5a43@arm.com>
 <0c900a15-14ab-9947-bffe-2fbeed176486@gmail.com>
 <CALC81-vaVKgZoi27MauGTxjda8mchy5GRLipu5z=v1vh9fyvAg@mail.gmail.com>
 <747dd124-3511-f010-dac7-b9b23d7b44ad@gmail.com>
 <CALC81-tewzAtaaH94U1nVc-UiacR_YvqhaYcPXtXcviTFHAG8A@mail.gmail.com>
 <ecb2cf41-51e5-2ff2-5e61-72be64399e40@arm.com>
 <AM6PR0302MB32215CD7FAED139C682D92A386EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <ef82a028-9e4e-9976-d205-42cbc4bfc8ac@arm.com>
 <AM6PR0302MB3221D649900B54C2FFA7003A86EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <AM6PR03MB49190A0828A49569B64611B4E6EA0@AM6PR03MB4919.eurprd03.prod.outlook.com>
 <07a7084a-b798-0cc7-cca4-3fe58ea95835@arm.com>
 <666fc807-af6a-231c-9d7e-48ecabb07371@gmail.com>
 <2c0cced8-27ec-a3bb-b2bf-c037176a162a@arm.com>
 <4a2ae4d4-493a-d5f6-64da-1da313db3962@gmail.com>
 <CAGPpAzUpeFEmFX9FMkQDn+2gWnL1GmyEsL49DPLxWKBQ=_W0Eg@mail.gmail.com>
 <8f6fafd5-6cab-b57c-b68b-ceb0ec88cfb2@arm.com>
From: Denis Obrezkov <denisobrezkov@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=denisobrezkov@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <7733e21c-a94a-e8f0-c25e-0b6b765b1672@gmail.com>
Date: Thu, 20 Jun 2019 00:06:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8f6fafd5-6cab-b57c-b68b-ceb0ec88cfb2@arm.com>
Subject: Re: [Xen-devel] Starting to port xen on beagleboard-x15 (GSoC 2019
 project)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Hunyue Yau <hy-gsoc@hy-research.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Iain Hunter <drhunter95@gmail.com>, Andre Przywara <andre.przywara@arm.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============7462400243954476239=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7462400243954476239==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Ld49rJkeKDl3KgF3AbTXXvtqWiru7SPMM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Ld49rJkeKDl3KgF3AbTXXvtqWiru7SPMM
Content-Type: multipart/mixed; boundary="EuBMFRvCT3P47nFzqRN66yzf3e99FIGQy";
 protected-headers="v1"
From: Denis Obrezkov <denisobrezkov@gmail.com>
To: Julien Grall <julien.grall@arm.com>
Cc: Hunyue Yau <hy-gsoc@hy-research.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Iain Hunter <drhunter95@gmail.com>, Andre Przywara <andre.przywara@arm.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <7733e21c-a94a-e8f0-c25e-0b6b765b1672@gmail.com>
Subject: Re: [Xen-devel] Starting to port xen on beagleboard-x15 (GSoC 2019
 project)
References: <287117b9-952c-1a92-26e0-9597df936c27@gmail.com>
 <f3596bd5-ede3-7299-e28f-033ad32e6c99@gmail.com>
 <62194faf-0bf8-61b8-a69f-e41934fb5a43@arm.com>
 <0c900a15-14ab-9947-bffe-2fbeed176486@gmail.com>
 <CALC81-vaVKgZoi27MauGTxjda8mchy5GRLipu5z=v1vh9fyvAg@mail.gmail.com>
 <747dd124-3511-f010-dac7-b9b23d7b44ad@gmail.com>
 <CALC81-tewzAtaaH94U1nVc-UiacR_YvqhaYcPXtXcviTFHAG8A@mail.gmail.com>
 <ecb2cf41-51e5-2ff2-5e61-72be64399e40@arm.com>
 <AM6PR0302MB32215CD7FAED139C682D92A386EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <ef82a028-9e4e-9976-d205-42cbc4bfc8ac@arm.com>
 <AM6PR0302MB3221D649900B54C2FFA7003A86EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <AM6PR03MB49190A0828A49569B64611B4E6EA0@AM6PR03MB4919.eurprd03.prod.outlook.com>
 <07a7084a-b798-0cc7-cca4-3fe58ea95835@arm.com>
 <666fc807-af6a-231c-9d7e-48ecabb07371@gmail.com>
 <2c0cced8-27ec-a3bb-b2bf-c037176a162a@arm.com>
 <4a2ae4d4-493a-d5f6-64da-1da313db3962@gmail.com>
 <CAGPpAzUpeFEmFX9FMkQDn+2gWnL1GmyEsL49DPLxWKBQ=_W0Eg@mail.gmail.com>
 <8f6fafd5-6cab-b57c-b68b-ceb0ec88cfb2@arm.com>
In-Reply-To: <8f6fafd5-6cab-b57c-b68b-ceb0ec88cfb2@arm.com>

--EuBMFRvCT3P47nFzqRN66yzf3e99FIGQy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 6/19/19 5:06 PM, Julien Grall wrote:
>=20
>=20
> On 19/06/2019 15:33, Denis Obrezkov wrote:
>> Hi,
>=20
> Hi Denis,
>=20
>> =D1=81=D1=80, 19 =D0=B8=D1=8E=D0=BD. 2019 =D0=B3. =D0=B2 14:01, Andrii=
 Anisov <andrii.anisov@gmail.com>:
>>>
>>>
>>>
>>> On 18.06.19 19:19, Julien Grall wrote:
>>>> Denis (the author of the thread) is doing a GSOC to port Xen on the
>>>> BeagleBoard X15. You ended up CCed because you can provide feedback
>>>> how to proceed. Not because we wanted you to implement it...
>>>
>>> OK then.
>>>
>>> Denis,
>>>
>>> Feel free to contact me in case you need clarifications about the stu=
ff.
>> thank you
>>>
>>> --=20
>>> Sincerely,
>>> Andrii Anisov.
>=20
> Don't forget to strip unnecessary bits of the e-mail you quote :).
>=20
>>
>> So, right now I get a bit further and it seems that CPU1 was switched
>> to hyp mode:
>> https://github.com/embeddedden/xen/commit/2d76ae7aacb7c0ea7312eaddb91c=
3eb1e1963cc9
>>
>=20
> Nice to see some progress here! :)
>=20
> Just to keep record of the discussion on IRC:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0- omap5_init_secondary is the entry point to Xe=
n and SMC #0 is
> called right after. There are nothing in r2-r12 that we care about, so
> there are no need to save/restore them. On a side note, you could not
> use sp because we don't know the value stored in it. So you may rewrite=

> Xen (or any other modules).
> =C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0- From the pastebin "(XEN) Generic Timer IRQ: p=
hys=3D30 hyp=3D26 virt=3D27
> Freq: 0 KHz". It looks like the register CNTFREQ is not configured
> correctly on the CPU. Looking at Linux, they have code to setup CNTFRQ
> (set_cntfrq) for all the CPUs (see realtime_counter_init in
> arch/arm/mach-omap2/timer.c and omap4_secondary_init in
> arch/arm/mach-omap2/omap-smp.c).
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 In the case of Xen, I think we want to c=
all set_cntfreq in
> omap5_init_time() for the boot CPU. For the secondary CPUs, we may need=

> to introduce a callback in struct platform_desc to be called during
> secondary startup.
>=20
> Lastly, please clean-up the code and send the patch on xen-devel. I wil=
l
> have a closer look at that time. Feel free to ping me on IRC if you hav=
e
> any doubt how to proceed.
Ok, I will read xen code guideline and send the patch.
>=20
>> and the output:
>> https://pastebin.com/3JBw6S4K
>=20
> (XEN) *** LOADING DOMAIN 0 ***
> (XEN) Missing kernel boot module?
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Could not set up DOM0 guest OS
> (XEN) ****************************************
>=20
> You probably haven't set up the Dom0 kernel here. Check you u-boot rune=
s
> for this.
So, I configured dtb and got:
https://pastebin.com/uDYiGsHL
So, it seems that timer interrupts don't work for now.

--=20
Regards, Denis Obrezkov


--EuBMFRvCT3P47nFzqRN66yzf3e99FIGQy--

--Ld49rJkeKDl3KgF3AbTXXvtqWiru7SPMM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEAREIAB0WIQTG5lj1j5VIuKBD/kz7iQsTJJ7s+QUCXQqx4gAKCRD7iQsTJJ7s
+REVAP9u80AyA5ImaU1C1gc5CotkR6BPjf9ognCOPVqWNsk2ugD/amONrGirHi7e
hDb3GhlGm9Y3KQyelQYEKwbWoI8Sp/c=
=4aoW
-----END PGP SIGNATURE-----

--Ld49rJkeKDl3KgF3AbTXXvtqWiru7SPMM--


--===============7462400243954476239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7462400243954476239==--

