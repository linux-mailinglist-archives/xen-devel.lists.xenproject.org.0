Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD0733AAD
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 00:04:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXv2X-0003Sj-7k; Mon, 03 Jun 2019 22:02:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hXv2W-0003SX-Bf
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 22:02:48 +0000
X-Inumbo-ID: 52269080-864b-11e9-8f4e-c72f00ae0891
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52269080-864b-11e9-8f4e-c72f00ae0891;
 Mon, 03 Jun 2019 22:02:47 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 985982054F;
 Mon,  3 Jun 2019 22:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559599366;
 bh=nMfJrr9GCqfib1f87JPsGrJ4pJieLk2+NbBRp70klbk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l0WYsnzoahDqKX1pumtiWrlycAEELOc+mx+/G6L4AY3e5E08rqcrkQ8bo/zFsCiKX
 pIQGwMChM8K6mNfWraXOjcpGLTBdvrtNQ0gKvGYh6jeEiN4uQSFhqCXhZ0Mt0xuLNY
 HdWKmJXbKyKBcF+rsFqCHJ47+uTsoG+fEDc7OPu0=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Mon,  3 Jun 2019 15:02:43 -0700
Message-Id: <20190603220245.22750-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1906031456390.14041@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1906031456390.14041@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v3 1/3] xen/arm: fix nr_pdxs calculation
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com,
 sstabellini@kernel.org, JBeulich@suse.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cGZuX3RvX3BkeCBleHBlY3RzIGFuIGFkZHJlc3MsIG5vdCBhIHNpemUsIGFzIGEgcGFyYW1ldGVy
LiBTcGVjaWZpY2FsbHksCml0IGV4cGVjdHMgdGhlIGVuZCBhZGRyZXNzLCB0aGVuIHRoZSBtYXNr
cyBjYWxjdWxhdGlvbnMgY29tcGVuc2F0ZSBmb3IKYW55IGhvbGVzIGJldHdlZW4gc3RhcnQgYW5k
IGVuZC4gVGh1cywgd2Ugc2hvdWxkIHBhc3MgdGhlIGVuZCBhZGRyZXNzIHRvCnBmbl90b19wZHgu
CgpUaGUgaW5pdGlhbCBwZHggaXMgc3RvcmVkIGluIGZyYW1ldGFibGVfYmFzZV9wZHgsIHNvIHdl
IGNhbiBzdWJ0cmFjdCB0aGUKcmVzdWx0IG9mIHBmbl90b19wZHgoc3RhcnRfYWRkcmVzcykgZnJv
bSBucl9wZHhzOyB3ZSBrbm93IHRoYXQgd2UgZG9uJ3QKbmVlZCB0byBjb3ZlciBhbnkgbWVtb3J5
IGluIHRoZSByYW5nZSAwLXN0YXJ0IGluIHRoZSBmcmFtZXRhYmxlLgoKUmVtb3ZlIHRoZSB2YXJp
YWJsZSBgbnJfcGFnZXMnIGJlY2F1c2UgaXQgaXMgdW51c2VkLgoKU2lnbmVkLW9mZi1ieTogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgpDQzogSkJldWxpY2hAc3VzZS5j
b20KLS0tCkNoYW5nZXMgaW4gdjM6Ci0gaW1wcm92ZSBjb21taXQgbWVzc2FnZQoKQ2hhbmdlcyBp
biB2MjoKLSB1c2UgbWZuX3RvX3BkeCBhbmQgbWFkZHJfdG9fbWZuIGFsb25nIHdpdGggbWZuX2Fk
ZCgpCi0tLQogeGVuL2FyY2gvYXJtL21tLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21t
LmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRleCA2YWMxNjljZTI3Li4yMmVkOTFiNWM5IDEwMDY0
NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYworKysgYi94ZW4vYXJjaC9hcm0vbW0uYwpAQCAtODg2
LDggKzg4Niw4IEBAIHZvaWQgX19pbml0IHNldHVwX3hlbmhlYXBfbWFwcGluZ3ModW5zaWduZWQg
bG9uZyBiYXNlX21mbiwKIC8qIE1hcCBhIGZyYW1lIHRhYmxlIHRvIGNvdmVyIHBoeXNpY2FsIGFk
ZHJlc3NlcyBwcyB0aHJvdWdoIHBlICovCiB2b2lkIF9faW5pdCBzZXR1cF9mcmFtZXRhYmxlX21h
cHBpbmdzKHBhZGRyX3QgcHMsIHBhZGRyX3QgcGUpCiB7Ci0gICAgdW5zaWduZWQgbG9uZyBucl9w
YWdlcyA9IChwZSAtIHBzKSA+PiBQQUdFX1NISUZUOwotICAgIHVuc2lnbmVkIGxvbmcgbnJfcGR4
cyA9IHBmbl90b19wZHgobnJfcGFnZXMpOworICAgIHVuc2lnbmVkIGxvbmcgbnJfcGR4cyA9IG1m
bl90b19wZHgobWZuX2FkZChtYWRkcl90b19tZm4ocGUpLCAtMSkpIC0KKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBtZm5fdG9fcGR4KG1hZGRyX3RvX21mbihwcykpICsgMTsKICAgICB1bnNp
Z25lZCBsb25nIGZyYW1ldGFibGVfc2l6ZSA9IG5yX3BkeHMgKiBzaXplb2Yoc3RydWN0IHBhZ2Vf
aW5mbyk7CiAgICAgbWZuX3QgYmFzZV9tZm47CiAgICAgY29uc3QgdW5zaWduZWQgbG9uZyBtYXBw
aW5nX3NpemUgPSBmcmFtZXRhYmxlX3NpemUgPCBNQigzMikgPyBNQigyKSA6IE1CKDMyKTsKLS0g
CjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
