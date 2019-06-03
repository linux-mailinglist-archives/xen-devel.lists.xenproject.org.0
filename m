Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0D533BDD
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 01:22:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXwFK-00036q-Jz; Mon, 03 Jun 2019 23:20:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hXwFJ-00031n-Fv
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 23:20:05 +0000
X-Inumbo-ID: 1e17d320-8656-11e9-9edd-e333ca3eef4b
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e17d320-8656-11e9-9edd-e333ca3eef4b;
 Mon, 03 Jun 2019 23:20:04 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95CDF26588;
 Mon,  3 Jun 2019 23:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559604003;
 bh=8AuqVVzjIeqeGCc3ZRYAc0Qtba658oRPBz/0WQ2F++E=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=VHyrSQlPh0fcbqDSKS3n1SUT6y+lfacx6W2825ohZ9dCR3atb3Kfm78TskZm3aXws
 j/TUE1TI7dpGfbuaQ4+ro0xeAk3IU7q141nlOiMOGb2Mp9aek7K1c/09fnGfZTj+6f
 k9MKUYAAojlf/ZUGQwyNMqDy/iK1FEFZttQYhYIo=
Date: Mon, 3 Jun 2019 16:20:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514122456.28559-14-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906031619500.14041@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-14-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 13/19] xen/arm32: mm:
 Avoid to zero and clean cache for CPU0 domheap
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBwYWdlLXRhYmxl
IHdhbGtlciBpcyBjb25maWd1cmVkIHRvIHVzZSB0aGUgc2FtZSBzaGFyZWFiaWxpdHkgYW5kCj4g
Y2FjaGVhYmlsaXR5IGFzIHRoZSBhY2Nlc3MgcGVyZm9ybWVkIHdoZW4gdXBkYXRpbmcgdGhlIHBh
Z2UtdGFibGVzLiBUaGlzCj4gbWVhbnMgY2xlYW5pbmcgdGhlIGNhY2hlIGZvciBDUFUwIGRvbWhl
YXAgaXMgdW5uZWNlc3NhcnkuCj4gCj4gRnVydGhlcm1vcmUsIENQVTAgcGFnZS10YWJsZXMgYXJl
IHBhcnQgb2YgWGVuIGJpbmFyeSBhbmQgd2lsbCBhbHJlYWR5IGJlCj4gemVyb2VkIGJlZm9yZSBi
ZWVuIHVzZWQuIFNvIGl0IGlzIHBvaW50bGVzcyB0byB6ZXJvIHRoZSBkb21oZWFwIGFnYWluLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4g
UmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgpSZXZp
ZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4g
LS0tCj4gICAgIENoYW5nZXMgaW4gdjI6Cj4gICAgICAgICAtIFR3ZWFrIGEgYml0IHRoZSBjb21t
aXQgbWVzc2FnZQo+ICAgICAgICAgLSBBZGQgQW5kcmlpJ3MgcmV2aWV3ZWQtYnkKPiAtLS0KPiAg
eGVuL2FyY2gvYXJtL21tLmMgfCA1IC0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9t
bS5jCj4gaW5kZXggZTA5MGFmYjk3Ni4uY2RhMjg0N2QwMCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJj
aC9hcm0vbW0uYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9tbS5jCj4gQEAgLTcyNCwxMSArNzI0LDYg
QEAgdm9pZCBfX2luaXQgc2V0dXBfcGFnZXRhYmxlcyh1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19v
ZmZzZXQpCj4gICNpZmRlZiBDT05GSUdfQVJNXzMyCj4gICAgICBwZXJfY3B1KHhlbl9wZ3RhYmxl
LCAwKSA9IGNwdTBfcGd0YWJsZTsKPiAgICAgIHBlcl9jcHUoeGVuX2RvbW1hcCwgMCkgPSBjcHUw
X2RvbW1hcDsKPiAtCj4gLSAgICAvKiBNYWtlIHN1cmUgaXQgaXMgY2xlYXIgKi8KPiAtICAgIG1l
bXNldCh0aGlzX2NwdSh4ZW5fZG9tbWFwKSwgMCwgRE9NSEVBUF9TRUNPTkRfUEFHRVMqUEFHRV9T
SVpFKTsKPiAtICAgIGNsZWFuX2RjYWNoZV92YV9yYW5nZSh0aGlzX2NwdSh4ZW5fZG9tbWFwKSwK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRE9NSEVBUF9TRUNPTkRfUEFHRVMqUEFH
RV9TSVpFKTsKPiAgI2VuZGlmCj4gIH0KPiAgCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
