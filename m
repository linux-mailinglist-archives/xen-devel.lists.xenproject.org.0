Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0865D59C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 19:48:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiMpd-0007mg-PD; Tue, 02 Jul 2019 17:44:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bnvP=U7=wdc.com=prvs=079d4847f=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hiMo4-0007fy-EY
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 17:43:04 +0000
X-Inumbo-ID: d759408e-9cf0-11e9-8980-bc764e045a96
Received: from esa6.hgst.iphmx.com (unknown [216.71.154.45])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d759408e-9cf0-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 17:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562089384; x=1593625384;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=KhPmEM2AXyHo6PBofKblkM2Y3DIiKG3VMw18OQzTeBk=;
 b=Wsu/JRSchpA0HZepAJvUYAjPFAL1lw7mKIwsqO1jSCs8I1kcOLgXMM+J
 jCozEdqn5ZWeOFEN9/mOrut9YPLyh8KpEprKwY/VnH27090nhpvZyCY+i
 L1FMAhO9ubCbR6p9Az/rR9D+CJHqrRaosirnym3e1OMQKhdXM7HGlRIPh
 xKNWMAZvoqmS2UUjcMakehIAs6/9bjfuQZUh2dnt/Getclg/3w6soiEPC
 88TLBnH3M9XrKvL7qrgzTrUVtzxtLO76EVrbPMFDuCswG+TU0umbqecth
 EW4PqYbFz1RizPXpt4ctS664pica0R/FS4tB/Su/gjDkfNInuBJhYmPHQ g==;
IronPort-SDR: C/wlCSvWpLDX6k/xAiwPzfITCtg5VenrUkcmkHUo7TvYF3Yhy4HfO8P37gzlTuHc28s1R7xyEI
 yruN4tXLnCACNkwIZjnaukTqQBiUgz2myZwpHOV64Nv15AVT2J8CxjU6SmG8VafHe7d9tooU3O
 UjPU4ulUd0Kpu9XaVGAW/Nr0Wc84MdpehXxOjS78hGOHrNodjVj4PzEWmpHvVa2SVxWYGPU+j9
 xRZK/yKd8FJJi2ioEVaCrS2KyESqpC9+t1kOKJ79eEl9kN+1kINTdC10Jitn4ExSDJ3gvBp+rI
 XFo=
X-IronPort-AV: E=Sophos;i="5.63,444,1557158400"; d="scan'208";a="113690563"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2019 01:43:03 +0800
IronPort-SDR: uzhcPah2vBJvzAcqeFHhqV4E01YDiDZfeAzv3Bn/XE117uM5JWoYvan1dpctbwD/H7pK6lI4af
 QZ9EV8eT1YY+kxonNcbxuJ22ylo/m8aE22b1DgswHDWcu5tdjg+icoJ/8WLXCo0Yxq0rn7dts5
 MsSd2NvBAUK03G4mbBuLKWsn/Xd1FRCFM4Nb6xHsW4KdN5LECjhHmMhtyvTRNfvqoF/DtSln7M
 DmlKV+eVcX4xVtfquALmcOxIoaplyEjzWqK1vRyUoV0JJ6SNgQIzNjDEiPB0nCxQOetFhTzL8M
 jNx6RdFxtILQvbGVyYlsbbUv
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 02 Jul 2019 10:42:05 -0700
IronPort-SDR: 6aWxaTBrk+Kvq4wIRr/d70nXsFtKx/h2jTgYTYDzRuzGUwI1dcEHM6gt3ZHnktHhEjb4/JCped
 7e+xcGWb4ezwmmGHsb8fy4es9zxYPMfyLKqFtHBs89QcpmRPHcClv/6L9uTwE25km1MSTeHUNh
 QXgH2y1PN79zjwD/6RQNH5TySuXd3fIM+krOne5dzLallo/yzl5xKvgKrBEtFd2qULXFTmMcoJ
 4llbiUV8AaOXSwXTCZ4YfFaNEH7P4FlfrSIC/kH4vx7TiGF3X84yZ+VK0d22WjDH7jZa8SWEP6
 qVo=
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Jul 2019 10:43:02 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Tue,  2 Jul 2019 10:42:29 -0700
Message-Id: <20190702174236.3332-4-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
References: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
X-Mailman-Approved-At: Tue, 02 Jul 2019 17:44:39 +0000
Subject: [Xen-devel] [PATCH V3 3/9] blk-zoned: update blkdev_report_zone()
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
KS4KClNpZ25lZC1vZmYtYnk6IENoYWl0YW55YSBLdWxrYXJuaSA8Y2hhaXRhbnlhLmt1bGthcm5p
QHdkYy5jb20+Ci0tLQogYmxvY2svYmxrLXpvbmVkLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ibG9jay9i
bGstem9uZWQuYyBiL2Jsb2NrL2Jsay16b25lZC5jCmluZGV4IDUwNTFkYjM1YzNmZC4uOWZhZjQ0
ODgzMzlkIDEwMDY0NAotLS0gYS9ibG9jay9ibGstem9uZWQuYworKysgYi9ibG9jay9ibGstem9u
ZWQuYwpAQCAtMTA2LDcgKzEwNiw3IEBAIHN0YXRpYyBib29sIGJsa2Rldl9yZXBvcnRfem9uZShz
dHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2LCBzdHJ1Y3QgYmxrX3pvbmUgKnJlcCkKIAkJcmV0dXJu
IGZhbHNlOwogCiAJcmVwLT5zdGFydCAtPSBvZmZzZXQ7Ci0JaWYgKHJlcC0+c3RhcnQgKyByZXAt
PmxlbiA+IGJkZXYtPmJkX3BhcnQtPm5yX3NlY3RzKQorCWlmIChyZXAtPnN0YXJ0ICsgcmVwLT5s
ZW4gPiBiZGV2X25yX3NlY3RzKGJkZXYpKQogCQlyZXR1cm4gZmFsc2U7CiAKIAlpZiAocmVwLT50
eXBlID09IEJMS19aT05FX1RZUEVfQ09OVkVOVElPTkFMKQpAQCAtMTc2LDEzICsxNzYsMTMgQEAg
aW50IGJsa2Rldl9yZXBvcnRfem9uZXMoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgc2VjdG9y
X3Qgc2VjdG9yLAogCWlmIChXQVJOX09OX09OQ0UoIWJkZXYtPmJkX2Rpc2stPmZvcHMtPnJlcG9y
dF96b25lcykpCiAJCXJldHVybiAtRU9QTk9UU1VQUDsKIAotCWlmICghKm5yX3pvbmVzIHx8IHNl
Y3RvciA+PSBiZGV2LT5iZF9wYXJ0LT5ucl9zZWN0cykgeworCWlmICghKm5yX3pvbmVzIHx8IHNl
Y3RvciA+PSBiZGV2X25yX3NlY3RzKGJkZXYpKSB7CiAJCSpucl96b25lcyA9IDA7CiAJCXJldHVy
biAwOwogCX0KIAogCW5yeiA9IG1pbigqbnJfem9uZXMsCi0JCSAgX19ibGtkZXZfbnJfem9uZXMo
cSwgYmRldi0+YmRfcGFydC0+bnJfc2VjdHMgLSBzZWN0b3IpKTsKKwkJICBfX2Jsa2Rldl9ucl96
b25lcyhxLCBiZGV2X25yX3NlY3RzKGJkZXYpIC0gc2VjdG9yKSk7CiAJcmV0ID0gYmxrX3JlcG9y
dF96b25lcyhiZGV2LT5iZF9kaXNrLCBnZXRfc3RhcnRfc2VjdChiZGV2KSArIHNlY3RvciwKIAkJ
CSAgICAgICB6b25lcywgJm5yeiwgZ2ZwX21hc2spOwogCWlmIChyZXQpCi0tIAoyLjE5LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
