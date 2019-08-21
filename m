Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2460974BD
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:23:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0LsE-0001T0-LQ; Wed, 21 Aug 2019 08:21:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0LsC-0001PS-Ao
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 08:21:40 +0000
X-Inumbo-ID: ade9578e-c3ec-11e9-adc2-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ade9578e-c3ec-11e9-adc2-12813bfff9fa;
 Wed, 21 Aug 2019 08:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566375690; x=1597911690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=SpnBPboP1CnYCqUkqCRpzA3Mo3QOK41CZ1FNd6HCGVo=;
 b=IGx22fe8Zk3HTWW4P/d6J3x5EMTKblXM7F1Mdl4jrs8/I1YN7TjlIRm5
 SugpMlaW+AosAXhmfdeXaiN1j5ruIhM6yo8YPldw6vMVnyxI7g8JTBmaQ
 dd79waonKKSggHCbG/SnSj3/9Lzttpfjc4yGVPVjShM0nx8drEQe4FVwk k=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="410765145"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 21 Aug 2019 08:21:29 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id 65D53A1F4A; Wed, 21 Aug 2019 08:21:29 +0000 (UTC)
Received: from EX13D03EUA004.ant.amazon.com (10.43.165.93) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:14 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D03EUA004.ant.amazon.com (10.43.165.93) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:13 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 08:21:11 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 21 Aug 2019 08:20:41 +0000
Message-ID: <20190821082056.91090-6-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190821082056.91090-1-wipawel@amazon.de>
References: <20190821082056.91090-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 05/20] common: Add is_standard_section() helper
 function
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

RGV0ZWN0IHN0YW5kYXJkIChhbHdheXMgdG8gYmUgaW5jbHVkZWQpIHNlY3Rpb25zIHZpYSB0aGVp
ciBzZWN0aW9uCmhlYWRlciB0eXBlLiBUaGUgc3RhbmRhcmQgc2VjdGlvbnM6ICIuc2hzdHJ0YWIi
LCAiLnN5bXRhYiIsICIuc3RydGFiIgphcmUgZWl0aGVyIG9mIHR5cGUgU0hUX1NZTVRBQiBvciBT
SFRfU1RSVEFCLgoKU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxA
YW1hem9uLmRlPgpSZXZpZXdlZC1ieTogQW5kcmEtSXJpbmEgUGFyYXNjaGl2IDxhbmRyYXByc0Bh
bWF6b24uY29tPgpSZXZpZXdlZC1ieTogQmpvZXJuIERvZWJlbCA8ZG9lYmVsQGFtYXpvbi5kZT4K
UmV2aWV3ZWQtYnk6IE5vcmJlcnQgTWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgpSZXZpZXdl
ZC1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+Ci0tLQogY29t
bW9uLmMgICAgICAgICAgICAgfCAxMiArKysrKysrKysrKysKIGNvbW1vbi5oICAgICAgICAgICAg
IHwgIDEgKwogY3JlYXRlLWRpZmYtb2JqZWN0LmMgfCAgNCArLS0tCiAzIGZpbGVzIGNoYW5nZWQs
IDE0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvY29tbW9uLmMg
Yi9jb21tb24uYwppbmRleCBiYzYzOTU1Li4xZmIwN2NiIDEwMDY0NAotLS0gYS9jb21tb24uYwor
KysgYi9jb21tb24uYwpAQCAtNSw2ICs1LDcgQEAKICNpbmNsdWRlIDxzeXMvc3RhdC5oPgogI2lu
Y2x1ZGUgPGZjbnRsLmg+CiAjaW5jbHVkZSA8dW5pc3RkLmg+CisjaW5jbHVkZSA8c3RkYm9vbC5o
PgogI2luY2x1ZGUgPGdlbGYuaD4KIAogI2luY2x1ZGUgImxpc3QuaCIKQEAgLTI1OCw2ICsyNTks
MTcgQEAgaW50IGlzX2RlYnVnX3NlY3Rpb24oc3RydWN0IHNlY3Rpb24gKnNlYykKIAlyZXR1cm4g
IXN0cm5jbXAobmFtZSwgIi5kZWJ1Z18iLCA3KTsKIH0KIAoraW50IGlzX3N0YW5kYXJkX3NlY3Rp
b24oc3RydWN0IHNlY3Rpb24gKnNlYykKK3sKKwlzd2l0Y2ggKHNlYy0+c2guc2hfdHlwZSkgewor
CWNhc2UgU0hUX1NUUlRBQjoKKwljYXNlIFNIVF9TWU1UQUI6CisJCXJldHVybiB0cnVlOworCWRl
ZmF1bHQ6CisJCXJldHVybiBmYWxzZTsKKwl9Cit9CisKIC8qIHJldHVybnMgdGhlIG9mZnNldCBv
ZiB0aGUgc3RyaW5nIGluIHRoZSBzdHJpbmcgdGFibGUgKi8KIGludCBvZmZzZXRfb2Zfc3RyaW5n
KHN0cnVjdCBsaXN0X2hlYWQgKmxpc3QsIGNoYXIgKm5hbWUpCiB7CmRpZmYgLS1naXQgYS9jb21t
b24uaCBiL2NvbW1vbi5oCmluZGV4IDc1OTlmZTcuLmNkYTY5MGQgMTAwNjQ0Ci0tLSBhL2NvbW1v
bi5oCisrKyBiL2NvbW1vbi5oCkBAIC0xNTAsNiArMTUwLDcgQEAgc3RydWN0IHN5bWJvbCAqZmlu
ZF9zeW1ib2xfYnlfbmFtZShzdHJ1Y3QgbGlzdF9oZWFkICpsaXN0LCBjb25zdCBjaGFyICpuYW1l
KTsKIGludCBpc190ZXh0X3NlY3Rpb24oc3RydWN0IHNlY3Rpb24gKnNlYyk7CiBpbnQgaXNfZGVi
dWdfc2VjdGlvbihzdHJ1Y3Qgc2VjdGlvbiAqc2VjKTsKIGludCBpc19yZWxhX3NlY3Rpb24oc3Ry
dWN0IHNlY3Rpb24gKnNlYyk7CitpbnQgaXNfc3RhbmRhcmRfc2VjdGlvbihzdHJ1Y3Qgc2VjdGlv
biAqc2VjKTsKIGludCBpc19sb2NhbF9zeW0oc3RydWN0IHN5bWJvbCAqc3ltKTsKIAogdm9pZCBy
ZWxhX2luc24oc3RydWN0IHNlY3Rpb24gKnNlYywgc3RydWN0IHJlbGEgKnJlbGEsIHN0cnVjdCBp
bnNuICppbnNuKTsKZGlmZiAtLWdpdCBhL2NyZWF0ZS1kaWZmLW9iamVjdC5jIGIvY3JlYXRlLWRp
ZmYtb2JqZWN0LmMKaW5kZXggODJmNzc3ZS4uNDY5OWJhMCAxMDA2NDQKLS0tIGEvY3JlYXRlLWRp
ZmYtb2JqZWN0LmMKKysrIGIvY3JlYXRlLWRpZmYtb2JqZWN0LmMKQEAgLTEyNzgsOSArMTI3OCw3
IEBAIHN0YXRpYyB2b2lkIGtwYXRjaF9pbmNsdWRlX3N0YW5kYXJkX2VsZW1lbnRzKHN0cnVjdCBr
cGF0Y2hfZWxmICprZWxmKQogCiAJbGlzdF9mb3JfZWFjaF9lbnRyeShzZWMsICZrZWxmLT5zZWN0
aW9ucywgbGlzdCkgewogCQkvKiBpbmNsdWRlIHRoZXNlIHNlY3Rpb25zIGV2ZW4gaWYgdGhleSBo
YXZlbid0IGNoYW5nZWQgKi8KLQkJaWYgKCFzdHJjbXAoc2VjLT5uYW1lLCAiLnNoc3RydGFiIikg
fHwKLQkJICAgICFzdHJjbXAoc2VjLT5uYW1lLCAiLnN0cnRhYiIpIHx8Ci0JCSAgICAhc3RyY21w
KHNlYy0+bmFtZSwgIi5zeW10YWIiKSB8fAorCQlpZiAoaXNfc3RhbmRhcmRfc2VjdGlvbihzZWMp
IHx8CiAJCSAgICBzaG91bGRfaW5jbHVkZV9zdHJfc2VjdGlvbihzZWMtPm5hbWUpKSB7CiAJCQlz
ZWMtPmluY2x1ZGUgPSAxOwogCQkJaWYgKHNlYy0+c2Vjc3ltKQotLSAKMi4xNi41CgoKCgpBbWF6
b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBC
ZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJy
aWNoCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAx
NDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
