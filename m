Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C9894D35
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 20:48:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzmf3-0006MX-Qq; Mon, 19 Aug 2019 18:45:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q0wW=WP=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hzmf2-0006MS-Rl
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 18:45:44 +0000
X-Inumbo-ID: 8c845936-c2b1-11e9-8bf0-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c845936-c2b1-11e9-8bf0-12813bfff9fa;
 Mon, 19 Aug 2019 18:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566240344;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=X82PK+6p+WT1kSQdG3xzVeRwHWQSEY2ohWqF+fhkyuc=;
 b=ZVrg4QpbbyyehbnuWyhQA6bA18TCtKeJ2LlxEPL2Xjak4a2BL2btR19c
 OGjXHNmMwYEpBmTP1VID2Z/EHw+ud17+CqgcXs16YnHHRRsL/5kQYppua
 2CI2Hisjt10sv+Rkr5LmhKCSb+p8wSJKt9Zir2mebDX36KLiETRf3DXQl o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +S8ssrNtJ/IYwt6LSG9DGexCqoowxdkpcfRxrRsFP9zDk6V/Uqz2XU08zaVbPVMzEvVGf1E03C
 KaKyAp3/07Lq/08fexTXBDvFGmYTeSeet5vkQc4xREEeN4rlBEuKqfiCV35SSrE0Yw3anFgr/Y
 9Yp0qc2ooSsoTfZMxqWxZJaQHpat0S505ggtQ/TPB9rIuDeUBPUaFsI/Iv6xbrcspB6PZ4+5Yw
 RlzgAMLny9LL06xDxU45IUzRAEpFKalknLac8abh63FnT+cgybp9+l+h5uT258c+niT7o1H2m8
 SQQ=
X-SBRS: 2.7
X-MesageID: 4484969
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,405,1559534400"; 
   d="scan'208";a="4484969"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 19 Aug 2019 19:45:35 +0100
Message-ID: <1566240335-6614-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tools/oxenstored: port XS_INTRODUCE evtchn
 rebind function from cxenstored
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, ian.jackson@eu.citrix.com,
 christian.lindig@citrix.com, wl@xen.org, dave@recoil.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QyB2ZXJzaW9uIG9mIHhlbnN0b3JlZCBoYWQgdGhpcyBhYmlsaXR5IHNpbmNlIDYxYWFlZDBkNSAo
IkFsbG93ClhTX0lOVFJPRFVDRSB0byBiZSB1c2VkIGZvciByZWJpbmRpbmcgdGhlIHhlbnN0b3Jl
IGV2dGNobi4iKSBmcm9tIDIwMDcuCkNvcHkgaXQgYXMgaXMgdG8gT2NhbWwgdmVyc2lvbi4KClNp
Z25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgot
LS0KIHRvb2xzL29jYW1sL3hlbnN0b3JlZC9kb21haW4ubWwgIHwgNiArKysrKy0KIHRvb2xzL29j
YW1sL3hlbnN0b3JlZC9wcm9jZXNzLm1sIHwgOCArKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1s
L3hlbnN0b3JlZC9kb21haW4ubWwgYi90b29scy9vY2FtbC94ZW5zdG9yZWQvZG9tYWluLm1sCmlu
ZGV4IGIwYTAxYjAuLmFlYjE4NWYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9k
b21haW4ubWwKKysrIGIvdG9vbHMvb2NhbWwveGVuc3RvcmVkL2RvbWFpbi5tbApAQCAtMjMsOSAr
MjMsOSBAQCB0eXBlIHQgPQogewogCWlkOiBYZW5jdHJsLmRvbWlkOwogCW1mbjogbmF0aXZlaW50
OwotCXJlbW90ZV9wb3J0OiBpbnQ7CiAJaW50ZXJmYWNlOiBYZW5tbWFwLm1tYXBfaW50ZXJmYWNl
OwogCWV2ZW50Y2huOiBFdmVudC50OworCW11dGFibGUgcmVtb3RlX3BvcnQ6IGludDsKIAltdXRh
YmxlIHBvcnQ6IFhlbmV2ZW50Y2huLnQgb3B0aW9uOwogCW11dGFibGUgYmFkX2NsaWVudDogYm9v
bDsKIAltdXRhYmxlIGlvX2NyZWRpdDogaW50OyAoKiB0aGUgcm91bmRzIG9mIHJpbmcgcHJvY2Vz
cyBsZWZ0IHRvIGRvLCBkZWZhdWx0IGlzIDAsCkBAIC03MSw2ICs3MSwxMCBAQCBsZXQgbm90aWZ5
IGRvbSA9IG1hdGNoIGRvbS5wb3J0IHdpdGgKIAlFdmVudC5ub3RpZnkgZG9tLmV2ZW50Y2huIHBv
cnQKIAogbGV0IGJpbmRfaW50ZXJkb21haW4gZG9tID0KKwliZWdpbiBtYXRjaCBkb20ucG9ydCB3
aXRoCisJfCBOb25lIC0+ICgpCisJfCBTb21lIHBvcnQgLT4gRXZlbnQudW5iaW5kIGRvbS5ldmVu
dGNobiBwb3J0CisJZW5kOwogCWRvbS5wb3J0IDwtIFNvbWUgKEV2ZW50LmJpbmRfaW50ZXJkb21h
aW4gZG9tLmV2ZW50Y2huIGRvbS5pZCBkb20ucmVtb3RlX3BvcnQpOwogCWRlYnVnICJib3VuZCBk
b21haW4gJWQgcmVtb3RlIHBvcnQgJWQgdG8gbG9jYWwgcG9ydCAlcyIgZG9tLmlkIGRvbS5yZW1v
dGVfcG9ydCAoc3RyaW5nX29mX3BvcnQgZG9tLnBvcnQpCiAKZGlmZiAtLWdpdCBhL3Rvb2xzL29j
YW1sL3hlbnN0b3JlZC9wcm9jZXNzLm1sIGIvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3Byb2Nlc3Mu
bWwKaW5kZXggOGE3ZTUzOC4uZmY1Yzk0OCAxMDA2NDQKLS0tIGEvdG9vbHMvb2NhbWwveGVuc3Rv
cmVkL3Byb2Nlc3MubWwKKysrIGIvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3Byb2Nlc3MubWwKQEAg
LTQwOCw3ICs0MDgsMTMgQEAgbGV0IGRvX2ludHJvZHVjZSBjb24gX3QgZG9tYWlucyBjb25zIGRh
dGEgPQogCQlpbgogCWxldCBkb20gPQogCQlpZiBEb21haW5zLmV4aXN0IGRvbWFpbnMgZG9taWQg
dGhlbgotCQkJRG9tYWlucy5maW5kIGRvbWFpbnMgZG9taWQKKwkJCWxldCBlZG9tID0gRG9tYWlu
cy5maW5kIGRvbWFpbnMgZG9taWQgaW4KKwkJCWlmIChEb21haW4uZ2V0X21mbiBlZG9tKSA9IG1m
biAmJiAoQ29ubmVjdGlvbnMuZmluZF9kb21haW4gY29ucyBkb21pZCkgIT0gY29uIHRoZW4gYmVn
aW4KKwkJCQkoKiBVc2UgWFNfSU5UUk9EVUNFIGZvciByZWNyZWF0aW5nIHRoZSB4ZW5idXMgZXZl
bnQtY2hhbm5lbC4gKikKKwkJCQllZG9tLnJlbW90ZV9wb3J0IDwtIHBvcnQ7CisJCQkJRG9tYWlu
LmJpbmRfaW50ZXJkb21haW4gZWRvbTsKKwkJCWVuZDsKKwkJCWVkb20KIAkJZWxzZSB0cnkKIAkJ
CWxldCBuZG9tID0gRG9tYWlucy5jcmVhdGUgZG9tYWlucyBkb21pZCBtZm4gcG9ydCBpbgogCQkJ
Q29ubmVjdGlvbnMuYWRkX2RvbWFpbiBjb25zIG5kb207Ci0tIAoyLjcuNAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
