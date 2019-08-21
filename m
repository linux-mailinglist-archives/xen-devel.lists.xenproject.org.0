Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 851C397098
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 05:56:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Hgx-0007ih-5j; Wed, 21 Aug 2019 03:53:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tsmg=WR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i0Hgv-0007ho-2a
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 03:53:45 +0000
X-Inumbo-ID: 38310b7e-c3c7-11e9-8980-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38310b7e-c3c7-11e9-8980-bc764e2007e4;
 Wed, 21 Aug 2019 03:53:22 +0000 (UTC)
Received: from localhost.localdomain (c-67-164-102-47.hsd1.ca.comcast.net
 [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C494233A0;
 Wed, 21 Aug 2019 03:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566359601;
 bh=gyG6/+XH1p5WGEkSPidGjTxklArIUKWOhlqW5k25dSs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YMZHuKYaHUEIGlBQFrwzLNxqidt/ZPeAEPfh2NWWmCFKwj3oHzsuy9CID5IiHi/bU
 lNITgXuc8Ohuh+gS1KWVxXpVzIENhZEtWOevWNFnjtldDOWgQVDOp/lzN91jKxEs1Q
 UdTh9Swo+VYMrarCbkxo6pr4tBvQYtm7/+yg1ysM=
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien.grall@arm.com
Date: Tue, 20 Aug 2019 20:53:14 -0700
Message-Id: <20190821035315.12812-7-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v4 7/8] xen/arm: introduce nr_spis
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, sstabellini@kernel.org,
 andrii_anisov@epam.com, Achin.Gupta@arm.com, xen-devel@lists.xen.org,
 Volodymyr_Babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgZG9uJ3QgaGF2ZSBhIGNsZWFyIHdheSB0byBrbm93IGhvdyBtYW55IHZpcnR1YWwgU1BJcyB3
ZSBuZWVkIGZvciB0aGUKZG9tMC1sZXNzIGRvbWFpbnMuIEludHJvZHVjZSBhIG5ldyBvcHRpb24g
dW5kZXIgeGVuLGRvbWFpbiB0byBzcGVjaWZ5CnRoZSBudW1iZXIgb2YgU1BJcyB0byBhbGxvY2F0
ZSBmb3IgYSBkb21haW4uCgpUaGUgcHJvcGVydHkgaXMgb3B0aW9uYWwuIFdoZW4gYWJzZW50LCB3
ZSdsbCB1c2UgdGhlIHBoeXNpY2FsIG51bWJlciBvZgpHSUMgbGluZXMgZm9yIGRvbTAtbGVzcyBk
b21haW5zLCBqdXN0IGxpa2UgZm9yIGRvbTAuIEdpdmVuIHRoYXQKZG9tMC1sZXNzIFZNcyBhcmUg
bWVhbnQgZm9yIHN0YXRpYyBwYXJ0aXRpb25pbmcgc2NlbmFyaW9zIHdoZXJlIHRoZQpudW1iZXIg
b2YgVk1zIGlzIHZlcnkgbG93LCBpbmNyZWFzZWQgbWVtb3J5IG92ZXJoZWFkIHNob3VsZCBub3Qg
YmUgYQpwcm9ibGVtLCBhbmQgaXQgaXMgcG9zc2libGUgdG8gbWluaW1pemUgaXQgdXNpbmcgIm5y
X3NwaXMiLgoKUmVtb3ZlIHRoZSBvbGQgc2V0dGluZyBvZiBucl9zcGlzIGJhc2VkIG9uIHRoZSBw
cmVzZW5jZSBvZiB0aGUgdnBsMDExLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzdGVmYW5vc0B4aWxpbnguY29tPgpSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZv
bG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgotLS0KQ2hhbmdlcyBpbiB2NDoKLSBpbXByb3ZlIGNv
bW1pdCBtZXNzYWdlCgpDaGFuZ2VzIGluIHYzOgotIGltcHJvdmUgY29tbWl0IG1lc3NhZ2UKLSBp
bnRyb2R1Y2UgbnJfc3BpcwotLS0KIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDcgKysr
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMKaW5kZXggMjU2YzgzNDYyYS4uODZjYmU0ZTY3YiAxMDA2NDQKLS0tIGEveGVu
L2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCisrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
YwpAQCAtMjI4MCw3ICsyMjgwLDYgQEAgdm9pZCBfX2luaXQgY3JlYXRlX2RvbVVzKHZvaWQpCiAg
ICAgICAgIHN0cnVjdCBkb21haW4gKmQ7CiAgICAgICAgIHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0
ZWRvbWFpbiBkX2NmZyA9IHsKICAgICAgICAgICAgIC5hcmNoLmdpY192ZXJzaW9uID0gWEVOX0RP
TUNUTF9DT05GSUdfR0lDX05BVElWRSwKLSAgICAgICAgICAgIC5hcmNoLm5yX3NwaXMgPSAwLAog
ICAgICAgICAgICAgLmZsYWdzID0gWEVOX0RPTUNUTF9DREZfaHZtX2d1ZXN0IHwgWEVOX0RPTUNU
TF9DREZfaGFwLAogICAgICAgICAgICAgLm1heF9ldnRjaG5fcG9ydCA9IC0xLAogICAgICAgICAg
ICAgLm1heF9ncmFudF9mcmFtZXMgPSA2NCwKQEAgLTIyOTAsMTMgKzIyODksMTMgQEAgdm9pZCBf
X2luaXQgY3JlYXRlX2RvbVVzKHZvaWQpCiAgICAgICAgIGlmICggIWR0X2RldmljZV9pc19jb21w
YXRpYmxlKG5vZGUsICJ4ZW4sZG9tYWluIikgKQogICAgICAgICAgICAgY29udGludWU7CiAKLSAg
ICAgICAgaWYgKCBkdF9wcm9wZXJ0eV9yZWFkX2Jvb2wobm9kZSwgInZwbDAxMSIpICkKLSAgICAg
ICAgICAgIGRfY2ZnLmFyY2gubnJfc3BpcyA9IEdVRVNUX1ZQTDAxMV9TUEkgLSAzMiArIDE7Ci0K
ICAgICAgICAgaWYgKCAhZHRfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImNwdXMiLCAmZF9jZmcu
bWF4X3ZjcHVzKSApCiAgICAgICAgICAgICBwYW5pYygiTWlzc2luZyBwcm9wZXJ0eSAnY3B1cycg
Zm9yIGRvbWFpbiAlc1xuIiwKICAgICAgICAgICAgICAgICAgIGR0X25vZGVfbmFtZShub2RlKSk7
CiAKKyAgICAgICAgaWYgKCAhZHRfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgIm5yX3NwaXMiLCAm
ZF9jZmcuYXJjaC5ucl9zcGlzKSApCisgICAgICAgICAgICBkX2NmZy5hcmNoLm5yX3NwaXMgPSBn
aWNfbnVtYmVyX2xpbmVzKCkgLSAzMjsKKwogICAgICAgICBkID0gZG9tYWluX2NyZWF0ZSgrK21h
eF9pbml0X2RvbWlkLCAmZF9jZmcsIGZhbHNlKTsKICAgICAgICAgaWYgKCBJU19FUlIoZCkgKQog
ICAgICAgICAgICAgcGFuaWMoIkVycm9yIGNyZWF0aW5nIGRvbWFpbiAlc1xuIiwgZHRfbm9kZV9u
YW1lKG5vZGUpKTsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
