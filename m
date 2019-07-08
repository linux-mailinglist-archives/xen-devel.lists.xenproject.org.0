Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 449F6628BA
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 20:50:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkYgO-0005Kk-3Q; Mon, 08 Jul 2019 18:48:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Un8F=VF=wdc.com=prvs=0852429f4=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hkYgM-0005KM-UF
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 18:48:10 +0000
X-Inumbo-ID: edbbe65a-a1b0-11e9-914c-93fab66bc129
Received: from esa3.hgst.iphmx.com (unknown [216.71.153.141])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id edbbe65a-a1b0-11e9-914c-93fab66bc129;
 Mon, 08 Jul 2019 18:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562611690; x=1594147690;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=PIKkEzI8jjM5eH2i58/XfLrTPoIAapkGFdyFIcgq7l0=;
 b=hVeMfYoQwOh87fxW/1POHqjfrCuT/gE4UgWpLkck4poS9TsRRW08jqQ1
 eoBQ2WCgqkbr3BN3BXElG0xb64azU2vWgr9NpbqHSxyDYDpqzRkr0db62
 nhqFllmySPYJJKM61QgXUm49V1fI0h0O+NdL+2zxBtxATgC1EqT1rAqrr
 iI0pAOSHLOVUXNpUL2MqOR9ZGk4pdcibyheMsmRbjb0SoDE0KL9SIJCLe
 +Cweoni3EUgk2aoIlL+MRPatOXXfo9/aWKqlCE4FmhWGjbI0y+O+YhL+u
 KaxKjiM4zsyjnBRjZthn7khJ8uTGcwDQbN2i7PInZN1wBNE7grkDMclVx Q==;
IronPort-SDR: F0idmnkdb/Uqc+L+EDumMXodl8HeXZKv2i1lWyg0/J75hTb+W1oPbB6GehUYU7zNb9P14EmvHc
 Ns2D1nViU7nl9N1wh2dsJKZEMtid+556OQ1F1wRYqZ5gHdH1ghX5H4QNZd2zKpVlWVhAeHp9oG
 Fo8cnRUaBizsf4MnRJIp+yH6xZPVYGIsCbTi18yRHAVt2fmsjVOJE4krrpU6H2fxsBPFFMIvik
 dyEjRb9r/lu0t9X6hAjqtUIFLd5qjw2dxhpmTyQI/4GUY6IpUt2lzeWDbRir41Fdr/nWPP1lSE
 gHM=
X-IronPort-AV: E=Sophos;i="5.63,466,1557158400"; d="scan'208";a="117296149"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2019 02:48:09 +0800
IronPort-SDR: k5CLCTRIXL8NVfF+90wz1N+uhMuumeYYOfOd2K881zxPInqq5vVRyno0KD218RaQh+eJdnbHIr
 60/lkVb93N7VDQpYbkDB/1BawxNwQetZsSj4Glhk5kjzLeEAObIKRLxmfDRDRJ8UuoS5CfzF+I
 7wPQerGsaAaobT6lPsLY0/v+M7fCXOqCjSjnhSCIqTQBD4A0abyQpGXabrMYk4BDts+x+zOSWP
 ZMNvN67qm1LjShUdyrZgGml5SM1ohrYqOc69fY6NoeYP/fdUoN3Dsz6qEIyDAJ+1/vUpfXsCyn
 6aJcgsEHAKTlJ+fr5vLU4rVe
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 08 Jul 2019 11:46:57 -0700
IronPort-SDR: 26GGS3luZiL/5ckkNXHpZvmNp3T9hhLG9lVgKoii3ZrNjTfbn7JDDAdDbg3EYAFCavGLZwgseq
 bZ492xPRRMIg5a4Q/mNnufyTTDO/6t+CSUsrr62FgCwL4fDxOvEe5/ShBeTSWY/Bvhpct7909Q
 fLEbyMa16Zyu2TnBE7i5FRyyZVF0XAyIGTClGLHEislCugo9rwiVPBoIuTe8R03DFt4VG2cZH/
 zk0t7Rms1al8fiv4wzxJ/f7DZivEmKC0K+mbDMQKseLJ16+Ye4oALigBMwGdWxAp4zWEJdV9tr
 7V0=
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jul 2019 11:48:08 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Mon,  8 Jul 2019 11:47:11 -0700
Message-Id: <20190708184711.2984-10-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
References: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
Subject: [Xen-devel] [PATCH V4 9/9] xen/blkback: use helper in vbd_sz()
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
Mi4xNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
