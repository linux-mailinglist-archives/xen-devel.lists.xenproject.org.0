Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3AB628B9
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 20:50:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkYgG-0005GT-Dy; Mon, 08 Jul 2019 18:48:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Un8F=VF=wdc.com=prvs=0852429f4=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hkYgE-0005Fp-Hn
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 18:48:02 +0000
X-Inumbo-ID: e7a0dd84-a1b0-11e9-91f4-3f1952ca1c11
Received: from esa1.hgst.iphmx.com (unknown [68.232.141.245])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7a0dd84-a1b0-11e9-91f4-3f1952ca1c11;
 Mon, 08 Jul 2019 18:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562611678; x=1594147678;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=z034C0lu3K9Pmhpbgqrk0VEPLsTVbThXKUwaZzmZN9k=;
 b=ntZqPbqf5yQyYKuT73EMffoJ728XDecBRWkzz9lH8qLcWf2xMVh4DtWh
 whr9DA6gEbTQV/dBqXFqCY5BUpyBe7LiLgEW3Fg5VJP8kmp8IEM791VQK
 wufXTu5q2XUXF+euptvV6xBLshopGeXvaZ4kKUvSfut/fzomsDPpgLjm7
 ILLwxv+UitONEBWfH7y544h+pQLxi2ONAi1SYfdGOF3n+aim4dFKtUeiw
 tyLzPDrVgpMJY4xveqC9Q0rxGaCt5TYMBFnjIkadnou7QjztcmJeM5q/A
 kxWg1oNchHpbTrnV7+ROUz28LbpWnfrrBW7pr/mYB9Ux4iNmMgFxQfnzm g==;
IronPort-SDR: GPOI4FGeiHYVLU2GTywxO4tPZt/4Rw0taNSit2n+tLuHxKxHWCMPZFwENP/RWw75B6wURP5IhP
 nYVvWArCCVIv+4Ai6Vey6Q0bTWBa/BJIFExF0xLtdqHZoT/biWSBZQM+d7Wvjs1m7oNVkrpAAv
 2waG9/YlkYMeHS/P726prkpJv+piR1Ek01Xfc+UMntTMt5i63sBBfB29wnweK2SbRpTHPJR05u
 s49+q/MLGbcmwwvgBi2Yluja7SsvMcN9YZjTwm/NUEMVy6gUFnGkLwci7oojaYk9qNLQEo9SQC
 i6w=
X-IronPort-AV: E=Sophos;i="5.63,466,1557158400"; d="scan'208";a="218874433"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2019 02:47:58 +0800
IronPort-SDR: pgapf2a9tSDKjkhuBN6mEbnjnd9i9Z52utoNLhBZn4Re79512AVypCxEnpOP3i5gOhWiAMWnFp
 Xrfw2XWCVngko9+LEDULkN94GLwsL+hZWWjMOKew86LFKzNDnX8SRqn2n12neKTWxOIGaPj38Y
 Ii1XTCBOwrqYYtfxHs+dhz305p/r77L9429xUt/TawS37g2bSDj2tbLHqz5szLM5gRy5w90zEH
 6x9nojv1Xc83gVR5jH8k9MaGQAksoVFCBjBFjoA/vwn8qj5LFFbBw3qnqN++Z5vqkYRb+GArOV
 XFjP8KDJO8STl7uQl9P+S/El
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 08 Jul 2019 11:46:46 -0700
IronPort-SDR: /lvUb5Q0myDa5zcgSkRV5mq0xWp1dDUOhPS4Wf9cFbmpG/IvRSSGEJ9lGM8k7Pjd6GkWTfDTv+
 avvWzfyzdR+eOgrKUapLjgHI2vMsorvgoJy9+HYsgkE8YYl214niu7w2HnG8nciCH6ySy43zmH
 ohwVHaTLIjzccyfIkUQ95mnACdoPRdlSU5MIKSY0Z7xcK7GgXG7jb4ypPBfDeBz7hFQfKTcB1z
 axureZOqr+I/9iazjQ5dwfRkKdkMZP03pkSPzM+08pOLf2ElGq3Di+24xjBJ7cTOHtOLO4EHwy
 eec=
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jul 2019 11:47:57 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Mon,  8 Jul 2019 11:47:09 -0700
Message-Id: <20190708184711.2984-8-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
References: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
Subject: [Xen-devel] [PATCH V4 7/9] blktrace: use helper in
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
dF9sYmEgPSAwOwogCQlidC0+ZW5kX2xiYSA9IC0xVUxMOwotLSAKMi4xNy4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
