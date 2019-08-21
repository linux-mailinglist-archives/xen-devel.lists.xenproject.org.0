Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 871659721D
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 08:16:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Jtr-0004IF-NM; Wed, 21 Aug 2019 06:15:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9TMJ=WR=wdc.com=prvs=12921afdb=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1i0Jtq-0004HQ-5v
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 06:15:14 +0000
X-Inumbo-ID: 08cefe72-c3db-11e9-8980-bc764e2007e4
Received: from esa6.hgst.iphmx.com (unknown [216.71.154.45])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08cefe72-c3db-11e9-8980-bc764e2007e4;
 Wed, 21 Aug 2019 06:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566368113; x=1597904113;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=D8YDUL5tZ05jSVemJWK/Wkcu4fkxmHw2a5twadHpA8s=;
 b=fvIMHJZmy7nxIAAoibjPzhsQguo6zFDc3jnb0nelgobqNC77sLaG5hGM
 FIa8j7xHknUPE7ux6Ptgv097FD6W7cS7l2vGTF8Jsjn3fLfgWDySo8rU7
 wxQZdG7vKNUdoaB5f2H3+RGyXkXkZgRAHZ3rxI2/tTkzQW91kcR30sunh
 PZjAtFhltBYAFuJ1tODRVQBTeOtzGrUwzgMCp6ZuFpKJ00XUwRn0uSE4s
 F41NhM7FdQ5z0uhzrcHQnj14HBVlqlh2DOl2gtEz+/ijvtKBpiwRdhrQa
 aLQ9ge05xmrAwKwLwes6+JJBW3rRtagP0uRrxrXCuN8RB7hIbjvzrpEVN w==;
IronPort-SDR: f99C7JuoOOLlVUxfYCTSggoZBtafhjy1FSb4QzAEHkZAV0Er6RPC1l7Xd2mVFWQS9vv2Mg8qxT
 pt3KPrZQkvfEnu2ZtHx1sFpK+EizeaehgT0EGnNAqGycx3J9KjqiTd7/F9WjMrPYXZ1dupgEcR
 MK0mjaeUks8hQxMwNjkKHL6KpNgFqw2412eYzUZKwh7QI4d5rzDIdtudnQ/jo7VhrQbh/VHrEb
 mBVCGSg4jgSWeezmHxd00JvQlJxIowFSenjzIp7MTooaWSTLOqaBGX5wbaYvd6gwGVMM6V/42a
 ZjI=
X-IronPort-AV: E=Sophos;i="5.64,411,1559491200"; d="scan'208";a="117904723"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Aug 2019 14:15:12 +0800
IronPort-SDR: 7ybJ0sJ/FhmmPtwXJeFV9uvC/bHzoF2IUZ5gPs7OxlbfN9DmZwRrjmzL81bBlMPnGaq7RqN1nQ
 mKbnLuJxHd6eVfgGBeCXhINdHDfQDPT5jOtbb81ANjxq6cPpP0jbgYxvwp9g+9Iuf8ACcyhL14
 qsEb0Zn0LnxuAMBVxESpH+PpnbZ+7ppbN9IcciLtdLn+IKX8LSKP4QSjK0caN8mDNDrT/eKIbG
 M1MtqU4YiUjgf4+r4HJk/9InaNSFhXRSV7CCJvjYSl8EoVmVuVAerQJK9n2mqQFzz6hUk1iaLV
 QyevNsWTI/tFBULgnzRbyu3a
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 23:12:34 -0700
IronPort-SDR: BYJvRAQ6DwECniwHRLKaUr9x6qRGDsHdaIfg1ud9IVxV9yCvCNuNuKVUzzdBhpZt47I0lH4/y6
 r8D53/P4Z9aK688Qqew0ezt7T/dj/JP9UbtCLxA9CqauIB04CofRKbjlP7H/hR6qwV2wLWIY73
 tGseFCARD4wk5lDXH51RNjF4YV0l1IIhsgm3K/Cp29/2cpd8FPo2YMLKOYoeTxyJ07eENw5NDl
 SHreBRLB3prhQjINcF9sFUTYXHo04Vn7uy1MBlNW+yKasuLS/7NJkLGl8Z0zDzbZJCuoLufFp4
 AG8=
WDCIronportException: Internal
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip01.wdc.com with ESMTP; 20 Aug 2019 23:15:12 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Tue, 20 Aug 2019 23:14:21 -0700
Message-Id: <20190821061423.3408-8-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
References: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
Subject: [Xen-devel] [PATCH V5 7/9] blktrace: use helper in
 blk_trace_setup_lba()
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

VGhpcyBwYXRjaCB1cGRhdGVzIHRoZSBibGtfdHJhY2Vfc2V0dXBfbGJhKCkgd2l0aCBuZXdseSBp
bnRyb2R1Y2VkCmhlbHBlciBmdW5jdGlvbiB0byByZWFkIHRoZSBucl9zZWN0cyBmcm9tIGJsb2Nr
IGRldmljZSdzIGhkX3BhcnRzIHdpdGgKdGhlIGhlbHAgb2YgcGFydF9ucl9zZWN0c19yZWFkKCku
CgpTaWduZWQtb2ZmLWJ5OiBDaGFpdGFueWEgS3Vsa2FybmkgPGNoYWl0YW55YS5rdWxrYXJuaUB3
ZGMuY29tPgotLS0KIGtlcm5lbC90cmFjZS9ibGt0cmFjZS5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEva2VybmVsL3Ry
YWNlL2Jsa3RyYWNlLmMgYi9rZXJuZWwvdHJhY2UvYmxrdHJhY2UuYwppbmRleCAyZDZlOTNhYjA0
NzguLjgwMWY4YzQ2NWJmZiAxMDA2NDQKLS0tIGEva2VybmVsL3RyYWNlL2Jsa3RyYWNlLmMKKysr
IGIva2VybmVsL3RyYWNlL2Jsa3RyYWNlLmMKQEAgLTQ2MSw3ICs0NjEsNyBAQCBzdGF0aWMgdm9p
ZCBibGtfdHJhY2Vfc2V0dXBfbGJhKHN0cnVjdCBibGtfdHJhY2UgKmJ0LAogCiAJaWYgKHBhcnQp
IHsKIAkJYnQtPnN0YXJ0X2xiYSA9IHBhcnQtPnN0YXJ0X3NlY3Q7Ci0JCWJ0LT5lbmRfbGJhID0g
cGFydC0+c3RhcnRfc2VjdCArIHBhcnQtPm5yX3NlY3RzOworCQlidC0+ZW5kX2xiYSA9IHBhcnQt
PnN0YXJ0X3NlY3QgKyBiZGV2X25yX3NlY3RzKGJkZXYpOwogCX0gZWxzZSB7CiAJCWJ0LT5zdGFy
dF9sYmEgPSAwOwogCQlidC0+ZW5kX2xiYSA9IC0xVUxMOwotLSAKMi4xNy4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
