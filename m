Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 468C51094E5
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 22:01:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZLQx-000337-Es; Mon, 25 Nov 2019 20:58:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZR4G=ZR=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1iZLQv-000332-Ok
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 20:58:09 +0000
X-Inumbo-ID: 473ce87d-0fc6-11ea-a396-12813bfff9fa
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 473ce87d-0fc6-11ea-a396-12813bfff9fa;
 Mon, 25 Nov 2019 20:58:08 +0000 (UTC)
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 25 Nov 2019 15:58:00 -0500
Message-ID: <20191125205800.64602-1-jeff.kubascik@dornerworks.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.27.13.171]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: [Xen-devel] [PATCH v2] xen/arm: initialize vpl011 flag register
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHR4L3J4IGZpZm8gZmxhZ3Mgd2VyZSBub3Qgc2V0IHdoZW4gdGhlIHZwbDAxMSBpcyBpbml0
aWFsaXplZC4gVGhpcwppcyBhIHByb2JsZW0gZm9yIGNlcnRhaW4gZ3Vlc3RzIHRoYXQgYXJlIG9w
ZXJhdGluZyBpbiBwb2xsZWQgbW9kZSwgYXMgYQpndWVzdCB3aWxsIGdlbmVyYWxseSBjaGVjayB0
aGUgcnggZmlmbyBlbXB0eSBmbGFnIHRvIGRldGVybWluZSBpZiB0aGVyZQppcyBkYXRhIGJlZm9y
ZSBkb2luZyBhIHJlYWQuIFRoZSByZXN1bHQgaXMgYSBjb250aW51b3VzIHNwYW0gb2YgdGhlCm1l
c3NhZ2UgInZwbDAxMTogVW5leHBlY3RlZCBJTiByaW5nIGJ1ZmZlciBlbXB0eSIgYmVmb3JlIHRo
ZSBmaXJzdCB2YWxpZApjaGFyYWN0ZXIgaXMgcmVjZWl2ZWQuIFRoaXMgaW5pdGlhbGl6ZXMgdGhl
IGZsYWcgc3RhdHVzIHJlZ2lzdGVyIHRvIHRoZQpkZWZhdWx0IHNwZWNpZmllZCBpbiB0aGUgUEww
MTEgdGVjaG5pY2FsIHJlZmVyZW5jZSBtYW51YWwuCgpTaWduZWQtb2ZmLWJ5OiBKZWZmIEt1YmFz
Y2lrIDxqZWZmLmt1YmFzY2lrQGRvcm5lcndvcmtzLmNvbT4KCkNoYW5nZXMgaW4gdjI6Ci0gTW92
ZWQgdWFydGZyIGluaXRpYWxpemF0aW9uIHRvIGxhdGVyIHBvaW50IGluIGZ1bmN0aW9uIGFmdGVy
IHBvdGVudGlhbApyZXR1cm4vZmFpbHVyZSBwb2ludHMKLS0tCiB4ZW4vYXJjaC9hcm0vdnBsMDEx
LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL3ZwbDAxMS5jIGIveGVuL2FyY2gvYXJtL3ZwbDAxMS5jCmluZGV4IDdiYzVl
ZWIyMDcuLjg5NWY0MzZjYzQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS92cGwwMTEuYworKysg
Yi94ZW4vYXJjaC9hcm0vdnBsMDExLmMKQEAgLTY2OCw2ICs2NjgsOCBAQCBpbnQgZG9tYWluX3Zw
bDAxMV9pbml0KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2cGwwMTFfaW5pdF9pbmZvICppbmZv
KQogICAgICAgICBnb3RvIG91dDI7CiAgICAgfQogCisgICAgdnBsMDExLT51YXJ0ZnIgPSBUWEZF
IHwgUlhGRTsKKwogICAgIHNwaW5fbG9ja19pbml0KCZ2cGwwMTEtPmxvY2spOwogCiAgICAgcmVn
aXN0ZXJfbW1pb19oYW5kbGVyKGQsICZ2cGwwMTFfbW1pb19oYW5kbGVyLAotLSAKMi4xNy4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
