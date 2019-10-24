Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9724E3636
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 17:11:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNej4-0004Mh-Iq; Thu, 24 Oct 2019 15:08:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zclB=YR=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iNej2-0004MZ-TZ
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 15:08:32 +0000
X-Inumbo-ID: 23f3b2ac-f670-11e9-beca-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23f3b2ac-f670-11e9-beca-bc764e2007e4;
 Thu, 24 Oct 2019 15:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571929711;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=rFyivggJGOS+YSFV7Hnnyho0PFUDb8Vu0zXpRLFpJRw=;
 b=Pknr3HRanKCx1ty5N+JggKFrIKU5l/xWFLtTN5AY+l4Mo4SIXFGUrCwa
 pVioVYwXM7nx/e00RJD/4/IYRaFcFiNrAjsiTX8dnbeBSwEs3FbMFtUA1
 bHmmWFUA3acl9lIxZCVWvM/3ZTdP9eDkXEADjqNVMgybZNWcJgymS6kbW U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Zum1bSgjMtqMgZuJa/RSfmff1IZD5/vi6C6ITaEv3j2MqICL8HB3B9pgA6W29h0fN8BjAnXSjA
 jpau+RXcrhiN2WNOx+b0z5OdJTwu14C01/wZPBWCPAj2lWDb5ZVDSSMcKlB3Y0X47kkbbaaek6
 XZW1lmXBrQBmmkOmg60qEzwAmFem0LKK+J7tIF+3jY7A7/94AEVm3B21byDYkjhk5jY1GMuMWV
 0WOWVZQg2Nb6ZUDg5YiC9ka0Namxmx5/KRMRG2cGh6B9naQ/MR8ENN4qpJHS2B7Ko03fHjnkeK
 qz0=
X-SBRS: 2.7
X-MesageID: 7381051
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,225,1569297600"; 
   d="scan'208";a="7381051"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23985.48747.34908.392903@mariner.uk.xensource.com>
Date: Thu, 24 Oct 2019 16:08:27 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191023154008.GL1138@perard.uk.xensource.com>
References: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
 <20191023130013.32382-12-ian.jackson@eu.citrix.com>
 <20191023154008.GL1138@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v7 11/11] libxl: On ARM,
 reject future new passthrough modes too
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtYRU4gUEFUQ0ggZm9yLTQuMTMgdjcgMTEvMTFd
IGxpYnhsOiBPbiBBUk0sIHJlamVjdCBmdXR1cmUgbmV3IHBhc3N0aHJvdWdoIG1vZGVzIHRvbyIp
Ogo+IE9uIFdlZCwgT2N0IDIzLCAyMDE5IGF0IDAyOjAwOjEzUE0gKzAxMDAsIElhbiBKYWNrc29u
IHdyb3RlOgo+ID4gKyAgICBjYXNlIExJQlhMX1BBU1NUSFJPVUdIX0RJU0FCTEVEOwo+IAo+IFRo
YXQgbG9va3Mgc3RyYW5nZSwgdGhlcmUgYSBzZW1pY29sb24gXiBoZXJlIGluc3RlYWQgb2YgYSBj
b2xvbiAnOicuCj4gCj4gPiAtICAgICAgICAgICAgICJwYXNzdGhyb3VnaD1cInN5bmNfcHRcIiBu
b3Qgc3VwcG9ydGVkIG9uIEFSTVxuIik7Cj4gPiArICAgICAgICAgICAgICJwYXNzdGhyb3VnaD1c
IiVzXCIgbm90IHN1cHBvcnRlZCBvbiBBUk1cbiIsCj4gPiArICAgICAgICAgICAgIGxpYnhsX19w
YXNzdGhyb3VnaF9tb2RlX3RvX3N0cmluZyhjX2luZm8tPnBhc3N0aHJvdWdoKTsKPiAKPiBJIGNh
bid0IGZpbmQgd2hlcmUgdGhpcyBmdW5jdGlvbiBpcyBkZWZpbmVkLiBEb2VzIGl0IGV4aXN0Pwo+
IFlvdSBwcm9iYWJseSB3YW50IGxpYnhsX3Bhc3N0aHJvdWdoX3RvX3N0cmluZygpLgo+IEFsc28g
dGhlcmUncyBhIG1pc3NpbmcgKSB0byB0ZXJtaW5hdGUgTE9HRCBsaXN0IG9mIGFyZ3MuCgpJIG1h
bmFnZWQgdG8gZ2V0IG9zc3Rlc3QgdG8gbGV0IG1lIGhhdmUgb25lIG9mIGl0cyBhcm0gYm94ZXMg
Zm9yIGxvbmcKZW5vdWdoIHRvIGFjdHVhbGx5IGJ1aWxkIHRlc3QgdGhpcyBhbmQgeW91ciBsaXN0
IG9mIGlzc3VlcyB3YXMKY29tcHJlaGVuc2l2ZS4KCj4gSSB0aGluayB0aGF0J3MgaXQuIFdpdGgg
dGhvc2UgMyB0aGluZ3MgZml4ZWQ6Cj4gQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPgoKU28sIHRoYW5rcy4gIEZUUiBoZXJlIGlzIHRoZSBmaW5hbCB2
ZXJzaW9uLgoKVGhpcyBub3cgaGFzIGFsbCB0aGUgcmVxdWlyZWQgYWNrcyBhbmQgSSB3aWxsIGJ1
aWxkIHRlc3QgaXQgYWdhaW4KYWdhaW5zdCBzdGFnaW5nIGFuZCBwdXNoIGl0LgoKSWFuLgoKRnJv
bSAzMjRmN2I0MDkyZGE2NWRhZTZhZWM5NzhhODk5NjZiOGVjZmYzYTlkIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQpGcm9tOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4K
RGF0ZTogV2VkLCAyMyBPY3QgMjAxOSAxMzo1NTo1NCArMDEwMApTdWJqZWN0OiBbWEVOIFBBVENI
IGZvci00LjEzIHY3IDExLzExXSBsaWJ4bDogT24gQVJNLCByZWplY3QgZnV0dXJlIG5ldwogcGFz
c3Rocm91Z2ggbW9kZXMgdG9vCkNjOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+CgpU
aGlzIGlzIG1vc3QgcGxlYXNhbnRseSBkb25lIGJ5IGFsc28gY2hhbmdpbmcgdGhlIGlmIHRvIGEg
c3dpdGNoLgoKU3VnZ2VzdGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgpDQzog
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+ClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRy
aXguY29tPgoKLS0tCnY4OiBGaXggbWFueSBpZGlvdGljeSBjb21waWxlIGVycm9ycyBpbiB0aGlz
IHBhdGNoLgoKdjc6IE5ldyBwYXRjaCBpbiB0aGlzIHZlcnNpb24gb2YgdGhlIHNlcmllcy4KLS0t
CiB0b29scy9saWJ4bC9saWJ4bF9hcm0uYyB8IDEwICsrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
eGwvbGlieGxfYXJtLmMgYi90b29scy9saWJ4bC9saWJ4bF9hcm0uYwppbmRleCAyZjFjYTY5NDMx
Li4zNGY4YTI5MDU2IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9hcm0uYworKysgYi90
b29scy9saWJ4bC9saWJ4bF9hcm0uYwpAQCAtMTIwMyw5ICsxMjAzLDE1IEBAIGludCBsaWJ4bF9f
YXJjaF9wYXNzdGhyb3VnaF9tb2RlX3NldGRlZmF1bHQobGlieGxfX2djICpnYywKICAgICAgICAg
Y19pbmZvLT5wYXNzdGhyb3VnaCA9IExJQlhMX1BBU1NUSFJPVUdIX1NIQVJFX1BUOwogICAgIH0K
IAotICAgIGlmIChjX2luZm8tPnBhc3N0aHJvdWdoID09IExJQlhMX1BBU1NUSFJPVUdIX1NZTkNf
UFQpIHsKKyAgICBzd2l0Y2ggKGNfaW5mby0+cGFzc3Rocm91Z2gpIHsKKyAgICBjYXNlIExJQlhM
X1BBU1NUSFJPVUdIX0RJU0FCTEVEOgorICAgIGNhc2UgTElCWExfUEFTU1RIUk9VR0hfU0hBUkVf
UFQ6CisgICAgICAgIGJyZWFrOworCisgICAgZGVmYXVsdDoKICAgICAgICAgTE9HRChFUlJPUiwg
ZG9taWQsCi0gICAgICAgICAgICAgInBhc3N0aHJvdWdoPVwic3luY19wdFwiIG5vdCBzdXBwb3J0
ZWQgb24gQVJNXG4iKTsKKyAgICAgICAgICAgICAicGFzc3Rocm91Z2g9XCIlc1wiIG5vdCBzdXBw
b3J0ZWQgb24gQVJNXG4iLAorICAgICAgICAgICAgIGxpYnhsX3Bhc3N0aHJvdWdoX3RvX3N0cmlu
ZyhjX2luZm8tPnBhc3N0aHJvdWdoKSk7CiAgICAgICAgIHJjID0gRVJST1JfSU5WQUw7CiAgICAg
ICAgIGdvdG8gb3V0OwogICAgIH0KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
