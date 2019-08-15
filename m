Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BE08F247
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 19:33:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyJZU-0006Wt-PE; Thu, 15 Aug 2019 17:29:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y4W9=WL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyJZS-0006Vt-PV
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 17:29:54 +0000
X-Inumbo-ID: 4988038a-bf82-11e9-8ba4-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4988038a-bf82-11e9-8ba4-12813bfff9fa;
 Thu, 15 Aug 2019 17:29:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFF9228;
 Thu, 15 Aug 2019 10:29:50 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 395AB3F706;
 Thu, 15 Aug 2019 10:29:50 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 15 Aug 2019 18:29:44 +0100
Message-Id: <20190815172944.14163-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH v2] xen/arm: domain_build: Print the correct
 domain in dtb_load()
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ZHRiX2xvYWQoKSBjYW4gYmUgY2FsbGVkIGJ5IG90aGVyIGRvbWFpbiB0aGFuIGRvbTAuIFRvIGF2
b2lkIGNvbmZ1c2lvbgppbiB0aGUgbG9nLCBwcmludCB0aGUgY29ycmVjdCBkb21haW4uCgpTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKLS0tCiAgICBD
aGFuZ2VzIGluIHYyOgogICAgICAgIC0gRml4IHRoZSBzZWNvbmQgcHJpbnQgaW4gdGhlIGZ1bmN0
aW9uIGFzIHdlbGwuCi0tLQogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgOCArKysrKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMKaW5kZXggNGU1MWUyMjkyNy4uMTI2Mzc0ZjYwMyAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jCisrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwpA
QCAtMTc4NywxNSArMTc4NywxNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZHRiX2xvYWQoc3RydWN0
IGtlcm5lbF9pbmZvICpraW5mbykKIHsKICAgICB1bnNpZ25lZCBsb25nIGxlZnQ7CiAKLSAgICBw
cmludGsoIkxvYWRpbmcgZG9tMCBEVEIgdG8gMHglIlBSSXBhZGRyIi0weCUiUFJJcGFkZHIiXG4i
LAotICAgICAgICAgICBraW5mby0+ZHRiX3BhZGRyLCBraW5mby0+ZHRiX3BhZGRyICsgZmR0X3Rv
dGFsc2l6ZShraW5mby0+ZmR0KSk7CisgICAgcHJpbnRrKCJMb2FkaW5nICVwZCBEVEIgdG8gMHgl
IlBSSXBhZGRyIi0weCUiUFJJcGFkZHIiXG4iLAorICAgICAgICAgICBraW5mby0+ZCwga2luZm8t
PmR0Yl9wYWRkciwKKyAgICAgICAgICAga2luZm8tPmR0Yl9wYWRkciArIGZkdF90b3RhbHNpemUo
a2luZm8tPmZkdCkpOwogCiAgICAgbGVmdCA9IGNvcHlfdG9fZ3Vlc3RfcGh5c19mbHVzaF9kY2Fj
aGUoa2luZm8tPmQsIGtpbmZvLT5kdGJfcGFkZHIsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAga2luZm8tPmZkdCwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBmZHRfdG90YWxzaXplKGtpbmZvLT5mZHQpKTsKIAogICAgIGlmICgg
bGVmdCAhPSAwICkKLSAgICAgICAgcGFuaWMoIlVuYWJsZSB0byBjb3B5IHRoZSBEVEIgdG8gZG9t
MCBtZW1vcnkgKGxlZnQgPSAlbHUgYnl0ZXMpXG4iLCBsZWZ0KTsKKyAgICAgICAgcGFuaWMoIlVu
YWJsZSB0byBjb3B5IHRoZSBEVEIgdG8gJXBkIG1lbW9yeSAobGVmdCA9ICVsdSBieXRlcylcbiIs
CisgICAgICAgICAgICAgIGtpbmZvLT5kLCBsZWZ0KTsKICAgICB4ZnJlZShraW5mby0+ZmR0KTsK
IH0KIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
