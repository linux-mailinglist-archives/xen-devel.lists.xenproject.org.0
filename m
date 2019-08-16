Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EACCF906BA
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 19:23:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyftb-0005LN-7e; Fri, 16 Aug 2019 17:20:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Hd7z=WM=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hyftZ-0005Km-JB
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 17:20:09 +0000
X-Inumbo-ID: 186ec068-c04a-11e9-8bb8-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 186ec068-c04a-11e9-8bb8-12813bfff9fa;
 Fri, 16 Aug 2019 17:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565976008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DPT5hLP0BMHRsTDUm0DrROsbSMmsifwechBgmwxEtSQ=;
 b=JR7sWjC9UB2w8f2c2f/18iIoBSb22r/U0qImZ+NmMAwSzcvqrVQhxbfG
 gzrNw/odBfDBog1gUGBQpV0f1Q6iGWAEAFo88CXnGiFnDkaC/JP5/ChGv
 C5NdFA7hPiqg2IgjUDgNBJ74hsZS6Q/Sjq4+ZTHwNz7pbEubd2x2Un2q2 E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: P4hjKcTUc8rm/sd5v4iu6zO4zG/Nn9kKV8AfKgIjDnadMpMiooAyzQGEwxXAZ6yrz6vTZnmvN4
 09qpcYZJ+u6qO+pR1dZjabDe5/6yrJ2xjG2l4ihEXarN0DVd9KEbyR0g3T3xgCsHFUAMN+wiwc
 Htcjf9pGCMJa3l75XoCagYiUV7HTJMAbqMjuG6sGovEcTPTbZdiF1tMcps9WtLe5LwevczXsbg
 wkFrHiSmAYbZIYsVfejPzjv5/PVoWkNRppusHh6atk0HsjhvKy0HPZaU7biw9wAtyi/Vdp1S2N
 xvc=
X-SBRS: 2.7
X-MesageID: 4596322
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,394,1559534400"; 
   d="scan'208";a="4596322"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 16 Aug 2019 18:20:00 +0100
Message-ID: <20190816172001.3905-10-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190816172001.3905-1-paul.durrant@citrix.com>
References: <20190816172001.3905-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 09/10] iommu: tidy up iommu_use_hap_pt() and
 need_iommu_pt_sync() macros
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcyBtYWNyb3MgcmVhbGx5IG91Z2h0IHRvIGxpdmUgaW4gdGhlIGNvbW1vbiB4ZW4vaW9tbXUu
aCBoZWFkZXIgcmF0aGVyCnRoZW4gYmVpbmcgZGlzdHJpYnV0ZWQgYW1vbmdzdCBhcmNoaXRlY3R1
cmUgc3BlY2lmaWMgaW9tbXUgaGVhZGVycyBhbmQKeGVuL3NjaGVkLmguIFRoaXMgcGF0Y2ggbW92
ZXMgdGhlbSB0aGVyZS4KCk5PVEU6IERpc2FibGluZyAnc2hhcmVwdCcgaW4gdGhlIGNvbW1hbmQg
bGluZSBpb21tdSBvcHRpb25zIHNob3VsZCByZWFsbHkKICAgICAgYmUgaGFyZCBlcnJvciBvbiBB
Uk0gKGFzIG9wcG9zZWQgdG8ganVzdCBiZWluZyBpZ25vcmVkKSwgc28gYXZvaWQKICAgICAgcGFy
c2luZyB0aGF0IG9wdGlvbiBpZiBDT05GSUdfQVJNIGlzIHNldC4KClNpZ25lZC1vZmYtYnk6IFBh
dWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Ci0tLQpDYzogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4K
Q2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29u
cmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDYzogV2VpIExpdSA8d2xA
eGVuLm9yZz4KQ2M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNv
bT4KQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpQcmV2aW91
c2x5IHBhcnQgb2YgaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hl
bi1kZXZlbC8yMDE5LTA3L21zZzAyMjY3Lmh0bWwKLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9pb21tdS5jIHwgIDIgKysKIHhlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUuaCAgICAgfCAgMyAt
LS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaW9tbXUuaCAgICAgfCAgNCAtLS0tCiB4ZW4vaW5jbHVk
ZS94ZW4vaW9tbXUuaCAgICAgICAgIHwgMTEgKysrKysrKysrKysKIHhlbi9pbmNsdWRlL3hlbi9z
Y2hlZC5oICAgICAgICAgfCAgNiAtLS0tLS0KIDUgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9u
cygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKaW5kZXggZGM3Yjc1
ZmFiNi4uYjI0YmU1ZmZhNiAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9t
bXUuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCkBAIC0xMDIsOCArMTAy
LDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX2lvbW11X3BhcmFtKGNvbnN0IGNoYXIgKnMp
CiAgICAgICAgICAgICBpb21tdV9od2RvbV9wYXNzdGhyb3VnaCA9IHZhbDsKICAgICAgICAgZWxz
ZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJkb20wLXN0cmljdCIsIHMsIHNzKSkgPj0gMCAp
CiAgICAgICAgICAgICBpb21tdV9od2RvbV9zdHJpY3QgPSB2YWw7CisjaWZuZGVmIENPTkZJR19B
Uk0KICAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJzaGFyZXB0Iiwgcywg
c3MpKSA+PSAwICkKICAgICAgICAgICAgIGlvbW11X2hhcF9wdF9zaGFyZSA9IHZhbDsKKyNlbmRp
ZgogICAgICAgICBlbHNlCiAgICAgICAgICAgICByYyA9IC1FSU5WQUw7CiAKZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUu
aAppbmRleCAxNTc3ZTgzZDJiLi43N2E5NGIyOWViIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9h
c20tYXJtL2lvbW11LmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9pb21tdS5oCkBAIC0yMCw5
ICsyMCw2IEBAIHN0cnVjdCBhcmNoX2lvbW11CiAgICAgdm9pZCAqcHJpdjsKIH07CiAKLS8qIEFs
d2F5cyBzaGFyZSBQMk0gVGFibGUgYmV0d2VlbiB0aGUgQ1BVIGFuZCB0aGUgSU9NTVUgKi8KLSNk
ZWZpbmUgaW9tbXVfdXNlX2hhcF9wdChkKSBpc19pb21tdV9lbmFibGVkKGQpCi0KIGNvbnN0IHN0
cnVjdCBpb21tdV9vcHMgKmlvbW11X2dldF9vcHModm9pZCk7CiB2b2lkIGlvbW11X3NldF9vcHMo
Y29uc3Qgc3RydWN0IGlvbW11X29wcyAqb3BzKTsKIApkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
YXNtLXg4Ni9pb21tdS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9pb21tdS5oCmluZGV4IDZkMDI0
ZDVjMGUuLjI1ZDJhZWU5YTkgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaW9tbXUu
aAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2lvbW11LmgKQEAgLTc5LDEwICs3OSw2IEBAIHN0
cnVjdCBpb21tdV9pbml0X29wcyB7CiAKIGV4dGVybiBjb25zdCBzdHJ1Y3QgaW9tbXVfaW5pdF9v
cHMgKmlvbW11X2luaXRfb3BzOwogCi0vKiBBcmUgd2UgdXNpbmcgdGhlIGRvbWFpbiBQMk0gdGFi
bGUgYXMgaXRzIElPTU1VIHBhZ2V0YWJsZT8gKi8KLSNkZWZpbmUgaW9tbXVfdXNlX2hhcF9wdChk
KSBcCi0gICAgKGhhcF9lbmFibGVkKGQpICYmIGlzX2lvbW11X2VuYWJsZWQoZCkgJiYgaW9tbXVf
aGFwX3B0X3NoYXJlKQotCiB2b2lkIGlvbW11X3VwZGF0ZV9pcmVfZnJvbV9hcGljKHVuc2lnbmVk
IGludCBhcGljLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgdmFsdWUpOwogdW5zaWdu
ZWQgaW50IGlvbW11X3JlYWRfYXBpY19mcm9tX2lyZSh1bnNpZ25lZCBpbnQgYXBpYywgdW5zaWdu
ZWQgaW50IHJlZyk7CiBpbnQgaW9tbXVfc2V0dXBfaHBldF9tc2koc3RydWN0IG1zaV9kZXNjICop
OwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2lvbW11LmggYi94ZW4vaW5jbHVkZS94ZW4v
aW9tbXUuaAppbmRleCA0YjY4NzE5MzZjLi41ZTdjYTk4MTcwIDEwMDY0NAotLS0gYS94ZW4vaW5j
bHVkZS94ZW4vaW9tbXUuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaApAQCAtMjY4LDYg
KzI2OCwxNyBAQCBzdHJ1Y3QgZG9tYWluX2lvbW11IHsKICNkZWZpbmUgaW9tbXVfc2V0X2ZlYXR1
cmUoZCwgZikgICBzZXRfYml0KGYsIGRvbV9pb21tdShkKS0+ZmVhdHVyZXMpCiAjZGVmaW5lIGlv
bW11X2NsZWFyX2ZlYXR1cmUoZCwgZikgY2xlYXJfYml0KGYsIGRvbV9pb21tdShkKS0+ZmVhdHVy
ZXMpCiAKKy8qIEFyZSB3ZSB1c2luZyB0aGUgZG9tYWluIFAyTSB0YWJsZSBhcyBpdHMgSU9NTVUg
cGFnZXRhYmxlPyAqLworI2RlZmluZSBpb21tdV91c2VfaGFwX3B0KGQpIFwKKyAgICAoaGFwX2Vu
YWJsZWQoZCkgJiYgaXNfaW9tbXVfZW5hYmxlZChkKSAmJiBpb21tdV9oYXBfcHRfc2hhcmUpCisK
Ky8qIERvZXMgdGhlIElPTU1VIHBhZ2V0YWJsZSBuZWVkIHRvIGJlIGtlcHQgc3luY2hyb25pemVk
IHdpdGggdGhlIFAyTSAqLworI2lmZGVmIENPTkZJR19IQVNfUEFTU1RIUk9VR0gKKyNkZWZpbmUg
bmVlZF9pb21tdV9wdF9zeW5jKGQpICAgICAoZG9tX2lvbW11KGQpLT5uZWVkX3N5bmMpCisjZWxz
ZQorI2RlZmluZSBuZWVkX2lvbW11X3B0X3N5bmMoZCkgICAgIGZhbHNlCisjZW5kaWYKKwogaW50
IF9fbXVzdF9jaGVjayBpb21tdV9zdXNwZW5kKHZvaWQpOwogdm9pZCBpb21tdV9yZXN1bWUodm9p
ZCk7CiB2b2lkIGlvbW11X2NyYXNoX3NodXRkb3duKHZvaWQpOwpkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUveGVuL3NjaGVkLmggYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAppbmRleCBiMzc2NzY4
NDI0Li43ZTRjMjRmOGQwIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAorKysg
Yi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaApAQCAtOTY0LDEyICs5NjQsNiBAQCBzdGF0aWMgaW5s
aW5lIGJvb2wgaXNfaHdkb21fcGlubmVkX3ZjcHUoY29uc3Qgc3RydWN0IHZjcHUgKnYpCiAgICAg
ICAgICAgICBjcHVtYXNrX3dlaWdodCh2LT5jcHVfaGFyZF9hZmZpbml0eSkgPT0gMSk7CiB9CiAK
LSNpZmRlZiBDT05GSUdfSEFTX1BBU1NUSFJPVUdICi0jZGVmaW5lIG5lZWRfaW9tbXVfcHRfc3lu
YyhkKSAoZG9tX2lvbW11KGQpLT5uZWVkX3N5bmMpCi0jZWxzZQotI2RlZmluZSBuZWVkX2lvbW11
X3B0X3N5bmMoZCkgZmFsc2UKLSNlbmRpZgotCiBzdGF0aWMgaW5saW5lIGJvb2wgaXNfdmNwdV9v
bmxpbmUoY29uc3Qgc3RydWN0IHZjcHUgKnYpCiB7CiAgICAgcmV0dXJuICF0ZXN0X2JpdChfVlBG
X2Rvd24sICZ2LT5wYXVzZV9mbGFncyk7Ci0tIAoyLjIwLjEuMi5nYjIxZWJiNjcxCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
