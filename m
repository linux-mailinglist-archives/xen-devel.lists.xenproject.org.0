Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F03B813245E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 12:01:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iomaB-0006GN-Nf; Tue, 07 Jan 2020 10:59:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9r6A=24=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iomaA-0006GI-Ht
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 10:59:30 +0000
X-Inumbo-ID: c1d8b34e-313c-11ea-bf56-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1d8b34e-313c-11ea-bf56-bc764e2007e4;
 Tue, 07 Jan 2020 10:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578394762;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=1UsjUZ0qAw2K5wVCVf3oiPQHy7/jBUdhjzrD170pMzM=;
 b=ZGl0JjmxPOofSS2MnuqR5S0BAPZDxDASEVQ9R7ZCT8ZKz7A73GkBNO0C
 D0dLltSNxw4UKxewRKRO3UHVqC/7eobQHziTHO+EZMEpoyHpS7Bwl9uQT
 w9EYvsROjub5OmOOORIWeRl3kvkIXUwSSXjKPaA7zhlwrQMzosNLWWnXf 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: U3FT6S/NJA9SaJdGr1akWivwc++gEAoiMyM0UIPCiLKyJ/X0m64Gaks5wUZgUC+mS0O2BBecsa
 bs1iyuhcNicRIPhnLdYX6ERe+9Cb/pmIbdVVim1OdzI5w83LJikh22nZsoAMnwnYw0jiVJEKY3
 hONiUKRcioMzbZ9NhTLof6AMWb8uclxkgfApcwlTloUxT9jJWSqIgpBq9wbLrvjDvm77q9SGKN
 y8J+KHtEAR+2mPYb74N/GAuQHLjz05eq+HJsAamfZbPVXCj2kXoaYNtXXhx+qA8hBRZDNaFx31
 pKY=
X-SBRS: 2.7
X-MesageID: 10696260
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,405,1571716800"; d="scan'208";a="10696260"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24084.25733.657737.387040@mariner.uk.xensource.com>
Date: Tue, 7 Jan 2020 10:59:17 +0000
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
In-Reply-To: <2888c8ab866d465a904b68e5f181ec42@EX13D32EUC003.ant.amazon.com>
References: <2888c8ab866d465a904b68e5f181ec42@EX13D32EUC003.ant.amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] LRU list of domids
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVycmFudCwgUGF1bCB3cml0ZXMgKCJMUlUgbGlzdCBvZiBkb21pZHMiKToKPiAgIEkndmUgYmVl
biBsb29raW5nIGF0IGtlZXBpbmcgYW4gTFJVIGxpc3Qgb2YgZG9taWRzIHRvIGF2b2lkIGVhZ2Vy
IHJlY3ljbGluZyBhbmQgSSBoYXZlIGEgZmV3IHF1ZXN0aW9ucy4uLgo+IAo+ICAgS2VlcGluZyBo
aXN0b3J5IGluIGEgZmlsZSB0aGF0IGlzIHVwZGF0ZWQgYnkgbGlieGwgc2VlbXMgb2sgKGFuZCBJ
IGhhdmUgY29kZWQgaXQgdXApLCBidXQgdGhlcmUgaXMgdGhlIHF1ZXN0aW9uIG9mIGhvc3QgcmVi
b290Li4uIHNvbWV0aGluZyBuZWVkcyB0byBjbGVhciBoaXN0b3J5LiBUaGVyZSdzIG5vICdsaWJ4
bCcgaW5pdCBzY3JpcHQsIHNvIG5vdCBzdXJlIHdoZXJlIHRvIGRvIGl0LiBBbiBhbHRlcm5hdGl2
ZSAtIHRvIGF2b2lkIHRoZSBzY3J1YmJpbmcgaXNzdWUgLSB3b3VsZCBiZSB0byBrZWVwIHRoZSBo
aXN0b3J5IGluIHhlbnN0b3JlLCB1bmRlciBsaWJ4bCdzIHRvcCBsZXZlbCBwYXRoLiBEbyB5b3Ug
dGhpbmsgdGhhdCB3b3VsZCBiZSBhIHJlYXNvbmFibGUgYWx0ZXJuYXRpdmUgdG8gYSBmaWxlPwoK
SSB0aGluayB0aGF0IHdvdWxkIGJlIHRvbGVyYWJsZSwgYWx0aG91Z2ggc3RvcmluZyBhIGxpc3Qg
b2YgMl4xNQoyLWJ5dGUgdmFsdWVzIGFzIGEgc2V0IG9mIDJeMTUgeGVuc3RvcmUgbm9kZXMgaXMg
cmF0aGVyIGZsYWJieSBhbmQKd2lsbCBtYWtlIHRoZSBvdXRwdXQgb2YgeGVuc3RvcmUtbHMgaGFy
ZCB0byB1c2UuICBJdCBtaWdodCBuZWVkIHRoZQpwcnVuaW5nIHlvdSBzdWdnZXN0IChzZWUgYmVs
b3cpLgoKQnV0IHlvdSBtaWdodCBsaWtlIHRvIGNvbnNpZGVyIChpKSB3aGV0aGVyIHNjcnViYmlu
ZyB0aGUgTFJVIGxpc3QgaXMKc29tZXRoaW5nIHRoYXQgdG9vbHMvaGVscGVycy94ZW4taW5pdC1k
b20wIGNvdWxkIGRvIC0gdGhpcyBpcyBub3JtYWxseQppbmRlZWQgY2FsbGVkIGZyb20gaW5pdCBz
Y3JpcHRzIGF0IGJvb3QgdGltZSAoaWkpIHdoZXRoZXIgc2NydWJiaW5nCnRoZSBMUlUgbGlzdCBv
biByZWJvb3QgaXMgaW4gZmFjdCBuZWVkZWQgYXQgYWxsLgoKPiAgIEFsc28sIGhvdyBtdWNoIGhp
c3RvcnkgZG8gd2Uga2VlcCBieSBkZWZhdWx0IGFuZCBob3cgdHVuYWJsZSBkbyB5b3UgdGhpbmsg
aXQgc2hvdWxkIGJlPyBBbHNvLCBpZiBpdCBuZWVkcyB0byBiZSB0dW5hYmxlIHRoZW4gaG93IHNo
b3VsZCBpdCBiZSB0dW5lZD8gRW52IHZhcmlhYmxlIHBlcmhhcHM/CgpJIHdhcyBpbWFnaW5pbmcg
d2Ugd291bGQga2VlcCBhIGNvbXBsZXRlIGxpc3Qgb2YgYWxsIHBvc3NpYmxlIGRvbWlkcywKaW4g
YW4gb3JkZXIuICBkb21pZHMgZ28gdXAgdG8gMl4xNSBzbyBmaXQgaW4gdHdvIGJ5dGVzLiAgMl4x
NSB4IDIKYnl0ZXMgPSA2NTUzNiBieXRlcywgd2hpY2ggaXMgYSB0cml2aWFsIGFtb3VudCB0byBz
dG9yZSBhbmQgcHJvY2VzcyBpZgpoYW5kbGVkIGFwcHJvcHJpYXRlbHkuICBJdCdzIG5vdCBicmls
bGlhbnQgaW4geGVuc3RvcmUgYnV0IGl0IHdvdWxkIGJlCmZpbmUgZm9yIGEgZmlsZSBpbiBhIHRt
cGZzIGxpa2UgWy92YXJdL3J1bi4KCldlIG5lZWQgdG8gY29udHJvbCBub3Qgb25seSB0dW5pbmcs
IGJ1dCBhbHNvIHRoZSBkZWZhdWx0IGFsbG9jYXRpb24KcG9saWN5LiAgSSBzdWdnZXN0IHRoYXQg
d2UgcmVjb3JkIHRoZSBhbGxvY2F0aW9uIHBvbGljeSBzb21ld2hlcmUgbmVhcgp0aGUgbGlzdCBv
ZiBkb21pZHMuICBJdCBjb3VsZCBiZSBjb25maWd1cmVkIGF0IGJvb3QgdGltZSBieSBzb21lCnV0
aWxpdHkgbGlrZSB4ZW4taW5pdC1kb20wLgoKRW52aXJvbm1lbnQgdmFyaWFibGVzIGFyZSBub3Qg
YnJpbGxpYW50IGZvciB0aGlzIGtpbmQgb2YgdGhpbmcgYmVjYXVzZQp0aGV5IG1heSBub3QgYmUg
c2V0IGluIGFsbCBjb250ZXh0LCBvciBtYXkgdmFyeS4gIFRoZXkgYXJlIGEgbnVpc2FuY2UKdG8g
YXJyYW5nZSB0byBiZSBzZXQgZXZlcnl3aGVyZS4gIFRoYXQgbWFrZXMgaXQgbW9yZSBuZWNlc3Nh
cnkgdG8KZGV2aXNlIHBsZWFzYW50IGJlaGF2aW91cnMgZm9yIHRoZSBjb3JuZXIgY2FzZXMgd2hl
cmUgdGhlIHR1bmluZwp2YXJpZXMgZnJvbSBvcGVyYXRpb24gdG8gb3BlcmF0aW9uLgoKVGhhbmtz
LApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
