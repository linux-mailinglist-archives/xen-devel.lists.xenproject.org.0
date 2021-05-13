Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DD737F594
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 12:26:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126866.238402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh8X0-0003WN-IX; Thu, 13 May 2021 10:25:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126866.238402; Thu, 13 May 2021 10:25:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh8X0-0003UZ-EL; Thu, 13 May 2021 10:25:26 +0000
Received: by outflank-mailman (input) for mailman id 126866;
 Thu, 13 May 2021 10:25:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yjCE=KI=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lh8Wz-0003UT-7t
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 10:25:25 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f90336b-5d1f-4ac9-8dd5-38858d5d064c;
 Thu, 13 May 2021 10:25:23 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.8 AUTH)
 with ESMTPSA id N048d9x4DAPM3tp
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Thu, 13 May 2021 12:25:22 +0200 (CEST)
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
X-Inumbo-ID: 6f90336b-5d1f-4ac9-8dd5-38858d5d064c
ARC-Seal: i=1; a=rsa-sha256; t=1620901522; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=h8Q+594ETXpHD2RuMlcjjI4tElDnD7dsuaSIH5nDBkhW2k/t1s1gM8VsKUYpelgQmJ
    DsySzTya7dA9ZXxuPA+MWBMlxW7D7rGAtLas4/rL9MV3G6a/5kCuT8S+PcDbild5Chgp
    xs1izGPiiGMh93qDt0AZ50ohbw8CRlsZKY5YkgwrI8DmVC846+zBTWMBW3oNiEfkyBt9
    1TcgYwE4Hcot3S7pToJCY+ZeR5NyL0wDI3n/K+p45Oa0hVyJ8KN8Myn5jSzIYf4bVA+T
    MvaxsH9CxI8kPs18POR6q3LOb/jJkJ2DjwFppw5B+XQRxjSWDpFuHqrlOyM+kFyItFP6
    IO1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620901522;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=vdZRBaOASTW0gueMtvSxWM+YkHqauO38kr8TeB7UK1c=;
    b=gShGFoExLmaLOHLfBzl+xVh1yryz81r6SXUwstBxyj2b7jW8NidSmHcxx1GUVcXAmt
    j8Se+ZoPpqznpHHy/hrUO0HTWSfEY2Bs6hBLFPIJWKVO39jWgqT3ZumdynOcsXj+16FJ
    SxyByIwjvVAkGYg3wb1Md/QUnQlDUNockUZ1ca9G93IQPq9AYeyZUxKxzgmRqK2LG0W6
    XLUZb2kU+Mm/PVRfC1An+/lgW/2lLKW7c/bMgItSs3H9U/pQ97SU++Tpv84V+D0Yi7w3
    DjYOpIl3NAS3CIH5K0WqKxKAsM48kSmMvUVKFA7A3bXQAMZBUbiNSuhvoex0uIVe0FSa
    RGpQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620901522;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=vdZRBaOASTW0gueMtvSxWM+YkHqauO38kr8TeB7UK1c=;
    b=keGO2Z8qxYsSBS239MP4ShXpW5XQx6V5kCnMwuGi0vR1sW+XYcfzgRiMhmPtdi78rX
    Nhf0Z3O47x/jKq1z8HcEMdqMWUgWEoWEeu+DftxNuU1HYAd9UVHuhIRFJQs8nhD3tAyy
    RYGMHerVopjA1zOL+ehyZ2jUCdYvfzgaqR6Ve/pM6TXMDAeHU0tAifPUs8bH3D9JWJAD
    9dtjhhgT4q4RgxFV8JFRX9WvqjR9YN/Vcr1gByMBe4BJGv7BZiZPdXLF5rUpkcWO/Edb
    oaMlMKheBSltMRWAJq1SKzxy14QTs6NkuRsSTnjd9J7YUJXh0fvactYUf12x3sEkZsl1
    f8fg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF/Wx6Ea03sAi8O4Y0c9DLMc9kgmB2KMHkQZ2le"
X-RZG-CLASS-ID: mo00
Date: Thu, 13 May 2021 12:24:57 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: regression in recent pvops kernels, dom0 crashes early
Message-ID: <20210513122457.4182eb7f.olaf@aepfle.de>
X-Mailer: Claws Mail 2021.04.23 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dO5gs0drS3OyAvj+8f4m0KJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dO5gs0drS3OyAvj+8f4m0KJ
Content-Type: multipart/mixed; boundary="MP_/fncddok1AucPyRN.am=TRBX"

--MP_/fncddok1AucPyRN.am=TRBX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Recent pvops dom0 kernels fail to boot on this particular ProLiant BL465c G=
5 box.
It happens to work with every Xen and a 4.4 based sle12sp3 kernel, but fail=
s with every Xen and a 4.12 based sle12sp4 (and every newer) kernel.

Any idea what is going on?

....
(XEN) Freed 256kB init memory.
(XEN) mm.c:1758:d0 Bad L1 flags 800000
(XEN) traps.c:458:d0 Unhandled invalid opcode fault/trap [#6] on VCPU 0 [ec=
=3D0000]
(XEN) domain_crash_sync called from entry.S: fault at ffff82d08022a2a0 crea=
te_bounce_frame+0x133/0x143
(XEN) Domain 0 (vcpu#0) crashed on cpu#0:
(XEN) ----[ Xen-4.4.20170405T152638.6bf0560e12-9.xen44  x86_64  debug=3Dy  =
Not tainted ]----
....

....
(XEN) Freed 656kB init memory
(XEN) mm.c:2165:d0v0 Bad L1 flags 800000
(XEN) d0v0 Unhandled invalid opcode fault/trap [#6, ec=3Dffffffff]
(XEN) domain_crash_sync called from entry.S: fault at ffff82d04031a016 x86_=
64/entry.S#create_bounce_frame+0x15d/0x177
(XEN) Domain 0 (vcpu#0) crashed on cpu#5:
(XEN) ----[ Xen-4.15.20210504T145803.280d472f4f-6.xen415  x86_64  debug=3Dy=
  Not tainted ]----
....

I can probably cycle through all kernels between 4.4 and 4.12 to see where =
it broke.


Olaf

--MP_/fncddok1AucPyRN.am=TRBX
Content-Type: application/gzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=xen_404.sle12sp4.txt.gz

H4sICOb7nGACA3hlbl80MDQuc2xlMTJzcDQudHh0AO1abXOruhH+3l+xvfdDk9vYBwS2iducqV9w
4qntuMZJz53MGUYGYTMHgws4L3f61zr9Sf0LXYkXA3bIuW4/Xs0kBmn30Wol7a5WTAJqu/4aXpmv
qtBsNn83SWs+hUEQf4o8JpNop37yXH//Wkfg+m4c2oLiNhA/F1/02SV8YT48szByAx/UptokktyR
VKm1lFukrWjN9sqRWm0JURrXzUSMC5ut9uubt78E3qaLVQ3ku4SLtWXhkwYXxoOhw4QLdImQWrN1
CSkHjEIXpvQNoAOS2m0pXZXAw3IARCJyKtCExiyKYbCh/poZLO4CF6khqQ2pBXKrS9pdRYM/SrIk
wdqNuwcBU4A+jttDJbCwC7eLhz4B0pSyxkGw3VLfBtQX64IXrL1n74Z6Hqz32KtZqLACPwo8dmMF
Wxn4vxsZVYKd2sFWukGVrYKIpaiPrs0CcH0nCLc0RlV20wZ4vO2BG0HMXmPYBjYDTXolrStwAj8G
7VVu54R9/dNwOIAtizeBHXXBD3z2J9CH4yHEIfUjh4UQu1uUmkDEUDo7yngFEe8dmWIIWRy67JnZ
sGIW3UcMa4FDpw3USzvBWYmZFTM7xRm6kXVyEKNgjyqTYdpfQOSufRrvQxZVW/XhsMgNURzurSIl
LrUG04gEi94UtnSX40uVAo1i1bWjYtXFPqIrj12e4EkISjxUwFxg3yxETZzico56kqUPueSqfJbD
VCbVyJcTlHhwwXKe3mA+BpvG9BRbQlNm63zQVUJw4GGZRt8flMOs6qAcZn/MxY65mPwRl1PtS5Y+
lFA+XhYacbCc0AVXaBcWxnDOSUfqSJKu8Img0QoJ3M0BS5n2izFcwmCkq7qe0HYGSCuntDAPg4lL
ca+mheDff/79L/Est4leBhvhTwqmCbAR71g5D2yYSzbiYOpwcF2UjBdBkhYZxrPlBI2lpEiEaEeC
GQmWnIxSlUrtxnywSNtV0d6Sin3x5kXfeDj0VSf4dDC6TcEGAkypVakMxSKVse7meqoEkgiOtv/s
6THm03EKpqZaQLBWnWDvg+kLI5NMzLU8lD4a5ftgvfl4kICpycK51j8a5rsqMxa9VLB2Ilg6l73p
kFOPelNzZMrSASttSESrrBssCVYvweq0zx9kX1+kgg3SufwfNHanZ+ofiLmUtcE5YMZbFLMt90hd
UEin3Zr24UJRWi2iSNq3fk6GOu3C/MsU0Ap9TqZLEo8z7tSlOjL5+8jI95EpNWTygUzNyeQ6stb3
kbW/j6zzDlkibjoSqSGc8/sEib1v2Kmt/4iQ06rKu8RyKmRO0tAqxLOHaQ93oOcFFoaeNgZHWx85
MUABJwy2IJxN6n/E83WV9yHiAbeGQR2GaBsGGxptINq4TpxF2cNgS10fNgxBeSTuUs+NsK/htAcv
rh1vcPHByo2zUMkRMZUxncN03oi5hwMac5fmqI6WdT5Ea0aaKuy45/TzvhJpxIzYoYuBKsZ5Dt17
cWn/zKeNJUaTIYzvYR6EGGZLr9ek4hUmuj5HtzK678JuK7+alh8/tdvSlfT1Kqlgz1jRIVeokq8l
1mJ5od/Yfmc+M+tJREOyZCE/vpqR+wt7IhXWCc6Dl8hPbRvHFqFoWbxRphREF9TauaZrP0mvKAV4
dOdah1fmc+3lQQXaBQsRcaJ+xKXYJUk/2QEoD8ffw1fL+GodvnoGvlzGl+vw5TPwW2X8Vh1+6wx8
UsYndfjkDPx2Gb9dh98+A18p4yt1+MoZ+J0yfqcOv/N9+OYMzUChD8f5CrbjiT885cZYJX8t+87x
fSJYIoT2NdtnnDs9DXyFdeSaKxqxJynnTviwogvpIEC7OgjXuSpt2AToCm6NMRp9uVUjwnVVBLks
gtyuyiAXZLiuk0HOZZDbDUUuCzFbmsZiYN4/LuBitUcWwP+mG/4Dn9ZesKKeeCGwcdcbYPa6ctCo
AbguAlyDF7yAh4dyrwKw+JsEe+4JVm8Q4ChC12bNKgn5mOT6XRKdL7DcI/AcBFrnkUfjJqSugsD4
071ojo5jb9fmnkGW221KMJTh09EVqrWL9nhEXVzEEAewZjHoYYgLeBJgn+lcLHgyJ5OIh25dWAqv
tqOhkAFdJqwY83Pv+Euelkj9GT8qX0x7w+Wl8LPcN1qB77jrfZjkGwq5hywMmM4Tx/6S+OfB/CGC
Cwk2Qbzz9mvxnq+rxd9wu2zRBfNAkC+YK+D5Hpga40/41/hSEieyNszeezzHxCUZhMx2YzCyWriw
RE2GPkwzLYBhpdQkMoHp3S/ouNPNnmlmzAeP6BiCBOEbhhA0xNd8sjFOH9GtLG1gS62N6zPA/qxv
ELIdenDOmFqTzJgMstNYWVNSV8wjZCEWRGy9xQhCHK/5CmYRqDzccZwjJBoyymMRW015s2M76h90
LY8gBEeiK8HH56zaDXbSyLvA0TUeXW4ZptMHkcgSQdDvM9XgEn12w3jPI6dkGLYbFUerz3r9yXh2
iwgNsdZxSvMkFQamiTA+e8G19Nc0BZY2N5vL8VRfdHlQEgfhjfQ6koR5kW8k2Lm+fEPEK7lpyPyd
/2bjxJ3E153IzYU81yerTUXW+PzyDZSNLg8v07wi8JmFwIG2Cn91+/neeMSDSM8YD6NsLrMWg7cY
+x2faoSh9jP1LXxwWJKOy7NpDZixiJPM6Zol2wxX/Wy+vDxQTGgUQz9EhA0smBWENlxM+gueySyq
uCgU9l9ZXqL6job2Cy4K6EWRm3XLh3Zx15tfVlOMCUtvjvseZePhH2439Vv/CsgU/8m3/SLh/PEu
SZry1RDlQ8epjzeo6F2q+pRl61q4n4R9w43Nc7aeh32b1m5vctuAMSyNrQ16DJxfcXa4bp1kJeez
Kuezquezts5nbf8a1n4Y7NebGPa71JiehOz8Gki+RdCfJLsngiSbJ4zFKgyobfF1eqGgY4lpyXVC
5DG2E6sDV5ChZJIIg2juUAC0VyUjyev4ukz2aRRTvpayzfXTTz/B5L435OZjeD/tjWcoE1amzcxz
TO6pmLlyfRq+4YA2dsiHhf4tGxPaNLTb0S/47ijOwTd+xEwqzC3Z+hXMCXXOTNq/hlclRV7LWdUx
J05JRANZPvYzvihEsctsr8xPWXHf4pq4fUCHb94bcAM/iHuqHz4kftQXxvh+xjlIs11Hjw1Fan4d
pTSlOo7H8WJp9nuGjvQ8XE6KVk4KnGIcz8ZLc06mgk/L7wRqOPTZcvFzuRuudFmrY7r7ea4vBr3J
xJz3bitCykk6vIZ7pPeWDwtdKPv3L6ErkgcmN7emeIz+uaP4vrbd0KQrDBZNdb2qU5fxMJ/fL5b6
0CxA8/HLNUzznm5O74dc+h/eWFSHz7edvuCEa+az0LXqiPf+Nz948fl9KG/njoFhRPean59Oj8CY
67OhOejNBvpESF8nO8ptGsseLpL5aPYh9d1jSjy5/3s+V1rhnqlWS8PhwrwfjQwMtDmvdMbQZVId
O9/epkU9yxSWr5udiAoxAhYeTInTVZamqdkNvCQGgUMHjhNhlF8UOAdM274HUNB/E4b4BL38Dj3z
7ZMCl81QTo/hJgbSJ+jL+5CXHdmW9HF6m4sLc/jGQp+hi2mrjZUbX4EXra74JTH6OSW7auZJP+mI
EndGSi6UWW9N53c/G2M0BTDVp/doSXqLRW92q0/RrnRLvVAeXjZ52i27IcuSo43PeU0WsV9ohHSu
iSyCsIgf2lYsQeABah4l8sNIE0K6xTgbF1F+9bZStXYJmDi241AnE5rb14d6mfk3ChjIZbqpTnrj
83vTelqmvOQyHc3afPMWNXhAIC6eU0btiBFr0HVT1tIyRkOszySKwVIVrCKqulLzHnmEm5jcboWR
VRlbBccrvl/g8QnfuWVGQVZmLIQKsLxf9iaH1Gt16xUZ1ZJyEjfFjZFuGIXpKO8RsdD4OX1LX93t
fosx4GMhCOT2gX92UQo2MIrieeujbZ0s9kPtUcB0jCRXkMhJJHIUPR0jkSpSGkNVkUR0VIukHCEl
EVUFqXNdGJ1hhfvVikeio5Cx5OapaQc+KyUBqCdSRmki4JknkeINGvFN4NnALazomE9jsovzU2Js
N3nmReSaRPIjbbjl37ecbOGxr4GOF7t0/d0+5tJjDIx2In7bMfjDYLmYNOgfRP9MhM/CZkQvLsb0
KQu+o13MTAcfmA2k1f7WF/mcdBiZjNtt0+rKnZbWtSXoUxsmMjgeXUegFZdlHNJdhJRqQvjgb6hv
eyLR8IwnVDwH7viZA8TdxidODU8/tr/y4yFfl7j0nph1I5KZKaItbmFMK6TRxozefAvQS3JEcc8j
XEWTr38OyBWczJ6NVoEQSqgEVoiHbYyIgz0evU0H7RD7IxpwRfmE/1WlfNmDCnzGE9CP0iWIHpOT
q6jJDGEDy5P4LuY7P72CV61ttvE3+6AKZmgsYuyOH4y/crzsQ6f5gzAFmTYX47l4Z5KidJ/+XFyy
FPv4nOloMZr0bo2KaSUav3HWcaXye9TB/Wypf8Fj2+45+WwKLmzpOb+FDunrwYYkhVFkC1evxxab
11ulek0mLZJZ0dAutNmM2ivGHM4Tuafr7RP1GdZqV7Rt3NITTWBV69m1qNe6x58mZVjXJ9o4jyyd
HqMsd9/FkklVLoUJHqXKoyVY6vv6klsl+03UpH8rLMil8c87JGUl6tVKH+3cj1vhoX9NTt2W4CHv
joV/uJYOmR0encPj+vAY4SOTiBBDPCpKyVYJF8itgMWSDYoTdVOdp0JEW1XJ8TxUF33pCyPsXzoF
xltx+Zc7trUSuhhGBb19EiwR5J0K7TRFYX6Lbv2UIHXox0ERnMFbDNYUi+RGT4B1Sief44VYPyMd
if5Pkv1fh/kb2BGpk1oIyZKsjqqBVSyK1CpXYDmAVVvOqPgN7DewerAhj4nE3YMV+D6zxCWRuDpg
PGfdrIZnaVTWhZCt8MwlLt7SlDG2t7KvrJu/+y+4xfPshi8AAA==

--MP_/fncddok1AucPyRN.am=TRBX
Content-Type: application/gzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=xen_415.tw.txt.gz

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

--MP_/fncddok1AucPyRN.am=TRBX--

--Sig_/dO5gs0drS3OyAvj+8f4m0KJ
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmCc/nkACgkQ86SN7mm1
DoC7QA/7BoJReGxNdTjSQh8uCT0bJ3ORfZSQaqENNnyakozX4Q6+ZSdc2eOECKFW
Z1NxuZhMhw4tBDaSQ2qURHr+vA+4fzamzfuzAF+ewuhG+QFRjBGFRngCy2FwBLsG
4x3gOgx4hOJGASYepRaQAx+REEtarU6Yyw+TryfI1IeodRD/a7IvR3G5kMpOkpXy
/KfDgECeKchm/Blk5woEoi2a6mpATflB/OfmGaas/2zU9guSiYnAnvjP/Uyk+VaE
D+w9ulhzy5I02TaVYQUht/iBx2uwnxElw4aZhycpU0O9tCCllkNzoBj0FKJp5IMa
GFSVWN3fg8IMDmpToFmqLGO+VmxVWihGoVF2gCOLbnP8Rz2QLo25DkorHb1m8yEJ
am6vb4uw2LPFmDadZvHkwbCKYjWWHag0i8VC+YuFOTIdQQKkEuKgqA4Azw0ygmVX
IqN05IcckCmRIdi1aF/6koFUB4lTmuOS9lJoVNrxAKHD9HOKBwrYzxvRREqpeug2
BrJKPzqPTBqkxEkVANUfRX3JJbM4FMNv3pj5XhyN1ALcOGnAuWOMG3ucUvePXQl/
IyOvgU80wB+JTaYSDb0+5TTkmbbJVNS2ygqXf0hlLl2Clj3pgeMQXKIes+e6dOEU
ZIdHFvBfwMiJdSKL5v7WJSvXwuULX1oYurr4UPPzA3NcBWaH22Q=
=O+/L
-----END PGP SIGNATURE-----

--Sig_/dO5gs0drS3OyAvj+8f4m0KJ--

