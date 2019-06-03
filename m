Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0843F32FA7
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 14:30:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXm3g-0002iH-2s; Mon, 03 Jun 2019 12:27:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9f30=UC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hXm3e-0002i0-AQ
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 12:27:22 +0000
X-Inumbo-ID: ef61dfa3-85fa-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ef61dfa3-85fa-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 12:27:21 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: crs1FslT3zE6b2V/cXzj73zLbpgWfeKCZTP/X1z0psQ6M9g3LkeiUNVPT31v3aP2M6/VsaaHiZ
 d3ibihag/3qMDlHfVVjvOIw5gM+EehVf+/ZeHJN638Vk44ic08dUKAfya+K1yBZrnglUgiTove
 vABf3cpvn3bAw235qYodlWNOzZZ3Roc3BgCh2c7PhoxhaPxb2ZZNHeY1tBKGra/GPO+y540nmD
 s3mBOj4NttjnF5DkIF6tp7SxreFoNRdrsHx+q2mmpfVweOH4bkovjVUDzBLtxTYH6x2eUQbIkI
 XDg=
X-SBRS: 2.7
X-MesageID: 1206004
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,546,1549947600"; 
   d="scan'208";a="1206004"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 3 Jun 2019 13:25:24 +0100
Message-ID: <1559564728-17167-2-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1559564728-17167-1-git-send-email-andrew.cooper3@citrix.com>
References: <1559564728-17167-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/5] xen/vm-event: Drop unused u_domctl
 parameter from vm_event_domctl()
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXJhbWV0ZXIgaXNuJ3QgdXNlZCBhdCBhbGwuICBGdXRoZXJtb3JlLCBlbGlkZSB0aGUg
Y29weWJhY2sgaW4KZmFpbGluZyBjYXNlcywgYXMgaXQgaXMgb25seSBzdWNjZXNzZnVsIHBhdGhz
IHdoaWNoIGdlbmVyYXRlIGRhdGEgd2hpY2gKbmVlZHMgc2VuZGluZyBiYWNrIHRvIHRoZSBjYWxs
ZXIuCgpGaW5hbGx5LCBkcm9wIGEgcmVkdW5kYW50IGQgPT0gTlVMTCBjaGVjaywgYXMgdGhhdCBs
b2dpYyBpcyBhbGwgY29tbW9uCmF0IHRoZSBiZWdpbmluZyBvZiBkb19kb21jdGwoKS4KCk5vIGZ1
bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRk
ZWZlbmRlci5jb20+CkNDOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CkND
OiBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPgotLS0KIHhlbi9j
b21tb24vZG9tY3RsLmMgICAgICAgIHwgNiArKystLS0KIHhlbi9jb21tb24vdm1fZXZlbnQuYyAg
ICAgIHwgNiArLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi92bV9ldmVudC5oIHwgMyArLS0KIDMgZmls
ZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL2RvbWN0bC5jIGIveGVuL2NvbW1vbi9kb21jdGwuYwppbmRleCBiYWRlOWE2
Li43MmE0NDk1IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2RvbWN0bC5jCisrKyBiL3hlbi9jb21t
b24vZG9tY3RsLmMKQEAgLTEwMTgsOSArMTAxOCw5IEBAIGxvbmcgZG9fZG9tY3RsKFhFTl9HVUVT
VF9IQU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90KSB1X2RvbWN0bCkKICAgICAgICAgYnJlYWs7CiAK
ICAgICBjYXNlIFhFTl9ET01DVExfdm1fZXZlbnRfb3A6Ci0gICAgICAgIHJldCA9IHZtX2V2ZW50
X2RvbWN0bChkLCAmb3AtPnUudm1fZXZlbnRfb3AsCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBndWVzdF9oYW5kbGVfY2FzdCh1X2RvbWN0bCwgdm9pZCkpOwotICAgICAgICBjb3B5YmFj
ayA9IDE7CisgICAgICAgIHJldCA9IHZtX2V2ZW50X2RvbWN0bChkLCAmb3AtPnUudm1fZXZlbnRf
b3ApOworICAgICAgICBpZiAoIHJldCA9PSAwICkKKyAgICAgICAgICAgIGNvcHliYWNrID0gdHJ1
ZTsKICAgICAgICAgYnJlYWs7CiAKICNpZmRlZiBDT05GSUdfTUVNX0FDQ0VTUwpkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi92bV9ldmVudC5jIGIveGVuL2NvbW1vbi92bV9ldmVudC5jCmluZGV4IDc0
YTQ3NTUuLjkwMmUxNTIgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vdm1fZXZlbnQuYworKysgYi94
ZW4vY29tbW9uL3ZtX2V2ZW50LmMKQEAgLTU4Myw4ICs1ODMsNyBAQCB2b2lkIHZtX2V2ZW50X2Ns
ZWFudXAoc3RydWN0IGRvbWFpbiAqZCkKICNlbmRpZgogfQogCi1pbnQgdm1fZXZlbnRfZG9tY3Rs
KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB4ZW5fZG9tY3RsX3ZtX2V2ZW50X29wICp2ZWMsCi0g
ICAgICAgICAgICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgdV9kb21jdGwp
CitpbnQgdm1fZXZlbnRfZG9tY3RsKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB4ZW5fZG9tY3Rs
X3ZtX2V2ZW50X29wICp2ZWMpCiB7CiAgICAgaW50IHJjOwogCkBAIC01OTQsOSArNTkzLDYgQEAg
aW50IHZtX2V2ZW50X2RvbWN0bChzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgeGVuX2RvbWN0bF92
bV9ldmVudF9vcCAqdmVjLAogICAgICAgICByZXR1cm4gMDsKICAgICB9CiAKLSAgICBpZiAoIHVu
bGlrZWx5KGQgPT0gTlVMTCkgKQotICAgICAgICByZXR1cm4gLUVTUkNIOwotCiAgICAgcmMgPSB4
c21fdm1fZXZlbnRfY29udHJvbChYU01fUFJJViwgZCwgdmVjLT5tb2RlLCB2ZWMtPm9wKTsKICAg
ICBpZiAoIHJjICkKICAgICAgICAgcmV0dXJuIHJjOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
eGVuL3ZtX2V2ZW50LmggYi94ZW4vaW5jbHVkZS94ZW4vdm1fZXZlbnQuaAppbmRleCA3ZjZmYjZk
Li4zY2MyYjIwIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vdm1fZXZlbnQuaAorKysgYi94
ZW4vaW5jbHVkZS94ZW4vdm1fZXZlbnQuaApAQCAtNjQsOCArNjQsNyBAQCB2b2lkIHZtX2V2ZW50
X2NhbmNlbF9zbG90KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2bV9ldmVudF9kb21haW4gKnZl
ZCk7CiB2b2lkIHZtX2V2ZW50X3B1dF9yZXF1ZXN0KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2
bV9ldmVudF9kb21haW4gKnZlZCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgdm1fZXZlbnRf
cmVxdWVzdF90ICpyZXEpOwogCi1pbnQgdm1fZXZlbnRfZG9tY3RsKHN0cnVjdCBkb21haW4gKmQs
IHN0cnVjdCB4ZW5fZG9tY3RsX3ZtX2V2ZW50X29wICp2ZWMsCi0gICAgICAgICAgICAgICAgICAg
IFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgdV9kb21jdGwpOworaW50IHZtX2V2ZW50X2Rv
bWN0bChzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgeGVuX2RvbWN0bF92bV9ldmVudF9vcCAqdmVj
KTsKIAogdm9pZCB2bV9ldmVudF92Y3B1X3BhdXNlKHN0cnVjdCB2Y3B1ICp2KTsKIHZvaWQgdm1f
ZXZlbnRfdmNwdV91bnBhdXNlKHN0cnVjdCB2Y3B1ICp2KTsKLS0gCjIuMS40CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
