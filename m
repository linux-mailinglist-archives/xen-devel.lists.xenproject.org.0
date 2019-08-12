Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E528B01C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:49:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQZw-00007O-3J; Tue, 13 Aug 2019 06:46:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxQZu-00007F-UI
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:46:42 +0000
X-Inumbo-ID: e7fe84b6-bd26-11e9-a00c-e78223b30793
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e7fe84b6-bd26-11e9-a00c-e78223b30793;
 Mon, 12 Aug 2019 17:30:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D59531993;
 Mon, 12 Aug 2019 10:30:40 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FC9A3F706;
 Mon, 12 Aug 2019 10:30:40 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 18:30:06 +0100
Message-Id: <20190812173019.11956-16-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812173019.11956-1-julien.grall@arm.com>
References: <20190812173019.11956-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 15/28] xen/arm32: head: Rework and document
 zero_bss()
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

T24gc2Vjb25kYXJ5IENQVXMsIHplcm9fYnNzKCkgd2lsbCBiZSBhIE5PUCBiZWNhdXNlIEJTUyBv
bmx5IG5lZWQgdG8gYmUKemVyb2VkIG9uY2UgYXQgYm9vdC4gU28gdGhlIGNhbGwgaW4gdGhlIHNl
Y29uZGFyeSBDUFVzIHBhdGggY2FuIGJlCnJlbW92ZWQuCgpMYXN0bHksIGRvY3VtZW50IHRoZSBi
ZWhhdmlvciBhbmQgdGhlIG1haW4gcmVnaXN0ZXJzIHVzYWdlIHdpdGhpbiB0aGUKZnVuY3Rpb24u
CgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpSZXZp
ZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKLS0t
CiAgICBDaGFuZ2VzIGluIHYzOgogICAgICAgIC0gQWRkIFN0ZWZhbm8ncyByZXZpZXdlZC1ieQoK
ICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBQYXRjaCBhZGRlZAotLS0KIHhlbi9hcmNoL2Fy
bS9hcm0zMi9oZWFkLlMgfCAxNCArKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJt
MzIvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwppbmRleCBjN2I0ZmU0Y2Q0Li4x
MTg5ZWQ2YzQ3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCisrKyBiL3hl
bi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKQEAgLTE5Miw3ICsxOTIsNiBAQCBHTE9CQUwoaW5pdF9z
ZWNvbmRhcnkpCiAgICAgICAgIFBSSU5UKCIgYm9vdGluZyAtXHJcbiIpCiAjZW5kaWYKICAgICAg
ICAgYmwgICAgY2hlY2tfY3B1X21vZGUKLSAgICAgICAgYmwgICAgemVyb19ic3MKICAgICAgICAg
YmwgICAgY3B1X2luaXQKICAgICAgICAgYmwgICAgY3JlYXRlX3BhZ2VfdGFibGVzCiAgICAgICAg
IGJsICAgIGVuYWJsZV9tbXUKQEAgLTIzOCwxMSArMjM3LDE1IEBAIGNoZWNrX2NwdV9tb2RlOgog
ICAgICAgICBiICAgICBmYWlsCiBFTkRQUk9DKGNoZWNrX2NwdV9tb2RlKQogCisvKgorICogWmVy
byBCU1MKKyAqCisgKiBJbnB1dHM6CisgKiAgIHIxMDogUGh5c2ljYWwgb2Zmc2V0CisgKgorICog
Q2xvYmJlcnMgcjAgLSByMworICovCiB6ZXJvX2JzczoKLSAgICAgICAgLyogWmVybyBCU1MgT24g
dGhlIGJvb3QgQ1BVIHRvIGF2b2lkIG5hc3R5IHN1cnByaXNlcyAqLwotICAgICAgICB0ZXEgICBy
MTIsICMwCi0gICAgICAgIGJuZSAgIHNraXBfYnNzCi0KICAgICAgICAgUFJJTlQoIi0gWmVybyBC
U1MgLVxyXG4iKQogICAgICAgICBsZHIgICByMCwgPV9fYnNzX3N0YXJ0ICAgICAgIC8qIExvYWQg
c3RhcnQgJiBlbmQgb2YgYnNzICovCiAgICAgICAgIGxkciAgIHIxLCA9X19ic3NfZW5kCkBAIC0y
NTQsNyArMjU3LDYgQEAgemVyb19ic3M6CiAgICAgICAgIGNtcCAgIHIwLCByMQogICAgICAgICBi
bG8gICAxYgogCi1za2lwX2JzczoKICAgICAgICAgbW92ICAgcGMsIGxyCiBFTkRQUk9DKHplcm9f
YnNzKQogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
