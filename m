Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 421F41C880
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:24:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWRi-00009R-LY; Tue, 14 May 2019 12:22:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWRf-00005W-Rd
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:22:11 +0000
X-Inumbo-ID: e591c939-7642-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e591c939-7642-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:22:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 338F2341;
 Tue, 14 May 2019 05:22:10 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 009753F71E;
 Tue, 14 May 2019 05:22:08 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:21:27 +0100
Message-Id: <20190514122136.28215-19-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514122136.28215-1-julien.grall@arm.com>
References: <20190514122136.28215-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART2 v2 10/19] xen/arm32: head: Correctly
 report the HW CPU ID
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgYXJlIG5vIHJlYXNvbiB0byBjb25zaWRlciB0aGUgSFcgQ1BVIElEIHdpbGwgYmUgMCB3
aGVuIHRoZQpwcm9jZXNzb3IgaXMgcGFydCBvZiBhIHVuaXByb2Nlc3NvciBzeXN0ZW0uIEF0IGJl
c3QsIHRoaXMgd2lsbCByZXN1bHQgdG8KY29uZmxpY3Rpbmcgb3V0cHV0IGFzIHRoZSByZXN0IG9m
IFhlbiB1c2UgdGhlIHZhbHVlIGRpcmVjdGx5IHJlYWQgZnJvbQpNUElEUi4KClNvIHJlbW92ZSB0
aGUgemVyb2luZyBhbmQgbG9naWMgdG8gY2hlY2sgaWYgdGhlIENQVSBpcyBwYXJ0IG9mIGEKdW5p
cHJvY2Vzc29yIHN5c3RlbS4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+ClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVw
YW0uY29tPgoKLS0tCiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAgIC0gQWRkIEFuZHJpaSdzIHJl
dmlld2VkLWJ5Ci0tLQogeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyB8IDggLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9h
cm0zMi9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCmluZGV4IDlmNDBmYWNlOTgu
LmQ0MmExMzU1NmMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKKysrIGIv
eGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwpAQCAtMTI0LDE2ICsxMjQsOCBAQCBHTE9CQUwoaW5p
dF9zZWNvbmRhcnkpCiAgICAgICAgIG1vdiAgIHIxMiwgIzEgICAgICAgICAgICAgICAgLyogcjEy
IDo9IGlzX3NlY29uZGFyeV9jcHUgKi8KIAogY29tbW9uX3N0YXJ0OgotICAgICAgICBtb3YgICBy
NywgIzAgICAgICAgICAgICAgICAgIC8qIHI3IDo9IENQVSBJRC4gSW5pdGlhbHkgemVybyB1bnRp
bCB3ZQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIGZpbmQgdGhhdCBt
dWx0aXByb2Nlc3NvciBleHRlbnNpb25zIGFyZQotICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAqIHByZXNlbnQgYW5kIHRoZSBzeXN0ZW0gaXMgU01QICovCiAgICAgICAgIG1y
YyAgIENQMzIocjEsIE1QSURSKQotICAgICAgICB0c3QgICByMSwgI01QSURSX1NNUCAgICAgICAg
IC8qIE11bHRpcHJvY2Vzc29yIGV4dGVuc2lvbiBzdXBwb3J0ZWQ/ICovCi0gICAgICAgIGJlcSAg
IDFmCi0gICAgICAgIHRzdCAgIHIxLCAjTVBJRFJfVVAgICAgICAgICAgLyogVW5pcHJvY2Vzc29y
IHN5c3RlbT8gKi8KLSAgICAgICAgYm5lICAgMWYKICAgICAgICAgYmljICAgcjcsIHIxLCAjKH5N
UElEUl9IV0lEX01BU0spIC8qIE1hc2sgb3V0IGZsYWdzIHRvIGdldCBDUFUgSUQgKi8KLTE6CiAK
ICAgICAgICAgLyogTm9uLWJvb3QgQ1BVcyB3YWl0IGhlcmUgdW50aWwgX19jcHVfdXAgaXMgcmVh
ZHkgZm9yIHRoZW0gKi8KICAgICAgICAgdGVxICAgcjEyLCAjMAotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
