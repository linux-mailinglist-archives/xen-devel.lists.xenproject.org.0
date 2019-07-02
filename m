Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A5C5D590
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 19:47:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiMpd-0007ma-F1; Tue, 02 Jul 2019 17:44:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bnvP=U7=wdc.com=prvs=079d4847f=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hiMnv-0007fe-K0
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 17:42:55 +0000
X-Inumbo-ID: d1f029fd-9cf0-11e9-8980-bc764e045a96
Received: from esa3.hgst.iphmx.com (unknown [216.71.153.141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d1f029fd-9cf0-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 17:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562089375; x=1593625375;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=R+PqGxeqtQ6qQlCqmBxy6Ky2+ZJ1BGLcrhWr65kK1ko=;
 b=Nk0MmSHvjecX3Dg0MS9g5MxEQO8YIvrC1HUmc5u80UNcdYLvowX41r//
 B0qbrsRxY1rvcMnGcxtcYWhqj9Dg17KtyY3ZWluLmNrMUJmd/qUd5wSH+
 R+zm6545AHu5VgHTfiMJ+NBHtH/X9AAaCJKHqTo5QEL46moO5i+HLHQqX
 XAWLNiwfrdFqa1/NzXebO512TdFqQ8YIx1E9wMjR4V/61LZeZIjVe+SRY
 2+dmsG0WoqMgU5gq/LBvQWy8ibN/rR4fo3IuC1T6WPQFgV+RkHS+sXk8X
 X/u4qgIFKwx/sMSj4WP0ByGa+B7HTLPoLI+bMUy3okMCXgFhOeVXz8/Kg A==;
IronPort-SDR: zYeUiuQWP0+Gp7rvkQmHTjeoJnXN1zezwOr7YK1ejWPBTI1du2Tc7uUGLkoyf/x2uJJCjM6h8h
 B75/XZOzpMjuJqosLbiaKsF6Cne6wg+3xBuwVCaAtdy/Y38YrgnVc3rx/SrBx1lF6qAlAfNy7b
 WNtbztTGJF/DFtF8noX0w1IJXz6V3NZpUIzhx1lVaEi5HJAPUXgcRShPRGGdZxlMIZKL/YEAEf
 oLduZbtuOcVeBj4b9lSlMQ3XWKDtodQ+5sl7tPoOc5m+EGvYxtNCARn+sRMyMyPpcBL8BX6G2k
 2ls=
X-IronPort-AV: E=Sophos;i="5.63,444,1557158400"; d="scan'208";a="116916547"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2019 01:42:54 +0800
IronPort-SDR: S15OGL3rXeRgUm+JUCxjODYQm9sVk83ljJ6dpPHvu92IgS4qkHbyJxRqj8ONv5Zceu6d2j9jfk
 3ohZGSci5sM9MOhxqCk52VoC8pVUI75CEjdzYweF0iNKlNQBeqA0H5f6leud4SoYmqQYG+UcZB
 0v5KmHC7r9M9mZut2h2WcLGHKFDXRXEcDtzaAotma0gN4B4iGHeN7A6mkJUn1BukDihQOOLPQI
 vkHLqeMdR3eo5eZqEsCbN9+pZECqzXqOxlRvcL3XEE15rdqLYdK+W8g6hdfmJchE+38eLG9wuW
 CRLkqPnmKYWzxbNC6GAxWzkq
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 02 Jul 2019 10:41:56 -0700
IronPort-SDR: G/uLmRGIhR1LMbBkSR/mZvxOZKkvqJRNN5K3dh9qNmMM1fa2KZc+jFQU7q7JOv6WNW6g48l0Kn
 5v4QxUuHBwr5SzPEAtkc7OyRSK3XTRauZGm59j5ahpw5wmr6DYzqxjFPVdJrrQidjtsBYyV0uM
 yF9FYqoQuzI3uhdGfMdue9EbSVG3fRedIz8rowF8JYCI1n/lvifOaIQVoyvpk1+8dBIPd3rMmT
 MA2y2MtsCtTSTxq5XBpfxTUQW0NqoTMAaz3gHx+pwkKc4o/2IB/j6m8UfbKqKaS/cMputBrwok
 22Q=
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Jul 2019 10:42:53 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Tue,  2 Jul 2019 10:42:28 -0700
Message-Id: <20190702174236.3332-3-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
References: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
X-Mailman-Approved-At: Tue, 02 Jul 2019 17:44:39 +0000
Subject: [Xen-devel] [PATCH V3 2/9] blk-zoned: update blkdev_nr_zones() with
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
UlRfU1lNQk9MX0dQTChibGtkZXZfbnJfem9uZXMpOwogCi0tIAoyLjE5LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
