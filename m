Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2079758B31
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 21:55:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgaS0-00019W-3V; Thu, 27 Jun 2019 19:52:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ljtp=U2=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hgaRy-00019R-M6
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 19:52:54 +0000
X-Inumbo-ID: 25ce8702-9915-11e9-8980-bc764e045a96
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 25ce8702-9915-11e9-8980-bc764e045a96;
 Thu, 27 Jun 2019 19:52:52 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id i11so8298130edq.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2019 12:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:openpgp:autocrypt:message-id:date:user-agent
 :mime-version; bh=lS84Eza522/oQiQTZ77ozU6vaDnIo/Po71AFD8g/jX8=;
 b=ZVcrwO0FSdyeICHO4vpbtgs2fPIPVNX9/ayMZ3xLS5+kgSErH2eyBCijplcp7LwreU
 ++h4L1DRV7kUH/Pamtg4aAVvaz+JYtp+dpYoR55KFOn+APKC+4Azb4wz8oSEt7mlbAow
 gcMdOga0H5N7btdXWWg7lc4Rg9K4RvjfdOb4yvhfKEEwryDUAvydlZnPro4qLOBeR8s7
 3pLSBqVVXP5ooRgr4sXXUkIegbS2AIMBqexIXR7IuVPRJXxd4ji/P3RYtc5wvIj0PuuN
 YRtt0yDbtgeS53gxCXqlVSziYdwWNv6DIx0+uApZ/P8ln2fuvCu8gXvgZ7SSOC9toqqE
 TtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:openpgp:autocrypt:message-id
 :date:user-agent:mime-version;
 bh=lS84Eza522/oQiQTZ77ozU6vaDnIo/Po71AFD8g/jX8=;
 b=Qnme+QE+QHpbPm1v5wx8rLSivEtHqJSheoOkiWRoQDXFaOL1oxuxTUDuBrTWVsNDoE
 bo5/yPYSWk92IeuC63gzWH5I+SC/XJWIsC6iGjVdsbQpnRLXOZJVf3cOEWbDYxJyEecJ
 E5/A4fQx+ly9vKD92DVHM0WzWekylXGb0sgw0Wqlo5JNW+3GN2beERguSLviYnVNyhBe
 rdMDkjgLDDLazWofKxoeEAcGV5fM3bB8UHAOuc20JTCExVGB7zGDfdD8tGXf7BWA9xsy
 t3PPRE94SOsLLK9Dy5EWcSTIsLaZLS+NYyckzHXi2kQlKl9orK7Piecjx3vVUYHEP9wi
 y7wQ==
X-Gm-Message-State: APjAAAXIjepmob9vwPPnPnsJDMkTICMa/jx2BLyyyGBFV4qUgE5hpiqR
 a+DdmqX5CKfX/hwfqzlmQmC+gr6D
X-Google-Smtp-Source: APXvYqwkJX9VQBV5pjOkP5hvsmwVqeJocnaR0L+7KX91FQF9jVEQKjF84lu0B+FmnHGdwpj7RcXfnA==
X-Received: by 2002:a17:906:9609:: with SMTP id
 s9mr996406ejx.233.1561665171347; 
 Thu, 27 Jun 2019 12:52:51 -0700 (PDT)
Received: from ?IPv6:2001:16b8:66e7:2e00:1e4b:d6ff:fef9:46e6?
 (200116b866e72e001e4bd6fffef946e6.dip.versatel-1u1.de.
 [2001:16b8:66e7:2e00:1e4b:d6ff:fef9:46e6])
 by smtp.gmail.com with ESMTPSA id g11sm1641ejm.86.2019.06.27.12.52.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 12:52:50 -0700 (PDT)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>
From: Denis Obrezkov <denisobrezkov@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=denisobrezkov@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ed5ec761-ec79-1c5a-0b88-f20bfb99cead@gmail.com>
Date: Thu, 27 Jun 2019 21:52:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Subject: [Xen-devel] xen on beagleboard-x15: fails to access PRCM MPU
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
Content-Type: multipart/mixed; boundary="===============4167562535621835907=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4167562535621835907==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7BDGbD1SSD5VV6XfkhFloXuhMwrSBlRxC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7BDGbD1SSD5VV6XfkhFloXuhMwrSBlRxC
Content-Type: multipart/mixed; boundary="emveamzpeeBiuM5v121G3iDe1aKmansw5";
 protected-headers="v1"
From: Denis Obrezkov <denisobrezkov@gmail.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>
Message-ID: <ed5ec761-ec79-1c5a-0b88-f20bfb99cead@gmail.com>
Subject: xen on beagleboard-x15: fails to access PRCM MPU register

--emveamzpeeBiuM5v121G3iDe1aKmansw5
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello all,

I have a failure when I am trying to boot Linux with Xen on bb-x15, here
is the log:
https://pastebin.com/BBAFPkVU

and, as Julien (cc'ed) suggested here is the DT debug information for xen=
:
https://drive.google.com/open?id=3D15YTsCKYUTbG2i-siWezJXKWuG0H1VfQz

So, what I was able to figure out:
In omap4_prminst_read_inst_reg it tries to read from _prm_bases[part].va
(arch/arm/mach-omap2/prminst44xx.c).
_prm_bases[part].va has a value of prm_base or prcm_mpu_base depending
on part value(arch/arm/mach-omap2/prminst44xx.c:44)
Failure happens when _prm_bases[OMAP4430_PRCM_MPU_PARTITION] is read.
It's value set up in arch/arm/mach-omap2/prcm_mpu44xx.c:54.
The installed value is obtained with OMAP_L4_IO_ADDRESS macro
(mach_omap2/io.c:667). Here is its definition (arch/arm/mach_omap2/iomap.=
h):
#define OMAP2_L4_IO_OFFSET  0xb2000000
#define OMAP2_L4_IO_ADDRESS(pa) IOMEM((pa) + OMAP2_L4_IO_OFFSET) /* L4 */=


and IOMEM (arch/arm/include/asm/io.h):
#define IOMEM(x)    ((void __force __iomem *)(x))

I don't understand what is happening and how to overcome it.

--=20
Regards, Denis Obrezkov


--emveamzpeeBiuM5v121G3iDe1aKmansw5--

--7BDGbD1SSD5VV6XfkhFloXuhMwrSBlRxC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEAREIAB0WIQTG5lj1j5VIuKBD/kz7iQsTJJ7s+QUCXRUekQAKCRD7iQsTJJ7s
+f7PAQCgG4z1bCNOtx2G8q+eoxFsW0VJ+9XYXWdJV1GtIFKtCQD/RKkxXvV1t7Js
L+FTZVtKsvSrX+65Q3M8qDCOsgNIYoY=
=DRgs
-----END PGP SIGNATURE-----

--7BDGbD1SSD5VV6XfkhFloXuhMwrSBlRxC--


--===============4167562535621835907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4167562535621835907==--

