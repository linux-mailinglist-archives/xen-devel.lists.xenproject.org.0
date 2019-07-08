Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A07628BB
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 20:50:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkYfd-00053t-Cf; Mon, 08 Jul 2019 18:47:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Un8F=VF=wdc.com=prvs=0852429f4=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hkYfb-00053o-Sh
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 18:47:23 +0000
X-Inumbo-ID: d1ded1b8-a1b0-11e9-88ff-97e218bd4d55
Received: from esa2.hgst.iphmx.com (unknown [68.232.143.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1ded1b8-a1b0-11e9-88ff-97e218bd4d55;
 Mon, 08 Jul 2019 18:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562611658; x=1594147658;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=ynS3SVE1xBuxWEb/5le/J5u09MnENI/7CT28vcHZjn8=;
 b=dgROoCEx8szqPlDFJAXg/gzCWyyaELw4nZ/gmWFwoCHcc17Ae2Fbhyq0
 RJmwhpIDbveOF9EizS9yvMDWoFMnL/mGn1UXamGDa0BXs5eOz58+tkUY7
 NhL3kK7KiYjGqZrPWIwNxhQlhUstpdidYgKAu7doPtzhFruJbSxlKRQuz
 ANerYOoyv31NxdvhFiHGerIVtvIozNdg87dvs5K/b4GEHnUPr9HiArFDi
 iCV8BmJwaMSePtEgXMOGd4yGjK97tEnqqy4kvIsX9qU5uiDq4EEzL/1BG
 TIH+LazYUPJ++gPBwhy/FuJQ88BjgQSBTCPZdrYl309AcbdgQu6xuMPu3 Q==;
IronPort-SDR: fm6ACR9UpYEWEsBTDAm7kKsL/g89sja6WpY5G5pXQpAoXqcODzhp7797orqCz6+z7hod5CBMnx
 XuEkGpz5xjR0cLsnpWKO/yjwdAQiQQF4Wh07IJOrPGA4lno4zMiSq9NGjxMXJC0cPIUoKpYcnr
 O7BD1Qda3I6BjJ8zeYu70JNKUKjAsOPcFHzE0pDRTs86jEtsKaQU6ZjL4DbYJnlgCm9gv8U4Y+
 pvuPrZqazORuCs1QqJEFmEO82A8h4lWMf301JeBH6XorldSfGHlWxLKWJcGVPRPEedxagLikJu
 aFg=
X-IronPort-AV: E=Sophos;i="5.63,466,1557158400"; d="scan'208";a="212364697"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2019 02:47:38 +0800
IronPort-SDR: 4OAezxRywqaHiBAjJNVkwnNNZ9/MUN+98Nme5GlkgXgqUyulmzemJinaVWi+enewDYY+rH4EZa
 sd4Fdug2x5XDlrOhIqlmankqmHEdTCQwoWnicw1hsp02zX0itu1Zc4lX2rNtbCNGyl7APRDm3q
 +mQ8OAAglQ3wE44NO2fmnlnkigQUz62JyCi/Z0z/CClXAKQbloid8V16Xkl8p8XPDqKzv5mM3T
 oXGNWrHpDUSr63OCxcyZIjCh0JOa9A1ePASHs8MMMufb8NN8wVag9/+nLdbE9ALyAQXw2J5LPa
 TLGGD6FjWgOuTNRzv4bnVrV1
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 08 Jul 2019 11:46:09 -0700
IronPort-SDR: XdrWNX/tHtwcbFCNAB6UtpjebhDmq2dIv5jQgtYneGZQJU5abS18Xxpst5IKOao5xF9DCI0hfE
 xaNjjXfl7Gy+wJkpahPgBFEUFq0XxSkv0wuJyr5ATn74oeIFo5FlSPmRmUkSaDm6J4qhHKgvbj
 fCx5bhYCef4cpXOOhHrym3RKYWASi8n2UtTD0M6qXFVWYaJt0b3P0NNZ/V/Th9cTV6+fg3R8cP
 bGRKiR96Ui7ZbwZSEA4GoKxvYPky8Mm2Rk9rD/6gna+OoY7JIG6rdt9GtjZ7CveE6MEpnuLfkT
 GXg=
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jul 2019 11:47:21 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Mon,  8 Jul 2019 11:47:03 -0700
Message-Id: <20190708184711.2984-2-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
References: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
Subject: [Xen-devel] [PATCH V4 1/9] block: add a helper function to read
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
aW51eC9nZW5oZC5oIGZvciBwYXJ0X25yX3NlY3RzX3JlYWQoKS4KClNpZ25lZC1vZmYtYnk6IENo
YWl0YW55YSBLdWxrYXJuaSA8Y2hhaXRhbnlhLmt1bGthcm5pQHdkYy5jb20+Ci0tLQogaW5jbHVk
ZS9saW51eC9ibGtkZXYuaCB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Jsa2Rldi5oIGIvaW5jbHVkZS9saW51eC9i
bGtkZXYuaAppbmRleCAwYzQ4MjM3MWM4YjMuLjU3ODM4MzcxMjA5MyAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9saW51eC9ibGtkZXYuaAorKysgYi9pbmNsdWRlL2xpbnV4L2Jsa2Rldi5oCkBAIC0xNDY0
LDYgKzE0NjQsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIHB1dF9kZXZfc2VjdG9yKFNlY3RvciBw
KQogCXB1dF9wYWdlKHAudik7CiB9CiAKK3N0YXRpYyBpbmxpbmUgc2VjdG9yX3QgYmRldl9ucl9z
ZWN0cyhzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2KQoreworCXJldHVybiBwYXJ0X25yX3NlY3Rz
X3JlYWQoYmRldi0+YmRfcGFydCk7Cit9CisKIGludCBrYmxvY2tkX3NjaGVkdWxlX3dvcmsoc3Ry
dWN0IHdvcmtfc3RydWN0ICp3b3JrKTsKIGludCBrYmxvY2tkX3NjaGVkdWxlX3dvcmtfb24oaW50
IGNwdSwgc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKTsKIGludCBrYmxvY2tkX21vZF9kZWxheWVk
X3dvcmtfb24oaW50IGNwdSwgc3RydWN0IGRlbGF5ZWRfd29yayAqZHdvcmssIHVuc2lnbmVkIGxv
bmcgZGVsYXkpOwotLSAKMi4xNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
