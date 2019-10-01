Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE21C3565
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 15:18:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFHzl-0002mJ-9b; Tue, 01 Oct 2019 13:15:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ehNT=X2=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iFHzj-0002mE-OD
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 13:15:11 +0000
X-Inumbo-ID: 7eb2026e-e44d-11e9-8628-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 7eb2026e-e44d-11e9-8628-bc764e2007e4;
 Tue, 01 Oct 2019 13:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569935711;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Mo88sCmAENkuU3DYCQw1XcfSFCAqx3vD9ekaqbZrjbI=;
 b=g1igSahcCvaq6fxlwMMCLHiHKwST7wX4+gNI7WHYEIemO+vtSwwJL5k0
 ywc5YHhQxVEeicpsNADtqL2v21GB21boCM2mSAmqvTxqommA8RdLIH6J8
 OBK/Y7pj+SwCV3jTHY4IpqH86AohJuDaae/2k5fYSzGSQsJGluSBkN1xn M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sSePO1Joeo4llop4kyRRVEspFHO3SmK7Hvj6Zdzn/WEjxxrOLDGkKePe7Xinp7c8PCYEvlNRKH
 NvKCllRNo5CMxNrxs0kxVhyh0eGyPyPzIoAGvpAo+FE/n5G+VtqPOkiLwNhFKYs991bNFslHGs
 A+ZbpLv7QBErXz5ZM1kTANsxjQsqCmqckFQjOXL3FxP+3SjjnXAy5qHDQPzigTvi379puWFA3Q
 EZTmxPiJHvKFfdO9VjoDBL8i46ueQB+UL3nUUB+3PLu0DrVll1fnwNKzrRbPet45Z1Vpqp4YPR
 JhE=
X-SBRS: 2.7
X-MesageID: 6311261
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6311261"
Date: Tue, 1 Oct 2019 14:15:07 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20191001131507.GI1163@perard.uk.xensource.com>
References: <20191001101259.53162-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191001101259.53162-1-roger.pau@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [PATCH] libxl: wait for the ack when issuing power
 control requests
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
Cc: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David
 Scott <dave@recoil.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMTI6MTI6NTlQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEkgYmVsaWV2ZSBhcHBseWluZyB0aGlzIHBhdGNoIGlzIG5vdCBnb2luZyB0byBj
YXVzZSByZWdyZXNzaW9ucyBpbgo+IG9zc3Rlc3QsIGFsYmVpdCBGcmVlQlNEIGRvZXNuJ3QgYWNr
bm93bGVkZ2UgcG93ZXJvZmYvcmVib290IHJlcXVlc3RzCj4gaW4gdGhlIGN1cnJlbnRseSB0ZXN0
ZWQgdmVyc2lvbnMsIGl0IHdpbGwgc2h1dGRvd24gaW4gbGVzcyB0aGFuIG9uZQo+IG1pbnV0ZSwg
YW5kIHRodXMgdGhlIHRvb2xzdGFjayB3b24ndCBjb21wbGFpbiBiZWNhdXNlIHRoZSBjb250cm9s
IG5vZGUKPiBpcyBnb2luZyB0byBiZSByZW1vdmVkIGZyb20geGVuc3RvcmUuCgpBY2tub3dsZWRn
ZW1lbnQgaXMgZGVzY3JpYmVkIGluIHRoZSBkb2N1bWVudGF0aW9uIG9mIH4vY29udHJvbC9zaHV0
ZG93bgooZGVzY3JpYmVkIGluIHhlbnN0b3JlLXBhdGhzLnBhbmRvYyksIHNvIEkgZ3Vlc3MgaXQg
d291bGQgYmUgYSBidWcgaW4KRnJlZUJTRCByYXRoZXIgdGhhbiBhIHJlZ3Jlc3Npb24gb2YgdGhl
IHRvb2xzdGFjay4gSXNuJ3QgaXQ/CgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
