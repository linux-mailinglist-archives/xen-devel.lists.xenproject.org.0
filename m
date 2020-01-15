Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB2213CADD
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 18:24:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irmMW-0002xn-Ga; Wed, 15 Jan 2020 17:21:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aRIg=3E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1irmMV-0002xh-Kp
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 17:21:47 +0000
X-Inumbo-ID: 6f19c2a8-37bb-11ea-ac27-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f19c2a8-37bb-11ea-ac27-bc764e2007e4;
 Wed, 15 Jan 2020 17:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579108876;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=wEUS7c2NAj1k7pSiCB029GcDafVI4zC2Q3mJI0HGHf0=;
 b=Pxzq0zrcMlFP2GLGK04nAVlOHK4DBaFqvAlunYFmVc86sQfktS4Qz4GW
 BiqQaf5sZ/zuCS28fgeabR/hHWmYZoA6Mosfm8agrKmCOg9oEK9BzUERE
 riI2PQ9ZxdXP+M3ULX2zXu+3dw3pZ03Q4hFlfF63yGZOGRSVhp+RWUzFY Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HtEsEhpyjaoFjQqkuZSjKPZhNwu8vAW5ej33z62k4DnqsU0O6ZjmrP37yyt88INFR7DvzMEcXJ
 EjJ72tPorSCHdwPboTsAicRiVEw+TypvmIe65svldSesR0ftC12tLjYKQS1F94FTS1yoEqkaGY
 dCYdvVuNntr3nyPdAPMoyD0eKWna120fizPBprsEMwR9P2NQe4Dg/1A+3Srof5EPKY7V21SQWh
 dUjZt2+Q4aoKGaSpqNLCDUSbDDtd4T+mtE+l+Rl3zKxRSHpCr/8FOf3jd2/f+6h2pCRa4QoHUt
 S9E=
X-SBRS: 2.7
X-MesageID: 10975583
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,323,1574139600"; d="scan'208";a="10975583"
To: <pgnet.dev@gmail.com>, <xen-devel@lists.xenproject.org>
References: <6fb9cba6-b19a-680c-09a1-8c32c9f9fe19@gmail.com>
 <19d37ca0-90be-4820-e937-796288fc4517@citrix.com>
 <74cc009f-2d9d-c466-6735-096a47fca7e8@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <bdfd64dd-6fe7-ec75-5c39-9e8d6063eb85@citrix.com>
Date: Wed, 15 Jan 2020 17:21:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <74cc009f-2d9d-c466-6735-096a47fca7e8@gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] xen 4.13 + kernel 5.4.11 'APIC Error ... FATAL PAGE
 FAULT' on reboot? non-Xen reboot's ok.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDEvMjAyMCAxNzoxOSwgUEdOZXQgRGV2IHdyb3RlOgo+IGhpCj4KPiBPbiAxLzE1LzIw
IDk6MTAgQU0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBJcyB0aGlzIGEga25vd24vZml4YWJs
ZSBpc3N1ZT8KPj4gVGhlIEFQSUMgZXJyb3JzIGFyZW4ndCBmYXRhbC4gIFRoZXkgbmVlZCBsb29r
aW5nIGludG8gYW5kIGFkZHJlc3NpbmcgaW4KPj4gZHVlIGNvdXJzZS4KPj4KPj4gVGhlIHJlYWwg
Y3Jhc2ggaXMgRUZJIGZpcm13YXJlIGZhbGxpbmcgb3ZlciBhIE5VTEwgcG9pbnRlciB3aGljaCBp
cwo+PiB3aWxkbHkga25vd24gaXNzdWUuICBGaXhpbmcgaXQgcmVxdWlyZXMgZm9sbG93aW5nIHRo
ZSBMaW51eCBhcHByb2FjaAo+PiB3aGljaCBpcyB0byBub3QgdXNlIEVGSSByZWJvb3QgdW5sZXNz
IGFic29sdXRlbHkgbmVjZXNzYXJ5Lgo+Pgo+PiBZb3UgY2FuIHdvcmsgYXJvdW5kIGl0IHdpdGgg
cmVib290PWEgb24gdGhlIGNvbW1hbmQgbGluZSwgYnV0IGFjdHVhbGx5Cj4+IGZpeGluZyB0aGlz
IGluIFhlbiBpcyBwcm9iYWJseSBuZXZlciBnb2luZyB0byBoYXBwZW4gYmVjYXVzZSBJJ3ZlIGxv
c3QKPj4gaW50ZXJlc3QgaW4gdHJ5aW5nIHRvIGFyZ3VpbmcgdGhhdCBkZWZhdWx0IGJlaGF2aW91
ciBsaWtlIHRoZSBhYm92ZSBpcyBhCj4+IGJhZCB0aGluZyB3aGljaCB3ZSBzaG91bGQgY29kZSBh
cm91bmQuCj4gY3VycmVudGx5LCBoZXJlLAo+Cj4gY2F0IC9wcm9jL2NtZGxpbmUKPiAJcm9vdD0v
ZGV2L21hcHBlci9WRzAtUk9PVCBzb2Z0bGV2ZWw9eGVuIHJkLnNoZWxsIG1kcz1mdWxsIGwxdGY9
Zmx1c2ggcmQuZGVidWc9MCByZC51ZGV2LmxvZ19wcmlvcml0eT1kZWJ1ZyByZC5hdXRvPTEgZG9s
dm0gbHZtd2FpdD0vZGV2L21hcHBlci9WRzAtUk9PVCByb290PS9kZXYvbWFwcGVyL1ZHMC1ST09U
IHJvb3Rmc3R5cGU9ZXh0NCByb290ZmxhZ3M9am91cm5hbF9jaGVja3N1bSBub3Jlc3VtZSBub21v
ZGVzZXQgbm91dmVhdS5tb2Rlc2V0PTEgdmlkZW89dmVzYTpvZmYgdmlkZW89ZWZpZmI6MTAyNHg3
NjggeGVuY29ucz14dmMgY29uc29sZT10dHkwIGNvbnNvbGU9aHZjMCBwY2llX2FzcG09b2ZmIG1j
ZT1vZmYgZnNjay5tb2RlPXNraXAgZnNjay5yZXBhaXI9cHJlZW4gcmVib290PWFjcGkgY2xvY2tz
b3VyY2U9eGVuIGludGVsX2lvbW11PW9uIGFwcGFybW9yPTAgcGx5bW91dGguZW5hYmxlPTAgc2Nz
aV9tb2QudXNlX2Jsa19tcT0xIGVsZXZhdG9yPW1xLWRlYWRsaW5lIGNwdWlkbGUgY3B1ZnJlcT14
ZW46b25kZW1hbmQgbmV0LmlmbmFtZXM9MSBiaW9zZGV2bmFtZT0wIHNob3dvcHRzIG5vcXVpZXQg
bG9nX2J1Zl9sZW49MTBNIHByaW50X2ZhdGFsX3NpZ25hbHM9MSBzeXN0ZW1kLmxvZ19sZXZlbD1p
bmZvIHN5c3RlbWQubG9nX3RhcmdldD1rbXNnIGVhcmx5cHJpbnRrPXhlbixrZWVwIGF1ZGl0PTAK
Pgo+IG5vdGUgdGhlCj4KPiAJcmVib290PWFjcGkKPgo+IGFscmVhZHkgdGhlcmUuCj4KPiBzb21l
dGhpbmcgZWxzZSBJJ20gbWlzc2luZywgcGVyaGFwcz8KClRoYXQgaXMgdGhlIGNvbW1hbmQgbGlu
ZSBmb3IgZG9tMCB3aGljaCBpcyBhIFZNLsKgIFlvdSBuZWVkIHRoZSBYZW4KaHlwZXJ2aXNvciBj
b21tYW5kIGxpbmUuCgpZb3UnbGwgbmVlZCB0byBlZGl0IHhlbi00LjEzLjBfMDQtbHAxNTEuNjg4
LmNmZyB3aGljaCB3aWxsIGJlIHNvbWV3aGVyZQpvbiB0aGUgRVNQICh3aGVyZXZlciB0aGF0IGlz
IG1vdW50ZWQgaW4gYW4gb3BlblNVU0Ugc3lzdGVtKS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
