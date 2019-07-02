Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FB85D3D2
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 18:02:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiLB9-0005oP-1P; Tue, 02 Jul 2019 15:58:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SKLB=U7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hiLB7-0005oI-QK
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 15:58:45 +0000
X-Inumbo-ID: 444e514f-9ce2-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 444e514f-9ce2-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 15:58:43 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: j43i8dAE9b2iaNZgo7hU8ydV4rRFLXhaeCvOdz0+qvHtpcncbAAgsOzIHTwPnd6eKH0jnTgBgb
 4rum/rRmuaZ0AYZBJvmb5BOwk6/o3G0xfP9MJd6q52cYnLhZB/qI77pBC61kjzvzL8wJTcKZVH
 oRkEH2pfx2+WWwrTBFKQZ7O/ypsblAGB6mlLhbxCxxqiWOZkfsoFqFq7rtUrwYTMD+EmLnKAk6
 RxLks6W2jd2ThjqFW7DkDKfN/XdCmG8yyPImIjaZ1+yeBiX64DHJEOmOM51vI1Pb9aLma8Quc7
 zVE=
X-SBRS: 2.7
X-MesageID: 2521226
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,443,1557201600"; 
   d="scan'208";a="2521226"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D14DDA6020000780023B96E@prv1-mh.provo.novell.com>
 <5D14DF81020000780023B9DF@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <f3798406-3072-14db-cb15-d88cc1762c55@citrix.com>
Date: Tue, 2 Jul 2019 16:08:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5D14DF81020000780023B9DF@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH RFC v2 10/10] AMD/IOMMU: correct IRTE
 updating
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
Cc: Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDYvMjAxOSAxNjoyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2hpbGUgZm9yIDMyLWJp
dCBJUlRFcyBJIHRoaW5rIHdlIGNhbiBzYWZlbHkgY29udGludWUgdG8gYXNzdW1lIHRoYXQgdGhl
Cj4gd3JpdGVzIHdpbGwgdHJhbnNsYXRlIHRvIGEgc2luZ2xlIE1PViwgdGhlIHVzZSBvZiBDTVBY
Q0hHMTZCIGlzIG1vcmUKClRoZSBDTVBYQ0hHMTZCIGhlcmUgaXMgc3RhbGUuCgo+IGhlYXZ5IGhh
bmRlZCB0aGFuIG5lY2Vzc2FyeSBmb3IgdGhlIDEyOC1iaXQgZm9ybSwgYW5kIHRoZSBmbHVzaGlu
Zwo+IGRpZG4ndCBnZXQgZG9uZSBhbG9uZyB0aGUgbGluZXMgb2Ygd2hhdCB0aGUgc3BlY2lmaWNh
dGlvbiBzYXlzLiBNYXJrCj4gZW50cmllcyB0byBiZSB1cGRhdGVkIGFzIG5vdCByZW1hcHBlZCAo
d2hpY2ggd2lsbCByZXN1bHQgaW4gaW50ZXJydXB0Cj4gcmVxdWVzdHMgdG8gZ2V0IHRhcmdldCBh
Ym9ydGVkLCBidXQgdGhlIGludGVycnVwdHMgc2hvdWxkIGJlIG1hc2tlZAo+IGFueXdheSBhdCB0
aGF0IHBvaW50IGluIHRpbWUpLCBpc3N1ZSB0aGUgZmx1c2gsIGFuZCBvbmx5IHRoZW4gd3JpdGUg
dGhlCj4gbmV3IGVudHJ5LiBJbiB0aGUgMTI4LWJpdCBJUlRFIGNhc2Ugc2V0IFJlbWFwRW4gc2Vw
YXJhdGVseSBsYXN0LCB0byB0aGF0Cj4gdGhlIG9yZGVyaW5nIG9mIHRoZSB3cml0ZXMgb2YgdGhl
IHR3byA2NC1iaXQgaGFsdmVzIHdvbid0IG1hdHRlci4KPgo+IEluIHVwZGF0ZV9pbnRyZW1hcF9l
bnRyeV9mcm9tX21zaV9tc2coKSBhbHNvIGZvbGQgdGhlIGR1cGxpY2F0ZSBpbml0aWFsCj4gbG9j
ayBkZXRlcm1pbmF0aW9uIGFuZCBhY3F1aXJlIGludG8ganVzdCBhIHNpbmdsZSBpbnN0YW5jZS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAtLS0K
PiBSRkM6IFB1dHRpbmcgdGhlIGZsdXNoIGludm9jYXRpb25zIGluIGxvb3BzIGlzbid0IG92ZXJs
eSBuaWNlLCBidXQgSQo+ICAgICAgZG9uJ3QgdGhpbmsgdGhpcyBjYW4gcmVhbGx5IGJlIGFidXNl
ZCwgc2luY2UgY2FsbGVycyB1cCB0aGUgc3RhY2sKPiAgICAgIGhvbGQgZnVydGhlciBsb2Nrcy4g
TmV2ZXJ0aGVsZXNzIEknZCBsaWtlIHRvIGFzayBmb3IgYmV0dGVyCj4gICAgICBzdWdnZXN0aW9u
cy4KPiAtLS0KPiB2MjogUGFydHMgbW9ycGhlZCBpbnRvIGVhcmxpZXIgcGF0Y2guCj4KPiAtLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW50ci5jCj4gKysrIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYwo+IEBAIC0yMzgsOCArMjM4LDcgQEAg
c3RhdGljIHZvaWQgdXBkYXRlX2ludHJlbWFwX2VudHJ5KHVuaW9uCj4gICAgICAgICAgYnJlYWs7
Cj4gIAo+ICAgICAgY2FzZSBpcnRlMTI4Ogo+IC0gICAgICAgIEFDQ0VTU19PTkNFKGVudHJ5LnB0
cjEyOC0+cmF3WzBdKSA9IDA7Cj4gLSAgICAgICAgYmFycmllcigpOwo+ICsgICAgICAgIEFTU0VS
VCghZW50cnkucHRyMTI4LT5mdWxsLnJlbWFwX2VuKTsKPiAgICAgICAgICBlbnRyeS5wdHIxMjgt
PnJhd1sxXSA9Cj4gICAgICAgICAgICAgIGNvbnRhaW5lcl9vZigmZnVsbCwgdW5pb24gaXJ0ZTEy
OCwgZnVsbCktPnJhd1sxXTsKPiAgICAgICAgICBiYXJyaWVyKCk7Cj4gQEAgLTMwOCw2ICszMDcs
MjAgQEAgc3RhdGljIGludCB1cGRhdGVfaW50cmVtYXBfZW50cnlfZnJvbV9pbwo+ICAgICAgfQo+
ICAKPiAgICAgIGVudHJ5ID0gZ2V0X2ludHJlbWFwX2VudHJ5KGlvbW11LT5zZWcsIHJlcV9pZCwg
b2Zmc2V0KTsKPiArCj4gKyAgICAvKiBUaGUgUmVtYXBFbiBmaWVsZHMgbWF0Y2ggZm9yIGFsbCBm
b3JtYXRzLiAqLwo+ICsgICAgd2hpbGUgKCBpb21tdS0+ZW5hYmxlZCAmJiBlbnRyeS5wdHIzMi0+
YmFzaWMucmVtYXBfZW4gKQoKV2h5IHdoaWxlP8KgIChhbmQgYnkgdGhpcywgd2hhdCBJIG1lYW4g
aXMgdGhhdCB0aGlzIGRlZmluaXRlbHkgbmVlZHMgYQpjb21tZW50LCBiZWNhdXNlIHRoZSBjb2Rl
IGxvb2tzIGxpa2UgaXQgb3VnaHQgdG8gYmUgYW4gaWYuKQoKfkFuZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
