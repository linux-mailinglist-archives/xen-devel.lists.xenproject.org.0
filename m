Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBCD83503
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 17:20:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv1Cu-0006Cz-BT; Tue, 06 Aug 2019 15:17:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qF5n=WC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hv1Cs-0006Cu-4P
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 15:16:58 +0000
X-Inumbo-ID: 39ebd5f4-b85d-11e9-a95f-336f451f080c
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39ebd5f4-b85d-11e9-a95f-336f451f080c;
 Tue, 06 Aug 2019 15:16:56 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6BAgRq3aWbpCGU83ySrPqK0sjYKfuD/ziUYw6qT2KSZ7PnlGYNiOCfTOOZDgPQzpepZRyTaqyy
 +LoZU/XvKBIoBNvT3M66icqGzD92Aw1lAVBf6gtN71BFePplH669hYK+FuBpSO7E25839t4RkX
 QEaE+TTzbRyynainAqz4/Nkn37l/hWFmFP5VjdcyuPpQM66N29XJKI7K+XoWOy0Mj2CsjY55aa
 c/6UN2oVZUwip5uTGejiHeiK3IfdtJGLajuAVmXHycz2pNwBULW7CKBCJPVOOn2nMLQJQLp4Hc
 y1c=
X-SBRS: 2.7
X-MesageID: 3938426
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,353,1559534400"; 
   d="scan'208";a="3938426"
Date: Tue, 6 Aug 2019 17:16:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190806151638.wgb4uee2wkft3ovv@Air-de-Roger>
References: <5a4d4a61-a543-c657-8458-cbc6b5a8a633@suse.com>
 <33824f67-d50d-f7ac-f3a6-305eb8fe3bc1@suse.com>
 <20190806142528.5vwc7yjnu52gjrdk@Air-de-Roger>
 <1a28a168-04b1-ea22-327d-f0626b89aea4@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a28a168-04b1-ea22-327d-f0626b89aea4@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v5 08/10] x86/PCI: read MSI-X table entry
 count early
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDQ6NDc6MjhQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDYuMDguMjAxOSAxNjoyNSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUdWUsIEF1ZyAwNiwgMjAxOSBhdCAwMzoxMDo0MFBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKPiA+ID4gKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKPiA+ID4gQEAgLTMyNCw2ICszMjQsNyBAQCBz
dGF0aWMgdm9pZCBhcHBseV9xdWlya3Moc3RydWN0IHBjaV9kZXYKPiA+ID4gICBzdGF0aWMgc3Ry
dWN0IHBjaV9kZXYgKmFsbG9jX3BkZXYoc3RydWN0IHBjaV9zZWcgKnBzZWcsIHU4IGJ1cywgdTgg
ZGV2Zm4pCj4gPiA+ICAgewo+ID4gPiAgICAgICBzdHJ1Y3QgcGNpX2RldiAqcGRldjsKPiA+ID4g
KyAgICB1bnNpZ25lZCBpbnQgcG9zOwo+ID4gCj4gPiBUaGlzIGNodW5rIGRvZXNuJ3Qgc2VlbSB0
byBtYXRjaCBteSBjdXJyZW50IGNvZGUsIGFzIHRoZXJlJ3MgYW4gZW1wdHkKPiA+IG5ld2xpbmUg
YmV0d2VlbiB0aGUgZGVjbGFyYXRpb25zIGFuZCBsaXN0X2Zvcl9lYWNoX2VudHJ5Lgo+IAo+IFNh
bWUgaXNzdWUgYXMgYWJvdmUuCgpTb3JyeSBmb3IgdGhlIG5vaXNlLiBJIGp1bXBlZCBzdHJhaWdo
dCBpbnRvIHRoaXMgcGF0Y2guCgo+ID4gPiBAQCAtMzUwLDYgKzM1MywxMCBAQCBzdGF0aWMgc3Ry
dWN0IHBjaV9kZXYgKsK6YWxsb2NfcGRldihzdHJ1Y3QKPiA+ID4gICAgICAgICAgICAgICByZXR1
cm4gTlVMTDsKPiA+ID4gICAgICAgICAgIH0KPiA+ID4gICAgICAgICAgIHNwaW5fbG9ja19pbml0
KCZtc2l4LT50YWJsZV9sb2NrKTsKPiA+ID4gKwo+ID4gPiArICAgICAgICBjdHJsID0gcGNpX2Nv
bmZfcmVhZDE2KHBkZXYtPnNiZGYsIG1zaXhfY29udHJvbF9yZWcocG9zKSk7Cj4gPiA+ICsgICAg
ICAgIG1zaXgtPm5yX2VudHJpZXMgPSBtc2l4X3RhYmxlX3NpemUoY3RybCk7Cj4gPiAKPiA+IFNp
bmNlIHlvdSBzdG9yZSB0aGUgbnVtYmVyIG9mIGVudHJpZXMgaGVyZSwgd2h5IG5vdCBhbHNvIHN0
b3JlIHRoZQo+ID4gcG9zaXRpb24gb2YgdGhlIE1TSS1YIGNhcGFiaWxpdHkgc2luY2UgaXQncyBh
bHNvIGltbXV0YWJsZT8KPiA+IAo+ID4gVGhhdCB3b3VsZCBwcmV2ZW50IGhhdmluZyB0byBmZXRj
aCBpdCBhZ2FpbiBpbiBtc2l4X2NhcGFiaWxpdHlfaW5pdC4KPiAKPiBJIGRvIGNvbnNpZGVyIHRo
aXMgYXMgc29tZXRoaW5nIHdvcnRod2hpbGUgdG8gZG8gaW4gdGhlIGZ1dHVyZSwgYnV0Cj4gbm90
IGhlcmU6IFRoZSBmaWVsZCB0byBzdG9yZSB0aGlzIGRvZXNuJ3QgZXhpc3QgaW4gc3RydWN0IGFy
Y2hfbXNpeAo+ICh5ZXQpLCBhbmQgaGVuY2Ugd291bGQgbGlrZWx5IHdhbnQgbW92aW5nIGZyb20g
c3RydWN0IG1zaV9hdHRyaWIuCj4gVGhpcyBpcyBiZXlvbmQgdGhlIHNjb3BlIG9mIHRoaXMgcGF0
Y2guCgpPaCBJIHNlZS4gU28gdGhlIHBvc2l0aW9uIGl0J3MgYWN0dWFsbHkgc3RvcmVkIGluIG1z
aV9hdHRyaWIsIGFuZCBpcwp1c2VkIGJ5IGJvdGggTVNJIGFuZCBNU0ktWCwgaW4gd2hpY2ggY2Fz
ZSB3aGF0IEknbSBwcm9wb3Npbmcgd291bGQgYmUKd29yc2UsIHNpbmNlIHRoZSBmaWVsZCB3b3Vs
ZCBvbmx5IGJlIHVzZWQgYnkgTVNJLVguCgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
