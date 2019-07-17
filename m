Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF436BA2F
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 12:30:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnh9T-0008Vf-6H; Wed, 17 Jul 2019 10:27:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q+i/=VO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hnh9R-0008Va-Oq
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 10:27:09 +0000
X-Inumbo-ID: 6dd7e1c6-a87d-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6dd7e1c6-a87d-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 10:27:08 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pUyzlBBF1M43viyqJT6n2OJvxI9G5l+tiN/CmBYAq8TQKsGHfKPSDPewFF5ReH1hWroHF7TcV+
 hWUSGa50wALX4yXx6zBr/M/WwEHqxqDuce/wMONgM7qORjgq7SD3h57/lSf62EjxQLSr4IDrZ9
 OgyIcsLEj5/TCyQd3e9NUMFCkUnUkuHEvinqzfYoPi8XhfLCFBl5i+aMaoPJ7f28qQDRKrH2YV
 zs+0MvQw1HGl12b4x9JnJOwhHZOhbomyaPHZOusP3YYPXk26veNK+wNJPbKAYbLQKNlmXaCSOO
 zk0=
X-SBRS: 2.7
X-MesageID: 3163104
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,274,1559534400"; 
   d="scan'208";a="3163104"
Date: Wed, 17 Jul 2019 12:26:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190717102658.psnrdlrjpb5kvm4e@Air-de-Roger.citrite.net>
References: <0dbf8520-89c7-753e-c10a-13399aec9cd5@suse.com>
 <7e5fba10-b957-81ed-a1d8-d4c7447f0d51@suse.com>
 <20190716142632.zallvho5vor4ug75@Air-de-Roger.citrite.net>
 <97f3e531-6c25-b8fa-c1b0-b68a183365f0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <97f3e531-6c25-b8fa-c1b0-b68a183365f0@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 3/5] x86/AMD: make C-state handling
 independent of Dom0
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMDk6MDQ6NTVBTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTYuMDcuMjAxOSAxNjoyNiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBXZWQsIEp1bCAwMywgMjAxOSBhdCAwMTowMTo0OFBNICswMDAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiAtLS0gYS94ZW4vYXJjaC94ODYvYWNwaS9jcHVfaWRsZS5jCj4gPj4gKysrIGIveGVu
L2FyY2gveDg2L2FjcGkvY3B1X2lkbGUuYwo+ID4+IEBAIC0xMTAsNiArMTEwLDggQEAgYm9vbGVh
bl9wYXJhbSgibGFwaWNfdGltZXJfYzJfb2siLCBsb2NhbAo+ID4+ICAgIAo+ID4+ICAgIHN0cnVj
dCBhY3BpX3Byb2Nlc3Nvcl9wb3dlciAqX19yZWFkX21vc3RseSBwcm9jZXNzb3JfcG93ZXJzW05S
X0NQVVNdOwo+ID4+ICAgIAo+ID4+ICtzdGF0aWMgaW50OF90IF9fcmVhZF9tb3N0bHkgdmVuZG9y
X292ZXJyaWRlOwo+ID4gCj4gPiBBRkFJQ1QgZnJvbSB0aGUgY29kZSBiZWxvdyB0aGlzIGlzIGEg
dHJpLXN0YXRlICgtMSwgMCwgMSkuIENvdWxkIGl0Cj4gPiBtYXliZSBiZSB0dXJuZWQgaW50byBh
biBlbnVtIHdpdGggZGVmaW5pdGlvbnMgb2YgdGhlIGRpZmZlcmVudAo+ID4gc3RhdGVzPwo+ID4g
Cj4gPiBJIHRoaW5rIGl0IHdvdWxkIG1ha2UgdGhlIHVzYWdlIGNsZWFyZXIuCj4gCj4gV2VsbCwg
cGVyc29uYWxseSBJIHByZWZlciBkb2luZyBpdCB0aGlzIHdheSBmb3IgdHJpc3RhdGVzLiBJJ2xs
Cj4gd2FpdCB0byBzZWUgd2hhdCBvdGhlcnMgdGhpbmsuCgpBY2ssIEkgdGhpbmsgdGhlIGNvZGUg
aXMgY29ycmVjdCBoZW5jZToKClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KCkJ1dCBJIHBlcnNvbmFsbHkgd291bGQgcHJlZmVyIGFuIGVudW0gb3Ig
YXQgbGVhc3QgYSBkZXNjcmlwdGlvbiBvZgp0aGUgbWVhbmluZyBvZiB0aGUgdmFsdWVzIHZlbmRv
cl9vdmVycmlkZSBjYW4gdGFrZS4gSU1PIGl0IHdvdWxkIGhlbHAKdW5kZXJzdGFuZGluZyB0aGUg
Y29kZSwgc2luY2UgaXQncyBub3Qgb2J2aW91cyB0byBtZSBhdCBmaXJzdCBzaWdodC4KClRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
