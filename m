Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9511433B91
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 00:48:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXvhi-0007gq-By; Mon, 03 Jun 2019 22:45:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hXvhg-0007gl-Ka
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 22:45:20 +0000
X-Inumbo-ID: 42e06cda-8651-11e9-9a99-abb16ed396d2
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42e06cda-8651-11e9-9a99-abb16ed396d2;
 Mon, 03 Jun 2019 22:45:19 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D0C0B26AB7;
 Mon,  3 Jun 2019 22:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559601918;
 bh=Ehy25PR494npr5v0XZVFTMfJB7osmj6ggmgHXCnclpQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=XmFd0H0rnWE0PeBvly8JLxtxxC2jrSlNdKcHMhhUidDGU/7nAaiEUSZ6rfDNch9C1
 zcA26aCNb4fb+BtvT6Nk9ehBf8Ou+5KNOnL+GSACHgmMyKbIgF3wRNvL8XmD5/zD0C
 BNaN0RwnUf9+DL1ZNv7ZHCXBSdSozCu6E7rgEiis=
Date: Mon, 3 Jun 2019 15:45:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514122456.28559-11-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906031545090.14041@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-11-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 10/19] xen/arm32: head:
 Correctly report the HW CPU ID
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

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZXJlIGFyZSBubyBy
ZWFzb24gdG8gY29uc2lkZXIgdGhlIEhXIENQVSBJRCB3aWxsIGJlIDAgd2hlbiB0aGUKPiBwcm9j
ZXNzb3IgaXMgcGFydCBvZiBhIHVuaXByb2Nlc3NvciBzeXN0ZW0uIEF0IGJlc3QsIHRoaXMgd2ls
bCByZXN1bHQgdG8KPiBjb25mbGljdGluZyBvdXRwdXQgYXMgdGhlIHJlc3Qgb2YgWGVuIHVzZSB0
aGUgdmFsdWUgZGlyZWN0bHkgcmVhZCBmcm9tCj4gTVBJRFIuCj4gCj4gU28gcmVtb3ZlIHRoZSB6
ZXJvaW5nIGFuZCBsb2dpYyB0byBjaGVjayBpZiB0aGUgQ1BVIGlzIHBhcnQgb2YgYQo+IHVuaXBy
b2Nlc3NvciBzeXN0ZW0uCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNv
dkBlcGFtLmNvbT4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAgICAgQ2hhbmdlcyBpbiB2MjoKPiAgICAgICAgIC0gQWRk
IEFuZHJpaSdzIHJldmlld2VkLWJ5Cj4gLS0tCj4gIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMg
fCA4IC0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTMyL2hl
YWQuUwo+IGluZGV4IDlmNDBmYWNlOTguLmQ0MmExMzU1NmMgMTAwNjQ0Cj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2FybTMyL2hlYWQuUwo+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiBA
QCAtMTI0LDE2ICsxMjQsOCBAQCBHTE9CQUwoaW5pdF9zZWNvbmRhcnkpCj4gICAgICAgICAgbW92
ICAgcjEyLCAjMSAgICAgICAgICAgICAgICAvKiByMTIgOj0gaXNfc2Vjb25kYXJ5X2NwdSAqLwo+
ICAKPiAgY29tbW9uX3N0YXJ0Ogo+IC0gICAgICAgIG1vdiAgIHI3LCAjMCAgICAgICAgICAgICAg
ICAgLyogcjcgOj0gQ1BVIElELiBJbml0aWFseSB6ZXJvIHVudGlsIHdlCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBmaW5kIHRoYXQgbXVsdGlwcm9jZXNzb3IgZXh0
ZW5zaW9ucyBhcmUKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIHBy
ZXNlbnQgYW5kIHRoZSBzeXN0ZW0gaXMgU01QICovCj4gICAgICAgICAgbXJjICAgQ1AzMihyMSwg
TVBJRFIpCj4gLSAgICAgICAgdHN0ICAgcjEsICNNUElEUl9TTVAgICAgICAgICAvKiBNdWx0aXBy
b2Nlc3NvciBleHRlbnNpb24gc3VwcG9ydGVkPyAqLwo+IC0gICAgICAgIGJlcSAgIDFmCj4gLSAg
ICAgICAgdHN0ICAgcjEsICNNUElEUl9VUCAgICAgICAgICAvKiBVbmlwcm9jZXNzb3Igc3lzdGVt
PyAqLwo+IC0gICAgICAgIGJuZSAgIDFmCj4gICAgICAgICAgYmljICAgcjcsIHIxLCAjKH5NUElE
Ul9IV0lEX01BU0spIC8qIE1hc2sgb3V0IGZsYWdzIHRvIGdldCBDUFUgSUQgKi8KPiAtMToKPiAg
Cj4gICAgICAgICAgLyogTm9uLWJvb3QgQ1BVcyB3YWl0IGhlcmUgdW50aWwgX19jcHVfdXAgaXMg
cmVhZHkgZm9yIHRoZW0gKi8KPiAgICAgICAgICB0ZXEgICByMTIsICMwCj4gLS0gCj4gMi4xMS4w
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
