Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F2A1184DE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 11:21:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iecbc-0007Dx-L9; Tue, 10 Dec 2019 10:19:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=czbI=2A=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iecbb-0007Ds-EU
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 10:18:59 +0000
X-Inumbo-ID: 79e65774-1b36-11ea-88e7-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79e65774-1b36-11ea-88e7-bc764e2007e4;
 Tue, 10 Dec 2019 10:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575973137;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4MLc/DiYjufmBnXZ5sWbwivOXGmhjUmWTbJJtOHrIXA=;
 b=LGrp6rqE0T2PFWesHIof5B47Y2ZA99crxWFJqFW3g3Xqs9Qf0SO228IV
 pdbMUVr+dLs53nX/5DMJ09CZMP+AmnM9lOUSWc9BemRCCgXkY8PFqqkTY
 fFxiyTAVW5HhGzALirSCF5sbMQwYzi8bbUwAFUZnK9P0iGj6yeDGm+O54 w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xUtr2YFDCNxihGsiXfIAqagll4nAWAJebPLzhxT54FaYPs982InVQCJAfAZD3+SjHrWcYsfaNd
 +pdlQAC2+ORewvG/g2CBSVBWeHi5AYsbEeMD8VfapFI22RLejnGoYexKygRiZSIIYODkye48Ha
 32lH5Al/per2rFWxNUO2UCN770slav4etNDCohVSr+fuRcE2NybBE9uS70cKK9L0yuIBASmZ3G
 1gnoNLhEZUTxHzVug2gVLQh7qS/+CFXF7aM+pzB41d4AxsIyRBLAThubypwVAWehODE98I3EIl
 ueI=
X-SBRS: 2.7
X-MesageID: 10006818
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,299,1571716800"; d="scan'208";a="10006818"
Date: Tue, 10 Dec 2019 11:18:48 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191210101848.GE980@Air-de-Roger>
References: <20191209173757.46833-1-roger.pau@citrix.com>
 <d2709b23-ea42-e3aa-7018-4d4d93f6c0ee@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d2709b23-ea42-e3aa-7018-4d4d93f6c0ee@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v4] x86: do not enable global pages when
 virtualized on AMD hardware
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTAsIDIwMTkgYXQgMTE6MTE6MThBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDkuMTIuMjAxOSAxODozNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gLS0t
IGEveGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvcHYvZG9t
YWluLmMKPiA+IEBAIC0xMTgsNiArMTE4LDE5IEBAIHVuc2lnbmVkIGxvbmcgcHZfZml4dXBfZ3Vl
c3RfY3I0KGNvbnN0IHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBsb25nIGNyNCkKPiA+ICAgICAg
ICAgICAgICAobW11X2NyNF9mZWF0dXJlcyAmIFBWX0NSNF9HVUVTVF9WSVNJQkxFX01BU0spKTsK
PiA+ICB9Cj4gPiAgCj4gPiArc3RhdGljIGludDhfdCBfX3JlYWRfbW9zdGx5IG9wdF9nbG9iYWxf
cGFnZXMgPSAtMTsKPiA+ICtib29sZWFuX3J1bnRpbWVfcGFyYW0oImdsb2JhbC1wYWdlcyIsIG9w
dF9nbG9iYWxfcGFnZXMpOwo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgX19pbml0IHBnZV9pbml0KHZv
aWQpCj4gPiArewo+ID4gKyAgICBpZiAoIG9wdF9nbG9iYWxfcGFnZXMgPT0gLTEgKQo+ID4gKyAg
ICAgICAgb3B0X2dsb2JhbF9wYWdlcyA9ICFjcHVfaGFzX2h5cGVydmlzb3IgfHwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgIT0gWDg2X1ZF
TkRPUl9BTUQ7Cj4gCj4gSSB3YXMgYWJvdXQgdG8gY29tbWl0IHRoaXMgd2hlbiBJIG5vdGljZWQg
LSB3aGF0IGFib3V0IEh5Z29uIGhlcmU/CgpPaCB0aGUgdmVuZG9yIElEIGlzIGRpZmZlcmVudCBh
bGJlaXQgaXQncyBqdXN0IGEgY2xvbmUuIFBsZWFzZSBmZWVsCmZyZWUgdG8gYWRkIGl0IGF0IGNv
bW1pdC4KCkkgYWxzbyB3b25kZXI6IGl0IG1pZ2h0IGJlIGdvb2QgdG8gaGF2ZSBzb21lIGtpbmQg
b2YgbWFjcm8gdGhhdAptYXRjaGVzIGJvdGggQU1EIGFuZCBIeWdvbiAoSVNfQU1EX0NPTVBBVCBv
ciBzb21lIHN1Y2gpIGluIG9yZGVyIHRvCmF2b2lkIHRoaXMga2luZCBvZiBtaXN0YWtlcyBpbiB0
aGUgZnV0dXJlLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
