Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D23A2B93B
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 18:46:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVIjk-0005TL-8c; Mon, 27 May 2019 16:44:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BTdu=T3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hVIji-0005TG-LY
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 16:44:34 +0000
X-Inumbo-ID: b236e6a8-809e-11e9-833e-1f4f32c75e9d
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b236e6a8-809e-11e9-833e-1f4f32c75e9d;
 Mon, 27 May 2019 16:44:30 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: xOKb9QpNSgCOY0ZPH5cPo3SJaZDo8o4ZuuhCGN4oUyA96fih/VudiKuhacssxy2IEXNd5QCiBE
 uKw/Kbd8NM86oVQocoT/Erq18vywuGv2Io28K16NgbuCN4wQjQIUQOyR4kYyl3NCfBbU2Vt0v7
 RAZLDzmjl4Qs2Re8hGoo8jAnWtGAk9hpbfKYO0kWKuWC6AE7z+E8JaTqTo4+WQdblXxuWToreG
 BZ4UJfjWIpACpE9r/6eo6fpKW3uNKf3wBxu4ENErifVJOa2/lf48PrqzcLc8fWl8A//3y8+Olj
 1NI=
X-SBRS: 2.7
X-MesageID: 929959
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,519,1549947600"; 
   d="scan'208";a="929959"
Date: Mon, 27 May 2019 18:44:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190527164419.oc75p6kmegiv3m7v@Air-de-Roger>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-4-roger.pau@citrix.com>
 <5CE7C0F30200007800231EEB@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CE7C0F30200007800231EEB@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/5] pci: switch pci_conf_{read/write} to
 use pci_sbdf_t
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMDQ6MDE6MjNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEwLjA1LjE5IGF0IDE4OjEwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS9hbWQuYwo+ID4gKysrIGIveGVuL2FyY2gv
eDg2L2NwdS9hbWQuYwo+ID4gQEAgLTg1NSwyMCArODU5LDIyIEBAIHN0YXRpYyB2b2lkIF9uczE2
NTUwX3Jlc3VtZShzdHJ1Y3Qgc2VyaWFsX3BvcnQgKnBvcnQpCj4gPiAgewo+ID4gICNpZmRlZiBD
T05GSUdfSEFTX1BDSQo+ID4gICAgICBzdHJ1Y3QgbnMxNjU1MCAqdWFydCA9IHBvcnQtPnVhcnQ7
Cj4gPiArICAgIGNvbnN0IHBjaV9zYmRmX3Qgc2JkZiA9IHsKPiA+ICsgICAgICAgIC5idXMgPSB1
YXJ0LT5wc19iZGZbMF0sCj4gPiArICAgICAgICAuZGV2ID0gdWFydC0+cHNfYmRmWzFdLAo+ID4g
KyAgICAgICAgLmZ1bmMgPSB1YXJ0LT5wc19iZGZbMl0sCj4gPiArICAgIH07Cj4gCj4gSW4gY2Fz
ZXMgbGlrZSB0aGlzIG9uZSwgaXMgdGhlcmUgYW55IHBhcnRpY3VsYXIgcmVhc29uIHlvdSBkb24n
dCB1c2UgdGhlCj4gbWFjcm8geW91IGludHJvZHVjZT8KCkF0IGZpcnN0IEkgcHJlZmVycmVkIHRo
aXMgZXhwbGljaXQgZmllbGQgYmFzZWQgaW5pdGlhbGl6YXRpb24gYmVjYXVzZQppdCBtYWtlcyBp
dCBlYXNpZXIgdG8gcmVhZCBJTU8sIGJ1dCBJIHdpbGwgc3dpdGNoIHRvIHVzZSB0aGUgbWFjcm8u
Cgo+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3BjaS5oCj4gPiArKysgYi94ZW4vaW5jbHVkZS94
ZW4vcGNpLmgKPiA+IEBAIC01OCw2ICs1OCwxMSBAQCB0eXBlZGVmIHVuaW9uIHsKPiA+ICAgICAg
fTsKPiA+ICB9IHBjaV9zYmRmX3Q7Cj4gPiAgCj4gPiArI2RlZmluZSBQQ0lfU0JERl9UKHMsIGIs
IGQsIGYpIFwKPiA+ICsgICAgKChwY2lfc2JkZl90KSB7IC5zZWcgPSAocyksIC5idXMgPSAoYiks
IC5kZXYgPSAoZCksIC5mdW5jID0gKGYpIH0pCj4gCj4gSSdkIHByZWZlciBpZiB0aGUgX1Qgc3Vm
Zml4IGNvdWxkIGJlIG9taXR0ZWQuIEFmYWljcyB0aGVyZSdzIG5vIHVzZSBvZiB0aGUKPiBleGlz
dGluZyBQQ0lfU0JERigpIGFueXdoZXJlIGluIHRoZSB0cmVlLCBzbyB0aGlzIHNob3VsZCBiZSBm
aW5lLiBGb3IKPiB0aGUgMm5kIG1hY3JvIGJlbG93IEkgY2FuJ3QgZWFzaWx5IHRlbGwgd2hldGhl
ciB0aGUgZmV3IGV4aXN0aW5nIHVzZWQKPiBoYXZlIGFsbCBkaXNhcHBlYXJlZCBieSBub3csIGJ1
dCBpdCBzZWVtcyBsaWtlbHkuCgpJIGNhbiBzZWUgYWJvdXQgZHJvcHBpbmcgdGhlIF9UIHN1ZmZp
eCwgYnV0IEkgdGhpbmsgdGhlcmUncyBsaWtlbHkKc29tZSBvdmVybGFwIGJldHdlZW4gdGhlIGlu
dHJvZHVjdGlvbiBvZiBQQ0lfU0JERl9UIGFuZCB0aGUgbGFzdCB1c2VyCm9mIHRoZSBjdXJyZW50
IFBDSV9TQkRGIGhlbHBlcnMsIHNvIG1heWJlIGl0J3MgZmluZSB0byB1c2UgdGhlIF9UCnN1ZmZp
eCBhdCBmaXJzdCBhbmQgaGF2ZSBvbmUgZmluYWwgcGF0Y2ggdGhhdCByZW1vdmVzIGl0PwoKPiBB
bHNvIEknbSBhZnJhaWQgaW5pdGlhbGl6ZXJzIG9mIHRoaXMga2luZCB3aWxsIGJyZWFrIHRoZSBi
dWlsZCB3aXRoIG9sZCBnY2MuCgpJIHRob3VnaHQgd2UgZHJvcHBlZCBzdXBwb3J0IGZvciBzdWNo
IG9sZCB2ZXJzaW9ucyBvZiBnY2MsIGlzIHRoYXQgbm90CnRoZSBjYXNlPwoKSWYgbm90IHRoaXMg
aXMgYWxsIGEgbm8tZ28uCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
