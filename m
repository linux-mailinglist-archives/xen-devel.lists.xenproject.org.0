Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 952A19721E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 08:16:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Jtg-000449-Tt; Wed, 21 Aug 2019 06:15:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9TMJ=WR=wdc.com=prvs=12921afdb=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1i0Jte-000434-Ku
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 06:15:02 +0000
X-Inumbo-ID: 01e03874-c3db-11e9-b95f-bc764e2007e4
Received: from esa6.hgst.iphmx.com (unknown [216.71.154.45])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01e03874-c3db-11e9-b95f-bc764e2007e4;
 Wed, 21 Aug 2019 06:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566368101; x=1597904101;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=TWIY4zyMbnSdbPfWCQisLpNGsxuN7LEVg7rZifVilrc=;
 b=pn/JINVjgUqubKHvgPvCNqgn7pG3wqXXyOaw89kYE6ytO+EPzlFvjK9V
 3iUNRRjXj71UT7gIWihPDYKnV3rxqa4ZDe2qoP4pA7IndBzTobT0giYbV
 LLQdhQ+rv6fnm93evU89aKSfc7WIZ4pYOVamQxRFf1XrEkiA5t9CY1ilM
 djcJPOWsOD7PmMVEqtT1ofT0nVjjvTIgg0heIFQ9riXXr/Wv5U75eb4ZU
 59fJm7TwRDGdP9TRjZc5+ikZqmC9t5feZQV2veIJ54bfxZNehNK74jjDM
 ce8Pv3EKPgImkhNKEeCNJKoWJHVHYNZ621V3kvkrFI3L68RHvdnB1zWNG A==;
IronPort-SDR: 4+JRm2EKlRPM7Eie4NTCXUmVv7g4sQu1v79uXll+BfVC2gZP2JgUyTaj/N/MrDbtE4rrVHvPQl
 fmNhIrf+okpm2ApU4ufXgTSo+t0AaVhwipAVgCES8Tck/+uS6CZhdZaXNPs2ctTJmI4U19qMqE
 J0juTdEpZmZy377gWYrB8z/ENK3GsRXn3JkXX5i4Y3p+kFev3yjNET96uhUTDcXkCmy6s+DZdW
 otZZVDynd0OWjxgwKcbTAUjasbxULVH2J1chOFHYRraPxUv/5a5jpS8bGDdM2HrnTMwOC2KQKL
 wrg=
X-IronPort-AV: E=Sophos;i="5.64,411,1559491200"; d="scan'208";a="117904710"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Aug 2019 14:15:00 +0800
IronPort-SDR: lO/l1zblGUq94kn9nZ48rBDYJUUay1zBSyRMbRSkGHJHg5RPyfcMoRBeqUCOp3gEk2siFpYa5f
 xfoV9q+gUNZgkSijYA9UzISQxROE2FT/lqcPsYsPg9p3RncjmljoUQljQHzjsfExMx3l/U80Il
 BaPZN7age0Hdp1xcnE+dZ8CP2DNbnAoMKk+TH4FUtY/9xZfCtVp8ynBhsuwBKzRIaEwLvraDUp
 P5W9ZC/1O61u3ktX5/8XNJF7kt4QD2TXF9jsNHiSmu/+xow9qlXFVEFN7G5oT8cN2OTo1GoQ8W
 6/OnikgphnBdFRgtaz7EeYtM
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 23:12:22 -0700
IronPort-SDR: 5/S77yaPX7vIPc8Ykudto5lXNWJHWMf9k8eRp3VA22ShuUnIWyO7HBQ+5tzxRnuB/rl895d70I
 86QpiaX1uJ/JbLojGMgXm9WeY140bDRfoabDuUfUsNls8qwqFznkr5GENwDhjTPYv9YElxi/x5
 5nW/zc6pDo9no7FW7MUum92rzmL3Z3p7aRGH12FMJl75j77cAWHqi4J3a7DmFbACMIS2GPs3g5
 uX4v7+k8k0zwseAE//uhMbrgJlegwYblO909AXAa1Kdxm8kkfVOoN1UvJESvG3Wy20saiTR79E
 CZ4=
WDCIronportException: Internal
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip01.wdc.com with ESMTP; 20 Aug 2019 23:15:00 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Tue, 20 Aug 2019 23:14:19 -0700
Message-Id: <20190821061423.3408-6-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
References: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
Subject: [Xen-devel] [PATCH V5 5/9] bcache: update cached_dev_init() with
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
cnMvbWQvYmNhY2hlL3N1cGVyLmMgYi9kcml2ZXJzL21kL2JjYWNoZS9zdXBlci5jCmluZGV4IDIw
ZWQ4MzhlOTQxMy4uNzljODQ4ZmE1OTEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL21kL2JjYWNoZS9z
dXBlci5jCisrKyBiL2RyaXZlcnMvbWQvYmNhY2hlL3N1cGVyLmMKQEAgLTEzMDUsNyArMTMwNSw3
IEBAIHN0YXRpYyBpbnQgY2FjaGVkX2Rldl9pbml0KHN0cnVjdCBjYWNoZWRfZGV2ICpkYywgdW5z
aWduZWQgaW50IGJsb2NrX3NpemUpCiAJCQlxLT5saW1pdHMucmFpZF9wYXJ0aWFsX3N0cmlwZXNf
ZXhwZW5zaXZlOwogCiAJcmV0ID0gYmNhY2hlX2RldmljZV9pbml0KCZkYy0+ZGlzaywgYmxvY2tf
c2l6ZSwKLQkJCSBkYy0+YmRldi0+YmRfcGFydC0+bnJfc2VjdHMgLSBkYy0+c2IuZGF0YV9vZmZz
ZXQpOworCQkJIGJkZXZfbnJfc2VjdHMoZGMtPmJkZXYpIC0gZGMtPnNiLmRhdGFfb2Zmc2V0KTsK
IAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0tIAoyLjE3LjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
