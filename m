Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8EB13484
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 22:52:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMf8P-0006X1-K8; Fri, 03 May 2019 20:50:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lar+=TD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hMf8O-0006WM-4b
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 20:50:20 +0000
X-Inumbo-ID: 0dcc37ec-6de5-11e9-bf08-eb69d0cd0c28
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0dcc37ec-6de5-11e9-bf08-eb69d0cd0c28;
 Fri, 03 May 2019 20:50:16 +0000 (UTC)
Received: from sstabellini-ThinkPad-X260.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 59463206E0;
 Fri,  3 May 2019 20:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556916615;
 bh=6XsE+gt78baCd6KmBGaA+0d0kaxvop1C8Z3z2A0tfyA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q7m25u9CQSIFxW1cXkw3IkWo0kKaKw7c28qtmpctuAiwsZVxV34ZEvnnSyC6n269o
 4CCHJLohuYF/IqBfUO9ZMxplkXl8UZo3Jg0Hjqk6GZH8lyz61RovsowCxK6p7TQR5x
 +gOuK5YM6fm/vxrPYNWG9A3uo9qDDrhU2czqEIIo=
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien.grall@arm.com
Date: Fri,  3 May 2019 13:50:12 -0700
Message-Id: <1556916614-21512-1-git-send-email-sstabellini@kernel.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
Subject: [Xen-devel] [PATCH 1/3] xen/arm: fix nr_pdxs calculation
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
PgpDQzogSkJldWxpY2hAc3VzZS5jb20KLS0tCiB4ZW4vYXJjaC9hcm0vbW0uYyB8IDQgKystLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCmluZGV4IDAxYWUyY2Mu
LjVjYjc5MzIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCisrKyBiL3hlbi9hcmNoL2Fy
bS9tbS5jCkBAIC04NzQsOCArODc0LDggQEAgdm9pZCBfX2luaXQgc2V0dXBfeGVuaGVhcF9tYXBw
aW5ncyh1bnNpZ25lZCBsb25nIGJhc2VfbWZuLAogLyogTWFwIGEgZnJhbWUgdGFibGUgdG8gY292
ZXIgcGh5c2ljYWwgYWRkcmVzc2VzIHBzIHRocm91Z2ggcGUgKi8KIHZvaWQgX19pbml0IHNldHVw
X2ZyYW1ldGFibGVfbWFwcGluZ3MocGFkZHJfdCBwcywgcGFkZHJfdCBwZSkKIHsKLSAgICB1bnNp
Z25lZCBsb25nIG5yX3BhZ2VzID0gKHBlIC0gcHMpID4+IFBBR0VfU0hJRlQ7Ci0gICAgdW5zaWdu
ZWQgbG9uZyBucl9wZHhzID0gcGZuX3RvX3BkeChucl9wYWdlcyk7CisgICAgdW5zaWduZWQgbG9u
ZyBucl9wZHhzID0gcGZuX3RvX3BkeCgocGUgPj4gUEFHRV9TSElGVCkgLSAxKSAtCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGZuX3RvX3BkeChwcyA+PiBQQUdFX1NISUZUKSArIDE7CiAg
ICAgdW5zaWduZWQgbG9uZyBmcmFtZXRhYmxlX3NpemUgPSBucl9wZHhzICogc2l6ZW9mKHN0cnVj
dCBwYWdlX2luZm8pOwogICAgIG1mbl90IGJhc2VfbWZuOwogICAgIGNvbnN0IHVuc2lnbmVkIGxv
bmcgbWFwcGluZ19zaXplID0gZnJhbWV0YWJsZV9zaXplIDwgTUIoMzIpID8gTUIoMikgOiBNQigz
Mik7Ci0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
