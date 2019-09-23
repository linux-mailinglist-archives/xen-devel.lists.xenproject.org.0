Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A27F3BB726
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 16:51:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCPd2-0000Az-C5; Mon, 23 Sep 2019 14:47:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Dvx=XS=rock-chips.com=hjc@srs-us1.protection.inumbo.net>)
 id 1iCNmf-0004rE-UH
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 12:49:41 +0000
X-Inumbo-ID: 9930aaf8-de00-11e9-978d-bc764e2007e4
Received: from regular1.263xmail.com (unknown [211.150.70.203])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9930aaf8-de00-11e9-978d-bc764e2007e4;
 Mon, 23 Sep 2019 12:49:38 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.175])
 by regular1.263xmail.com (Postfix) with ESMTP id 846603AF;
 Mon, 23 Sep 2019 20:49:34 +0800 (CST)
X-263anti-spam: KSV:0;BIG:0;
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-KSVirus-check: 0
X-ADDR-CHECKED4: 1
X-ABS-CHECKED: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P28975T139999806740224S1569242970112868_; 
 Mon, 23 Sep 2019 20:49:34 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <e80715322c1dd25cac595a7e76606990>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 23 Sep 2019 20:49:10 +0800
Message-Id: <1569242968-183093-3-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569242968-183093-1-git-send-email-hjc@rock-chips.com>
References: <1569242968-183093-1-git-send-email-hjc@rock-chips.com>
X-Mailman-Approved-At: Mon, 23 Sep 2019 14:47:50 +0000
Subject: [Xen-devel] [PATCH 18/36] drm/xen: use bpp instead of cpp for
 drm_format_info
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
Cc: xen-devel@lists.xenproject.org, hjc@rock-chips.com,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9m
cm9udF9rbXMuYwppbmRleCAyMWFkMWMzLi4zMWRlMTQwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94
ZW5fZHJtX2Zyb250X2ttcy5jCkBAIC0xMjMsNyArMTIzLDcgQEAgc3RhdGljIHZvaWQgZGlzcGxh
eV9lbmFibGUoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLAogCiAJcmV0ID0g
eGVuX2RybV9mcm9udF9tb2RlX3NldChwaXBlbGluZSwgY3J0Yy0+eCwgY3J0Yy0+eSwKIAkJCQkg
ICAgIGZiLT53aWR0aCwgZmItPmhlaWdodCwKLQkJCQkgICAgIGZiLT5mb3JtYXQtPmNwcFswXSAq
IDgsCisJCQkJICAgICBmYi0+Zm9ybWF0LT5icHBbMF0sCiAJCQkJICAgICB4ZW5fZHJtX2Zyb250
X2ZiX3RvX2Nvb2tpZShmYikpOwogCiAJaWYgKHJldCkgewotLSAKMi43LjQKCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
