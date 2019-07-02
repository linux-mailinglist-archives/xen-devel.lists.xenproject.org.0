Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE2C5D595
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 19:47:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiMpe-0007my-OU; Tue, 02 Jul 2019 17:44:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bnvP=U7=wdc.com=prvs=079d4847f=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hiMoX-0007jz-1o
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 17:43:33 +0000
X-Inumbo-ID: e72ec434-9cf0-11e9-9bd0-5b11cd547710
Received: from esa6.hgst.iphmx.com (unknown [216.71.154.45])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e72ec434-9cf0-11e9-9bd0-5b11cd547710;
 Tue, 02 Jul 2019 17:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562089410; x=1593625410;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=QJX4vVEET/cgf8iBmo/HOlI2NJ0ZitkZSdSK+c4gaYI=;
 b=Ds9yEL1m57Tp/N9JW6/jKMUOimCqaSTSztTJjgCBLNCojecV3rBS+Y0p
 dhbSP1o/kd1LnVpYvTJ9GEXwwcRZ04EFQP72BldfhJdLxYQYX1h5qW2HX
 GtSyrBEfMuXSFFRz3D4xZUKW6RPiW8aj7igHGPB4+f9jV11J+wA5yzt86
 m3kBByZ0TKbpt0LYmwul9gP14DB8JmviWCj3oM+PaBVJY6g8jfjaXDlAY
 +/o5fiKAeNwiazUtI902gy1+1N7vctK5D/Z4QsDaKyezBD3doszMNw6Vl
 LlYKEEmCYIY+YdqoOnjaWLucqIcGqgyqZaFc9h50FV3sNyKR6IdlNTZCY A==;
IronPort-SDR: 4UYBVhJkXgcn4hosYc0hccVZoUsZfn0N5IFJUtX3Tp19dVwRYV+5USbhcMX0vmGrE2f/6Ko9Qu
 4qTZUsH35M5zP8b9oVpInmT2d2AG01TgyTQ9uXJ1LOJ36WWZU8L+T5huoiCiIa3J3KrVV4QWMV
 e+c+uQIW63dhiGjov0Bsqi+qGe33zt8KXqdFh5SSya6NED9m3cxeRroThL/akDkzWdBrZccg6/
 6Ut5lNIBZl94pRpWE+5zaVklKQYTHqT/G5vf/AF4KUKBDnzt9zW1f9WZt90CoSWtvmDTdugRRe
 b40=
X-IronPort-AV: E=Sophos;i="5.63,444,1557158400"; d="scan'208";a="113690601"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2019 01:43:30 +0800
IronPort-SDR: 0sF9KysnfnbLIMqkElyQ4h1XSIL9/6mYN3ho7miagpz3n/K5qkxOB877pdM4kGhGgsg1cs4kcP
 bNZPay9V1W4/XJZxMn5hYleZ3UqC8bmmWUHU8KY07gnOZhJuM6PWkvBbykIFX/ZYfzBOO14uy7
 S+Qla7b8fbZ+u69+9LFPV911ntr1QXSC5wQsJzKU3F62YrtQzwY4w0Wq+fBKCUQIZ0G3NftHkr
 ohgDoqXKuuyprXgEAelf0z2d02kwm8FdoKGF9Bbfar3IROLntho+1DRT6wmVn2fwoVI1hJP4E6
 drxH9eS8MJYMN3YoILHgPBs2
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 02 Jul 2019 10:42:31 -0700
IronPort-SDR: ssIi3J7cwArdcczUeEkcZs9ezBQgj3OwOLdLv88ozquc48L2yozLcD/FTp4rI+DlfYhQ2ig1nZ
 qfMH2sJn0PhKKSsZPZW7HXsPijWKL2zjyuKifOuL2vyMBwlFx/+OH8+GiF/hJcNhoXFnzc8Bwu
 Jvdu1GD12g+loQ+0d9RR2EtmcKzyWs4g+mWjX0KWARasXSVKim51O5L2Bzl3UZjOKsMqooggHr
 fiZjAFF7OxS4tB0pB39LHvxUDr47KJ8bPRthGzl8Q34b0q2drY7f9KPoZtYIW7lTI9y++cqaME
 zdw=
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Jul 2019 10:43:29 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Tue,  2 Jul 2019 10:42:32 -0700
Message-Id: <20190702174236.3332-7-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
References: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
X-Mailman-Approved-At: Tue, 02 Jul 2019 17:44:39 +0000
Subject: [Xen-devel] [PATCH V3 6/9] f2fs: use helper in init_blkz_info()
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
LS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
