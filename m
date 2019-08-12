Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C8A8A4A9
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 19:33:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxE9V-0006hP-9P; Mon, 12 Aug 2019 17:30:37 +0000
Received: from [172.99.69.81] (helo=us1-rack-iad1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dIXR=WI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxE9T-0006hB-Kf
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 17:30:35 +0000
X-Inumbo-ID: e4367596-bd26-11e9-883b-d7d30b8f119f
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e4367596-bd26-11e9-883b-d7d30b8f119f;
 Mon, 12 Aug 2019 17:30:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 788301993;
 Mon, 12 Aug 2019 10:30:34 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6E133F706;
 Mon, 12 Aug 2019 10:30:33 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 18:29:59 +0100
Message-Id: <20190812173019.11956-9-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812173019.11956-1-julien.grall@arm.com>
References: <20190812173019.11956-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 08/28] xen/arm32: head: Add a macro to move
 an immediate constant into a 32-bit register
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

VGhlIGN1cnJlbnQgYm9vdCBjb2RlIGlzIHVzaW5nIHRoZSBwYXR0ZXJuIGxkciByWCwgPS4uLiB0
byBtb3ZlIGFuCmltbWVkaWF0ZSBjb25zdGFudCBpbnRvIGEgMzItYml0IHJlZ2lzdGVyLgoKVGhp
cyBwYXR0ZXJuIGltcGxpZXMgdG8gbG9hZCB0aGUgaW1tZWRpYXRlIGNvbnN0YW50IGZyb20gYSBs
aXRlcmFsIHBvb2wsCm1lYW5pbmcgYSBtZW1vcnkgYWNjZXNzIHdpbGwgYmUgcGVyZm9ybWVkLgoK
VGhlIG1lbW9yeSBhY2Nlc3MgY2FuIGJlIGF2b2lkZWQgYnkgdXNpbmcgbW92dy9tb3Z0IGluc3Ry
dWN0aW9ucy4KCkEgbmV3IG1hY3JvIGlzIGludHJvZHVjZWQgdG8gbW92ZSBhbiBpbW1lZGlhdGUg
Y29uc3RhbnQgaW50byBhIDMyLWJpdApyZWdpc3RlciB3aXRob3V0IGEgbWVtb3J5IGxvYWQuIEZv
bGxvdy11cCBwYXRjaGVzIHdpbGwgbWFrZSB1c2Ugb2YgaXQuCgpTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKLS0tCiAgICBDaGFuZ2VzIGluIHYzOgogICAg
ICAgIC0gQWRkIFN0ZWZhbm8ncyBhY2tlZC1ieQoKICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAg
LSBQYXRjaCBhZGRlZAotLS0KIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgfCA5ICsrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9hcm0zMi9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCmluZGV4IDE4ZGVk
NDlhMDQuLjk5ZjRhZjE4ZDggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMK
KysrIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwpAQCAtMzcsNiArMzcsMTUgQEAKICNlbmRp
ZgogCiAvKgorICogTW92ZSBhbiBpbW1lZGlhdGUgY29uc3RhbnQgaW50byBhIDMyLWJpdCByZWdp
c3RlciB1c2luZyBtb3Z3L21vdnQKKyAqIGluc3RydWN0aW9ucy4KKyAqLworLm1hY3JvIG1vdl93
IHJlZywgd29yZAorICAgICAgICBtb3Z3ICBccmVnLCAjOmxvd2VyMTY6XHdvcmQKKyAgICAgICAg
bW92dCAgXHJlZywgIzp1cHBlcjE2Olx3b3JkCisuZW5kbQorCisvKgogICogQ29tbW9uIHJlZ2lz
dGVyIHVzYWdlIGluIHRoaXMgZmlsZToKICAqICAgcjAgIC0KICAqICAgcjEgIC0KLS0gCjIuMTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
