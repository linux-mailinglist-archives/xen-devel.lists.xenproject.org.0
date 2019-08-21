Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB3A97227
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 08:17:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Jtm-00047Z-Cg; Wed, 21 Aug 2019 06:15:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9TMJ=WR=wdc.com=prvs=12921afdb=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1i0Jtl-000474-AX
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 06:15:09 +0000
X-Inumbo-ID: 0568cdda-c3db-11e9-adc0-12813bfff9fa
Received: from esa5.hgst.iphmx.com (unknown [216.71.153.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0568cdda-c3db-11e9-adc0-12813bfff9fa;
 Wed, 21 Aug 2019 06:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566368108; x=1597904108;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=PRIc+qImYQi0sq4kI43ZLo0IJMblnfPTP0QUTy0nhdQ=;
 b=NuYxSd83Sg/Ct074JSbtGgQg+5NpTGJc/XfETWuBInv/oibqWejIlZ2L
 Fr/BWbPjjNv+iQM93DY0ivM9WALdnaSdnV202PXvxR8XharPnfzAdmocc
 gw7i+pQ/hK2ZeBgnQvNcpkEY34cKOluQyDyxyoikcfKcz4R+gnenKhVhx
 M/44RbagdsQq6O2b70HN+/IQ6EXxeB2e2v+ojJMr13iFxvLzkiwFLSt8O
 bkiQndprvGpo4iKe3vlvHifj/KJX7dbtJ6fmjikJOfslfXhm2BoLFYSEh
 4c2t16+c4bn4P2BaHU+XsU7LDdzcSI0bDCzCpETo6Gg+qHlFAHgEWdi4j Q==;
IronPort-SDR: mi7cpFVYmr5t4XAxpU5sUSy+w/1dWUbBk0BHGSff4aKQ78H0sO+5Gvb+Ijqz26Jo1rFxUcIM4c
 UCzQP+Fub3v3YlgXH7UC/aQRlRVk43GQzW6q8kcPJaauoBuAoi2pGL/uBQ2uoAVQA82Bq0GTLp
 wULr0cpaG1XeyAWdWejSEd/w0+AuJzkO1tLI6C/QqwIWzAQC3wGEvolQpTMPmGFGMAQmpwR+J8
 +AhD3+yNFsnNEwb/QJKIZe1f914rYGBI3nnaCjiwzYwr9SdTjYXwkiPG3/CaMHX5/4dyy4pqmS
 N00=
X-IronPort-AV: E=Sophos;i="5.64,411,1559491200"; d="scan'208";a="117239090"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Aug 2019 14:15:07 +0800
IronPort-SDR: 39Ey0NAQwuaSLAJEzA5u8xPkoSqztuovmx79SvlP3v+o/sHO/Cm8bRL4OT/YypijwMvzD/o0Mk
 MUOt6+uCVVh4EUgJZenUfrpJPeljUyfLdcrkOjyO5LcG+SV4PtfpNcajWxbFM5PNpe20hoPOG9
 6HjN+EyANTz5bTUDd6O2v97toPpX84Cn4sOzNoEh2KY9ptiWVWDeA2nI72jw+KJ8/DBeVhSlhd
 1f+j5NKvVjlD3aFYEg7DWY/+ccVgOx1ddVfAJ6p0QDbvtkRxL4hCBMmQdJV+s0NLI1fUKxwEQ0
 TKHFASIiFfLo5qIte8BiUcg0
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 23:12:28 -0700
IronPort-SDR: 5OITIcW+05bA5Z40gygWOJU1w9CIPQ11BCkLaBNmFn3P/VNeT0sYheeUS/i1HqpgVD2aksn/0T
 0jmTG7ojAxndIs1tRyw00R3Gt8qcdicEt+6yTPu8vzUU0i4fpKYySbuvVoWZd8g+Abko1qujuu
 j4MC7leRfkA7azGPBOWylw7p7ZKglYFk9SHsW8rLlacSj/f7OCusSE3BCYeePrmX6TOsUVfbkX
 bPUoBBhF6ojUMTV6YAgSaZKf0Yh8+8iUQCm0hYI5wPdi5onYmHP4f2i3PqgeIT3YLVaSFNafh4
 3zA=
WDCIronportException: Internal
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip01.wdc.com with ESMTP; 20 Aug 2019 23:15:06 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Tue, 20 Aug 2019 23:14:20 -0700
Message-Id: <20190821061423.3408-7-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
References: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
Subject: [Xen-devel] [PATCH V5 6/9] f2fs: use helper in init_blkz_info()
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
MmZzL3N1cGVyLmMKaW5kZXggNzhhMWI4NzNlNDhhLi43OGY4ZjgzNGFhNDQgMTAwNjQ0Ci0tLSBh
L2ZzL2YyZnMvc3VwZXIuYworKysgYi9mcy9mMmZzL3N1cGVyLmMKQEAgLTI3NzUsNyArMjc3NSw3
IEBAIHN0YXRpYyBpbnQgaW5pdF9wZXJjcHVfaW5mbyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkp
CiBzdGF0aWMgaW50IGluaXRfYmxrel9pbmZvKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50
IGRldmkpCiB7CiAJc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiA9IEZERVYoZGV2aSkuYmRldjsK
LQlzZWN0b3JfdCBucl9zZWN0b3JzID0gYmRldi0+YmRfcGFydC0+bnJfc2VjdHM7CisJc2VjdG9y
X3QgbnJfc2VjdG9ycyA9IGJkZXZfbnJfc2VjdHMoYmRldik7CiAJc2VjdG9yX3Qgc2VjdG9yID0g
MDsKIAlzdHJ1Y3QgYmxrX3pvbmUgKnpvbmVzOwogCXVuc2lnbmVkIGludCBpLCBucl96b25lczsK
LS0gCjIuMTcuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
