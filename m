Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F29CCBEEFF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:53:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQPe-0007x7-NW; Thu, 26 Sep 2019 09:50:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQPa-0007qF-Sx
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:50:10 +0000
X-Inumbo-ID: e716710a-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id e716710a-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491356; x=1601027356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=USV90sFuRrX8EANWvawhUHi+KMNPnW4terwRZ7si4HI=;
 b=Gjkv1i/+5PmE1knZTajvVtAwQtc4VUyLgoxNqQxWg5pFZYXgkZNoaxLz
 NBulUidE41eCZevH7Xe9nUiDS/01ynao0Lqb+RPYxeqmM/IaQM1sBUEgs
 xwtbsNe57ThXtuHR177cX/AaNPomso9FvoqdcE2Drbgw/ettH5SCQBBbN 8=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="753354334"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-807d4a99.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 26 Sep 2019 09:49:15 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-807d4a99.us-east-1.amazon.com (Postfix) with ESMTPS
 id B57ACA2AC9; Thu, 26 Sep 2019 09:49:13 +0000 (UTC)
Received: from EX13D27UWA003.ant.amazon.com (10.43.160.56) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:53 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D27UWA003.ant.amazon.com (10.43.160.56) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:53 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:51 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:24 +0100
Message-ID: <4e79e54d7052964e8ddbd7fde381b4198eb992b0.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 61/84] x86: lift domain mapcache to
 arch_domain
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
ZWRlZCBieSBIVk0gYXMgd2VsbCwgYmVjYXVzZSB3ZSB3YW50IGV2ZW4gSFZNCmRvbWFpbiB0byBo
YXZlIGEgcGVyLWRvbWFpbiBtYXBjYWNoZS4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVk
LW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYv
ZG9tYWluLmMgICAgICAgIHwgIDQgKystLQogeGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMgICB8
IDEwICsrKystLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmggfCAgNiArKystLS0K
IDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvZG9tYWluLmMgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKaW5k
ZXggNzVlODliODFiZi4uMDgzYjQxM2E3MCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2RvbWFp
bi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwpAQCAtNjE3LDYgKzYxNyw4IEBAIGludCBh
cmNoX2RvbWFpbl9jcmVhdGUoc3RydWN0IGRvbWFpbiAqZCwKIAogICAgIHBzcl9kb21haW5faW5p
dChkKTsKIAorICAgIG1hcGNhY2hlX2RvbWFpbl9pbml0KGQpOworCiAgICAgaWYgKCBpc19odm1f
ZG9tYWluKGQpICkKICAgICB7CiAgICAgICAgIGlmICggKHJjID0gaHZtX2RvbWFpbl9pbml0aWFs
aXNlKGQpKSAhPSAwICkKQEAgLTYyNCw4ICs2MjYsNiBAQCBpbnQgYXJjaF9kb21haW5fY3JlYXRl
KHN0cnVjdCBkb21haW4gKmQsCiAgICAgfQogICAgIGVsc2UgaWYgKCBpc19wdl9kb21haW4oZCkg
KQogICAgIHsKLSAgICAgICAgbWFwY2FjaGVfZG9tYWluX2luaXQoZCk7Ci0KICAgICAgICAgaWYg
KCAocmMgPSBwdl9kb21haW5faW5pdGlhbGlzZShkKSkgIT0gMCApCiAgICAgICAgICAgICBnb3Rv
IGZhaWw7CiAgICAgfQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMgYi94
ZW4vYXJjaC94ODYvZG9tYWluX3BhZ2UuYwppbmRleCBiZWNlOWQ4Y2QwLi45YTFjYzViYjQwIDEw
MDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZG9tYWluX3BhZ2UuYworKysgYi94ZW4vYXJjaC94ODYv
ZG9tYWluX3BhZ2UuYwpAQCAtOTQsNyArOTQsNyBAQCB2b2lkICptYXBfZG9tYWluX3BhZ2UobWZu
X3QgbWZuKQogICAgICAgICByZXR1cm4gcmV0OwogICAgIH0KIAotICAgIGRjYWNoZSA9ICZ2LT5k
b21haW4tPmFyY2gucHYubWFwY2FjaGU7CisgICAgZGNhY2hlID0gJnYtPmRvbWFpbi0+YXJjaC5t
YXBjYWNoZTsKICAgICB2Y2FjaGUgPSAmdi0+YXJjaC5wdi5tYXBjYWNoZTsKICAgICBpZiAoICFk
Y2FjaGUtPmludXNlICkKICAgICB7CkBAIC0yMTAsNyArMjEwLDcgQEAgdm9pZCB1bm1hcF9kb21h
aW5fcGFnZShjb25zdCB2b2lkICpwdHIpCiAgICAgdiA9IG1hcGNhY2hlX2N1cnJlbnRfdmNwdSgp
OwogICAgIEFTU0VSVCh2ICYmIGlzX3B2X3ZjcHUodikpOwogCi0gICAgZGNhY2hlID0gJnYtPmRv
bWFpbi0+YXJjaC5wdi5tYXBjYWNoZTsKKyAgICBkY2FjaGUgPSAmdi0+ZG9tYWluLT5hcmNoLm1h
cGNhY2hlOwogICAgIEFTU0VSVChkY2FjaGUtPmludXNlKTsKIAogICAgIGlkeCA9IFBGTl9ET1dO
KHZhIC0gTUFQQ0FDSEVfVklSVF9TVEFSVCk7CkBAIC0yNTQsMTEgKzI1NCw5IEBAIHZvaWQgdW5t
YXBfZG9tYWluX3BhZ2UoY29uc3Qgdm9pZCAqcHRyKQogCiBpbnQgbWFwY2FjaGVfZG9tYWluX2lu
aXQoc3RydWN0IGRvbWFpbiAqZCkKIHsKLSAgICBzdHJ1Y3QgbWFwY2FjaGVfZG9tYWluICpkY2Fj
aGUgPSAmZC0+YXJjaC5wdi5tYXBjYWNoZTsKKyAgICBzdHJ1Y3QgbWFwY2FjaGVfZG9tYWluICpk
Y2FjaGUgPSAmZC0+YXJjaC5tYXBjYWNoZTsKICAgICB1bnNpZ25lZCBpbnQgYml0bWFwX3BhZ2Vz
OwogCi0gICAgQVNTRVJUKGlzX3B2X2RvbWFpbihkKSk7Ci0KICNpZmRlZiBOREVCVUcKICAgICBp
ZiAoICFtZW1faG90cGx1ZyAmJiBtYXhfcGFnZSA8PSBQRk5fRE9XTihfX3BhKEhZUEVSVklTT1Jf
VklSVF9FTkQgLSAxKSkgKQogICAgICAgICByZXR1cm4gMDsKQEAgLTI4Miw3ICsyODAsNyBAQCBp
bnQgbWFwY2FjaGVfZG9tYWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKIGludCBtYXBjYWNoZV92
Y3B1X2luaXQoc3RydWN0IHZjcHUgKnYpCiB7CiAgICAgc3RydWN0IGRvbWFpbiAqZCA9IHYtPmRv
bWFpbjsKLSAgICBzdHJ1Y3QgbWFwY2FjaGVfZG9tYWluICpkY2FjaGUgPSAmZC0+YXJjaC5wdi5t
YXBjYWNoZTsKKyAgICBzdHJ1Y3QgbWFwY2FjaGVfZG9tYWluICpkY2FjaGUgPSAmZC0+YXJjaC5t
YXBjYWNoZTsKICAgICB1bnNpZ25lZCBsb25nIGk7CiAgICAgdW5zaWduZWQgaW50IGVudHMgPSBk
LT5tYXhfdmNwdXMgKiBNQVBDQUNIRV9WQ1BVX0VOVFJJRVM7CiAgICAgdW5zaWduZWQgaW50IG5y
ID0gUEZOX1VQKEJJVFNfVE9fTE9OR1MoZW50cykgKiBzaXplb2YobG9uZykpOwpkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZG9t
YWluLmgKaW5kZXggN2NlYmZhNGZiOS4uMmM3YjRkZjM0YyAxMDA2NDQKLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9kb21haW4uaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oCkBA
IC0yNjAsOSArMjYwLDYgQEAgc3RydWN0IHB2X2RvbWFpbgogICAgIC8qIE1pdGlnYXRlIEwxVEYg
d2l0aCBzaGFkb3cvY3Jhc2hpbmc/ICovCiAgICAgYm9vbCBjaGVja19sMXRmOwogCi0gICAgLyog
bWFwX2RvbWFpbl9wYWdlKCkgbWFwcGluZyBjYWNoZS4gKi8KLSAgICBzdHJ1Y3QgbWFwY2FjaGVf
ZG9tYWluIG1hcGNhY2hlOwotCiAgICAgc3RydWN0IGNwdWlkbWFza3MgKmNwdWlkbWFza3M7CiB9
OwogCkBAIC0yOTUsNiArMjkyLDkgQEAgc3RydWN0IGFyY2hfZG9tYWluCiAgICAgdWludDMyX3Qg
cGNpX2NmODsKICAgICB1aW50OF90IGNtb3NfaWR4OwogCisgICAgLyogbWFwX2RvbWFpbl9wYWdl
KCkgbWFwcGluZyBjYWNoZS4gKi8KKyAgICBzdHJ1Y3QgbWFwY2FjaGVfZG9tYWluIG1hcGNhY2hl
OworCiAgICAgdW5pb24gewogICAgICAgICBzdHJ1Y3QgcHZfZG9tYWluIHB2OwogICAgICAgICBz
dHJ1Y3QgaHZtX2RvbWFpbiBodm07Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
