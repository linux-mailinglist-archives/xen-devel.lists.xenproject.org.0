Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 840BE94C4A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 20:04:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzlyG-0001ps-OX; Mon, 19 Aug 2019 18:01:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UkZp=WP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hzlyF-0001ph-8P
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 18:01:31 +0000
X-Inumbo-ID: 5ee20440-c2ab-11e9-8bf0-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5ee20440-c2ab-11e9-8bf0-12813bfff9fa;
 Mon, 19 Aug 2019 18:01:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B759360;
 Mon, 19 Aug 2019 11:01:30 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAB6D3F246;
 Mon, 19 Aug 2019 11:01:28 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 19 Aug 2019 19:01:25 +0100
Message-Id: <20190819180125.17504-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH] xen/console: Fix build when CONFIG_DEBUG_TRACE=y
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IGI1ZTZlMWVlOGRhICJ4ZW4vY29uc29sZTogRG9uJ3QgdHJlYXQgTlVMIGNoYXJhY3Rl
ciBhcyB0aGUgZW5kCm9mIHRoZSBidWZmZXIiIGV4dGVuZGVkIHNlcmNvbl9wdXRzIHRvIHRha2Ug
dGhlIG51bWJlciBvZiBjaGFyYWN0ZXIKdG8gcHJpbnQgaW4gYXJndW1lbnQuCgpTYWRseSwgYSBj
b3VwbGUgb2YgY291cGxlIG9mIHRoZSBjYWxsZXJzIGluIGRlYnVndHJhY2VfZHVtcF93b3JrZXIo
KQp3ZXJlIG5vdCBjb252ZXJ0ZWQuIFRoaXMgcmVzdWx0IHRvIGEgYnVpbGQgZmFpbHVyZSB3aGVu
IGVuYWJsaW5nCkNPTkZJR19ERUJVR19UUkFDRS4KClNwb3R0ZWQgYnkgVHJhdmlzIHVzaW5nIHJh
bmRjb25maWcKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNv
bT4KLS0tCiB4ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Ry
aXZlcnMvY2hhci9jb25zb2xlLmMgYi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwppbmRleCAy
YzE0YzJjYTczLi45MjRkNDk3MWNhIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9jaGFyL2NvbnNv
bGUuYworKysgYi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwpAQCAtMTE4NSwxMSArMTE4NSwx
MiBAQCBzdGF0aWMgdm9pZCBkZWJ1Z3RyYWNlX2R1bXBfd29ya2VyKHZvaWQpCiAKICAgICAvKiBQ
cmludCBvbGRlc3QgcG9ydGlvbiBvZiB0aGUgcmluZy4gKi8KICAgICBBU1NFUlQoZGVidWd0cmFj
ZV9idWZbZGVidWd0cmFjZV9ieXRlcyAtIDFdID09IDApOwotICAgIHNlcmNvbl9wdXRzKCZkZWJ1
Z3RyYWNlX2J1ZltkZWJ1Z3RyYWNlX3ByZF0pOworICAgIHNlcmNvbl9wdXRzKCZkZWJ1Z3RyYWNl
X2J1ZltkZWJ1Z3RyYWNlX3ByZF0sCisgICAgICAgICAgICAgICAgc3RybGVuKCZkZWJ1Z3RyYWNl
X2J1ZltkZWJ1Z3RyYWNlX3ByZF0pKTsKIAogICAgIC8qIFByaW50IHlvdW5nZXN0IHBvcnRpb24g
b2YgdGhlIHJpbmcuICovCiAgICAgZGVidWd0cmFjZV9idWZbZGVidWd0cmFjZV9wcmRdID0gJ1ww
JzsKLSAgICBzZXJjb25fcHV0cygmZGVidWd0cmFjZV9idWZbMF0pOworICAgIHNlcmNvbl9wdXRz
KCZkZWJ1Z3RyYWNlX2J1ZlswXSwgZGVidWd0cmFjZV9wcmQpOwogCiAgICAgbWVtc2V0KGRlYnVn
dHJhY2VfYnVmLCAnXDAnLCBkZWJ1Z3RyYWNlX2J5dGVzKTsKIAotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
