Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 620F223E2E
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 19:17:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSlsS-00083J-Ql; Mon, 20 May 2019 17:15:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qpne=TU=wdc.com=prvs=036de673d=alistair.francis@srs-us1.protection.inumbo.net>)
 id 1hSlsQ-00083B-QN
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 17:15:07 +0000
X-Inumbo-ID: cf397ea0-7b22-11e9-8980-bc764e045a96
Received: from esa5.hgst.iphmx.com (unknown [216.71.153.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cf397ea0-7b22-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 17:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1558372505; x=1589908505;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+5+QsN4lc8iskRPzrAqNVnHXw/lYxZR/PmVtloQLXlQ=;
 b=VlUBj74SRq3rgBKiJ5wbYiWT1MyL8wns+5p9Z8B/lKkSBqPpsjbEo9HO
 V2qrLXAug3H+U/VvnjDIchEXVIch1jWTY2Xf/T7wAfCscjN2Rvh6TPFer
 DDksUrcMXIyfgj9K8GhAiq6sH/6Zn8LiXCvb0yqWFDj2a0Mfk5sR/qKcu
 kAsAsqhZuONzZT1VpMnb7FypHtBSXhRRI6vfoazGqW32sKo/YZz80U/z/
 yRI0lrXE830xN8dg3X4aMvITkebJmP1yjUWECfNxTAlL4YjczQ3LqZp6w
 s+gsyf3oanX1CXVWdFcB6dU1vVEGPtk13q4R9Srp66JRd+C+Zyoocs3yu A==;
X-IronPort-AV: E=Sophos;i="5.60,492,1549900800"; d="scan'208";a="109919435"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 May 2019 01:15:05 +0800
IronPort-SDR: 22Xe879QHw2+nNSPWFO7gmBy0gqI7p005WFEpvFikFqVM9wqNoUS4yh/oCHSaSRQjw5FoaTJvj
 /+cYFvuqDXynvjoJ35x9WLQFHiPuCUrGm3Kq9fSfc8Hu+TxU4bIlA7UIPD5fUwRb6lM/dgMEBE
 2B4isBfA2yryxCyZgPAKeFSt+b2853UMajdi2Ni2UlHdBhdvgGMpjGfg9Js/mgVFNot0bs7+EZ
 UplruRtNXQpEVWhk9hTIJAUFi6t1Wa7W2fb+LtXCaGu4NfehMiU4Jx0qgBnEPtbz/IVrHRxTtu
 RhuHO5lhg0m970dH6nI4b84q
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 20 May 2019 09:52:51 -0700
IronPort-SDR: 4I5/b0ch2VvSujOPu8OrAdRNQVjyLpNtVVi/aCyIyOdv/OuE4l+WlmrH1fEzdlCnQrZRoY8lpy
 uylUWybjCrr0Le45Ikf1sElRb164BCfgrEEbE1Mevd7EjN89vc3D4igMl9kSrSG92Ln5J8whO7
 mQTZO8nqZwHECHpdtEAaiaWbUtA9wkZrAKt4ijQH/CYdQTxomZ81i/eBpdhX0hZi0vpSycs9Dy
 98vWsdqtl7s4hFOZEQOQJQp4E4BfqE8BfL9pXwbA4TqFXKF4lO+hGgsLY5KaZ0vutuqyTtfFK1
 pgc=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.140])
 by uls-op-cesaip01.wdc.com with ESMTP; 20 May 2019 10:15:04 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 20 May 2019 10:13:15 -0700
Message-Id: <20190520171315.12026-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] xen/drivers/char: Don't require vpl011 for
 all non-x86 archs
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
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, tim@xen.org,
 julien.grall@arm.com, Alistair Francis <alistair.francis@wdc.com>,
 jbeulich@suse.com, andrew.cooper3@citrix.com, alistair23@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TWFrZSB0aGUgYXNtL3ZwbDAxMS5oIGRlcGVuZGVudCBvbiB0aGUgQ09ORklHX1NCU0FfVlVBUlRf
Q09OU09MRSBkZWZpbmUuCgpTaWduZWQtb2ZmLWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFp
ci5mcmFuY2lzQHdkYy5jb20+Ci0tLQogeGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29s
ZS5jCmluZGV4IDliYmNiMGY1N2EuLjI0Mjg3ZTU5Y2IgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJz
L2NoYXIvY29uc29sZS5jCisrKyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCkBAIC0zNiw3
ICszNiw3IEBACiAjaWZkZWYgQ09ORklHX1g4NgogI2luY2x1ZGUgPHhlbi9jb25zb2xlZC5oPgog
I2luY2x1ZGUgPGFzbS9ndWVzdC5oPgotI2Vsc2UKKyNlbGlmIENPTkZJR19TQlNBX1ZVQVJUX0NP
TlNPTEUKICNpbmNsdWRlIDxhc20vdnBsMDExLmg+CiAjZW5kaWYKIAotLSAKMi4yMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
