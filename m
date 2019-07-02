Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7905D59D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 19:48:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiMpf-0007nf-Nh; Tue, 02 Jul 2019 17:44:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bnvP=U7=wdc.com=prvs=079d4847f=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hiMor-0007lZ-CB
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 17:43:53 +0000
X-Inumbo-ID: f4259243-9cf0-11e9-8980-bc764e045a96
Received: from esa5.hgst.iphmx.com (unknown [216.71.153.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f4259243-9cf0-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 17:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562089431; x=1593625431;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=mMR/hpYFy80l7odJC6OZkX7C/Iat9UiqQzK/zSp4tQc=;
 b=cA+190V0AQhFdcag2DHNz7bWnEN75709RLkOyIR3WmL/RABxCdstlkQu
 WU8SDQCHIpQr9V4/75iC4k0A0UZn60IdIq2sA2hXp++2N2/LhxSPOVv6t
 heWbd9run2GqALdKneKyAahz25QWB2Wllmu25Vo4zDO0Kd0+07mFTwNxZ
 oLPuhznxtfOisFpsHmalLrDRltqC/nVMeHg+1BGgZeC/td87QAL08k0OW
 8zdYzVVsuUxne5vzUWDqF1O9T6BqEJWouOZENSMi+itYkKdqhKWLGFr1y
 SDZ/Td74FTNqYcvXSHHij+O+FsZckFdsAluOxO1Wss1mIhRTJYggJ/FnY A==;
IronPort-SDR: mfFwrIJ8KOpNUlfo+Ngtn8WvQ0xhu/6IM3qBEq86jDY43r8N8plygQSuFa8ZwyQRplGecHmx/F
 ykTjzGX3d6G1h23qbyMvgbYNfgz8nYF4ttNQ4vCeMoH/mhB3yq8c6yZ+vmzn/qwntMeati7nLv
 1Rl7R3Cros7mJ54xgTzF45vDHFz7eS/4YLYDinkSw7SvPmaJMXVzGl053bdWyhr/Xcr5kdzgbc
 XyQTdaU+JaaO5A6cEGpnODcr9fgVosaIm1gHU19+tToOr9yPMePlilx9x8DS4kuCFtl85aSRvk
 pKs=
X-IronPort-AV: E=Sophos;i="5.63,444,1557158400"; d="scan'208";a="113269908"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2019 01:43:51 +0800
IronPort-SDR: nvPRVBHqfSRbuCu6iOvb+1m1WyQQ7Tb4LrdESQt8y8MF3fOaX5paecofNiq8PZXfZeDjiaC9Bg
 lI+Q9f+DGItDXHvlKhTUbsSN/0xJCH13VuIM9oGSKMKm+gP9tXY5PZkrqaUguPE4J26htN8R45
 PS6dxX7lPGuMLaxvOVedrgNnvdEG6ywrKggnwSZ8lw8qRtYq3042nNJoC9NWeu7m11ndW9eHHJ
 dXycQBA0Oc1OKAIecgrKHSZfCR34wlM9zqEI/F3+zh0+rgP+HPtzGGoRRq5tKgLjz/P7EPgqDq
 TbmOJTvnh8273PslFfhYs5fx
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 02 Jul 2019 10:42:49 -0700
IronPort-SDR: ZZ3hK2bjvxPpoDYY3dGllgVu8h4y5aH5oKqXW08FxIs6lNu/zSn8Lq0Vc3CKh0UxLaxt9BwD0v
 3fTd0ZB6CA1nNk66QTwybNGG7hulaPt/5JjQ4RaSIjxNw/RiC1ddUlmt5cVduRWWvDMc6DPeRv
 QY23K1dCOsFVfF6zsp2JXeQ1ammNVuRE1dwh/CDI01AburqpZV0KpfKqu1xuzoJfo0j+AG3k47
 ScfjN3W9uVeTshYH+ctIEZjqQRzreo7anBy5gwBbh5bWBmg6n07aXYscmGEGj90oNrBHWiocWt
 PF0=
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Jul 2019 10:43:50 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Tue,  2 Jul 2019 10:42:35 -0700
Message-Id: <20190702174236.3332-10-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
References: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
X-Mailman-Approved-At: Tue, 02 Jul 2019 17:44:39 +0000
Subject: [Xen-devel] [COMPILE TEST ONLY PATCH V3 9/9] xen/blkback: use
 helper in vbd_sz()
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

VGhpcyBwYXRjaCB1cGRhdGVzIHRoZSB2YmRfc3ooKSBtYWNybyB3aXRoIG5ld2x5IGludHJvZHVj
ZWQgaGVscGVyCmZ1bmN0aW9uIHRvIHJlYWQgdGhlIG5yX3NlY3RzIGZyb20gYmxvY2sgZGV2aWNl
J3MgaGRfcGFydHMgd2l0aCB0aGUKaGVscCBvZiBwYXJ0X25yX3NlY3RzX3JlYWQoKS4KClNpZ25l
ZC1vZmYtYnk6IENoYWl0YW55YSBLdWxrYXJuaSA8Y2hhaXRhbnlhLmt1bGthcm5pQHdkYy5jb20+
Ci0tLQogZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9jb21tb24uaCB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmggYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNr
L2NvbW1vbi5oCmluZGV4IDFkMzAwMmQ3NzNmNy4uZjk2Y2I4ZDFjYjk5IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2NvbW1vbi5oCisrKyBiL2RyaXZlcnMvYmxvY2sveGVu
LWJsa2JhY2svY29tbW9uLmgKQEAgLTM1OSw3ICszNTksNyBAQCBzdHJ1Y3QgcGVuZGluZ19yZXEg
ewogCiAKICNkZWZpbmUgdmJkX3N6KF92KQkoKF92KS0+YmRldi0+YmRfcGFydCA/IFwKLQkJCSAo
X3YpLT5iZGV2LT5iZF9wYXJ0LT5ucl9zZWN0cyA6IFwKKwkJCSAgYmRldl9ucl9zZWN0cygoX3Yp
LT5iZGV2KSA6IFwKIAkJCSAgZ2V0X2NhcGFjaXR5KChfdiktPmJkZXYtPmJkX2Rpc2spKQogCiAj
ZGVmaW5lIHhlbl9ibGtpZl9nZXQoX2IpIChhdG9taWNfaW5jKCYoX2IpLT5yZWZjbnQpKQotLSAK
Mi4xOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
