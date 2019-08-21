Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B5397220
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 08:17:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Ju3-0004Q3-Ab; Wed, 21 Aug 2019 06:15:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9TMJ=WR=wdc.com=prvs=12921afdb=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1i0Ju1-0004P8-KN
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 06:15:25 +0000
X-Inumbo-ID: 0fcd9666-c3db-11e9-adc0-12813bfff9fa
Received: from esa2.hgst.iphmx.com (unknown [68.232.143.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0fcd9666-c3db-11e9-adc0-12813bfff9fa;
 Wed, 21 Aug 2019 06:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566368172; x=1597904172;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uCmqVTMs+9n224hBF85AnzvmEf4HCe67ga81BlS6HHI=;
 b=dgZ4AYCa5JPeTgVYGeKhrAUGQ8o/zJ15wX+PhL31aACDuF2rgLNvCARE
 sTZMmHdPqza3YmUk0TDX3xVybaqwury2mkGOY6eoJ1qPVTgBXjf4R2y5p
 +ObTtl9B/maJpuArEkt6TW03EYRJhKfgfEE36rVVLdo0+AzHMye5t6aLf
 A9AhuEniV1GClMGnN7HUzKwfuym3er21GF8TPXkmHc81DyDlgi/Zmh0q1
 k6IMtX0pjPlkcAtpvTSmE0emVwGM49U8FsoBFkVljv6EmLSyPArw5eFmr
 gpCG1ErK8D31sWJdeCVGeOOv9Pm0iEu/4aTIdzcn/MfLsmRx/d8y0YNAS g==;
IronPort-SDR: e9d4u7zv3oHUS2eoop+Oj1q5E4wCyhbzf/rOdqXtt+gIu1HOX16m4cEqwl79SUqGu+P4aeX/Y3
 Ig4v1EuRL/qTD13+8h1ifoQiqwT3epomF1ABRWZTfUUcuw3QoAC76uEnwH/3nqU/zYfQKKxTW2
 eH5Ag1gnhPrxkJaoOl7IqobTaX56Q1yLbOmjmc7Y9lBaS7IxeNp86Sx9sKUWtBEUXGf5ibVhuA
 rgJPx3Vw49NvI4b9iA28FOzgV7FlLhUMhamZnOZYaK293/AIBnyeKTv+uKarz8ujE6YHkoHQu8
 7g0=
X-IronPort-AV: E=Sophos;i="5.64,411,1559491200"; d="scan'208";a="216721112"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Aug 2019 14:16:11 +0800
IronPort-SDR: vs1wc/yGVRhTjMI4TNZtdpd5ETxwGgMRCQwWpq2H1/NkGh0OtDrlNzLfNykbCpk7EJUwVOHRK+
 tB9fbFRSy4tJq/cwOb221AEx/hCgqqkVLpIzjUtDStrKE5VqvOuPh0pP7T0Y0Dv1rDfcchbVvN
 tYOuotR9TsMgnCFjkSlYIiQ7PPxLZ6eUYtDhFIVbeM0RAulxSyKATlZhW8ZrWVifWhmyck64xG
 BvyVFLlSRVFRE4t/sIySJ4uhzvaGHK/ScIijF0nXIqx8XRwFM0dr/qBKbVBk1aPb56Iuos4mPt
 IHDuppRyY/O10fPDIjgiw0+j
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 23:12:46 -0700
IronPort-SDR: OdxGZ+ZIUZXNxHsyk4r1jitBzzOKbws59uKyfKyGqxJAsocaYs8oIxpzZfzjt5ML1whAzbLmaX
 RwM7I6UulMIpLElfhfQc5hYfBEAbff6XiTo6OdUg2IOOnMUz0R9KML2qvnTlEseLVHNS7pyeSc
 9CTOUyji2b5zizhazjbzfCPSVvgrBe56YrLfQaH1Zt4rfNfxQIaRAfBPRZjR9OpapUegl1b+jL
 uJtoBjulj24n+tVENNu5L8VD++n13brc0PAUBMrQdHgf+PQ6TPFgyBzEVVQm4JhNIRu+VBGZP5
 OFY=
WDCIronportException: Internal
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip01.wdc.com with ESMTP; 20 Aug 2019 23:15:24 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Tue, 20 Aug 2019 23:14:23 -0700
Message-Id: <20190821061423.3408-10-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
References: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Subject: [Xen-devel] [COMPILE TESTED PATCH V5 9/9] xen/blkback: use helper
 in vbd_sz()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCB1cGRhdGVzIHRoZSB2YmRfc3ooKSBtYWNybyB3aXRoIG5ld2x5IGludHJvZHVj
ZWQgaGVscGVyCmZ1bmN0aW9uIHRvIHJlYWQgdGhlIG5yX3NlY3RzIGZyb20gYmxvY2sgZGV2aWNl
J3MgaGRfcGFydHMgd2l0aCB0aGUKaGVscCBvZiBwYXJ0X25yX3NlY3RzX3JlYWQoKS4KCkFja2Vk
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAeHh4eHh4eHh4eD4KU2lnbmVkLW9mZi1i
eTogQ2hhaXRhbnlhIEt1bGthcm5pIDxjaGFpdGFueWEua3Vsa2FybmlAd2RjLmNvbT4KLS0tCiBk
cml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2NvbW1vbi5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9j
ay94ZW4tYmxrYmFjay9jb21tb24uaCBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9u
LmgKaW5kZXggMWQzMDAyZDc3M2Y3Li5mOTZjYjhkMWNiOTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
YmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmgKKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFj
ay9jb21tb24uaApAQCAtMzU5LDcgKzM1OSw3IEBAIHN0cnVjdCBwZW5kaW5nX3JlcSB7CiAKIAog
I2RlZmluZSB2YmRfc3ooX3YpCSgoX3YpLT5iZGV2LT5iZF9wYXJ0ID8gXAotCQkJIChfdiktPmJk
ZXYtPmJkX3BhcnQtPm5yX3NlY3RzIDogXAorCQkJICBiZGV2X25yX3NlY3RzKChfdiktPmJkZXYp
IDogXAogCQkJICBnZXRfY2FwYWNpdHkoKF92KS0+YmRldi0+YmRfZGlzaykpCiAKICNkZWZpbmUg
eGVuX2Jsa2lmX2dldChfYikgKGF0b21pY19pbmMoJihfYiktPnJlZmNudCkpCi0tIAoyLjE3LjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
