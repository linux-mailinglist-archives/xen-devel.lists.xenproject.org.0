Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BB0974D5
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:24:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0LsJ-0001ec-Qk; Wed, 21 Aug 2019 08:21:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0LsH-0001a2-A0
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 08:21:45 +0000
X-Inumbo-ID: aea4f6a7-c3ec-11e9-adc2-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aea4f6a7-c3ec-11e9-adc2-12813bfff9fa;
 Wed, 21 Aug 2019 08:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566375693; x=1597911693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=QBL7vyAB8sS7gLIt9JcObmzXvg/bnnm2aii2dcmq544=;
 b=rDQVCw5m0BkwFqFzugALD1t4fKL4gVM2VFQAR6KzijeoOch7aGwaZDZs
 ZsdGjUmTLeMP/XeGo/7/YFn4GqOlc/N8BQyLyzowQvP5WIrJm1ApgM/IN
 98gfp4pLn+YmyBSsyXTJ/FUrSzspY0WyaA+gWTo4LJxUxKd+ZMdSyNDWy w=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="410765150"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 21 Aug 2019 08:21:32 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (Postfix) with ESMTPS
 id 5F2A3A073A; Wed, 21 Aug 2019 08:21:32 +0000 (UTC)
Received: from EX13D03EUC001.ant.amazon.com (10.43.164.245) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:16 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D03EUC001.ant.amazon.com (10.43.164.245) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 01:21:15 -0700
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 08:21:13 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 21 Aug 2019 08:20:42 +0000
Message-ID: <20190821082056.91090-7-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190821082056.91090-1-wipawel@amazon.de>
References: <20190821082056.91090-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 06/20] common: Add is_referenced_section()
 helper function
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: wipawel@amazon.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, mpohlack@amazon.com,
 Pawel Wieczorkiewicz <wipawel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBmdW5jdGlvbiBjaGVja3MgaWYgZ2l2ZW4gc2VjdGlvbiBoYXMgYW4gaW5jbHVkZWQgY29y
cmVzcG9uZGluZwpSRUxBIHNlY3Rpb24gYW5kL29yIGFueSBvZiB0aGUgc3ltYm9scyB0YWJsZSBz
eW1ib2xzIHJlZmVyZW5jZXMgdGhlCnNlY3Rpb24uIFNlY3Rpb24gYXNzb2NpYXRlZCBzeW1ib2xz
IGFyZSBpZ25vcmVkIGhlcmUgYXMgdGhlcmUgaXMKYWx3YXlzIHN1Y2ggYSBzeW1ib2wgZm9yIGV2
ZXJ5IHNlY3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdl
bEBhbWF6b24uZGU+ClJldmlld2VkLWJ5OiBBbmRyYS1JcmluYSBQYXJhc2NoaXYgPGFuZHJhcHJz
QGFtYXpvbi5jb20+ClJldmlld2VkLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1hem9uLmRl
PgpSZXZpZXdlZC1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+ClJldmll
d2VkLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KLS0tCiBj
b21tb24uYyB8IDIzICsrKysrKysrKysrKysrKysrKysrKystCiBjb21tb24uaCB8ICAyICsrCiAy
IGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9jb21tb24uYyBiL2NvbW1vbi5jCmluZGV4IDFmYjA3Y2IuLjBkZGM5ZmEgMTAwNjQ0Ci0t
LSBhL2NvbW1vbi5jCisrKyBiL2NvbW1vbi5jCkBAIC0xNSw3ICsxNSw3IEBACiAKIGludCBpc19y
ZWxhX3NlY3Rpb24oc3RydWN0IHNlY3Rpb24gKnNlYykKIHsKLQlyZXR1cm4gKHNlYy0+c2guc2hf
dHlwZSA9PSBTSFRfUkVMQSk7CisJcmV0dXJuIHNlYyAmJiAoc2VjLT5zaC5zaF90eXBlID09IFNI
VF9SRUxBKTsKIH0KIAogaW50IGlzX2xvY2FsX3N5bShzdHJ1Y3Qgc3ltYm9sICpzeW0pCkBAIC0y
NzAsNiArMjcwLDI3IEBAIGludCBpc19zdGFuZGFyZF9zZWN0aW9uKHN0cnVjdCBzZWN0aW9uICpz
ZWMpCiAJfQogfQogCitpbnQgaXNfcmVmZXJlbmNlZF9zZWN0aW9uKGNvbnN0IHN0cnVjdCBzZWN0
aW9uICpzZWMsCisJCQkgIGNvbnN0IHN0cnVjdCBrcGF0Y2hfZWxmICprZWxmKQoreworCXN0cnVj
dCBzeW1ib2wgKnN5bTsKKworCWlmIChpc19yZWxhX3NlY3Rpb24oc2VjLT5yZWxhKSAmJiBzZWMt
PnJlbGEtPmluY2x1ZGUpCisJCXJldHVybiB0cnVlOworCisJbGlzdF9mb3JfZWFjaF9lbnRyeShz
eW0sICZrZWxmLT5zeW1ib2xzLCBsaXN0KSB7CisJCWlmICghc3ltLT5pbmNsdWRlIHx8ICFzeW0t
PnNlYykKKwkJCWNvbnRpbnVlOworCQkvKiBJZ25vcmUgc2VjdGlvbiBhc3NvY2lhdGVkIHNlY3Rp
b25zICovCisJCWlmIChzeW0tPnR5cGUgPT0gU1RUX1NFQ1RJT04pCisJCQljb250aW51ZTsKKwkJ
aWYgKHN5bS0+c2VjLT5pbmRleCA9PSBzZWMtPmluZGV4KQorCQkJcmV0dXJuIHRydWU7CisJfQor
CisJcmV0dXJuIGZhbHNlOworfQorCiAvKiByZXR1cm5zIHRoZSBvZmZzZXQgb2YgdGhlIHN0cmlu
ZyBpbiB0aGUgc3RyaW5nIHRhYmxlICovCiBpbnQgb2Zmc2V0X29mX3N0cmluZyhzdHJ1Y3QgbGlz
dF9oZWFkICpsaXN0LCBjaGFyICpuYW1lKQogewpkaWZmIC0tZ2l0IGEvY29tbW9uLmggYi9jb21t
b24uaAppbmRleCBjZGE2OTBkLi4wNmUxOWU3IDEwMDY0NAotLS0gYS9jb21tb24uaAorKysgYi9j
b21tb24uaApAQCAtMTUxLDYgKzE1MSw4IEBAIGludCBpc190ZXh0X3NlY3Rpb24oc3RydWN0IHNl
Y3Rpb24gKnNlYyk7CiBpbnQgaXNfZGVidWdfc2VjdGlvbihzdHJ1Y3Qgc2VjdGlvbiAqc2VjKTsK
IGludCBpc19yZWxhX3NlY3Rpb24oc3RydWN0IHNlY3Rpb24gKnNlYyk7CiBpbnQgaXNfc3RhbmRh
cmRfc2VjdGlvbihzdHJ1Y3Qgc2VjdGlvbiAqc2VjKTsKK2ludCBpc19yZWZlcmVuY2VkX3NlY3Rp
b24oY29uc3Qgc3RydWN0IHNlY3Rpb24gKnNlYywKKwkJCSAgY29uc3Qgc3RydWN0IGtwYXRjaF9l
bGYgKmtlbGYpOwogaW50IGlzX2xvY2FsX3N5bShzdHJ1Y3Qgc3ltYm9sICpzeW0pOwogCiB2b2lk
IHJlbGFfaW5zbihzdHJ1Y3Qgc2VjdGlvbiAqc2VjLCBzdHJ1Y3QgcmVsYSAqcmVsYSwgc3RydWN0
IGluc24gKmluc24pOwotLSAKMi4xNi41CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdl
cm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5n
OiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJhZ2VuIGFtIEFtdHNn
ZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0
LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
