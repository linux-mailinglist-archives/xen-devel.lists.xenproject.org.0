Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6655BEED5
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:51:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQOn-00060H-1O; Thu, 26 Sep 2019 09:49:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQOk-0005vK-41
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:49:18 +0000
X-Inumbo-ID: e755c544-e042-11e9-97fb-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id e755c544-e042-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 09:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491356; x=1601027356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=woXLRl6C1H1ZD3v5zYbS0cYBVVy/4R3dJrCGF/ESWkY=;
 b=ugJvlZ6EuXVhhAWDtN/EuXcAmRplAtOgGsacwFL7gPuaOwdsKJmVWyJS
 TXemw4/Wsf2sljpNr30c+uL+We2LBzMJN2O2CXo2T7guihA6vnV0CWide
 LUHm3W30q6Ne3bHYbPxxs8huVHi7MFtXKzafhEUH6euuyf8UsHeuNcbk4 g=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="423750674"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:49:16 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id 61566A1D79; Thu, 26 Sep 2019 09:49:14 +0000 (UTC)
Received: from EX13d09UWA003.ant.amazon.com (10.43.160.227) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:55 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13d09UWA003.ant.amazon.com (10.43.160.227) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:55 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:53 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:25 +0100
Message-ID: <ff705e7591932506093147f2e4f911c12ad3eea3.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 62/84] x86: lift vcpu mapcache to arch_vcpu
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCkl0IGlzIGdvaW5nIHRvIGJlIG5l
ZWRlZCBieSBIVk0gYXMgd2VsbCwgYmVjYXVzZSB3ZSB3YW50IGV2ZW4gSFZNIHZjcHUKdG8gaGF2
ZSBhIHBlci12Y3B1IG1hcGNhY2hlLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2Zm
LWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9kb21h
aW5fcGFnZS5jICAgfCA4ICsrKystLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oIHwg
NiArKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb21haW5fcGFnZS5jIGIveGVuL2FyY2gveDg2
L2RvbWFpbl9wYWdlLmMKaW5kZXggOWExY2M1YmI0MC4uMzQ4ZWE5ZWJmMyAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMKKysrIGIveGVuL2FyY2gveDg2L2RvbWFpbl9wYWdl
LmMKQEAgLTk1LDcgKzk1LDcgQEAgdm9pZCAqbWFwX2RvbWFpbl9wYWdlKG1mbl90IG1mbikKICAg
ICB9CiAKICAgICBkY2FjaGUgPSAmdi0+ZG9tYWluLT5hcmNoLm1hcGNhY2hlOwotICAgIHZjYWNo
ZSA9ICZ2LT5hcmNoLnB2Lm1hcGNhY2hlOworICAgIHZjYWNoZSA9ICZ2LT5hcmNoLm1hcGNhY2hl
OwogICAgIGlmICggIWRjYWNoZS0+aW51c2UgKQogICAgIHsKICAgICAgICAgdm9pZCAqcmV0OwpA
QCAtMjE1LDcgKzIxNSw3IEBAIHZvaWQgdW5tYXBfZG9tYWluX3BhZ2UoY29uc3Qgdm9pZCAqcHRy
KQogCiAgICAgaWR4ID0gUEZOX0RPV04odmEgLSBNQVBDQUNIRV9WSVJUX1NUQVJUKTsKICAgICBt
Zm4gPSBsMWVfZ2V0X3BmbihNQVBDQUNIRV9MMUVOVChpZHgpKTsKLSAgICBoYXNoZW50ID0gJnYt
PmFyY2gucHYubWFwY2FjaGUuaGFzaFtNQVBIQVNIX0hBU0hGTihtZm4pXTsKKyAgICBoYXNoZW50
ID0gJnYtPmFyY2gubWFwY2FjaGUuaGFzaFtNQVBIQVNIX0hBU0hGTihtZm4pXTsKIAogICAgIGxv
Y2FsX2lycV9zYXZlKGZsYWdzKTsKIApAQCAtMjg1LDcgKzI4NSw3IEBAIGludCBtYXBjYWNoZV92
Y3B1X2luaXQoc3RydWN0IHZjcHUgKnYpCiAgICAgdW5zaWduZWQgaW50IGVudHMgPSBkLT5tYXhf
dmNwdXMgKiBNQVBDQUNIRV9WQ1BVX0VOVFJJRVM7CiAgICAgdW5zaWduZWQgaW50IG5yID0gUEZO
X1VQKEJJVFNfVE9fTE9OR1MoZW50cykgKiBzaXplb2YobG9uZykpOwogCi0gICAgaWYgKCAhaXNf
cHZfdmNwdSh2KSB8fCAhZGNhY2hlLT5pbnVzZSApCisgICAgaWYgKCAhZGNhY2hlLT5pbnVzZSAp
CiAgICAgICAgIHJldHVybiAwOwogCiAgICAgaWYgKCBlbnRzID4gZGNhY2hlLT5lbnRyaWVzICkK
QEAgLTMxMiw3ICszMTIsNyBAQCBpbnQgbWFwY2FjaGVfdmNwdV9pbml0KHN0cnVjdCB2Y3B1ICp2
KQogICAgIEJVSUxEX0JVR19PTihNQVBIQVNIRU5UX05PVElOVVNFIDwgTUFQQ0FDSEVfRU5UUklF
Uyk7CiAgICAgZm9yICggaSA9IDA7IGkgPCBNQVBIQVNIX0VOVFJJRVM7IGkrKyApCiAgICAgewot
ICAgICAgICBzdHJ1Y3QgdmNwdV9tYXBoYXNoX2VudHJ5ICpoYXNoZW50ID0gJnYtPmFyY2gucHYu
bWFwY2FjaGUuaGFzaFtpXTsKKyAgICAgICAgc3RydWN0IHZjcHVfbWFwaGFzaF9lbnRyeSAqaGFz
aGVudCA9ICZ2LT5hcmNoLm1hcGNhY2hlLmhhc2hbaV07CiAKICAgICAgICAgaGFzaGVudC0+bWZu
ID0gfjBVTDsgLyogbmV2ZXIgdmFsaWQgdG8gbWFwICovCiAgICAgICAgIGhhc2hlbnQtPmlkeCA9
IE1BUEhBU0hFTlRfTk9USU5VU0U7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2Rv
bWFpbi5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaAppbmRleCAyYzdiNGRmMzRjLi40
OGE0MDk0NmRhIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oCisrKyBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmgKQEAgLTQ3Nyw5ICs0NzcsNiBAQCBzdHJ1Y3Qg
YXJjaF9kb21haW4KIAogc3RydWN0IHB2X3ZjcHUKIHsKLSAgICAvKiBtYXBfZG9tYWluX3BhZ2Uo
KSBtYXBwaW5nIGNhY2hlLiAqLwotICAgIHN0cnVjdCBtYXBjYWNoZV92Y3B1IG1hcGNhY2hlOwot
CiAgICAgc3RydWN0IHRyYXBfaW5mbyAqdHJhcF9jdHh0OwogCiAgICAgdW5zaWduZWQgbG9uZyBn
ZHRfZnJhbWVzW0ZJUlNUX1JFU0VSVkVEX0dEVF9QQUdFXTsKQEAgLTU2MCw2ICs1NTcsOSBAQCBz
dHJ1Y3QgYXJjaF92Y3B1CiAKICAgICBzdHJ1Y3QgdnBtdV9zdHJ1Y3QgdnBtdTsKIAorICAgIC8q
IG1hcF9kb21haW5fcGFnZSgpIG1hcHBpbmcgY2FjaGUuICovCisgICAgc3RydWN0IG1hcGNhY2hl
X3ZjcHUgbWFwY2FjaGU7CisKICAgICAvKiBWaXJ0dWFsIE1hY2hpbmUgRXh0ZW5zaW9ucyAqLwog
ICAgIHVuaW9uIHsKICAgICAgICAgc3RydWN0IHB2X3ZjcHUgcHY7Ci0tIAoyLjE3LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
