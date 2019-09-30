Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77731C2AF4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 01:33:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF57u-00026B-2f; Mon, 30 Sep 2019 23:30:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/D4s=XZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iF57s-000258-LJ
 for xen-devel@lists.xen.org; Mon, 30 Sep 2019 23:30:44 +0000
X-Inumbo-ID: 4e789676-e3da-11e9-bf31-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 4e789676-e3da-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 23:30:37 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 813FC2190F;
 Mon, 30 Sep 2019 23:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569886236;
 bh=TEThTQUmJkHdQHmob8PXodKhiuhue3Md3WDJNwtENGI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iO+Gnu5vfEYCrw63Ik/SuRk+SUiOf48ZkPCoMWfw9y0kiyFnY6VoaXrZHbm0S68zr
 aJxpgzLVrfZW5MpWpHSrZ7sPjPaFDafdZfq+v/Hd5o/78th7RHF36EblGsMZhm7uvW
 zGKMuheMWrmF5VFmZpiNNnqEobDX0yk3bz8b9pSw=
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien.grall@arm.com
Date: Mon, 30 Sep 2019 16:30:31 -0700
Message-Id: <20190930233032.2120-7-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1909301628540.2594@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1909301628540.2594@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v7b 7/8] xen/arm: introduce nr_spis
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
b21haW5zLCBvciBHVUVTVF9WUEwwMTFfU1BJKzEgaWYgdnBsMDExIGlzCnJlcXVlc3RlZCwgd2hp
Y2hldmVyIGlzIGdyZWF0ZXIuCgpSZW1vdmUgdGhlIG9sZCBzZXR0aW5nIG9mIG5yX3NwaXMgYmFz
ZWQgb24gdGhlIHByZXNlbmNlIG9mIHRoZSB2cGwwMTEuCgpUaGUgaW1wbGljYXRpb24gb2YgdGhp
cyBjaGFuZ2UgaXMgdGhhdCB3aXRob3V0IG5yX3NwaXMgZG9tMGxlc3MgZG9tYWlucwpnZXQgdGhl
IHNhbWUgYW1vdW50IG9mIFNQSSBhbGxvY2F0ZWQgYXMgZG9tMCwgcmVnYXJkbGVzcyBvZiBob3cg
bWFueQpwaHlzaWNhbCBkZXZpY2VzIHRoZXkgaGF2ZSBhc3NpZ25lZCwgYW5kIHJlZ2FyZGxlc3Mg
b2Ygd2hldGhlciB0aGV5IGhhdmUKYSB2aXJ0dWFsIHBsMDExICh3aGljaCBhbHNvIG5lZWRzIGFu
IGVtdWxhdGVkIFNQSSkuIFRoaXMgaXMgZG9uZSBiZWNhdXNlCnRoZSBTUElzIGFsbG9jYXRpb24g
bmVlZHMgdG8gYmUgZG9uZSBiZWZvcmUgcGFyc2luZyBhbnkgcGFzc3Rocm91Z2gKaW5mb3JtYXRp
b24sIHNvIHdlIGhhdmUgdG8gYWNjb3VudCBmb3IgYW55IHBvdGVudGlhbCBwaHlzaWNhbCBTUEkK
YXNzaWduZWQgdG8gdGhlIGRvbWFpbi4KCldoZW4gbnJfc3BpcyBpcyBwcmVzZW50LCB0aGUgZG9t
YWluIGdldHMgZXhhY3RseSBucl9zcGlzIGFsbG9jYXRlZCBTUElzLgpJZiB0aGUgbnVtYmVyIGlz
IHRvbyBsb3csIGl0IG1pZ2h0IG5vdCBiZSBlbm91Z2ggZm9yIHRoZSBkZXZpY2VzCmFzc2lnbmVk
IGl0IHRvIGl0LiBJZiB0aGUgbnVtYmVyIGlzIGxlc3MgdGhhbiBHVUVTVF9WUEwwMTFfU1BJLCB0
aGUKdmlydHVhbCBwbDAxMSB3b24ndCB3b3JrLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgpSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJhYmNo
dWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjU6Ci0gaW1wcm92ZSBjb21taXQg
bWVzc2FnZQotIGFsbG9jYXRlIGVub3VnaCBTUElzIGZvciB2cGwwMTEKCkNoYW5nZXMgaW4gdjQ6
Ci0gaW1wcm92ZSBjb21taXQgbWVzc2FnZQoKQ2hhbmdlcyBpbiB2MzoKLSBpbXByb3ZlIGNvbW1p
dCBtZXNzYWdlCi0gaW50cm9kdWNlIG5yX3NwaXMKLS0tCiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMgfCAxNyArKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCmluZGV4IDQ3ZjliYjMxZGYuLjgw
ZjFjOGExMDMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYworKysgYi94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKQEAgLTIzOTYsNyArMjM5Niw2IEBAIHZvaWQgX19p
bml0IGNyZWF0ZV9kb21Vcyh2b2lkKQogICAgICAgICBzdHJ1Y3QgZG9tYWluICpkOwogICAgICAg
ICBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gZF9jZmcgPSB7CiAgICAgICAgICAgICAu
YXJjaC5naWNfdmVyc2lvbiA9IFhFTl9ET01DVExfQ09ORklHX0dJQ19OQVRJVkUsCi0gICAgICAg
ICAgICAuYXJjaC5ucl9zcGlzID0gMCwKICAgICAgICAgICAgIC5mbGFncyA9IFhFTl9ET01DVExf
Q0RGX2h2bSB8IFhFTl9ET01DVExfQ0RGX2hhcCwKICAgICAgICAgICAgIC5tYXhfZXZ0Y2huX3Bv
cnQgPSAtMSwKICAgICAgICAgICAgIC5tYXhfZ3JhbnRfZnJhbWVzID0gNjQsCkBAIC0yNDA2LDkg
KzI0MDUsNiBAQCB2b2lkIF9faW5pdCBjcmVhdGVfZG9tVXModm9pZCkKICAgICAgICAgaWYgKCAh
ZHRfZGV2aWNlX2lzX2NvbXBhdGlibGUobm9kZSwgInhlbixkb21haW4iKSApCiAgICAgICAgICAg
ICBjb250aW51ZTsKIAotICAgICAgICBpZiAoIGR0X3Byb3BlcnR5X3JlYWRfYm9vbChub2RlLCAi
dnBsMDExIikgKQotICAgICAgICAgICAgZF9jZmcuYXJjaC5ucl9zcGlzID0gR1VFU1RfVlBMMDEx
X1NQSSAtIDMyICsgMTsKLQogICAgICAgICBpZiAoICFkdF9wcm9wZXJ0eV9yZWFkX3UzMihub2Rl
LCAiY3B1cyIsICZkX2NmZy5tYXhfdmNwdXMpICkKICAgICAgICAgICAgIHBhbmljKCJNaXNzaW5n
IHByb3BlcnR5ICdjcHVzJyBmb3IgZG9tYWluICVzXG4iLAogICAgICAgICAgICAgICAgICAgZHRf
bm9kZV9uYW1lKG5vZGUpKTsKQEAgLTI0MTYsNiArMjQxMiwxOSBAQCB2b2lkIF9faW5pdCBjcmVh
dGVfZG9tVXModm9pZCkKICAgICAgICAgaWYgKCBkdF9maW5kX2NvbXBhdGlibGVfbm9kZShub2Rl
LCBOVUxMLCAibXVsdGlib290LGRldmljZS10cmVlIikgKQogICAgICAgICAgICAgZF9jZmcuZmxh
Z3MgfD0gWEVOX0RPTUNUTF9DREZfaW9tbXU7CiAKKyAgICAgICAgaWYgKCAhZHRfcHJvcGVydHlf
cmVhZF91MzIobm9kZSwgIm5yX3NwaXMiLCAmZF9jZmcuYXJjaC5ucl9zcGlzKSApCisgICAgICAg
IHsKKyAgICAgICAgICAgIGRfY2ZnLmFyY2gubnJfc3BpcyA9IGdpY19udW1iZXJfbGluZXMoKSAt
IDMyOworCisgICAgICAgICAgICAvKgorICAgICAgICAgICAgICogdnBsMDExIHVzZXMgb25lIGVt
dWxhdGVkIFNQSS4gSWYgdnBsMDExIGlzIHJlcXVlc3RlZCwgbWFrZQorICAgICAgICAgICAgICog
c3VyZSB0aGF0IHdlIGFsbG9jYXRlIGVub3VnaCBTUElzIGZvciBpdC4KKyAgICAgICAgICAgICAq
LworICAgICAgICAgICAgaWYgKCBkdF9wcm9wZXJ0eV9yZWFkX2Jvb2wobm9kZSwgInZwbDAxMSIp
ICkKKyAgICAgICAgICAgICAgICBkX2NmZy5hcmNoLm5yX3NwaXMgPSBNQVgoZF9jZmcuYXJjaC5u
cl9zcGlzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHVUVTVF9W
UEwwMTFfU1BJIC0gMzIgKyAxKTsKKyAgICAgICAgfQorCiAgICAgICAgIGQgPSBkb21haW5fY3Jl
YXRlKCsrbWF4X2luaXRfZG9taWQsICZkX2NmZywgZmFsc2UpOwogICAgICAgICBpZiAoIElTX0VS
UihkKSApCiAgICAgICAgICAgICBwYW5pYygiRXJyb3IgY3JlYXRpbmcgZG9tYWluICVzXG4iLCBk
dF9ub2RlX25hbWUobm9kZSkpOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
