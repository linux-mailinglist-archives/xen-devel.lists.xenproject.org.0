Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA55B1262
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 17:44:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8REX-0002sX-Pc; Thu, 12 Sep 2019 15:42:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k1F3=XH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i8REX-0002sS-6J
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 15:42:09 +0000
X-Inumbo-ID: e099baf0-d573-11e9-b76c-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e099baf0-d573-11e9-b76c-bc764e2007e4;
 Thu, 12 Sep 2019 15:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568302928;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ALPW8QeQ13BaW0NMQA8wD8TeccMtlaRsjzcQuKoFJeg=;
 b=cC/TUHNYdzpoDJ1uCiDt1UmfS8QMAG3aHgB9CPbmYRBe8ebJFQc/TEZ9
 soYUCrcwfR73Rx/BmcmPOZvKz+rOZMPTP8moKjxHLxOtwZjJDvmu5/V/8
 woHTqKYqN4Uj2SwyxPfQd1C3zpPd+LCEQtSvKU4LIqomYpdvBFgoXpIAe A=;
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
IronPort-SDR: wcoY2EIHmZl2/7op+D9WZqyX1fx2BvH7P2evO+wZCADKFzn1rIljTqemnQGdik08Hoot8jxCyG
 hA+y9T8aWLgqJIAUisTfcqaPZaY0oQzl/P+HlV9C7vt4Djt5FrLb6ifWvyKNdQTBs2+lqm3vKK
 J1T88qGFOQGWl+QyNeTObVcO3fOtZtDN8c8q5u6HdGkjATxFOxqa6mLxHtuY/lxEyhEiNfjjXt
 1yZ8uTk5Xc9G042Qxx+huBejhSWddnzjupYQ9dOSI7fr20/ki9LSvnrAD4mli5cUkaUcRDO028
 Khc=
X-SBRS: 2.7
X-MesageID: 5490898
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,497,1559534400"; 
   d="scan'208";a="5490898"
Date: Thu, 12 Sep 2019 17:42:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190912154200.lakjfd6jzju7n7ok@Air-de-Roger>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
 <443ba725-01b7-9174-3298-66f44ba3f1ec@suse.com>
 <20190912113542.bxnfmweacwfr3py4@Air-de-Roger>
 <7ea0eb1e-1063-b7ef-8cde-6f47f70e41e0@suse.com>
 <20190912144434.e7wnmdumfpnp2z3m@Air-de-Roger>
 <a77b09ff-e0df-6b54-c6e7-156ce9dd6f29@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a77b09ff-e0df-6b54-c6e7-156ce9dd6f29@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 4/9] x86/HVM: move NOFLUSH handling out of
 hvm_set_cr3()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMDQ6NDc6MTdQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTIuMDkuMjAxOSAxNjo0NCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBhIGRpZmZlcmVudCBxdWVzdGlvbiwgQUZBSUNUIGh2bV9zZXRfY3IzIHNob3VsZCBuZXZlciBi
ZSBjYWxsZWQKPiA+IHdpdGggWDg2X0NSM19OT0ZMVVNIIHNldD8gSWYgc28sIGRvIHlvdSB0aGlu
ayBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvCj4gPiBhZGQgYW4gYXNzZXJ0IHRvIHRoYXQgcmVnYXJk
Pwo+IAo+IEkndmUgYmVlbiBkZWJhdGluZyB0aGlzIHdpdGggbXlzZWxmLCBhbmQgZGVjaWRlZCBh
Z2FpbnN0IGZvciBub3cuCj4gV2UgZG9uJ3Qga25vdyB3aGF0IG1lYW5pbmcgdGhlIGJpdCBtYXkg
Z2FpbiBldmVudHVhbGx5IGluIHRoZQo+IGFjdHVhbCByZWdpc3Rlci4KCkknbSBzbGlnaHRseSBs
b3N0IGhlcmUsIHRoZSBub2ZsdXNoIGJpdCBpcyBhY3R1YWxseSBkZWZpbmVkIGluIHRoZQpJbnRl
bCBTRE0gZm9yIGNyMywgYW5kIGhlbmNlIHdvbid0IGdhaW4gYW55IG90aGVyIG1lYW5pbmc/CgpP
ciBlbHNlIHlvdSBtaWdodCBzdGlsbCByaXNrIHdyaXRpbmcgYSBjcjMgd2l0aCBub2ZsdXNoIHNl
dCBpbiBjYXNlCnRoZSBjYWxsZXJzIHNvbWVob3cgbWlzYmVoYXZlPwoKVGhhbmtzLCBSb2dlci4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
