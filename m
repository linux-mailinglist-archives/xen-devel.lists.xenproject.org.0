Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CCA1862C3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 03:40:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDfbQ-0005DW-Av; Mon, 16 Mar 2020 02:35:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Dpgy=5B=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1jDfbO-0005Ch-8j
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 02:35:38 +0000
X-Inumbo-ID: d0a97804-672e-11ea-b34e-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0a97804-672e-11ea-b34e-bc764e2007e4;
 Mon, 16 Mar 2020 02:35:35 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8FFCB20739;
 Mon, 16 Mar 2020 02:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584326135;
 bh=hcTIdJiCXvD/krcQTIT1ht5ObWgrP9GQXXZnj8Jlw7w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vMCQnxLes1PnUEPvg9aV30xSZjnZFbmcdtbP8QRwJZPKInOrX7Eatz2ABCJWmKTrx
 kPxOfE5sKHTt2XfJ0k/XzidgJAe5MFuwIoatTiYKBe1cmXuPWirH1lfeUEzlXEIqb7
 xwYA7uNZDY+g7gv5gfhGq5LqO+g1vgeNTM9vNXgk=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sun, 15 Mar 2020 22:35:17 -0400
Message-Id: <20200316023519.2050-13-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316023519.2050-1-sashal@kernel.org>
References: <20200316023519.2050-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Xen-devel] [PATCH AUTOSEL 4.14 13/15] xenbus: req->err should be
 updated before req->state
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
Cc: Sasha Levin <sashal@kernel.org>, Dongli Zhang <dongli.zhang@oracle.com>,
 Julien Grall <jgrall@amazon.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRG9uZ2xpIFpoYW5nIDxkb25nbGkuemhhbmdAb3JhY2xlLmNvbT4KClsgVXBzdHJlYW0g
Y29tbWl0IDgxMzBiOWQ1YjVhYmYyNmY5OTI3YjQ4N2MxNTMxOWExODc3NzVmMzQgXQoKVGhpcyBw
YXRjaCBhZGRzIHRoZSBiYXJyaWVyIHRvIGd1YXJhbnRlZSB0aGF0IHJlcS0+ZXJyIGlzIGFsd2F5
cyB1cGRhdGVkCmJlZm9yZSByZXEtPnN0YXRlLgoKT3RoZXJ3aXNlLCByZWFkX3JlcGx5KCkgd291
bGQgbm90IHJldHVybiBFUlJfUFRSKHJlcS0+ZXJyKSBidXQKcmVxLT5ib2R5LCB3aGVuIHByb2Nl
c3Nfd3JpdGVzKCktPnhiX3dyaXRlKCkgaXMgZmFpbGVkLgoKU2lnbmVkLW9mZi1ieTogRG9uZ2xp
IFpoYW5nIDxkb25nbGkuemhhbmdAb3JhY2xlLmNvbT4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci8yMDIwMDMwMzIyMTQyMy4yMTk2Mi0yLWRvbmdsaS56aGFuZ0BvcmFjbGUuY29tClJl
dmlld2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgpTaWduZWQtb2ZmLWJ5
OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgpTaWduZWQtb2Zm
LWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy94ZW4veGVu
YnVzL3hlbmJ1c19jb21tcy5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfY29tbXMuYyBiL2RyaXZl
cnMveGVuL3hlbmJ1cy94ZW5idXNfY29tbXMuYwppbmRleCA4NTJlZDE2MWZjMmE3Li5lYjUxNTFm
YzhlZmFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX2NvbW1zLmMKKysr
IGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19jb21tcy5jCkBAIC0zOTcsNiArMzk3LDggQEAg
c3RhdGljIGludCBwcm9jZXNzX3dyaXRlcyh2b2lkKQogCWlmIChzdGF0ZS5yZXEtPnN0YXRlID09
IHhiX3JlcV9zdGF0ZV9hYm9ydGVkKQogCQlrZnJlZShzdGF0ZS5yZXEpOwogCWVsc2UgeworCQkv
KiB3cml0ZSBlcnIsIHRoZW4gdXBkYXRlIHN0YXRlICovCisJCXZpcnRfd21iKCk7CiAJCXN0YXRl
LnJlcS0+c3RhdGUgPSB4Yl9yZXFfc3RhdGVfZ290X3JlcGx5OwogCQl3YWtlX3VwKCZzdGF0ZS5y
ZXEtPndxKTsKIAl9Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
