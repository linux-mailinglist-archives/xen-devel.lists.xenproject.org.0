Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8E3131777
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 19:28:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioX5L-0003Ub-IY; Mon, 06 Jan 2020 18:26:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JuuU=23=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ioX5K-0003UW-7H
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 18:26:38 +0000
X-Inumbo-ID: 1301f952-30b2-11ea-ab4f-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1301f952-30b2-11ea-ab4f-12813bfff9fa;
 Mon, 06 Jan 2020 18:26:37 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C48BE24676;
 Mon,  6 Jan 2020 18:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578335197;
 bh=NWWARxEV0s1XHYVPLrIrR8mW8V3zRq/cCBu1IzVnN1c=;
 h=From:To:Cc:Subject:Date:From;
 b=UWiQQqbYNm6Mft5Mdp4ELqXpUhmHEMmOOVMABl7hwZlbZ+5yIgytvjkKRq5V3kvBD
 k2B19NwMbteQmwS1qsWQOR33GsZs3FKHBdCEbVHfKNTPk6kVFQ8sSX0XfXJx4UQQ7t
 VrqphWor6JaRUWhla4ipHzaUQiuvx/KvYQEqk8J4=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Mon,  6 Jan 2020 10:26:20 -0800
Message-Id: <20200106182620.19505-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] xen/arm: during efi boot,
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
IHRoZSBjaGVjayBvbiBwYXIgd2l0aCBMaW51eCBhbmQgbWFrZXMgbW9yZSBtZW1vcnkKcmV1c2Fi
bGUgYXMgbm9ybWFsIG1lbW9yeSBieSBYZW4uCgpSZXBvcnRlZC1ieTogUm9tYW4gU2hhcG9zaG5p
ayA8cm9tYW5AemVkZWRhLmNvbT4KU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxz
dGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbT4KQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+Ci0tLQogeGVuL2FyY2gvYXJtL2VmaS9lZmktYm9vdC5oIHwgMTEgKysrKysrKy0tLS0K
IHhlbi9pbmNsdWRlL2VmaS9lZmlkZWYuaCAgICB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9l
ZmkvZWZpLWJvb3QuaCBiL3hlbi9hcmNoL2FybS9lZmkvZWZpLWJvb3QuaAppbmRleCBkN2JmOTM0
MDc3Li41ZDFkNTI2ZDE3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290LmgK
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
ICAgICAgICBkZXNjX3B0ci0+VHlwZSA9PSBFZmlQZXJzaXN0ZW50TWVtb3J5IHx8CisgICAgICAg
ICAgICAgIGRlc2NfcHRyLT5UeXBlID09IEVmaUJvb3RTZXJ2aWNlc0NvZGUgfHwKKyAgICAgICAg
ICAgICAgZGVzY19wdHItPlR5cGUgPT0gRWZpQm9vdFNlcnZpY2VzRGF0YSkgKQogICAgICAgICB7
CiAgICAgICAgICAgICBpZiAoICFtZW1pbmZvX2FkZF9iYW5rKCZib290aW5mby5tZW0sIGRlc2Nf
cHRyKSApCiAgICAgICAgICAgICB7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9lZmkvZWZpZGVm
LmggYi94ZW4vaW5jbHVkZS9lZmkvZWZpZGVmLmgKaW5kZXggODZhN2UxMTFiZi4uZjQ2MjA3ODQw
ZiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvZWZpL2VmaWRlZi5oCisrKyBiL3hlbi9pbmNsdWRl
L2VmaS9lZmlkZWYuaApAQCAtMTQ3LDYgKzE0Nyw3IEBAIHR5cGVkZWYgZW51bSB7CiAgICAgRWZp
TWVtb3J5TWFwcGVkSU8sCiAgICAgRWZpTWVtb3J5TWFwcGVkSU9Qb3J0U3BhY2UsCiAgICAgRWZp
UGFsQ29kZSwKKyAgICBFZmlQZXJzaXN0ZW50TWVtb3J5LAogICAgIEVmaU1heE1lbW9yeVR5cGUK
IH0gRUZJX01FTU9SWV9UWVBFOwogCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
