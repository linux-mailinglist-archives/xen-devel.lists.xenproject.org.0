Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C699A71C38
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 17:52:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpx2C-0007GB-Fa; Tue, 23 Jul 2019 15:49:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=079Z=VU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hpx2A-0007Fu-G8
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 15:48:58 +0000
X-Inumbo-ID: 618a0823-ad61-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 618a0823-ad61-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 15:48:57 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sKUycj5eRQJbfPx3dYuX/2Eo49WA5DwmCt5E7ZlOhPOnq2P7Caf7lQ6gdYQh0OV/gvA08OcbeI
 Yycoa54KRbf4aTtG7zPFFhpm+BZm+oMvj5M2Nw1v3ye8Fmj+CMnvty57dxmmf3qEHOYGxt9Hga
 Iif3aHZF6lO5zL2F2WF9/Zqf3+wqEzaU4vd5as53wEkrkOsD6nAbK3qdMo2xYaewg6W4WerG3m
 VMuMbas7N3C8OhVkWxaQBdqY2hbkUQmwLd0lhnqiFt/g3eIiskZtO3RcYc4STwVpS7vKiMVtKF
 ywU=
X-SBRS: 2.7
X-MesageID: 3360479
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,299,1559534400"; 
   d="scan'208";a="3360479"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 23 Jul 2019 17:48:51 +0200
Message-ID: <20190723154851.77627-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190723154851.77627-1-roger.pau@citrix.com>
References: <20190723154851.77627-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] x86/iommu: avoid mapping the APIC
 configuration space for hwdom
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudCBjb2RlIG9ubHkgcHJldmVudHMgbWFwcGluZyB0aGUgaW8tYXBpYyBwYWdlIGludG8g
dGhlIGd1ZXN0CnBoeXNpY2FsIG1lbW9yeSBtYXAuIEV4cGFuZCB0aGUgcmFuZ2UgdG8gYmUgMHhG
RUN4X3h4eHggYXMgZGVzY3JpYmVkCmluIHRoZSBJbnRlbCAzIFNlcmllcyBDaGlwc2V0IERhdGFz
aGVldCBzZWN0aW9uIDMuMy4xICJBUElDCkNvbmZpZ3VyYXRpb24gU3BhY2UgKEZFQzBfMDAwMGji
gJNGRUNGX0ZGRkZoKSIuCgpBTUQgYWxzbyBsaXN0cyB0aGlzIGFkZHJlc3MgcmFuZ2UgaW4gdGhl
IEFNRCBTUjU2OTAgRGF0YWJvb2ssIHNlY3Rpb24KMi40LjIgIk5vbi1TQiBJT0FQSUMgU3VwcG9y
dCIuCgpSZXF1ZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+ClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gveDg2L2lvbW11LmMgfCA5ICsrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC94ODYvaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jCmluZGV4
IDg4YTg3Y2Y3YTQuLjRkYWJmYjIzOTEgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL3g4Ni9pb21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5j
CkBAIC0xOTUsNyArMTk1LDcgQEAgc3RhdGljIGJvb2wgX19od2RvbV9pbml0IGh3ZG9tX2lvbW11
X21hcChjb25zdCBzdHJ1Y3QgZG9tYWluICpkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIG1heF9wZm4pCiB7CiAgICAgbWZuX3QgbWZuID0g
X21mbihwZm4pOwotICAgIHVuc2lnbmVkIGludCBpLCB0eXBlOworICAgIHVuc2lnbmVkIGludCB0
eXBlOwogCiAgICAgLyoKICAgICAgKiBTZXQgdXAgMToxIG1hcHBpbmcgZm9yIGRvbTAuIERlZmF1
bHQgdG8gaW5jbHVkZSBvbmx5IGNvbnZlbnRpb25hbCBSQU0KQEAgLTIyOSwxMCArMjI5LDkgQEAg
c3RhdGljIGJvb2wgX19od2RvbV9pbml0IGh3ZG9tX2lvbW11X21hcChjb25zdCBzdHJ1Y3QgZG9t
YWluICpkLAogICAgIC8qIENoZWNrIHRoYXQgaXQgZG9lc24ndCBvdmVybGFwIHdpdGggdGhlIElu
dGVycnVwdCBBZGRyZXNzIFJhbmdlLiAqLwogICAgIGlmICggcGZuID49IDB4ZmVlMDAgJiYgcGZu
IDw9IDB4ZmVlZmYgKQogICAgICAgICByZXR1cm4gZmFsc2U7Ci0gICAgLyogLi4uIG9yIHRoZSBJ
Ty1BUElDICovCi0gICAgZm9yICggaSA9IDA7IGhhc192aW9hcGljKGQpICYmIGkgPCBkLT5hcmNo
Lmh2bS5ucl92aW9hcGljczsgaSsrICkKLSAgICAgICAgaWYgKCBwZm4gPT0gUEZOX0RPV04oZG9t
YWluX3Zpb2FwaWMoZCwgaSktPmJhc2VfYWRkcmVzcykgKQotICAgICAgICAgICAgcmV0dXJuIGZh
bHNlOworICAgIC8qIC4uLiBvciB0aGUgQVBJQyBDb25maWd1cmF0aW9uIFNwYWNlLiAqLworICAg
IGlmICggcGZuID49IDB4ZmVjMDAgJiYgcGZuIDw9IDB4ZmVjZmYgKQorICAgICAgICByZXR1cm4g
ZmFsc2U7CiAgICAgLyoKICAgICAgKiAuLi4gb3IgdGhlIFBDSWUgTUNGRyByZWdpb25zLgogICAg
ICAqIFRPRE86IHJ1bnRpbWUgYWRkZWQgTU1DRkcgcmVnaW9ucyBhcmUgbm90IGNoZWNrZWQgdG8g
bWFrZSBzdXJlIHRoZXkKLS0gCjIuMjAuMSAoQXBwbGUgR2l0LTExNykKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
