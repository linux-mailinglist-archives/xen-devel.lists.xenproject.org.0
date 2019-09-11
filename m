Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC32B04C6
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 22:11:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i88rf-000301-PT; Wed, 11 Sep 2019 20:05:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L0xq=XG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i88re-0002zv-4q
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 20:05:18 +0000
X-Inumbo-ID: 76dcce3b-d4cf-11e9-83dd-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76dcce3b-d4cf-11e9-83dd-12813bfff9fa;
 Wed, 11 Sep 2019 20:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568232314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vf1AG29drMqw2LT/Z66r4aJJqf5+EsSaB0/oRaGhy1U=;
 b=Fb6x6l7GhTtLYwIetbfFRQlzkbgUyg6bqmtagtEDAUifZ/XM6EbUURgv
 UiLUDy5iGMPw1rvtvLxPukM15ApHR3IXdeIJyelWrGwdFF6mtvKF7k9WP
 Ka5Q7Q89WRiCS2PIfZUebHb41Yn1omUlRID0Su2LvPpJvynrG2fhYSrmD M=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +nKyXPXKqy3lx81FteDEfZSU9DIo1LYIMo+nWZao9CWra4UpLmTBCdgMMtCiWqVUE0P0VfMQ9P
 Fwr7JQz2ywdM8lDwSJIs/4YM6nh8Cex8eJ8wv+1wZT1xEAMoEQeBM6TKQ9hoRadptEJYGeZtHU
 exFt891zTg7MDwErmVyJNoiJHeVhCtTOyBM8qZLOsObF+GLaWrN93Y9146dqCQX9sZEwCVU5Ti
 pzZ/83z1EkFCk1jCJSa1PCGIHrLObPrv9XqCjKtwfGl+a9/baIvSOOFfI+UhMhohuqdy7j19OU
 1q4=
X-SBRS: 2.7
X-MesageID: 5451849
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,494,1559534400"; 
   d="scan'208";a="5451849"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 11 Sep 2019 21:05:01 +0100
Message-ID: <20190911200504.5693-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190911200504.5693-1-andrew.cooper3@citrix.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 5/8] tools/libxc: Rework xc_cpuid_set() to use
 {get, set}_cpu_policy()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHB1cnBvc2Ugb2YgdGhpcyBjaGFuZ2UgaXMgdG8gc3RvcCB1c2luZyB4Y19jcHVpZF9kb19k
b21jdGwoKSwgYW5kIHRvIHN0b3AKYmFzaW5nIGRlY2lzaW9ucyBvbiBhIGxvY2FsIENQVUlEIGlu
c3RydWN0aW9uLiAgVGhpcyBpcyBub3QgYW4gYXBwcm9wcmlhdGUgd2F5CnRvIGNvbnN0cnVjdCBw
b2xpY3kgaW5mb3JtYXRpb24gZm9yIG90aGVyIGRvbWFpbnMuCgpPYnRhaW4gdGhlIGhvc3QgYW5k
IGRvbWFpbi1tYXggcG9saWNpZXMgZnJvbSBYZW4sIGFuZCBtaXggdGhlIHJlc3VsdHMgYXMKYmVm
b3JlLiAgUHJvdmlkZSByYXRoZXIgbW9yZSBlcnJvciBsb2dnaW5nIHRoYW4gYmVmb3JlLgoKU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0t
CkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNDOiBJYW4g
SmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4Yy94Y19jcHVp
ZF94ODYuYyB8IDk1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA4NCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYyBiL3Rvb2xzL2xpYnhjL3hjX2Nw
dWlkX3g4Ni5jCmluZGV4IGEyZDI5YTBmYWUuLmQxYTJiNjEyMTQgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L2xpYnhjL3hjX2NwdWlkX3g4Ni5jCisrKyBiL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCkBA
IC05MDUsMjAgKzkwNSw4MCBAQCBpbnQgeGNfY3B1aWRfc2V0KAogICAgIGNvbnN0IGNoYXIgKipj
b25maWcsIGNoYXIgKipjb25maWdfdHJhbnNmb3JtZWQpCiB7CiAgICAgaW50IHJjOwotICAgIHVu
c2lnbmVkIGludCBpLCBqLCByZWdzWzRdLCBwb2xyZWdzWzRdOwotICAgIHN0cnVjdCBjcHVpZF9k
b21haW5faW5mbyBpbmZvID0ge307CisgICAgdW5zaWduZWQgaW50IGksIGosIHJlZ3NbNF0gPSB7
fSwgcG9scmVnc1s0XSA9IHt9OworICAgIHhjX2RvbWluZm9fdCBkaTsKKyAgICB4ZW5fY3B1aWRf
bGVhZl90ICpsZWF2ZXMgPSBOVUxMOworICAgIHVuc2lnbmVkIGludCBucl9sZWF2ZXMsIHBvbGlj
eV9sZWF2ZXMsIG5yX21zcnM7CisgICAgdWludDMyX3QgZXJyX2xlYWYgPSAtMSwgZXJyX3N1Ymxl
YWYgPSAtMSwgZXJyX21zciA9IC0xOwogCiAgICAgZm9yICggaSA9IDA7IGkgPCA0OyArK2kgKQog
ICAgICAgICBjb25maWdfdHJhbnNmb3JtZWRbaV0gPSBOVUxMOwogCi0gICAgcmMgPSBnZXRfY3B1
aWRfZG9tYWluX2luZm8oeGNoLCBkb21pZCwgJmluZm8sIE5VTEwsIDApOworICAgIGlmICggeGNf
ZG9tYWluX2dldGluZm8oeGNoLCBkb21pZCwgMSwgJmRpKSAhPSAxIHx8CisgICAgICAgICBkaS5k
b21pZCAhPSBkb21pZCApCisgICAgeworICAgICAgICBFUlJPUigiRmFpbGVkIHRvIG9idGFpbiBk
JWQgaW5mbyIsIGRvbWlkKTsKKyAgICAgICAgcmMgPSAtRVNSQ0g7CisgICAgICAgIGdvdG8gZmFp
bDsKKyAgICB9CisKKyAgICByYyA9IHhjX2dldF9jcHVfcG9saWN5X3NpemUoeGNoLCAmbnJfbGVh
dmVzLCAmbnJfbXNycyk7CiAgICAgaWYgKCByYyApCi0gICAgICAgIGdvdG8gb3V0OworICAgIHsK
KyAgICAgICAgUEVSUk9SKCJGYWlsZWQgdG8gb2J0YWluIHBvbGljeSBpbmZvIHNpemUiKTsKKyAg
ICAgICAgcmMgPSAtZXJybm87CisgICAgICAgIGdvdG8gZmFpbDsKKyAgICB9CiAKLSAgICBjcHVp
ZChpbnB1dCwgcmVncyk7CisgICAgcmMgPSAtRU5PTUVNOworICAgIGlmICggKGxlYXZlcyA9IGNh
bGxvYyhucl9sZWF2ZXMsIHNpemVvZigqbGVhdmVzKSkpID09IE5VTEwgKQorICAgIHsKKyAgICAg
ICAgRVJST1IoIlVuYWJsZSB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yICV1IENQVUlEIGxlYXZlcyIs
IG5yX2xlYXZlcyk7CisgICAgICAgIGdvdG8gZmFpbDsKKyAgICB9CiAKLSAgICBtZW1jcHkocG9s
cmVncywgcmVncywgc2l6ZW9mKHJlZ3MpKTsKLSAgICB4Y19jcHVpZF9wb2xpY3koJmluZm8sIGlu
cHV0LCBwb2xyZWdzKTsKKyAgICAvKiBHZXQgdGhlIGRvbWFpbidzIG1heCBwb2xpY3kuICovCisg
ICAgbnJfbXNycyA9IDA7CisgICAgcG9saWN5X2xlYXZlcyA9IG5yX2xlYXZlczsKKyAgICByYyA9
IHhjX2dldF9zeXN0ZW1fY3B1X3BvbGljeSh4Y2gsIGRpLmh2bSA/IFhFTl9TWVNDVExfY3B1X3Bv
bGljeV9odm1fbWF4CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgOiBYRU5fU1lTQ1RMX2NwdV9wb2xpY3lfcHZfbWF4LAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICZwb2xpY3lfbGVhdmVzLCBsZWF2ZXMsICZucl9tc3JzLCBOVUxMKTsKKyAg
ICBpZiAoIHJjICkKKyAgICB7CisgICAgICAgIFBFUlJPUigiRmFpbGVkIHRvIG9idGFpbiAlcyBt
YXggcG9saWN5IiwgZGkuaHZtID8gImh2bSIgOiAicHYiKTsKKyAgICAgICAgcmMgPSAtZXJybm87
CisgICAgICAgIGdvdG8gZmFpbDsKKyAgICB9CisgICAgZm9yICggaSA9IDA7IGkgPCBwb2xpY3lf
bGVhdmVzOyArK2kgKQorICAgICAgICBpZiAoIGxlYXZlc1tpXS5sZWFmID09IGlucHV0WzBdICYm
IGxlYXZlc1tpXS5zdWJsZWFmID09IGlucHV0WzFdICkKKyAgICAgICAgeworICAgICAgICAgICAg
cG9scmVnc1swXSA9IGxlYXZlc1tpXS5hOworICAgICAgICAgICAgcG9scmVnc1sxXSA9IGxlYXZl
c1tpXS5iOworICAgICAgICAgICAgcG9scmVnc1syXSA9IGxlYXZlc1tpXS5jOworICAgICAgICAg
ICAgcG9scmVnc1szXSA9IGxlYXZlc1tpXS5kOworICAgICAgICAgICAgYnJlYWs7CisgICAgICAg
IH0KKworICAgIC8qIEdldCB0aGUgaG9zdCBwb2xpY3kuICovCisgICAgbnJfbXNycyA9IDA7Cisg
ICAgcG9saWN5X2xlYXZlcyA9IG5yX2xlYXZlczsKKyAgICByYyA9IHhjX2dldF9zeXN0ZW1fY3B1
X3BvbGljeSh4Y2gsIFhFTl9TWVNDVExfY3B1X3BvbGljeV9ob3N0LAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICZwb2xpY3lfbGVhdmVzLCBsZWF2ZXMsICZucl9tc3JzLCBOVUxM
KTsKKyAgICBpZiAoIHJjICkKKyAgICB7CisgICAgICAgIFBFUlJPUigiRmFpbGVkIHRvIG9idGFp
biBob3N0IHBvbGljeSIpOworICAgICAgICByYyA9IC1lcnJubzsKKyAgICAgICAgZ290byBmYWls
OworICAgIH0KKyAgICBmb3IgKCBpID0gMDsgaSA8IHBvbGljeV9sZWF2ZXM7ICsraSApCisgICAg
ICAgIGlmICggbGVhdmVzW2ldLmxlYWYgPT0gaW5wdXRbMF0gJiYgbGVhdmVzW2ldLnN1YmxlYWYg
PT0gaW5wdXRbMV0gKQorICAgICAgICB7CisgICAgICAgICAgICByZWdzWzBdID0gbGVhdmVzW2ld
LmE7CisgICAgICAgICAgICByZWdzWzFdID0gbGVhdmVzW2ldLmI7CisgICAgICAgICAgICByZWdz
WzJdID0gbGVhdmVzW2ldLmM7CisgICAgICAgICAgICByZWdzWzNdID0gbGVhdmVzW2ldLmQ7Cisg
ICAgICAgICAgICBicmVhazsKKyAgICAgICAgfQogCiAgICAgZm9yICggaSA9IDA7IGkgPCA0OyBp
KysgKQogICAgIHsKQEAgLTk2OSw5ICsxMDI5LDIxIEBAIGludCB4Y19jcHVpZF9zZXQoCiAgICAg
ICAgIH0KICAgICB9CiAKLSAgICByYyA9IHhjX2NwdWlkX2RvX2RvbWN0bCh4Y2gsIGRvbWlkLCBp
bnB1dCwgcmVncyk7Ci0gICAgaWYgKCByYyA9PSAwICkKLSAgICAgICAgZ290byBvdXQ7CisgICAg
LyogRmVlZCB0aGUgdHJhbnNmb3JtZWQgbGVhZiBiYWNrIHVwIHRvIFhlbi4gKi8KKyAgICBsZWF2
ZXNbMF0gPSAoeGVuX2NwdWlkX2xlYWZfdCl7IGlucHV0WzBdLCBpbnB1dFsxXSwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ3NbMF0sIHJlZ3NbMV0sIHJlZ3NbMl0sIHJl
Z3NbM10gfTsKKyAgICByYyA9IHhjX3NldF9kb21haW5fY3B1X3BvbGljeSh4Y2gsIGRvbWlkLCAx
LCBsZWF2ZXMsIDAsIE5VTEwsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmVy
cl9sZWFmLCAmZXJyX3N1YmxlYWYsICZlcnJfbXNyKTsKKyAgICBpZiAoIHJjICkKKyAgICB7Cisg
ICAgICAgIFBFUlJPUigiRmFpbGVkIHRvIHNldCBkJWQncyBwb2xpY3kgKGVyciBsZWFmICUjeCwg
c3VibGVhZiAlI3gsIG1zciAlI3gpIiwKKyAgICAgICAgICAgICAgIGRvbWlkLCBlcnJfbGVhZiwg
ZXJyX3N1YmxlYWYsIGVycl9tc3IpOworICAgICAgICByYyA9IC1lcnJubzsKKyAgICAgICAgZ290
byBmYWlsOworICAgIH0KKworICAgIC8qIFN1Y2Nlc3MhICovCisgICAgZ290byBvdXQ7CiAKICBm
YWlsOgogICAgIGZvciAoIGkgPSAwOyBpIDwgNDsgaSsrICkKQEAgLTk4MSw2ICsxMDUzLDcgQEAg
aW50IHhjX2NwdWlkX3NldCgKICAgICB9CiAKICBvdXQ6Ci0gICAgZnJlZV9jcHVpZF9kb21haW5f
aW5mbygmaW5mbyk7CisgICAgZnJlZShsZWF2ZXMpOworCiAgICAgcmV0dXJuIHJjOwogfQotLSAK
Mi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
