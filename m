Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFCFAD797
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 13:05:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7HRa-00071q-U9; Mon, 09 Sep 2019 11:02:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RLmJ=XE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i7HRZ-00071j-RN
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 11:02:49 +0000
X-Inumbo-ID: 5bff0b3a-d2f1-11e9-ac0a-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bff0b3a-d2f1-11e9-ac0a-12813bfff9fa;
 Mon, 09 Sep 2019 11:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568026968;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=50hYv3W7j2ygLMx9Yjv3MoOF8agqmiJ2idIu8AFBSQ0=;
 b=PWr3qaoiwTdE2rOr3lTij7HaLufzXm5V/hN6TBZubVAyGM7BK1wEgLGK
 hmmNFKuwb/u74H27eMaQUJPIstd0HX/pCMgpixcT9iOfCrSOGijBrBf6c
 cnprJQ1XllLOba16M1ymcYunJD1owxiPTGwhBv73RzZ/7hakxakdNstIw w=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bhzI2NJkSBT5UeKsA5WhAxWdgJCbirG59ltGXo2HEa+cGEqjhpkWb13nGY3XsQjXh7I9//CMn4
 LrftwFyWjvRozABoNlLjrFZv1pgN2IahJtkJwz2Ze8CjLLEHypAENNBO4TnHrGN2ug5Lrfeyp2
 hBuGz37Yup454NBrSyy8+Ds3OpLo1dd84rTsAy7d+u1wcj313qIDntPbOppIQIlKy3USJQMBNm
 OVihLocSvSmhTxGZJe2TIVVlglD1FbdYLdCOv4y5Tv0Lws2mVOmOIYgzrINtX8aXKFsTS0Omyr
 VTA=
X-SBRS: 2.7
X-MesageID: 5588452
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,484,1559534400"; 
   d="scan'208";a="5588452"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <7f995809-c993-c7aa-1fed-c155912363c7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <3fc94cce-0c85-c978-feb9-8bb9b875d14c@citrix.com>
Date: Mon, 9 Sep 2019 12:02:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7f995809-c993-c7aa-1fed-c155912363c7@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH RFC] x86/HVM: use single (atomic) MOV for
 aligned emulated writes
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
Cc: Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDkvMjAxOSAxNTowNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVXNpbmcgbWVtY3B5KCkg
bWF5IHJlc3VsdCBpbiBtdWx0aXBsZSBpbmRpdmlkdWFsIGJ5dGUgYWNjZXNzZXMKPiAoZGVwZW5k
ZW5pbmcgaG93IG1lbWNweSgpIGlzIGltcGxlbWVudGVkIGFuZCBob3cgdGhlIHJlc3VsdGluZyBp
bnNucywKPiBlLmcuIFJFUCBNT1ZTQiwgZ2V0IGNhcnJpZWQgb3V0IGluIGhhcmR3YXJlKSwgd2hp
Y2ggaXNuJ3Qgd2hhdCB3ZQo+IHdhbnQvbmVlZCBmb3IgY2Fycnlpbmcgb3V0IGd1ZXN0IGluc25z
IGFzIGNvcnJlY3RseSBhcyBwb3NzaWJsZS4gRmFsbAo+IGJhY2sgdG8gbWVtY3B5KCkgb25seSBm
b3IgbWlzYWxpZ25lZCBhY2Nlc3NlcyBhcyB3ZWxsIGFzIG9uZXMgbm90IDIsIDQsCj4gb3IgOCBi
eXRlcyBpbiBzaXplLgo+Cj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPiAtLS0KPiBSRkM6IEJlc2lkZXMgd2FudGluZyB0byBoZWFyIGlmIHRoaXMgaXMg
Y29uc2lkZXJlZCBhY2NlcHRhYmxlIGFuZAo+ICAgICAgc3VmZmljaWVudCAob3Igd2hldGhlciBp
dCBpcyB0aG91Z2h0IHRoYXQgdGhlIGxpbmVhcl93cml0ZSgpIHBhdGgKPiAgICAgIGFsc28gbmVl
ZHMgcGxheWluZyB3aXRoKSwgdGhlIHF1ZXN0aW9uIGlzIHdoZXRoZXIgd2UnZCB3YW50IHRvCj4g
ICAgICBleHRlbmQgdGhpcyB0byByZWFkcyBhcyB3ZWxsLiBsaW5lYXJfe3JlYWQsd3JpdGV9KCkg
Y3VycmVudGx5IGRvbid0Cj4gICAgICB1c2UgaHZtZW11bF9tYXBfbGluZWFyX2FkZHIoKSwgaS5l
LiBpbiBib3RoIGNhc2VzIEknZCBuZWVkIHRvIGFsc28KPiAgICAgIGZpZGRsZSB3aXRoIF9faHZt
X2NvcHkoKSAocGVyaGFwcyBieSBtYWtpbmcgdGhlIGNvbnN0cnVjdCBiZWxvdyBhCj4gICAgICBo
ZWxwZXIgZnVuY3Rpb24pLgo+Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMKPiAr
KysgYi94ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYwo+IEBAIC0xMzUyLDcgKzEzNTIsMTQgQEAg
c3RhdGljIGludCBodm1lbXVsX3dyaXRlKAo+ICAgICAgaWYgKCAhbWFwcGluZyApCj4gICAgICAg
ICAgcmV0dXJuIGxpbmVhcl93cml0ZShhZGRyLCBieXRlcywgcF9kYXRhLCBwZmVjLCBodm1lbXVs
X2N0eHQpOwo+ICAKPiAtICAgIG1lbWNweShtYXBwaW5nLCBwX2RhdGEsIGJ5dGVzKTsKPiArICAg
IC8qIEZvciBhbGlnbmVkIGFjY2Vzc2VzIHVzZSBzaW5nbGUgKGFuZCBoZW5jZSBhdG9taWMpIE1P
ViBpbnNucy4gKi8KPiArICAgIHN3aXRjaCAoIGJ5dGVzIHwgKCh1bnNpZ25lZCBsb25nKW1hcHBp
bmcgJiAoYnl0ZXMgLSAxKSkgKQoKV2h5IG9ubHkgZm9yIGFsaWduZWQgdmFsdWVzP8KgIE1pc2Fs
aWduZWQgYXJlIGF0b21pYyBvbiBhbG1vc3QgYWxsIDY0LWJpdApjYXBhYmxlIHN5c3RlbXMsIGFu
ZCBtYXBwaW5nIHdpbGwgY29ycmVjdGx5IHNwYW4gYSBwYWdlIGJvdW5kYXJ5IGlmCm5lY2Vzc2Fy
eS4KCn5BbmRyZXcKCj4gKyAgICB7Cj4gKyAgICBjYXNlIDI6IHdyaXRlX3UxNl9hdG9taWMobWFw
cGluZywgKih1aW50MTZfdCAqKXBfZGF0YSk7IGJyZWFrOwo+ICsgICAgY2FzZSA0OiB3cml0ZV91
MzJfYXRvbWljKG1hcHBpbmcsICoodWludDMyX3QgKilwX2RhdGEpOyBicmVhazsKPiArICAgIGNh
c2UgODogd3JpdGVfdTY0X2F0b21pYyhtYXBwaW5nLCAqKHVpbnQ2NF90ICopcF9kYXRhKTsgYnJl
YWs7Cj4gKyAgICBkZWZhdWx0OiBtZW1jcHkobWFwcGluZywgcF9kYXRhLCBieXRlcyk7ICAgICAg
ICAgICAgICAgIGJyZWFrOwo+ICsgICAgfQo+ICAKPiAgICAgIGh2bWVtdWxfdW5tYXBfbGluZWFy
X2FkZHIobWFwcGluZywgYWRkciwgYnl0ZXMsIGh2bWVtdWxfY3R4dCk7Cj4gIAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
