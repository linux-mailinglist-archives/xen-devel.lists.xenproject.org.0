Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A4FB6284
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 13:53:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAYTp-0007sl-5K; Wed, 18 Sep 2019 11:50:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ym9G=XN=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iAYTn-0007sb-RA
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 11:50:39 +0000
X-Inumbo-ID: 8864b25e-da0a-11e9-a337-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8864b25e-da0a-11e9-a337-bc764e2007e4;
 Wed, 18 Sep 2019 11:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568807440;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=irjwbpmgmdvPHk51KEuRSFLy2FKLuVZBcPT1l3J+j+I=;
 b=F0Q2T+OPuz4AGJHccoH4xTJDGgxYoug9yP9O0DupcQJKIKxh//kibfdX
 BNiE4s3kq1sU6E7GCV+vcaYeKDM4ig0l2+vTz/MunlDVtAmCzrejMinwc
 /d9KzjU7YUSE5G+RaLtXZjjMGp+9gI1rTK1KkclJZB++8qrt4CjamJ9Ys 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: j8WLZUvSUBjeRz4YZMoaxk4TaWr5lkvHNUdYpxHlJ4kMiU38mJyXdfVMlI80PoY9cxI9FJuANY
 eZ1Ur9/9iItFDIcqxJpuCN1p8xOI93qgGpo32nHj4SuREm0lTkwdpiNSzp9UiqpniEd2b0ZiR1
 jABjuxCXaMvHfY7Ta52FiafdEjMaprx1EvBYksRLuYWKEWxFO6Hjd/gPBo2rLF6QtmCk0ilLWP
 ufvSoWcxjhrqmEIWxhKUXm8jad8Or+3ba4Bs5QErwZdVQl5f/mnORvoycBOHHcrNNRVkT9/RrB
 D+s=
X-SBRS: 2.7
X-MesageID: 5721130
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="5721130"
From: Lars Kurth <lars.kurth@citrix.com>
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>, Ian Jackson
 <Ian.Jackson@citrix.com>
Thread-Topic: [PATCH] create-diff-object: more precisely identify .rodata
 sections
Thread-Index: AQHVbfOz/MMBt+ID2EWJUuzwV092UacxMOkAgAAAuYD//+ijAIAAA2sAgAAA4wCAACNLgA==
Date: Wed, 18 Sep 2019 11:50:29 +0000
Message-ID: <DE970A9E-2639-4903-98C0-D61D1186B584@citrix.com>
References: <20190918073538.24707-1-wipawel@amazon.de>
 <9c5a2063-35ab-5590-a079-9f361d95f7ee@suse.com>
 <2FFA152B-47AB-4C0E-9747-66B2D9EDFCAA@amazon.com>
 <e14a8a90-0afa-ebdd-ce70-be7896e9b612@arm.com>
 <23938.2492.424579.175738@mariner.uk.xensource.com>
 <4134F5DE-6497-4F32-9A5F-866E4D6C0735@amazon.com>
In-Reply-To: <4134F5DE-6497-4F32-9A5F-866E4D6C0735@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.e.190909
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <CA516FEA5118C04790BCB5720FE9DC68@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] create-diff-object: more precisely identify
 .rodata sections
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, "Pohlack,
 Martin" <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDE4LzA5LzIwMTksIDExOjQ0LCAiV2llY3pvcmtpZXdpY3osIFBhd2VsIiA8d2lw
YXdlbEBhbWF6b24uZGU+IHdyb3RlOg0KDQogICAgPiBPbiAxOC4gU2VwIDIwMTksIGF0IDEyOjQx
LCBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6DQogICAgPiANCiAg
ICA+IEp1bGllbiBHcmFsbCB3cml0ZXMgKCJSZTogW1BBVENIXSBjcmVhdGUtZGlmZi1vYmplY3Q6
IG1vcmUgcHJlY2lzZWx5IGlkZW50aWZ5IC5yb2RhdGEgc2VjdGlvbnMiKToNCiAgICA+PiBPbiAx
OC8wOS8yMDE5IDEwOjUyLCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3JvdGU6DQogICAgPj4+ICQg
c2NyaXB0cy8uL2FkZF9tYWludGFpbmVycy5wbCAtZCB+L2dpdC9saXZlcGF0Y2gtYnVpbGQtdG9v
bHMNCiAgICA+PiANCiAgICA+PiAnLWQnIG9ubHkgdGVsbHMgeW91IHdoZXJlIHRoZSBwYXRjaGVz
IGZpbGVzIGFyZS4gVGhlIHNjcmlwdCB3aWxsIGxvb2sgdXAgZm9yIHRoZSANCiAgICA+PiBNQUlO
VEFJTkVSUyBmaWxlIGluIHRoZSBjdXJyZW50IGRpcmVjdG9yeS4NCiAgICA+IA0KICAgID4gSG1t
bS4gIEkgd29uZGVyIGlmIHdlIGNvdWxkIGRldGVjdCB0aGlzIHNpdHVhdGlvbiBzb21laG93LiAg
VGhpcyB3aWxsDQogICAgPiBiZSBhIGNvbW1vbiB1c2VyIGVycm9yIEkgdGhpbmsuDQoNCkkgZG9u
J3QgdGhpbmsgaXQgaXMgcG9zc2libGUgdG8gZGV0ZWN0IHRoYXQgc2l0dWF0aW9uIGFzIGdpdCBm
b3JtYXQtcGF0Y2ggZG9lcyBub3QgdGVsbCB5b3Ugd2hpY2ggdHJlZSBhIHBhdGNoIHdhcyBnZW5l
cmF0ZWQgZnJvbS4NCiAgICANCiAgICBJIHNob3VsZCBoYXZlIGxvb2tlZCB0d2ljZSBiZWZvcmUg
c2VuZGluZyB0aGUgcGF0Y2ggb3V0LiBCdXQsIHdoYXQgd291bGQgYmUgdmVyeSBoZWxwZnVsIGZv
ciBtZQ0KICAgIGlzIGFkZGl0aW9uYWwgb3B0aW9uIHRvIHRoZSBhZGRfbWFpbnRhaW5lcnMucGwg
c2NyaXB0IGxpa2U6IC1tIC4vTUFJTlRBSU5FUlMNCiAgICANCkluIG15IHZpZXcgdGhpcyBpcyBv
bmx5IHJlYWxseSBhbiBpc3N1ZSBpZiB5b3UgY3JlYXRlIGEgcGF0Y2ggb3Igc2VyaWVzIGFuZCB0
aGVuIGRvIHNvbWV0aGluZyBlbHNlIGJlZm9yZSBmaW5hbGl6aW5nIGFuZCBzZW5kaW5nIHRoZSBw
YXRjaCwgb3RoZXJ3aXNlIEkgd291bGQgaGF2ZSB0cmlwcGVkIG92ZXIgdGhpcyBteXNlbGYuIEJ1
dCBvZiBjb3Vyc2UsIGlmIHlvdSB3b3JrIG9uIG11bHRpcGxlIHNlcmllcyBhdCB0aGUgc2FtZSB0
aW1lIHRoYXQgaXMgYW4gZWFzeSBtaXN0YWtlIHRvIG1ha2UuDQoNCkkgd291bGQgZXhwZWN0IHRo
YXQgdGhlIG1vc3QgY29tbW9uIGRpcmVjdG9yeSBzdHJ1Y3R1cmUgZm9yIHBlb3BsZSBpcyB0byBo
YXZlIGEgZGlyZWN0b3J5IHN0cnVjdHVyZSBzdWNoIGFzDQp+L2NvZGUveGVuLmdpdA0Kfi9jb2Rl
L2xpdmVwYXRjaC1idWlsZC10b29scw0KLi4uDQp+L2NvZGUvcGF0Y2hlcyANCg0KYW5kIHRoYXQg
cGVvcGxlIHN3aXRjaCBiZXR3ZWVuIGdpdCBkaXJlY3Rvcmllcy4gTG9va2luZyBhdCB0aGUgY29k
ZSwgSSBzaG91bGQgYmUgYWJsZSB0byBhZGQgYSAtbSBvcHRpb24sIHdoaWNoIHdvdWxkIHdvcmsg
b3V0IHRoZSBkaXJlY3RvcnkgaW4gd2hpY2ggTUFJTlRBSU5FUlMgaXMsIHRoZW4gc3dpdGNoIHRv
IGl0LCBkbyB0aGUgcHJvY2Vzc2luZyBhbmQgc3dpdGNoIGJhY2sgdG8gd2hlcmUgd2Ugc3RhcnRl
ZCBmcm9tLg0KDQpIb3dldmVyLCB0aGlzIHdvdWxkIG9ubHkgcmVhbGx5IHdvcmssIGlmIHRoZXJl
IHdhcyBhIHN0cm9uZyByZWNvbW1lbmRhdGlvbiBpbiBodHRwczovL3dpa2kueGVucHJvamVjdC5v
cmcvd2lraS9TdWJtaXR0aW5nX1hlbl9Qcm9qZWN0X1BhdGNoZXMjVXNpbmdfYWRkX21haW50YWlu
ZXJzLnBsXy4yOG9yX2dldF9tYWludGFpbmVyLnBsLjI5X2Zyb21fb3V0c2lkZV9vZl94ZW4uZ2l0
IHRlbGxpbmcgcGVvcGxlIHRvIHVzZSAtbSAkcGF0aC9NQUtFRklMRSB3aGVuIHdvcmtpbmcgb24g
bXVsdGlwbGUgZGlyZWN0b3JpZXMNCg0KV291bGQgdGhhdCB3b3JrPw0KDQpMYXJzDQogDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
