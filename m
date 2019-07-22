Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF90170BC1
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:42:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2y-0003IY-2I; Mon, 22 Jul 2019 21:40:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2r-00036D-Rw
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:33 +0000
X-Inumbo-ID: 54aa3c72-acc9-11e9-998a-a3848bc5c860
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 54aa3c72-acc9-11e9-998a-a3848bc5c860;
 Mon, 22 Jul 2019 21:40:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E563E152F;
 Mon, 22 Jul 2019 14:40:31 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F5893F71F;
 Mon, 22 Jul 2019 14:40:31 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:52 +0100
Message-Id: <20190722213958.5761-30-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 29/35] xen/arm32: head: Move assembly switch
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
djI6CiAgICAgICAgLSBQYXRjaCBhZGRlZAotLS0KIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMg
fCA0MiArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwppbmRl
eCA0MDgxYTUyZGZhLi42ZGM2MDMyNDk4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYXJtMzIv
aGVhZC5TCisrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKQEAgLTIwMSw2ICsyMDEsMjYg
QEAgR0xPQkFMKGluaXRfc2Vjb25kYXJ5KQogICAgICAgICBtb3YgICBwYywgcjAKIHNlY29uZGFy
eV9zd2l0Y2hlZDoKICAgICAgICAgYmwgICAgc2V0dXBfZml4bWFwCisKKyAgICAgICAgLyoKKyAg
ICAgICAgICogTm9uLWJvb3QgQ1BVcyBuZWVkIHRvIG1vdmUgb24gdG8gdGhlIHByb3BlciBwYWdl
dGFibGVzLCB3aGljaCB3ZXJlCisgICAgICAgICAqIHNldHVwIGluIGluaXRfc2Vjb25kYXJ5X3Bh
Z2V0YWJsZXMuCisgICAgICAgICAqCisgICAgICAgICAqIFhYWDogVGhpcyBpcyBub3QgY29tcGxp
YW50IHdpdGggdGhlIEFybSBBcm0uCisgICAgICAgICAqLworICAgICAgICBsZHIgICByNCwgPWlu
aXRfdHRiciAgICAgICAgIC8qIFZBIG9mIEhUVEJSIHZhbHVlIHN0YXNoZWQgYnkgQ1BVIDAgKi8K
KyAgICAgICAgbW92ICAgcjUsICMwCisgICAgICAgIGxkcmQgIHI0LCByNSwgW3I0XSAgICAgICAg
ICAgLyogQWN0dWFsIHZhbHVlICovCisgICAgICAgIGRzYgorICAgICAgICBtY3JyICBDUDY0KHI0
LCByNSwgSFRUQlIpCisgICAgICAgIGRzYgorICAgICAgICBpc2IKKyAgICAgICAgbWNyICAgQ1Az
MihyMCwgVExCSUFMTEgpICAgICAvKiBGbHVzaCBoeXBlcnZpc29yIFRMQiAqLworICAgICAgICBt
Y3IgICBDUDMyKHIwLCBJQ0lBTExVKSAgICAgIC8qIEZsdXNoIEktY2FjaGUgKi8KKyAgICAgICAg
bWNyICAgQ1AzMihyMCwgQlBJQUxMKSAgICAgICAvKiBGbHVzaCBicmFuY2ggcHJlZGljdG9yICov
CisgICAgICAgIGRzYiAgICAgICAgICAgICAgICAgICAgICAgICAgLyogRW5zdXJlIGNvbXBsZXRp
b24gb2YgVExCK0JQIGZsdXNoICovCisgICAgICAgIGlzYgorCiAgICAgICAgIGIgICAgIGxhdW5j
aAogRU5EUFJPQyhpbml0X3NlY29uZGFyeSkKIApAQCAtNTA0LDI4ICs1MjQsNiBAQCBFTkRQUk9D
KHNldHVwX2ZpeG1hcCkKIGxhdW5jaDoKICAgICAgICAgUFJJTlQoIi0gUmVhZHkgLVxyXG4iKQog
Ci0gICAgICAgIC8qIFRoZSBib290IENQVSBzaG91bGQgZ28gc3RyYWlnaHQgaW50byBDIG5vdyAq
LwotICAgICAgICB0ZXEgICByMTIsICMwCi0gICAgICAgIGJlcSAgIDFmCi0KLSAgICAgICAgLyoK
LSAgICAgICAgICogTm9uLWJvb3QgQ1BVcyBuZWVkIHRvIG1vdmUgb24gdG8gdGhlIHByb3BlciBw
YWdldGFibGVzLCB3aGljaCB3ZXJlCi0gICAgICAgICAqIHNldHVwIGluIGluaXRfc2Vjb25kYXJ5
X3BhZ2V0YWJsZXMuCi0gICAgICAgICAqLwotCi0gICAgICAgIGxkciAgIHI0LCA9aW5pdF90dGJy
ICAgICAgICAgLyogVkEgb2YgSFRUQlIgdmFsdWUgc3Rhc2hlZCBieSBDUFUgMCAqLwotICAgICAg
ICBsZHJkICByNCwgcjUsIFtyNF0gICAgICAgICAgIC8qIEFjdHVhbCB2YWx1ZSAqLwotICAgICAg
ICBkc2IKLSAgICAgICAgbWNyciAgQ1A2NChyNCwgcjUsIEhUVEJSKQotICAgICAgICBkc2IKLSAg
ICAgICAgaXNiCi0gICAgICAgIG1jciAgIENQMzIocjAsIFRMQklBTExIKSAgICAgLyogRmx1c2gg
aHlwZXJ2aXNvciBUTEIgKi8KLSAgICAgICAgbWNyICAgQ1AzMihyMCwgSUNJQUxMVSkgICAgICAv
KiBGbHVzaCBJLWNhY2hlICovCi0gICAgICAgIG1jciAgIENQMzIocjAsIEJQSUFMTCkgICAgICAg
LyogRmx1c2ggYnJhbmNoIHByZWRpY3RvciAqLwotICAgICAgICBkc2IgICAgICAgICAgICAgICAg
ICAgICAgICAgIC8qIEVuc3VyZSBjb21wbGV0aW9uIG9mIFRMQitCUCBmbHVzaCAqLwotICAgICAg
ICBpc2IKLQotMToKICAgICAgICAgbGRyICAgcjAsID1pbml0X2RhdGEKICAgICAgICAgYWRkICAg
cjAsICNJTklUSU5GT19zdGFjayAgICAvKiBGaW5kIHRoZSBib290LXRpbWUgc3RhY2sgKi8KICAg
ICAgICAgbGRyICAgc3AsIFtyMF0KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
