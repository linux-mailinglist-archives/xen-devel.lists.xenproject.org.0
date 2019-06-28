Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A345A3C4
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 20:35:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgvez-0004Pi-Qg; Fri, 28 Jun 2019 18:31:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Pu4=U3=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hgvey-0004Pd-MJ
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 18:31:44 +0000
X-Inumbo-ID: f947b4ea-99d2-11e9-8980-bc764e045a96
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f947b4ea-99d2-11e9-8980-bc764e045a96;
 Fri, 28 Jun 2019 18:31:42 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a14so11869578edv.12
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jun 2019 11:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=27b1W/OB8zfhYOMnu+sHkZATrGyjlvVycI6BCIPbkps=;
 b=UOMwsnjOot6BQb82m2IAQtKm6cDPjvB+cUgwIayj+ya/tryNHQy/tLo9OAULTfey1y
 fkh3+xISiKprdh+Yf8hEprXvpSQfSfzpWRYpCqaOPa+uAyzRWC1qBr5MxtGVutE7PFht
 Rk28/JA22Ji8zbK/JACjIignuJl3eoaT++CfPMdTbhrc8CYmY/CWw0+XXaItRKQoJxgE
 AE1NEKLz2fojh0aXBZ5coo+Odei2GyNGLhDdJksEZ5HMcmxITtXXC8d4L8Y+AOKYMpeB
 lyXbw7W8Ftj7oOr+s1KtEwbvDEFf15PE92m4U0r/y66y9StUnn55jXOhBbaQBWlN+WeS
 wXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=27b1W/OB8zfhYOMnu+sHkZATrGyjlvVycI6BCIPbkps=;
 b=klhY0+sXQhGTmawCHPoIuHfGoHdVZMqw3s7SeI3E6IGY3noZmPeqjI/jDRzp5yp84E
 nxK6GbNWvZq6ZcO3ed8VMWfsr89oN24AbpeSaOv0kiVfvLCqEipvsu9L2970ZGJxSWBx
 YRVkQgkWY7+2Jj8NJUz/5NHNOvOy212db51CdhGcAUtB0Xe84YIv6DG7lIE4Rqzp66cZ
 U4rZuSsz8hZO/DMONU90YgeJ/ZeKZFVxErY6VMqqr+gTV0wwnivEvxPsFXw5jYVF/FWG
 22h/HqnI+pByQ71/6Gu8+MmuvbBGESsMosTRS0+pqZHO32vgKFQtlc/cOUiwVDQ4jo9M
 sSvg==
X-Gm-Message-State: APjAAAUjwNqFgW4bDMQczzqYxOOiebI6aeEY0kS6BhDIFERPXFNYyEFu
 G0+tuuNiVsdUBd9NZXQL140=
X-Google-Smtp-Source: APXvYqzdL2eNuBNOZc2Kv0drVvCjQquMAVFH/OOkQeFPt/aValZD9Cmu5guWHqG3zU/wWEJUnf6mtA==
X-Received: by 2002:a17:906:1252:: with SMTP id
 u18mr10046255eja.13.1561746701006; 
 Fri, 28 Jun 2019 11:31:41 -0700 (PDT)
Received: from ?IPv6:2001:16b8:66b0:9f00:1e4b:d6ff:fef9:46e6?
 (200116b866b09f001e4bd6fffef946e6.dip.versatel-1u1.de.
 [2001:16b8:66b0:9f00:1e4b:d6ff:fef9:46e6])
 by smtp.gmail.com with ESMTPSA id k13sm572953ejv.74.2019.06.28.11.31.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 11:31:40 -0700 (PDT)
To: Iain Hunter <drhunter95@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <ed5ec761-ec79-1c5a-0b88-f20bfb99cead@gmail.com>
 <c9cd784e-ecf3-c442-5b70-e4ca43ce6b64@gmail.com>
 <alpine.DEB.2.21.1906271730410.5851@sstabellini-ThinkPad-T480s>
 <CALC81-szbJK1xx--gqt-fDUQYN+_-WNdLeXi-Cut-wXRfFsFsQ@mail.gmail.com>
 <alpine.DEB.2.21.1906280901120.5851@sstabellini-ThinkPad-T480s>
 <CALC81-sX7Coj9Lg_zkeRxCTDvLQKc6iABtTfJQP53heCOsA85Q@mail.gmail.com>
From: Denis Obrezkov <denisobrezkov@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=denisobrezkov@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0a7e9f5f-3b82-52d3-6d18-c60aa7e6e8a6@gmail.com>
Date: Fri, 28 Jun 2019 20:31:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CALC81-sX7Coj9Lg_zkeRxCTDvLQKc6iABtTfJQP53heCOsA85Q@mail.gmail.com>
Subject: Re: [Xen-devel] xen on beagleboard-x15: fails to access PRCM MPU
 register
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>, Hunyue Yau <hy-gsoc@hy-research.com>
Content-Type: multipart/mixed; boundary="===============2830365710869793991=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2830365710869793991==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iEdzEhWINqQlbOutW3oBznsVyAIl5Ek8h"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iEdzEhWINqQlbOutW3oBznsVyAIl5Ek8h
Content-Type: multipart/mixed; boundary="bhXZw8kc9Tr1UtBL7xF6M0E2woH84BIy9";
 protected-headers="v1"
From: Denis Obrezkov <denisobrezkov@gmail.com>
To: Iain Hunter <drhunter95@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>, Hunyue Yau <hy-gsoc@hy-research.com>
Message-ID: <0a7e9f5f-3b82-52d3-6d18-c60aa7e6e8a6@gmail.com>
Subject: Re: xen on beagleboard-x15: fails to access PRCM MPU register
References: <ed5ec761-ec79-1c5a-0b88-f20bfb99cead@gmail.com>
 <c9cd784e-ecf3-c442-5b70-e4ca43ce6b64@gmail.com>
 <alpine.DEB.2.21.1906271730410.5851@sstabellini-ThinkPad-T480s>
 <CALC81-szbJK1xx--gqt-fDUQYN+_-WNdLeXi-Cut-wXRfFsFsQ@mail.gmail.com>
 <alpine.DEB.2.21.1906280901120.5851@sstabellini-ThinkPad-T480s>
 <CALC81-sX7Coj9Lg_zkeRxCTDvLQKc6iABtTfJQP53heCOsA85Q@mail.gmail.com>
In-Reply-To: <CALC81-sX7Coj9Lg_zkeRxCTDvLQKc6iABtTfJQP53heCOsA85Q@mail.gmail.com>

--bhXZw8kc9Tr1UtBL7xF6M0E2woH84BIy9
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Iain,

On 6/28/19 7:25 PM, Iain Hunter wrote:
> Hi Stefano,
> It was a patchset I'd circulated earlier in the GSoC process.
> Basically the partial port of Xen on X15 I'd done last year. The build
> script is the reference for which patches were actually used.
> Iain
I believe the reason we haven't started from trying your patch was that
I thought that since you hadn't used smp your solution might not work in
our case, since we want to have smp (I was probably wrong).
I think I should reproduce all the issues step-by-step that Iain faced
and apply his patches where they are required (otherwise it would be
hard for me to understand what's happening).

Stefano, Julien?
>=20
> On Fri, 28 Jun 2019 at 17:02, Stefano Stabellini <sstabellini@kernel.or=
g> wrote:
>>
>> Hi Iain,
>>
>> Where is the patch you mentioned? Maybe you forgot to attach it to the=

>> email?
>>
>> Cheers,
>>
>> Stefano
>>
>> On Fri, 28 Jun 2019, Iain Hunter wrote:
>>> Stefano, Denis,
>>>
>>> I achieved that with patch
>>> patches/xen/0003-add-PRCM_MPU-to-memory-translation-for-AM572x.patch.=

>>> This just adds
>>>  .specific_mapping=3Domap5_specific_mapping
>>> to DRA7 platform.
>>>
>>> Iain
>>>
>>> On Fri, 28 Jun 2019 at 01:33, Stefano Stabellini <sstabellini@kernel.=
org> wrote:
>>>>
>>>> Writing here a summary of the follow-up discussion on IRC.
>>>>
>>>> This is due to a magic memory region, not described in the device tr=
ee,
>>>> being accessed by Linux. The memory region is 0x48243400 - 0x4824340=
0+512.
>>>>
>>>> To fix problems like this one, we have the platform specific files i=
n
>>>> xen: see the files under xen/arch/arm/platforms/. Specifically, omap=
5.c
>>>> might be a good model for what we need. Look at the
>>>> omap5_specific_mapping function, which does exactly what the name
>>>> suggests: it maps special MMIO regions into the guest.
>>>>
>>>>  /* Additional mappings for dom0 (not in the DTS) */
>>>>  static int omap5_specific_mapping(struct domain *d)
>>>>  {
>>>>      /* Map the PRM module */
>>>>      map_mmio_regions(d, gaddr_to_gfn(OMAP5_PRM_BASE), 2,
>>>>                       maddr_to_mfn(OMAP5_PRM_BASE));
>>>>
>>>>      /* Map the PRM_MPU */
>>>>      map_mmio_regions(d, gaddr_to_gfn(OMAP5_PRCM_MPU_BASE), 1,
>>>>                       maddr_to_mfn(OMAP5_PRCM_MPU_BASE));
>>>>
>>>>      /* Map the Wakeup Gen */
>>>>      map_mmio_regions(d, gaddr_to_gfn(OMAP5_WKUPGEN_BASE), 1,
>>>>                       maddr_to_mfn(OMAP5_WKUPGEN_BASE));
>>>>
>>>>      /* Map the on-chip SRAM */
>>>>      map_mmio_regions(d, gaddr_to_gfn(OMAP5_SRAM_PA), 32,
>>>>                       maddr_to_mfn(OMAP5_SRAM_PA));
>>>>
>>>>      return 0;
>>>>  }
>>>>
>>>> We need something similar for 0x48243400 - 0x48243400+512 on
>>>> Beagleboard.
>>>>
>>>>
>>>> On Thu, 27 Jun 2019, Denis Obrezkov wrote:
>>>>> CC'ed other GSoC mentors
>>>>>
>>>>> On 6/27/19 9:52 PM, Denis Obrezkov wrote:
>>>>>> Hello all,
>>>>>>
>>>>>> I have a failure when I am trying to boot Linux with Xen on bb-x15=
, here
>>>>>> is the log:
>>>>>> https://pastebin.com/BBAFPkVU
>>>>>>
>>>>>> and, as Julien (cc'ed) suggested here is the DT debug information =
for xen:
>>>>>> https://drive.google.com/open?id=3D15YTsCKYUTbG2i-siWezJXKWuG0H1Vf=
Qz
>>>>>>
>>>>>> So, what I was able to figure out:
>>>>>> In omap4_prminst_read_inst_reg it tries to read from _prm_bases[pa=
rt].va
>>>>>> (arch/arm/mach-omap2/prminst44xx.c).
>>>>>> _prm_bases[part].va has a value of prm_base or prcm_mpu_base depen=
ding
>>>>>> on part value(arch/arm/mach-omap2/prminst44xx.c:44)
>>>>>> Failure happens when _prm_bases[OMAP4430_PRCM_MPU_PARTITION] is re=
ad.
>>>>>> It's value set up in arch/arm/mach-omap2/prcm_mpu44xx.c:54.
>>>>>> The installed value is obtained with OMAP_L4_IO_ADDRESS macro
>>>>>> (mach_omap2/io.c:667). Here is its definition (arch/arm/mach_omap2=
/iomap.h):
>>>>>> #define OMAP2_L4_IO_OFFSET  0xb2000000
>>>>>> #define OMAP2_L4_IO_ADDRESS(pa) IOMEM((pa) + OMAP2_L4_IO_OFFSET) /=
* L4 */
>>>>>>
>>>>>> and IOMEM (arch/arm/include/asm/io.h):
>>>>>> #define IOMEM(x)    ((void __force __iomem *)(x))
>>>>>>
>>>>>> I don't understand what is happening and how to overcome it.
>>>>>>
>>>>>
>>>>> --
>>>>> Regards, Denis Obrezkov
>>>>>
>>>>>
>>>

--=20
Regards, Denis Obrezkov


--bhXZw8kc9Tr1UtBL7xF6M0E2woH84BIy9--

--iEdzEhWINqQlbOutW3oBznsVyAIl5Ek8h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEAREIAB0WIQTG5lj1j5VIuKBD/kz7iQsTJJ7s+QUCXRZc/gAKCRD7iQsTJJ7s
+WkiAQCZtG8w1pjbqtPtgqiE1qdMKC1x0a2tMMZEPqu7sw3QtgEA5g9CNGDGQnBf
Ep3jgN2J6hhSjO7/IVQE03mC0/Gd1us=
=AoWj
-----END PGP SIGNATURE-----

--iEdzEhWINqQlbOutW3oBznsVyAIl5Ek8h--


--===============2830365710869793991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2830365710869793991==--

