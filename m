Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C10A7D43
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 10:03:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5QDN-00033l-1V; Wed, 04 Sep 2019 08:00:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mPyZ=W7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5QDM-00033g-1e
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 08:00:28 +0000
X-Inumbo-ID: 0e29fd44-ceea-11e9-b299-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e29fd44-ceea-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 08:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567584027;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mSwr3TW81V8QRVJQc+l5F2K1WO45Sw2+Fc5EgBWAgMI=;
 b=VNdBCyzrCyHSR6bg8OlYKpUfdsNIxC6gpSPgN7TiEJdffseaeqn72GHv
 0Z+SIliSGeb/q5EaiTHe+om5/mRG2L2GQuUGn+48c6lAifPqeu6ADQRLP
 /z3cwsxbrigM1PKd/gYOS70ElNMEEDajhfdOXYfCIhEUhFoEmttZj2zkG A=;
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
IronPort-SDR: 1RknB6EXDZK6zi561JAvcrVy2wBf+7KrFvJ12mlbKEord40J5MjClRlModwdPgwi60mCcriwOt
 TvZrxAmO/qOoeb7JrUGPSDcgWZJa94Bpz9tpr6Vt29l7DJPkWq5PN5CfbORl/vONyAu1lbHTus
 LhGSUzvFEoNzgoLFPTG5AHDDxJKvKpNtGmJIjii5xn/Qo1/+grcvHvfUW8kgdgWrP5tetpkZAS
 XiI7GuTLU3CSoMG23f0h67apbmWE3NUu2UnAb96eFW+jIqggvol0s4W9eGCgZMkQg6JTQroEyq
 iY4=
X-SBRS: 2.7
X-MesageID: 5110541
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,465,1559534400"; 
   d="scan'208";a="5110541"
Date: Wed, 4 Sep 2019 10:00:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: ndrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190904080019.tip2vrk3oy2zsaau@Air-de-Roger>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-3-roger.pau@citrix.com>
 <c626a063-f657-d614-eea5-dcfca3df46f0@citrix.com>
 <20190904074923.ji76uhn2kr7rff4b@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190904074923.ji76uhn2kr7rff4b@Air-de-Roger>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 02/11] ioreq: terminate cf8 handling at
 hypervisor level
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMDk6NDk6MjNBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIFNlcCAwMywgMjAxOSBhdCAwNjoxMzo1OVBNICswMTAwLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOgo+ID4gT24gMDMvMDkvMjAxOSAxNzoxNCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jIGIveGVu
L2FyY2gveDg2L2h2bS9pb3JlcS5jCj4gPiA+IGluZGV4IDY5MmI3MTBiMDIuLjY5NjUyZTEwODAg
MTAwNjQ0Cj4gPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwo+ID4gPiArKysgYi94
ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMKPiA+ID4gQEAgLTEwMTUsNiArMTAxNSwxMiBAQCBpbnQg
aHZtX21hcF9pb19yYW5nZV90b19pb3JlcV9zZXJ2ZXIoc3RydWN0IGRvbWFpbiAqZCwgaW9zZXJ2
aWRfdCBpZCwKPiA+ID4gICAgICBzd2l0Y2ggKCB0eXBlICkKPiA+ID4gICAgICB7Cj4gPiA+ICAg
ICAgY2FzZSBYRU5fRE1PUF9JT19SQU5HRV9QT1JUOgo+ID4gPiArICAgICAgICByYyA9IC1FSU5W
QUw7Cj4gPiA+ICsgICAgICAgIC8qIFBDSSBjb25maWcgc3BhY2UgYWNjZXNzZXMgYXJlIGhhbmRs
ZWQgaW50ZXJuYWxseS4gKi8KPiA+ID4gKyAgICAgICAgaWYgKCBzdGFydCA8PSAweGNmOCArIDgg
JiYgMHhjZjggPD0gZW5kICkKPiA+ID4gKyAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gPiArICAg
ICAgICBlbHNlCj4gPiA+ICsgICAgICAgICAgICAvKiBmYWxsdGhyb3VnaC4gKi8KPiA+IEZpbmFs
bHksIHRoaXMgcHJvaGliaXRzIHJlZ2lzdGVyaW5nIGNmOSB3aGljaCBtYXkgbGVnaXRpbWF0ZWx5
IG5vdCBiZQo+ID4gdGVybWluYXRlZCBpbiBYZW4uCj4gCj4gWWVzLCB0aGF0IHNob3VsZCBiZSBj
ZjggLSA3IG5vdCA4LCB0aGFua3MgZm9yIGNhdGNoaW5nIGl0ISBXaWxsIHVwZGF0ZQo+IG9uIHRo
ZSBuZXh0IHZlcnNpb24uCgouLi4gb3IganVzdCB1c2UgPCBpbnN0ZWFkIG9mIDw9LgoKUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
