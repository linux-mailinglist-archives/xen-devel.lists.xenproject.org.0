Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDB98B041
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:56:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQgh-00029T-Ew; Tue, 13 Aug 2019 06:53:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxQgf-00027A-BI
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:53:41 +0000
X-Inumbo-ID: e993ecda-bd26-11e9-8db2-43c97a43d94f
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e993ecda-bd26-11e9-8db2-43c97a43d94f;
 Mon, 12 Aug 2019 17:30:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88AEA1715;
 Mon, 12 Aug 2019 10:30:43 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D71353F706;
 Mon, 12 Aug 2019 10:30:42 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 18:30:09 +0100
Message-Id: <20190812173019.11956-19-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812173019.11956-1-julien.grall@arm.com>
References: <20190812173019.11956-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 18/28] xen/arm32: head: Move assembly switch
 to the runtime PT in secondary CPUs path
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

VGhlIGFzc2VtYmx5IHN3aXRjaCB0byB0aGUgcnVudGltZSBQVCBpcyBvbmx5IG5lY2Vzc2FyeSBm
b3IgdGhlCnNlY29uZGFyeSBDUFVzLiBTbyBtb3ZlIHRoZSBjb2RlIGluIHRoZSBzZWNvbmRhcnkg
Q1BVcyBwYXRoLgoKV2hpbGUgdGhpcyBpcyBkZWZpbml0ZWx5IG5vdCBjb21wbGlhbnQgd2l0aCB0
aGUgQXJtIEFybSBhcyB3ZSBhcmUKc3dpdGNoaW5nIGJldHdlZW4gdHdvIGRpZmZlcmVudHMgc2V0
IG9mIHBhZ2UtdGFibGVzIHdpdGhvdXQgdHVybmluZyBvZmYKdGhlIE1NVS4gVHVybmluZyBvZmYg
dGhlIE1NVSBpcyBpbXBvc3NpYmxlIGhlcmUgYXMgdGhlIElEIG1hcCBtYXkgY2xhc2gKd2l0aCBv
dGhlciBtYXBwaW5ncyBpbiB0aGUgcnVudGltZSBwYWdlLXRhYmxlcy4gVGhpcyB3aWxsIHJlcXVp
cmUgbW9yZQpyZXdvcmsgdG8gYXZvaWQgdGhlIHByb2JsZW0uIFNvIGZvciBub3cgYWRkIGEgVE9E
TyBpbiB0aGUgY29kZS4KCkZpbmFsbHksIHRoZSBjb2RlIGlzIGN1cnJlbnRseSBhc3N1bWUgdGhh
dCByNSB3aWxsIGJlIHByb3Blcmx5IHNldCB0byAwCmJlZm9yZSBoYW5kLiBUaGlzIGlzIGRvbmUg
YnkgY3JlYXRlX3BhZ2VfdGFibGVzKCkgd2hpY2ggaXMgY2FsbGVkIHF1aXRlCmVhcmx5IGluIHRo
ZSBib290IHByb2Nlc3MuIFRoZXJlIGFyZSBhIHJpc2sgdGhpcyBtYXkgYmUgb3ZlcnNpZ2h0IGlu
IHRoZQpmdXR1cmUgYW5kIHRoZXJlZm9yZSBicmVha2luZyBzZWNvbmRhcnkgQ1BVcyBib290LiBJ
bnN0ZWFkLCBzZXQgcjUgdG8gMApqdXN0IGJlZm9yZSB1c2luZyBpdC4KClNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgotLS0KICAgIENoYW5nZXMgaW4g
djM6CiAgICAgICAgLSBUaGVyZSBpcyBubyBuZWVkIHRvIHplcm8gcjUKCiAgICBDaGFuZ2VzIGlu
IHYyOgogICAgICAgIC0gUGF0Y2ggYWRkZWQKLS0tCiB4ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5T
IHwgNDEgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwppbmRl
eCBmODYwMzA1MWU0Li4wYzk1ZDFjNDMyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYXJtMzIv
aGVhZC5TCisrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKQEAgLTIwMiw2ICsyMDIsMjUg
QEAgR0xPQkFMKGluaXRfc2Vjb25kYXJ5KQogICAgICAgICBtb3YgICBwYywgcjAKIHNlY29uZGFy
eV9zd2l0Y2hlZDoKICAgICAgICAgYmwgICAgc2V0dXBfZml4bWFwCisKKyAgICAgICAgLyoKKyAg
ICAgICAgICogTm9uLWJvb3QgQ1BVcyBuZWVkIHRvIG1vdmUgb24gdG8gdGhlIHByb3BlciBwYWdl
dGFibGVzLCB3aGljaCB3ZXJlCisgICAgICAgICAqIHNldHVwIGluIGluaXRfc2Vjb25kYXJ5X3Bh
Z2V0YWJsZXMuCisgICAgICAgICAqCisgICAgICAgICAqIFhYWDogVGhpcyBpcyBub3QgY29tcGxp
YW50IHdpdGggdGhlIEFybSBBcm0uCisgICAgICAgICAqLworICAgICAgICBsZHIgICByNCwgPWlu
aXRfdHRiciAgICAgICAgIC8qIFZBIG9mIEhUVEJSIHZhbHVlIHN0YXNoZWQgYnkgQ1BVIDAgKi8K
KyAgICAgICAgbGRyZCAgcjQsIHI1LCBbcjRdICAgICAgICAgICAvKiBBY3R1YWwgdmFsdWUgKi8K
KyAgICAgICAgZHNiCisgICAgICAgIG1jcnIgIENQNjQocjQsIHI1LCBIVFRCUikKKyAgICAgICAg
ZHNiCisgICAgICAgIGlzYgorICAgICAgICBtY3IgICBDUDMyKHIwLCBUTEJJQUxMSCkgICAgIC8q
IEZsdXNoIGh5cGVydmlzb3IgVExCICovCisgICAgICAgIG1jciAgIENQMzIocjAsIElDSUFMTFUp
ICAgICAgLyogRmx1c2ggSS1jYWNoZSAqLworICAgICAgICBtY3IgICBDUDMyKHIwLCBCUElBTEwp
ICAgICAgIC8qIEZsdXNoIGJyYW5jaCBwcmVkaWN0b3IgKi8KKyAgICAgICAgZHNiICAgICAgICAg
ICAgICAgICAgICAgICAgICAvKiBFbnN1cmUgY29tcGxldGlvbiBvZiBUTEIrQlAgZmx1c2ggKi8K
KyAgICAgICAgaXNiCisKICAgICAgICAgYiAgICAgbGF1bmNoCiBFTkRQUk9DKGluaXRfc2Vjb25k
YXJ5KQogCkBAIC01MDUsMjggKzUyNCw2IEBAIEVORFBST0Moc2V0dXBfZml4bWFwKQogbGF1bmNo
OgogICAgICAgICBQUklOVCgiLSBSZWFkeSAtXHJcbiIpCiAKLSAgICAgICAgLyogVGhlIGJvb3Qg
Q1BVIHNob3VsZCBnbyBzdHJhaWdodCBpbnRvIEMgbm93ICovCi0gICAgICAgIHRlcSAgIHIxMiwg
IzAKLSAgICAgICAgYmVxICAgMWYKLQotICAgICAgICAvKgotICAgICAgICAgKiBOb24tYm9vdCBD
UFVzIG5lZWQgdG8gbW92ZSBvbiB0byB0aGUgcHJvcGVyIHBhZ2V0YWJsZXMsIHdoaWNoIHdlcmUK
LSAgICAgICAgICogc2V0dXAgaW4gaW5pdF9zZWNvbmRhcnlfcGFnZXRhYmxlcy4KLSAgICAgICAg
ICovCi0KLSAgICAgICAgbGRyICAgcjQsID1pbml0X3R0YnIgICAgICAgICAvKiBWQSBvZiBIVFRC
UiB2YWx1ZSBzdGFzaGVkIGJ5IENQVSAwICovCi0gICAgICAgIGxkcmQgIHI0LCByNSwgW3I0XSAg
ICAgICAgICAgLyogQWN0dWFsIHZhbHVlICovCi0gICAgICAgIGRzYgotICAgICAgICBtY3JyICBD
UDY0KHI0LCByNSwgSFRUQlIpCi0gICAgICAgIGRzYgotICAgICAgICBpc2IKLSAgICAgICAgbWNy
ICAgQ1AzMihyMCwgVExCSUFMTEgpICAgICAvKiBGbHVzaCBoeXBlcnZpc29yIFRMQiAqLwotICAg
ICAgICBtY3IgICBDUDMyKHIwLCBJQ0lBTExVKSAgICAgIC8qIEZsdXNoIEktY2FjaGUgKi8KLSAg
ICAgICAgbWNyICAgQ1AzMihyMCwgQlBJQUxMKSAgICAgICAvKiBGbHVzaCBicmFuY2ggcHJlZGlj
dG9yICovCi0gICAgICAgIGRzYiAgICAgICAgICAgICAgICAgICAgICAgICAgLyogRW5zdXJlIGNv
bXBsZXRpb24gb2YgVExCK0JQIGZsdXNoICovCi0gICAgICAgIGlzYgotCi0xOgogICAgICAgICBs
ZHIgICByMCwgPWluaXRfZGF0YQogICAgICAgICBhZGQgICByMCwgI0lOSVRJTkZPX3N0YWNrICAg
IC8qIEZpbmQgdGhlIGJvb3QtdGltZSBzdGFjayAqLwogICAgICAgICBsZHIgICBzcCwgW3IwXQot
LSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
