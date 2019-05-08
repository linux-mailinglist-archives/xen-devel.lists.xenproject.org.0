Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FFB1826F
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 00:49:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOVLY-0005dG-GB; Wed, 08 May 2019 22:47:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FJge=TI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hOVLW-0005cv-L2
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 22:47:30 +0000
X-Inumbo-ID: 42224dae-71e3-11e9-9af2-67137243bebd
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42224dae-71e3-11e9-9af2-67137243bebd;
 Wed, 08 May 2019 22:47:29 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C68F4214AF;
 Wed,  8 May 2019 22:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557355649;
 bh=C4xeet4PT74Qrv0I49NufomaIN2mdjU81vF4e8+VXAg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OzxzPUMgR+IRg/+h+13RcBneHmros+OZ5EVfSaIc7OQ8rHkDYjtDvFAZ7eFRvJRoV
 XimyKuIVH8d7qJUDgsl2aOmfFLFkhpxD/DJz9Eq9cHuOCegciAERyjwi+cJtwp4ucx
 GpnxhFRvc40NJlgmdRo0cQ4JHfHtucTupqh5iHsE=
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien.grall@arm.com
Date: Wed,  8 May 2019 15:47:25 -0700
Message-Id: <20190508224727.11549-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1905081538170.9403@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1905081538170.9403@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v2 1/3] xen/arm: fix nr_pdxs calculation
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, JBeulich@suse.com,
 Stefano Stabellini <stefanos@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cGZuX3RvX3BkeCBleHBlY3RzIGFuIGFkZHJlc3MsIG5vdCBhIHNpemUsIGFzIGEgcGFyYW1ldGVy
LiBJdCBleHBlY3RzCnRoZSBlbmQgYWRkcmVzcywgYW5kIHRoZSBtYXNrcyBjYWxjdWxhdGlvbnMg
Y29tcGVuc2F0ZSBmb3IgYW55IGhvbGVzCmJldHdlZW4gc3RhcnQgYW5kIGVuZC4gUGFzcyB0aGUg
ZW5kIGFkZHJlc3MgdG8gcGZuX3RvX3BkeC4gQWxzbyByZW1vdmUKZnJvbSB0aGUgcmVzdWx0IHBm
bl90b19wZHgoc3RhcnRfYWRkcmVzcykgYmVjYXVzZSB3ZSBrbm93IHRoYXQgd2UKZG9uJ3QgbmVl
ZCB0byBjb3ZlciBhbnkgbWVtb3J5IGluIHRoZSByYW5nZSAwLXN0YXJ0IGluIHRoZSBmcmFtZXRh
YmxlLgoKUmVtb3ZlIHRoZSB2YXJpYWJsZSBgbnJfcGFnZXMnIGJlY2F1c2UgaXQgaXMgdW51c2Vk
LgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29t
PgpDQzogSkJldWxpY2hAc3VzZS5jb20KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gdXNlIG1mbl90b19w
ZHggYW5kIG1hZGRyX3RvX21mbiBhbG9uZyB3aXRoIG1mbl9hZGQoKQotLS0KIHhlbi9hcmNoL2Fy
bS9tbS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21t
LmMKaW5kZXggMDFhZTJjY2NjMC4uNThkNzFkM2MyMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJt
L21tLmMKKysrIGIveGVuL2FyY2gvYXJtL21tLmMKQEAgLTg3NCw4ICs4NzQsOCBAQCB2b2lkIF9f
aW5pdCBzZXR1cF94ZW5oZWFwX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgYmFzZV9tZm4sCiAvKiBN
YXAgYSBmcmFtZSB0YWJsZSB0byBjb3ZlciBwaHlzaWNhbCBhZGRyZXNzZXMgcHMgdGhyb3VnaCBw
ZSAqLwogdm9pZCBfX2luaXQgc2V0dXBfZnJhbWV0YWJsZV9tYXBwaW5ncyhwYWRkcl90IHBzLCBw
YWRkcl90IHBlKQogewotICAgIHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMgPSAocGUgLSBwcykgPj4g
UEFHRV9TSElGVDsKLSAgICB1bnNpZ25lZCBsb25nIG5yX3BkeHMgPSBwZm5fdG9fcGR4KG5yX3Bh
Z2VzKTsKKyAgICB1bnNpZ25lZCBsb25nIG5yX3BkeHMgPSBtZm5fdG9fcGR4KG1mbl9hZGQobWFk
ZHJfdG9fbWZuKHBlKSwgLTEpKSAtCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWZuX3Rv
X3BkeChtYWRkcl90b19tZm4ocHMpKSArIDE7CiAgICAgdW5zaWduZWQgbG9uZyBmcmFtZXRhYmxl
X3NpemUgPSBucl9wZHhzICogc2l6ZW9mKHN0cnVjdCBwYWdlX2luZm8pOwogICAgIG1mbl90IGJh
c2VfbWZuOwogICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgbWFwcGluZ19zaXplID0gZnJhbWV0YWJs
ZV9zaXplIDwgTUIoMzIpID8gTUIoMikgOiBNQigzMik7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
