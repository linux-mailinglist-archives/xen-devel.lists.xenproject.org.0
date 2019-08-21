Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F2797223
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 08:17:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0JtS-0003xY-Ue; Wed, 21 Aug 2019 06:14:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9TMJ=WR=wdc.com=prvs=12921afdb=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1i0JtR-0003xJ-ND
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 06:14:49 +0000
X-Inumbo-ID: f9fbab8e-c3da-11e9-8980-bc764e2007e4
Received: from esa1.hgst.iphmx.com (unknown [68.232.141.245])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9fbab8e-c3da-11e9-8980-bc764e2007e4;
 Wed, 21 Aug 2019 06:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566368088; x=1597904088;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=fAftc0jXLF+PYgBKMR7sJr2letplG8FiARgg+iOt4Mk=;
 b=kOEkZG8s4DslUbNnuq6fEsITInDsbekOalx3uxL6EHbIusecf7sgQ9+i
 GJsyAXnnudLERdFZd0NY1e1hpcWWpcTdIytR/frtwiHK2TIXAFjtglcrF
 2eUckx5FcNbJFIpwXy+4ZljKjYwrMWNEa8OMBylTNu/lx9nzE9tNvVRAC
 oPXGzUe5MakxXEQ8FbiqkGWGS314xD4DnwZT3A2MIySTmUYFHrhPy1AvS
 Od7EvnWiPEgvOlGk6XtnLFuTeAFIM5Q6wHbioMeos9NW5fEvbRMDFf+gw
 KN98zCQY5PV1Uk3auepW89Zd0z6jRcR/iAwse6ORjN+nBwgOiO2ixEF3j w==;
IronPort-SDR: FVb9DtIC19fDSWK5eoeMb2oYg3TR4U/0Y6UWJDtJJX709E8VgETEkLdtlmL7EiLBVgrSQA+O0X
 VSrhyqpkfDAQsCqNI7gzMnoSlnn3lc0i3cxQFg91mVX+/9vHIuIdgfVw+K4a3pxV0tB3izP3wO
 QVYxAv+QD6v9MmNW0xOmtxtzoEQFeLjjA6QV5Zo6iAR7RAC9sduUh7g7b8dIZHcfKFpzr0fHo0
 qjfwbKcKx46A8LoASCCF/ao6ecTD6uqWveLSuvFgx4lXYN1ex1xO0Da3mLGksy1HBdbPm+mfnh
 hX4=
X-IronPort-AV: E=Sophos;i="5.64,411,1559491200"; d="scan'208";a="222880789"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Aug 2019 14:14:47 +0800
IronPort-SDR: Q/VIHExfI1uKQGKfaJkPgo0rKRmbxh733orgHp6u5yWTFppE49jVGqKIFWmysrOWU8ppRyelZB
 3zseTYVTqUeHetjuS6iRfZVZPF8n5SWWK/jZ4qNvqBJi75+H9q1a6fk8/TFWYbcY6VqyV7unzk
 fj5wQgtpL1U8BSTRr1EcFy3Y1F3FhxGmH5Oc1uuut5MybWp8RVFfZm0MbHgvP8Gc7To2dXtkM2
 5dvYmC3rva7Rkcbp8DXWG8JN6/u558nKXENCMv2OjDlx2+kO+g5sQeahHavZ1WZvQ2tRhV/3uB
 7FqZVX+tW62v3io5Hfw/zSO0
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 23:12:09 -0700
IronPort-SDR: 5VdlNZVMNPdB4YJKi8PvEuaTgpLYyJfh2G/rBJ/AFXXZQlCBvtiNoYa7ESeeEq6JoKhDakQyQ3
 bzj4rf3rS5gKcHvy0LSRr1h325MA8E4vMf0unZpmXiHbj6LGx2U6Y9bgmSHdFLKdRjPf4RGA9+
 HwIzbBlZS6rNLPIocY2VAP2a1yR7H1bp99zjaHM6EqIEWm1ysT1yq9XJYu1XdiXk7/3pAgpb4V
 uRKAxSzSii+HX5bHYsNUptuuDX0oQ0jdvrOp+F5m95Slc4aGqzUCOtNlfEJhQ7uyeuvqUB4rIT
 KXg=
WDCIronportException: Internal
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip01.wdc.com with ESMTP; 20 Aug 2019 23:14:47 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Tue, 20 Aug 2019 23:14:17 -0700
Message-Id: <20190821061423.3408-4-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
References: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
Subject: [Xen-devel] [PATCH V5 3/9] blk-zoned: update blkdev_report_zone()
 with helper
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
Cc: damien.lemoal@wdc.com, linux-btrace@vger.kernel.org, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, konrad.wilk@oracle.com,
 Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>, yuchao0@huawei.com,
 colyli@suse.de, linux-bcache@vger.kernel.org, jaegeuk@kernel.org,
 xen-devel@lists.xenproject.org, kent.overstreet@gmail.com,
 roger.pau@citrix.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCB1cGRhdGVzIHRoZSBibGtkZXZfcmVwb3J0X3pvbmUocykoKSB3aXRoIG5ld2x5
IGludHJvZHVjZWQKaGVscGVyIGZ1bmN0aW9uIHRvIHJlYWQgdGhlIG5yX3NlY3RzIGZyb20gYmxv
Y2sgZGV2aWNlJ3MgaGRfcGFydHMgd2l0aAp0aGUgaGVscCBvZiBwYXJ0X25yX3NlY3RzX3JlYWQo
KS4KClJldmlld2VkLWJ5OiBNaW53b28gSW0gPG1pbndvby5pbS5kZXZAZ21haWwuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBDaGFpdGFueWEgS3Vsa2FybmkgPGNoYWl0YW55YS5rdWxrYXJuaUB3ZGMuY29t
PgotLS0KIGJsb2NrL2Jsay16b25lZC5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYmxvY2svYmxrLXpvbmVk
LmMgYi9ibG9jay9ibGstem9uZWQuYwppbmRleCAzZjVlOWJmMDM0ODYuLjdlMGMwYjU0ZDE5NCAx
MDA2NDQKLS0tIGEvYmxvY2svYmxrLXpvbmVkLmMKKysrIGIvYmxvY2svYmxrLXpvbmVkLmMKQEAg
LTEwOSw3ICsxMDksNyBAQCBzdGF0aWMgYm9vbCBibGtkZXZfcmVwb3J0X3pvbmUoc3RydWN0IGJs
b2NrX2RldmljZSAqYmRldiwgc3RydWN0IGJsa196b25lICpyZXApCiAJCXJldHVybiBmYWxzZTsK
IAogCXJlcC0+c3RhcnQgLT0gb2Zmc2V0OwotCWlmIChyZXAtPnN0YXJ0ICsgcmVwLT5sZW4gPiBi
ZGV2LT5iZF9wYXJ0LT5ucl9zZWN0cykKKwlpZiAocmVwLT5zdGFydCArIHJlcC0+bGVuID4gYmRl
dl9ucl9zZWN0cyhiZGV2KSkKIAkJcmV0dXJuIGZhbHNlOwogCiAJaWYgKHJlcC0+dHlwZSA9PSBC
TEtfWk9ORV9UWVBFX0NPTlZFTlRJT05BTCkKQEAgLTE3OCwxMyArMTc4LDEzIEBAIGludCBibGtk
ZXZfcmVwb3J0X3pvbmVzKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsIHNlY3Rvcl90IHNlY3Rv
ciwKIAlpZiAoV0FSTl9PTl9PTkNFKCFiZGV2LT5iZF9kaXNrLT5mb3BzLT5yZXBvcnRfem9uZXMp
KQogCQlyZXR1cm4gLUVPUE5PVFNVUFA7CiAKLQlpZiAoISpucl96b25lcyB8fCBzZWN0b3IgPj0g
YmRldi0+YmRfcGFydC0+bnJfc2VjdHMpIHsKKwlpZiAoISpucl96b25lcyB8fCBzZWN0b3IgPj0g
YmRldl9ucl9zZWN0cyhiZGV2KSkgewogCQkqbnJfem9uZXMgPSAwOwogCQlyZXR1cm4gMDsKIAl9
CiAKIAlucnogPSBtaW4oKm5yX3pvbmVzLAotCQkgIF9fYmxrZGV2X25yX3pvbmVzKHEsIGJkZXYt
PmJkX3BhcnQtPm5yX3NlY3RzIC0gc2VjdG9yKSk7CisJCSAgX19ibGtkZXZfbnJfem9uZXMocSwg
YmRldl9ucl9zZWN0cyhiZGV2KSAtIHNlY3RvcikpOwogCXJldCA9IGJsa19yZXBvcnRfem9uZXMo
YmRldi0+YmRfZGlzaywgZ2V0X3N0YXJ0X3NlY3QoYmRldikgKyBzZWN0b3IsCiAJCQkgICAgICAg
em9uZXMsICZucnopOwogCWlmIChyZXQpCi0tIAoyLjE3LjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
