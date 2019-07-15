Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD156936B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 16:44:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn28d-000536-IH; Mon, 15 Jul 2019 14:39:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eZ1r=VM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hn28c-000530-8x
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 14:39:34 +0000
X-Inumbo-ID: 5b832c36-a70e-11e9-95f1-a301065a96de
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b832c36-a70e-11e9-95f1-a301065a96de;
 Mon, 15 Jul 2019 14:39:32 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Y0gDEZ609iZUcsEcaYdMISKfeF3Jq/A0vs9qa2yUGTjKOKRtdGjqMArthLjmpwHKUPYtQY7PQP
 gwmiYnEMM7fxAohz6kHK0+vS/h3aTD2hU+IXGgM7tNT33PDvLTr+mSY/KZ8HmpGM94+q17Jkjy
 /XRtswjct/sTHGIXDF5DaTb/Lvk8lWT6LipIEVjKqu88Wv9snQYId09mvB6+D2S5q6EV/Npk6t
 p4dkJgJW0+TJxEdYvZn7m3QNPIORhWpa/Td31TIsau8f8TSFBGFlQ95I4k1ECO2iaIo9yV+lQN
 3gs=
X-SBRS: 2.7
X-MesageID: 2965466
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="2965466"
Date: Mon, 15 Jul 2019 16:39:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190715143916.njsdhhugibaquwhg@Air-de-Roger.citrite.net>
References: <20190715123710.1780-1-paul.durrant@citrix.com>
 <20190715123710.1780-2-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190715123710.1780-2-paul.durrant@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 1/4] iommu / x86: move call to
 scan_pci_devices() out of vendor code
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMDE6Mzc6MDdQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEl0J3Mgbm90IHZlbmRvciBzcGVjaWZpYyBzbyBpdCBkb2Vzbid0IHJlYWxseSBiZWxv
bmcgdGhlcmUuCj4gCj4gU2Nhbm5pbmcgdGhlIFBDSSB0b3BvbG9neSBhbHNvIHJlYWxseSBkb2Vz
bid0IGhhdmUgbXVjaCB0byBkbyB3aXRoIElPTU1VCj4gaW5pdGlhbGl6YXRpb24uIEl0IGRvZXNu
J3QgZGVwZW5kIG9uIHRoZXJlIGV2ZW4gYmVpbmcgYW4gSU9NTVUuIFRoaXMgcGF0Y2gKPiBtb3Zl
cyB0byB0aGUgY2FsbCB0byB0aGUgYmVnaW5uaW5nIG9mIGlvbW11X2hhcmR3YXJlX3NldHVwKCkg
YnV0IG9ubHkKPiBwbGFjZXMgaXQgdGhlcmUgYmVjYXVzZSB0aGUgdG9wb2xvZ3kgaW5mb3JtYXRp
b24gd291bGQgYmUgb3RoZXJ3aXNlIHVudXNlZC4KPiAKPiBTdWJzZXF1ZW50IHBhdGNoZXMgd2ls
bCBhY3R1YWxseSBtYWtlIHVzZSBvZiB0aGUgUENJIHRvcG9sb2d5IGR1cmluZwo+ICh4ODYpIElP
TU1VIGluaXRpYWxpemF0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+CgpJIHdvdWxkIGV2ZW4gY29uc2lkZXIgbW92aW5nIHRoZSBjYWxs
IHRvIHNjYW5fcGNpX2RldmljZXMgaW50bwpwY2lfc2VnbWVudHNfaW5pdCBpbnN0ZWFkIG9mIGRv
aW5nIGl0IGluIHRoZSBJT01NVSBjb2RlLCBhcyB5b3UKc3VnZ2VzdCBhYm92ZS4KClRoYW5rcywg
Um9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
