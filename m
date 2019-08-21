Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F1E97221
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 08:17:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0JtZ-00040i-99; Wed, 21 Aug 2019 06:14:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9TMJ=WR=wdc.com=prvs=12921afdb=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1i0JtX-0003zY-IU
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 06:14:55 +0000
X-Inumbo-ID: fdb66a7b-c3da-11e9-adc0-12813bfff9fa
Received: from esa2.hgst.iphmx.com (unknown [68.232.143.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fdb66a7b-c3da-11e9-adc0-12813bfff9fa;
 Wed, 21 Aug 2019 06:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566368126; x=1597904126;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=dNQR+/WArddUJx9huMcsBlSubmN9JNdoAJJzC4US2gU=;
 b=A9anQx6bIO4naC5PB1G9WXevQd/HRRBu1/MN7ZPY1YP0VlF7VKcKzVDq
 iEtAzmPWNSx94PvQIdjXajbn/7AFMF+jsaHxfnuXnwOQWBEgaHutbh3ME
 gQp52am86gTMkVd/kBQ+3A2/TQtan68hTByVfFeSAEuqqmXGBnkn1/z8E
 pqPEDEPt+V4mvYXpHBoQukzAhvVtI874YBtTSRZ9z2B7WJOZTwX5At89D
 WiJwt516+cdJESYRYFwAlwe9iZuDWPtMD1IoGSu2jQvajg6d9k9PXJ1lM
 mHxg5JdG/uwuNZefBM6Zrwzn9ZhKEodzW2oHR2eCdBguKFxD+o/Rkg1pO w==;
IronPort-SDR: rfiKeW2PSYgY1/818PQmlT0ItGSPJZJNGJTe8z9Zk11wlKBKkDWqUeWUjaZyqkl1xH3iikMixj
 cpIWlCumZ+QwTYN6CH1/DrCrQZV6dgIyVXf4k7y6xJoU1ZxilHHxcc5jog7lybNGoLPpaSw0A1
 UzW+g3XAhqzyLQH7jqdmhREErTpulFnfuKwxtvT7e3CnFYoYDGT6pt9ky0GfyFmCTgTanmuYEn
 0ymn4QoOR1305DiFAZpsZNrTDqfwTmPQJhJlzH3V7+agtKhXz/dH5B8Xuu8dc1D/lqpaKDmD/d
 g+c=
X-IronPort-AV: E=Sophos;i="5.64,411,1559491200"; d="scan'208";a="216721088"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Aug 2019 14:15:25 +0800
IronPort-SDR: xuF51Ei9CYb8jjqtod4lAhT87w4TmEBmkRgt0ChoLDr8emBvuOUaNtnQbkQlM6j7HS3WIFflem
 jnF+4oFYMkqGJwx7eUk+VgzAcI+4mzQDGqzRrPD9KESvTjg7dF76hsMQWbNeZZ2eDxrv8Bt51E
 obdoa7HCz5RqE3oq9szN3Qvb97s9PzOcxCY8XTQtik01weJ2xbitadoucyvK1Fz0YsuROBJBUc
 oDyANNgZ+e5oqev2oSIj2IjXJERBlz435/5LzbR8xaKArmnwrtXmgiyXEkTIOYG8Y4cIB0mwj4
 mVPFucG6OfK4rhNopnkcDrs1
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 23:12:15 -0700
IronPort-SDR: WGDSV7zozYwbRlbZcH9Vsh+dYPGAeQLVyYHbXF8UemtuqeBj1gbc3L2/qhUPOCHpvgps3+qYTw
 6KCzf/ZLXk78xFV6cdmLogFtTGmboLlw3XK2ceoI6b2c+M7ALIPJEQThmicDSyitL7i3yOytT1
 v+4Y82D+aKvlSZujII8U7Id+Kevc5LUiaZ6XBwmp2zgzzCpxiE2eRE2BNPGklnoPiudQmcQiOV
 UcqacoGyWtWWVgxu10FPvyFGi3BggvrpIAb2Pyel4K/An3TBhmBU9rAfhfEJ4/GlAyYSvjR3bp
 +mc=
WDCIronportException: Internal
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip01.wdc.com with ESMTP; 20 Aug 2019 23:14:53 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Tue, 20 Aug 2019 23:14:18 -0700
Message-Id: <20190821061423.3408-5-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
References: <20190821061423.3408-1-chaitanya.kulkarni@wdc.com>
Subject: [Xen-devel] [PATCH V5 4/9] blk-zoned: update blkdev_reset_zones()
 with helper
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

VGhpcyBwYXRjaCB1cGRhdGVzIHRoZSBibGtkZXZfcmVzZXRfem9uZXMoKSB3aXRoIG5ld2x5IGlu
dHJvZHVjZWQKaGVscGVyIGZ1bmN0aW9uIHRvIHJlYWQgdGhlIG5yX3NlY3RzIGZyb20gYmxvY2sg
ZGV2aWNlJ3MgaGRfcGFydHMgd2l0aAp0aGUgaGVscCBvZiBwYXJ0X25yX3NlY3RzX3JlYWQoKS4K
ClJldmlld2VkLWJ5OiBNaW53b28gSW0gPG1pbndvby5pbS5kZXZAZ21haWwuY29tPgpTaWduZWQt
b2ZmLWJ5OiBDaGFpdGFueWEgS3Vsa2FybmkgPGNoYWl0YW55YS5rdWxrYXJuaUB3ZGMuY29tPgot
LS0KIGJsb2NrL2Jsay16b25lZC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Jsb2NrL2Jsay16b25lZC5jIGIv
YmxvY2svYmxrLXpvbmVkLmMKaW5kZXggN2UwYzBiNTRkMTk0Li41M2Y5ZGYzNzZjZmIgMTAwNjQ0
Ci0tLSBhL2Jsb2NrL2Jsay16b25lZC5jCisrKyBiL2Jsb2NrL2Jsay16b25lZC5jCkBAIC0yNjcs
NyArMjY3LDcgQEAgaW50IGJsa2Rldl9yZXNldF96b25lcyhzdHJ1Y3QgYmxvY2tfZGV2aWNlICpi
ZGV2LAogCWlmIChiZGV2X3JlYWRfb25seShiZGV2KSkKIAkJcmV0dXJuIC1FUEVSTTsKIAotCWlm
ICghbnJfc2VjdG9ycyB8fCBlbmRfc2VjdG9yID4gYmRldi0+YmRfcGFydC0+bnJfc2VjdHMpCisJ
aWYgKCFucl9zZWN0b3JzIHx8IGVuZF9zZWN0b3IgPiBiZGV2X25yX3NlY3RzKGJkZXYpKQogCQkv
KiBPdXQgb2YgcmFuZ2UgKi8KIAkJcmV0dXJuIC1FSU5WQUw7CiAKQEAgLTI4MCw3ICsyODAsNyBA
QCBpbnQgYmxrZGV2X3Jlc2V0X3pvbmVzKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsCiAJCXJl
dHVybiAtRUlOVkFMOwogCiAJaWYgKChucl9zZWN0b3JzICYgKHpvbmVfc2VjdG9ycyAtIDEpKSAm
JgotCSAgICBlbmRfc2VjdG9yICE9IGJkZXYtPmJkX3BhcnQtPm5yX3NlY3RzKQorCSAgICBlbmRf
c2VjdG9yICE9IGJkZXZfbnJfc2VjdHMoYmRldikpCiAJCXJldHVybiAtRUlOVkFMOwogCiAJYmxr
X3N0YXJ0X3BsdWcoJnBsdWcpOwotLSAKMi4xNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
