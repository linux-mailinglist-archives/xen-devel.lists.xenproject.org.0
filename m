Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 107B3628C1
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 20:50:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkYfj-00054J-Ly; Mon, 08 Jul 2019 18:47:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Un8F=VF=wdc.com=prvs=0852429f4=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hkYfh-000547-Ss
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 18:47:29 +0000
X-Inumbo-ID: d5683547-a1b0-11e9-8980-bc764e045a96
Received: from esa3.hgst.iphmx.com (unknown [216.71.153.141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d5683547-a1b0-11e9-8980-bc764e045a96;
 Mon, 08 Jul 2019 18:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562611649; x=1594147649;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=BLEYyqiHt/Wv6nLWVBfIZztbC5fI1sQcHli3j0z2Rjw=;
 b=YkUj3vHkOxdElo3CNL+0sVQhliho6FdwVBetYUkcvGRAqfp+OcZA5Xvw
 q25fGIa4YuP+31R3OtEbOA+INcLEe/iOMUnx1/J7BHGdAoe61YoC6OGOr
 ahAwMp2nFE0h6rlWnrvDpnXQwoMgAZadLBqhriUR+9fLGKURENzeS6Klg
 tY3efO3kap5ndTL+j5zx8wIbJdMTZ0LhSG2l0qYivTViS8MRNpSK3uirz
 VLH7wJrL5/Ru0GG6OanZz6WNlrWgXT+nhmd3jODDvovPV/874UH7bffjo
 92GTExEHfj+n9abX3I333ZQuTCiyRB8Z9rytMXgDVhobals1HeqJX1ON4 Q==;
IronPort-SDR: Ddfa461mcMslhxLUCvjkQtkjRFgubLF0XEXTILOhlUlZxjmwDi+XVyfQk2kqLPva4Z+bbCfjDj
 cEZTr/HZHuI4MvNm6yES37FeYxFev2wBeFO+FnQLUEaQhaOkCHHMq+trJyZ9OWf3di1pTzNsG5
 bg51cS0c+k2tQvR1Xk81iUGQLtSINKpeho/EhiszzdKRJrL0cQK6EzmOQPYgLRXEVVkO6m1emm
 1bYODjGHVI+gNj4jvVmcdUm4Z2hf6AIKx1zesenyeq/y728mjczG3QnY8EJQnvMWy99oFNILfe
 5yo=
X-IronPort-AV: E=Sophos;i="5.63,466,1557158400"; d="scan'208";a="117296110"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2019 02:47:28 +0800
IronPort-SDR: SkSYt/4HUgsPXVgZN4jf7guI3pPDn1HAiNIJYXEJ/xttXqc4t547Iwzjgjh93F8ihyXKVxXw63
 BlRM4aojYbUc84xlfcH69BVW/RC2zsS23y6GlyZy+VWCuPw+GSltbBEpOt3XwZv4k6EEyQ6mLd
 OAtvN7aLTMnjI99pBsvO3MIMZDDvugRFQkdKjhnhohByZn1ZOMyZeXnOx7GdUTcUkJFIV9UdSN
 a0SMFg41skrl++X654jcltHz88rq0OW+kVbiKFmVM4JjDZ/MQmgaPIi8BO8h2ll6tUaP2U8nSJ
 J6oAKGqlkosaeYtkyVWT6DiZ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 08 Jul 2019 11:46:15 -0700
IronPort-SDR: YRRx/EURyyId2rAn63ItMGwUJucXOYj/rfVXRkkyVSj/PtgC9c92Thdp63KOL6fYEaXTRbz/kU
 1mfBfPgUOnEpRMI0FiaKN+4XSPY3ldYWJMZobspJSp2ODImnKlumR4tmOV5PAQQ9SRk3E9POWF
 VPn16WelTwmPiXdpUSqS8jeH0LDODQfnndrN7Ms33RFBa41zXzdS74G4tpcHX6MAZ8OgbHv1yL
 vhfCazKm6xZfVAQUDl0uXtbCaC0Nxr3Nufc6fjTg69fyi/C5Z3rd6iqUXjZe0g0eJdugYt0WSc
 KC0=
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jul 2019 11:47:26 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Mon,  8 Jul 2019 11:47:04 -0700
Message-Id: <20190708184711.2984-3-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
References: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
Subject: [Xen-devel] [PATCH V4 2/9] blk-zoned: update blkdev_nr_zones() with
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

VGhpcyBwYXRjaCB1cGRhdGVzIHRoZSBibGtkZXZfbnJfem9uZXMoKSB3aXRoIG5ld2x5IGludHJv
ZHVjZWQgaGVscGVyCmZ1bmN0aW9uIHRvIHJlYWQgdGhlIG5yX3NlY3RzIGZyb20gYmxvY2sgZGV2
aWNlJ3MgaGRfcGFydHMgd2l0aCB0aGUKaGVscCBpZiBwYXJ0X25yX3NlY3RzX3JlYWQoKS4KClNp
Z25lZC1vZmYtYnk6IENoYWl0YW55YSBLdWxrYXJuaSA8Y2hhaXRhbnlhLmt1bGthcm5pQHdkYy5j
b20+Ci0tLQogYmxvY2svYmxrLXpvbmVkLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9ibG9jay9ibGstem9uZWQuYyBi
L2Jsb2NrL2Jsay16b25lZC5jCmluZGV4IGFlN2U5MWJkMDYxOC4uNTA1MWRiMzVjM2ZkIDEwMDY0
NAotLS0gYS9ibG9jay9ibGstem9uZWQuYworKysgYi9ibG9jay9ibGstem9uZWQuYwpAQCAtOTAs
NyArOTAsNyBAQCB1bnNpZ25lZCBpbnQgYmxrZGV2X25yX3pvbmVzKHN0cnVjdCBibG9ja19kZXZp
Y2UgKmJkZXYpCiAJaWYgKCFibGtfcXVldWVfaXNfem9uZWQocSkpCiAJCXJldHVybiAwOwogCi0J
cmV0dXJuIF9fYmxrZGV2X25yX3pvbmVzKHEsIGJkZXYtPmJkX3BhcnQtPm5yX3NlY3RzKTsKKwly
ZXR1cm4gX19ibGtkZXZfbnJfem9uZXMocSwgYmRldl9ucl9zZWN0cyhiZGV2KSk7CiB9CiBFWFBP
UlRfU1lNQk9MX0dQTChibGtkZXZfbnJfem9uZXMpOwogCi0tIAoyLjE3LjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
