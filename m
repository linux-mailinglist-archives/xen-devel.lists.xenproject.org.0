Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1CB9ADB8
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 12:58:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i17EV-0000XM-0u; Fri, 23 Aug 2019 10:55:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SWQP=WT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i17ET-0000XF-JS
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 10:55:49 +0000
X-Inumbo-ID: 9077f49a-c594-11e9-b95f-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9077f49a-c594-11e9-b95f-bc764e2007e4;
 Fri, 23 Aug 2019 10:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566557749;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JAYLmPqDfwVF4gZ1f9v8N816uq82BVR8fH3y8TRGju4=;
 b=BA96qAB5ZM8hPZTkMnOfW7RVSRNNoUGoZD+bMKB7IFhKO6fsqzvfwBar
 ZWTTbX3HVuZs7iU8cOwZSK4StB7txBzG9dDkls8aUwnN76xniQQk34igz
 IA1pOJGpbFC4Ko6j6PfWvg7Coz+dm06MKV71pwqBxr2YciqSGmviEjgnt I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: w5/ITmOc2vPbup0Xk6t1CyugZRHId7AwnNMdzrTsx2xMs0C5FFfg+PeaT6Ayd6ffsvjPlk7uEQ
 yU5sMd6XaaQEVd034HprggD6pG/XFBSGHzhiFLqEzNmKoi7zcwiFCinvu1om9DuFP//euiHcP8
 XNu8SkC/ziE/qUQHpB93pLJa1SrMKxqL/yudM8kxTORBocOIwW/jgIzYJc+BGxt02M4Udk6/xe
 67nfDCj7lLIhCww+dz4dGcj+tSi9rW6iiAi1Tb83yyT+GiUPYG84VM6Fe9hqMV0PHO8yn1Cq5u
 XSM=
X-SBRS: 2.7
X-MesageID: 4674599
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,421,1559534400"; 
   d="scan'208";a="4674599"
Date: Fri, 23 Aug 2019 12:55:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190823105540.t2vbjbyd3zahlaan@Air-de-Roger>
References: <20190816172001.3905-1-paul.durrant@citrix.com>
 <20190816172001.3905-8-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816172001.3905-8-paul.durrant@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v6 07/10] use is_iommu_enabled() where
 appropriate...
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel
 De Graaf <dgdegra@tycho.nsa.gov>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDY6MTk6NThQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLnJhdGhlciB0aGFuIHRlc3RpbmcgdGhlIGdsb2JhbCBpb21tdV9lbmFibGVkIGZs
YWcgYW5kIG9wcyBwb2ludGVyLgo+IAo+IE5vdyB0aGF0IHRoZXJlIGlzIGEgcGVyLWRvbWFpbiBm
bGFnIGluZGljYXRpbmcgd2hldGhlciB0aGUgZG9tYWluIGlzCj4gcGVybWl0dGVkIHRvIHVzZSB0
aGUgSU9NTVUgKHdoaWNoIGRldGVybWluZXMgd2hldGhlciB0aGUgb3BzIHBvaW50ZXIgd2lsbAo+
IGJlIHNldCksIG1hbnkgdGVzdHMgb2YgdGhlIGdsb2JhbCBpb21tdV9lbmFibGVkIGZsYWcgYW5k
IG9wcyBwb2ludGVyIGNhbgo+IGJlIHRyYW5zbGF0ZWQgaW50byB0ZXN0cyBvZiB0aGUgcGVyLWRv
bWFpbiBmbGFnLiBTb21lIG9mIHRoZSBvdGhlciB0ZXN0cyBvZgo+IHB1cmVseSB0aGUgZ2xvYmFs
IGlvbW11X2VuYWJsZWQgZmxhZyBjYW4gYWxzbyBiZSB0cmFuc2xhdGVkIGludG8gdGVzdHMgb2YK
PiB0aGUgcGVyLWRvbWFpbiBmbGFnLgo+IAo+IE5PVEU6IFRoZSBjb21tZW50IGluIGlvbW11X3No
YXJlX3AybV90YWJsZSgpIGlzIGFsc28gZml4ZWQ7IG5lZWRfaW9tbXUoKQo+ICAgICAgIGRpc2Fw
cGVhcmVkIHNvbWUgdGltZSBhZ28uIEFsc28sIHdoaWxzdCB0aGUgc3R5bGUgb2YgdGhlICdpZicg
aW4KPiAgICAgICBmbGFza19pb21tdV9yZXNvdXJjZV91c2VfcGVybSgpIGlzIGZpeGVkLCBJIGhh
dmUgbm90IHRyYW5zbGF0ZWQgYW55Cj4gICAgICAgaW5zdGFuY2VzIG9mIHUzMiBpbnRvIHVpbnQz
Ml90IHRvIGtlZXAgY29uc2lzdGVuY3kuIElNTyBzdWNoIGEKPiAgICAgICB0cmFuc2xhdGlvbiB3
b3VsZCBiZSBiZXR0ZXIgZG9uZSBnbG9iYWxseSBmb3IgdGhlIHNvdXJjZSBtb2R1bGUgaW4KPiAg
ICAgICBhIHNlcGFyYXRlIHBhdGNoLgoKSSd2ZSB1c3VhbGx5IGNoYW5nZWQgdGhvc2UgaW5zdGFu
Y2VzIGFzIHRoZSBsaW5lIGdldHMgbW9kaWZpZWQgYW55d2F5LApidXQgSSdtIG5vdCBnb2luZyB0
byBhc2sgZXZlcnlvbmUgdG8gZG8gdGhpcyBpZiB0aGV5IGRvbid0IGZlZWwgbGlrZQppdC4KClRo
ZSBwcm9ibGVtIHdpdGggZG9pbmcgd2hvbGVzYWxlIGNoYW5nZXMgb2YgdTMyIC0+IHVpbnQzMl90
IGlzIHRoYXQKeW91IGludHJvZHVjZSBhIGxvdCBvZiBub2lzZSB3aGVuIHRyeWluZyB0byB1c2Ug
Z2l0IGJsYW1lIGFmdGVyd2FyZHMKZm9yIGV4YW1wbGUuIERvaW5nIGl0IHdoZW4gdG91Y2hpbmcg
dGhlIGxpbmUgZm9yIGxlZ2l0aW1hdGUgY2hhbmdlcwphdm9pZHMgdGhlIG5vaXNlLgoKPiAgICAg
ICBUaGUgY2hhbmdlIGluIHRoZSBpbml0aWFsaXphdGlvbiBvZiB0aGUgJ2hkJyB2YXJpYWJsZSBp
biBpb21tdV9tYXAoKQo+ICAgICAgIGFuZCBpb21tdV91bm1hcCgpIGlzIGRvbmUgdG8ga2VlcCB0
aGUgUFYgc2hpbSBidWlsZCBoYXBweS4gV2l0aG91dAo+ICAgICAgIHRoaXMgY2hhbmdlIGl0IHdp
bGwgZmFpbCB0byBjb21waWxlIHdpdGggZXJyb3JzIG9mIHRoZSBmb3JtOgo+IAo+IGlvbW11LmM6
MzYxOjMyOiBlcnJvcjogdW51c2VkIHZhcmlhYmxlIOKAmGhk4oCZIFstV2Vycm9yPXVudXNlZC12
YXJpYWJsZV0KPiAgICAgIGNvbnN0IHN0cnVjdCBkb21haW5faW9tbXUgKmhkID0gZG9tX2lvbW11
KGQpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpSZXZpZXdl
ZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpJIGhhdmVuJ3Qg
bG9va2VkIGhvd2V2ZXIgaWYgdGhlcmUgYXJlIGZ1cnRoZXIgY2FzZXMgd2hlcmUKaW9tbXVfZW5h
YmxlZCBzaG91bGQgYmUgY2hhbmdlZCBpbnRvIGlzX2lvbW11X2VuYWJsZWQuCgo+IEBAIC01NTYs
OCArNTYwLDggQEAgaW50IGlvbW11X2RvX2RvbWN0bCgKPiAgewo+ICAgICAgaW50IHJldCA9IC1F
Tk9ERVY7Cj4gIAo+IC0gICAgaWYgKCAhaW9tbXVfZW5hYmxlZCApCj4gLSAgICAgICAgcmV0dXJu
IC1FTk9TWVM7Cj4gKyAgICBpZiAoICFpc19pb21tdV9lbmFibGVkKGQpICkKPiArICAgICAgICBy
ZXR1cm4gLUVPUE5PVFNVUFA7CgpJIHdvdWxkIHVzZSBFTk9FTlQgaGVyZSwgYnV0IEkgZG9uJ3Qg
aGF2ZSBhIHN0cm9uZyBvcGluaW9uLiBUaGUKaHlwZXJjYWxsIGlzIHN1cHBvcnRlZCwgaXQncyBq
dXN0IHRoYXQgdGhlcmUncyBubyBpb21tdSBmb3IgdGhpcwpkb21haW4uCgpUaGFua3MsIFJvZ2Vy
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
