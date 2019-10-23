Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AC5E1D8F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 16:01:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNH9o-0004nH-OS; Wed, 23 Oct 2019 13:58:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xo40=YQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iNH9m-0004mJ-Np
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:58:34 +0000
X-Inumbo-ID: 2ba9895a-f59d-11e9-947f-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ba9895a-f59d-11e9-947f-12813bfff9fa;
 Wed, 23 Oct 2019 13:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571839100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HKJkSbXcmX/kEnPedYeC0yfTtOaX516ggrC6KOT5BGE=;
 b=NGRw5Emq08+0nPDZEZ9FR2me7wvU56xvzN4NBxexyJWBpy1wU4+JA6lG
 SwQXp1V3j3jyvkkAWkzrC4UW86I5Wrd85jZCZcN+hlpJSD9P8mikT2CEC
 vCLmdg+P2ci9drLOBtdIK51Tx548bMRmfS+SgWU7wlHM7lf7gcdauFaC4 Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CQlkvqemll8CyTNLaBa5YY25hrha+pcVxYWr7FuzBrS4yROwbYWSrtay5l2JX2yUKRK/qGs0CD
 K4xv2sdWHJasN2a5elDBf8o9HPAbZNE0ut46r8oA+hi9bPv7jiCCWbXzrNvlzPxDzPjVCPKsvm
 nSCVxTQJXfvVqsIBNewM0vY44EMhg7TQ08BR1nHV97ttspR+E+VAED45ysRGd7w26ntj1R27Rg
 FP3n+z+A23lTt+Db1QkKQrpYxR+6F+jbuKOTknWRyIDT+RAU2dNE3Atnk0/ZoAnXn87yd8URA8
 rvI=
X-SBRS: 2.7
X-MesageID: 7322263
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7322263"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 14:58:12 +0100
Message-ID: <20191023135812.21348-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191023135812.21348-1-andrew.cooper3@citrix.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 7/7] x86/nospec: Optimise
 array_index_mask_nospec() for power-of-2 arrays
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiB0aGUgY29tcGlsZXIgY2FuIGRldGVybWluZSB0aGF0IGFuIGFycmF5IGJvdW5kIGlzIGEg
cG93ZXIgb2YgdHdvLCB0aGUKYXJyYXkgaW5kZXggY2FuIGJlIGJvdW5kZWQgZXZlbiB1bmRlciBz
cGVjdWxhdGlvbiB3aXRoIGEgc2luZ2xlIGFuZAppbnN0cnVjdGlvbi4KClJlc3BlY2lmeSBhcnJh
eV9pbmRleF9tYXNrX25vc3BlYygpIHRvIGFsbG93IGZvciBtYXNrcyBvdGhlciB0aGFuIH4wIGFu
ZCAwLAphbmQgaW50cm9kdWNlIGFuIElTX1BPV0VSX09GXzIoKSBoZWxwZXIuCgpTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEph
biBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkND
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KClRoaXMgb3B0aW1pc2F0aW9uIGlzIG5vdCBzYWZlIG9uIEFS
TSwgYmVjYXVzZSBzb21lIENQVXMgZG8gZGF0YSB2YWx1ZQpzcGVjdWxhdGlvbiwgd2hpY2ggaXMg
d2h5IHRoZSBDU0RCIGJhcnJlciB3YXMgaW50cm9kdWNlZC4KLS0tCiB4ZW4vaW5jbHVkZS9hc20t
eDg2L25vc3BlYy5oIHwgMjUgKysrKysrKysrKysrKysrKysrKy0tLS0tLQogeGVuL2luY2x1ZGUv
eGVuL2NvbmZpZy5oICAgICB8ICAxICsKIHhlbi9pbmNsdWRlL3hlbi9ub3NwZWMuaCAgICAgfCAg
MyArKy0KIDMgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L25vc3BlYy5oIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9ub3NwZWMuaAppbmRleCAwMDM5Y2QyNzEzLi40ZjM2MDY5ZWFjIDEwMDY0NAotLS0g
YS94ZW4vaW5jbHVkZS9hc20teDg2L25vc3BlYy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
bm9zcGVjLmgKQEAgLTcsMTMgKzcsMjAgQEAKICNpbmNsdWRlIDxhc20vYWx0ZXJuYXRpdmUuaD4K
IAogLyoqCi0gKiBhcnJheV9pbmRleF9tYXNrX25vc3BlYygpIC0gZ2VuZXJhdGUgYSBtYXNrIHRo
YXQgaXMgfjBVTCB3aGVuIHRoZQotICogICAgICBib3VuZHMgY2hlY2sgc3VjY2VlZHMgYW5kIDAg
b3RoZXJ3aXNlCisgKiBhcnJheV9pbmRleF9tYXNrX25vc3BlYygpIC0gZ2VuZXJhdGUgYSBtYXNr
IHRvIGJvdW5kIGFuIGFycmF5IGluZGV4CisgKiB3aGljaCBpcyBzYWZlIGV2ZW4gdW5kZXIgYWR2
ZXJzZSBzcGVjdWxhdGlvbi4KICAqIEBpbmRleDogYXJyYXkgZWxlbWVudCBpbmRleAogICogQHNp
emU6IG51bWJlciBvZiBlbGVtZW50cyBpbiBhcnJheQogICoKLSAqIFJldHVybnM6CisgKiBJbiBn
ZW5lcmFsLCByZXR1cm5zOgogICogICAgIDAgLSAoaW5kZXggPCBzaXplKQorICoKKyAqIFRoaXMg
eWVpbGQgfjBVTCBpbiB3aXRoaW4tYm91bmRzIGNhc2UsIGFuZCAwIGluIHRoZSBvdXQtb2YtYm91
bmRzCisgKiBjYXNlLgorICoKKyAqIFdoZW4gdGhlIGNvbXBpbGVyIGNhbiBkZXRlcm1pbmUgdGhh
dCB0aGUgYXJyYXkgaXMgYSBwb3dlciBvZiB0d28sIGEKKyAqIGxvd2VyIG92ZXJoZWFkIG9wdGlv
biBpcyB0byBtYXNrIHRoZSBpbmRleCB3aXRoIGEgc2luZ2xlIGFuZAorICogaW5zdHJ1Y3Rpb24u
CiAgKi8KICNkZWZpbmUgYXJyYXlfaW5kZXhfbWFza19ub3NwZWMgYXJyYXlfaW5kZXhfbWFza19u
b3NwZWMKIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBhcnJheV9pbmRleF9tYXNrX25vc3Bl
Yyh1bnNpZ25lZCBsb25nIGluZGV4LApAQCAtMjEsOSArMjgsMTUgQEAgc3RhdGljIGlubGluZSB1
bnNpZ25lZCBsb25nIGFycmF5X2luZGV4X21hc2tfbm9zcGVjKHVuc2lnbmVkIGxvbmcgaW5kZXgs
CiB7CiAgICAgdW5zaWduZWQgbG9uZyBtYXNrOwogCi0gICAgYXNtIHZvbGF0aWxlICggImNtcCAl
W3NpemVdLCAlW2luZGV4XTsgc2JiICVbbWFza10sICVbbWFza107IgotICAgICAgICAgICAgICAg
ICAgIDogW21hc2tdICI9ciIgKG1hc2spCi0gICAgICAgICAgICAgICAgICAgOiBbc2l6ZV0gImci
IChzaXplKSwgW2luZGV4XSAiciIgKGluZGV4KSApOworICAgIGlmICggX19idWlsdGluX2NvbnN0
YW50X3Aoc2l6ZSkgJiYgSVNfUE9XRVJfT0ZfMihzaXplKSApCisgICAgeworICAgICAgICBtYXNr
ID0gc2l6ZSAtIDE7CisgICAgICAgIE9QVElNSVpFUl9ISURFX1ZBUihtYXNrKTsKKyAgICB9Cisg
ICAgZWxzZQorICAgICAgICBhc20gdm9sYXRpbGUgKCAiY21wICVbc2l6ZV0sICVbaW5kZXhdOyBz
YmIgJVttYXNrXSwgJVttYXNrXTsiCisgICAgICAgICAgICAgICAgICAgICAgIDogW21hc2tdICI9
ciIgKG1hc2spCisgICAgICAgICAgICAgICAgICAgICAgIDogW3NpemVdICJnIiAoc2l6ZSksIFtp
bmRleF0gInIiIChpbmRleCkgKTsKIAogICAgIHJldHVybiBtYXNrOwogfQpkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUveGVuL2NvbmZpZy5oIGIveGVuL2luY2x1ZGUveGVuL2NvbmZpZy5oCmluZGV4
IGExMDYzODBhMjMuLjIxYzc2MzYxN2MgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9jb25m
aWcuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vY29uZmlnLmgKQEAgLTc1LDYgKzc1LDcgQEAKICNk
ZWZpbmUgR0IoX2diKSAgICAgKF9BQyhfZ2IsIFVMTCkgPDwgMzApCiAKICNkZWZpbmUgSVNfQUxJ
R05FRCh2YWwsIGFsaWduKSAoKCh2YWwpICYgKChhbGlnbikgLSAxKSkgPT0gMCkKKyNkZWZpbmUg
SVNfUE9XRVJfT0ZfMih2YWwpICgodmFsKSAmJiBJU19BTElHTkVEKHZhbCwgdmFsKSkKIAogI2Rl
ZmluZSBfX1NUUiguLi4pICNfX1ZBX0FSR1NfXwogI2RlZmluZSBTVFIoLi4uKSBfX1NUUihfX1ZB
X0FSR1NfXykKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9ub3NwZWMuaCBiL3hlbi9pbmNs
dWRlL3hlbi9ub3NwZWMuaAppbmRleCA3NTc4MjEwZjE2Li5jZmMzMWYxMWI3IDEwMDY0NAotLS0g
YS94ZW4vaW5jbHVkZS94ZW4vbm9zcGVjLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL25vc3BlYy5o
CkBAIC0xMiw3ICsxMiw4IEBACiAjaW5jbHVkZSA8YXNtL25vc3BlYy5oPgogCiAvKioKLSAqIGFy
cmF5X2luZGV4X21hc2tfbm9zcGVjKCkgLSBnZW5lcmF0ZSBhIH4wIG1hc2sgd2hlbiBpbmRleCA8
IHNpemUsIDAgb3RoZXJ3aXNlCisgKiBhcnJheV9pbmRleF9tYXNrX25vc3BlYygpIC0gZ2VuZXJh
dGUgYSBtYXNrIHRvIGJvdW5kIGFuIGFycmF5IGluZGV4CisgKiB3aGljaCBpcyBzYWZlIGV2ZW4g
dW5kZXIgYWR2ZXJzZSBzcGVjdWxhdGlvbi4KICAqIEBpbmRleDogYXJyYXkgZWxlbWVudCBpbmRl
eAogICogQHNpemU6IG51bWJlciBvZiBlbGVtZW50cyBpbiBhcnJheQogICoKLS0gCjIuMTEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
