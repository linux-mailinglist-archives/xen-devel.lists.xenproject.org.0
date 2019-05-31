Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 164A330892
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 08:34:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWb4U-0004I5-Ts; Fri, 31 May 2019 06:31:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=USVC=T7=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hWb4T-0004Hy-6o
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 06:31:21 +0000
X-Inumbo-ID: b1d6ccf7-836d-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b1d6ccf7-836d-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 06:31:18 +0000 (UTC)
Received: from localhost.localdomain (61.161.186.150) by
 mxnavi-mail.mxnavi.com (116.90.87.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Fri, 31 May 2019 14:29:05 +0800
From: Baodong Chen <chenbaodong@mxnavi.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 31 May 2019 14:31:08 +0800
Message-ID: <1559284268-8280-1-git-send-email-chenbaodong@mxnavi.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: [Xen-devel] [PATCH] xen: schedule: initialize 'now' when really
 needed
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
Cc: Baodong Chen <chenbaodong@mxnavi.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

d2hlbiAncGVyaW9kaWNfcGVyaW9kJyBpcyB6ZXJvLCB0aGVyZSBpcyBubyBuZWVkIHRvIGluaXRp
YWxpemUgJ25vdycuCgpTaWduZWQtb2ZmLWJ5OiBCYW9kb25nIENoZW4gPGNoZW5iYW9kb25nQG14
bmF2aS5jb20+Ci0tLQogeGVuL2NvbW1vbi9zY2hlZHVsZS5jIHwgMyArKy0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vY29t
bW9uL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKaW5kZXggNjZmMWUyNi4uODYz
NDFiYyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCisrKyBiL3hlbi9jb21tb24v
c2NoZWR1bGUuYwpAQCAtMTM4NSwxMiArMTM4NSwxMyBAQCBsb25nIHNjaGVkX2FkanVzdF9nbG9i
YWwoc3RydWN0IHhlbl9zeXNjdGxfc2NoZWR1bGVyX29wICpvcCkKIAogc3RhdGljIHZvaWQgdmNw
dV9wZXJpb2RpY190aW1lcl93b3JrKHN0cnVjdCB2Y3B1ICp2KQogewotICAgIHNfdGltZV90IG5v
dyA9IE5PVygpOworICAgIHNfdGltZV90IG5vdzsKICAgICBzX3RpbWVfdCBwZXJpb2RpY19uZXh0
X2V2ZW50OwogCiAgICAgaWYgKCB2LT5wZXJpb2RpY19wZXJpb2QgPT0gMCApCiAgICAgICAgIHJl
dHVybjsKIAorICAgIG5vdyA9IE5PVygpOwogICAgIHBlcmlvZGljX25leHRfZXZlbnQgPSB2LT5w
ZXJpb2RpY19sYXN0X2V2ZW50ICsgdi0+cGVyaW9kaWNfcGVyaW9kOwogCiAgICAgaWYgKCBub3cg
Pj0gcGVyaW9kaWNfbmV4dF9ldmVudCApCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
