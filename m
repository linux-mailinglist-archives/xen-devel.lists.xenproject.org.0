Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB4994BEB
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 19:45:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzlgb-0007am-1L; Mon, 19 Aug 2019 17:43:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8TEA=WP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hzlga-0007ah-3A
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 17:43:16 +0000
X-Inumbo-ID: d27a246a-c2a8-11e9-8bf0-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d27a246a-c2a8-11e9-8bf0-12813bfff9fa;
 Mon, 19 Aug 2019 17:43:15 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E16F22CE9;
 Mon, 19 Aug 2019 17:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566236595;
 bh=SNhSOAUg4vxnX+2FkN5op+t5GM/CKFq3swbqI4kpCP4=;
 h=Date:From:To:cc:Subject:From;
 b=n3CZV5ERKug7Dpq4Y/yaY1qCz5Al3EvdvpxRQ87qsNv9OLzLukEXeiaKkBymR1N7U
 vvKQKdojRLR7D+GpywYu2CwsPpxCG1r3tWo/ngFd8Ma7HBqU4pG87HHWrXvhWGq4Vh
 Iu5MFn3F0+fMaPh959OPEwnIsGmwXcFbO3G3HntI=
Date: Mon, 19 Aug 2019 10:43:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
Message-ID: <alpine.DEB.2.21.1908191011060.20094@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 0/8] reserved-memory in dom0
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
Cc: julien.grall@arm.com, sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBwYXJ0aWFsIHJlc2VydmVkLW1l
bW9yeSBzdXBwb3J0IGZvciBkb20wCm9ubHkgKG5vIGRvbVUgc3VwcG9ydCBmb3IgcmVzZXJ2ZWQt
bWVtb3J5IHlldC4pCgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA3NjJiOWEy
ZDk5MGJiYTFmM2FlZmU2NjBjZmYwYzM3YWQyZTM3NWJjOgoKICB4ZW4vcGFnZV9hbGxvYzogS2Vl
cCBhd2F5IE1GTiAwIGZyb20gdGhlIGJ1ZGR5IGFsbG9jYXRvciAoMjAxOS0wOC0wOSAxMToxMjo1
NSAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRw
Oi8veGVuYml0cy54ZW5wcm9qZWN0Lm9yZy9naXQtaHR0cC9wZW9wbGUvc3N0YWJlbGxpbmkveGVu
LXVuc3RhYmxlLmdpdCByZXNlcnZlZC1tZW0tNwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVw
IHRvIDc5NDc5MGY5OGQ5YmJhNGUzNGVhNjg5MDQ5YmYyOTg5OWM2ZjFiMmI6CgogIHhlbi9hcm06
IGFkZCByZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyB0byB0aGUgZG9tMCBtZW1vcnkgbm9kZSAoMjAx
OS0wOC0xOSAxMDowODo1NiAtMDcwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KU3RlZmFubyBTdGFiZWxsaW5pICg4KToK
ICAgICAgeGVuL2FybTogcGFzcyBub2RlIHRvIGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGUKICAg
ICAgeGVuL2FybTogbWFrZSBwcm9jZXNzX21lbW9yeV9ub2RlIGEgZGV2aWNlX3RyZWVfbm9kZV9m
dW5jCiAgICAgIHhlbi9hcm06IGtlZXAgdHJhY2sgb2YgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMK
ICAgICAgeGVuL2FybTogZml4IGluZGVudGF0aW9uIGluIGVhcmx5X3ByaW50X2luZm8KICAgICAg
eGVuL2FybTogZWFybHlfcHJpbnRfaW5mbyBwcmludCByZXNlcnZlZF9tZW0KICAgICAgeGVuL2Fy
bTogaGFuZGxlIHJlc2VydmVkLW1lbW9yeSBpbiBjb25zaWRlcl9tb2R1bGVzIGFuZCBkdF91bnJl
c2VydmVkX3JlZ2lvbnMKICAgICAgeGVuL2FybTogZG9uJ3QgaW9tZW1fcGVybWl0X2FjY2VzcyBm
b3IgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMKICAgICAgeGVuL2FybTogYWRkIHJlc2VydmVkLW1l
bW9yeSByZWdpb25zIHRvIHRoZSBkb20wIG1lbW9yeSBub2RlCgogeGVuL2FyY2gvYXJtL2FjcGkv
Ym9vdC5jICAgICAgfCAgIDggKystCiB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5jICAgICAgICB8IDEy
OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL2Fy
bS9kb21haW5fYnVpbGQuYyAgIHwgIDQ3ICsrKysrKysrKysrLS0tLS0KIHhlbi9hcmNoL2FybS9z
ZXR1cC5jICAgICAgICAgIHwgIDUzICsrKysrKysrKysrKysrKystCiB4ZW4vaW5jbHVkZS9hc20t
YXJtL3NldHVwLmggICB8ICAgMSArCiB4ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaCB8ICAg
NiArLQogNiBmaWxlcyBjaGFuZ2VkLCAxODEgaW5zZXJ0aW9ucygrKSwgNjIgZGVsZXRpb25zKC0p
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
