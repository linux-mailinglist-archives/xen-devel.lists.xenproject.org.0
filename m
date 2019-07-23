Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B76271864
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 14:42:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpu5s-0001PX-JU; Tue, 23 Jul 2019 12:40:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=079Z=VU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hpu5r-0001PS-1Y
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 12:40:35 +0000
X-Inumbo-ID: 1026be6b-ad47-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1026be6b-ad47-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 12:40:33 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Xc7p+y3sh1YcuMmUvtq5BOMj/XX3bXrIzauot/zPtt9Q9tKxO2u7Qu7Rr9bi2ELOzeCoVn+rlp
 mWsMxSWZoPhpqyqEldBHfc0WtIoHf6jeiPBK0aiTvo81Mq6iPi0sbn1nxLCXnZtQ3mkLXWMPZi
 x7cOp/Ea6kH//p3jj8cBIlTzYKWYSRT2cG83NKGskLY3DUOpOog4cb0rlF+LngzijN9VhvQdf6
 QfJ6dIfCmksx4wamswjbqYjxip3uM1bgKMK8SPlNNr5B1UYEm6PS6pk9dbL86KZEb7pvpLWRYA
 H2k=
X-SBRS: 2.7
X-MesageID: 3410738
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,299,1559534400"; 
   d="scan'208";a="3410738"
Date: Tue, 23 Jul 2019 14:40:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190723124024.raxi6fba5wkshybv@Air-de-Roger>
References: <20190722153209.73107-1-roger.pau@citrix.com>
 <379d08e8-9a22-7687-54a3-650f0baa72b5@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <379d08e8-9a22-7687-54a3-650f0baa72b5@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/p2m: fix non-translated handling of
 iommu mappings
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMTA6MzI6NDFBTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjIuMDcuMjAxOSAxNzozMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gVGhl
IGN1cnJlbnQgdXNhZ2Ugb2YgbmVlZF9pb21tdV9wdF9zeW5jIGluIHAybSBmb3Igbm9uLXRyYW5z
bGF0ZWQKPiA+IGd1ZXN0cyBpcyB3cm9uZyBiZWNhdXNlIGl0IGRvZXNuJ3QgY29ycmVjdGx5IGhh
bmRsZSBhIHJlbGF4ZWQgUFYKPiA+IGhhcmR3YXJlIGRvbWFpbiwgdGhhdCBoYXMgbmVlZF9zeW5j
IHNldCB0byBmYWxzZSwgYnV0IHN0aWxsIG5lZWQKPiA+IGVudHJpZXMgdG8gYmUgYWRkZWQgZnJv
bSBjYWxscyB0byB7c2V0L2NsZWFyfV9pZGVudGl0eV9wMm1fZW50cnkuCj4gPiAKPiA+IEFkanVz
dCB0aGUgY29kZSBpbiBndWVzdF9waHlzbWFwX2FkZF9wYWdlIHRvIGFsc28gY2hlY2sgd2hldGhl
ciB0aGUKPiA+IGRvbWFpbiBoYXMgYW4gaW9tbXUgaW5zdGVhZCBvZiB3aGV0aGVyIGl0IG5lZWRz
IHN5bmNpbmcgb3Igbm90IGluCj4gPiBvcmRlciB0byB0YWtlIGEgcmVmZXJlbmNlIHRvIGEgcGFn
ZSB0byBiZSBtYXBwZWQuCj4gCj4gV2h5IHRoaXMgc2VlbWluZ2x5IHVucmVsYXRlZCBjaGFuZ2U/
IEkgYXNrIGJlY2F1c2UgLi4uCj4gCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiA+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+ID4gQEAgLTgzNiw3ICs4MzYsNyBAQCBndWVz
dF9waHlzbWFwX2FkZF9wYWdlKHN0cnVjdCBkb21haW4gKmQsIGdmbl90IGdmbiwgbWZuX3QgbWZu
LAo+ID4gICAgICAgICAgICAqLwo+ID4gICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgKDFVTCA8
PCBwYWdlX29yZGVyKTsgKytpLCArK3BhZ2UgKQo+ID4gICAgICAgICAgIHsKPiA+IC0gICAgICAg
ICAgICBpZiAoICFuZWVkX2lvbW11X3B0X3N5bmMoZCkgKQo+ID4gKyAgICAgICAgICAgIGlmICgg
IWhhc19pb21tdV9wdChkKSApCj4gPiAgICAgICAgICAgICAgICAgICAvKiBub3RoaW5nICovOwo+
ID4gICAgICAgICAgICAgICBlbHNlIGlmICggZ2V0X3BhZ2VfYW5kX3R5cGUocGFnZSwgZCwgUEdU
X3dyaXRhYmxlX3BhZ2UpICkKPiA+ICAgICAgICAgICAgICAgICAgIHB1dF9wYWdlX2FuZF90eXBl
KHBhZ2UpOwo+IAo+IC4uLiB0aGlzIHBhcmFsbGVscyB0aGUgY29kZSBpbiBpb21tdV9od2RvbV9p
bml0KCksIHdoaWNoIHNpbWlsYXJseQo+IHVzZXMgbmVlZF9pb21tdV9wdF9zeW5jKCkgKGFuZCBk
dXJpbmcgdGhlIHByaW9yIGRpc2N1c3Npb24geW91IGRpZAo+IGFncmVlIHdpdGggUGF1bCB0aGF0
IGl0IHNob3VsZG4ndCBiZSBjaGFuZ2VkKS4gSU9XIHRoZSBwYXRjaCBmb3IKPiBub3cgY2FuIGhh
dmUgbXkgUi1iIG9ubHkgd2l0aCB0aGlzIGNoYW5nZSBhbmQgdGhlIHJlc3BlY3RpdmUgcGFydAo+
IG9mIHRoZSBkZXNjcmlwdGlvbiBkcm9wcGVkLgoKT0ssIHRoaXMgaXMgYWdhaW4gbm90IG5lZWRl
ZCBmb3IgYSByZWxheGVkIFBWIGhhcmR3YXJlIGRvbWFpbiBiZWNhdXNlCmFsbCBSQU0gaXMgYWxy
ZWFkeSBtYXBwZWQgb24gdGhlIGlvbW11IHBhZ2UgdGFibGVzLgoKTGV0IG1lIHVwZGF0ZSB0aGUg
Y29tbWl0IGFuZCByZXNlbmQuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
