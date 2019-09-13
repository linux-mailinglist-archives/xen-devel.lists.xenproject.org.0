Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4708DB2179
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 15:58:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8m1U-00005e-P7; Fri, 13 Sep 2019 13:54:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8xMu=XI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i8m1T-00005Z-4e
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 13:54:03 +0000
X-Inumbo-ID: edfbeb42-d62d-11e9-95ab-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id edfbeb42-d62d-11e9-95ab-12813bfff9fa;
 Fri, 13 Sep 2019 13:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568382837;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QRWMY2xYCkRD+NBZDm+j739E1QCf7P4WKAKhKr2wkSk=;
 b=gohK41XrLHaRYl5pGqu7JXNhfX8mP8Evpx6e17PnIkGBwHeEQwdPb5fH
 qqiK4JzWuaUAGb4ceG7hM4MMFZ9Ix/fqO9cdeRezDKANRtucpWt4UlVAP
 ywqiEcIlXKMojsPsmfPC9lgRtSMKfxd0lBEd3vX6soI6t3QEFQL620mZj 0=;
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
IronPort-SDR: oM+7MMA0UxCpPkW2Hqt5iyxvMz3h13Ko9vsS/furcnhAHXx8fAREdIU1EGO9SrmMdRTTm7GggV
 B5Av4GiY7aukzkj0PdCdVJUkei90+7Ei2OJqcWxiTorWZhtShue5euuw31ecrj5xa6V4QYPtTJ
 jB6Na5jPZVd4e9V6cZ8JN421j4FaBW7JYrBI6xULkhbsHSUbxJTF6MHkNBWXrDReIkiz2xyxXK
 4eaqDPGN43MamPVA1FnOF4kj9XfgsfUKOhKHOCKGR85wLub9mAKtGOzQ9EdwpjIZcEcH16KFyi
 ylw=
X-SBRS: 2.7
X-MesageID: 5783022
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,501,1559534400"; 
   d="scan'208";a="5783022"
Date: Fri, 13 Sep 2019 15:53:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190913135336.k7g7rem5awttvsmo@Air-de-Roger>
References: <20190913105826.2704-1-paul.durrant@citrix.com>
 <20190913105826.2704-4-paul.durrant@citrix.com>
 <e79beeb5-7288-c8fd-8823-feaf8d4e7e77@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e79beeb5-7288-c8fd-8823-feaf8d4e7e77@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v11.1 3/6] sysctl / libxl: report whether
 IOMMU/HAP page table sharing is supported
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
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 David Scott <dave@recoil.org>, Anthony
 PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMDE6MTA6MThQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gLS0tIGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saQo+ICsrKyBiL3Rvb2xz
L29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkKPiBAQCAtNTcsNyArNTcsNiBAQCB0eXBlIGRvbWFp
bl9jcmVhdGVfZmxhZyA9Cj4gICAgfCBDREZfT09TX09GRgo+ICAgIHwgQ0RGX1hTX0RPTUFJTgo+
ICAgIHwgQ0RGX0lPTU1VCj4gLQoKU3RyYXkgZGVsZXRpb24/Cgo+IC0tLSBhL3hlbi9pbmNsdWRl
L3B1YmxpYy9zeXNjdGwuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaAo+IEBA
IC05Niw5ICs5NiwxMyBAQCBzdHJ1Y3QgeGVuX3N5c2N0bF90YnVmX29wIHsKPiAgLyogVGhlIHBs
YXRmb3JtIHN1cHBvcnRzIHNvZnR3YXJlIHBhZ2luZy4gKi8KPiAgI2RlZmluZSBfWEVOX1NZU0NU
TF9QSFlTQ0FQX3NoYWRvdyAgICAgICA0Cj4gICNkZWZpbmUgWEVOX1NZU0NUTF9QSFlTQ0FQX3No
YWRvdyAgICAgICAgKDF1PDxfWEVOX1NZU0NUTF9QSFlTQ0FQX3NoYWRvdykKPiArLyogVGhlIHBs
YXRmb3JtIHN1cHBvcnRzIHNoYXJpbmcgb2YgSEFQIHBhZ2UgdGFibGVzIHdpdGggdGhlIElPTU1V
LiAqLwo+ICsjZGVmaW5lIF9YRU5fU1lTQ1RMX1BIWVNDQVBfaW9tbXVfaGFwX3B0X3NoYXJlIDUK
PiArI2RlZmluZSBYRU5fU1lTQ1RMX1BIWVNDQVBfaW9tbXVfaGFwX3B0X3NoYXJlICBcCj4gKyAg
ICAoMXUgPDwgX1hFTl9TWVNDVExfUEhZU0NBUF9pb21tdV9oYXBfcHRfc2hhcmUpCgpJIHdvdWxk
IGRyb3AgdGhlIF9oYXAgcGFydCBvZiB0aGlzLCBzaW5jZSBJIGRvbid0IHRoaW5rIGl0IGFkZHMg
bXVjaCwKaXQncyBub3QgbGlrZSB0aGUgaW9tbXUgcGFnZSB0YWJsZXMgY2FuIGJlIHNoYXJlZCB3
aXRoIGFueXRoaW5nIGVsc2U/CgpJIGRvbid0IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiwgYW5kIGdp
dmVuIHRoYXQgdGhlIGNvZGUgYWxyZWFkeSBtYWtlcwpleHRlbnNpdmUgdXNlIG9mIGlvbW11X2hh
cF9wdF9zaGFyZSBJIHdvdWxkIGJlIGZpbmUgd2l0aCB0aGF0LgoKV2l0aCB0aGUgcmVtb3ZlZCBu
ZXdsaW5lIGZpeGVkIChpZiBhcHBsaWNhYmxlKToKClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
