Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501A2DC9E2
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 17:54:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLUX7-0002Ff-6B; Fri, 18 Oct 2019 15:51:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/MKZ=YL=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iLUX5-0002Fa-9w
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 15:51:15 +0000
X-Inumbo-ID: 1bfdbad0-f1bf-11e9-93f7-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bfdbad0-f1bf-11e9-93f7-12813bfff9fa;
 Fri, 18 Oct 2019 15:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571413872;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=rOL4z7YxOZzo+WjLdxnNa2UFpcAzt+/Gpb6zIaCIy0Y=;
 b=QR/HDlS55Qdb7fB+QVFWY7lnqxbz9XiHGNBWBneMqBBDhhwtdPfZ4p6n
 7wMfMpaLOl9fMpCZM1r6FQtD+prq2G5a8cWmECgxxFDSFtWEMdoWy0vBf
 r2Osofpq1WlAo5mWJ/XfGY9pDwiB3ycuYqsXzAriQIv4vhjJaJ+27+VPa k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7xuczwYebeaZJdeA2/nqAlRNlhw0Od5pWzDSQGTjYdsQGU9m97AgCg/5jW/FUsLD+xauEGOzIW
 ggS6HmlOHwLAr1NFxntqbDZjqKbd8z/GGPwdY7JwYAq3rOv4DtpVm/kNcdFURaBdimrhDD+uxb
 KrGuxNXeaxlEGGfJfnbblUgXPR5T+vcTvr41zjWoOrZWKmxRdALov4iaoA/coBiEe460U23s3+
 q6Oh+s2prgCIzWlCF5f8H99ORwVjdfi/KIhRG3b47mghvKPnh14lQJSPz0texlP31VM620S4fJ
 WR4=
X-SBRS: 2.7
X-MesageID: 7396923
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,312,1566878400"; 
   d="scan'208";a="7396923"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23977.57197.104861.3770@mariner.uk.xensource.com>
Date: Fri, 18 Oct 2019 16:51:09 +0100
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <38a9ad6c-6624-3e2a-aca7-20cb8ee14ce9@arm.com>
References: <20191018150653.24862-1-ian.jackson@eu.citrix.com>
 <20191018150653.24862-11-ian.jackson@eu.citrix.com>
 <38a9ad6c-6624-3e2a-aca7-20cb8ee14ce9@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v5 10/10] libxl/xl: Overhaul
 passthrough setting logic
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Paul
 Durrant <pdurrant@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbWEVOIFBBVENIIGZvci00LjEzIHY1IDEwLzEwXSBs
aWJ4bC94bDogT3ZlcmhhdWwgcGFzc3Rocm91Z2ggc2V0dGluZyBsb2dpYyIpOgo+IE9uIDE4LzEw
LzIwMTkgMTY6MDYsIElhbiBKYWNrc29uIHdyb3RlOgouLi4KPiA+ICsgICAgaWYgKGNfaW5mby0+
cGFzc3Rocm91Z2ggPT0gTElCWExfUEFTU1RIUk9VR0hfU1lOQ19QVCkgewo+ID4gKyAgICAgICAg
TE9HRChFUlJPUiwgZG9taWQsCj4gPiArICAgICAgICAgICAgICJwYXNzdGhyb3VnaD1cInN5bmNf
cHRcIiBub3Qgc3VwcG9ydGVkIG9uIEFSTVxuIik7Cj4gPiArICAgICAgICByYyA9IEVSUk9SX0lO
VkFMOwo+ID4gKyAgICAgICAgZ290byBvdXQ7Cj4gPiArICAgIH0KPiAKPiBXb3VsZCBpdCBtYWtl
IHNlbnNlIHRvIHVzZSBhIHN3aXRjaCBjYXNlIG9yIHdoaXRlbGlzdCBoZXJlPyBTbyB3ZSBkb24n
dCBlbmQgdXAgCj4gdG8gc2xpcCB0aHJvdWdoIGlmIGEgbmV3IHR5cGUgaXMgYWRkZWQgYW5kIHVu
c3VwcG9ydGVkIG9uIEFybS4KCkkgd291bGRuJ3QgbWluZCBjaGFuZ2luZyB0aGlzIHRvCiAgIGNf
aW5mby0+cGFzc3Rocm91Z2ggIT0gTElCWExfUEFTU1RIUk9VR0hfU0hBUkVfUFQKCkFsdGhvdWdo
IGl0J3MgYSBzaGFtZSB5b3UncmUgcmFpc2luZyB0aGlzIG5vdy4gIFRoaXMgY29kZSBoYXMgYmVl
bgpsaWtlIHRoaXMgc2luY2UgdjMuICBXb3VsZCB5b3UgbWluZCBpZiB3ZSBkaWQgdGhpcyBhcyBh
IGZvbGxvd3VwCnBhdGNoID8KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
