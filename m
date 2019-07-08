Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CF7628BE
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 20:50:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkYg9-0005Dd-32; Mon, 08 Jul 2019 18:47:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Un8F=VF=wdc.com=prvs=0852429f4=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hkYg7-0005D0-AF
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 18:47:55 +0000
X-Inumbo-ID: e3bea818-a1b0-11e9-97c6-dbe974784ae7
Received: from esa2.hgst.iphmx.com (unknown [68.232.143.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3bea818-a1b0-11e9-97c6-dbe974784ae7;
 Mon, 08 Jul 2019 18:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562611704; x=1594147704;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=ZoXNFKbL1AElJNl2xVVOKPlcS+hzkE1sUFGwmoc7aEE=;
 b=aA2F8Gnw9G7nhLS8KsCjtw/FhQUFG8HHDMWIkSsEYBIkjqqDf6zABx5E
 VyPx5Bk0UpFALrr7843oCRdCXgPS4ZvdiQMn+9o8WQzEra13nGqKmRmWg
 DRNunsGBI39tklEnihWWMjwdLqOuj5f5ALbRo4waJ8iDSgWRbnpa/RfEj
 Jg2BfqC4XaHlBANN9Bj0gzwnxDcuYh2mzGzXuAF/LHOBrzhJSzaYSKjFN
 BevS2ZvPFUNoCqhtOOw25d/QeiyObIhZd6h1zvOLqQkao/HR6aMWhYHTJ
 0cNEYn7VlL/q+6jkPOfty9caTo0b7/Uiv1ZpP5T+byfd2yeQuZaDt0SJV w==;
IronPort-SDR: zza823IYodbth4Zo4zqOMd8Mr7lqhYcH7BPFSHcsKWTO2+J8kUI2eIqh74Wg/3DMXKzKNZB+kz
 FSWWd5IjUlxF55YXU6dUpWHUjuGkEDVFc0lBa3UcVuxy+BRzIe1XS87adP6YbfRgQp95KE81Dk
 mEHA+THbEPhLBn5fVS33ht6bGIgMNijAmtr1qEmii1JnHuYk9Zrw/1BK0T8sdG+h/BK+9mKgHH
 9Oy46tKYomfYnnObRkfR1q7t6G5l1od9Il1P6NOVzmgJvXNlP3tbYfs4u/VI2nxiiTiRkIfL92
 Rlc=
X-IronPort-AV: E=Sophos;i="5.63,466,1557158400"; d="scan'208";a="212364746"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2019 02:48:23 +0800
IronPort-SDR: 22m1an4HIx4t8fV7U5cHtCGCoMIcdkKpr5VLEJCWA6OypPRBr2lSd8lthwNDjp9BK5Y0FGB5s2
 hJ93Wt602TEzrZgCiYoEub1bmZ/oopK6xC7kSyyVTuagydh2m83cug59NM1o1t+zdBN9YncR54
 4S/cw9EEv2mmoKkq5vKYIClnQVAk/kmhOid9t70hkwhC1WeVR50AjJnVcqIUdIvGCV6d8qeU1p
 K5yGtRCYQ6RYgkE4BTIVdyN8lsbhpve3mPmJAB1eo2/tefGHko3TsrRS3ckBfKX6eW++LiDg9N
 ypLmQtFDyy9yJpaSGgS/nICG
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 08 Jul 2019 11:46:40 -0700
IronPort-SDR: kecyraaTh4dfkJYr6JIVW0Suuw0udo/w+uOixco2i06qP7L/SWcmvqt/OPQcFYibEwQdrOi0nK
 enRpRX7ANej55ctxwPbFJYb7fqRPzb9iUsQ+X5ZNEUrTgNq9FFFFtCk8Uw0GOXwADBWlxronSY
 Svt1NhhCrvFTzjTb0NAJyLkYX8DO4fah1yOc1ieVyunDXipVwQlvdQUxQXLaXQ7YfMQ8I6zuux
 LMBm49s+scu5jetOVTy2vWOk4WWISLi0ojSm1PhlAA0xRc/M8yQejIviSzITpm3H1FBND+zGZZ
 tNo=
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jul 2019 11:47:51 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Mon,  8 Jul 2019 11:47:08 -0700
Message-Id: <20190708184711.2984-7-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
References: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
Subject: [Xen-devel] [PATCH V4 6/9] f2fs: use helper in init_blkz_info()
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

VGhpcyBwYXRjaCB1cGRhdGVzIHRoZSBpbml0X2Jsa3pfaW5mbygpIHdpdGggbmV3bHkgaW50cm9k
dWNlZCBoZWxwZXIKZnVuY3Rpb24gdG8gcmVhZCB0aGUgbnJfc2VjdHMgZnJvbSBibG9jayBkZXZp
Y2UncyBoZF9wYXJ0cyB3aXRoIHRoZQpoZWxwIG9mIHBhcnRfbnJfc2VjdHNfcmVhZCgpLgoKU2ln
bmVkLW9mZi1ieTogQ2hhaXRhbnlhIEt1bGthcm5pIDxjaGFpdGFueWEua3Vsa2FybmlAd2RjLmNv
bT4KLS0tCiBmcy9mMmZzL3N1cGVyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9m
MmZzL3N1cGVyLmMKaW5kZXggNmI5NTliYmIzMzZhLi4yNGUyODQ4YWZjZjUgMTAwNjQ0Ci0tLSBh
L2ZzL2YyZnMvc3VwZXIuYworKysgYi9mcy9mMmZzL3N1cGVyLmMKQEAgLTI3OTgsNyArMjc5OCw3
IEBAIHN0YXRpYyBpbnQgaW5pdF9wZXJjcHVfaW5mbyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkp
CiBzdGF0aWMgaW50IGluaXRfYmxrel9pbmZvKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50
IGRldmkpCiB7CiAJc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiA9IEZERVYoZGV2aSkuYmRldjsK
LQlzZWN0b3JfdCBucl9zZWN0b3JzID0gYmRldi0+YmRfcGFydC0+bnJfc2VjdHM7CisJc2VjdG9y
X3QgbnJfc2VjdG9ycyA9IGJkZXZfbnJfc2VjdHMoYmRldik7CiAJc2VjdG9yX3Qgc2VjdG9yID0g
MDsKIAlzdHJ1Y3QgYmxrX3pvbmUgKnpvbmVzOwogCXVuc2lnbmVkIGludCBpLCBucl96b25lczsK
LS0gCjIuMTcuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
