Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7C28B03D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:55:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQgK-0001x1-UD; Tue, 13 Aug 2019 06:53:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxQgJ-0001wd-No
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:53:19 +0000
X-Inumbo-ID: a8050ef8-bcf3-11e9-a281-e77186e782e6
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a8050ef8-bcf3-11e9-a281-e77186e782e6;
 Mon, 12 Aug 2019 11:23:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C06215AB;
 Mon, 12 Aug 2019 04:23:49 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 675733F706;
 Mon, 12 Aug 2019 04:23:48 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 12:23:43 +0100
Message-Id: <20190812112343.26858-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH] xen/arm: setup: Add Xen as boot module before
 printing all boot modules
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2luY2UgY29tbWl0IGY2MDY1OGM2YWUgInhlbi9hcm06IFN0b3AgcmVsb2NhdGluZyBYZW4iLCB0
aGUgcG9zaXRpb24gb2YKWGVuIGluIG1lbW9yeSBpcyBub3QgcHJpbnRlZCBhbnltb3JlLiBUaGlz
IGNhbiBtYWtlIGRpZmZpY3VsdCB0byBkZWJ1ZwplYXJseSBjb2RlLgoKQXMgWGVuIGlzIG5vdCBy
ZWxvY2F0ZWQgYW55bW9yZSwgd2UgY2FuIGFkZCBYZW4gYXMgYm9vdCBtb2R1bGUgYmVmb3JlCmNh
bGxpbmcgYm9vdF9mZHRfaW5mbygpLiBXaXRoIHRoYXQsIHRoZSBmdW5jdGlvbiB3aWxsIHByaW50
IFhlbiBtb2R1bGUKaW5mb3JtYXRpb24gYWxvbmcgd2l0aCBhbGwgdGhlIG90aGVyIG1vZHVsZXMu
CgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0K
IHhlbi9hcmNoL2FybS9zZXR1cC5jIHwgMTIgKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9zZXR1cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKaW5kZXggZDA0N2ZmOGUzMS4uNzUwOWQ3
NmRkNCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMKKysrIGIveGVuL2FyY2gvYXJt
L3NldHVwLmMKQEAgLTc3OSwxOCArNzc5LDE4IEBAIHZvaWQgX19pbml0IHN0YXJ0X3hlbih1bnNp
Z25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQsCiAgICAgICAgICAgICAgICJQbGVhc2UgY2hlY2sg
eW91ciBib290bG9hZGVyLlxuIiwKICAgICAgICAgICAgICAgZmR0X3BhZGRyKTsKIAotICAgIGZk
dF9zaXplID0gYm9vdF9mZHRfaW5mbyhkZXZpY2VfdHJlZV9mbGF0dGVuZWQsIGZkdF9wYWRkcik7
Ci0KLSAgICBjbWRsaW5lID0gYm9vdF9mZHRfY21kbGluZShkZXZpY2VfdHJlZV9mbGF0dGVuZWQp
OwotICAgIHByaW50aygiQ29tbWFuZCBsaW5lOiAlc1xuIiwgY21kbGluZSk7Ci0gICAgY21kbGlu
ZV9wYXJzZShjbWRsaW5lKTsKLQogICAgIC8qIFJlZ2lzdGVyIFhlbidzIGxvYWQgYWRkcmVzcyBh
cyBhIGJvb3QgbW9kdWxlLiAqLwogICAgIHhlbl9ib290bW9kdWxlID0gYWRkX2Jvb3RfbW9kdWxl
KEJPT1RNT0RfWEVOLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAocGFkZHJfdCkodWlu
dHB0cl90KShfc3RhcnQgKyBib290X3BoeXNfb2Zmc2V0KSwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKHBhZGRyX3QpKHVpbnRwdHJfdCkoX2VuZCAtIF9zdGFydCArIDEpLCBmYWxzZSk7
CiAgICAgQlVHX09OKCF4ZW5fYm9vdG1vZHVsZSk7CiAKKyAgICBmZHRfc2l6ZSA9IGJvb3RfZmR0
X2luZm8oZGV2aWNlX3RyZWVfZmxhdHRlbmVkLCBmZHRfcGFkZHIpOworCisgICAgY21kbGluZSA9
IGJvb3RfZmR0X2NtZGxpbmUoZGV2aWNlX3RyZWVfZmxhdHRlbmVkKTsKKyAgICBwcmludGsoIkNv
bW1hbmQgbGluZTogJXNcbiIsIGNtZGxpbmUpOworICAgIGNtZGxpbmVfcGFyc2UoY21kbGluZSk7
CisKICAgICBzZXR1cF9tbShmZHRfcGFkZHIsIGZkdF9zaXplKTsKIAogICAgIC8qIFBhcnNlIHRo
ZSBBQ1BJIHRhYmxlcyBmb3IgcG9zc2libGUgYm9vdC10aW1lIGNvbmZpZ3VyYXRpb24gKi8KLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
