Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58642628C2
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 20:50:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkYfv-00057h-9r; Mon, 08 Jul 2019 18:47:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Un8F=VF=wdc.com=prvs=0852429f4=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hkYft-00056n-19
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 18:47:41 +0000
X-Inumbo-ID: dc6df01b-a1b0-11e9-8980-bc764e045a96
Received: from esa3.hgst.iphmx.com (unknown [216.71.153.141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dc6df01b-a1b0-11e9-8980-bc764e045a96;
 Mon, 08 Jul 2019 18:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562611660; x=1594147660;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=TRJ5mIHEpUFUMoE20YZUADV3tKY+JE58H4HrPBkkQ1M=;
 b=RRemQHUudUe9qclr4zzg/Lb7ptwYbqk5TfKSYFkWEs55hkaPDPZpL7lS
 26krxYahP7DQKKEij8rfG2AQzRDZX+vAG6hJgcSDg4JYIWSEbrE7XdTmX
 l1K3hukRf66zf0HxA35EnA0CpWSIKiv3pQExJwiy2wd7Q/X85FOUPR8ju
 czuTlLHWcBaNmi/peJhCEmCgvR9E5R6JvNlAIH/wUuAe1J3dwK/kHYklz
 prwwJVloT1ek3K9eEqD+6E/5ZwUBsHw9lkhFpzVQSHgnWfI1HEjO0d68I
 pCLz08nHw8etjMEcxmCJdMEcuwNt+aT94pWIN6Y8xUA5B36+0M6b6figD A==;
IronPort-SDR: CbdudkSwxJA8k/ST1T/kuCKTasUlMSaZ0W74scRtFUjAIjT6mFX6jJX02IGEOEHWkoK6jraOke
 coZxJKxpJs5222ImR5/ihhroR/uTPRCx1L5ltgx1iobIpocwWr2XGRsCcBGOJVoLblwhGovhwq
 rVvEusmKmLAjw6+64573aY1PFZb3YwHJxCXiDOUPG1XWfpjqJTiUo+/LlpXWQ1N7bGkJZdMLDg
 Z0nfJLvQvcMtzGbDtaQDTUsM17d+QWaHO0ub4F9zhh3oKN3VqXJpcWxqwT27HdXtuLH87PsfIc
 Gng=
X-IronPort-AV: E=Sophos;i="5.63,466,1557158400"; d="scan'208";a="117296118"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2019 02:47:40 +0800
IronPort-SDR: XY0WglFWpV3/4cUYIQPdy3gAEJ1U7hNu/ZTMEPFc5d/tspiKCmICqDtJl6woC8v1V4ESqRz9ea
 fObvbAADRwUIsRZZHTZY3FIedLrwK+tQVvjf4XsaKFVZRnK+DVx9VyO5sUkfRVkoA8kRnmsMRo
 867YXe48p8YCoQJZcEZABolp07mxoMyqXf0yoIdrWHlO6Z1f1XxrI/n9OjDGimCiYTK87cS9DP
 i+819Bp48BCkWsjAM3JeqPXuXzTZkWhWSmQA1MhEl3d2xtgsZ0TVbACOUQXdkbtWrEYVEhwq88
 EHQCMzYgcY4J3NDWEvCMxtsZ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 08 Jul 2019 11:46:28 -0700
IronPort-SDR: e+wnXG2Mz3gtPkzW6JVqDomjkR+WsCClgTYVA68ZPRVD1/JbzvZKAnfiawuajy721alH/4cYAz
 83R6mt/izAcA3wYqxabLbqAjyVd0jNtKCxpgAgTCPzpasYEs7lbnvuC3N4aFMecDj6sBrnSifF
 82Ij40bI/YXlgLYOhl/4Oh93z3ngwfXd/OnW7O5HcGk/NS0jd+rAtkLqTzWO6jaL9i1E18+AqJ
 7S99xr7IczGeGB6g7ryoF5o2/SFFru90R9W1IEnAhWc+kyfKs7iZ6KzcqN/cZ5rpgMFzYrCS1q
 EiI=
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jul 2019 11:47:39 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Mon,  8 Jul 2019 11:47:06 -0700
Message-Id: <20190708184711.2984-5-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
References: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
Subject: [Xen-devel] [PATCH V4 4/9] blk-zoned: update blkdev_reset_zones()
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
ClNpZ25lZC1vZmYtYnk6IENoYWl0YW55YSBLdWxrYXJuaSA8Y2hhaXRhbnlhLmt1bGthcm5pQHdk
Yy5jb20+Ci0tLQogYmxvY2svYmxrLXpvbmVkLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYmxvY2svYmxrLXpv
bmVkLmMgYi9ibG9jay9ibGstem9uZWQuYwppbmRleCA5ZmFmNDQ4ODMzOWQuLmU3ZjI4NzRiNWQz
NyAxMDA2NDQKLS0tIGEvYmxvY2svYmxrLXpvbmVkLmMKKysrIGIvYmxvY2svYmxrLXpvbmVkLmMK
QEAgLTIyOSw3ICsyMjksNyBAQCBpbnQgYmxrZGV2X3Jlc2V0X3pvbmVzKHN0cnVjdCBibG9ja19k
ZXZpY2UgKmJkZXYsCiAJaWYgKGJkZXZfcmVhZF9vbmx5KGJkZXYpKQogCQlyZXR1cm4gLUVQRVJN
OwogCi0JaWYgKCFucl9zZWN0b3JzIHx8IGVuZF9zZWN0b3IgPiBiZGV2LT5iZF9wYXJ0LT5ucl9z
ZWN0cykKKwlpZiAoIW5yX3NlY3RvcnMgfHwgZW5kX3NlY3RvciA+IGJkZXZfbnJfc2VjdHMoYmRl
dikpCiAJCS8qIE91dCBvZiByYW5nZSAqLwogCQlyZXR1cm4gLUVJTlZBTDsKIApAQCAtMjM5LDcg
KzIzOSw3IEBAIGludCBibGtkZXZfcmVzZXRfem9uZXMoc3RydWN0IGJsb2NrX2RldmljZSAqYmRl
diwKIAkJcmV0dXJuIC1FSU5WQUw7CiAKIAlpZiAoKG5yX3NlY3RvcnMgJiAoem9uZV9zZWN0b3Jz
IC0gMSkpICYmCi0JICAgIGVuZF9zZWN0b3IgIT0gYmRldi0+YmRfcGFydC0+bnJfc2VjdHMpCisJ
ICAgIGVuZF9zZWN0b3IgIT0gYmRldl9ucl9zZWN0cyhiZGV2KSkKIAkJcmV0dXJuIC1FSU5WQUw7
CiAKIAlibGtfc3RhcnRfcGx1ZygmcGx1Zyk7Ci0tIAoyLjE3LjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
