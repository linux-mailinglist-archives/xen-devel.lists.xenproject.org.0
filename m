Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7EA5D599
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 19:47:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiMpf-0007n4-3X; Tue, 02 Jul 2019 17:44:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bnvP=U7=wdc.com=prvs=079d4847f=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hiMof-0007kx-9L
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 17:43:41 +0000
X-Inumbo-ID: eb86be1a-9cf0-11e9-868d-d73a1c6bd9f6
Received: from esa3.hgst.iphmx.com (unknown [216.71.153.141])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb86be1a-9cf0-11e9-868d-d73a1c6bd9f6;
 Tue, 02 Jul 2019 17:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562089418; x=1593625418;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=tQuAUG3c3Ex2NAFDohSdAhtf7sqssbECTSWT+Y11AmQ=;
 b=NxEjYbg92wEHKEOei+oBH0SoG9YEmumTjSwraBLYcGMORpwReTFUu3Fx
 hbMbxYggMuPvc9gOYXGyPG0phQj0yZlBu1IAjQ2JrjqUG/yWUZqTA61l4
 pYvTi2yro12PYReGDSTpDq9h/BZRJkvbNgGBcq09SysY1HDvZNYwWSs//
 6XcmPmsmq6fG7QGma85PbFuFIgdLR6eVaixC6s9R9epx26/5jX6xbD/KZ
 9HwEewUBezjBKrNEH3JeYa8S+d9Ssaii2IdJVJZQDqsQH7e0kocWppYGW
 hZ4alF4MbI1fQrV1ZD1DYJi7QGIQpAkb8WOIlJ1Jv+McUkdp4neVq+YNg A==;
IronPort-SDR: 0KMDCxQVwEg1FJKfTJ9ocndWwiRtytDyutq3Q/SA598muLBX3tE0g0K9CT6wcZAUCEPFuGc80y
 hYplh8q3JRQV3OcoeGI/xO+VbATs+TXF34QQ+q9PPLtwEQD4eiHTXRAh9FJSkZgbNi6+IwJd3G
 2MYUl0pVsECvCI2L2MInAKB7Ck8bEBjtv8H+tjAxbUhHkzX+abW9/5eqknB3GR13iBkg6Z9kgJ
 elkvfZVqvLKOmG+A0trwYt+oOROhj2gZTnXBjBhfmzDq1ISM9bvK0DOX8KEu5J7Ug3fe3htJ2h
 SM0=
X-IronPort-AV: E=Sophos;i="5.63,444,1557158400"; d="scan'208";a="116916599"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2019 01:43:37 +0800
IronPort-SDR: bsE3gykKHyDhvN6hPMnYvPz7lIkV13TzxBQ7iOpFGI0wgmyfSXicTJkBkDrADwmzli1gSMYPOa
 Aehi6aPQFcpRaAMNFXpyoJPxDEjm3C6Yj+1RKr/J5pS5ajTpVlOQFK34H1oVFnuFkvZFqVq+5g
 kIFO8edo5gZtk39x/xQAVK4YRPkv4wCxTu95DhyzZiVBFZVcJUq5qia4QHKxBu7Mj3zBTE/FlE
 H3jM5rIp3zDr6cJg9ToqxSEbJufV5QkKm+qKxU6r7hyGSmEDNluJn05W9mkQuUrNxMQ9wkd3bk
 6Z4c6KyA7cWTgDZqAu/JYE2W
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 02 Jul 2019 10:42:35 -0700
IronPort-SDR: 3pY21X4H4oFet0YyacV+YlVBI/O5kjvwVM4K9RGH+lSxN8T2EcXrvGPqEb2YvDqKJFkrfhunvd
 wPT3NX+wyNa0Yzhxb/uYEWOC4wde2+iswg6SvGEkFsZEG7xl9F9e8Oeh0HWaPS7CCQMwKIe6a2
 GRLymXkPc2sWwjDgBgV2nTvewLvTRednJE1LimHwb7D160IlrHhdJ5+6fX+M/NoUYRwOZ7jWJK
 xH+13m0ZRYpDhSMhKeTSxyUsymuQr84jPMXHTt+eleYamt6aHvlAIY3bJMXzg/m6m51iKwKuyF
 K5M=
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Jul 2019 10:43:36 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Tue,  2 Jul 2019 10:42:33 -0700
Message-Id: <20190702174236.3332-8-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
References: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
X-Mailman-Approved-At: Tue, 02 Jul 2019 17:44:39 +0000
Subject: [Xen-devel] [PATCH V3 7/9] blktrace: use helper in
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
YWNlL2Jsa3RyYWNlLmMgYi9rZXJuZWwvdHJhY2UvYmxrdHJhY2UuYwppbmRleCBlMWM2ZDc5ZmI0
Y2MuLjM1ZmY0OTUwM2I4NSAxMDA2NDQKLS0tIGEva2VybmVsL3RyYWNlL2Jsa3RyYWNlLmMKKysr
IGIva2VybmVsL3RyYWNlL2Jsa3RyYWNlLmMKQEAgLTQ2MSw3ICs0NjEsNyBAQCBzdGF0aWMgdm9p
ZCBibGtfdHJhY2Vfc2V0dXBfbGJhKHN0cnVjdCBibGtfdHJhY2UgKmJ0LAogCiAJaWYgKHBhcnQp
IHsKIAkJYnQtPnN0YXJ0X2xiYSA9IHBhcnQtPnN0YXJ0X3NlY3Q7Ci0JCWJ0LT5lbmRfbGJhID0g
cGFydC0+c3RhcnRfc2VjdCArIHBhcnQtPm5yX3NlY3RzOworCQlidC0+ZW5kX2xiYSA9IHBhcnQt
PnN0YXJ0X3NlY3QgKyBiZGV2X25yX3NlY3RzKGJkZXYpOwogCX0gZWxzZSB7CiAJCWJ0LT5zdGFy
dF9sYmEgPSAwOwogCQlidC0+ZW5kX2xiYSA9IC0xVUxMOwotLSAKMi4xOS4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
