Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A535755D30
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 03:04:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfwJ2-0004ms-AJ; Wed, 26 Jun 2019 01:01:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfwJ0-0004Ip-Kr
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 01:00:58 +0000
X-Inumbo-ID: db102bcc-97ad-11e9-a0c7-eb9b2540b3db
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db102bcc-97ad-11e9-a0c7-eb9b2540b3db;
 Wed, 26 Jun 2019 01:00:57 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 537D62085A;
 Wed, 26 Jun 2019 01:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561510857;
 bh=VnOo/v8hr+aTlJJDZsEsfDZEVBW1cSwIBWyXJXsGM1Q=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=RXgaxv49QtkiPNax/uMZZ8RgauZuA5EZN8Ug0aaVfXuw1smuS578l+a+5Ifcv8CVj
 8JKTlC6LokWa9ySguFDL+RAz6tJYyALWW97SkdCP0R9G2V/RMAIZM3DjP+1TFFacMu
 uvuSqXP5aYulQS2zz7aJ3cydJQ+2vu07GdSgFAnI=
Date: Tue, 25 Jun 2019 18:00:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190610193215.23704-8-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906251738060.5851@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-8-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 07/17] xen/arm64: head: Rework and document
 check_cpu_mode()
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 andre.przywara@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEEgYnJhbmNoIGluIHRo
ZSBzdWNjZXNzIGNhc2UgY2FuIGJlIGF2b2lkZWQgYnkgaW52ZXJ0aW5nIHRoZSBicmFuY2gKPiBj
b25kaXRpb24uIEF0IHRoZSBzYW1lIHRpbWUsIHJlbW92ZSBhIHBvaW50bGVzcyBjb21tZW50IGFz
IFhlbiBjYW4gb25seQo+IHJ1biBhdCBFTDIuCj4gCj4gTGFzdGx5LCBkb2N1bWVudCB0aGUgYmVo
YXZpb3IgYW5kIHRoZSBtYWluIHJlZ2lzdGVycyB1c2FnZSB3aXRoaW4gdGhlCj4gZnVuY3Rpb24u
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
ClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
Cgo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwgMTUgKysrKysrKysrKy0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2Fy
bTY0L2hlYWQuUwo+IGluZGV4IGNjZDhhMWIwYTguLjg3ZmNkM2JlNmMgMTAwNjQ0Cj4gLS0tIGEv
eGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFk
LlMKPiBAQCAtMzUwLDYgKzM1MCwxMyBAQCBzZWNvbmRhcnlfc3dpdGNoZWQ6Cj4gICAgICAgICAg
YiAgICAgbGF1bmNoCj4gIEVORFBST0MoaW5pdF9zZWNvbmRhcnkpCj4gIAo+ICsvKgo+ICsgKiBD
aGVjayBpZiB0aGUgQ1BVIGhhcyBiZWVuIGJvb3RlZCBpbiBIeXBlcnZpc29yIG1vZGUuCj4gKyAq
IFRoaXMgZnVuY3Rpb24gd2lsbCBuZXZlciByZXR1cm4gd2hlbiB0aGUgQ1BVIGlzIGJvb3RlZCBp
biBhbm90aGVyIG1vZGUKPiArICogdGhhbiBIeXBlcnZpc29yIG1vZGUuCj4gKyAqCj4gKyAqIENs
b2JiZXJzIHgwIC0geDUKPiArICovCj4gIGNoZWNrX2NwdV9tb2RlOgo+ICAgICAgICAgIFBSSU5U
KCItIEN1cnJlbnQgRUwgIikKPiAgICAgICAgICBtcnMgICB4NSwgQ3VycmVudEVMCj4gQEAgLTM1
OSwxNSArMzY2LDEzIEBAIGNoZWNrX2NwdV9tb2RlOgo+ICAgICAgICAgIC8qIEFyZSB3ZSBpbiBF
TDIgKi8KPiAgICAgICAgICBjbXAgICB4NSwgI1BTUl9NT0RFX0VMMnQKPiAgICAgICAgICBjY21w
ICB4NSwgI1BTUl9NT0RFX0VMMmgsICMweDQsIG5lCj4gLSAgICAgICAgYi5lcSAgZWwyIC8qIFll
cyAqLwo+IC0KPiArICAgICAgICBiLm5lICAxZiAvKiBObyAqLwo+ICsgICAgICAgIHJldAo+ICsx
Ogo+ICAgICAgICAgIC8qIE9LLCB3ZSdyZSBib25lZC4gKi8KPiAgICAgICAgICBQUklOVCgiLSBY
ZW4gbXVzdCBiZSBlbnRlcmVkIGluIE5TIEVMMiBtb2RlIC1cclxuIikKPiAgICAgICAgICBQUklO
VCgiLSBQbGVhc2UgdXBkYXRlIHRoZSBib290bG9hZGVyIC1cclxuIikKPiAgICAgICAgICBiIGZh
aWwKPiAtCj4gLWVsMjogICAgUFJJTlQoIi0gWGVuIHN0YXJ0aW5nIGF0IEVMMiAtXHJcbiIpCj4g
LSAgICAgICAgcmV0Cj4gIEVORFBST0MoY2hlY2tfY3B1X21vZGUpCj4gIAo+ICB6ZXJvX2JzczoK
PiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
