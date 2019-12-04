Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B00D5113627
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 21:08:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icatL-000269-6b; Wed, 04 Dec 2019 20:04:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d3Le=Z2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1icatK-000264-9X
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 20:04:54 +0000
X-Inumbo-ID: 55808b34-16d1-11ea-820c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55808b34-16d1-11ea-820c-12813bfff9fa;
 Wed, 04 Dec 2019 20:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575489893;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=1vpnFYZqhoMXeDqoQRl9tpS+xQrTcozU766Ejw+H+q0=;
 b=Oy3F/xY5143A+s51Vydt1xDAbqHw6WIaAt3yWQ/srtQUFIe1zpyYMvpU
 RDS4gEQdI6SI/u8yPzUMmQGD2SSHnuh6KEmHWhv2b84rbpHrthIA5Omed
 bUI8baqJDIeXQgXMQXKw7CO9HIQzvbTLLEHclG9s+YOYBb/58KKGgRRta I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AdfPasVYqb1+Ncj3LsXYtnwWvP4kAA0v6/ErNSecX+cXS5cm61WJN0aVN4wLSSGpxYT8HKa9hP
 KA0fmBsUKEPOEqeUfSizMtlWJW7nE9m2lnBqfbn3b9w3Icann2aeUTgWkdiBlKmAW4wFUzF2iY
 NKrcdmIeDTE8EETjRKBILS6f35l2/HxEkFuz0/bZSlvVIunEaP4p4PDVggh+oz1c75hs4dLLNT
 +qlUjdMt2qFYaWy7E5Nx9aOYBHP3Unm8xVm446foPxSvkjbUeSiqFQd5zA2rWsvZ1AfS3OFZu1
 kEw=
X-SBRS: 2.7
X-MesageID: 9202124
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,278,1571716800"; 
   d="scan'208";a="9202124"
To: Jan Beulich <jbeulich@suse.com>
References: <20191204094335.24603-1-andrew.cooper3@citrix.com>
 <20191204094335.24603-5-andrew.cooper3@citrix.com>
 <2d347b3a-7b2e-d28a-59d0-2206bc215206@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d4fc4cfe-b4d0-5c26-12dc-df1631f8d49b@citrix.com>
Date: Wed, 4 Dec 2019 20:04:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2d347b3a-7b2e-d28a-59d0-2206bc215206@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 4/4] x86/svm: Use named (bit)fields for task
 switch exit info
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMTIvMjAxOSAxMDoyNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDQuMTIuMjAxOSAx
MDo0MywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gSW50cm9kdWNlIHZtY2IuZTEuKiBhbmQgdm1j
Yi5lMi4qIHRvIHByb3ZpZGUgbmFtZXMgdG8gZmllbGRzIGluIGV4aXRpbmZvezEsMn0KPj4gcmVz
cGVjdGl2ZWx5LiAgSW1wbGVtZW50IHRoZSB0YXNrIHN3aXRjaCBuYW1lcyBmb3Igbm93LCBhbmQg
Y2xlYW4gdXAgdGhlCj4+IFRBU0tfU1dJVENIIGhhbmRsZXIuCj4gImUxIiBhbmQgImUyIiBsb29r
IG92ZXJseSBzaG9ydCAtIGFuZCBoZW5jZSBwb3NzaWJseSBhbWJpZ3VvdXMgLQo+IHRvIG1lLiBN
YWtlIHRoZW0gcGVyaGFwcyAiZWkxIiBhbmQgImVpMiI/CgpXcml0dGVuIG9uIHRoZWlyIG93biBs
aWtlIHRoYXQgcGVyaGFwcywgYnV0IHRoZSBlaVsxMl0gdmVyc2lvbnMgYXJlCmVxdWFsbHkgYW1i
aWd1b3VzLgoKSG93ZXZlciwgdGhleSBhcmUgb25seSBldmVyIHVzZWQgd2l0aCB2bWNiLT4gaW4g
Y29kZSwgc28gdGhlcmUgaXMgbm8KaXNzdWUgd2l0aCBhbWJpZ3VpdHkuCgo+ICBGdXJ0aGVybW9y
ZSwgc2VlaW5nIC4uLgo+Cj4+IEBAIC0yNzk1LDE5ICsyNzkyLDEyIEBAIHZvaWQgc3ZtX3ZtZXhp
dF9oYW5kbGVyKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQo+PiAgICAgICAgICBpZiAoIGlu
c25fbGVuIDwgMCAmJiAoaW5zbl9sZW4gPSBzdm1fZ2V0X3Rhc2tfc3dpdGNoX2luc25fbGVuKCkp
ID09IDAgKQo+PiAgICAgICAgICAgICAgZ290byBjcmFzaF9vcl9mYXVsdDsKPj4gIAo+PiAtICAg
ICAgICBpZiAoICh2bWNiLT5leGl0aW5mbzIgPj4gMzYpICYgMSApCj4+IC0gICAgICAgICAgICBy
ZWFzb24gPSBUU1dfaXJldDsKPj4gLSAgICAgICAgZWxzZSBpZiAoICh2bWNiLT5leGl0aW5mbzIg
Pj4gMzgpICYgMSApCj4+IC0gICAgICAgICAgICByZWFzb24gPSBUU1dfam1wOwo+PiAtICAgICAg
ICBlbHNlCj4+IC0gICAgICAgICAgICByZWFzb24gPSBUU1dfY2FsbF9vcl9pbnQ7Cj4+IC0gICAg
ICAgIGlmICggKHZtY2ItPmV4aXRpbmZvMiA+PiA0NCkgJiAxICkKPj4gLSAgICAgICAgICAgIGVy
cmNvZGUgPSAodWludDMyX3Qpdm1jYi0+ZXhpdGluZm8yOwo+PiAtCj4+IC0gICAgICAgIGh2bV90
YXNrX3N3aXRjaCh2bWNiLT5leGl0aW5mbzEsIHJlYXNvbiwgZXJyY29kZSwgaW5zbl9sZW4sCj4+
IC0gICAgICAgICAgICAgICAgICAgICAgICAodm1jYi0+ZXhpdGluZm8yICYgKDF1bCA8PCA0OCkp
ID8gWDg2X0VGTEFHU19SRiA6IDApOwo+PiArICAgICAgICBodm1fdGFza19zd2l0Y2godm1jYi0+
ZTEudGFza19zd2l0Y2guc2VsLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgdm1jYi0+ZTIu
dGFza19zd2l0Y2guaXJldCA/IFRTV19pcmV0IDoKPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
IHZtY2ItPmUyLnRhc2tfc3dpdGNoLmptcCAgPyBUU1dfam1wIDogVFNXX2NhbGxfb3JfaW50LAo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgdm1jYi0+ZTIudGFza19zd2l0Y2guZXYgPyB2bWNi
LT5lMi50YXNrX3N3aXRjaC5lYyA6IC0xLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgaW5z
bl9sZW4sIHZtY2ItPmUyLnRhc2tfc3dpdGNoLnJmID8gWDg2X0VGTEFHU19SRiA6IDApOwo+IC4u
LiB0aGlzLCB3b3VsZG4ndCBpdCBtYWtlIHNlbnNlIHRvIHNpbXBseSBoYXZlICJlaSIgY292ZXJp
bmcgYm90aAo+IHBhcnRzLCBubyBsb25nZXIgbWFraW5nIGl0IGEgcmVxdWlyZW1lbnQgdG8gdXNl
IChhbmQgaGVuY2UgbG9vayB1cCkKPiB0aGUgbnVtZXJpYyBzdWZmaXhlcyBhdCB1c2Ugc2l0ZXM/
CgpOZXQgZGVsdGEgaXM6CgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3Zt
L3ZtY2IuaApiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS92bWNiLmgKaW5kZXggMDJiNWU4
NmI0OS4uODY0NjE4Y2NmOSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3Zt
L3ZtY2IuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vdm1jYi5oCkBAIC00MTks
MTcgKzQxOSwxNSBAQCBzdHJ1Y3Qgdm1jYl9zdHJ1Y3QgewrCoMKgwqDCoCB1NjQgaW50ZXJydXB0
X3NoYWRvdzvCoMKgwqDCoMKgwqAgLyogb2Zmc2V0IDB4NjggKi8KwqDCoMKgwqAgdTY0IGV4aXRj
b2RlO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogb2Zmc2V0IDB4NzAgKi8KwqDCoMKg
wqAgdW5pb24gewotwqDCoMKgwqDCoMKgwqAgdTY0IGV4aXRpbmZvMTvCoMKgwqDCoMKgwqDCoMKg
wqAgLyogb2Zmc2V0IDB4NzggKi8KK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCB7CivCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHVpbnQ2NF90IGV4aXRpbmZvMTsgLyogb2Zmc2V0IDB4NzggKi8KK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdWludDY0X3QgZXhpdGluZm8yOyAvKiBvZmZzZXQgMHg4MCAqLwor
wqDCoMKgwqDCoMKgwqAgfTsKwqDCoMKgwqDCoMKgwqDCoCB1bmlvbiB7CsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgewrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50
MTZfdCBzZWw7Ci3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gdGFza19zd2l0Y2g7Ci3CoMKgwqDC
oMKgwqDCoCB9IGUxOwotwqDCoMKgIH07Ci3CoMKgwqAgdW5pb24gewotwqDCoMKgwqDCoMKgwqAg
dTY0IGV4aXRpbmZvMjvCoMKgwqDCoMKgwqDCoMKgwqAgLyogb2Zmc2V0IDB4ODAgKi8KLcKgwqDC
oMKgwqDCoMKgIHVuaW9uIHsKLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHsKK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50NjRfdCA6NDg7CisKwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdWludDMyX3QgZWM7CsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHVpbnQzMl90IDo0OwrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29s
wqDCoMKgwqAgaXJldDoxOwpAQCAtNDQwLDcgKzQzOCw3IEBAIHN0cnVjdCB2bWNiX3N0cnVjdCB7
CsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQzMl90IDozOwrCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29swqDCoMKgwqAgcmY6MTsKwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIH0gdGFza19zd2l0Y2g7Ci3CoMKgwqDCoMKgwqDCoCB9IGUyOworwqDCoMKgwqDC
oMKgwqAgfSBlaTsKwqDCoMKgwqAgfTsKwqDCoMKgwqAgaW50aW5mb190IGV4aXRpbnRpbmZvO8Kg
wqDCoMKgwqAgLyogb2Zmc2V0IDB4ODggKi8KwqDCoMKgwqAgdTY0IF9ucF9lbmFibGU7wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC8qIG9mZnNldCAweDkwIC0gY2xlYW5iaXQgNCAqLwoKTEdUTS4K
Cn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
