Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEB597226
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 08:17:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Jte-00042n-Il; Wed, 21 Aug 2019 06:15:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9TMJ=WR=wdc.com=prvs=12921afdb=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1i0Jtc-00042B-KJ
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 06:15:00 +0000
X-Inumbo-ID: fdbb3334-c3da-11e9-adc0-12813bfff9fa
Received: from esa4.hgst.iphmx.com (unknown [216.71.154.42])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fdbb3334-c3da-11e9-adc0-12813bfff9fa;
 Wed, 21 Aug 2019 06:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566368095; x=1597904095;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=KskMhIccdhyYejQPXHxAAXs3ig7LJbUasu+JL5qAjTA=;
 b=XpZmSoG4hf6l8cR4oMbYVP2uZMDk2QEwg86sBwq9bZXT/Af3TR09SrI/
 YcEFPylMmees2A1HItETeuhZtGAxOZSNKpYJreVqYTGuUPbjUfyhmO3Ms
 M6d0OUvdj5MhVg7992E5/vqmDLEPzonVbmEHlDMKq7evIcLzkM9EZf1U1
 XVjB6mIMPB3qHcNcLVOEqC4b+nawK4pYnn0YESUKcJLZYo2A/2mspytDo
 iJPCFva/n1HFl8x/K4/tYYJ3E7pcBsc+biKYDdTE6ONC/krMN/dDTFVdn
 79GUhnRGLAf4JeQ+aD1CU4uzb2zBGNPbwZMaa5y3heHWDNGC0QzqtFUCr g==;
IronPort-SDR: 7ez0SONoiXesEQU7bNEd5zbizOK8jI0GeO8h6r5c5ju+eHCfmsL0TrDg/JoUFUkuFyDgSkcVsl
 7iop/6Uewj1u6m57INEs9F851nFcGd1EgzKgdP9oX16k0hIysvyMblKE0OvQQHV7HGmaMMjOhv
 z6cvPrZBJ2jHalQeYk3xaWmpFVvaukB5lJgX9qjqozMoTEFWUGXfeMJjJGRwf9z1IwApduYyYA
 3iBgl+ms56ddnbGASe4cPIP0Qoor3HlH/0G5d5d4VWz1zQpEIgyK78SSmp43S6nwxRhlvlKRKt
 5pA=
X-IronPort-AV: E=Sophos;i="5.64,411,1559491200"; d="scan'208";a="116306279"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Aug 2019 14:14:41 +0800
IronPort-SDR: 7PeBxu+NbZm3bFmEoO7jxZGjtzgHNXTJuWbQQIr99YrCXMX8ctUGsP1bA5JCvyWTp3sD8vD+TH
 Pf8YqISMpomxhaQI706Tr0GN0F5V+Q8qvrlRZGiIbGkDOS28j0svYZ0rAN2OozwMx3TU15poC7
 161Cw9C5ynlTb/ozFiIqyAZ+dwtJ2AP6b7UCsz47yhEW7xsyX9qDiXuIXIBjJW+yX7lZptgNvn
 VsgJZgLpUQi73X3MvyHKayTBZTkCkuuotgay8yAwQ45dLWl+NDzSpsyQrCkF+2TgbCs9dQA8Ol
 QNrN6bRdghtgQSQNjEaGy4jO
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 23:12:02 -0700
IronPort-SDR: Wkxy2ajw+rcxmh/A1OPQtV/EVpqzu8VQYhbba5Ebo14vmpR//tFwqZJh/KAarh6nBHY302sfLS
 f9y+8m+P7OM4ikcpCf+hrIOkI8rUOheGzIZa7JJEOFgHfeh6fIDpHabHw92QGl2m+MUfpkURBP
 lQz6Vvn3QwxeIwdmkjnxoiS9l0kPa0JFCdZzE8f2tfJpY+Er+2QWJkbPr0OEM04oU8Z5q+nDf8
 HlWWVyH6PtIzzUMmJlH7BSX4MKo4ABaBnXMVRa0qDzPRLG7b3ovnpkJMU1P6TTZ7PmsuGmT6Ci
 NZg=
WDCIronportException: Internal
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip01.wdc.com with ESMTP; 20 Aug 2019 23:14:40 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Tue, 20 Aug 2019 23:14:16 -0700
Message-Id: <20190821061423.3408-3-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
References: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
Subject: [Xen-devel] [PATCH V5 2/9] blk-zoned: update blkdev_nr_zones() with
 helper
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

VGhpcyBwYXRjaCB1cGRhdGVzIHRoZSBibGtkZXZfbnJfem9uZXMoKSB3aXRoIG5ld2x5IGludHJv
ZHVjZWQgaGVscGVyCmZ1bmN0aW9uIHRvIHJlYWQgdGhlIG5yX3NlY3RzIGZyb20gYmxvY2sgZGV2
aWNlJ3MgaGRfcGFydHMgd2l0aCB0aGUKaGVscCBpZiBwYXJ0X25yX3NlY3RzX3JlYWQoKS4KClJl
dmlld2VkLWJ5OiBNaW53b28gSW0gPG1pbndvby5pbS5kZXZAZ21haWwuY29tPgpTaWduZWQtb2Zm
LWJ5OiBDaGFpdGFueWEgS3Vsa2FybmkgPGNoYWl0YW55YS5rdWxrYXJuaUB3ZGMuY29tPgotLS0K
IGJsb2NrL2Jsay16b25lZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYmxvY2svYmxrLXpvbmVkLmMgYi9ibG9jay9i
bGstem9uZWQuYwppbmRleCA0YmM1ZjI2MDI0OGEuLjNmNWU5YmYwMzQ4NiAxMDA2NDQKLS0tIGEv
YmxvY2svYmxrLXpvbmVkLmMKKysrIGIvYmxvY2svYmxrLXpvbmVkLmMKQEAgLTkzLDcgKzkzLDcg
QEAgdW5zaWduZWQgaW50IGJsa2Rldl9ucl96b25lcyhzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2
KQogCWlmICghYmxrX3F1ZXVlX2lzX3pvbmVkKHEpKQogCQlyZXR1cm4gMDsKIAotCXJldHVybiBf
X2Jsa2Rldl9ucl96b25lcyhxLCBiZGV2LT5iZF9wYXJ0LT5ucl9zZWN0cyk7CisJcmV0dXJuIF9f
YmxrZGV2X25yX3pvbmVzKHEsIGJkZXZfbnJfc2VjdHMoYmRldikpOwogfQogRVhQT1JUX1NZTUJP
TF9HUEwoYmxrZGV2X25yX3pvbmVzKTsKIAotLSAKMi4xNy4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
