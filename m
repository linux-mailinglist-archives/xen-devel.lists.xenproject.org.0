Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D127284ABC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 13:35:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvKBN-0001xv-Qw; Wed, 07 Aug 2019 11:32:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4Flz=WD=amazon.de=prvs=115546d28=wipawel@srs-us1.protection.inumbo.net>)
 id 1hvKBM-0001xq-82
 for xen-devel@lists.xen.org; Wed, 07 Aug 2019 11:32:40 +0000
X-Inumbo-ID: 0f83928e-b907-11e9-9c35-0f0d476548fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f83928e-b907-11e9-9c35-0f0d476548fa;
 Wed, 07 Aug 2019 11:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1565177559; x=1596713559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=H7icvKm2pSSMMeV2NPmMrQxPbsW2XsLifMKx2xY4NwM=;
 b=RWl67GGIaYTnpAQmGqiEzerB3kgZ2nj4kisz2Fv1UZ1ZlMiGJacl1yhl
 Seah0abl/6NLaQ7KPGtZUA1szVPYPI7kYt8PATRhO19jAcD7NVBedsKlG
 UmJOv+14d7deK7Oh8daSedobWi28TvOH1Q5mN60IIko7q9Hnv3FqngB+G 4=;
X-IronPort-AV: E=Sophos;i="5.64,357,1559520000"; d="scan'208";a="745591285"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-8549039f.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 07 Aug 2019 11:32:37 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-8549039f.us-west-2.amazon.com (Postfix) with ESMTPS
 id E7396A2738; Wed,  7 Aug 2019 11:32:36 +0000 (UTC)
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 7 Aug 2019 11:32:36 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 7 Aug 2019 11:32:35 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 7 Aug 2019 11:32:34 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 7 Aug 2019 11:32:19 +0000
Message-ID: <20190807113219.71570-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190416120716.26269-1-wipawel@amazon.de>
References: <20190416120716.26269-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [livepatch-build-tools part2 v2 1/6] common: Add
 is_standard_section() helper function
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: mpohlack@amazon.de, ross.lagerwall@citrix.com,
 Pawel Wieczorkiewicz <wipawel@amazon.de>, konrad.wilk@oracle.com
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
UmV2aWV3ZWQtYnk6IE5vcmJlcnQgTWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgotLS0KdjI6
CiogS2VlcCBsaW5lcyB0byA4MCBjaGFycwotLS0KIGNvbW1vbi5jICAgICAgICAgICAgIHwgMTIg
KysrKysrKysrKysrCiBjb21tb24uaCAgICAgICAgICAgICB8ICAxICsKIGNyZWF0ZS1kaWZmLW9i
amVjdC5jIHwgIDQgKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NvbW1vbi5jIGIvY29tbW9uLmMKaW5kZXggYmM2Mzk1
NS4uMWZiMDdjYiAxMDA2NDQKLS0tIGEvY29tbW9uLmMKKysrIGIvY29tbW9uLmMKQEAgLTUsNiAr
NSw3IEBACiAjaW5jbHVkZSA8c3lzL3N0YXQuaD4KICNpbmNsdWRlIDxmY250bC5oPgogI2luY2x1
ZGUgPHVuaXN0ZC5oPgorI2luY2x1ZGUgPHN0ZGJvb2wuaD4KICNpbmNsdWRlIDxnZWxmLmg+CiAK
ICNpbmNsdWRlICJsaXN0LmgiCkBAIC0yNTgsNiArMjU5LDE3IEBAIGludCBpc19kZWJ1Z19zZWN0
aW9uKHN0cnVjdCBzZWN0aW9uICpzZWMpCiAJcmV0dXJuICFzdHJuY21wKG5hbWUsICIuZGVidWdf
IiwgNyk7CiB9CiAKK2ludCBpc19zdGFuZGFyZF9zZWN0aW9uKHN0cnVjdCBzZWN0aW9uICpzZWMp
Cit7CisJc3dpdGNoIChzZWMtPnNoLnNoX3R5cGUpIHsKKwljYXNlIFNIVF9TVFJUQUI6CisJY2Fz
ZSBTSFRfU1lNVEFCOgorCQlyZXR1cm4gdHJ1ZTsKKwlkZWZhdWx0OgorCQlyZXR1cm4gZmFsc2U7
CisJfQorfQorCiAvKiByZXR1cm5zIHRoZSBvZmZzZXQgb2YgdGhlIHN0cmluZyBpbiB0aGUgc3Ry
aW5nIHRhYmxlICovCiBpbnQgb2Zmc2V0X29mX3N0cmluZyhzdHJ1Y3QgbGlzdF9oZWFkICpsaXN0
LCBjaGFyICpuYW1lKQogewpkaWZmIC0tZ2l0IGEvY29tbW9uLmggYi9jb21tb24uaAppbmRleCA3
NTk5ZmU3Li5jZGE2OTBkIDEwMDY0NAotLS0gYS9jb21tb24uaAorKysgYi9jb21tb24uaApAQCAt
MTUwLDYgKzE1MCw3IEBAIHN0cnVjdCBzeW1ib2wgKmZpbmRfc3ltYm9sX2J5X25hbWUoc3RydWN0
IGxpc3RfaGVhZCAqbGlzdCwgY29uc3QgY2hhciAqbmFtZSk7CiBpbnQgaXNfdGV4dF9zZWN0aW9u
KHN0cnVjdCBzZWN0aW9uICpzZWMpOwogaW50IGlzX2RlYnVnX3NlY3Rpb24oc3RydWN0IHNlY3Rp
b24gKnNlYyk7CiBpbnQgaXNfcmVsYV9zZWN0aW9uKHN0cnVjdCBzZWN0aW9uICpzZWMpOworaW50
IGlzX3N0YW5kYXJkX3NlY3Rpb24oc3RydWN0IHNlY3Rpb24gKnNlYyk7CiBpbnQgaXNfbG9jYWxf
c3ltKHN0cnVjdCBzeW1ib2wgKnN5bSk7CiAKIHZvaWQgcmVsYV9pbnNuKHN0cnVjdCBzZWN0aW9u
ICpzZWMsIHN0cnVjdCByZWxhICpyZWxhLCBzdHJ1Y3QgaW5zbiAqaW5zbik7CmRpZmYgLS1naXQg
YS9jcmVhdGUtZGlmZi1vYmplY3QuYyBiL2NyZWF0ZS1kaWZmLW9iamVjdC5jCmluZGV4IDgyZjc3
N2UuLjQ2OTliYTAgMTAwNjQ0Ci0tLSBhL2NyZWF0ZS1kaWZmLW9iamVjdC5jCisrKyBiL2NyZWF0
ZS1kaWZmLW9iamVjdC5jCkBAIC0xMjc4LDkgKzEyNzgsNyBAQCBzdGF0aWMgdm9pZCBrcGF0Y2hf
aW5jbHVkZV9zdGFuZGFyZF9lbGVtZW50cyhzdHJ1Y3Qga3BhdGNoX2VsZiAqa2VsZikKIAogCWxp
c3RfZm9yX2VhY2hfZW50cnkoc2VjLCAma2VsZi0+c2VjdGlvbnMsIGxpc3QpIHsKIAkJLyogaW5j
bHVkZSB0aGVzZSBzZWN0aW9ucyBldmVuIGlmIHRoZXkgaGF2ZW4ndCBjaGFuZ2VkICovCi0JCWlm
ICghc3RyY21wKHNlYy0+bmFtZSwgIi5zaHN0cnRhYiIpIHx8Ci0JCSAgICAhc3RyY21wKHNlYy0+
bmFtZSwgIi5zdHJ0YWIiKSB8fAotCQkgICAgIXN0cmNtcChzZWMtPm5hbWUsICIuc3ltdGFiIikg
fHwKKwkJaWYgKGlzX3N0YW5kYXJkX3NlY3Rpb24oc2VjKSB8fAogCQkgICAgc2hvdWxkX2luY2x1
ZGVfc3RyX3NlY3Rpb24oc2VjLT5uYW1lKSkgewogCQkJc2VjLT5pbmNsdWRlID0gMTsKIAkJCWlm
IChzZWMtPnNlY3N5bSkKLS0gCjIuMTYuNQoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBH
ZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVu
ZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBhbSBBbXRz
Z2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVz
dC1JRDogREUgMjg5IDIzNyA4NzkKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
