Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C50C1358F7
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 13:14:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipWfy-0003dW-9b; Thu, 09 Jan 2020 12:12:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SN5F=26=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ipWfw-0003dR-S7
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 12:12:32 +0000
X-Inumbo-ID: 4f538531-32d9-11ea-b9b0-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f538531-32d9-11ea-b9b0-12813bfff9fa;
 Thu, 09 Jan 2020 12:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578571951;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FZer+qNX9l/NTOJcb1lDQAGDaVppJ9mNHWRxPWYX1jw=;
 b=QtGFOUIFBYQ/mRzpwF8uFPmQ5Wal+czEcL3juU7VYb/7N40ACxh3SU9r
 3CSFTCt8Upzc46umEFVZwKNoU6w3/sQKOTSA/EMOBhnAMA6cyQjn49WdV
 5H8CmlmJ+k/uoojQAkTAwwNHwgdH/VIvwgkUZKq5cKxZEeXKxFrDhMVtW M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: e6jq1qv5tGN7MIrKfD2jIwPmuiGIWyGewYg3p9hfYUL+UNeHrLRulPenTH77JPJtup4XtEOdDc
 H2mpvNaquX8L8T1NVbzDOaKyGWlR0VWHGMDHFWDs4yH1nPaglHgNCHscxWeS0luh6o++ZGm4h3
 t6giJvCwZS6/00xftyV7tSE19YXcWx82IlBYeWS068vO0KJFMTeK67oRcZ4DjCbtkMKcQRTb1L
 YaFE7WqmRvS0i0xHqkkBnFITJS0YJ2x62oMnX2FbmLkCt9+qHDaJZgZSLQwzpbyJXNgxzItbqp
 Evc=
X-SBRS: 2.7
X-MesageID: 11049364
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,413,1571716800"; d="scan'208";a="11049364"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 9 Jan 2020 12:12:26 +0000
Message-ID: <20200109121227.949665-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/2] libxl: Get rid of some trailing
 whitespace
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
 Ian Jackson <ian.jackson@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2VzLgoKU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2Vv
cmdlLmR1bmxhcEBjaXRyaXguY29tPgotLS0KQ0M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBj
aXRyaXguY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IEFudGhvbnkgUGVyYXJkIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2V2ZW50Lmgg
ICAgfCAyICstCiB0b29scy9saWJ4bC9saWJ4bF9mb3JrLmMgICAgIHwgNCArKy0tCiB0b29scy9s
aWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgNCArKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9l
dmVudC5oIGIvdG9vbHMvbGlieGwvbGlieGxfZXZlbnQuaAppbmRleCBkMTUxN2Y3NDU2Li40MTA4
MmVmMmY0IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9ldmVudC5oCisrKyBiL3Rvb2xz
L2xpYnhsL2xpYnhsX2V2ZW50LmgKQEAgLTQ0MSw3ICs0NDEsNyBAQCB2b2lkIGxpYnhsX29zZXZl
bnRfb2NjdXJyZWRfdGltZW91dChsaWJ4bF9jdHggKmN0eCwgdm9pZCAqZm9yX2xpYnhsKQogICoK
ICAqICAgICBBIHByb2dyYW0gd2hpY2ggZG9lcyB0aGlzIG11c3QgY2FsbCBsaWJ4bF9jaGlsZHBy
b2Nfc2V0bW9kZS4KICAqICAgICBUaGVyZSBhcmUgdGhyZWUgb3B0aW9uczoKLSAqIAorICoKICAq
ICAgICBsaWJ4bF9zaWdjaGxkX293bmVyX2xpYnhsOgogICoKICAqICAgICAgIFdoaWxlIGFueSBs
aWJ4bCBvcGVyYXRpb24gd2hpY2ggbWlnaHQgdXNlIGNoaWxkIHByb2Nlc3NlcwpkaWZmIC0tZ2l0
IGEvdG9vbHMvbGlieGwvbGlieGxfZm9yay5jIGIvdG9vbHMvbGlieGwvbGlieGxfZm9yay5jCmlu
ZGV4IDBmMWI2YjUxOGMuLmM1YjM3OGM1NTQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhs
X2ZvcmsuYworKysgYi90b29scy9saWJ4bC9saWJ4bF9mb3JrLmMKQEAgLTc4LDcgKzc4LDcgQEAg
c3RhdGljIHZvaWQgYXRmb3JrX3VubG9jayh2b2lkKQogaW50IGxpYnhsX19hdGZvcmtfaW5pdChs
aWJ4bF9jdHggKmN0eCkKIHsKICAgICBpbnQgciwgcmM7Ci0gICAgCisKICAgICBhdGZvcmtfbG9j
aygpOwogICAgIGlmIChhdGZvcmtfcmVnaXN0ZXJlZCkgeyByYyA9IDA7IGdvdG8gb3V0OyB9CiAK
QEAgLTMyNiw3ICszMjYsNyBAQCBzdGF0aWMgdm9pZCBzaWdjaGxkX3JlbW92ZWhhbmRsZXJfY29y
ZSh2b2lkKSAvKiBpZGVtcG90ZW50ICovCiB7CiAgICAgc3RydWN0IHNpZ2FjdGlvbiB3YXM7CiAg
ICAgaW50IHI7Ci0gICAgCisKICAgICBpZiAoIXNpZ2NobGRfaW5zdGFsbGVkKQogICAgICAgICBy
ZXR1cm47CiAKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggYi90b29s
cy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCmluZGV4IGI1YWRiZmU0YjcuLmJmYmVlOTQ1MWUgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKKysrIGIvdG9vbHMvbGlieGwv
bGlieGxfaW50ZXJuYWwuaApAQCAtMTYxLDcgKzE2MSw3IEBACiAjZW5kaWYKICAgLyogYWxsIG9m
IHRoZXNlIG1hY3JvcyBwcmVzZXJ2ZSBlcnJubyAoc2F2aW5nIGFuZCByZXN0b3JpbmcpICovCiAK
LS8qIAorLyoKICAqIEEgbWFjcm8gdG8gaGVscCByZXRhaW4gdGhlIGZpcnN0IGZhaWx1cmUgaW4g
ImRvIGFzIG11Y2ggYXMgeW91IGNhbiIKICAqIHNpdHVhdGlvbnMuICBOb3RlIHRoZSBoYXJkLWNv
ZGVkIHVzZSBvZiB0aGUgdmFyaWFibGUgbmFtZSBgcmNgLgogICovCkBAIC0xMzY3LDcgKzEzNjcs
NyBAQCB0eXBlZGVmIHN0cnVjdCB7CiAgICAgY29uc3QgY2hhciAqc2hpbV9jbWRsaW5lOwogICAg
IGNvbnN0IGNoYXIgKnB2X2NtZGxpbmU7CiAKLSAgICAvKiAKKyAgICAvKgogICAgICAqIGRtX3J1
bmFzOiBJZiBzZXQsIHBhc3MgcWVtdSB0aGUgYC1ydW5hc2AgcGFyYW1ldGVyIHdpdGggdGhpcwog
ICAgICAqICBzdHJpbmcgYXMgYW4gYXJndW1lbnQKICAgICAgKiBkbV9raWxsX3VpZDogSWYgc2V0
LCB0aGUgZGV2aWNlbW9kZWwgc2hvdWxkIGJlIGtpbGxlZCBieQotLSAKMi4yNC4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
