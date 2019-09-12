Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95108B0EC6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 14:19:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8O22-0007RV-T4; Thu, 12 Sep 2019 12:17:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GjwE=XH=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i8O22-0007RN-1A
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 12:17:02 +0000
X-Inumbo-ID: 36c11a94-d557-11e9-9597-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36c11a94-d557-11e9-9597-12813bfff9fa;
 Thu, 12 Sep 2019 12:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568290617;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fZN3nZZEsONTUMbidkhgiHdbtQz4Q860Fkmdy/WVaMY=;
 b=RmdSNIQDHSzfMgJiMWNI5NdalgUHeAvFf0Y+Uvhfewrz/ahZ2nNxsx9u
 4LzNcEVHGqqIeX3by/rmCeXMQdNVpAj4LK1yDr4IlEq7vVWYkPNq8xdPC
 efiNIwdbzIdNOxwPmzD0m5gzgRp8Sdfb5tfNh4t8GAe0cQwbUOdcTMYix I=;
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
IronPort-SDR: 6wHN8IyTQQNCrDCSVYBAKFOsJBLYiDlSmmbQiTmRAsOpx8FABfQfigeDeayvR6sDPvoLrlHZc7
 H6hjvuq35i4cIG2fMH+M4S2d19urxN30ZA+VYdbxtkjLf46AHGQAxbrFeEVGA+j7v0LbLAR59R
 cWCSqU6+PDDM8DYewZpLpVQj5YVCx3wm2mc03He/RHWst5MwB+C8K/1ZspK2/40mJcmfkQxiC5
 wxJQhRJTk7mlq0h5e1CXDeACM3h9GU9u8X6jyNfOeNMABHhWpClpWyCdrn4RqywJmU/8D6vRAA
 rcU=
X-SBRS: 2.7
X-MesageID: 5769902
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,497,1559534400"; 
   d="scan'208";a="5769902"
From: Paul Durrant <paul.durrant@citrix.com>
To: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>
Date: Thu, 12 Sep 2019 13:16:43 +0100
Message-ID: <20190912121646.29148-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb6
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/3] xen: fix a potential crash in xen-bus
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgZml4ZXMgYSBwb3RlbnRpYWwgc2VnZmF1bHQgY2F1c2VkIGJ5IE5vdGlmaWVy
TGlzdCBjb3JydXB0aW9uCmluIHhlbi1idXMuIFRoZSBmaXJzdCB0d28gcGF0Y2hlcyBsYXkgdGhl
IGdyb3VuZHdvcmsgYW5kIHRoZSB0aGlyZAphY3R1YWxseSBmaXhlcyB0aGUgcHJvYmxlbS4KClBh
dWwgRHVycmFudCAoMyk6CiAgeGVuIC8gbm90aWZ5OiBpbnRyb2R1Y2UgYSBuZXcgWGVuV2F0Y2hM
aXN0IGFic3RyYWN0aW9uCiAgeGVuOiBpbnRyb2R1Y2Ugc2VwYXJhdGUgWGVuV2F0Y2hMaXN0IGZv
ciBYZW5EZXZpY2Ugb2JqZWN0cwogIHhlbjogcGVyZm9ybSBYZW5EZXZpY2UgY2xlYW4tdXAgaW4g
WGVuQnVzIHdhdGNoIGhhbmRsZXIKCiBody94ZW4vdHJhY2UtZXZlbnRzICAgICAgfCAgIDkgKy0K
IGh3L3hlbi94ZW4tYnVzLmMgICAgICAgICB8IDI2NyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0KIGluY2x1ZGUvaHcveGVuL3hlbi1idXMuaCB8ICAgNyArLQogaW5jbHVk
ZS9xZW11L25vdGlmeS5oICAgIHwgICAyICsKIHV0aWwvbm90aWZ5LmMgICAgICAgICAgICB8ICAg
NSArCiA1IGZpbGVzIGNoYW5nZWQsIDIxMyBpbnNlcnRpb25zKCspLCA3NyBkZWxldGlvbnMoLSkK
LS0tCkNjOiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KQ2M6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KLS0gCjIuMjAuMS4yLmdi
MjFlYmI2CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
