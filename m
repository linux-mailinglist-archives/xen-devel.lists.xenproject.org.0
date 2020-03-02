Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12627175F0D
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 17:00:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8nPu-0004EA-Qf; Mon, 02 Mar 2020 15:55:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1vPy=4T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j8nPt-0004E5-A0
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 15:55:37 +0000
X-Inumbo-ID: 41691edc-5c9e-11ea-932e-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41691edc-5c9e-11ea-932e-bc764e2007e4;
 Mon, 02 Mar 2020 15:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583164536;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RgqdBUX+c9cqV970cHWW+GqlPnZxNAo1T22Uo5zE7go=;
 b=SI3YmTN6Eqc5i4vmE1aqYGfkIaw4K190wGBQQKl2Ph7+4HwO9oNePvaX
 d5RIKGkwJOZgmCEg6yAyMJnnZ/pqYu8lWrZM/hgQp/q+qoDxCV8dmpbPW
 lM963jNEJ1u0kHgpLpoqNnJnJrevXP+YuTFWHBQS1a9leG5auV08WrCxf U=;
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
IronPort-SDR: az7A6hgZRkR99j9p/uu5cmmtVOrECAr7YKWsFJoERmip0bU/A2mqZRf6ifTSTmSJ+RTk1hyOSx
 Yt5Pe+0EjZgrRLaOsPDPMrGraZTrhvmeL9FSFukpOSpRKfDSpaTSNQMr+721T2FnNyP9cMVH0I
 B+wGczorq1DYOPH+80HxtS8aMhcpLayRR49cn4XarfLdnGoZNL9NL7LsMKi6XdqNNf8X30GTTg
 KpN2j992zxyRcNSPL+EEa0vaXvKH8Z8xqfVlH78tyTXlfz1b92qLa0oe8t9JVXOiNZ1yGeS7Zs
 Hog=
X-SBRS: 2.7
X-MesageID: 13904351
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,507,1574139600"; d="scan'208";a="13904351"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 2 Mar 2020 16:55:09 +0100
Message-ID: <20200302155509.44753-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/dom0: improve PVH initrd and metadata
 placement
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

RG9uJ3QgYXNzdW1lIHRoZXJlJ3MgZ29pbmcgdG8gYmUgZW5vdWdoIHNwYWNlIGF0IHRoZSB0YWls
IG9mIHRoZQpsb2FkZWQga2VybmVsIGFuZCBpbnN0ZWFkIHRyeSB0byBmaW5kIGEgc3VpdGFibGUg
bWVtb3J5IGFyZWEgd2hlcmUgdGhlCmluaXRyZCBhbmQgbWV0YWRhdGEgY2FuIGJlIGxvYWRlZC4K
ClJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpT
aWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0t
CiB4ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYyB8IDUxICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jIGIveGVu
L2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKaW5kZXggZWRlZDg3ZWFmNS4uYTAzYmYyZTY2MyAx
MDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKKysrIGIveGVuL2FyY2gv
eDg2L2h2bS9kb20wX2J1aWxkLmMKQEAgLTQ5MCw2ICs0OTAsNDQgQEAgc3RhdGljIGludCBfX2lu
aXQgcHZoX3BvcHVsYXRlX3AybShzdHJ1Y3QgZG9tYWluICpkKQogI3VuZGVmIE1CMV9QQUdFUwog
fQogCitzdGF0aWMgcGFkZHJfdCBmaW5kX21lbW9yeShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCBj
b25zdCBzdHJ1Y3QgZWxmX2JpbmFyeSAqZWxmLAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
c2l6ZV90IHNpemUpCit7CisgICAgcGFkZHJfdCBrZXJuZWxfc3RhcnQgPSAocGFkZHJfdCllbGYt
PmRlc3RfYmFzZTsKKyAgICBwYWRkcl90IGtlcm5lbF9lbmQgPSAocGFkZHJfdCkoZWxmLT5kZXN0
X2Jhc2UgKyBlbGYtPmRlc3Rfc2l6ZSk7CisgICAgdW5zaWduZWQgaW50IGk7CisKKyAgICBmb3Ig
KCBpID0gMDsgaSA8IGQtPmFyY2gubnJfZTgyMDsgaSsrICkKKyAgICB7CisgICAgICAgIHBhZGRy
X3Qgc3RhcnQsIGVuZDsKKworICAgICAgICBpZiAoIGQtPmFyY2guZTgyMFtpXS5hZGRyIDwgTUIo
MSkgJiYKKyAgICAgICAgICAgICBkLT5hcmNoLmU4MjBbaV0uYWRkciArIGQtPmFyY2guZTgyMFtp
XS5zaXplIDwgTUIoMSkgKQorICAgICAgICAgICAgY29udGludWU7CisKKyAgICAgICAgc3RhcnQg
PSBNQVgoUk9VTkRVUChkLT5hcmNoLmU4MjBbaV0uYWRkciwgUEFHRV9TSVpFKSwgTUIoMSkpOwor
ICAgICAgICBlbmQgPSBkLT5hcmNoLmU4MjBbaV0uYWRkciArIGQtPmFyY2guZTgyMFtpXS5zaXpl
OworCisgICAgICAgIC8qIERlYWwgd2l0aCB0aGUga2VybmVsIGJlaW5nIGxvYWRlZCBpbiB0aGUg
cmVnaW9uLiAqLworICAgICAgICBpZiAoIGtlcm5lbF9zdGFydCA8PSBzdGFydCAmJiBrZXJuZWxf
ZW5kID49IHN0YXJ0ICkKKyAgICAgICAgICAgIC8qIFRydW5jYXRlIHRoZSBzdGFydCBvZiB0aGUg
cmVnaW9uICovCisgICAgICAgICAgICBzdGFydCA9IFJPVU5EVVAoa2VybmVsX2VuZCwgUEFHRV9T
SVpFKTsKKyAgICAgICAgZWxzZSBpZiAoIGtlcm5lbF9zdGFydCA8PSBlbmQgJiYga2VybmVsX2Vu
ZCA+PSBlbmQgKQorICAgICAgICAgICAgLyogVHJ1bmNhdGUgdGhlIGVuZCBvZiB0aGUgcmVnaW9u
ICovCisgICAgICAgICAgICBlbmQgPSBrZXJuZWxfc3RhcnQ7CisgICAgICAgIC8qIFBpY2sgdGhl
IGJpZ2dlc3Qgb2YgdGhlIHNwbGl0IHJlZ2lvbnMgKi8KKyAgICAgICAgZWxzZSBpZiAoIGtlcm5l
bF9zdGFydCAtIHN0YXJ0ID4gZW5kIC0ga2VybmVsX2VuZCApCisgICAgICAgICAgICBlbmQgPSBr
ZXJuZWxfc3RhcnQ7CisgICAgICAgIGVsc2UKKyAgICAgICAgICAgIHN0YXJ0ID0gUk9VTkRVUChr
ZXJuZWxfZW5kLCBQQUdFX1NJWkUpOworCisgICAgICAgIGlmICggZW5kIC0gc3RhcnQgPj0gc2l6
ZSApCisgICAgICAgICAgICByZXR1cm4gc3RhcnQ7CisgICAgfQorCisgICAgcmV0dXJuIElOVkFM
SURfUEFERFI7Cit9CisKIHN0YXRpYyBpbnQgX19pbml0IHB2aF9sb2FkX2tlcm5lbChzdHJ1Y3Qg
ZG9tYWluICpkLCBjb25zdCBtb2R1bGVfdCAqaW1hZ2UsCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBpbWFnZV9oZWFkcm9vbSwKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBtb2R1bGVfdCAqaW5pdHJkLCB2b2lkICppbWFnZV9iYXNlLApA
QCAtNTQ2LDcgKzU4NCwxOCBAQCBzdGF0aWMgaW50IF9faW5pdCBwdmhfbG9hZF9rZXJuZWwoc3Ry
dWN0IGRvbWFpbiAqZCwgY29uc3QgbW9kdWxlX3QgKmltYWdlLAogICAgICAgICByZXR1cm4gcmM7
CiAgICAgfQogCi0gICAgbGFzdF9hZGRyID0gUk9VTkRVUChwYXJtcy52aXJ0X2tlbmQgLSBwYXJt
cy52aXJ0X2Jhc2UsIFBBR0VfU0laRSk7CisgICAgbGFzdF9hZGRyID0gZmluZF9tZW1vcnkoZCwg
JmVsZiwgc2l6ZW9mKHN0YXJ0X2luZm8pICsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
bml0cmQgPyBST1VORFVQKGluaXRyZC0+bW9kX2VuZCwgUEFHRV9TSVpFKSArCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKG1vZCkKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgOiAwICsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbWRs
aW5lID8gUk9VTkRVUChzdHJsZW4oY21kbGluZSkgKyAxLAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGVsZl82NGJpdCgmZWxmKSA/IDggOiA0KQorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiAwKTsKKyAgICBpZiAoIGxhc3RfYWRkciA9
PSBJTlZBTElEX1BBRERSICkKKyAgICB7CisgICAgICAgIHByaW50aygiVW5hYmxlIHRvIGZpbmQg
YSBtZW1vcnkgcmVnaW9uIHRvIGxvYWQgaW5pdHJkIGFuZCBtZXRhZGF0YVxuIik7CisgICAgICAg
IHJldHVybiAtRU5PTUVNOworICAgIH0KIAogICAgIGlmICggaW5pdHJkICE9IE5VTEwgKQogICAg
IHsKLS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
