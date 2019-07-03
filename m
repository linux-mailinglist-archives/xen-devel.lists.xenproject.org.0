Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FF95E7F3
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 17:36:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hihHA-0001lT-8h; Wed, 03 Jul 2019 15:34:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kb/0=VA=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hihH9-0001lO-1k
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 15:34:27 +0000
X-Inumbo-ID: 096573d9-9da8-11e9-8980-bc764e045a96
Received: from mail-ed1-x532.google.com (unknown [2a00:1450:4864:20::532])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 096573d9-9da8-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 15:34:25 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id a14so2495499edv.12
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2019 08:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:openpgp:autocrypt:message-id:date:user-agent
 :mime-version; bh=/JdFUKEZAaLYSleJgOqn1W0HzYOg9X4jx5eKYWDSb4A=;
 b=rYgUW0/WobxTUE+EgXJj76wRWZyv3UYNqS9GnG3MUmyqzLsunPStJt+/g94VZ6Vk/W
 7/j9B1jMGWwR67SvA4XnOSKBpvxvH9hM92NMVzyGZUA3gekxWmS7pT/v+6k85GG0C519
 RWJP9X8ZkKd3sl0Csi7Hs8d03rBR8Qb2zUg/cRf9//s6TTIfCVVo8aRxOrwOToHb6KL8
 GH3gOlSS91Wf1QG9OhyvMroiRfX9jI1iYhlp7C2IMOnz4p05Dbu/4QeIdtr8+SIz8W3f
 FJr7T6IWOE0+rlQwnyBxYUzhrf9glaejZ4lIu4aYcLZpPuLZYM7QVSJcDxg0ZjOJeJWI
 uiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:openpgp:autocrypt:message-id
 :date:user-agent:mime-version;
 bh=/JdFUKEZAaLYSleJgOqn1W0HzYOg9X4jx5eKYWDSb4A=;
 b=pGoK/WPhDIKBIEAoX1vTq8vQFbNvjOhs+/mCOTr+Kmu4qjh39sRMwnBDLLrgDUTSJa
 3VhNTdNl1d9kvydjlBAygWtQ0DgTa5YiHP+FwQXkr+ZJrtKeji8c+sS/doVJ46Hq+MDP
 xigNjG2ERkRQEbS2ZIk2SW/50PO12M25fZbxl5LDhJ7E5QTzDhluUYW0UmjyJliqg/nx
 HFYS67UE7TymMcrgd/Gl/o5cs2J4KtmXM/LepA7aOClBBX7UyrM6NkqnJnzAmywUSYa/
 /VqsBzR1OBpjkDiMhpl7xIfUBakBTDSk/0KXTwRS2I4gUas9YVEHLG9yjEpjsINq5UuB
 16lg==
X-Gm-Message-State: APjAAAWszaISTvt3is8IWhtIi0SheyzkWCjCyrLzselUB4GhpvYY3NZ/
 uUpPezaltAX8hfqleYmV1oI=
X-Google-Smtp-Source: APXvYqxr9NTc9u5ZyZldXxiAygWSUW90Qzd46pTOScRnLPwCTZ6UMNdmeeEtCaeySFgFHFso/MguDA==
X-Received: by 2002:a50:f091:: with SMTP id v17mr42968750edl.254.1562168064165; 
 Wed, 03 Jul 2019 08:34:24 -0700 (PDT)
Received: from ?IPv6:2001:16b8:6623:cc00:1e4b:d6ff:fef9:46e6?
 (200116b86623cc001e4bd6fffef946e6.dip.versatel-1u1.de.
 [2001:16b8:6623:cc00:1e4b:d6ff:fef9:46e6])
 by smtp.gmail.com with ESMTPSA id y19sm809880edd.34.2019.07.03.08.34.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 08:34:23 -0700 (PDT)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Iain Hunter <drhunter95@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, Hunyue Yau <hy-gsoc@hy-research.com>
From: Denis Obrezkov <denisobrezkov@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=denisobrezkov@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <4ec41ede-a8cb-6724-aa88-254387b2aa15@gmail.com>
Date: Wed, 3 Jul 2019 17:34:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Subject: [Xen-devel] [GSOC-2019] Problem with initializing crossbar on
 bb-x15 in dom0
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
Content-Type: multipart/mixed; boundary="===============4873474943939725313=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4873474943939725313==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pdgqiHpBlf5i4k0rTaM0fFjWIvud5Lcxm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pdgqiHpBlf5i4k0rTaM0fFjWIvud5Lcxm
Content-Type: multipart/mixed; boundary="NDt6pRP2iAKFweES6wYDsQJv9stMGmYeH";
 protected-headers="v1"
From: Denis Obrezkov <denisobrezkov@gmail.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Iain Hunter <drhunter95@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, Hunyue Yau <hy-gsoc@hy-research.com>
Message-ID: <4ec41ede-a8cb-6724-aa88-254387b2aa15@gmail.com>
Subject: [GSOC-2019] Problem with initializing crossbar on bb-x15 in dom0

--NDt6pRP2iAKFweES6wYDsQJv9stMGmYeH
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello,
I am trying to run xen and I have a problem:
https://pastebin.com/U0gch9us on line 190-193

So, it seems that Linux can't discover the irq domaing for crossbar
interrupt controller when running in dom0, but it has no problem when
running baremetal.

Here is the DT log with xen:
https://drive.google.com/open?id=3D15YTsCKYUTbG2i-siWezJXKWuG0H1VfQz
(an older version with another mistake)  It can be seen that external
interrupts are connected to the crossbar interrupt controller.

I found some information about irq domains and crossbars:
https://www.kernel.org/doc/Documentation/IRQ-domain.txt

it seems to me that it is possible to give control on the crossbar to
dom0, though, I don't really understand what's happening.

--=20
Regards, Denis Obrezkov


--NDt6pRP2iAKFweES6wYDsQJv9stMGmYeH--

--pdgqiHpBlf5i4k0rTaM0fFjWIvud5Lcxm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEAREIAB0WIQTG5lj1j5VIuKBD/kz7iQsTJJ7s+QUCXRzK9QAKCRD7iQsTJJ7s
+aByAQDqL5mlIFxL2KBUA2h3mzDsEiAow7twRT9m6CQ1K8ecfQEA+ZR9OIQfOZ9N
xFySvdjaK9ZJCDOhvtcI5AhfYb+uG90=
=6w6X
-----END PGP SIGNATURE-----

--pdgqiHpBlf5i4k0rTaM0fFjWIvud5Lcxm--


--===============4873474943939725313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4873474943939725313==--

