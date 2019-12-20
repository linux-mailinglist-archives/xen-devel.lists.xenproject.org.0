Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AB612804C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 17:04:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiKik-0000Es-Jy; Fri, 20 Dec 2019 16:01:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1+gY=2K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iiKij-0000Em-Dm
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 16:01:41 +0000
X-Inumbo-ID: 023fb224-2342-11ea-9386-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 023fb224-2342-11ea-9386-12813bfff9fa;
 Fri, 20 Dec 2019 16:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576857700;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=nKHSL8EywCNaAgntrGHi09BMQW4EJ8R4PSSvejJpYmg=;
 b=AfuAJf8OV8+aiDZ62MC+2jdGprO8hr4OsWGJwCr0dV/dZkpOLSw1J1wu
 O1e70xECxDmNu9AEmog8vD2gdKehtzzhoSVJAlXCT/CfgNzHmNwz2kMdF
 5wa570+wh4nRKNDnj2ur2iGcdPKml2EPljoFZjY7Pzr8QCPPfPnsyYEsB k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4jL6qfOdXfPVK8Pg6/XWZ+QJcfejAl4YJjVorv1mEGSDcclGf4ZXOdyhtTZFwNSY/lIO5vFcqG
 neW+0Fkx3AWEo2DJYjfl9YigE33gUftS41KJOsTyCGdOIFuDUGh9E2cOfVx6AlEewA7zUHpE0b
 vz+nVhiq0qTqp+Uq/nmMTyo/1AQOvbVsNx9aWjNoxZjInTEyIQyvYzu/LNxOCK5Sbb0vmHp0Cq
 Jn9ZHBdPiMFsrjAjk6JVciUBojRzAQaVTO8Mo79yqFgE7CgdIni/NO+G4HOz1/bFa2EjveC/NM
 bxA=
X-SBRS: 2.7
X-MesageID: 10584656
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,336,1571716800"; d="scan'208";a="10584656"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <7f7a6ba3-7308-b079-2df1-f5b8501b3cc6@suse.com>
 <87154c20-c60e-a215-f7f4-0290fadd90e4@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <dbc03c9d-bfc2-3313-1ffe-8ffe79b2c1e1@citrix.com>
Date: Fri, 20 Dec 2019 16:01:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87154c20-c60e-a215-f7f4-0290fadd90e4@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 5/5] x86emul: disable FPU/MMX/SIMD insn
 emulation when !HVM
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMTIvMjAxOSAxMzo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW4gYSBwdXJlIFBWIGVu
dmlyb25tZW50ICh0aGUgUFYgc2hpbSBpbiBwYXJ0aWN1bGFyKSB3ZSBkb24ndCByZWFsbHkKPiBu
ZWVkIGVtdWxhdGlvbiBvZiBhbGwgdGhlc2UuIFRvIGxpbWl0ICNpZmRlZi1hcnkgdXRpbGl6ZSBz
b21lIG9mIHRoZQo+IENBU0VfKigpIG1hY3JvcyB3ZSBoYXZlLCBieSBwcm92aWRpbmcgdmFyaWFu
dHMgZXhwYW5kaW5nIHRvCj4gKGVmZmVjdGl2ZWx5KSBub3RoaW5nIChyZWFsbHkgYSBsYWJlbCwg
d2hpY2ggaW4gdHVybiByZXF1aXJlcyBwYXNzaW5nCj4gLVduby11bnVzZWQtbGFiZWwgdG8gdGhl
IGNvbXBpbGVyIHdoZW4gYnVpbGQgc3VjaCBjb25maWd1cmF0aW9ucykuCj4KPiBEdWUgdG8gdGhl
IG1peHR1cmUgb2YgbWFjcm8gYW5kICNpZmRlZiB1c2UsIHRoZSBwbGFjZW1lbnQgb2Ygc29tZSBv
Zgo+IHRoZSAjaWZkZWYtcyBpcyBhIGxpdHRsZSBhcmJpdHJhcnkuCj4KPiBUaGUgcmVzdWx0aW5n
IG9iamVjdCBmaWxlJ3MgLnRleHQgaXMgbGVzcyB0aGFuIGhhbGYgdGhlIHNpemUgb2YgdGhlCj4g
b3JpZ2luYWwsIGFuZCBsb29rcyB0byBhbHNvIGJlIGNvbXBpbGluZyBhIGxpdHRsZSBtb3JlIHF1
aWNrbHkuCj4KPiBUaGlzIGlzIG1lYW50IGFzIGEgZmlyc3Qgc3RlcDsgbW9yZSBwYXJ0cyBjYW4g
bGlrZWx5IGJlIGRpc2FibGVkIGRvd24KPiB0aGUgcm9hZC4KClByZXN1bWFibHkgd2UgY2FuIGRy
b3AgZXZlcnl0aGluZyBidXQgdGhlIG9uZWJ5dGUgYW5kIHR3b2J5dGUgdGFibGVzLAphbmQgVkVY
L0VWRVggcHJlZml4IHBhcnNpbmcgbG9naWM/Cgo+Cj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAtLS0KPiBJJ2xsIGJlIGhhcHB5IHRvIHRha2Ugc3Vn
Z2VzdGlvbnMgYWxsb3dpbmcgdG8gYXZvaWQgLVduby11bnVzZWQtbGFiZWwuCgpJIHRoaW5rIEkn
bSBnb2luZyB0byBuZWVkIGEgbGl0dGxlIHdoaWxlIHRvIGZpZ3VyZSBvdXQgaG93IHRoaXMgd29y
a3MuwqAKSG93ZXZlci4uLgoKPgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+IEBAIC03OSw2ICs3OSw5IEBAIG9iai15ICs9IGhwZXQu
bwo+ICBvYmoteSArPSB2bV9ldmVudC5vCj4gIG9iai15ICs9IHhzdGF0ZS5vCj4gIAo+ICtpZm5l
cSAoJChDT05GSUdfSFZNKSx5KQo+ICt4ODZfZW11bGF0ZS5vOiBDRkxBR1MgKz0gLVduby11bnVz
ZWQtbGFiZWwKPiArZW5kaWYKPiAgeDg2X2VtdWxhdGUubzogeDg2X2VtdWxhdGUveDg2X2VtdWxh
dGUuYyB4ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5oCj4gIAo+ICBlZmkteSA6PSAkKHNoZWxsIGlm
IFsgISAtciAkKEJBU0VESVIpL2luY2x1ZGUveGVuL2NvbXBpbGUuaCAtbyBcCj4gLS0tIGEveGVu
L2FyY2gveDg2L3g4Nl9lbXVsYXRlLmMKPiArKysgYi94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUu
Ywo+IEBAIC00Miw2ICs0MiwxMiBAQAo+ICAgICAgfSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgfSkKPiAgCj4gKyNpZm5kZWYgQ09ORklH
X0hWTQo+ICsjIGRlZmluZSBYODZFTVVMX05PX0ZQVQo+ICsjIGRlZmluZSBYODZFTVVMX05PX01N
WAo+ICsjIGRlZmluZSBYODZFTVVMX05PX1NJTUQKPiArI2VuZGlmCgouLi4gaXNuJ3QgdGhpcyBn
b2luZyB0byBjYXVzZSBwcm9ibGVtcyBmb3IgdGhlIGVtdWxhdG9yL2Z1enplciBidWlsZHM/CgpP
biB0aGF0IHN1YmplY3QsIGl0IHdvdWxkIGJlIHZlcnkgaGVscGZ1bCB0byBhdCBsZWFzdCBiZSBh
YmxlIHRvCmNvbmZpZ3VyZSByZWR1Y2VkIGJ1aWxkcyBmcm9tIHRoZXNlIHV0aWxpdGllcy4KCn5B
bmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
