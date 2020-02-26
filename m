Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E8016FED5
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 13:23:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6vfk-0008C8-0e; Wed, 26 Feb 2020 12:20:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NxXS=4O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6vfi-0008Be-Ft
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 12:20:14 +0000
X-Inumbo-ID: 56eda4ea-5892-11ea-8cb6-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56eda4ea-5892-11ea-8cb6-bc764e2007e4;
 Wed, 26 Feb 2020 12:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582719614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QLqmgx5Dkvpg14/6NDnlCJdFLL9NI3RbIxt80YtkH4I=;
 b=Z9Ijaim4l29uKt5mVxSX/2b6ZA+RRgNQHnzPPXA9WWI5zqFME++UWrJR
 lkTG17SQUa/NuM98REEgJu97wqEbc7t8m5RgxjgTrUdxoE9DggOV4YeYk
 T7CuZNwa53H9k1NJxdbEk1PxSo7py4vn4OFYQ3APTSciI8icP1j4yCXCD o=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7FvUuyh9OnB47C8WqBEivpz7Zd9bsnWTM+La+rItXbcLbixPYrP/U5rkJHjTa5OZJBXPTZX+fs
 tPv9qLdBl8N2ULd5+R1sj1nlgFQ9ybSzI/eif+lZQ0qzpTBhwo19zi/DsuDqmBLbZf9aDWFhWi
 5BjHckAQUjtH5FCbcvUeZF7fmpVJU9SIsRwDr03/YXsXN1vmuoFHK5ip66yxBimMuWETdditkk
 nYNTQseSRQV0Sx0SILMTbYKef9ysokbO7L3AlG+sFuC6QZ1/UiJnZOtLf7prBzuryUZzzGovZW
 Fxw=
X-SBRS: 2.7
X-MesageID: 13014362
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,488,1574139600"; d="scan'208";a="13014362"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 13:19:21 +0100
Message-ID: <20200226121921.28627-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226121921.28627-1-roger.pau@citrix.com>
References: <20200226121921.28627-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 4/4] x86/smp: do not use scratch_cpumask when
 in interrupt or exception context
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Sander
 Eikelenboom <linux@eikelenboom.it>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNpbmcgc2NyYXRjaF9jcHVtYXNrIGluIHNlbmRfSVBJX21hc2sgaXMgbm90IHNhZmUgaW4gSVJR
IG9yIGV4Y2VwdGlvbgpjb250ZXh0IGJlY2F1c2UgaXQgY2FuIG5lc3QsIGFuZCBoZW5jZSBzZW5k
X0lQSV9tYXNrIGNvdWxkIGJlCm92ZXJ3cml0aW5nIGFub3RoZXIgdXNlciBzY3JhdGNoIGNwdW1h
c2sgZGF0YSB3aGVuIHVzZWQgaW4gc3VjaApjb250ZXh0cy4KCkluc3RlYWQgaW50cm9kdWNlIGEg
bmV3IGNwdW1hc2sgdG8gYmUgdXNlZCBieSBzZW5kX0lQSV9tYXNrLCBhbmQKZGlzYWJsZSBpbnRl
cnJ1cHRzIHdoaWxlIHVzaW5nIGl0LgoKRmFsbGJhY2sgdG8gbm90IHVzaW5nIHRoZSBzY3JhdGNo
IGNwdW1hc2sgKGFuZCBoZW5jZSBub3QgYXR0ZW1waW5nIHRvCm9wdGltaXplIElQSSBzZW5kaW5n
IGJ5IHVzaW5nIGEgc2hvcnRoYW5kKSB3aGVuIGluIElSUSBvciBleGNlcHRpb24KY29udGV4dC4g
Tm90ZSB0aGF0IHRoZSBzY3JhdGNoIGNwdW1hc2sgY2Fubm90IGJlIHVzZWQgd2hlbgpub24tbWFz
a2FibGUgaW50ZXJydXB0cyBhcmUgYmVpbmcgc2VydmljZWQgKE5NSSBvciAjTUMpIGFuZCBoZW5j
ZQpmYWxsYmFjayB0byBub3QgdXNpbmcgdGhlIHNob3J0aGFuZCBpbiB0aGF0IGNhc2UsIGxpa2Ug
aXQgd2FzIGRvbmUKcHJldmlvdXNseS4KCkZpeGVzOiA1NTAwZDI2NWEyYTggKCd4ODYvc21wOiB1
c2UgQVBJQyBBTExCVVQgZGVzdGluYXRpb24gc2hvcnRoYW5kIHdoZW4gcG9zc2libGUnKQpSZXBv
cnRlZC1ieTogU2FuZGVyIEVpa2VsZW5ib29tIDxsaW51eEBlaWtlbGVuYm9vbS5pdD4KU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDaGFu
Z2VzIHNpbmNlIHYzOgogLSBEbyBub3QgdXNlIGEgZGVkaWNhdGVkIGNwdW1hc2ssIGFuZCBpbnN0
ZWFkIHByZXZlbnQgdXNhZ2Ugd2hlbiBpbgogICBJUlEgY29udGV4dC4KCkNoYW5nZXMgc2luY2Ug
djI6CiAtIEZhbGxiYWNrIHRvIHRoZSBwcmV2aW91cyBJUEkgc2VuZGluZyBtZWNoYW5pc20gaW4g
I01DIG9yICNOTUkKICAgY29udGV4dC4KCkNoYW5nZXMgc2luY2UgdjE6CiAtIERvbid0IHVzZSB0
aGUgc2hvcnRoYW5kIHdoZW4gaW4gI01DIG9yICNOTUkgY29udGV4dC4KLS0tCiB4ZW4vYXJjaC94
ODYvc21wLmMgfCAxMiArKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NtcC5jIGIveGVuL2FyY2gveDg2L3NtcC5j
CmluZGV4IDU1ZDA4YzlkNTIuLmZhOWJmZTRkNTQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9z
bXAuYworKysgYi94ZW4vYXJjaC94ODYvc21wLmMKQEAgLTY5LDYgKzY5LDE4IEBAIHZvaWQgc2Vu
ZF9JUElfbWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGludCB2ZWN0b3IpCiAgICAgYm9vbCBj
cHVzX2xvY2tlZCA9IGZhbHNlOwogICAgIGNwdW1hc2tfdCAqc2NyYXRjaCA9IHRoaXNfY3B1KHNj
cmF0Y2hfY3B1bWFzayk7CiAKKyAgICBpZiAoIGluX2lycSgpIHx8wqBpbl9tY2UoKSB8fCBpbl9u
bWkoKSApCisgICAgeworICAgICAgICAvKgorICAgICAgICAgKiBXaGVuIGluIElSUSwgTk1JIG9y
ICNNQyBjb250ZXh0IGZhbGxiYWNrIHRvIHRoZSBvbGQgKGFuZCBzaW1wbGVyKQorICAgICAgICAg
KiBJUEkgc2VuZGluZyByb3V0aW5lLCBhbmQgYXZvaWQgZG9pbmcgYW55IHBlcmZvcm1hbmNlIG9w
dGltaXphdGlvbnMKKyAgICAgICAgICogKGxpa2UgdXNpbmcgYSBzaG9ydGhhbmQpIGluIG9yZGVy
IHRvIGF2b2lkIHVzaW5nIHRoZSBzY3JhdGNoCisgICAgICAgICAqIGNwdW1hc2sgd2hpY2ggY2Fu
bm90IGJlIHVzZWQgaW4gaW50ZXJydXB0IGNvbnRleHQuCisgICAgICAgICAqLworICAgICAgICBh
bHRlcm5hdGl2ZV92Y2FsbChnZW5hcGljLnNlbmRfSVBJX21hc2ssIG1hc2ssIHZlY3Rvcik7Cisg
ICAgICAgIHJldHVybjsKKyAgICB9CisKICAgICAvKgogICAgICAqIFRoaXMgY2FuIG9ubHkgYmUg
c2FmZWx5IHVzZWQgd2hlbiBubyBDUFUgaG90cGx1ZyBvciB1bnBsdWcgb3BlcmF0aW9ucwogICAg
ICAqIGFyZSB0YWtpbmcgcGxhY2UsIHRoZXJlIGFyZSBubyBvZmZsaW5lIENQVXMgKHVubGVzcyB0
aG9zZSBoYXZlIGJlZW4KLS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
