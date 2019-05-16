Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E861FCD3
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 02:07:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hR3sX-0004IS-7u; Thu, 16 May 2019 00:04:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N00O=TQ=wdc.com=prvs=032022a23=alistair.francis@srs-us1.protection.inumbo.net>)
 id 1hR3sV-0004II-AJ
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 00:04:07 +0000
X-Inumbo-ID: 1da7bc26-776e-11e9-8257-630f5d490aed
Received: from esa4.hgst.iphmx.com (unknown [216.71.154.42])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1da7bc26-776e-11e9-8257-630f5d490aed;
 Thu, 16 May 2019 00:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1557965045; x=1589501045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q/UzrBvRxvOS0LQCi5/0c71uLFhAEU2zMNH7t+1u0uI=;
 b=DWMVcengM7iAj4Zw1hBjQ1+xY8b8v1SmHxqAk2cyPbjPQLDh8kWjfJ1r
 CTpmDNjZyeV+KtAvx35Ds+zrJIFlwKOGRZ6dMVTr6V515G3sjpyqPVMFx
 aKUesgiATDzuBOVwCvVF58in69CZhPCY9eAqjQFSpiib6qS4GIBS+LOyz
 wFqrzaTbdpe6JBTbzqDcV/yT+T6YuDyMarGhGEbH0zqbHHoY7zCMBn+64
 eJCxCirHZMECR3/rzKMI9NY6FQ8VyEACc/AhaHUktzHF6MSOiWZ6DpgwD
 VUGf/5Bl+5uXxqHRphL2zEJyioxPkpiri5cftwaAIsXro2xw7VCHdWKbe w==;
X-IronPort-AV: E=Sophos;i="5.60,474,1549900800"; d="scan'208";a="108370048"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 May 2019 08:04:04 +0800
IronPort-SDR: OoebBl9MUVGPlUbVOVtyFW40iTHyakpi1P9NG6nygbNVb5ZabehSJNuI5JZvtxwtiqGVzInJc1
 aRXCaeMgr3HGaoDn+as/3FvgUO/aRhveHKQdppU+AWwifukWCEc/+Tr6RkZk3L82YBTbYWW2lb
 uxPyyOeLMyI2ZHHm7E8q7LdKBs7R8Sm/abswSibVB0gbjxioHiDfgJ+7gF2l+l+c9Mz/2QlaSp
 QXnu9lmwEnfeZq9k+RdlWskcW24YKF7yxR4ap3qkCZPTMkAnhPz/mTzmCkOw+AQF4zR8WF1EHq
 ZJ/I5Hu3KwtLyo4Sq0G4cKC5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 15 May 2019 16:41:58 -0700
IronPort-SDR: WQv8m6FkAAo81uDVj4kRLIzqVlXSQ4BEfuxYATQvv9o/C1M9DomcerCu+bncZs79uKq6I40ZQz
 St5q7FRixnXVvgPz2RuN2FSpdjgoQOq/nFFdxmEeVNvW4rCRem0UfrhcV0jXt9B9n9KWm0ohwB
 XEePnvIlPV8poCCqMPGrsVGJ2AJZggDlOaTA7EXf46oYQbLDQ+cWDgadZO4i6Mx6xQO3HJrhp4
 00jWh6i2o3VVWdDA25dBIBo4+5zMrF6pzOPLDXftNAbCUTri0modcfcBYyL9TiXkDKlx6OWbAf
 Zow=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.140])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 May 2019 17:04:04 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 15 May 2019 17:02:11 -0700
Message-Id: <20190516000212.13468-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190516000212.13468-1-alistair.francis@wdc.com>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/3] xen/drivers/char: Don't require vpl011 for
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
Cc: wei.liu2@citrix.com, Alistair Francis <alistair.francis@wdc.com>,
 ian.jackson@eu.citrix.com, alistair23@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TWFrZSB0aGUgYXNtL3ZwbDAxMS5oIGRlcGVuZGVudCBvbiB0aGUgQVJNIGFyY2hpdGVjdHVyZS4K
ClNpZ25lZC1vZmYtYnk6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNv
bT4KLS0tCiB4ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJz
L2NoYXIvY29uc29sZS5jIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKaW5kZXggOWJiY2Iw
ZjU3YS4uZjg0MGQ5OTliYyAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMK
KysrIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKQEAgLTM2LDcgKzM2LDcgQEAKICNpZmRl
ZiBDT05GSUdfWDg2CiAjaW5jbHVkZSA8eGVuL2NvbnNvbGVkLmg+CiAjaW5jbHVkZSA8YXNtL2d1
ZXN0Lmg+Ci0jZWxzZQorI2VsaWYgQ09ORklHX0FSTQogI2luY2x1ZGUgPGFzbS92cGwwMTEuaD4K
ICNlbmRpZgogCi0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
