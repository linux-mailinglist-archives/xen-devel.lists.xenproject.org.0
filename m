Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BD589908
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 10:54:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hx617-0002kM-QE; Mon, 12 Aug 2019 08:49:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2okp=WI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hx614-0002kH-Qg
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 08:49:23 +0000
X-Inumbo-ID: 11dc64f4-bcde-11e9-8271-f772a51e9b6a
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11dc64f4-bcde-11e9-8271-f772a51e9b6a;
 Mon, 12 Aug 2019 08:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565599758;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9ddt8p1x9c7vbOfw0mclslg4q+Z34NYzRueRbs1+UkU=;
 b=P9CJY4rPCyZ90Y1bZjCSAXkgQ9imeaQDvc3CtUb/goHCPwsFAri7AnAA
 /p3lGcJEUsR0z8Z1tLpipht/HdozqcGenEA5WAtfQX2SSceXx6WmaRjvL
 21jevBWPWDjFLTg0z7k58ufVbb3eZXBNm1bqYQqehqsDvsdTFgP/esA/h c=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2kSHKHm5HwQ9K+9+aCk8H5O3gYMiB2IUfZLmVfHUKEptE9LIH9+OD6maCgO3ZiIGmrovCFmIK5
 PPeWKiBOqhF0O/FrUB6VJ0+d8fp+b2oLRON5ZckGESvAhEYkr9vuBubfJWJkF87dciK4evAC+x
 HJPSsQxzctuHbmqJt2P99g3jzEhL0WiVbvl0+lITjxXj/DG5Bwn5DWFT09XV29Bzjpsy9EwPpn
 ME/Yn4nYCbmyAeRNxKHa6rDy3eSVyYgc/276W+IMiylV9BKrrc0qF7K3N5d44K8TW+aoF9BhZ1
 C4I=
X-SBRS: 2.7
X-MesageID: 4341947
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,376,1559534400"; 
   d="scan'208";a="4341947"
Date: Mon, 12 Aug 2019 10:49:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wenwen Wang <wenwen@cs.uga.edu>
Message-ID: <20190812084911.25vfz6zu5omgtqqe@Air-de-Roger>
References: <1565544202-3927-1-git-send-email-wenwen@cs.uga.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565544202-3927-1-git-send-email-wenwen@cs.uga.edu>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen/blkback: fix memory leaks
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
Cc: Jens Axboe <axboe@kernel.dk>,
 "moderated list:XEN BLOCK SUBSYSTEM" <xen-devel@lists.xenproject.org>,
 "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBBdWcgMTEsIDIwMTkgYXQgMTI6MjM6MjJQTSAtMDUwMCwgV2Vud2VuIFdhbmcgd3Jv
dGU6Cj4gSW4gcmVhZF9wZXJfcmluZ19yZWZzKCksIGFmdGVyICdyZXEnIGFuZCByZWxhdGVkIG1l
bW9yeSByZWdpb25zIGFyZQo+IGFsbG9jYXRlZCwgeGVuX2Jsa2lmX21hcCgpIGlzIGludm9rZWQg
dG8gbWFwIHRoZSBzaGFyZWQgZnJhbWUsIGlycSwgYW5kCj4gZXRjLiBIb3dldmVyLCBpZiB0aGlz
IG1hcHBpbmcgcHJvY2VzcyBmYWlscywgbm8gY2xlYW51cCBpcyBwZXJmb3JtZWQsCj4gbGVhZGlu
ZyB0byBtZW1vcnkgbGVha3MuIFRvIGZpeCB0aGlzIGlzc3VlLCBpbnZva2UgdGhlIGNsZWFudXAg
YmVmb3JlCj4gcmV0dXJuaW5nIHRoZSBlcnJvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZW53ZW4g
V2FuZyA8d2Vud2VuQGNzLnVnYS5lZHU+CgpUaGFua3MhCgo+IC0tLQo+ICBkcml2ZXJzL2Jsb2Nr
L3hlbi1ibGtiYWNrL3hlbmJ1cy5jIHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9j
ay94ZW4tYmxrYmFjay94ZW5idXMuYyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVz
LmMKPiBpbmRleCAzYWM2YTVkLi5iOTBkYmNkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYmxvY2sv
eGVuLWJsa2JhY2sveGVuYnVzLmMKPiArKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hl
bmJ1cy5jCj4gQEAgLTk2NSw2ICs5NjUsNyBAQCBzdGF0aWMgaW50IHJlYWRfcGVyX3JpbmdfcmVm
cyhzdHJ1Y3QgeGVuX2Jsa2lmX3JpbmcgKnJpbmcsIGNvbnN0IGNoYXIgKmRpcikKPiAgCQl9Cj4g
IAl9Cj4gIAo+ICsJZXJyID0gLUVOT01FTTsKPiAgCWZvciAoaSA9IDA7IGkgPCBucl9ncmVmcyAq
IFhFTl9CTEtJRl9SRVFTX1BFUl9QQUdFOyBpKyspIHsKPiAgCQlyZXEgPSBremFsbG9jKHNpemVv
ZigqcmVxKSwgR0ZQX0tFUk5FTCk7Cj4gIAkJaWYgKCFyZXEpCj4gQEAgLTk4Nyw3ICs5ODgsNyBA
QCBzdGF0aWMgaW50IHJlYWRfcGVyX3JpbmdfcmVmcyhzdHJ1Y3QgeGVuX2Jsa2lmX3JpbmcgKnJp
bmcsIGNvbnN0IGNoYXIgKmRpcikKPiAgCWVyciA9IHhlbl9ibGtpZl9tYXAocmluZywgcmluZ19y
ZWYsIG5yX2dyZWZzLCBldnRjaG4pOwoKWW91IGNvdWxkIGFsc28gbW92ZSB0aGUgeGVuX2Jsa2lm
X21hcCBjYWwgYmVmb3JlIHRoZSBhbGxvY2F0aW9uIGxvb3AsCnNpbmNlIHRoZXJlJ3Mgbm90aGlu
ZyBpbiB4ZW5fYmxraWZfbWFwIHRoYXQgdXNlcyB0aGUgbWVtb3J5IGFsbG9jYXRlZApBRkFJQ1Qs
IGJ1dCBJJ20gZmluZSBlaXRoZXIgd2F5LgoKQWNrZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
