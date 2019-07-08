Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE20A628BF
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 20:50:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkYgJ-0005IK-OD; Mon, 08 Jul 2019 18:48:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Un8F=VF=wdc.com=prvs=0852429f4=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hkYgI-0005Ho-Pb
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 18:48:06 +0000
X-Inumbo-ID: ea53c820-a1b0-11e9-a29c-f76cf8b67431
Received: from esa1.hgst.iphmx.com (unknown [68.232.141.245])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea53c820-a1b0-11e9-a29c-f76cf8b67431;
 Mon, 08 Jul 2019 18:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562611683; x=1594147683;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=9HCTUA025JIZSm64FGSGpZxpfChbQ94lvGtg+dmKvTo=;
 b=DK2EioRQ9/WEfpCU2JZ1MUa9aEfst7J7UpNOaY0ygb5XP2MDQgK6IoCK
 BhqNfs1+rdQN0XeNcnsNBHlAUog043hezMIE3e9JeGO1iUOkLd2+nRQsm
 kKwdc3oCFZNkmBIw1HfPlXcHCG9Y01ZboOb2vzgMOBilcWvUHSAgQrueb
 9CEKB/v7t7LN2bbHcStqSBSDo6ahqXAJTNiahkgBhv0Xj9OukLAaSHcpe
 paWfKjZGINo5JEiVxtGXKL/37NWHtrcpt7TxFMCc8b+xlxQ548gt6Cekk
 ot3EzwmkINpV4bqJtDYbHq6RUmy+OBYubHxNTYEu9nMVXlBGIWNO7FBxK g==;
IronPort-SDR: GjJURN+IAbSDrU/URckutHVGzUgZBYJmRMXBymDr43cGG+c1si/VH2U5Axt1VbHWNGI5XyWGRX
 RgpZzHx5+wqTTzKavNd+pU9USr/5b4E4LWWZ2heTIPv6wPpBZFpMfhedZ8He2mmQfgMsANG4Z5
 nztPUspEaF259SARvRIcaPWSwxzPPikj6IDJlDQR5limexpWFR3Bed4+wYWS/Sbism39i1jmHW
 mj7Nlcfncb58ea7IvBmESvNZ0eE4R16+/SNeiJ67yxQzx40MxbJXQqHspJzndvtn6JuPDvyfcr
 nLA=
X-IronPort-AV: E=Sophos;i="5.63,466,1557158400"; d="scan'208";a="218874437"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2019 02:48:02 +0800
IronPort-SDR: ai80TSm8aqVpjcyCOnf7Khn3zSC0gG4ONWuuU/ys1eLuBX9JB6KRTdDhorzSQLnnE4fMOCuM3O
 s4kwwHOtOUL5W+I/SRWGNrDWQpV/RQoSqY62xJsTYE2ckSFqBMwYDFInYCzI+IcM8WUbfTRgiw
 7MokmE6vg1zcObZlfDIdkAmzoN8mFGb8IHUZFqtjLmRswg60E8j8p9ygjKwVAj/L9clUnvMKOk
 P57gnu64tqAqCxpdvQjmu6CGpKxvun5cYTqec8bc1+MbzCzJhEKXWfodWmaXo6gFAjLD5p18IT
 HXFbYfem0OlrS5WWftXgFxsB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 08 Jul 2019 11:46:51 -0700
IronPort-SDR: IANeuyJ1+oRIdNc63u5j8ED18tDaGyZU+gvHhHZl87+2ajQm6m/jQpodcxPNu6UDb5asJbFKCF
 6kz3QDjj06c+UBwngWRsx/wVxzGhe9RxGj9M6n8nOLjRppziguHG7Au4OsvD9KbRnMH5je9sId
 HZ4Az4HgCGj+Ik8pP5ZOAxIWgro9VZXW9hO0HsvtN/hE2ky3WsAJ8tq8rmu1xhjScNYGWeQANg
 CM/zAZ7im7Ix2Wx+pAYuDpo1aK5GRVnwAfHYBnzr+C01DF6NPe1R8G3EOZVTfz4MlWW3FOijlF
 U58=
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jul 2019 11:48:02 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Mon,  8 Jul 2019 11:47:10 -0700
Message-Id: <20190708184711.2984-9-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
References: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
Subject: [Xen-devel] [PATCH V4 8/9] target/pscsi: use helper in
 pscsi_get_blocks()
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
CiB9Ci0tIAoyLjE3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
