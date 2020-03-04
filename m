Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CEE17943E
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 17:02:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9WOw-000658-FG; Wed, 04 Mar 2020 15:57:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I321=4V=redhat.com=lvivier@srs-us1.protection.inumbo.net>)
 id 1j9WOu-000653-Fl
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 15:57:36 +0000
X-Inumbo-ID: ddb66cac-5e30-11ea-8eb5-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ddb66cac-5e30-11ea-8eb5-bc764e2007e4;
 Wed, 04 Mar 2020 15:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583337455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VQN8PrcXw10uqt+hfC3SWPfef1I0Io5JDE6z0yOc224=;
 b=QSbZjb1NSBBdZYITBZRjoALLDUXVrU+VZepC3RzDsXgMzGzmIr/sSVoa4gynoNnVsb1TTL
 nVIBYh55gKMevlLKv8fCkRFQBnvAxSOx+PJIx3Bs9GAOz3qL19MUbtRMpFNWbIlluAVzLf
 WVFqDoY9vP87+pMbPKFAr23PXhbZrHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-0Bel6gqsMDiDWdGSNuW3yg-1; Wed, 04 Mar 2020 10:57:33 -0500
X-MC-Unique: 0Bel6gqsMDiDWdGSNuW3yg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96C13A434C;
 Wed,  4 Mar 2020 15:57:26 +0000 (UTC)
Received: from [10.36.117.17] (ovpn-117-17.ams2.redhat.com [10.36.117.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BA685DA7D;
 Wed,  4 Mar 2020 15:57:12 +0000 (UTC)
To: Alexey Kirillov <lekiravi@yandex-team.ru>, Eric Blake
 <eblake@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20200304130656.16859-1-lekiravi@yandex-team.ru>
 <20200304130656.16859-2-lekiravi@yandex-team.ru>
From: Laurent Vivier <lvivier@redhat.com>
Autocrypt: addr=lvivier@redhat.com; prefer-encrypt=mutual; keydata=
 mQINBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
 WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
 SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
 UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
 Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
 JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
 q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
 RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
 8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
 LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABtCNMYXVyZW50IFZp
 dmllciA8bHZpdmllckByZWRoYXQuY29tPokCOAQTAQIAIgUCVgVQgAIbAwYLCQgHAwIGFQgC
 CQoLBBYCAwECHgECF4AACgkQ8ww4vT8vvjwpgg//fSGy0Rs/t8cPFuzoY1cex4limJQfReLr
 SJXCANg9NOWy/bFK5wunj+h/RCFxIFhZcyXveurkBwYikDPUrBoBRoOJY/BHK0iZo7/WQkur
 6H5losVZtrotmKOGnP/lJYZ3H6OWvXzdz8LL5hb3TvGOP68K8Bn8UsIaZJoeiKhaNR0sOJyI
 YYbgFQPWMHfVwHD/U+/gqRhD7apVysxv5by/pKDln1I5v0cRRH6hd8M8oXgKhF2+rAOL7gvh
 jEHSSWKUlMjC7YwwjSZmUkL+TQyE18e2XBk85X8Da3FznrLiHZFHQ/NzETYxRjnOzD7/kOVy
 gKD/o7asyWQVU65mh/ECrtjfhtCBSYmIIVkopoLaVJ/kEbVJQegT2P6NgERC/31kmTF69vn8
 uQyW11Hk8tyubicByL3/XVBrq4jZdJW3cePNJbTNaT0d/bjMg5zCWHbMErUib2Nellnbg6bc
 2HLDe0NLVPuRZhHUHM9hO/JNnHfvgiRQDh6loNOUnm9Iw2YiVgZNnT4soUehMZ7au8PwSl4I
 KYE4ulJ8RRiydN7fES3IZWmOPlyskp1QMQBD/w16o+lEtY6HSFEzsK3o0vuBRBVp2WKnssVH
 qeeV01ZHw0bvWKjxVNOksP98eJfWLfV9l9e7s6TaAeySKRRubtJ+21PRuYAxKsaueBfUE7ZT
 7ze0LUxhdXJlbnQgVml2aWVyIChSZWQgSGF0KSA8bHZpdmllckByZWRoYXQuY29tPokCOAQT
 AQIAIgUCVgUmGQIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQ8ww4vT8vvjxtNBAA
 o2xGmbXl9vJQALkj7MVlsMlgewQ1rdoZl+bZ6ythTSBsqwwtl1BUTQGA1GF2LAchRVYca5bJ
 lw4ai5OdZ/rc5dco2XgrRFtj1np703BzNEhGU1EFxtms/Y9YOobq/GZpck5rK8jV4osEb8oc
 3xEgCm/xFwI/2DOe0/s2cHKzRkvdmKWEDhT1M+7UhtSCnloX776zCsrofYiHP2kasFyMa/5R
 9J1Rt9Ax/jEAX5vFJ8+NPf68497nBfrAtLM3Xp03YJSr/LDxer44Mevhz8dFw7IMRLhnuSfr
 8jP93lr6Wa8zOe3pGmFXZWpNdkV/L0HaeKwTyDKKdUDH4U7SBnE1gcDfe9x08G+oDfVhqED8
 qStKCxPYxRUKIdUjGPF3f5oj7N56Q5zZaZkfxeLNTQ13LDt3wGbVHyZxzFc81B+qT8mkm74y
 RbeVSuviPTYjbBQ66GsUgiZZpDUyJ6s54fWqQdJf4VFwd7M/mS8WEejbSjglGHMxMGiBeRik
 Y0+ur5KAF7z0D1KfW1kHO9ImQ0FbEbMbTMf9u2+QOCrSWOz/rj23EwPrCQ2TSRI2fWakMJZ+
 zQZvy+ei3D7lZ09I9BT/GfFkTIONgtNfDxwyMc4v4XyP0IvvZs/YZqt7j3atyTZM0S2HSaZ9
 rXmQYkBt1/u691cZfvy+Tr2xZaDpFcjPkci5Ag0EVgUmGQEQALxSQRbl/QOnmssVDxWhHM5T
 Gxl7oLNJms2zmBpcmlrIsn8nNz0rRyxT460k2niaTwowSRK8KWVDeAW6ZAaWiYjLlTunoKwv
 F8vP3JyWpBz0diTxL5o+xpvy/Q6YU3BNefdq8Vy3rFsxgW7mMSrI/CxJ667y8ot5DVugeS2N
 yHfmZlPGE0Nsy7hlebS4liisXOrN3jFzasKyUws3VXek4V65lHwB23BVzsnFMn/bw/rPliqX
 Gcwl8CoJu8dSyrCcd1Ibs0/Inq9S9+t0VmWiQWfQkz4rvEeTQkp/VfgZ6z98JRW7S6l6eoph
 oWs0/ZyRfOm+QVSqRfFZdxdP2PlGeIFMC3fXJgygXJkFPyWkVElr76JTbtSHsGWbt6xUlYHK
 XWo+xf9WgtLeby3cfSkEchACrxDrQpj+Jt/JFP+q997dybkyZ5IoHWuPkn7uZGBrKIHmBunT
 co1+cKSuRiSCYpBIXZMHCzPgVDjk4viPbrV9NwRkmaOxVvye0vctJeWvJ6KA7NoAURplIGCq
 kCRwg0MmLrfoZnK/gRqVJ/f6adhU1oo6z4p2/z3PemA0C0ANatgHgBb90cd16AUxpdEQmOCm
 dNnNJF/3Zt3inzF+NFzHoM5Vwq6rc1JPjfC3oqRLJzqAEHBDjQFlqNR3IFCIAo4SYQRBdAHB
 CzkM4rWyRhuVABEBAAGJAh8EGAECAAkFAlYFJhkCGwwACgkQ8ww4vT8vvjwg9w//VQrcnVg3
 TsjEybxDEUBm8dBmnKqcnTBFmxN5FFtIWlEuY8+YMiWRykd8Ln9RJ/98/ghABHz9TN8TRo2b
 6WimV64FmlVn17Ri6FgFU3xNt9TTEChqAcNg88eYryKsYpFwegGpwUlaUaaGh1m9OrTzcQy+
 klVfZWaVJ9Nw0keoGRGb8j4XjVpL8+2xOhXKrM1fzzb8JtAuSbuzZSQPDwQEI5CKKxp7zf76
 J21YeRrEW4WDznPyVcDTa+tz++q2S/BpP4W98bXCBIuQgs2m+OflERv5c3Ojldp04/S4NEjX
 EYRWdiCxN7ca5iPml5gLtuvhJMSy36glU6IW9kn30IWuSoBpTkgV7rLUEhh9Ms82VWW/h2Tx
 L8enfx40PrfbDtWwqRID3WY8jLrjKfTdR3LW8BnUDNkG+c4FzvvGUs8AvuqxxyHbXAfDx9o/
 jXfPHVRmJVhSmd+hC3mcQ+4iX5bBPBPMoDqSoLt5w9GoQQ6gDVP2ZjTWqwSRMLzNr37rJjZ1
 pt0DCMMTbiYIUcrhX8eveCJtY7NGWNyxFCRkhxRuGcpwPmRVDwOl39MB3iTsRighiMnijkbL
 XiKoJ5CDVvX5yicNqYJPKh5MFXN1bvsBkmYiStMRbrD0HoY1kx5/VozBtc70OU0EB8Wrv9hZ
 D+Ofp0T3KOr1RUHvCZoLURfFhSQ=
Message-ID: <274ce4fc-f7ef-791c-7c25-c99b694c1e78@redhat.com>
Date: Wed, 4 Mar 2020 16:57:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200304130656.16859-2-lekiravi@yandex-team.ru>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v2 1/4] qapi: net: Add query-netdevs command
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Vincenzo Maffione <v.maffione@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Rob Herring <robh@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>, Jiri Pirko <jiri@resnulli.us>,
 yc-core@yandex-team.ru, Stefan Weil <sw@weilnetz.de>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 xen-devel@lists.xenproject.org, Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
 Luigi Rizzo <rizzo@iet.unipi.it>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDMvMjAyMCAxNDowNiwgQWxleGV5IEtpcmlsbG92IHdyb3RlOgo+IEFkZCBhIHFtcCBj
b21tYW5kIHRoYXQgcHJvdmlkZXMgaW5mb3JtYXRpb24gYWJvdXQgY3VycmVudGx5IGF0dGFjaGVk
Cj4gbmV0d29yayBkZXZpY2VzIGFuZCB0aGVpciBjb25maWd1cmF0aW9uLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFsZXhleSBLaXJpbGxvdiA8bGVraXJhdmlAeWFuZGV4LXRlYW0ucnU+Cj4gLS0tCj4g
IGluY2x1ZGUvbmV0L25ldC5oIHwgICAxICsKPiAgbmV0L2h1Yi5jICAgICAgICAgfCAgIDggKysr
Cj4gIG5ldC9sMnRwdjMuYyAgICAgIHwgIDE5ICsrKysrKysKPiAgbmV0L25ldC5jICAgICAgICAg
fCAgOTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIG5ldC9uZXRtYXAuYyAg
ICAgIHwgIDEzICsrKysrCj4gIG5ldC9zbGlycC5jICAgICAgIHwgMTI2ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgbmV0L3NvY2tldC5jICAgICAgfCAg
NzEgKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgbmV0L3RhcC13aW4zMi5jICAgfCAgIDkg
KysrKwo+ICBuZXQvdGFwLmMgICAgICAgICB8IDEwMyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tCj4gIG5ldC92ZGUuYyAgICAgICAgIHwgIDI2ICsrKysrKysrKysKPiAgbmV0
L3Zob3N0LXVzZXIuYyAgfCAgMTggKysrKystLQo+ICBxYXBpL25ldC5qc29uICAgICB8ICA4OSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxMiBmaWxlcyBjaGFuZ2VkLCA1NjYg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKLi4uCj4gZGlmZiAtLWdpdCBhL25ldC9u
ZXQuYyBiL25ldC9uZXQuYwo+IGluZGV4IDllOTNjM2Y4YTEuLjAxZTA1NDgyOTUgMTAwNjQ0Cj4g
LS0tIGEvbmV0L25ldC5jCj4gKysrIGIvbmV0L25ldC5jCj4gQEAgLTU0LDYgKzU0LDcgQEAKPiAg
I2luY2x1ZGUgInN5c2VtdS9zeXNlbXUuaCIKPiAgI2luY2x1ZGUgIm5ldC9maWx0ZXIuaCIKPiAg
I2luY2x1ZGUgInFhcGkvc3RyaW5nLW91dHB1dC12aXNpdG9yLmgiCj4gKyNpbmNsdWRlICJxYXBp
L2Nsb25lLXZpc2l0b3IuaCIKPiAgCj4gIC8qIE5ldCBicmlkZ2UgaXMgY3VycmVudGx5IG5vdCBz
dXBwb3J0ZWQgZm9yIFczMi4gKi8KPiAgI2lmICFkZWZpbmVkKF9XSU4zMikKPiBAQCAtMTI4LDYg
KzEyOSwxMiBAQCBjaGFyICpxZW11X21hY19zdHJkdXBfcHJpbnRmKGNvbnN0IHVpbnQ4X3QgKm1h
Y2FkZHIpCj4gIAo+ICB2b2lkIHFlbXVfZm9ybWF0X25pY19pbmZvX3N0cihOZXRDbGllbnRTdGF0
ZSAqbmMsIHVpbnQ4X3QgbWFjYWRkcls2XSkKPiAgewo+ICsgICAgZ19hc3NlcnQobmMtPnN0b3Jl
ZF9jb25maWcpOwo+ICsKPiArICAgIGdfZnJlZShuYy0+c3RvcmVkX2NvbmZpZy0+dS5uaWMubWFj
YWRkcik7Cj4gKyAgICBuYy0+c3RvcmVkX2NvbmZpZy0+dS5uaWMubWFjYWRkciA9IGdfc3RyZHVw
X3ByaW50ZihNQUNfRk1ULAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgTUFDX0FSRyhtYWNhZGRyKSk7Cj4gKwoKV2h5IGRvIHlvdSB1c2Ug
dGhpcyByYXRoZXIgdGhhbiB0aGUgcWVtdV9tYWNfc3RyZHVwX3ByaW50ZigpIGZ1bmN0aW9uCmRl
ZmluZWQgYWJvdmU/CgpxZW11X21hY19zdHJkdXBfcHJpbnRmKCk6CiAgODkwZWU2YWJiMzg1ICgi
bmV0OiBhZGQgTUFDIGFkZHJlc3Mgc3RyaW5nIHByaW50ZXIiKQoKTUFDX0ZNVC9NQUNfQVJHOgog
IDZkMWQ0OTM5YTY0NyAoIm5ldDogQWRkIG1hY3JvcyBmb3IgTUFDIGFkZHJlc3MgdHJhY2luZyIp
CgpNQUNfRk1UL01BQ19BUkcgc2VlbXMgdG8gYmUgcmVzZXJ2ZWQgZm9yIHRyYWNpbmcuCgpUaGFu
a3MsCkxhdXJlbnQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
