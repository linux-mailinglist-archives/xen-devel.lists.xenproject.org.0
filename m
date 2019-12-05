Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EB91140E1
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 13:36:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icqJs-0008Qi-Ox; Thu, 05 Dec 2019 12:33:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G9sg=Z3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1icqJr-0008QW-5F
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 12:33:19 +0000
X-Inumbo-ID: 6a1aa2ad-175b-11ea-8223-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a1aa2ad-175b-11ea-8223-12813bfff9fa;
 Thu, 05 Dec 2019 12:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575549199;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=NovB7znDUd/LAYkPkhEIUxrTvgxArmEoIXAIMJYAbpQ=;
 b=ItQX+FRbH0cftsFRgaDSKjDN4CQwVvCXpVQQGerXG3pcDGPJeclnlP1V
 2egqmHI1aq2NJdBqDVM8B3Iq56+zHDr9R754btdevHp31Zyo05PFvWX7w
 Qnn5lYIEw9uYaWWzy+XUquABmD4YqDsKL+jKRC+kUrtFpAz7AlGvdIO/D w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1pN9W8mIOiBSA+7rMuuOVLjj41gVrvYXZt510cdbRnfItjpwMVCwat+SlqqwzRAW2Q3IehlRBK
 N1Ns0aY3Tcl4G2YeRsEKmQv7o3SGFr3yE3B+4wST7yE1rTApjSOgZjvVb+Ccikb6x1JLy/zREz
 M0E14PRCHxOKfadjKAV1SNHHOSmmAwAzQBIwQUjrCOgJz686O7LZKGuMm6wJo71b8xHoI7E+R6
 dSGPmMgQcDvxwXQ065JHEFMmec3Cj7ILo2hnPsQ/Y20UqOday2SD/3k9ronwj4plEaLu6YdBb0
 jaA=
X-SBRS: 2.7
X-MesageID: 9369854
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,281,1571716800"; 
   d="scan'208";a="9369854"
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20191204094335.24603-1-andrew.cooper3@citrix.com>
 <20191204094335.24603-4-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <31e41913-8ead-37e6-99de-1fa07e24bba5@citrix.com>
Date: Thu, 5 Dec 2019 12:33:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191204094335.24603-4-andrew.cooper3@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 3/4] x86/svm: Clean up intinfo_t variables
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMTIvMjAxOSAwOTo0MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgdHlwZSBuYW1l
IGlzIHBvb3IgYmVjYXVzZSB0aGUgdHlwZSBpcyBhbHNvIHVzZWQgZm9yIHRoZSBJRFQgdmVjdG9y
aW5nCj4gZmllbGQsIG5vdCBqdXN0IGZvciB0aGUgZXZlbnQgaW5qZWN0aW9uIGZpZWxkLiAgUmVu
YW1lIGl0IHRvIGludGluZm9fdCB3aGljaAo+IGlzIGhvdyB0aGUgQVBNIHJlZmVycyB0byB0aGUg
ZGF0YS4KPgo+IFJlYXJyYW5nZSB0aGUgdW5pb24gdG8gZHJvcCB0aGUgLmZpZWxkcyBpbmZpeCwg
YW5kIHJlbmFtZSBieXRlcyB0byB0aGUgbW9yZQo+IGNvbW1vbiByYXcuCj4KPiBXaGlsZSBhZGp1
c3RpbmcgYWxsIGNhbGwgc2l0ZXMsIGZpeCB1cCBzdHlsZSBpc3N1ZXMgYW5kIG1ha2UgdXNlIG9m
IHN0cnVjdHVyZQo+IGFzc2lnbm1lbnRzIHdoZXJlIGFwcGxpY2FibGUuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IEND
OiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+Cj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IC0tLQo+
ICB4ZW4vYXJjaC94ODYvaHZtL3N2bS9pbnRyLmMgICAgICAgIHwgMzIgKysrKysrKystLS0tLS0t
LS0tCj4gIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL25lc3RlZHN2bS5jICAgfCAyOCArKysrKysrLS0t
LS0tLS0tCj4gIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jICAgICAgICAgfCA2OCArKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICB4ZW4vYXJjaC94ODYvaHZtL3N2bS9z
dm1kZWJ1Zy5jICAgIHwgMTIgKysrLS0tLQo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0v
dm1jYi5oIHwgMjIgKysrKysrLS0tLS0tCj4gIDUgZmlsZXMgY2hhbmdlZCwgNzUgaW5zZXJ0aW9u
cygrKSwgODcgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9z
dm0vaW50ci5jIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vaW50ci5jCj4gaW5kZXggZmY3NTUxNjVj
ZC4uNGVlZGU1Y2MyMyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9pbnRyLmMK
PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9pbnRyLmMKPiBAQCAtNDMsMTUgKzQzLDEzIEBA
IHN0YXRpYyB2b2lkIHN2bV9pbmplY3Rfbm1pKHN0cnVjdCB2Y3B1ICp2KQo+ICB7Cj4gICAgICBz
dHJ1Y3Qgdm1jYl9zdHJ1Y3QgKnZtY2IgPSB2LT5hcmNoLmh2bS5zdm0udm1jYjsKPiAgICAgIHUz
MiBnZW5lcmFsMV9pbnRlcmNlcHRzID0gdm1jYl9nZXRfZ2VuZXJhbDFfaW50ZXJjZXB0cyh2bWNi
KTsKPiAtICAgIGV2ZW50aW5qX3QgZXZlbnQ7Cj4gIAo+IC0gICAgZXZlbnQuYnl0ZXMgPSAwOwo+
IC0gICAgZXZlbnQuZmllbGRzLnYgPSAxOwo+IC0gICAgZXZlbnQuZmllbGRzLnR5cGUgPSBYODZf
RVZFTlRUWVBFX05NSTsKPiAtICAgIGV2ZW50LmZpZWxkcy52ZWN0b3IgPSAyOwo+IC0KPiAtICAg
IEFTU0VSVCh2bWNiLT5ldmVudGluai5maWVsZHMudiA9PSAwKTsKPiAtICAgIHZtY2ItPmV2ZW50
aW5qID0gZXZlbnQ7Cj4gKyAgICBBU1NFUlQoIXZtY2ItPmV2ZW50aW5qLnYpOwo+ICsgICAgdm1j
Yi0+ZXZlbnRpbmogPSAoaW50aW5mb190KXsKPiArICAgICAgICAudmVjdG9yID0gMiwKPiArICAg
ICAgICAudHlwZSA9IFg4Nl9FVkVOVFRZUEVfTk1JLAo+ICsgICAgICAgIC52ID0gdHJ1ZSwKPiAr
ICAgIH07CgpBbmQgaW4gYSBzdXJwcmlzZSBtb3ZlIChub3QgcmVhbGx5KSwgQ2VudE9TIDYgaXNu
J3QgaGFwcHkgd2l0aCB0aGlzLgoKSSdsbCByZXZlcnQgYmFjayB0byB0aGUgcHJldmlvdXMgd2F5
IG9mIGZpbGxpbmcgaW4gZXZlbnRpbmogKHVudGlsIHdlCmNhbiBhY3R1YWxseSBkZWNpZGUgb24g
YSBuZXdlciB0b29scyBiYXNlbGluZSkuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
