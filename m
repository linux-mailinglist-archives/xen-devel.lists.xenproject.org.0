Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40929173741
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 13:34:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7ene-0001bf-MV; Fri, 28 Feb 2020 12:31:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7end-0001ba-7R
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 12:31:25 +0000
X-Inumbo-ID: 3b4dc716-5a26-11ea-b7e8-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b4dc716-5a26-11ea-b7e8-bc764e2007e4;
 Fri, 28 Feb 2020 12:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582893084;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+6HuaeCz+uBYzKY+i0VmpWvf6nzSnto8zlUz4ESDh4I=;
 b=hHFT6t1DXtT+MDeyH26pinHQEQXwMdiOxiNFo+Nyr7GDpxPILhCirJ1i
 MyUu1EBrx3Z4EUgj5qtM0kytkrZpODZSTecNm6mDDCy7mHFUgDAk7i15Y
 8/qqkbIsKsBw9+ZDj3uwnRPQxKbONvTa8d+pJ6EJSdbKozcuUMt1t934d g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LWgAbriFqrgCuxO18F35LtIq3Nh9ntFdC/35k+IDBxonCHTv2CtLtc5HrWkikgO7kVwA4O8vXz
 5QDY59IKT5to9eDuVu3yX+3C4xhVMzFLohYvYkGm3bR3+tctmVf/wkbeu5xnJIbVhK4Ekk6PiK
 IrEU8jJ9w8zoUrC4r84SnPpX7WgzixRKMgYTw39W4AJotIpwc2h03/qW3ImBRVsOUwiDpF9317
 la8JnHqbarmSKRmesLJi4XOeGXRucLZAd/uACmDf8v94nU2Iz0HiO+efXLGItKtwBEX6vb3Phy
 Yeg=
X-SBRS: 2.7
X-MesageID: 13170433
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,496,1574139600"; d="scan'208";a="13170433"
Date: Fri, 28 Feb 2020 13:31:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200228123116.GW24458@Air-de-Roger.citrite.net>
References: <2d3ced57-7d53-bb90-ccf6-e521e6eeb556@suse.com>
 <d2833654-fc51-555e-1c38-bda283baf27f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d2833654-fc51-555e-1c38-bda283baf27f@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 2/2] AMD/IOMMU: without XT,
 x2APIC needs to be forced into physical mode
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjgsIDIwMjAgYXQgMDE6MTI6MDNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIHdpZGVyIGNsdXN0ZXIgbW9kZSBBUElDIElEcyBhcmVuJ3QgZ2VuZXJhbGx5IHJl
cHJlc2VudGFibGUuIENvbnZlcnQKPiB0aGUgaW9tbXVfaW50cmVtYXAgdmFyaWFibGUgaW50byBh
IHRyaXN0YXRlLCBhbGxvd2luZyB0aGUgQU1EIElPTU1VCj4gZHJpdmVyIHRvIHNpZ25hbCB0aGlz
IHNwZWNpYWwgcmVzdHJpY3Rpb24gdG8gdGhlIGFwaWNfeDJhcGljX3Byb2JlKCkuCj4gKE5vdGU6
IGFzc2lnbm1lbnRzIHRvIHRoZSB2YXJpYWJsZSBnZXQgYWRqdXN0ZWQsIHdoaWxlIGV4aXN0aW5n
Cj4gY29uc3VtZXJzIC0gYWxsIGFzc3VtaW5nIGEgYm9vbGVhbiBwcm9wZXJ0eSAtIGFyZSBsZWZ0
IGFsb25lLikKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Cj4gLS0tCj4gdjI6IE5ldy4KPiAKPiAtLS0gYS94ZW4vYXJjaC94ODYvZ2VuYXBpYy94MmFw
aWMuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9nZW5hcGljL3gyYXBpYy5jCj4gQEAgLTIzNiwxMiAr
MjM2LDIxIEBAIGNvbnN0IHN0cnVjdCBnZW5hcGljICpfX2luaXQgYXBpY194MmFwaWMKPiAgICAg
ICAgICB4MmFwaWNfcGh5cyA9ICFpb21tdV9pbnRyZW1hcCB8fAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgKGFjcGlfZ2JsX0ZBRFQuZmxhZ3MgJiBBQ1BJX0ZBRFRfQVBJQ19QSFlTSUNBTCk7Cj4g
ICAgICB9Cj4gLSAgICBlbHNlIGlmICggIXgyYXBpY19waHlzICYmICFpb21tdV9pbnRyZW1hcCAp
Cj4gLSAgICB7Cj4gLSAgICAgICAgcHJpbnRrKCJXQVJOSU5HOiB4MkFQSUMgY2x1c3RlciBtb2Rl
IGlzIG5vdCBzdXBwb3J0ZWQgd2l0aG91dCBpbnRlcnJ1cHQgcmVtYXBwaW5nXG4iCj4gLSAgICAg
ICAgICAgICAgICJ4MkFQSUM6IGZvcmNpbmcgcGh5cyBtb2RlXG4iKTsKPiAtICAgICAgICB4MmFw
aWNfcGh5cyA9IHRydWU7Cj4gLSAgICB9Cj4gKyAgICBlbHNlIGlmICggIXgyYXBpY19waHlzICkK
PiArICAgICAgICBzd2l0Y2ggKCBpb21tdV9pbnRyZW1hcCApCj4gKyAgICAgICAgewo+ICsgICAg
ICAgIGNhc2UgaW9tbXVfaW50cmVtYXBfb2ZmOgo+ICsgICAgICAgIGNhc2UgaW9tbXVfaW50cmVt
YXBfcmVzdHJpY3RlZDoKPiArICAgICAgICAgICAgcHJpbnRrKCJXQVJOSU5HOiB4MkFQSUMgY2x1
c3RlciBtb2RlIGlzIG5vdCBzdXBwb3J0ZWQgJXMgaW50ZXJydXB0IHJlbWFwcGluZ1xuIgo+ICsg
ICAgICAgICAgICAgICAgICAgIngyQVBJQzogZm9yY2luZyBwaHlzIG1vZGVcbiIsCj4gKyAgICAg
ICAgICAgICAgICAgICBpb21tdV9pbnRyZW1hcCA9PSBpb21tdV9pbnRyZW1hcF9vZmYgPyAid2l0
aG91dCIKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA6ICJ3aXRoIHJlc3RyaWN0ZWQiKTsKPiArICAgICAgICAgICAgeDJhcGljX3BoeXMg
PSB0cnVlOwoKSSB0aGluayB5b3UgYWxzbyBuZWVkIHRvIGZpeHVwIHRoZSB1c2FnZSBvZiBpb21t
dV9pbnRyZW1hcCBpbiBfX2NwdV91cApzbyB0aGF0IENQVXMgd2l0aCBBUElDIElEcyA+IDI1NSBh
cmUgbm90IGJyb3VnaHQgdXAgd2hlbiBpbgppb21tdV9pbnRyZW1hcF9yZXN0cmljdGVkIG1vZGUu
CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
