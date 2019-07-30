Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EA77B500
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 23:29:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsZdU-0001L7-P0; Tue, 30 Jul 2019 21:26:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsZdT-0001L2-NG
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 21:26:19 +0000
X-Inumbo-ID: ab2ab1ba-b310-11e9-996d-3771e54e2bf7
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab2ab1ba-b310-11e9-996d-3771e54e2bf7;
 Tue, 30 Jul 2019 21:26:18 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 028E520665;
 Tue, 30 Jul 2019 21:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564521978;
 bh=Y4Z1xd0BTzv2G1qkSsxQN+2HahWIuUmm/ZdS6DKZ7fM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=pAGCySohkB5JyJhlQm+D/CTY2vB/fDP3ZZB27yjKja73xlbuVrVGGI54JOBRPV1KL
 ewLTTOrv7bWTXrWHnL0nS8bIvtR8qvgATP+feX0yZcN7lu7l7gpxuRy0a7xuDEpXva
 m74cyWmqtHs5KPR/VlGy27URbfSQrEJrA82/3C+k=
Date: Tue, 30 Jul 2019 14:26:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-35-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301422150.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-35-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 34/35] xen/arm32: head: Setup HTTBR in
 enable_mmu() and add missing isb
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IEhUVEJSIGlzIHNldHVwIGluIGNyZWF0ZV9wYWdlX3RhYmxlcygpLiBUaGlzIGlzIGZpbmUgYXMK
PiBpdCBpcyBjYWxsZWQgYnkgZXZlcnkgQ1BVcy4KPiAKPiBIb3dldmVyLCBzdWNoIGFzc3VtcHRp
b24gbWF5IG5vdCBob2xkIGluIHRoZSBmdXR1cmUuIFRvIG1ha2UgY2hhbmdlCj4gZWFzaWVyLCB0
aGUgSFRUQlIgaXMgbm90IHNldHVwIGluIGVuYWJsZV9tbXUoKS4KPiAKPiBUYWtlIHRoZSBvcHBv
cnR1bml0eSB0byBhZGQgdGhlIG1pc3NpbmcgaXNiKCkgdG8gZW5zdXJlIHRoZSBIVFRCUiBpcwo+
IHNlZW4gYmVmb3JlIHRoZSBNTVUgaXMgdHVybmVkIG9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gLS0tCj4gICAgIENoYW5nZXMg
aW4gdjI6Cj4gICAgICAgICAtIFBhdGNoIGFkZGVkCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9hcm0z
Mi9oZWFkLlMgfCA4ICsrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFk
LlMgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCj4gaW5kZXggNmQ1NWEyMTE5YS4uOGExZTI3
MmFhYiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCj4gKysrIGIveGVu
L2FyY2gvYXJtL2FybTMyL2hlYWQuUwo+IEBAIC0zNzMsOCArMzczLDYgQEAgY3JlYXRlX3BhZ2Vf
dGFibGVzOgo+ICAgICAgICAgIC8qIFdyaXRlIFhlbidzIFBUJ3MgcGFkZHIgaW50byB0aGUgSFRU
QlIgKi8KClRoaXMgY29tbWVudCBuZWVkcyB0byBiZSBtb3ZlZAoKCj4gICAgICAgICAgbGRyICAg
cjQsID1ib290X3BndGFibGUKPiAgICAgICAgICBhZGQgICByNCwgcjQsIHIxMCAgICAgICAgICAg
IC8qIHI0IDo9IHBhZGRyIChib290X3BhZ2V0YWJsZSkgKi8KPiAtICAgICAgICBtb3YgICByNSwg
IzAgICAgICAgICAgICAgICAgIC8qIHI0OnI1IGlzIHBhZGRyIChib290X3BhZ2V0YWJsZSkgKi8K
PiAtICAgICAgICBtY3JyICBDUDY0KHI0LCByNSwgSFRUQlIpCgpJbnRlcmVzdGluZ2x5IHI1IGlz
IG5vdCBjbG9iYmVyZWQgYnkgY3JlYXRlX3BhZ2VfdGFibGVzIGFueW1vcmUsIHdlIG5lZWQKdG8g
dXBkYXRlIHRoZSBjb21tZW50IG9uIHRvcC4KCgo+ICAgICAgICAgIC8qIFNldHVwIGJvb3RfcGd0
YWJsZTogKi8KPiAgICAgICAgICBsZHIgICByMSwgPWJvb3Rfc2Vjb25kCj4gQEAgLTQ4MCw2ICs0
NzgsMTIgQEAgZW5hYmxlX21tdToKPiAgICAgICAgICBtY3IgICBDUDMyKHIwLCBUTEJJQUxMSCkg
ICAgIC8qIEZsdXNoIGh5cGVydmlzb3IgVExCcyAqLwo+ICAgICAgICAgIGRzYiAgIG5zaAo+ICAK
PiArICAgICAgICBsZHIgICByMCwgPWJvb3RfcGd0YWJsZQo+ICsgICAgICAgIGFkZCAgIHIwLCBy
MCwgcjEwICAgICAgICAgICAgLyogcjAgOj0gcGFkZHIgKGJvb3RfcGFnZXRhYmxlKSAqLwo+ICsg
ICAgICAgIG1vdiAgIHIxLCAjMCAgICAgICAgICAgICAgICAgLyogcjA6cjEgaXMgcGFkZHIgKGJv
b3RfcGFnZXRhYmxlKSAqLwo+ICsgICAgICAgIG1jcnIgIENQNjQocjAsIHIxLCBIVFRCUikKPiAr
ICAgICAgICBpc2IKPiArCj4gICAgICAgICAgbXJjICAgQ1AzMihyMCwgSFNDVExSKQo+ICAgICAg
ICAgIC8qIEVuYWJsZSBNTVUgYW5kIEQtY2FjaGUgKi8KPiAgICAgICAgICBvcnIgICByMCwgcjAs
ICMoU0NUTFJfQXh4X0VMeF9NfFNDVExSX0F4eF9FTHhfQykKPiAtLSAKPiAyLjExLjAKPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
