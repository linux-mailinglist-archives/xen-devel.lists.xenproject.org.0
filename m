Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF748476CC
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jun 2019 22:47:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcc1n-0007sZ-Gd; Sun, 16 Jun 2019 20:45:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5YfY=UP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hcc1m-0007sR-0H
 for xen-devel@lists.xenproject.org; Sun, 16 Jun 2019 20:45:26 +0000
X-Inumbo-ID: aa88e88b-9077-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id aa88e88b-9077-11e9-8980-bc764e045a96;
 Sun, 16 Jun 2019 20:45:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8CA5344;
 Sun, 16 Jun 2019 13:45:24 -0700 (PDT)
Received: from [10.37.12.2] (unknown [10.37.12.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92F703F738;
 Sun, 16 Jun 2019 13:45:23 -0700 (PDT)
To: xen-devel@lists.xenproject.org
References: <20190614175144.20046-1-julien.grall@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c1d63303-00ba-1aeb-a0af-15bc872f1cdd@arm.com>
Date: Sun, 16 Jun 2019 21:45:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614175144.20046-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART3 v3 0/9] xen/arm: Provide a generic
 function to update Xen PT
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
Cc: Oleksandr_Tyshchenko@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA2LzE0LzE5IDY6NTEgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiBKdWxpZW4gR3Jh
bGwgKDkpOgo+ICAgIHhlbi9hcm06IFJld29yayBIU0NUTFJfQkFTRQo+ICAgIHhlbi9hcm06IG1t
OiBJbnRyb2R1Y2UgX1BBR0VfUFJFU0VOVCBhbmQgX1BBR0VfUE9QVUxBVEUKPiAgICB4ZW4vYXJt
OiBtbTogU2FuaXR5IGNoZWNrIGFueSB1cGRhdGUgb2YgWGVuIHBhZ2UgdGFibGVzCj4gICAgeGVu
L2FybTogbW06IFJld29yayB4ZW5fcHRfdXBkYXRlX2VudHJ5IHRvIGF2b2lkIHVzZSB4ZW5tYXBf
b3BlcmF0aW9uCj4gICAgeGVuL2FybTogbW06IFJlbW92ZSBlbnVtIHhlbm1hcF9vcGVyYXRpb24K
PiAgICB4ZW4vYXJtOiBtbTogVXNlIHssIHVufW1hcF9kb21haW5fcGFnZSgpIHRvIG1hcC91bm1h
cCBYZW4gcGFnZS10YWJsZXMKPiAgICB4ZW4vYXJtOiBtbTogUmV3b3JrIFhlbiBwYWdlLXRhYmxl
cyB3YWxrIGR1cmluZyB1cGRhdGUKPiAgICB4ZW4vYXJtOiBtbTogRG9uJ3Qgb3Blbi1jb2RlIFhl
biBQVCB1cGRhdGUgaW4ge3NldCwgY2xlYXJ9X2ZpeG1hcCgpCj4gICAgeGVuL2FybTogbW06IFJl
bW92ZSBzZXRfcHRlX2ZsYWdzX29uX3JhbmdlKCkKClRoZXkgYXJlIGFsbCBjb21taXR0ZWQgbm93
LiBUaGFuayB5b3UgZm9yIHRoZSByZXZpZXchCgpJIGFtIHN0aWxsIHdvcmtpbmcgb24gdGhlIGZv
bGxvdy11cCBzZXJpZXMuIEkgYW0gaG9waW5nIHRvIHNlbmQgbW9yZSAKYmVmb3JlIFhEUy4KCkNo
ZWVycywKCj4gCj4gICB4ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TICAgICAgIHwgIDEyICstCj4g
ICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TICAgICAgIHwgIDEwICstCj4gICB4ZW4vYXJjaC9h
cm0vbW0uYyAgICAgICAgICAgICAgIHwgMzkwICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0KPiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vcGFnZS5oICAgICAgfCAgIDkgKy0K
PiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vcHJvY2Vzc29yLmggfCAgNTYgKysrKystCj4gICA1IGZp
bGVzIGNoYW5nZWQsIDMzMiBpbnNlcnRpb25zKCspLCAxNDUgZGVsZXRpb25zKC0pCj4gCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
