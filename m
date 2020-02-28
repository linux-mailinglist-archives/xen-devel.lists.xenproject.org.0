Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C53BD173432
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 10:37:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7c22-0000dS-6L; Fri, 28 Feb 2020 09:34:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7c20-0000cp-Jp
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 09:34:04 +0000
X-Inumbo-ID: 72cd7fa6-5a0d-11ea-b7e8-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72cd7fa6-5a0d-11ea-b7e8-bc764e2007e4;
 Fri, 28 Feb 2020 09:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582882439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nVQnn5b/1mYJiuc0qBvbdvw96D3soqQ/4cxZzw/8cqI=;
 b=AvmVW7Wz/BAr4X1oevVDwrIx0+i2n60L8ZIfZ97H0iGeM9pGfQ55MsGS
 CeTn7j6XPpsNHpAx4KOB34teeD62qMnIMBuW3B1HVQibe2y+ISW70sScz
 DIK4IoCiRPMYoNUD4POjS2tR3z8F3UzIUKqPUkqHhyMYPWe6IxAQpAwPl o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6Xi6wvmuSJjWPCgnZSZ5FEV5s8ll91G7/Zo1+kXGys4Rg03GZCR4/HOs7X6VJbfCPp8yFWvJfm
 Op0oMVsQt+APbXCaEFFb0ojnAp/+ijUHBm2Hpn68qdeMFVsgM5HLn8m56gKSGgmtXM0lSgQ2KN
 elyE6K3ryV0NAUdWd/HasEgmWRyIWL6xhTI9J5BDKsZQ5ykaE2DKX8wbYHzvLJJqbVEzdtCXga
 mVcbNY//JnOhJOHNi76xYOlejldrrjfsfkQo1nPO6XdBIXkEFWeoZZUrlD/1avj7HJodtYNYuC
 Imk=
X-SBRS: 2.7
X-MesageID: 13588527
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,495,1574139600"; d="scan'208";a="13588527"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 28 Feb 2020 10:33:33 +0100
Message-ID: <20200228093334.36586-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200228093334.36586-1-roger.pau@citrix.com>
References: <20200228093334.36586-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 1/2] x86/smp: use a dedicated CPU mask in
 send_IPI_mask
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29tZSBjYWxsZXJzIG9mIHNlbmRfSVBJX21hc2sgcGFzcyB0aGUgc2NyYXRjaCBjcHVtYXNrIGFz
IHRoZSBtYXNrCnBhcmFtZXRlciBvZiBzZW5kX0lQSV9tYXNrLCBzbyB0aGUgc2NyYXRjaCBjcHVt
YXNrIGNhbm5vdCBiZSB1c2VkIGJ5CnRoZSBmdW5jdGlvbi4gVGhlIGZvbGxvd2luZyB0cmFjZSBo
YXMgYmVlbiBvYnRhaW5lZCB3aXRoIGEgZGVidWcgcGF0Y2gKYW5kIHNob3dzIG9uZSBvZiB0aG9z
ZSBjYWxsZXJzOgoKKFhFTikgc2NyYXRjaCBDUFUgbWFzayBhbHJlYWR5IGluIHVzZSBieSBhcmNo
L3g4Ni9tbS5jI19nZXRfcGFnZV90eXBlKzB4MWY5LzB4MWFiZgooWEVOKSBYZW4gQlVHIGF0IHNt
cC5jOjQ1ClsuLi5dCihYRU4pIFhlbiBjYWxsIHRyYWNlOgooWEVOKSAgICBbPGZmZmY4MmQwODAy
YWJiNTM+XSBSIHNjcmF0Y2hfY3B1bWFzaysweGQzLzB4ZjkKKFhFTikgICAgWzxmZmZmODJkMDgw
MmFiYzIxPl0gRiBzZW5kX0lQSV9tYXNrKzB4NzIvMHgxY2EKKFhFTikgICAgWzxmZmZmODJkMDgw
MmFjMTNlPl0gRiBmbHVzaF9hcmVhX21hc2srMHgxMGMvMHgxNmMKKFhFTikgICAgWzxmZmZmODJk
MDgwMjk2YzU2Pl0gRiBhcmNoL3g4Ni9tbS5jI19nZXRfcGFnZV90eXBlKzB4M2ZmLzB4MWFiZgoo
WEVOKSAgICBbPGZmZmY4MmQwODAyOTgzMjQ+XSBGIGdldF9wYWdlX3R5cGUrMHhlLzB4MmMKKFhF
TikgICAgWzxmZmZmODJkMDgwMzg2MjRmPl0gRiBwdl9zZXRfZ2R0KzB4YTEvMHgyYWEKKFhFTikg
ICAgWzxmZmZmODJkMDgwMjdkZmQ2Pl0gRiBhcmNoX3NldF9pbmZvX2d1ZXN0KzB4MTE5Ni8weDE2
YmEKKFhFTikgICAgWzxmZmZmODJkMDgwMjA3YTU1Pl0gRiBkZWZhdWx0X2luaXRpYWxpc2VfdmNw
dSsweGM3LzB4ZDQKKFhFTikgICAgWzxmZmZmODJkMDgwMjdlNTViPl0gRiBhcmNoX2luaXRpYWxp
c2VfdmNwdSsweDYxLzB4Y2QKKFhFTikgICAgWzxmZmZmODJkMDgwMjA3ZTc4Pl0gRiBkb192Y3B1
X29wKzB4MjE5LzB4NjkwCihYRU4pICAgIFs8ZmZmZjgyZDA4MDM4YmUxNj5dIEYgcHZfaHlwZXJj
YWxsKzB4MmY2LzB4NTkzCihYRU4pICAgIFs8ZmZmZjgyZDA4MDM5NjQzMj5dIEYgbHN0YXJfZW50
ZXIrMHgxMTIvMHgxMjAKCl9nZXRfcGFnZV90eXBlIHdpbGwgdXNlIHRoZSBzY3JhdGNoIGNwdW1h
c2sgdG8gY2FsbCBmbHVzaF90bGJfbWFzaywKd2hpY2ggaW4gdHVybiBjYWxscyBzZW5kX0lQSV9t
YXNrLgoKRml4IHRoaXMgYnkgdXNpbmcgYSBkZWRpY2F0ZWQgcGVyIENQVSBjcHVtYXNrIGluIHNl
bmRfSVBJX21hc2suCgpGaXhlczogNTUwMGQyNjVhMmE4ICgneDg2L3NtcDogdXNlIEFQSUMgQUxM
QlVUIGRlc3RpbmF0aW9uIHNob3J0aGFuZCB3aGVuIHBvc3NpYmxlJykKU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2
L3NtcC5jICAgICB8IDQgKysrLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8IDkgKysrKysrKyst
CiAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L3NtcC5jIGIveGVuL2FyY2gveDg2L3NtcC5jCmluZGV4IDA0
NjE4MTJjZjYuLjA3MjYzOGYwZjYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zbXAuYworKysg
Yi94ZW4vYXJjaC94ODYvc21wLmMKQEAgLTU5LDYgKzU5LDggQEAgc3RhdGljIHZvaWQgc2VuZF9J
UElfc2hvcnRjdXQodW5zaWduZWQgaW50IHNob3J0Y3V0LCBpbnQgdmVjdG9yLAogICAgIGFwaWNf
d3JpdGUoQVBJQ19JQ1IsIGNmZyk7CiB9CiAKK0RFQ0xBUkVfUEVSX0NQVShjcHVtYXNrX3Zhcl90
LCBzZW5kX2lwaV9jcHVtYXNrKTsKKwogLyoKICAqIHNlbmRfSVBJX21hc2soY3B1bWFzaywgdmVj
dG9yKTogc2VuZHMgQHZlY3RvciBJUEkgdG8gQ1BVcyBpbiBAY3B1bWFzaywKICAqIGV4Y2x1ZGlu
ZyB0aGUgbG9jYWwgQ1BVLiBAY3B1bWFzayBtYXkgYmUgZW1wdHkuCkBAIC02Nyw3ICs2OSw3IEBA
IHN0YXRpYyB2b2lkIHNlbmRfSVBJX3Nob3J0Y3V0KHVuc2lnbmVkIGludCBzaG9ydGN1dCwgaW50
IHZlY3RvciwKIHZvaWQgc2VuZF9JUElfbWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGludCB2
ZWN0b3IpCiB7CiAgICAgYm9vbCBjcHVzX2xvY2tlZCA9IGZhbHNlOwotICAgIGNwdW1hc2tfdCAq
c2NyYXRjaCA9IHRoaXNfY3B1KHNjcmF0Y2hfY3B1bWFzayk7CisgICAgY3B1bWFza190ICpzY3Jh
dGNoID0gdGhpc19jcHUoc2VuZF9pcGlfY3B1bWFzayk7CiAKICAgICBpZiAoIGluX2lycSgpIHx8
IGluX21jZV9oYW5kbGVyKCkgfHwgaW5fbm1pX2hhbmRsZXIoKSApCiAgICAgewpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKaW5kZXgg
YWQ0OWYyZGNkNy4uNmM1NDhiMGI1MyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3Qu
YworKysgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCkBAIC01Nyw2ICs1Nyw5IEBAIERFRklORV9Q
RVJfQ1BVX1JFQURfTU9TVExZKGNwdW1hc2tfdmFyX3QsIGNwdV9jb3JlX21hc2spOwogREVGSU5F
X1BFUl9DUFVfUkVBRF9NT1NUTFkoY3B1bWFza192YXJfdCwgc2NyYXRjaF9jcHVtYXNrKTsKIHN0
YXRpYyBjcHVtYXNrX3Qgc2NyYXRjaF9jcHUwbWFzazsKIAorREVGSU5FX1BFUl9DUFVfUkVBRF9N
T1NUTFkoY3B1bWFza192YXJfdCwgc2VuZF9pcGlfY3B1bWFzayk7CitzdGF0aWMgY3B1bWFza190
IHNlbmRfaXBpX2NwdTBtYXNrOworCiBjcHVtYXNrX3QgY3B1X29ubGluZV9tYXAgX19yZWFkX21v
c3RseTsKIEVYUE9SVF9TWU1CT0woY3B1X29ubGluZV9tYXApOwogCkBAIC05MzAsNiArOTMzLDgg
QEAgc3RhdGljIHZvaWQgY3B1X3NtcGJvb3RfZnJlZSh1bnNpZ25lZCBpbnQgY3B1LCBib29sIHJl
bW92ZSkKICAgICAgICAgRlJFRV9DUFVNQVNLX1ZBUihwZXJfY3B1KGNwdV9jb3JlX21hc2ssIGNw
dSkpOwogICAgICAgICBpZiAoIHBlcl9jcHUoc2NyYXRjaF9jcHVtYXNrLCBjcHUpICE9ICZzY3Jh
dGNoX2NwdTBtYXNrICkKICAgICAgICAgICAgIEZSRUVfQ1BVTUFTS19WQVIocGVyX2NwdShzY3Jh
dGNoX2NwdW1hc2ssIGNwdSkpOworICAgICAgICBpZiAoIHBlcl9jcHUoc2VuZF9pcGlfY3B1bWFz
aywgY3B1KSAhPSAmc2VuZF9pcGlfY3B1MG1hc2sgKQorICAgICAgICAgICAgRlJFRV9DUFVNQVNL
X1ZBUihwZXJfY3B1KHNlbmRfaXBpX2NwdW1hc2ssIGNwdSkpOwogICAgIH0KIAogICAgIGNsZWFu
dXBfY3B1X3Jvb3RfcGd0KGNwdSk7CkBAIC0xMDM0LDcgKzEwMzksOCBAQCBzdGF0aWMgaW50IGNw
dV9zbXBib290X2FsbG9jKHVuc2lnbmVkIGludCBjcHUpCiAKICAgICBpZiAoICEoY29uZF96YWxs
b2NfY3B1bWFza192YXIoJnBlcl9jcHUoY3B1X3NpYmxpbmdfbWFzaywgY3B1KSkgJiYKICAgICAg
ICAgICAgY29uZF96YWxsb2NfY3B1bWFza192YXIoJnBlcl9jcHUoY3B1X2NvcmVfbWFzaywgY3B1
KSkgJiYKLSAgICAgICAgICAgY29uZF9hbGxvY19jcHVtYXNrX3ZhcigmcGVyX2NwdShzY3JhdGNo
X2NwdW1hc2ssIGNwdSkpKSApCisgICAgICAgICAgIGNvbmRfYWxsb2NfY3B1bWFza192YXIoJnBl
cl9jcHUoc2NyYXRjaF9jcHVtYXNrLCBjcHUpKSAmJgorICAgICAgICAgICBjb25kX2FsbG9jX2Nw
dW1hc2tfdmFyKCZwZXJfY3B1KHNlbmRfaXBpX2NwdW1hc2ssIGNwdSkpKSApCiAgICAgICAgIGdv
dG8gb3V0OwogCiAgICAgcmMgPSAwOwpAQCAtMTE3NSw2ICsxMTgxLDcgQEAgdm9pZCBfX2luaXQg
c21wX3ByZXBhcmVfYm9vdF9jcHUodm9pZCkKICAgICBjcHVtYXNrX3NldF9jcHUoY3B1LCAmY3B1
X3ByZXNlbnRfbWFwKTsKICNpZiBOUl9DUFVTID4gMiAqIEJJVFNfUEVSX0xPTkcKICAgICBwZXJf
Y3B1KHNjcmF0Y2hfY3B1bWFzaywgY3B1KSA9ICZzY3JhdGNoX2NwdTBtYXNrOworICAgIHBlcl9j
cHUoc2VuZF9pcGlfY3B1bWFzaywgY3B1KSA9ICZzZW5kX2lwaV9jcHUwbWFzazsKICNlbmRpZgog
CiAgICAgZ2V0X2NwdV9pbmZvKCktPnVzZV9wdl9jcjMgPSBmYWxzZTsKLS0gCjIuMjUuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
