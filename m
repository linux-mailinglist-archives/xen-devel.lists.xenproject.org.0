Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 482EB81D4F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 15:32:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hud3t-0004gO-2Y; Mon, 05 Aug 2019 13:30:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j9cV=WB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hud3r-0004SQ-LE
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 13:30:03 +0000
X-Inumbo-ID: 202e516a-b785-11e9-962b-3fb4080497cd
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 202e516a-b785-11e9-962b-3fb4080497cd;
 Mon, 05 Aug 2019 13:30:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7E14337;
 Mon,  5 Aug 2019 06:30:00 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 389863F706;
 Mon,  5 Aug 2019 06:29:59 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  5 Aug 2019 14:29:51 +0100
Message-Id: <20190805132955.1630-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH v2 0/4] xen/console: Bug fixes and doc
 improvement
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBzZXJpZXMgY29udGFpbnMgYSBidW5jaCBvZiBidWcgZml4ZXMgZm9yIHRo
ZSBoeXBlcmNhbGwgQ09OU09MRUlPX3dyaXRlCmFuZCBzb21lIGRvY3VtZW50YXRpb24uCgpDaGVl
cnMsCgpKdWxpZW4gR3JhbGwgKDQpOgogIHhlbi9jb25zb2xlOiBEb24ndCB0cmVhdCBOVUwgY2hh
cmFjdGVyIGFzIHRoZSBlbmQgb2YgdGhlIGJ1ZmZlcgogIHhlbi9jb25zb2xlOiBSZXdvcmsgSFlQ
RVJDQUxMX2NvbnNvbGVfaW8gaW50ZXJmYWNlCiAgeGVuL3B1YmxpYzogRG9jdW1lbnQgSFlQRVJD
QUxMX2NvbnNvbGVfaW8oKQogIHhlbi9jb25zb2xlOiBTaW1wbGlmeSBkb21VIGNvbnNvbGUgaGFu
ZGxpbmcgaW4gZ3Vlc3RfY29uc29sZV93cml0ZQoKIHhlbi9hcmNoL2FybS9lYXJseV9wcmludGsu
YyAgICAgICB8ICA1ICsrLQogeGVuL2NvbW1vbi9nZGJzdHViLmMgICAgICAgICAgICAgIHwgIDYg
Ky0tCiB4ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyAgICAgICAgfCA4MyArKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9kcml2ZXJzL2NoYXIvY29uc29sZWQuYyAg
ICAgICB8ICA3ICstLS0KIHhlbi9kcml2ZXJzL2NoYXIvc2VyaWFsLmMgICAgICAgICB8ICA3ICsr
LS0KIHhlbi9kcml2ZXJzL2NoYXIveGVuX3B2X2NvbnNvbGUuYyB8IDEwICsrLS0tCiB4ZW4vZHJp
dmVycy92aWRlby9sZmIuYyAgICAgICAgICAgfCAxNCArKysrLS0tCiB4ZW4vZHJpdmVycy92aWRl
by9sZmIuaCAgICAgICAgICAgfCAgNCArLQogeGVuL2RyaXZlcnMvdmlkZW8vdmdhLmMgICAgICAg
ICAgIHwgMTQgKysrLS0tLQogeGVuL2luY2x1ZGUvcHVibGljL3hlbi5oICAgICAgICAgIHwgMjQg
KysrKysrKysrKy0KIHhlbi9pbmNsdWRlL3hlbi9jb25zb2xlLmggICAgICAgICB8ICAyICstCiB4
ZW4vaW5jbHVkZS94ZW4vZWFybHlfcHJpbnRrLmggICAgfCAgMiArLQogeGVuL2luY2x1ZGUveGVu
L2h5cGVyY2FsbC5oICAgICAgIHwgIDQgKy0KIHhlbi9pbmNsdWRlL3hlbi9wdl9jb25zb2xlLmgg
ICAgICB8ICA0ICstCiB4ZW4vaW5jbHVkZS94ZW4vc2VyaWFsLmggICAgICAgICAgfCAgNCArLQog
eGVuL2luY2x1ZGUveGVuL3ZpZGVvLmggICAgICAgICAgIHwgIDQgKy0KIDE2IGZpbGVzIGNoYW5n
ZWQsIDExMSBpbnNlcnRpb25zKCspLCA4MyBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
