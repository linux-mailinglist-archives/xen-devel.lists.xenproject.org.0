Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79894120810
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 15:05:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igqwm-0004zQ-VV; Mon, 16 Dec 2019 14:02:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P5kS=2G=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1igqwl-0004zL-Cp
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 14:02:03 +0000
X-Inumbo-ID: 9ccff12a-200c-11ea-88e7-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ccff12a-200c-11ea-88e7-bc764e2007e4;
 Mon, 16 Dec 2019 14:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576504913;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lwBMXTQITUnq+otunOGf/6O2hBo5gj8QNX/1rUoFnL0=;
 b=IgBvEWbauiKikDWRu79Xb37QuFeMRf4SRJhntbQGWFVeh4EYxLaeelxP
 vhs7zXINhs1/mOxrPMg/Z/XVZlljKBM8JzkER6sX4gbK+Yxo6CdaixSdj
 Y+GHTqbveNhgNWpYkPn+JcBWx2UxU76cs0UfwB4PwNQ+pFy68tAJq+Y/E k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XTwxI9zjvhdhU+gcXSdHQMQSbL8Zh0/Xns8wBNUXLgnM9s499iJ55DXDVqVND/paSmlSDtKIod
 aX/JuRZdXHRctaix69zXnIqwaz8U4mHlj5fcsAzydXO7NNTdOEh3YA+CCupbRdicJwrxnqtxjS
 OvPNSpaM2kIsskbZJd4DPtAs930g3zZIhKA3m1MwZbg/IgifTIpJx/q31G3WMPyDefOtuYRSBK
 yM3KgZttODIlm5A0t/qwvFJSLLtdj/uPjfddgQR+mrzhfW4MmwJpXmCLPAuQd2XFhScNdy0SpB
 snU=
X-SBRS: 2.7
X-MesageID: 10296655
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,321,1571716800"; d="scan'208";a="10296655"
Date: Mon, 16 Dec 2019 14:01:25 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191216135658.GA1267@perard.uk.xensource.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-4-anthony.perard@citrix.com>
 <9073662c-9cc4-cb6c-8402-941864cc779a@suse.com>
 <20191213154946.GM1155@perard.uk.xensource.com>
 <4022441e-bdbd-e78b-c8a4-d3fd9a09311a@suse.com>
 <b6dc71f0-1158-c6ac-18b6-fe72d495cde4@citrix.com>
 <ad54009f-8cc1-20f6-a9bb-630fda7f8d54@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ad54009f-8cc1-20f6-a9bb-630fda7f8d54@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH 3/8] xen: Update Kconfig to Linux v5.4
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMTYsIDIwMTkgYXQgMTE6MTY6NTJBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gV2hhdCBoZWFkZXJzIGFyZSB5b3UgdGFraW5nIGFib3V0PyBNeSBxdWVzdGlvbiB3YXMg
YWJvdXQgdGhlIHBsYWNlbWVudAo+IG9mIC5naXRpZ25vcmUgZW50cmllcyBvbmx5LiBJJ20gcHJl
dHR5IHN1cmUgSSBoYWQgcHJldmlvdXNseSBleHByZXNzZWQKPiB0aGF0IEknbSBub3Qgb3Zlcmx5
IGhhcHB5IHRvIHNlZSBuZWVkbGVzcyBzY2F0dGVyaW5nIGFyb3VuZCBvZiB0aGVtLgo+IEknbSBt
ZXJlbHkgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgaWYgaGVyZSB3ZSBoYXZlIGEgY2FzZSBvZiAibmVl
ZGxlc3MiLgo+Cj4gPiBJIGZpbmQgeW91ciBsYWNrIG9mIGNvbnNpc3RlbmN5IGluIHJldmlldyBy
ZXF1ZXN0cyBpbXBvc3NpYmxlIHRvIHByZWRpY3QuCj4gCj4gV2hhdCBjb25zaXN0ZW5jeT8gV2hh
dCdzIHdyb25nIHdpdGggcHV0dGluZyB0aGUgdHdvIGxpbmVzIGluIHRoZSB0b3AKPiBsZXZlbCAu
Z2l0aWdub3JlLCBvciBrZWVwaW5nIHRoZW0gd2hlcmUgdGhleSBhcmU/IEkgYW55d2F5IGRvdWJ0
Cj4gdGhlcmUncyBhIG5lZWQgdG8ga2VlcCBvdXIgLmdpdGlnbm9yZSBpbiBzeW5jIHdpdGggTGlu
dXgnZXMuCgpJIHRoaW5rIHNjYXR0ZXJpbmcgdGhlIC5naXRpZ25vcmUgYXJvdW5kIG1ha2UgdGhl
bSBlYXNpZXIgdG8gbWFuYWdlLAplc3BlY2lhbGx5IHdoZW4gZW50cmllcyBhcmVuJ3QgdXNlZnVs
IGFueW1vcmUuIE90aGVyd2lzZSwgd2UgZW5kIHVwCndpdGggYSAuZ2l0aWdub3JlIGF0IHRoZSBy
b290IHdpdGggZW50cmllcyB0aGF0IGFyZW4ndCBuZWVkZWQgYW55bW9yZQpiZWNhdXNlIHRoZXkg
Y2FuIGJlIGhhcmQgdG8gZmlndXJlIG91dCBpZiB0aGV5IGFyZSB1c2VmdWwgb3Igbm90LgpPciwg
d2hlbiBnbG9iaW5nIGlzIGludm9sdmUsIHdlIGNvdWxkIGVuZC11cCBpZ25vcmluZyBmaWxlcyB0
aGF0CnNob3VsZG4ndC4KCkknbSBwbGFubmluZyB0byBpbXBvcnQgbW9yZSBvZiBLYnVpbGQsIHdo
aWNoIE1ha2VmaWxlLmhvc3QgY29tZXMgZnJvbSwKdG8gYnVpbGQgb25seSB0aGUgaHlwZXJ2aXNv
ciwgc28gdGhlcmUncyBnb2luZyB0byBiZSBvdGhlciBhcnRlZmFjdCB0aGF0CndpbGwgYmUgZ2Vu
ZXJhdGVkIG9ubHkgaW4geGVuLy4gU28gSSd2ZSBhZGRlZCB0aG9zZSB0d28gbmV3IGVudHJpZXMg
aW4KeGVuLy5naXRpZ25vcmUgaW4gYW50aWNpcGF0aW9uLCBhbmQgdG8gYXZvaWQgZ2V0dGluZyB4
ZW4vdG9vbHMva2NvbmZpZwpvdXQtb2Ytc3luYyB3aXRoIExpbnV4J3Mgb25lIChXZWxsIEkgZGlk
bid0IGtub3cgdGhvc2UgdHdvIGVudHJpZXMgd2VyZQp0aGVyZSBpbiB0aGUgZmlyc3QgcGxhY2Up
LgoKSSBjb3VsZCBhZGQgIi94ZW4vKiovKi50YWIuW2NoXSIgaW4gdGhlIHJvb3QgLmdpdGlnbm9y
ZSBpZiB5b3UgcHJlZmVyCmV2ZW4gdGhvdWdoIEkgZG9uJ3QgbGlrZSB0aGlzIGFwcHJvY2guCgpD
aGVlcnMsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
