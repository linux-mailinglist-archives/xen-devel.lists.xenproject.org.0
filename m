Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BABDE51FE
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 19:07:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO31T-0000D0-EA; Fri, 25 Oct 2019 17:05:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eA7w=YS=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iO31R-0000Ch-Tv
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 17:05:09 +0000
X-Inumbo-ID: 9907aa56-f749-11e9-8aca-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9907aa56-f749-11e9-8aca-bc764e2007e4;
 Fri, 25 Oct 2019 17:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572023108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eQNKxqrS2zcY6hc8GgmyvHkuncNCP0wD6X8ZyfLhupM=;
 b=K8P5vqr/ZbPW6SBuCy0A3lAeGb2FUcprbFtAs+4znO5jE221vCl4TlXr
 dJm8QNDpD0TqV7Ibu1xwH6jMpsjhekc6uFu3X9AKHjAnM1IWNCSsyXMn+
 PXfLB7/vw4NcAO3o9qVhnSpZjqelmlAWcsPuZIZUeP3dpjzJDa/Y22r3F o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JR+eR7ViY7qRP2OcH3NO3hK9tS1Tg6nXawQvB7pU2Bj3QHKO57fYArKTMK5F3ZowaaL5k/d0iQ
 cUPmJMEVaGix/fBiZaBiDeENbl1WjAITM07iD7XM+rjrsdaATl74V975tZFDwZ/ib4xK44P7x+
 hCI0LY7WAFZmWdh4PDOnDaJEzXjhXOnP2NIQEWmPkLRHWp1HfRjE+tnRFZOWUeqayA+BVOoR2Q
 iLGr8TiZGL2/GG9WzpTPzEmzxBj1zoIKvtvB7XgwxBpMtN3n7O94HgAi2JhGFWaFw6t0acyAnM
 dbM=
X-SBRS: 2.7
X-MesageID: 7801960
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,229,1569297600"; 
   d="scan'208";a="7801960"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 25 Oct 2019 18:05:03 +0100
Message-ID: <20191025170505.2834957-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191025170505.2834957-1-anthony.perard@citrix.com>
References: <20191025170505.2834957-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC XEN PATCH for-4.13 2/4] libxl: Introduce
 libxl__ev_qmplock
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBsb2NrIHdpbGwgYmUgdXNlZCB0byBwcmV2ZW50IGNvbmN1cnJlbnQgYWNjZXNzIHRoZSBR
RU1VJ3MgUU1QCnNvY2tldC4gSXQgaXMgYmFzZWQgb24gbGlieGxfX2V2X2RldmxvY2sgaW1wbGVt
ZW50YXRpb24gYW5kIGhhdmUgdGhlCnNhbWUgcHJvcGVydGllcy4KClRoZXJlIGlzIG9uZSBhZGRp
dGlvbiB0byB0aGUgZXZfZGV2bG9jayBBUEksCmxpYnhsX19ldl9xbXBsb2NrX2Rpc3Bvc2UsIHdo
aWNoIGFsbG93IHRvIGNhbmNlbCB0aGUgbG9jayBvcGVyYXRpb24Kd2hpbGUgaXQgaXMgaW4gQWN0
aXZlIHN0YXRlLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuYyB8IDMxICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgg
fCAxNCArKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuYyBi
L3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmMKaW5kZXggMDc1MGI2OWNiYTYxLi5hZmJiMDFj
NTcyMmYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmMKKysrIGIvdG9v
bHMvbGlieGwvbGlieGxfaW50ZXJuYWwuYwpAQCAtNTgzLDE3ICs1ODMsMjUgQEAgdm9pZCBsaWJ4
bF9fZXZfZGV2bG9ja19pbml0KGxpYnhsX19ldl9kZXZsb2NrICpsb2NrKQogICAgIGxvY2stPmhl
bGQgPSBmYWxzZTsKIH0KIAorc3RhdGljIHZvaWQgZXZfbG9ja19sb2NrKGxpYnhsX19lZ2MgKmVn
YywgbGlieGxfX2V2X2RldmxvY2sgKmxvY2ssCisgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3QgY2hhciAqdXNlcmRhdGFfdXNlcmlkKTsKIHN0YXRpYyB2b2lkIGV2X2xvY2tfcHJlcGFyZV9m
b3JrKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2V2X2RldmxvY2sgKmxvY2spOwogc3RhdGljIHZv
aWQgZXZfbG9ja19jaGlsZF9jYWxsYmFjayhsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19ldl9jaGls
ZCAqY2hpbGQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBpZF90IHBpZCwg
aW50IHN0YXR1cyk7CiAKIHZvaWQgbGlieGxfX2V2X2RldmxvY2tfbG9jayhsaWJ4bF9fZWdjICpl
Z2MsIGxpYnhsX19ldl9kZXZsb2NrICpsb2NrKQoreworICAgIGV2X2xvY2tfbG9jayhlZ2MsIGxv
Y2ssICJsaWJ4bC1kZXZpY2UtY2hhbmdlcy1sb2NrIik7Cit9CisKK3N0YXRpYyB2b2lkIGV2X2xv
Y2tfbG9jayhsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19ldl9kZXZsb2NrICpsb2NrLAorICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKnVzZXJkYXRhX3VzZXJpZCkKIHsKICAgICBT
VEFURV9BT19HQyhsb2NrLT5hbyk7CiAgICAgY29uc3QgY2hhciAqbG9ja2ZpbGU7CiAKICAgICBs
b2NrZmlsZSA9IGxpYnhsX191c2VyZGF0YV9wYXRoKGdjLCBsb2NrLT5kb21pZCwKLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJsaWJ4bC1kZXZpY2UtY2hhbmdlcy1sb2NrIiwg
ImwiKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVzZXJkYXRhX3VzZXJp
ZCwgImwiKTsKICAgICBpZiAoIWxvY2tmaWxlKSBnb3RvIG91dDsKICAgICBsb2NrLT5wYXRoID0g
bGlieGxfX3N0cmR1cChOT0dDLCBsb2NrZmlsZSk7CiAKQEAgLTc1Nyw2ICs3NjUsMjcgQEAgdm9p
ZCBsaWJ4bF9fZXZfZGV2bG9ja191bmxvY2sobGlieGxfX2djICpnYywgbGlieGxfX2V2X2Rldmxv
Y2sgKmxvY2spCiAgICAgbGlieGxfX2V2X2RldmxvY2tfaW5pdChsb2NrKTsKIH0KIAordm9pZCBs
aWJ4bF9fZXZfcW1wbG9ja19pbml0KGxpYnhsX19ldl9xbXBsb2NrICpsb2NrKQoreworICAgIGxp
YnhsX19ldl9kZXZsb2NrX2luaXQobG9jayk7Cit9CisKK3ZvaWQgbGlieGxfX2V2X3FtcGxvY2tf
bG9jayhsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19ldl9xbXBsb2NrICpsb2NrKQoreworICAgIGV2
X2xvY2tfbG9jayhlZ2MsIGxvY2ssICJxbXAtc29ja2V0LWxvY2siKTsKK30KKwordm9pZCBsaWJ4
bF9fZXZfcW1wbG9ja191bmxvY2sobGlieGxfX2djICpnYywgbGlieGxfX2V2X3FtcGxvY2sgKmxv
Y2spCit7CisgICAgbGlieGxfX2V2X2RldmxvY2tfdW5sb2NrKGdjLCBsb2NrKTsKK30KKwordm9p
ZCBsaWJ4bF9fZXZfcW1wbG9ja19kaXNwb3NlKGxpYnhsX19nYyAqZ2MsIGxpYnhsX19ldl9xbXBs
b2NrICpsb2NrKQoreworICAgIGxpYnhsX19ldl9jaGlsZF9raWxsKGxvY2stPmFvLCAmbG9jay0+
Y2hpbGQpOworICAgIGxpYnhsX19ldl9kZXZsb2NrX3VubG9jayhnYywgbG9jayk7Cit9CisKIC8q
CiAgKiBMb2NhbCB2YXJpYWJsZXM6CiAgKiBtb2RlOiBDCmRpZmYgLS1naXQgYS90b29scy9saWJ4
bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCA1
ODIzODkwNzAzYWQuLjExNWM3OWQwMzRkNCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxf
aW50ZXJuYWwuaAorKysgYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCkBAIC0xOTcsNiAr
MTk3LDcgQEAgdHlwZWRlZiBzdHJ1Y3QgbGlieGxfX2RldmljZV90eXBlIGxpYnhsX19kZXZpY2Vf
dHlwZTsKIHR5cGVkZWYgc3RydWN0IGxpYnhsX19qc29uX29iamVjdCBsaWJ4bF9fanNvbl9vYmpl
Y3Q7CiB0eXBlZGVmIHN0cnVjdCBsaWJ4bF9fY2FyZWZkIGxpYnhsX19jYXJlZmQ7CiB0eXBlZGVm
IHN0cnVjdCBsaWJ4bF9fZXZfZGV2bG9jayBsaWJ4bF9fZXZfZGV2bG9jazsKK3R5cGVkZWYgc3Ry
dWN0IGxpYnhsX19ldl9kZXZsb2NrIGxpYnhsX19ldl9xbXBsb2NrOwogdHlwZWRlZiBzdHJ1Y3Qg
bGlieGxfX2RtX3Jlc3VtZV9zdGF0ZSBsaWJ4bF9fZG1fcmVzdW1lX3N0YXRlOwogdHlwZWRlZiBz
dHJ1Y3QgbGlieGxfX2FvX2RldmljZSBsaWJ4bF9fYW9fZGV2aWNlOwogdHlwZWRlZiBzdHJ1Y3Qg
bGlieGxfX211bHRpZGV2IGxpYnhsX19tdWx0aWRldjsKQEAgLTQ3MjUsNiArNDcyNiwxOSBAQCBf
aGlkZGVuIHZvaWQgbGlieGxfX2V2X2RldmxvY2tfaW5pdChsaWJ4bF9fZXZfZGV2bG9jayAqKTsK
IF9oaWRkZW4gdm9pZCBsaWJ4bF9fZXZfZGV2bG9ja19sb2NrKGxpYnhsX19lZ2MgKiwgbGlieGxf
X2V2X2RldmxvY2sgKik7CiBfaGlkZGVuIHZvaWQgbGlieGxfX2V2X2RldmxvY2tfdW5sb2NrKGxp
YnhsX19nYyAqLCBsaWJ4bF9fZXZfZGV2bG9jayAqKTsKIAorLyogbGlieGxfX2V2X3FtcGxvY2sK
KyAqCisgKiBTZWUgIkxvY2sgZm9yIGRldmljZSBob3RwbHVnLCBxbXBfbG9jay4iIGFzIGl0IGlz
IHNpbWlsYXIgYnV0IGlzIHVzZWQKKyAqIHRvIHJlZ3VsYXRlIGFjY2VzcyB0aGUgUUVNVSdzIFFN
UCBzb2NrZXQuCisgKgorICogbGlieGxfX2V2X3FtcGxvY2tfZGlzcG9zZTogSWRsZS9BY3RpdmUv
TG9ja0FjcXVpcmVkIC0+IElkbGUKKyAqICAgVGhlIGNhbGxiYWNrIHdpbGwgbm90IGJlIGNhbGxl
ZCBhbnltb3JlLgorICovCitfaGlkZGVuIHZvaWQgbGlieGxfX2V2X3FtcGxvY2tfaW5pdChsaWJ4
bF9fZXZfcW1wbG9jayAqKTsKK19oaWRkZW4gdm9pZCBsaWJ4bF9fZXZfcW1wbG9ja19sb2NrKGxp
YnhsX19lZ2MgKiwgbGlieGxfX2V2X3FtcGxvY2sgKik7CitfaGlkZGVuIHZvaWQgbGlieGxfX2V2
X3FtcGxvY2tfdW5sb2NrKGxpYnhsX19nYyAqLCBsaWJ4bF9fZXZfcW1wbG9jayAqKTsKK19oaWRk
ZW4gdm9pZCBsaWJ4bF9fZXZfcW1wbG9ja19kaXNwb3NlKGxpYnhsX19nYyAqLCBsaWJ4bF9fZXZf
cW1wbG9jayAqKTsKKwogLyogU2VuZCBjb250cm9sIGNvbW1hbmRzIG92ZXIgeGVuc3RvcmUgYW5k
IHdhaXQgZm9yIGFuIEFjay4gKi8KIF9oaWRkZW4gaW50IGxpYnhsX19kb21haW5fcHZjb250cm9s
KGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxp
YnhsX194c3dhaXRfc3RhdGUgKnB2Y29udHJvbCwKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
