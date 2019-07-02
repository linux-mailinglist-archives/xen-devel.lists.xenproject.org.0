Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 590D05D592
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 19:47:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiMpe-0007mm-3l; Tue, 02 Jul 2019 17:44:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bnvP=U7=wdc.com=prvs=079d4847f=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hiMoE-0007gH-01
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 17:43:14 +0000
X-Inumbo-ID: dd052421-9cf0-11e9-8980-bc764e045a96
Received: from esa6.hgst.iphmx.com (unknown [216.71.154.45])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dd052421-9cf0-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 17:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562089393; x=1593625393;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=w3BrX382ONqjIyv6voYA3PkjU3CP+ICuSqh91zwGnoI=;
 b=d2XsBQObSu2aqhe0KXX8g4JZ00dUjCzRB4d4cOeK6Joa7WddQ4tHLRRe
 uhtvKFx/h8CrkrV58RauT77oXlGK4uf2yI/r6SdaNDpR5ax8tN9qH9lbQ
 z9H/k+dZcfK0GFTvs1c719MkEHP29kzq4dNXi2+TgcPlA8bqCjwXMKaa7
 Ah1wzRXhgnKep2ZdDq9FqRbXf8RQnl9UXoEEgjoDP+RE5yRXcdJ28NqD0
 /q+wclz4g3nNslG1FTrULdcLzOaqWQ9B6hjDogkofimh+RC68PiZCBQ5k
 JsN0bDdVAfzXxmtXAj/nsKR8S9KVsWZd+jMgCJFCswfIPrRm739hMLO1K w==;
IronPort-SDR: NSgnA9MynBeC/AGsBzj0EEKm9C403Y+ws+v21TRw9Xnh/LkZmDWn9yF++L1JxXNowhfvSBOLXh
 qRsYtomBs20/A4RbrBz7E9rm6HkSqvzbtLmrdd05jaq3MtPp8tbU0KQcnlJ+DmbFZrvks1hEXI
 z45meH2aO52uDyS/5QzgHUkx72wL2L2Yv9aM6BVtuLiQqRzEhC/Wu6DSycVMu8gaHZlLTpXl6q
 lGz59PtEHwrrgGE2/BLtJgEgk4xArOi61RjyLVvTFCEk6dnmx+6qdMHmg94yZpeuZe+cGkUuus
 V/I=
X-IronPort-AV: E=Sophos;i="5.63,444,1557158400"; d="scan'208";a="113690574"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2019 01:43:13 +0800
IronPort-SDR: +35EbuUkpv7hCLKsNYyVixVCuVdtpQwQQ0DL2/wQcfpFf2mHtWsWCaN6tu3RGajTRb68GqgmSi
 6VgTxNHBJmCyYhRTaMmDL/Y1sIrpbwhZfGrb1hHBUqWQAFho8LtFG29b/AWsHnmVmyhtKy6ucg
 zlYGy1bzAP8UWJyZIfpiTwkx177YXhQvrtGbZC3STe1NatBvQ1OJggZWdrmi1zm57XhdMZujZA
 CXffnE0iu6FBNvmWRRfXNQb7/j7P//tvqeS3wI1yvouP5wqMlT56MAL75DSrhxIvskD2dRSUvA
 EOVNZH3EAQi7KdMA1MsqUD/v
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 02 Jul 2019 10:42:11 -0700
IronPort-SDR: bTE73XoebtSY9BFEdgIbFq66JMRK553Gy4nlPM/489RzJLQKSuFC647ZNCgK6Pe5K2acESKa/v
 GSyMegt22LTGo7l8BRZPNNAHwyUWFfcwLZUe3SLCb0DC8tf1ksFmAOjIdeAxS0flNdl1Vpk0Gh
 lMrR6oroo8tPU1xiW0Zj+Yxt+Jry2cgDdCY4nPBcevgpALqZulp9n3CuGosdEVbiHNDUItK2WP
 v3BZh8J6bSN6Ou8vYXB9xka6wKDRw21EZx8JHyPMbb3NO9B1CD5BW+/c8McPByloJrrt7CVnbS
 N1c=
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Jul 2019 10:43:12 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Tue,  2 Jul 2019 10:42:30 -0700
Message-Id: <20190702174236.3332-5-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
References: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
X-Mailman-Approved-At: Tue, 02 Jul 2019 17:44:39 +0000
Subject: [Xen-devel] [PATCH V3 4/9] blk-zoned: update blkdev_reset_zones()
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

VGhpcyBwYXRjaCB1cGRhdGVzIHRoZSBibGtkZXZfcmVzZXRfem9uZXMoKSB3aXRoIG5ld2x5IGlu
dHJvZHVjZWQKaGVscGVyIGZ1bmN0aW9uIHRvIHJlYWQgdGhlIG5yX3NlY3RzIGZyb20gYmxvY2sg
ZGV2aWNlJ3MgaGRfcGFydHMgd2l0aAp0aGUgaGVscCBvZiBwYXJ0X25yX3NlY3RzX3JlYWQoKS4K
ClNpZ25lZC1vZmYtYnk6IENoYWl0YW55YSBLdWxrYXJuaSA8Y2hhaXRhbnlhLmt1bGthcm5pQHdk
Yy5jb20+Ci0tLQogYmxvY2svYmxrLXpvbmVkLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYmxvY2svYmxrLXpv
bmVkLmMgYi9ibG9jay9ibGstem9uZWQuYwppbmRleCA5ZmFmNDQ4ODMzOWQuLmU3ZjI4NzRiNWQz
NyAxMDA2NDQKLS0tIGEvYmxvY2svYmxrLXpvbmVkLmMKKysrIGIvYmxvY2svYmxrLXpvbmVkLmMK
QEAgLTIyOSw3ICsyMjksNyBAQCBpbnQgYmxrZGV2X3Jlc2V0X3pvbmVzKHN0cnVjdCBibG9ja19k
ZXZpY2UgKmJkZXYsCiAJaWYgKGJkZXZfcmVhZF9vbmx5KGJkZXYpKQogCQlyZXR1cm4gLUVQRVJN
OwogCi0JaWYgKCFucl9zZWN0b3JzIHx8IGVuZF9zZWN0b3IgPiBiZGV2LT5iZF9wYXJ0LT5ucl9z
ZWN0cykKKwlpZiAoIW5yX3NlY3RvcnMgfHwgZW5kX3NlY3RvciA+IGJkZXZfbnJfc2VjdHMoYmRl
dikpCiAJCS8qIE91dCBvZiByYW5nZSAqLwogCQlyZXR1cm4gLUVJTlZBTDsKIApAQCAtMjM5LDcg
KzIzOSw3IEBAIGludCBibGtkZXZfcmVzZXRfem9uZXMoc3RydWN0IGJsb2NrX2RldmljZSAqYmRl
diwKIAkJcmV0dXJuIC1FSU5WQUw7CiAKIAlpZiAoKG5yX3NlY3RvcnMgJiAoem9uZV9zZWN0b3Jz
IC0gMSkpICYmCi0JICAgIGVuZF9zZWN0b3IgIT0gYmRldi0+YmRfcGFydC0+bnJfc2VjdHMpCisJ
ICAgIGVuZF9zZWN0b3IgIT0gYmRldl9ucl9zZWN0cyhiZGV2KSkKIAkJcmV0dXJuIC1FSU5WQUw7
CiAKIAlibGtfc3RhcnRfcGx1ZygmcGx1Zyk7Ci0tIAoyLjE5LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
