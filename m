Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AF97B482
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 22:49:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsZ1D-0006bn-GK; Tue, 30 Jul 2019 20:46:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WuyF=V3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsZ1C-0006bi-1l
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 20:46:46 +0000
X-Inumbo-ID: 22338ce2-b30b-11e9-853e-438abfaa0b2e
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 22338ce2-b30b-11e9-853e-438abfaa0b2e;
 Tue, 30 Jul 2019 20:46:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9C9D28;
 Tue, 30 Jul 2019 13:46:40 -0700 (PDT)
Received: from [10.37.8.36] (unknown [10.37.8.36])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D00263F575;
 Tue, 30 Jul 2019 13:46:39 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-2-git-send-email-andrii.anisov@gmail.com>
 <cfdf9c30-f3e1-4023-e044-959871d2f654@arm.com>
 <b7b24214-f7d0-41d0-b2c7-286d45f6da1a@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e1ee3ca4-edff-1a62-1f0a-0b832b4d5924@arm.com>
Date: Tue, 30 Jul 2019 21:46:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b7b24214-f7d0-41d0-b2c7-286d45f6da1a@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 01/16] xen/arm: Re-enable interrupt later in
 the trap path
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Andrii Anisov <andrii_anisov@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KCsgQW5kcmUpCgpPbiA3LzMwLzE5IDY6MzQgUE0sIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4gSGVs
bG8gSnVsaWVuLAo+IAo+IEl0IGxvb2tzIEkgbWlzc2VkIGFuc3dlcmluZyB0aGlzIGVtYWlsLiBT
byBkbyB0aGlzIG5vdzoKPiAKPiBPbiAyOS4xMS4xOCAwMDowMCwgSnVsaWVuIEdyYWxsIHdyb3Rl
Ogo+PiBPbiAyOC8xMS8yMDE4IDIxOjMxLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+Pj4gRnJvbTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4+Cj4+PiBUaGlzIG1ha2VzIGZ1
bmN0aW9uIGVudGVyX2h5cGVydmlzb3JfaGVhZCgpIGJlaW5nIGV4ZWN1dGVkIHdpdGgKPj4+IGly
cXMgbG9ja2VkLiBUaGlzIGFsc28gZ2l2ZSBhIGZpbmUgc2lkZSBlZmZlY3QgLSBpdCBhc3N1cmVz
IHRoYXQKPj4+IExScyBhcmUgY2xlYXJlZCBwcmlvciB0byBhbnkgSVJRcyBwcm9jZXNzaW5nLCB3
aGljaCBsZWFkcyB0byBhCj4+PiBiZXR0ZXIgKGZhc3RlcikgSVJRcyBwcm9jZXNzaW5nLgo+Pgo+
PiBBZ2FpbiwgdGhpcyBuZWVkIHNvbWUgcmF0aW9uYWxlIHdoeSBpcyBpdCBmYXN0ZXIuIEFuZCBo
b3cgdGhpcyBpcyBnb2luZwo+PiB0byBpbXBhY3QgdGhlIG90aGVyIHZHSUMuLi4KPiAKPiBXaXRo
IHRoZSBjdXJyZW50IGNvZGUsIHRoZXJlIGlzIGEgY2hhbmNlIHRoYXQgaHlwZXJ2aXNvciBwZXJm
b3JtcyAKPiBkb19JUlEoKSBiZWZvcmUgZmV0Y2hpbmcgTFJzIHdpdGggdGhlIGluZm9ybWF0aW9u
IGFib3V0IElSUXMgYmVpbmcgCj4gcHJvY2Vzc2VkIGJ5IGEgZ3Vlc3QuIFRoaXMgY291bGQgaGFw
cGVuIGluIGd1ZXN0IHRyYXAgcGF0aHMgd2hlcmUgCj4gaW50ZXJydXB0cyBhcmUgZW5hYmxlZCBi
ZWZvcmUgYGVudGVyX2h5cGVydmlzb3JfaGVhZCgpYCBjYWxsLgo+IAo+IFBlcmZvcm1pbmcgYGRv
X0lSUSgpYCBwcmlvciB0byBgdmdpY19zeW5jX2Zyb21fbHJzKClgIGlzIGFzc3VtZWQgYXMgbGVz
cyAKPiBlZmZpY2llbnQgdGhhbiBkb2luZyBpdCB2aWNlIHZlcnNhIGZvciBoaWdoIElSUSByYXRl
IHVzZS1jYXNlcyB3aXRoIHRoZSAKPiBudW1iZXIgb2YgZGlmZmVyZW50IGludGVycnVwdHMgKHNw
ZWNpZmljIGZvciBtdWx0aW1lZGlhIHNjZW5hcmlvcykuCgpXaGF0IHlvdSBzdWdnZXN0IGhlcmUg
aXMgcmVhbGx5IHNwZWNpZmljIHRvIHlvdXIgdXNlIGNhc2UuIEhvd2V2ZXIsIAp0aGluayBhYm91
dCB0aGUgUmVhbC1UaW1lIGNhc2Ugd2hlcmUgeW91IG1heSB3YW50IHRvIHJlY2VpdmUgeW91ciAK
aW50ZXJydXB0IGFzIHNvb24gYXMgcG9zc2libGUuCgpJbiBnZW5lcmFsLCBrZWVwaW5nIHRoZSBp
bnRlcnJ1cHQgZGlzYWJsZWQgZm9yIGEgbG9uZyB0aW1lIGlzIGEgcHJldHR5IApiYWQgaWRlYSBi
ZWNhdXNlIHlvdSBpbmNyZWFzZSBsYXRlbmN5LiBJbnRlcnJ1cHRzIHNob3VsZCBvbmx5IGJlIApk
aXNhYmxlZCB3aGVuIGl0IGlzIHN0cmljdGx5IG5lY2Vzc2FyeS4KCkF0IHRoZSBtb21lbnQgSSBk
b24ndCB2aWV3IHRoaXMgY2hhbmdlIGFzIG5lY2Vzc2FyeS4gQnV0IEkgYW0gaGFwcHkgdG8gCmJl
IHByb3ZlbiBvdGhlcndpc2UuCgo+ICDCoC0gRm9yIHRoZSBvbGQgdmdpYyBpbXBsZW1lbnRhdGlv
biwgYHZnaWNfc3luY19mcm9tX2xycygpYCByZWxlYXNlIExScyAKPiBmcm9tIHByb2Nlc3NlZCBp
bnRlcnJ1cHRzIGFsc28gc2hvcnRlbnMgYGluZmxpZ2h0X2lycXNgIHNvcnRlZCBsaXN0LiBTbyAK
PiBgZG9fSVJRKClgIGhhcyBiZXR0ZXIgY2hhbmNlcyB0byB3cml0ZSBJUlEgZGlyZWN0bHkgdG8g
TFIgaW5zdGVhZCBvZiAKPiBzYXZpbmcgaXQgaW50byBgbHJfcGVuZGluZ2AgbGlzdCBhbmQgcG9z
c2libHkgZmFzdGVyIGluc2VydCB0aGUgbmV3IElSUSAKPiBpbnRvIGBpbmZsaWdodF9pcnFzYCBs
aXN0LgpTYXZpbmcgdG8gbHJfcGVuZGluZyBtZWFucyB0aGF0IHlvdSBoYXZlIGFsbCB0aGUgTFJz
IGZ1bGwuCgpJIHZhZ3VlbHkgcmVjYWxsIHdlIHNwb2tlIGFib3V0IGl0IGJlZm9yZSBidXQgSSBj
YW4ndCBmaW5kIGFueXRoaW5nIGluIApteSBpbmJveC4gU28gY2FuIHlvdSBleHBsYWluIGFnYWlu
IHlvdXIgdXNlLWNhc2UsIHRoZSBudW1iZXIgb2YgTFJzLi4uPwoKTm90ZSB0aGlzIGlzIHdlcmUg
d3JpdGluZyBkb3duIGV2ZXJ5dGhpbmcgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIChvciAKYWZ0ZXIg
LS0tKSBoZWxwcyBwZW9wbGUgdG8gdW5kZXJzdGFuZCB3aGVyZSB5b3UgYXJlIGNvbWluZyBmcm9t
LgoKQ2hlZXJzLAoKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
