Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FFE25A4F
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 00:30:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTDD7-0005Fv-MJ; Tue, 21 May 2019 22:26:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fYR2=TV=wdc.com=prvs=03708bf4b=alistair.francis@srs-us1.protection.inumbo.net>)
 id 1hTDD5-0005Fp-MV
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 22:26:16 +0000
X-Inumbo-ID: 7121dad2-7c17-11e9-b2a6-07c4c40b6a82
Received: from esa2.hgst.iphmx.com (unknown [68.232.143.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7121dad2-7c17-11e9-b2a6-07c4c40b6a82;
 Tue, 21 May 2019 22:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1558477594; x=1590013594;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8Dj8lOWT/s8wxxQiC8btpXWZgOzbpBWJpx34D2NpPKA=;
 b=qb/y0wlMTZrhDroNlWLCQ2raDrcbAGnl1bypeXctseRQMw1UpzIdudI3
 fn7Al8VKjVWGW1sBm8vO573rxTvCXa7Gsej1mcbDrdGa6OtWNT/qOoKBp
 OD0js6UfvopOfaAbAEFPbzkvgs74trUiNsUz2XXxGl96zFieTEKu/VUsQ
 wxTVwbkJ3A6on0s5690s9qreGNWAuJDo+ldntBP4i0uTNaBas3DQOWmqc
 Abn9jYcrRp7dhCnMDbm0p6vpoMOZ+2Tfu2or1gQIGMSQ5YqzRT/c/kBlR
 +d/bwks4MFjC80HkJETdD6lNoMLxobUaHqZuJpW9iL7KS3omn9iHDzO9p g==;
X-IronPort-AV: E=Sophos;i="5.60,496,1549900800"; d="scan'208";a="208259356"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 May 2019 06:26:32 +0800
IronPort-SDR: GnC31co28Gfe4AsqlfzWbC8wwZCMD9vA1Ol8Er2pKAj5YeVBk9Tq6RQXKRvQOGdGf9TjL2YkaG
 7I7bEQKRBvienfF/DmGonZp71V6uyVv28OKO2+NBYlPWTz5jV4jRYXL2SeF//dhZf3OaGmSNBZ
 crcpITEKd7NLizkZZEXWWcyhRvqai2A/elK584pRMCnjBcTdsHa1uPE4wkf3CZeQe1FRO6CORX
 3tDWGYpWMqGHKarctzR6IFBI6YO0X1tsemEeV22B+NjxwQ9FUVOrTMThTHkgVXGd6D+za7N0Mi
 Iriihs7Z/N20LDddy/QVxnS2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 21 May 2019 15:01:36 -0700
IronPort-SDR: JIdPz49vuLYUEFp82wQt9o1BLfhzbAJXAYrY+Yr201Yr0ITRkrmrex1Zt07z+gYkM7wT1MMAHl
 CueSJMj9F0n2W5HL5Z1Ye4QO/1TRzG8PCCLK4tnI890scxyDNUOzQIaNSABGpoe/O6YKWAQl8y
 w/jRnnXjRanBKh/so1I7hrxH1FfD6iKOb8d2yUY4cWDj1A36ddZKBM2p7ToKDsTWarEkbZVYGY
 LBTycFdMHHoU38j9uTH4ELdwLmVsx7WWCA6bZ15P2xk1LrBu4scBHS3Zo/QuW2US1fWArObbBj
 5+k=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.140])
 by uls-op-cesaip01.wdc.com with ESMTP; 21 May 2019 15:26:13 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 May 2019 15:24:18 -0700
Message-Id: <20190521222418.27107-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3] xen/drivers/char: Protect the asm/vpl011.h
 include
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

VGhlIG9ubHkgdXNlIG9mIGFzbS92cGwwMTEuaCBpcyBwcm90ZWN0ZWQgYnkgdGhlIENPTkZJR19T
QlNBX1ZVQVJUX0NPTlNPTEUKZGVmaW5lIHNvIGxldHMgcHJvdGVjdCB0aGUgaW5jbHVkZSBhcyB3
ZWxsLgoKU2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3
ZGMuY29tPgotLS0KIHYzOgogIC0gUmV3b3JrIGNvbW1pdCB0aXRsZSBhbmQgbWVzc2FnZQogIC0g
U3BsaXQgaXQgaW50byBhIHNlcGVyYXRlIGlmZGVmCgogeGVuL2RyaXZlcnMvY2hhci9jb25zb2xl
LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jIGIveGVuL2RyaXZlcnMv
Y2hhci9jb25zb2xlLmMKaW5kZXggMzhlY2Q5YzAxNS4uZDcyOGU3MzdkMSAxMDA2NDQKLS0tIGEv
eGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKKysrIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xl
LmMKQEAgLTM2LDcgKzM2LDggQEAKICNpZmRlZiBDT05GSUdfWDg2CiAjaW5jbHVkZSA8eGVuL2Nv
bnNvbGVkLmg+CiAjaW5jbHVkZSA8YXNtL2d1ZXN0Lmg+Ci0jZWxzZQorI2VuZGlmCisjaWZkZWYg
Q09ORklHX1NCU0FfVlVBUlRfQ09OU09MRQogI2luY2x1ZGUgPGFzbS92cGwwMTEuaD4KICNlbmRp
ZgogCi0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
