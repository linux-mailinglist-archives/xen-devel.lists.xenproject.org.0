Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5442C5D594
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 19:47:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiMpf-0007nQ-E1; Tue, 02 Jul 2019 17:44:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bnvP=U7=wdc.com=prvs=079d4847f=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hiMoj-0007lG-ST
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 17:43:45 +0000
X-Inumbo-ID: f02b41ad-9cf0-11e9-8980-bc764e045a96
Received: from esa1.hgst.iphmx.com (unknown [68.232.141.245])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f02b41ad-9cf0-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 17:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562089425; x=1593625425;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=9vWWJtoonwsaTPSwwa0+qd2wOetTCt6y5aKrlPs6UYc=;
 b=Lo4nNWVM+TaAsAs9slJx39j5yFueysZsaZ5YQywXGAOOx8yk6Gxjjr3X
 4+qWgdZ06g+Quu/UShU3Nl/uCYeDasEhr7Anm2Ujq4+HgdByqLyT96wy8
 e4BtprMJiULolOseOeYx6EnZ2nJ7hvtPADg/DujjrSevhFff6hf2oqjTg
 LyAIVafsb58p5Y4aWZuEL0ZxD/EytOoxsmeZlcoF0tid2gJrXX9EfNwFv
 I+QuiUf49xH4LFDJGxehhxdMJ2p9AB3DJLXq2RZchkN4usf3tTIeg1GOn
 3yglokAs3Fd+ug8HSD01GqRD23QQ7U8JV/eyu3/TiSdGG/uCvc1QW6YNp Q==;
IronPort-SDR: MfSUmUDtjeDdHQSsHTzyy0L9Z5CMjLEGqG1egJydV2xkJzXqVB9qf7ZrciJtpY4NkPpKIuyIxy
 hWl+HjgY6u5DAwgNkU19BVtdKGxSpOolBw81aFwDlogGBG97VXtnijgPTarEwAknOlps6RySJw
 qXw6ffDGjvAmOG22ob9ZAOdqWUMbkc8kwtVqUpfTBq6RXuQgLt7qd30lY/gFKRwJZMcPHLteKn
 N54udFK5vPA0e6UNaWHlL/IJ2dHlr4XUo2iqOaJ+UWT/qnutRMiFtF0Hjs5D40GREWVph5uZaM
 R2o=
X-IronPort-AV: E=Sophos;i="5.63,444,1557158400"; d="scan'208";a="218460088"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2019 01:43:44 +0800
IronPort-SDR: sjNWu12K9YADpTjhbmPyEVOIW7FK2GLg2dgAP6W0T31O1rLYNXALoU9weNcPnCd3/mg1ORiEiZ
 i8CToRIp4H1VNH1DKOMiYqDKmZaETpVtSJmzUNbKjBuNujhDK2/tK9JZE9DmeAQIAy9TS8SKt2
 gi/3NzQZE3rWmQIUQY6M4l45wT8RSDEQf4DLWHY9kpWrokHqhXK++scl93is8npCYt8paLamJ8
 0BMB4l9g/KfaTexHWeqqXd1b8FX6v9m634MKIlyG2ESRsl2wfAUtIkjIgpl2NT7/vXbOARe/Ei
 +5Iqq/ky5uDncuxRdO60Bb2d
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 02 Jul 2019 10:42:46 -0700
IronPort-SDR: ws5rnzCM4RcXwdxe4HASEQFLH1dnYxxAMKAgVbT4JHCN2jgx943DO6rHgKP+swJs4M91iIs/sT
 gRrZoE1tIOaM6JyLKSoAUUb8hTK+NRvPlUPi1IJhe9ahYwL9curauLL4rf66dnNNMggCfCsFTI
 3/Y+IKEv41CBry2zrJeQxThbAE0FA5Lf1EnTSrQvqmPHERsJ+iVZtdFiBfteYsvau3GieAffN7
 Ri7patlKy/pzZ/QFGhDZFEMvG9Z+F8UK0U8dEwu/NxE5ZVctxdKWEE4Gv1UuEalLIUAzMIkkPs
 db8=
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Jul 2019 10:43:44 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Tue,  2 Jul 2019 10:42:34 -0700
Message-Id: <20190702174236.3332-9-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
References: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
X-Mailman-Approved-At: Tue, 02 Jul 2019 17:44:39 +0000
Subject: [Xen-devel] [COMPILE TEST ONLY PATCH V3 8/9] target/pscsi: use
 helper in pscsi_get_blocks()
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
CiB9Ci0tIAoyLjE5LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
