Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FC116FF33
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 13:42:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6vxx-0001IN-6c; Wed, 26 Feb 2020 12:39:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NxXS=4O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6vxv-0001II-Mk
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 12:39:03 +0000
X-Inumbo-ID: f7be3d38-5894-11ea-aba8-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7be3d38-5894-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 12:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582720743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tiWcA33JFD6YAqhIOQ2+0XkzWGnPZy8SwGRnFCFPNmM=;
 b=Mwu5Dht7IrVf+FMcyaA3ylSWn6VACMub92xxvDEhnIYQTYvFptI8L0f4
 f447RJT8ygNCV4aSuh5crO75PieA8gJ0Vzo3v00Ui8m13tv0bJU9ISdBl
 7c4p6wfD+ys29BSDEZTtXiEOLBNmruYgt9ZW6Mb2cKMXNlj7c1gBInfyf c=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: o0W6PQmgv0v5hWIQFtkMVxQfHnJ2s+0k3aHvo4TB2dKvgmJFlYG8bxSa53NfEATM7Nr+JBvZsz
 KbAhAQVp3K2AJbkiykE7nTi6ru7nOngIxVF5HJWczADtNDfyQ39fk9OKN/2VtR4md2V2x3/AAk
 b1AidZTjRwAW/uMcGt2g3ctgGnY/Q3YpLqC1OE8laqDzAgsrnE3L7VX89o8PDJIgQoUioVyxuq
 VQs67wPlUMRq0IXACvYC97yEWYRd9tJMYXCiQZ7NWAuIZ8FQIr0vi/MaY2yevwemTMbbClNFoH
 ctM=
X-SBRS: 2.7
X-MesageID: 13040800
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,488,1574139600"; d="scan'208";a="13040800"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 13:38:44 +0100
Message-ID: <20200226123844.29519-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226121921.28627-5-roger.pau@citrix.com>
References: <20200226121921.28627-5-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 4/4] x86/smp: do not use scratch_cpumask when
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
Z2VzIHNpbmNlIHY0OgogLSBBZGQgX2hhbmRsZXIgc3VmZml4IHRvIGluX25taS9pbl9tY2UgY2Fs
bHMuCgpDaGFuZ2VzIHNpbmNlIHYzOgogLSBEbyBub3QgdXNlIGEgZGVkaWNhdGVkIGNwdW1hc2ss
IGFuZCBpbnN0ZWFkIHByZXZlbnQgdXNhZ2Ugd2hlbiBpbgogICBJUlEgY29udGV4dC4KCkNoYW5n
ZXMgc2luY2UgdjI6CiAtIEZhbGxiYWNrIHRvIHRoZSBwcmV2aW91cyBJUEkgc2VuZGluZyBtZWNo
YW5pc20gaW4gI01DIG9yICNOTUkKICAgY29udGV4dC4KCkNoYW5nZXMgc2luY2UgdjE6CiAtIERv
bid0IHVzZSB0aGUgc2hvcnRoYW5kIHdoZW4gaW4gI01DIG9yICNOTUkgY29udGV4dC4KLS0tCiB4
ZW4vYXJjaC94ODYvc21wLmMgfCAxMiArKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NtcC5jIGIveGVuL2FyY2gv
eDg2L3NtcC5jCmluZGV4IDU1ZDA4YzlkNTIuLjA0NjE4MTJjZjYgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9zbXAuYworKysgYi94ZW4vYXJjaC94ODYvc21wLmMKQEAgLTY5LDYgKzY5LDE4IEBA
IHZvaWQgc2VuZF9JUElfbWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGludCB2ZWN0b3IpCiAg
ICAgYm9vbCBjcHVzX2xvY2tlZCA9IGZhbHNlOwogICAgIGNwdW1hc2tfdCAqc2NyYXRjaCA9IHRo
aXNfY3B1KHNjcmF0Y2hfY3B1bWFzayk7CiAKKyAgICBpZiAoIGluX2lycSgpIHx8IGluX21jZV9o
YW5kbGVyKCkgfHwgaW5fbm1pX2hhbmRsZXIoKSApCisgICAgeworICAgICAgICAvKgorICAgICAg
ICAgKiBXaGVuIGluIElSUSwgTk1JIG9yICNNQyBjb250ZXh0IGZhbGxiYWNrIHRvIHRoZSBvbGQg
KGFuZCBzaW1wbGVyKQorICAgICAgICAgKiBJUEkgc2VuZGluZyByb3V0aW5lLCBhbmQgYXZvaWQg
ZG9pbmcgYW55IHBlcmZvcm1hbmNlIG9wdGltaXphdGlvbnMKKyAgICAgICAgICogKGxpa2UgdXNp
bmcgYSBzaG9ydGhhbmQpIGluIG9yZGVyIHRvIGF2b2lkIHVzaW5nIHRoZSBzY3JhdGNoCisgICAg
ICAgICAqIGNwdW1hc2sgd2hpY2ggY2Fubm90IGJlIHVzZWQgaW4gaW50ZXJydXB0IGNvbnRleHQu
CisgICAgICAgICAqLworICAgICAgICBhbHRlcm5hdGl2ZV92Y2FsbChnZW5hcGljLnNlbmRfSVBJ
X21hc2ssIG1hc2ssIHZlY3Rvcik7CisgICAgICAgIHJldHVybjsKKyAgICB9CisKICAgICAvKgog
ICAgICAqIFRoaXMgY2FuIG9ubHkgYmUgc2FmZWx5IHVzZWQgd2hlbiBubyBDUFUgaG90cGx1ZyBv
ciB1bnBsdWcgb3BlcmF0aW9ucwogICAgICAqIGFyZSB0YWtpbmcgcGxhY2UsIHRoZXJlIGFyZSBu
byBvZmZsaW5lIENQVXMgKHVubGVzcyB0aG9zZSBoYXZlIGJlZW4KLS0gCjIuMjUuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
