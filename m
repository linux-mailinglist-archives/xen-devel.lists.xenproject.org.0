Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E923313B5ED
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 00:35:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irVfE-0006xh-9c; Tue, 14 Jan 2020 23:32:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MmA+=3D=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1irVfC-0006xb-7A
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 23:31:58 +0000
X-Inumbo-ID: 0e3e1d5c-3726-11ea-b89f-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e3e1d5c-3726-11ea-b89f-bc764e2007e4;
 Tue, 14 Jan 2020 23:31:57 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 146B924679;
 Tue, 14 Jan 2020 23:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579044717;
 bh=4rf87aTkKhOyWrEcDfzAHBn6Y486BEPHFJPLZ/NZjd0=;
 h=From:To:Cc:Subject:Date:From;
 b=Gsv2SsH5XOfSqvietm/QWMg0nG/hKfk6coQTqsMav5bSvrukKJzPg/Grh+A8ZEZs9
 Dgt2VTkHyN3YqlglciLrzUSRZIp/mlWNv9Qnsv9cvobCsmVnZZm4ef8GHcHx9sS+/e
 3mplmyZ2bcjU+JBhspWpl/FkiFqPuZWepx8MDl04=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 Jan 2020 15:31:55 -0800
Message-Id: <20200114233155.26411-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v2] xen/arm: during efi boot,
 improve the check for usable memory
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
Cc: sstabellini@kernel.org, Julien Grall <julien@xen.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBib290aW5nIHZpYSBFRkksIHRoZSBFRkkgbWVtb3J5IG1hcCBoYXMgaW5mb3JtYXRpb24g
YWJvdXQgbWVtb3J5CnJlZ2lvbnMgYW5kIHRoZWlyIHR5cGUuIEltcHJvdmUgdGhlIGNoZWNrIGZv
ciB0aGUgdHlwZSBhbmQgYXR0cmlidXRlIG9mCmVhY2ggbWVtb3J5IHJlZ2lvbiB0byBmaWd1cmUg
b3V0IHdoZXRoZXIgaXQgaXMgdXNhYmxlIG1lbW9yeSBvciBub3QuClRoaXMgcGF0Y2ggYnJpbmdz
IHRoZSBjaGVjayBvbiBwYXIgd2l0aCBMaW51eCB2NS41LXJjNiBhbmQgbWFrZXMgbW9yZQptZW1v
cnkgcmV1c2FibGUgYXMgbm9ybWFsIG1lbW9yeSBieSBYZW4gKGV4Y2VwdCB0aGF0IExpbnV4IGFs
c28gcmV1c2VzCkVGSV9QRVJTSVNURU5UX01FTU9SWSwgd2hpY2ggd2UgZG8gbm90KS4KClNwZWNp
ZmljYWxseSwgdGhpcyBwYXRjaCBhbHNvIHJldXNlcyBtZW1vcnkgbWFya2VkIGFzCkVmaUxvYWRl
ckNvZGUvRGF0YSwgYW5kIGl0IHVzZXMgYm90aCBBdHRyaWJ1dGUgYW5kIFR5cGUgZm9yIHRoZSBj
aGVjawooQXR0cmlidXRlIG5lZWRzIHRvIGJlIEVGSV9NRU1PUllfV0IpLgoKUmVwb3J0ZWQtYnk6
IFJvbWFuIFNoYXBvc2huaWsgPHJvbWFuQHplZGVkYS5jb20+ClNpZ25lZC1vZmYtYnk6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQHhpbGlueC5jb20+CkNDOiBKdWxpZW4g
R3JhbGwgPGp1bGllbkB4ZW4ub3JnPgoKLS0tCkNoYW5nZXMgaW4gdjI6Ci0gaW1wcm92ZSBjb21t
aXQgbWVzc2FnZQotIGRvIG5vdCBhbGxvY2F0ZSBtZW1vcnkgbWFya2VkIGFzIEVGSV9QRVJTSVNU
RU5UX01FTU9SWQotIGRvIG5vdCBjaGFuZ2UgbWFwX2JzJyBiZWhhdmlvcgotLS0KIHhlbi9hcmNo
L2FybS9lZmkvZWZpLWJvb3QuaCB8IDExICsrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9l
ZmkvZWZpLWJvb3QuaCBiL3hlbi9hcmNoL2FybS9lZmkvZWZpLWJvb3QuaAppbmRleCBkN2JmOTM0
MDc3Li42NTI3Y2IwYmRmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290LmgK
KysrIGIveGVuL2FyY2gvYXJtL2VmaS9lZmktYm9vdC5oCkBAIC0xNDksMTAgKzE0OSwxMyBAQCBz
dGF0aWMgRUZJX1NUQVRVUyBfX2luaXQgZWZpX3Byb2Nlc3NfbWVtb3J5X21hcF9ib290aW5mbyhF
RklfTUVNT1JZX0RFU0NSSVBUT1IgKgogCiAgICAgZm9yICggSW5kZXggPSAwOyBJbmRleCA8ICht
bWFwX3NpemUgLyBkZXNjX3NpemUpOyBJbmRleCsrICkKICAgICB7Ci0gICAgICAgIGlmICggZGVz
Y19wdHItPlR5cGUgPT0gRWZpQ29udmVudGlvbmFsTWVtb3J5IHx8Ci0gICAgICAgICAgICAgKCFt
YXBfYnMgJiYKLSAgICAgICAgICAgICAgKGRlc2NfcHRyLT5UeXBlID09IEVmaUJvb3RTZXJ2aWNl
c0NvZGUgfHwKLSAgICAgICAgICAgICAgIGRlc2NfcHRyLT5UeXBlID09IEVmaUJvb3RTZXJ2aWNl
c0RhdGEpKSApCisgICAgICAgIGlmICggZGVzY19wdHItPkF0dHJpYnV0ZSAmIEVGSV9NRU1PUllf
V0IgJiYKKyAgICAgICAgICAgICAoZGVzY19wdHItPlR5cGUgPT0gRWZpQ29udmVudGlvbmFsTWVt
b3J5IHx8CisgICAgICAgICAgICAgIGRlc2NfcHRyLT5UeXBlID09IEVmaUxvYWRlckNvZGUgfHwK
KyAgICAgICAgICAgICAgZGVzY19wdHItPlR5cGUgPT0gRWZpTG9hZGVyRGF0YSB8fAorICAgICAg
ICAgICAgICAoIW1hcF9icyAmJgorICAgICAgICAgICAgICAgKGRlc2NfcHRyLT5UeXBlID09IEVm
aUJvb3RTZXJ2aWNlc0NvZGUgfHwKKyAgICAgICAgICAgICAgICBkZXNjX3B0ci0+VHlwZSA9PSBF
ZmlCb290U2VydmljZXNEYXRhKSkpICkKICAgICAgICAgewogICAgICAgICAgICAgaWYgKCAhbWVt
aW5mb19hZGRfYmFuaygmYm9vdGluZm8ubWVtLCBkZXNjX3B0cikgKQogICAgICAgICAgICAgewot
LSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
