Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FBFC25C0
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 19:25:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEzOY-0003Xo-Eh; Mon, 30 Sep 2019 17:23:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QDh0=XZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iEzOW-0003Xd-Q8
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 17:23:32 +0000
X-Inumbo-ID: 0636ae44-e3a7-11e9-bf31-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id 0636ae44-e3a7-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 17:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569864211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xt9hht4e5fVZxPcxIxA92BvC2YoAjbfNAkRIVNiHM44=;
 b=WrenzRk4/OKExc4wviSiP2cXeqbgB/RKimn3tYWCpiKrcwWt14HTpN6L
 jlm/Gqozx2Libf53vQjCOkwbfZji2fWf7ADvYTfN9l62Y/hWhg7xoSHLT
 AzayLNFFPVTyEotIreF0YCaCFBE4diZrk3VjJ+LcWy2HTfWPZmzFIERd0 k=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8YMcYFT3B1oeQyYVgehzoN8Ft3FGR7RT57bo3Hmx6OahDvzhVHiXEiIe85KhbiMgI18xclfVRp
 CcoEa5wcaDcqni7H2m2UUcJ26E01jTZAP9EOfns5b5cYcvEvYUVVap2VGp3Nf4zi53MdssP7WM
 tt6HOH3Co5jxzkgcAxFTBs8spmyDLai1wKDe6Rjdu4/Qqk3yJfHRxQKJLyg+oQJVNGfO3us6aI
 2HeI1eWUZmk72/aa0whXN2y2grxGd1XsmEFEJ14AaN+jhpFhl2/SjwE+F3MnbygE6/VAliE+Ga
 8/s=
X-SBRS: 2.7
X-MesageID: 6617646
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,568,1559534400"; 
   d="scan'208";a="6617646"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 18:23:27 +0100
Message-ID: <20190930172327.784520-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930172327.784520-1-anthony.perard@citrix.com>
References: <20190930172327.784520-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] libxl_pci: Fix guest shutdown with PCI PT
 attached
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Sander Eikelenboom <linux@eikelenboom.it>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QmVmb3JlIHRoZSBwcm9ibGVtYXRpYyBjb21taXQsIGxpYnhsIHVzZWQgdG8gaWdub3JlIGVycm9y
IHdoZW4KZGVzdHJveWluZyAoZm9yY2UgPT0gdHJ1ZSkgYSBwYXNzdGhyb3VnaCBkZXZpY2UuIElm
IHRoZSBETSBmYWlsZWQgdG8KZGV0YWNoIHRoZSBwY2kgZGV2aWNlIHdpdGhpbiB0aGUgYWxsb3dl
ZCB0aW1lLCB0aGUgdGltZWQgb3V0IGVycm9yCnJhaXNlZCBza2lwIHBhcnQgb2YgcGNpX3JlbW92
ZV8qLCBidXQgYWxzbyByYWlzZSB0aGUgZXJyb3IgdXAgdG8gdGhlCmNhbGxlciBvZiBsaWJ4bF9f
ZGV2aWNlX3BjaV9kZXN0cm95X2FsbCwgbGlieGxfX2Rlc3Ryb3lfZG9taWQsIGFuZAp0aHVzIHRo
ZSBkZXN0cnVjdGlvbiBvZiB0aGUgZG9tYWluIGZhaWxzLgoKV2hlbiBhICpwY2lfZGVzdHJveSog
ZnVuY3Rpb24gaXMgY2FsbGVkIChzbyB3ZSBoYXZlIGZvcmNlPXRydWUpLCBlcnJvcgpzaG91bGQg
bW9zdGx5IGJlIGlnbm9yZWQuIElmIHRoZSBETSBkaWRuJ3QgY29uZmlybWVkIHRoYXQgdGhlIGRl
dmljZQppcyByZW1vdmVkLCB3ZSB3aWxsIHByaW50IGEgd2FybmluZyBhbmQga2VlcCBnb2luZyBp
ZiBmb3JjZT10cnVlLgpUaGUgcGF0Y2ggcmVvcmRlciB0aGUgZnVuY3Rpb25zIHNvIHRoYXQgcGNp
X3JlbW92ZV90aW1lb3V0KCkgY2FsbHMKcGNpX3JlbW92ZV9kZXRhdGNoZWQoKSBsaWtlIGl0J3Mg
ZG9uZSB3aGVuIERNIGNhbGxzIGFyZSBzdWNjZXNzZnVsLgoKV2UgYWxzbyBjbGVhbiB0aGUgUU1Q
IHN0YXRlcyBhbmQgYXNzb2NpYXRlZCB0aW1lb3V0cyBlYXJsaWVyLCBhcyBzb29uCmFzIHRoZXkg
YXJlIG5vdCBuZWVkZWQgYW55bW9yZS4KClJlcG9ydGVkLWJ5OiBTYW5kZXIgRWlrZWxlbmJvb20g
PGxpbnV4QGVpa2VsZW5ib29tLml0PgpGaXhlczogZmFlNDg4MGM0NWZlMDE1ZTU2N2FmYTIyM2Y3
OGJmMTdhNmQ5OGUxYgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9wY2kuYyB8IDQxICsrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjYgaW5z
ZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGli
eGxfcGNpLmMgYi90b29scy9saWJ4bC9saWJ4bF9wY2kuYwppbmRleCAzYjMxY2ZkNDE3YmUuLmNi
ODQ5YjI0MTU4MSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfcGNpLmMKKysrIGIvdG9v
bHMvbGlieGwvbGlieGxfcGNpLmMKQEAgLTE3NzgsMTIgKzE3NzgsMTIgQEAgc3RhdGljIHZvaWQg
cGNpX3JlbW92ZV9xbXBfcmV0cnlfdGltZXJfY2IobGlieGxfX2VnYyAqZWdjLAogICAgIGxpYnhs
X19ldl90aW1lICpldiwgY29uc3Qgc3RydWN0IHRpbWV2YWwgKnJlcXVlc3RlZF9hYnMsIGludCBy
Yyk7CiBzdGF0aWMgdm9pZCBwY2lfcmVtb3ZlX3FtcF9xdWVyeV9jYihsaWJ4bF9fZWdjICplZ2Ms
CiAgICAgbGlieGxfX2V2X3FtcCAqcW1wLCBjb25zdCBsaWJ4bF9fanNvbl9vYmplY3QgKnJlc3Bv
bnNlLCBpbnQgcmMpOworc3RhdGljIHZvaWQgcGNpX3JlbW92ZV90aW1lb3V0KGxpYnhsX19lZ2Mg
KmVnYywKKyAgICBsaWJ4bF9fZXZfdGltZSAqZXYsIGNvbnN0IHN0cnVjdCB0aW1ldmFsICpyZXF1
ZXN0ZWRfYWJzLCBpbnQgcmMpOwogc3RhdGljIHZvaWQgcGNpX3JlbW92ZV9kZXRhdGNoZWQobGli
eGxfX2VnYyAqZWdjLAogICAgIHBjaV9yZW1vdmVfc3RhdGUgKnBycywgaW50IHJjKTsKIHN0YXRp
YyB2b2lkIHBjaV9yZW1vdmVfc3R1YmRvbV9kb25lKGxpYnhsX19lZ2MgKmVnYywKICAgICBsaWJ4
bF9fYW9fZGV2aWNlICphb2Rldik7Ci1zdGF0aWMgdm9pZCBwY2lfcmVtb3ZlX3RpbWVvdXQobGli
eGxfX2VnYyAqZWdjLAotICAgIGxpYnhsX19ldl90aW1lICpldiwgY29uc3Qgc3RydWN0IHRpbWV2
YWwgKnJlcXVlc3RlZF9hYnMsIGludCByYyk7CiBzdGF0aWMgdm9pZCBwY2lfcmVtb3ZlX2RvbmUo
bGlieGxfX2VnYyAqZWdjLAogICAgIHBjaV9yZW1vdmVfc3RhdGUgKnBycywgaW50IHJjKTsKIApA
QCAtMjA0NCw2ICsyMDQ0LDI1IEBAIHN0YXRpYyB2b2lkIHBjaV9yZW1vdmVfcW1wX3F1ZXJ5X2Ni
KGxpYnhsX19lZ2MgKmVnYywKICAgICBwY2lfcmVtb3ZlX2RldGF0Y2hlZChlZ2MsIHBycywgcmMp
OyAvKiBtdXN0IGJlIGxhc3QgKi8KIH0KIAorc3RhdGljIHZvaWQgcGNpX3JlbW92ZV90aW1lb3V0
KGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2V2X3RpbWUgKmV2LAorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB0aW1ldmFsICpyZXF1ZXN0ZWRfYWJzLAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGludCByYykKK3sKKyAgICBFR0NfR0M7CisgICAgcGNp
X3JlbW92ZV9zdGF0ZSAqcHJzID0gQ09OVEFJTkVSX09GKGV2LCAqcHJzLCB0aW1lb3V0KTsKKwor
ICAgIC8qIENvbnZlbmllbmNlIGFsaWFzZXMgKi8KKyAgICBsaWJ4bF9kZXZpY2VfcGNpICpjb25z
dCBwY2lkZXYgPSBwcnMtPnBjaWRldjsKKworICAgIExPR0QoV0FSTiwgcHJzLT5kb21pZCwgInRp
bWVkIG91dCB3YWl0aW5nIGZvciBETSB0byByZW1vdmUgIgorICAgICAgICAgUENJX1BUX1FERVZf
SUQsIHBjaWRldi0+YnVzLCBwY2lkZXYtPmRldiwgcGNpZGV2LT5mdW5jKTsKKworICAgIC8qIElm
IHdlIHRpbWVkIG91dCwgd2UgbWlnaHQgc3RpbGwgd2FudCB0byBrZWVwIGRlc3Ryb3lpbmcgdGhl
IGRldmljZQorICAgICAqICh3aGVuIGZvcmNlPT10cnVlKSwgc28gbGV0IHRoZSBuZXh0IGZ1bmN0
aW9uIGRlY2lkZSB3aGF0IHRvIGRvIG9uCisgICAgICogZXJyb3IgKi8KKyAgICBwY2lfcmVtb3Zl
X2RldGF0Y2hlZChlZ2MsIHBycywgcmMpOworfQorCiBzdGF0aWMgdm9pZCBwY2lfcmVtb3ZlX2Rl
dGF0Y2hlZChsaWJ4bF9fZWdjICplZ2MsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwY2lfcmVtb3ZlX3N0YXRlICpwcnMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBpbnQgcmMpCkBAIC0yMDU3LDYgKzIwNzYsMTEgQEAgc3RhdGljIHZvaWQgcGNpX3JlbW92ZV9k
ZXRhdGNoZWQobGlieGxfX2VnYyAqZWdjLAogICAgIGxpYnhsX2RldmljZV9wY2kgKmNvbnN0IHBj
aWRldiA9IHBycy0+cGNpZGV2OwogICAgIGxpYnhsX2RvbWlkIGRvbWlkID0gcHJzLT5kb21pZDsK
IAorICAgIC8qIENsZWFuaW5nIFFNUCBzdGF0ZXMgQVNBUCAqLworICAgIGxpYnhsX19ldl9xbXBf
ZGlzcG9zZShnYywgJnBycy0+cW1wKTsKKyAgICBsaWJ4bF9fZXZfdGltZV9kZXJlZ2lzdGVyKGdj
LCAmcHJzLT50aW1lb3V0KTsKKyAgICBsaWJ4bF9fZXZfdGltZV9kZXJlZ2lzdGVyKGdjLCAmcHJz
LT5yZXRyeV90aW1lcik7CisKICAgICBpZiAocmMgJiYgIXBycy0+Zm9yY2UpCiAgICAgICAgIGdv
dG8gb3V0OwogCkBAIC0yMTA0LDE1ICsyMTI4LDYgQEAgc3RhdGljIHZvaWQgcGNpX3JlbW92ZV9z
dHViZG9tX2RvbmUobGlieGxfX2VnYyAqZWdjLAogICAgIHBjaV9yZW1vdmVfZG9uZShlZ2MsIHBy
cywgMCk7CiB9CiAKLXN0YXRpYyB2b2lkIHBjaV9yZW1vdmVfdGltZW91dChsaWJ4bF9fZWdjICpl
Z2MsIGxpYnhsX19ldl90aW1lICpldiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCBzdHJ1Y3QgdGltZXZhbCAqcmVxdWVzdGVkX2FicywKLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbnQgcmMpCi17Ci0gICAgcGNpX3JlbW92ZV9zdGF0ZSAqcHJzID0gQ09OVEFJ
TkVSX09GKGV2LCAqcHJzLCB0aW1lb3V0KTsKLQotICAgIHBjaV9yZW1vdmVfZG9uZShlZ2MsIHBy
cywgcmMpOwotfQotCiBzdGF0aWMgdm9pZCBwY2lfcmVtb3ZlX2RvbmUobGlieGxfX2VnYyAqZWdj
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaV9yZW1vdmVfc3RhdGUgKnBycywKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmMpCkBAIC0yMTIxLDEwICsyMTM2LDYgQEAg
c3RhdGljIHZvaWQgcGNpX3JlbW92ZV9kb25lKGxpYnhsX19lZ2MgKmVnYywKIAogICAgIGlmIChy
YykgZ290byBvdXQ7CiAKLSAgICBsaWJ4bF9fZXZfcW1wX2Rpc3Bvc2UoZ2MsICZwcnMtPnFtcCk7
Ci0gICAgbGlieGxfX2V2X3RpbWVfZGVyZWdpc3RlcihnYywgJnBycy0+dGltZW91dCk7Ci0gICAg
bGlieGxfX2V2X3RpbWVfZGVyZWdpc3RlcihnYywgJnBycy0+cmV0cnlfdGltZXIpOwotCiAgICAg
bGlieGxfX2RldmljZV9wY2lfcmVtb3ZlX3hlbnN0b3JlKGdjLCBwcnMtPmRvbWlkLCBwcnMtPnBj
aWRldik7CiBvdXQ6CiAgICAgZGV2aWNlX3BjaV9yZW1vdmVfY29tbW9uX25leHQoZWdjLCBwcnMs
IHJjKTsKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
