Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5E7BEF09
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:53:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQQS-0001Zp-1J; Thu, 26 Sep 2019 09:51:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQQL-0001PD-89
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:50:57 +0000
X-Inumbo-ID: 2330c38e-e043-11e9-964c-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id 2330c38e-e043-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491456; x=1601027456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=LDyYzg3DfaKc88izlDhVAvNjYE+nmpb1QGtOx4rbMSo=;
 b=qF96qfJDRqXBVLsGGGM3wjJkN+crY7W0hSndoOcyn62xPf8PVR49pqYC
 Wkv/ebd9eKFsSv38T/Ko5BbxlGyR2ODCW+c8p1fURJC1j6nHswWfJnKz0
 47vVQsEYehnV/1VRjbQfihsO5nCqxV8GU+vGpUkzqliMWu8+bxPhy/Iyc 8=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="753354562"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 26 Sep 2019 09:50:56 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id 7F35A1417B8; Thu, 26 Sep 2019 09:50:54 +0000 (UTC)
Received: from EX13D28EUB002.ant.amazon.com (10.43.166.97) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:50:17 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUB002.ant.amazon.com (10.43.166.97) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:50:16 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:50:13 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:46 +0100
Message-ID: <e7211db761d076bd54777d0566d48af917874898.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 83/84] x86/pmap: rewrite logic for locking.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Hongyan Xia <hongyax@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KCkR1ZSB0byB0aGUgbGltaXRl
ZCBQTUFQIGVudHJpZXMsIGFub3RoZXIgcENQVSBpcyBhbGxvd2VkIHRvIHVzZSBQTUFQCm9ubHkg
d2hlbiB0aGUgY3VycmVudCBwQ1BVIGhhcyB1bm1hcHBlZCBhbGwgbWFwcGluZ3MuCgpTaWduZWQt
b2ZmLWJ5OiBIb25neWFuIFhpYSA8aG9uZ3lheEBhbWF6b24uY29tPgotLS0KIHhlbi9hcmNoL3g4
Ni9kb21haW5fcGFnZS5jIHwgIDQgLS0tLQogeGVuL2FyY2gveDg2L3BtYXAuYyAgICAgICAgfCA0
OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQogeGVuL2luY2x1ZGUvYXNt
LXg4Ni9wbWFwLmggfCAgMiAtLQogMyBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAx
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tYWluX3BhZ2UuYyBi
L3hlbi9hcmNoL3g4Ni9kb21haW5fcGFnZS5jCmluZGV4IDc4MmRkMDY1MGMuLjE4OWNhNDFhMWQg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW5fcGFnZS5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9kb21haW5fcGFnZS5jCkBAIC0xNzEsOSArMTcxLDcgQEAgb3V0OgogICAgIHJldHVybiAodm9p
ZCAqKU1BUENBQ0hFX1ZJUlRfU1RBUlQgKyBwZm5fdG9fcGFkZHIoaWR4KTsKIAogcG1hcDoKLSAg
ICBwbWFwX2xvY2soKTsKICAgICByZXQgPSBwbWFwX21hcChtZm4pOwotICAgIHBtYXBfdW5sb2Nr
KCk7CiAgICAgZmx1c2hfdGxiX29uZV9sb2NhbChyZXQpOwogICAgIHJldHVybiByZXQ7CiB9CkBA
IC0xODgsOSArMTg2LDcgQEAgdm9pZCB1bm1hcF9kb21haW5fcGFnZShjb25zdCB2b2lkICpwdHIp
CiAKICAgICBpZiAoIHZhID49IEZJWEFERFJfU1RBUlQgJiYgdmEgPCBGSVhBRERSX1RPUCApCiAg
ICAgewotICAgICAgICBwbWFwX2xvY2soKTsKICAgICAgICAgcG1hcF91bm1hcCgodm9pZCAqKXB0
cik7Ci0gICAgICAgIHBtYXBfdW5sb2NrKCk7CiAgICAgICAgIHJldHVybjsKICAgICB9CiAKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9wbWFwLmMgYi94ZW4vYXJjaC94ODYvcG1hcC5jCmluZGV4
IDkzMTA0ZDBiODYuLmFmNzQzOGNiZTQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9wbWFwLmMK
KysrIGIveGVuL2FyY2gveDg2L3BtYXAuYwpAQCAtMTUsMTggKzE1LDQ0IEBACiAgKiB1c2VkIGFu
eXdoZXJlIGVsc2Ugb3RoZXIgdGhhbiB0aGUgc3RhdGVkIHB1cnBvc2UgYWJvdmUuCiAgKi8KIAot
c3RhdGljIERFRklORV9TUElOTE9DSyhsb2NrKTsKK3N0YXRpYyBERUZJTkVfU1BJTkxPQ0sobG9j
a19jcHUpOwogLyogQml0bWFwIHRvIHRyYWNrIHdoaWNoIHNsb3QgaXMgdXNlZCAqLwogc3RhdGlj
IHVuc2lnbmVkIGxvbmcgaW51c2U7CiAKLXZvaWQgcG1hcF9sb2NrKHZvaWQpCitzdGF0aWMgdW5z
aWduZWQgaW50IGxvY2tfY3B1X2lkID0gfjA7CitzdGF0aWMgdW5zaWduZWQgaW50IGxvY2tfY291
bnQ7CisKKy8qCisgKiBPbmx5IG9uZSBwQ1BVIGlzIGFsbG93ZWQgdG8gdXNlIFBNQVAgZW50cmll
cy4gQW5vdGhlciBwQ1BVIGNhbiB1c2UgUE1BUCBvbmx5CisgKiB3aGVuIHRoZSBjdXJyZW50IHBD
UFUgaGFzIHVubWFwcGVkIGFsbCBlbnRyaWVzLgorICovCitzdGF0aWMgdm9pZCBwbWFwX2NwdV91
cCh2b2lkKQogewotICAgIHNwaW5fbG9jaygmbG9jayk7CisgICAgaW50IHJldCA9IC0xOworICAg
IHVuc2lnbmVkIGludCBjcHVfaWQgPSBzbXBfcHJvY2Vzc29yX2lkKCk7CisKKyAgICBkbworICAg
IHsKKyAgICAgICAgd2hpbGUgKCBjcHVfaWQgIT0gbG9ja19jcHVfaWQgJiYgbG9ja19jb3VudCAh
PSAwICkKKyAgICAgICAgICAgIDsKKyAgICAgICAgc3Bpbl9sb2NrKCZsb2NrX2NwdSk7CisgICAg
ICAgIGlmICggY3B1X2lkID09IGxvY2tfY3B1X2lkIHx8IGxvY2tfY291bnQgPT0gMCApCisgICAg
ICAgIHsKKyAgICAgICAgICAgIGxvY2tfY3B1X2lkID0gY3B1X2lkOworICAgICAgICAgICAgbG9j
a19jb3VudCsrOworICAgICAgICAgICAgcmV0ID0gMDsKKyAgICAgICAgfQorICAgICAgICBzcGlu
X3VubG9jaygmbG9ja19jcHUpOworICAgIH0gd2hpbGUgKCByZXQgPT0gLTEgKTsKIH0KIAotdm9p
ZCBwbWFwX3VubG9jayh2b2lkKQorc3RhdGljIHZvaWQgcG1hcF9jcHVfZG93bih2b2lkKQogewot
ICAgIHNwaW5fdW5sb2NrKCZsb2NrKTsKKyAgICBzcGluX2xvY2soJmxvY2tfY3B1KTsKKyAgICBB
U1NFUlQoc21wX3Byb2Nlc3Nvcl9pZCgpID09IGxvY2tfY3B1X2lkKTsKKyAgICBBU1NFUlQobG9j
a19jb3VudCk7CisgICAgbG9ja19jb3VudC0tOworICAgIHNwaW5fdW5sb2NrKCZsb2NrX2NwdSk7
CiB9CiAKIHZvaWQgKnBtYXBfbWFwKG1mbl90IG1mbikKQEAgLTM3LDcgKzYzLDEzIEBAIHZvaWQg
KnBtYXBfbWFwKG1mbl90IG1mbikKICAgICBsMV9wZ2VudHJ5X3QgKnBsMWU7CiAKICAgICBBU1NF
UlQoIWluX2lycSgpKTsKLSAgICBBU1NFUlQoc3Bpbl9pc19sb2NrZWQoJmxvY2spKTsKKworICAg
IC8qCisgICAgICogVGhpcyBzZW1hcGhvcmUtbGlrZSBsb2NraW5nIG1lYW5zIG9ubHkgb25lIHBD
UFUgaXMgYWxsb3dlZCwgd2hpY2ggYWxzbworICAgICAqIHN1Z2dlc3RzIFBNQVAgc2hvdWxkIG9u
bHkgYmUgdXNlZCB0byBib290c3RyYXAgb3RoZXIgc3RydWN0dXJlcy4gQW55CisgICAgICogZ2Vu
ZXJhbCBwdXJwb3NlIHVzZSBvZiBQTUFQIGlzIGEgbWlzdGFrZS4KKyAgICAgKi8KKyAgICBwbWFw
X2NwdV91cCgpOwogCiAgICAgaWR4ID0gZmluZF9maXJzdF96ZXJvX2JpdCgmaW51c2UsIE5VTV9G
SVhfUE1BUCk7CiAgICAgaWYgKCBpZHggPT0gTlVNX0ZJWF9QTUFQICkKQEAgLTYzLDEzICs5NSwx
NSBAQCB2b2lkIHBtYXBfdW5tYXAodm9pZCAqcCkKIAogICAgIEFTU0VSVCghaW5faXJxKCkpOwog
ICAgIEFTU0VSVChzbG90ID49IEZJWF9QTUFQX0JFR0lOICYmIHNsb3QgPD0gRklYX1BNQVBfRU5E
KTsKLSAgICBBU1NFUlQoc3Bpbl9pc19sb2NrZWQoJmxvY2spKTsKKwogCiAgICAgaWR4ID0gc2xv
dCAtIEZJWF9QTUFQX0JFR0lOOwogICAgIF9fY2xlYXJfYml0KGlkeCwgJmludXNlKTsKIAogICAg
IHBsMWUgPSAmbDFfZml4bWFwW0wxX1BBR0VUQUJMRV9FTlRSSUVTIC0gMSAtIHNsb3RdOwogICAg
IGwxZV93cml0ZV9hdG9taWMocGwxZSwgbDFlX2Zyb21fbWZuKF9tZm4oMCksIDApKTsKKworICAg
IHBtYXBfY3B1X2Rvd24oKTsKIH0KIAogc3RhdGljIHZvaWQgX19tYXliZV91bnVzZWQgYnVpbGRf
YXNzZXJ0aW9ucyh2b2lkKQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wbWFwLmgg
Yi94ZW4vaW5jbHVkZS9hc20teDg2L3BtYXAuaAppbmRleCAzNGQ0ZjJiYjM4Li43OTBjZDcxZmIz
IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3BtYXAuaAorKysgYi94ZW4vaW5jbHVk
ZS9hc20teDg2L3BtYXAuaApAQCAtNCw4ICs0LDYgQEAKIC8qIExhcmdlIGVub3VnaCBmb3IgbWFw
cGluZyA1IGxldmVscyBvZiBwYWdlIHRhYmxlcyB3aXRoIHNvbWUgaGVhZHJvb20gKi8KICNkZWZp
bmUgTlVNX0ZJWF9QTUFQIDgKIAotdm9pZCBwbWFwX2xvY2sodm9pZCk7Ci12b2lkIHBtYXBfdW5s
b2NrKHZvaWQpOwogdm9pZCAqcG1hcF9tYXAobWZuX3QgbWZuKTsKIHZvaWQgcG1hcF91bm1hcCh2
b2lkICpwKTsKIAotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
