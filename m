Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 403B910E9B8
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 12:44:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibk5H-00048D-SB; Mon, 02 Dec 2019 11:41:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oqAn=ZY=amazon.com=prvs=23249dff4=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ibk5G-000487-DH
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 11:41:42 +0000
X-Inumbo-ID: b3e4e2fe-14f8-11ea-a407-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3e4e2fe-14f8-11ea-a407-12813bfff9fa;
 Mon, 02 Dec 2019 11:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575286900; x=1606822900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kpBDFf/k+zrPeTbYdI5I7muMlPtyB4e1OuL/tO791VQ=;
 b=ZMSMbM27skGfOIFMZBj0RK+yfgjGhhmCD5XAqF0G1eXNTDQCexUyda1R
 FDgu/2lFj5uMMDokJDHSgzbWfu0/2AEKUiWnmMP1r0U8VkZG8sAdv+BNi
 1NNdIK/tmcBKkdR2kfTDAOmHUyifJHzE9jLZ4Pa3cj7kx6YERI9PIvUNd g=;
IronPort-SDR: ZS7ql7Tvf8YlX0tNkMrzXQYROPJAbsMMMFcadgL2BM02EspQF2dEPdMjhLQU0GicnTzzeKr6d1
 J10Mvso1JoqQ==
X-IronPort-AV: E=Sophos;i="5.69,268,1571702400"; 
   d="scan'208";a="6617703"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 02 Dec 2019 11:41:39 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com (Postfix) with ESMTPS
 id 828DAA2372; Mon,  2 Dec 2019 11:41:37 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 2 Dec 2019 11:41:37 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 2 Dec 2019 11:41:36 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 2 Dec 2019 11:41:33 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>
Date: Mon, 2 Dec 2019 11:41:16 +0000
Message-ID: <20191202114117.1264-2-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202114117.1264-1-pdurrant@amazon.com>
References: <20191202114117.1264-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 1/2] xen/xenbus: reference count registered
 modules
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG8gcHJldmVudCBhIFBWIGRyaXZlciBtb2R1bGUgYmVpbmcgcmVtb3ZlZCB3aGlsc3QgYXR0YWNo
ZWQgdG8gaXRzIG90aGVyCmVuZCwgYW5kIGhlbmNlIHhlbmJ1cyBjYWxsaW5nIGludG8gcG90ZW50
aWFsbHkgaW52YWxpZCB0ZXh0LCB0YWtlIGEKcmVmZXJlbmNlIG9uIHRoZSBtb2R1bGUgYmVmb3Jl
IGNhbGxpbmcgdGhlIHByb2JlKCkgbWV0aG9kIChkcm9wcGluZyBpdCBpZgp1bnN1Y2Nlc3NmdWwp
IGFuZCBkcm9wIHRoZSByZWZlcmVuY2UgYWZ0ZXIgcmV0dXJuaW5nIGZyb20gdGhlIHJlbW92ZSgp
Cm1ldGhvZC4KClN1Z2dlc3RlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpT
aWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Ci0tLQpDYzog
Qm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ2M6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz4KCnYyOgogLSBOZXcgaW4gdjIKCnYzOgogLSBVc2UgdHJ5X21vZHVsZV9n
ZXQoKSByYXRoZXIgdGhhbiBfX21vZHVsZSlnZXQoKSBhbmQgaGFuZGxlIGZhaWx1cmUKIC0gTm90
IGFkZGVkIEp1ZXJnZW4ncyBSLWIgYmVjYXVzZSBvZiB0aGUgY2hhbmdlCi0tLQogZHJpdmVycy94
ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jIHwgMTMgKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3By
b2JlLmMKaW5kZXggNWI0NzE4ODlkNzIzLi40NDYxZjQ1ODM0NzYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYworKysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVu
YnVzX3Byb2JlLmMKQEAgLTIzMiw5ICsyMzIsMTYgQEAgaW50IHhlbmJ1c19kZXZfcHJvYmUoc3Ry
dWN0IGRldmljZSAqX2RldikKIAkJcmV0dXJuIGVycjsKIAl9CiAKKwlpZiAoIXRyeV9tb2R1bGVf
Z2V0KGRydi0+ZHJpdmVyLm93bmVyKSkgeworCQlkZXZfd2FybigmZGV2LT5kZXYsICJmYWlsZWQg
dG8gYWNxdWlyZSBtb2R1bGUgcmVmZXJlbmNlIG9uICclcycuXG4iLAorCQkJIGRydi0+ZHJpdmVy
Lm5hbWUpOworCQllcnIgPSAtRVNSQ0g7CisJCWdvdG8gZmFpbDsKKyAgICAgICAgfQorCiAJZXJy
ID0gZHJ2LT5wcm9iZShkZXYsIGlkKTsKIAlpZiAoZXJyKQotCQlnb3RvIGZhaWw7CisJCWdvdG8g
ZmFpbF9wdXQ7CiAKIAllcnIgPSB3YXRjaF9vdGhlcmVuZChkZXYpOwogCWlmIChlcnIpIHsKQEAg
LTI0NCw2ICsyNTEsOCBAQCBpbnQgeGVuYnVzX2Rldl9wcm9iZShzdHJ1Y3QgZGV2aWNlICpfZGV2
KQogCX0KIAogCXJldHVybiAwOworZmFpbF9wdXQ6CisJbW9kdWxlX3B1dChkcnYtPmRyaXZlci5v
d25lcik7CiBmYWlsOgogCXhlbmJ1c19kZXZfZXJyb3IoZGV2LCBlcnIsICJ4ZW5idXNfZGV2X3By
b2JlIG9uICVzIiwgZGV2LT5ub2RlbmFtZSk7CiAJeGVuYnVzX3N3aXRjaF9zdGF0ZShkZXYsIFhl
bmJ1c1N0YXRlQ2xvc2VkKTsKQEAgLTI2Myw2ICsyNzIsOCBAQCBpbnQgeGVuYnVzX2Rldl9yZW1v
dmUoc3RydWN0IGRldmljZSAqX2RldikKIAlpZiAoZHJ2LT5yZW1vdmUpCiAJCWRydi0+cmVtb3Zl
KGRldik7CiAKKwltb2R1bGVfcHV0KGRydi0+ZHJpdmVyLm93bmVyKTsKKwogCWZyZWVfb3RoZXJl
bmRfZGV0YWlscyhkZXYpOwogCiAJeGVuYnVzX3N3aXRjaF9zdGF0ZShkZXYsIFhlbmJ1c1N0YXRl
Q2xvc2VkKTsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
