Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D15897229
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 08:17:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Jty-0004MX-04; Wed, 21 Aug 2019 06:15:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9TMJ=WR=wdc.com=prvs=12921afdb=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1i0Jtw-0004Lc-IF
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 06:15:20 +0000
X-Inumbo-ID: 0cb1f54e-c3db-11e9-8980-bc764e2007e4
Received: from esa2.hgst.iphmx.com (unknown [68.232.143.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0cb1f54e-c3db-11e9-8980-bc764e2007e4;
 Wed, 21 Aug 2019 06:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566368164; x=1597904164;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=9HCTUA025JIZSm64FGSGpZxpfChbQ94lvGtg+dmKvTo=;
 b=hucN0T2xVYZVLdPx0AuXGLb+BL8r3GJXKXl7C2vCnAeV1Bo3tLUTuGBF
 WSroQ1nMhK+zepVGB4O0b+N5d+2HO2Ccum+/1ko6GBkhW13HcamTnqIj5
 RFNoOOeTQjr68lL6tbTqSbs5neF9XMaRr6Og0ZjTfYl+hJE5PcG0mNTjI
 scBazf5zU3ASJz05hFgWD0KBG9hXSRFR8hkyGj5zd9gtItKWGaYQ7QhHW
 19TV6cHy3KZyGzp390HekPbRsHurLIs4Tp9LF1IcFw0mhQvDpVqFPtTy7
 FcBr3n0+wwcZUkc2tkKLt5XdhgcggON+w/eWKJnxUODZRgJEc043L9ouF g==;
IronPort-SDR: ESuskfTbwZvU/ioZ4wD03fqJkd53Nvi+fcpFUfou1Ibdl8h9F+k0HeUy4+6nk3p/6XLxgTtbzy
 VLaCDOm4OgjbJ45Zs4scVJPXebObXDYhlT4Uov11KmZ4qg5J8MTprnjalLPiksTZ4Uvtzjzusm
 Fv8Au7lG3mSBzWHTfc6DUJzzRrnO8kiAqeMJoggvqLK3w2QnkDu71hPDWC8xGLWL1sp4tCbITI
 MgV/7uy8F17XcFX5XqbEVQNLY+OBZlDi6lYdS0mGAvoG1tRekUjtjWyXLqu0tbM9VpLguzHpoc
 XAI=
X-IronPort-AV: E=Sophos;i="5.64,411,1559491200"; d="scan'208";a="216721107"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Aug 2019 14:16:03 +0800
IronPort-SDR: L182bfiB4orBuGOY1RLDtsfrLuQy+fuRgRsvKWyzbi/Wk9tNCtkJEN+VCkNtBxR9v1+cNCvo7g
 JMNNT3bKVBz6esG51NWChzGOA96fhW2botYV0XSHiZW3TMCf++qleBVay2bLrJkcjv/KcYa2nC
 /yu9TriDM6tsec0fS+g5xnkSfYNkQOzIx82Nd+89G38wQkDMHbVDtIw1RnlZBGaNmBvsW40AP9
 294JpDud7s7araDwTzAaBoTgQl89wpV/E2tfA9kpXSjCmGItXZgAxZ2w+dKMXTKqX4heY/p3we
 P6hpdkAsRk+56QkfnFBpFIPz
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 23:12:40 -0700
IronPort-SDR: 1yyzw1PKyEPWh8uB2oJ4KRZ7o5fJYOCS3TLjOfJjglT/lGWvLyF7NmCbICpqjeV9uwoFw7sBmV
 nJoZ8sJ5Wdusbzi2NM2t1/6bvQvetVzJBResAGi6iRHNn8y3zCfRh7I9MBJXBsny6rNr83aMIx
 uqewzTGkqWRbDAG1nxzDKivWsjDb/QHL9tkpqMGfM2elRtbSBA3gZ1zdEE2ldZAXE6deT1xBWI
 U7VASCa1lSf94SNnDxADwyjBizyM8Y+ZkI/gi6oZJV3ZNsGYz6OiM/GGSlOshqrL1LpuA25Xqd
 ZrU=
WDCIronportException: Internal
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip01.wdc.com with ESMTP; 20 Aug 2019 23:15:18 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Tue, 20 Aug 2019 23:14:22 -0700
Message-Id: <20190821061423.3408-9-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
References: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
Subject: [Xen-devel] [COMPILE TESTED PATCH V5 8/9] target/pscsi: use helper
 in pscsi_get_blocks()
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

VGhpcyBwYXRjaCB1cGRhdGVzIHRoZSBwc2NzaV9nZXRfYmxvY2tzKCkgd2l0aCBuZXdseSBpbnRy
b2R1Y2VkIGhlbHBlcgpmdW5jdGlvbiB0byByZWFkIHRoZSBucl9zZWN0cyBmcm9tIGJsb2NrIGRl
dmljZSdzIGhkX3BhcnRzIHdpdGggdGhlCmhlbHAgb2YgcGFydF9ucl9zZWN0c19yZWFkKCkuCgpT
aWduZWQtb2ZmLWJ5OiBDaGFpdGFueWEgS3Vsa2FybmkgPGNoYWl0YW55YS5rdWxrYXJuaUB3ZGMu
Y29tPgotLS0KIGRyaXZlcnMvdGFyZ2V0L3RhcmdldF9jb3JlX3BzY3NpLmMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3RhcmdldC90YXJnZXRfY29yZV9wc2NzaS5jIGIvZHJpdmVycy90YXJnZXQvdGFyZ2V0
X2NvcmVfcHNjc2kuYwppbmRleCBjOWQ5MmIzZTc3N2QuLmRhNDgxZWRhYjJkZSAxMDA2NDQKLS0t
IGEvZHJpdmVycy90YXJnZXQvdGFyZ2V0X2NvcmVfcHNjc2kuYworKysgYi9kcml2ZXJzL3Rhcmdl
dC90YXJnZXRfY29yZV9wc2NzaS5jCkBAIC0xMDMwLDcgKzEwMzAsNyBAQCBzdGF0aWMgc2VjdG9y
X3QgcHNjc2lfZ2V0X2Jsb2NrcyhzdHJ1Y3Qgc2VfZGV2aWNlICpkZXYpCiAJc3RydWN0IHBzY3Np
X2Rldl92aXJ0ICpwZHYgPSBQU0NTSV9ERVYoZGV2KTsKIAogCWlmIChwZHYtPnBkdl9iZCAmJiBw
ZHYtPnBkdl9iZC0+YmRfcGFydCkKLQkJcmV0dXJuIHBkdi0+cGR2X2JkLT5iZF9wYXJ0LT5ucl9z
ZWN0czsKKwkJcmV0dXJuIGJkZXZfbnJfc2VjdHMocGR2LT5wZHZfYmQpOwogCiAJcmV0dXJuIDA7
CiB9Ci0tIAoyLjE3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
