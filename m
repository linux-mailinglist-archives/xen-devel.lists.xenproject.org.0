Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E3D1429E6
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 12:54:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itVbb-0006YA-9a; Mon, 20 Jan 2020 11:52:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YHbP=3J=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1itVbZ-0006Xk-Ez
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 11:52:29 +0000
X-Inumbo-ID: 5064d352-3b7b-11ea-b833-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5064d352-3b7b-11ea-b833-bc764e2007e4;
 Mon, 20 Jan 2020 11:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579521141;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wr7KaIZSlZgLzUVnypH3SFfTUG9ZZ10vNPUZ6NihpYM=;
 b=hti5XmUZUzP48uCD1Gb7S5rPNTRmGlridp1CsmAY9ZUM9H/hMsFh3nCw
 rnsVQr21cwA7/XIaEqDhTD6AhXwmlPGwQf3D/u5qcdfeJ6z0k5h+nXEl5
 OUwazrv714g3urm2NVsJYKLnXAayYLxlZ58kC9SrbqOaC2p2VzgQMw3Y2 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: E3dCiho1Hs4ySmnBXturJb8P+QqB7B0q5ZAq1wXM65J41xHmQGQr/jQYlClVCVb+6pbqP2IjeV
 z0jlT+iQkwWFUXhq5hIJ+sHmpfn1DRA3FPYBpz/5BKOm9P9qqL/rR8dATkIMUt4sIykTJa2XGo
 ImK06Gvmn1jd+9rx6NCNewKm5bCd3KvXNMN/RFiEQHjNB1C0uDXEKXPbx8jo/43B6gwhSmMxRf
 h+pxAxYtplELjEU6hhzCktWbc4aF1Y0FWrSAWI3mwfiPd4M6omCSSq7cX+fbNBym+RhkDljDiY
 TOk=
X-SBRS: 2.7
X-MesageID: 11325748
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,341,1574139600"; d="scan'208";a="11325748"
Date: Mon, 20 Jan 2020 11:52:17 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Message-ID: <20200120115217.GF1288@perard.uk.xensource.com>
References: <20200120115053.1010739-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200120115053.1010739-1-anthony.perard@citrix.com>
Subject: Re: [Xen-devel] [XEN PATCH 0/3] Default to python3
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
Cc: Doug
 Goldstein <cardoe@cardoe.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgMTE6NTA6NTBBTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gUGF0Y2ggc2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6Cj4gaHR0
cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0LWh0dHAvcGVvcGxlL2FwZXJhcmQveGVuLXVuc3RhYmxl
LmdpdCBici5weXRob24zLWRlZmF1bHQtdjEKPiAKPiBIaSwKPiAKPiBJIHRoaW5rIGl0J3MgdGlt
ZSBmb3IgWGVuIHRvIGJ1aWxkIHdpdGggcHl0aG9uMyBieSBkZWZhdWx0Lgo+IAo+IFRoZSBtYWlu
IHJlYXNvbiBmb3IgdGhhdCBpcyB0aGF0IFFFTVUgdXBzdHJlYW0gZG9uJ3QgYnVpbGQgd2l0aCBw
eXRob24gMi54Cj4gYW55bW9yZSwgYW5kIHRoZSBweXRob24gYmluYXJ5IHNlbGVjdGVkIGJ5IFhl
biBidWlsZCBzeXN0ZW0gaXMgdGhlIG9uZSB1c2VkCj4gd2hlbiBidWlsZGluZyBxZW11LXhlbi4g
U28gbm93IG9zc3Rlc3QgZmFpbGVkIHRvIGJ1aWxkIFFFTVUgdXBzdHJlYW0uCj4gCj4gQWxzbywg
cHl0aG9uMiBpcyBFT0wuCj4gCj4gRllJLCB0aGUgaHlwZXJ2aXNvciBidWlsZCBzeXN0ZW0gYWxy
ZWFkeSBzZWxlY3QgcHl0aG9uMyBieSBkZWZhdWx0LCB0aGlzIGNoYW5nZQo+IHRoZSB0b29scyBz
aWRlLgoKSSBmb3Jnb3QgdG8gc2F5IHRoYXQgdGhlcmUncyBhIG9zc3Rlc3QgcGF0Y2ggYXMgd2Vs
bDoKW09TU1RFU1QgUEFUQ0hdIHRzLXhlbi1idWlsZC1wcmVwOiBJbnN0YWxsIHB5dGhvbjMtZGV2
CgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
