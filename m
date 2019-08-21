Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9958497228
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 08:17:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0JtH-0003vD-KX; Wed, 21 Aug 2019 06:14:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9TMJ=WR=wdc.com=prvs=12921afdb=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1i0JtG-0003v0-6D
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 06:14:38 +0000
X-Inumbo-ID: f3710142-c3da-11e9-8980-bc764e2007e4
Received: from esa3.hgst.iphmx.com (unknown [216.71.153.141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3710142-c3da-11e9-8980-bc764e2007e4;
 Wed, 21 Aug 2019 06:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566368077; x=1597904077;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=YxWj03mIGVcVbYKOln1UBPzCaYS0qRuFrw+e6W6O8fU=;
 b=AZq4qqFDmj2jz1DIlP2elmhJ736U9W2peFNz8VKlgCvLF8ycI63NWZlr
 gYvJsAo1RQrNmsNaaT0CgMN/B+/ohPuOzBhyFXvPKAIIwUSQLWuQJwR0f
 Y/+yOCvQymDLq5nP8WvRz0UFo2vzdj4zcv7tdLoIeP2idEAEPk19Q3pOJ
 7JCe5dCOextv/kDlC74d3EmubmAcog3AKenLBh8Cu5dy2ZjDM0RGyRSdV
 nZPsWKjILbDBvlHO4r8eV88uchGhr1c5c0HR6hTR8E4cYBTzqoL5IKFz4
 KIEuqPtaLnPM3SzZmXpfmp1Etaz24exSrO/RyPOLkrnkGtYrH6fHb223T A==;
IronPort-SDR: MsVv/qeZcm0Ji7q/gXpc8i8DrO4rLySfr10vSgP4QDJmywDnNcKBffT7L2ZXxZZF22syJhmP5K
 MpVRCjXzaLyhFX3cWqzhFCin3j0PTltnF1d7LKKRT7nGeLdeVY8WUM2yCPmgQdTvcmnZnGrb+c
 OCt4xfDYQfh8Fa40IxHIWIrleRpHenhUlYu+eBfok9ujiM+9o9TxQsrP48AfRYuONwZ/sNOmz/
 rbENHQJRwQ1Mwzdur4sW9iMl5w8ykeP7zZU3ibTw61pODMurc1aAyOXupw9X1Z6LawmcokEkg9
 J4E=
X-IronPort-AV: E=Sophos;i="5.64,411,1559491200"; d="scan'208";a="120898331"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Aug 2019 14:14:34 +0800
IronPort-SDR: /x2WVFwhMssmG4YuCAUPOp71T5HaHEph5tsmSLnrIS/8Bft81w+S9EdUz8hkKcgQ4RwvHBfV06
 CEq9lj4emOc45f/Aqmjf/tMfzXXi4VrHzVqsnm9DFb0vhCF4bKTz6OtrdyRnev4N/SVu16R0Ng
 2Ww5YvZ/Rm0A/gZ5+0h8ZgcoF3X8neHkPY4zJtlJgsHJaRsfDrxvZ1PWkNG/VxczvKQqtzov2r
 a1bp/ktFheMqrgprUoWcnlNajrOc9mEZ8KUXo0/ggb/H+5ziMiKSulnIvlgu4Uh7U3Hwl+4iPP
 WZBK2JRLl6EFhz22hkPsvVwz
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 23:11:54 -0700
IronPort-SDR: J1I/5bgiTFIAu8nNl9kv6CSGMFr4yg0TlUcqLzMJdDy8EZZg8n4rfy/XPfR/JjpgmOnfkVltBx
 ssjiOGwNssK5XXLGHSuoQGzY72APilAq4AuufFX7XHX3TUf6fMAFSvIG+S4BOIvcE8H6g4FFk4
 w6w8aEGbtPr28z7XjcaeIOJwLHNeebOJOnfEd1HlWA5+RnjTkgiUj/gkJ7B08lWbk1QlQ2RUaA
 iYA9zikhwLYCTW/T6a0mIofhJVPKp5ODf79l+YclGUXbyljEgCoXjsbem9ACoYAnj3ly4+ysyD
 mtk=
WDCIronportException: Internal
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip01.wdc.com with ESMTP; 20 Aug 2019 23:14:32 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Tue, 20 Aug 2019 23:14:15 -0700
Message-Id: <20190821061423.3408-2-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
References: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
Subject: [Xen-devel] [PATCH V5 1/9] block: add a helper function to read
 nr_setcs
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

VGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGhlbHBlciBmdW5jdGlvbiB0byByZWFkIHRoZSBudW1iZXIg
b2Ygc2VjdG9ycwpmcm9tIHN0cnVjdCBibG9ja19kZXZpY2UtPmJkX3BhcnQgbWVtYmVyLiBGb3Ig
bW9yZSBkZXRhaWxzIFBsZWFzZSByZWZlcgp0byB0aGUgY29tbWVudCBpbiB0aGUgaW5jbHVkZS9s
aW51eC9nZW5oZC5oIGZvciBwYXJ0X25yX3NlY3RzX3JlYWQoKS4KClJldmlld2VkLWJ5OiBNaW53
b28gSW0gPG1pbndvby5pbS5kZXZAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogTWFydGluIEsuIFBl
dGVyc2VuIDxtYXJ0aW4ucGV0ZXJzZW5AeHh4eHh4eHh4eD4KU2lnbmVkLW9mZi1ieTogQ2hhaXRh
bnlhIEt1bGthcm5pIDxjaGFpdGFueWEua3Vsa2FybmlAd2RjLmNvbT4KLS0tCiBpbmNsdWRlL2xp
bnV4L2Jsa2Rldi5oIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvYmxrZGV2LmggYi9pbmNsdWRlL2xpbnV4L2Jsa2Rl
di5oCmluZGV4IDQ3OThiYjI1ZjFlZS4uYWE1ODAxYzhmZjczIDEwMDY0NAotLS0gYS9pbmNsdWRl
L2xpbnV4L2Jsa2Rldi5oCisrKyBiL2luY2x1ZGUvbGludXgvYmxrZGV2LmgKQEAgLTE0NjgsNiAr
MTQ2OCwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcHV0X2Rldl9zZWN0b3IoU2VjdG9yIHApCiAJ
cHV0X3BhZ2UocC52KTsKIH0KIAorc3RhdGljIGlubGluZSBzZWN0b3JfdCBiZGV2X25yX3NlY3Rz
KHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYpCit7CisJcmV0dXJuIHBhcnRfbnJfc2VjdHNfcmVh
ZChiZGV2LT5iZF9wYXJ0KTsKK30KKwogaW50IGtibG9ja2Rfc2NoZWR1bGVfd29yayhzdHJ1Y3Qg
d29ya19zdHJ1Y3QgKndvcmspOwogaW50IGtibG9ja2Rfc2NoZWR1bGVfd29ya19vbihpbnQgY3B1
LCBzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspOwogaW50IGtibG9ja2RfbW9kX2RlbGF5ZWRfd29y
a19vbihpbnQgY3B1LCBzdHJ1Y3QgZGVsYXllZF93b3JrICpkd29yaywgdW5zaWduZWQgbG9uZyBk
ZWxheSk7Ci0tIAoyLjE3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
