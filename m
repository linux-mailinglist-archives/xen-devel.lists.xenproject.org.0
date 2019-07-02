Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E8C5D59B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 19:48:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiMpe-0007ms-DK; Tue, 02 Jul 2019 17:44:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bnvP=U7=wdc.com=prvs=079d4847f=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hiMoN-0007ga-0y
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 17:43:23 +0000
X-Inumbo-ID: e25591db-9cf0-11e9-8980-bc764e045a96
Received: from esa1.hgst.iphmx.com (unknown [68.232.141.245])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e25591db-9cf0-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 17:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562089401; x=1593625401;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=0UgEtdIHm7+hH9Kxhy5WBonEw4nU5YoTIqQ0fdsN3UA=;
 b=lOcGA1qjpfFQ2aDY1c/LcEDb7gBvNxtK07AO4QrRNFDU4+HWJVi5TKco
 DBQUdFnzV535u03zhCArlKP+hKhy9LHkIxDR4yqdwYdN1MUu9jDBkXfSE
 sxrZpXjaBC9Dc+jVwzTEkqCYNkPdPerDjZK+cx2VNnGwgoDUMw4RjHV9n
 KFGoS2LE/wtnxleQ7jcYmaaPG1pp/m9kpG/1v2am2SnpsOg/13MH9pUkN
 T+piw3FMdueJzPzyuYdhWrAzzK5ykrSN/yuoxg9BgVtWJMnZOdN33mep1
 AnXF8g8TW71d/+JEmU7DxGGn2kJmxUArC3nV0ASK+mBbUZ/3OyilffVIf w==;
IronPort-SDR: Est5czJKx0ZLuLlhD46yi07ZSFqIOOrVuznzaayyAaYXxUcMtm4xBVlKVBQuckIlmIjiepGZJ9
 LJoe6P/H9jXB3LoSgcoX6s/zHmFujZ5QLKMv0h37+bIW3fOFxfoCFnbxMtipxxZ7TLIW0gRQ7g
 4L1pBqcbybkSY+c/GSIF+WDBR+IfSZ+m8gW/i6iLmPL0328u9G7ZsUZn3KrFhv74ZW8attDRKo
 RXYlVLP0hhjIAyXj0tVivoGaJ6P+4Zhg6JJrFWUNuRE95rWTAx0ZCnmgiDMqcrnyEwAmyM0Yvj
 J/o=
X-IronPort-AV: E=Sophos;i="5.63,444,1557158400"; d="scan'208";a="218460019"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2019 01:43:21 +0800
IronPort-SDR: O4vg4I65mT8nzYC/3TARPI6Zd8NKC6WLpFt2mPaPVZh+DUdDBPFfHF7KPprkts3ZH0803UEIMg
 jmJtYK4SGBGpanJsBLpluq9CMj3K71Y4q2JKAmeiWt8t/H+BO+o7qk7BrcdbA5gInJs8Bqqc6u
 R+Vj4OpI5kGAfV37oOtpfj0t77W55Q9K5w0C4dZBka+urhq2te8v0cZxZLe/+I/QwMapvj01fU
 hF0RVQMZglt0YmKfEgymvB6CEp4rVCwf+iw/Uhi/jJXOEkJzo6WRgwcDpkFbqIsTR9C5xzrw/u
 ofNX8vjqDVmcqiXqlppRabiP
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 02 Jul 2019 10:42:20 -0700
IronPort-SDR: dsdfrG+O+D0YYUKDQmR4iE3UN3zVh/hsdwUfa6x7YhTtUiGIL8CpmfkBwMDTgt0WzdLK9m8IAG
 jYsHWpvDyzppL1pgzcvOiz9dvRaFzp+UV4DGE2Qj6epyYaGFA0N+k406z9PObsn/0+cPUjLQ/X
 WE1E455mHT1sBW+V63HZhc7EKmX80L5NAxQo4WHs+RnjTp6Exnns3m6jjZroXcgog5MKSTbJER
 ZZjwX0UI2MDh6Rwc5quokKaI99tN9VzJI2KH+raddvpBf/NohnJUIwwJVnZcacJhGyuYPLliiT
 GoM=
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Jul 2019 10:43:20 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Tue,  2 Jul 2019 10:42:31 -0700
Message-Id: <20190702174236.3332-6-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
References: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
X-Mailman-Approved-At: Tue, 02 Jul 2019 17:44:39 +0000
Subject: [Xen-devel] [PATCH V3 5/9] bcache: update cached_dev_init() with
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
cnMvbWQvYmNhY2hlL3N1cGVyLmMgYi9kcml2ZXJzL21kL2JjYWNoZS9zdXBlci5jCmluZGV4IDFi
NjNhYzg3NjE2OS4uNmEyOWJhODlkYWUxIDEwMDY0NAotLS0gYS9kcml2ZXJzL21kL2JjYWNoZS9z
dXBlci5jCisrKyBiL2RyaXZlcnMvbWQvYmNhY2hlL3N1cGVyLmMKQEAgLTEyNjMsNyArMTI2Myw3
IEBAIHN0YXRpYyBpbnQgY2FjaGVkX2Rldl9pbml0KHN0cnVjdCBjYWNoZWRfZGV2ICpkYywgdW5z
aWduZWQgaW50IGJsb2NrX3NpemUpCiAJCQlxLT5saW1pdHMucmFpZF9wYXJ0aWFsX3N0cmlwZXNf
ZXhwZW5zaXZlOwogCiAJcmV0ID0gYmNhY2hlX2RldmljZV9pbml0KCZkYy0+ZGlzaywgYmxvY2tf
c2l6ZSwKLQkJCSBkYy0+YmRldi0+YmRfcGFydC0+bnJfc2VjdHMgLSBkYy0+c2IuZGF0YV9vZmZz
ZXQpOworCQkJIGJkZXZfbnJfc2VjdHMoZGMtPmJkZXYpIC0gZGMtPnNiLmRhdGFfb2Zmc2V0KTsK
IAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0tIAoyLjE5LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
