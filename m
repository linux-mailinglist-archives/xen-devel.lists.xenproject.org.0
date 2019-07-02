Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DC75D598
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 19:47:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiMpd-0007mU-4n; Tue, 02 Jul 2019 17:44:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bnvP=U7=wdc.com=prvs=079d4847f=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hiMnp-0007fK-60
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 17:42:49 +0000
X-Inumbo-ID: cd90e234-9cf0-11e9-8980-bc764e045a96
Received: from esa3.hgst.iphmx.com (unknown [216.71.153.141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cd90e234-9cf0-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 17:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562089367; x=1593625367;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=nzpq2q6z+7BZy2jXxkdotmkGvF20O6oeceGehTa8YQ8=;
 b=aZMZtH1m5/y+e/PLk/YP39cvhrVB6sYhlC1sBM8KllwtnFeulHnkQgm7
 x6Bc9EL37GeL+WzLi42DojhAHbxAk1/ju4HDovdutdOsh4XNEfJ+VFW4D
 lGOuCeiwT/kwNE6r6124LygxEGL7///QaXv5SJRCm/M3YeeqilZB7t1Yu
 Pt/wO1RnpSXR2VqyANWkA9idYpoMVsbpWx/MZ2K0XcDHLcDLzDjBu8etn
 rt7qICFdZl4LIVbsGyJO2jnb/uN40Tmr2j0BK9RBaa2CZEgh0CC8mBJlA
 zgps7nQ02EtXZT73A9/lMOaZCsOtj45VotVxpqvMDC/iAey9eNgg6+smY g==;
IronPort-SDR: ECiyRcIB2FAaIJDzsti6JDTbFe4YHYMEBg91pFuysCyANcEKud5fZ2p8b9agtr4sD/e1bFaP3+
 fj9/3r0ZNWhclFuqiu1FT7pA+gc1GkdOHhfkG+9tOK1Nx6KfRuqVo0Y8eCnOU+JfZQwhYxYM/S
 jjrjIQUfGmta9GniU8HCc4OkmvnFRKowMZpffAvrmcClYnlhnM2SRdSkFFKvJKxw51PXhMun6a
 qpiV+2QmaooYpmceC6CEveRxMsXbjkQviUPZjP8anSZUF0zKr2Zo0E6t8weMaGsJbxAWa5cBlS
 bzQ=
X-IronPort-AV: E=Sophos;i="5.63,444,1557158400"; d="scan'208";a="116916530"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2019 01:42:47 +0800
IronPort-SDR: 7eiwyhzqxRlLi1tqea43WkbeHyECBbk7usevsD+Xz1biXrqGZ4L0silrVQTgvHS5w3vcRIyHo3
 Ow9Bv2tAGqZYSmDV+kt+6Xr8YYF3/TUoYBv5xCBjGp5q6CN3GbQY6MuUWU5455FoMrPrs5gesg
 3GMEFpHsdxcIYOkW3N3ZjA3JNajdZtH6KifkF5ZY2+Sv4Hq39OknS0bc8lySJNafyTtwHUci1J
 +eiRsS2i1tyMulnk3smAIHMIvyqyOdIgTAZx4rntA0+BpNM7ZWqudfQaKJmuLDhVPqBb6AypYD
 h+HRCF4peQFfWzLy7o3OMb6X
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 02 Jul 2019 10:41:45 -0700
IronPort-SDR: PULQy2lnpUjzZmGu5JhOPM0yZ067ec9EuCSAYxpuoeel4NTIXUCfgyS4rhbF25Q7yRUqnKjJjO
 CP1MdvtMJIn2BUXo8nmrX5ayVwfG45PvBnj1Se1hmqO/H2IJqLy+IP8Kg2K+s2Xj+EgkZWW02g
 anJeJj1nyY5U/2ClaYOMcnAe03Lwy49+x9vakB7tPIjcZZdty/SvzK2wSsXbiK+BxED3VRniEP
 eYYWAlSc535zS92ZL8AaU3F97Xew5XRNC2UFo/huZ0jIVGZ/OGA+nQC4AFOvTDhTQ795+4uCYY
 dd0=
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Jul 2019 10:42:45 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Tue,  2 Jul 2019 10:42:27 -0700
Message-Id: <20190702174236.3332-2-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
References: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
X-Mailman-Approved-At: Tue, 02 Jul 2019 17:44:39 +0000
Subject: [Xen-devel] [PATCH V3 1/9] block: add a helper function to read
 nr_setcs
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

VGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGhlbHBlciBmdW5jdGlvbiB0byByZWFkIHRoZSBudW1iZXIg
b2Ygc2VjdG9ycwpmcm9tIHN0cnVjdCBibG9ja19kZXZpY2UtPmJkX3BhcnQgbWVtYmVyLiBGb3Ig
bW9yZSBkZXRhaWxzIFBsZWFzZSByZWZlcgp0byB0aGUgY29tbWVudCBpbiB0aGUgaW5jbHVkZS9s
aW51eC9nZW5oZC5oIGZvciBwYXJ0X25yX3NlY3RzX3JlYWQoKS4KClNpZ25lZC1vZmYtYnk6IENo
YWl0YW55YSBLdWxrYXJuaSA8Y2hhaXRhbnlhLmt1bGthcm5pQHdkYy5jb20+Ci0tLQogaW5jbHVk
ZS9saW51eC9ibGtkZXYuaCB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9ibGtkZXYuaCBiL2luY2x1ZGUvbGludXgv
YmxrZGV2LmgKaW5kZXggNTkyNjY5YmNjNTM2Li5iZTdlZTVhMGIwZGQgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvbGludXgvYmxrZGV2LmgKKysrIGIvaW5jbHVkZS9saW51eC9ibGtkZXYuaApAQCAtMTQ3
NSw2ICsxNDc1LDEyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwdXRfZGV2X3NlY3RvcihTZWN0b3Ig
cCkKIAlwdXRfcGFnZShwLnYpOwogfQogCisvKiBIZWxwZXIgZnVuY3Rpb24gdG8gcmVhZCB0aGUg
YmRldi0+YmRfcGFydC0+bnJfc2VjdHMgKi8KK3N0YXRpYyBpbmxpbmUgc2VjdG9yX3QgYmRldl9u
cl9zZWN0cyhzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2KQoreworCXJldHVybiBwYXJ0X25yX3Nl
Y3RzX3JlYWQoYmRldi0+YmRfcGFydCk7Cit9CisKIGludCBrYmxvY2tkX3NjaGVkdWxlX3dvcmso
c3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKTsKIGludCBrYmxvY2tkX3NjaGVkdWxlX3dvcmtfb24o
aW50IGNwdSwgc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKTsKIGludCBrYmxvY2tkX21vZF9kZWxh
eWVkX3dvcmtfb24oaW50IGNwdSwgc3RydWN0IGRlbGF5ZWRfd29yayAqZHdvcmssIHVuc2lnbmVk
IGxvbmcgZGVsYXkpOwotLSAKMi4xOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
