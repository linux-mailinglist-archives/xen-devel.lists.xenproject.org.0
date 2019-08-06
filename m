Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEFE837E1
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 19:28:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv3Cq-0007aJ-Gk; Tue, 06 Aug 2019 17:25:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/mMd=WC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hv3Cp-0007aE-Oy
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 17:25:03 +0000
X-Inumbo-ID: 1ff4a5ce-b86f-11e9-9bae-83f6c318a883
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ff4a5ce-b86f-11e9-9bae-83f6c318a883;
 Tue, 06 Aug 2019 17:25:03 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A6032075B;
 Tue,  6 Aug 2019 17:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565112302;
 bh=fRdwJpJoQ0FAvVWD0cIbTzVvsWKDmAVygnWSuCW76Ls=;
 h=From:To:Cc:Subject:Date:From;
 b=BR/Ktu7dI8Lz7r51VBEkmGda7XrUKTETrS9fXBsjQ4NpigWEVAHR/HN6+AtbEmYek
 vkZDizowFsHzpgYv0DhGs9mclBHZ95LmDCt6kkWVKA4Bb58Ygifp4LTsaspXIEZjQd
 Mc3J9Y6o4d9r2uz1B3zAfG8AB1iohufIJpq/ko44=
From: Stefano Stabellini <sstabellini@kernel.org>
To: ian.jackson@citrix.com
Date: Tue,  6 Aug 2019 10:25:00 -0700
Message-Id: <20190806172500.6409-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v2] 9pfs has a QEMU backend
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
Cc: anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, wl@xen.org, Stefano Stabellini <stefanos@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIDlwZnMgdG8gdGhlIGtpbmQgb2YgUFYgZHJpdmVycyB0aGF0IGhhcyBhIFFFTVUgYmFja2Vu
ZCwgc3BlY2lmaWNhbGx5CnRvIHRoZSBtYWNybyBRRU1VX0JBQ0tFTkQuCgpUaGlzIGlzIG5lZWRl
ZCBvdGhlcndpc2UgdXBvbiBkb21haW4gZGVzdHJveSB3ZSBnZXQgYSB0aW1lb3V0IGVycm9yOgoK
bGlieGw6IGVycm9yOiBsaWJ4bF9kZXZpY2UuYzoxMTMyOmRldmljZV9iYWNrZW5kX2NhbGxiYWNr
OiBEb21haW4gMTp1bmFibGUgdG8gcmVtb3ZlIGRldmljZSB3aXRoIHBhdGggL2xvY2FsL2RvbWFp
bi8wL2JhY2tlbmQvOXBmcy8xLzAKbGlieGw6IGVycm9yOiBsaWJ4bF9kb21haW4uYzoxMTI5OmRl
dmljZXNfZGVzdHJveV9jYjogRG9tYWluIDE6bGlieGxfX2RldmljZXNfZGVzdHJveSBmYWlsZWQK
ClRoaXMgY2hhbmdlIHNob3VsZCBoYXZlIGJlZW4gcGFydCBvZiBiNTNiNDAzN2NlZjYgImxpYnhs
L3hsOiBhZGQgc3VwcG9ydApmb3IgWGVuIDlwZnMiLgoKQWxzbyBhZGQgYSBjb21tZW50IGluIGxp
YnhsX3R5cGVzX2ludGVybmFsLmlkbCB0byBoZWxwIHJlbWVtYmVyIGNoYW5naW5nClFFTVVfQkFD
S0VORCBnb2luZyBmb3J3YXJkLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxz
dGVmYW5vc0B4aWxpbnguY29tPgoKLS0tCgpDaGFuZ2VzIGluIHYyOgotIGFkZCBpbi1jb2RlIGNv
bW1lbnQKLSBpbXByb3ZlIGNvbW1pdCBtZXNzYWdlCgotLS0KCiB0b29scy9saWJ4bC9saWJ4bF9p
bnRlcm5hbC5oICAgICAgICAgfCAxICsKIHRvb2xzL2xpYnhsL2xpYnhsX3R5cGVzX2ludGVybmFs
LmlkbCB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJu
YWwuaAppbmRleCBhMzEwMjg3MWYzLi5lN2Q5Nzc3OTMwIDEwMDY0NAotLS0gYS90b29scy9saWJ4
bC9saWJ4bF9pbnRlcm5hbC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAg
LTYzNiw2ICs2MzYsNyBAQCB0eXBlZGVmIHN0cnVjdCB7CiAgICAgKGRldiktPmJhY2tlbmRfa2lu
ZCA9PSBMSUJYTF9fREVWSUNFX0tJTkRfUURJU0sgfHwgXAogICAgIChkZXYpLT5iYWNrZW5kX2tp
bmQgPT0gTElCWExfX0RFVklDRV9LSU5EX1ZGQiB8fCBcCiAgICAgKGRldiktPmJhY2tlbmRfa2lu
ZCA9PSBMSUJYTF9fREVWSUNFX0tJTkRfUVVTQiB8fCBcCisgICAgKGRldiktPmJhY2tlbmRfa2lu
ZCA9PSBMSUJYTF9fREVWSUNFX0tJTkRfOVBGUyB8fCBcCiAgICAgKGRldiktPmJhY2tlbmRfa2lu
ZCA9PSBMSUJYTF9fREVWSUNFX0tJTkRfVktCRCkKIAogI2RlZmluZSBYQ19QQ0lfQkRGICAgICAg
ICAgICAgICIweCV4LCAweCV4LCAweCV4LCAweCV4IgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwv
bGlieGxfdHlwZXNfaW50ZXJuYWwuaWRsIGIvdG9vbHMvbGlieGwvbGlieGxfdHlwZXNfaW50ZXJu
YWwuaWRsCmluZGV4IDM3NDAyZTQ5Y2IuLmNiODVjM2IzN2YgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xp
YnhsL2xpYnhsX3R5cGVzX2ludGVybmFsLmlkbAorKysgYi90b29scy9saWJ4bC9saWJ4bF90eXBl
c19pbnRlcm5hbC5pZGwKQEAgLTEzLDYgKzEzLDcgQEAgbGlieGxfX3FtcF9tZXNzYWdlX3R5cGUg
PSBFbnVtZXJhdGlvbigicW1wX21lc3NhZ2VfdHlwZSIsIFsKICAgICAoNSwgImludmFsaWQiKSwK
ICAgICBdKQogCisjIENvbnNpZGVyIGFkZGluZyB0byBRRU1VX0JBQ0tFTkQgaW4gbGlieGxfaW50
ZXJuYWwuaAogbGlieGxfX2RldmljZV9raW5kID0gRW51bWVyYXRpb24oImRldmljZV9raW5kIiwg
WwogICAgICgwLCAiTk9ORSIpLAogICAgICgxLCAiVklGIiksCi0tIAoyLjE3LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
