Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84098628B8
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 20:50:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkYg0-0005AC-Oc; Mon, 08 Jul 2019 18:47:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Un8F=VF=wdc.com=prvs=0852429f4=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hkYfy-00059Z-Uu
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 18:47:46 +0000
X-Inumbo-ID: dfe17113-a1b0-11e9-8980-bc764e045a96
Received: from esa5.hgst.iphmx.com (unknown [216.71.153.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dfe17113-a1b0-11e9-8980-bc764e045a96;
 Mon, 08 Jul 2019 18:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562611665; x=1594147665;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=fBeS4/ZwqvDjhy1b8MtLdfBATaR+YEkh8G8mPyvIJT0=;
 b=H4yH1nR1e4FzfyMqUhn9gSo/grI2RcPhhLtoTLWkMhowaMtG/Xksx8K0
 5IgBuvKCOKWn4sgYdkYzexAzy+CRov5uAXi0q1GkzElzFSUhLnfnJNQWT
 8x9Hos0ylDN1Oxq9k+M53PkfbcnEzdBz6O7/JmmTPqGmy0RvnQEwpwA/Y
 idg408KqoTjbijb9dTY7CMvNNby/0NaPTYQ6LTvtg1P+mIRrbdVSkNklz
 dDFu+kgJ85ybazBYM3pYn7Nvhf/sooq4y9HhXoB+1IpCks3MF72EKnmPv
 2wMqauqxVlNehhM8wDSyvgHqoQjKuJHgDSvj0ukKfT/ApL57wXfS3LyKN g==;
IronPort-SDR: wneg7Bk451byGpWEZbMg3ObYJTGxk9OTNwnto/dC3xiuxGdpKt4sX7cHUdGYvj9uY1tbUyOTm/
 TkTXEdn31Ar5Wa02s2c/Xv2fMvVQllr7J/3lMZPtIIBQpCcToMEciiUl5Idq6gmfQmUok+mkiE
 24RXc+Gsbbfq/42YImMfh71YSPactg4P5PZ0PrSTQQ4AuOmMovK91feddWW4CS5HYb1NDeSlOI
 WC9b8/7wEe55rec12HxMxufjWlMBVwClfuPmknG6zYRVL50Dpgqa4rMOUxZE8s0UlTmCM4f9kV
 xDM=
X-IronPort-AV: E=Sophos;i="5.63,466,1557158400"; d="scan'208";a="113649385"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2019 02:47:45 +0800
IronPort-SDR: ee3NC6WIyp0G6cd8lL6QJLGpRFQW6WF6UUXG7jzzqsIBOdlh/hTJaOsULj3rsnChun1X/34Z1G
 UrG4O3YY726D9zEjnvs1p8DgSOl5vUjjGKp5wUXdCgt50+IuNp51gbkcCW+NJAYeJasX85/SFL
 1tLN9yRBr6eonxG+Yxi1cUcpDuIa9mSho0Qg38ofDc8VG0c1roQnjOXxmJt9pFdlF0CIWPyUBP
 jFbaejYtNepih/RyC8Q9lNBMp7dx+R5dJZmO1+RpOGFlAKQOXts3JilydBls6FKi5mbLfCbyNR
 41/jL4X3CUj5wyex3gO2aqZM
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 08 Jul 2019 11:46:33 -0700
IronPort-SDR: mSzQo+wfNgERgCVFud7JBTp2NieFcrt7EnGnb+zRa7q9bK08hCzDg+CJfwLIldFz0pOGFDaOKS
 V6OLvb+6LzgoSZ8fb06fYk117r61T/uhgntkoprDYN+CpfYFFy8Z4K5aL8MlfWEEC7slAkAebQ
 RzEUF6LpJ2Fl9VRSOL/l7pBDwfnAJvdasZYCjnUsGlYv9bAJsIIK6krklHTnNtryjtwKwmHIup
 TcdxBUboya/h4ldKo3V5LNG4gKVzAq1Ws/lBSg2Eets7EHoT7i8XMvEDqQtXp9sqLszOkgy8Ka
 Yhc=
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jul 2019 11:47:44 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Mon,  8 Jul 2019 11:47:07 -0700
Message-Id: <20190708184711.2984-6-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
References: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
Subject: [Xen-devel] [PATCH V4 5/9] bcache: update cached_dev_init() with
 helper
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

SW4gdGhlIGJjYWNoZSB3aGVuIGluaXRpYWxpemluZyB0aGUgY2FjaGVkIGRldmljZSB3ZSBkb24n
dCBhY3R1YWxseQp1c2UgYW55IHNvcnQgb2YgbG9ja2luZyB3aGVuIHJlYWRpbmcgdGhlIG51bWJl
ciBvZiBzZWN0b3JzIGZyb20gdGhlCnBhcnQuIFRoaXMgcGF0Y2ggdXBkYXRlcyB0aGUgY2FjaGVk
X2Rldl9pbml0KCkgd2l0aCBuZXdseSBpbnRyb2R1Y2VkCmhlbHBlciBmdW5jdGlvbiB0byByZWFk
IHRoZSBucl9zZWN0cyBmcm9tIGJsb2NrIGRldmljZSdzIGhkX3BhcnRzIHdpdGgKdGhlIGhlbHAg
b2YgcGFydF9ucl9zZWN0c19yZWFkKCkuCgpBY2tlZC1ieTogQ29seSBMaSA8Y29seWxpQHN1c2Uu
ZGU+ClNpZ25lZC1vZmYtYnk6IENoYWl0YW55YSBLdWxrYXJuaSA8Y2hhaXRhbnlhLmt1bGthcm5p
QHdkYy5jb20+Ci0tLQogZHJpdmVycy9tZC9iY2FjaGUvc3VwZXIuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWQvYmNhY2hlL3N1cGVyLmMgYi9kcml2ZXJzL21kL2JjYWNoZS9zdXBlci5jCmluZGV4IDI2
ZTM3NGZiZjU3Yy4uMDI0YzUyZDExYjBmIDEwMDY0NAotLS0gYS9kcml2ZXJzL21kL2JjYWNoZS9z
dXBlci5jCisrKyBiL2RyaXZlcnMvbWQvYmNhY2hlL3N1cGVyLmMKQEAgLTEzMDIsNyArMTMwMiw3
IEBAIHN0YXRpYyBpbnQgY2FjaGVkX2Rldl9pbml0KHN0cnVjdCBjYWNoZWRfZGV2ICpkYywgdW5z
aWduZWQgaW50IGJsb2NrX3NpemUpCiAJCQlxLT5saW1pdHMucmFpZF9wYXJ0aWFsX3N0cmlwZXNf
ZXhwZW5zaXZlOwogCiAJcmV0ID0gYmNhY2hlX2RldmljZV9pbml0KCZkYy0+ZGlzaywgYmxvY2tf
c2l6ZSwKLQkJCSBkYy0+YmRldi0+YmRfcGFydC0+bnJfc2VjdHMgLSBkYy0+c2IuZGF0YV9vZmZz
ZXQpOworCQkJIGJkZXZfbnJfc2VjdHMoZGMtPmJkZXYpIC0gZGMtPnNiLmRhdGFfb2Zmc2V0KTsK
IAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0tIAoyLjE3LjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
