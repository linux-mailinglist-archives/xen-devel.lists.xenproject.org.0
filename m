Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1AF526A0
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 10:29:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfglm-0005SU-RY; Tue, 25 Jun 2019 08:25:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SbZn=UY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hfglk-0005SP-RF
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 08:25:36 +0000
X-Inumbo-ID: cd87c294-9722-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cd87c294-9722-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 08:25:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E6254AEEE;
 Tue, 25 Jun 2019 08:25:33 +0000 (UTC)
To: xen-devel@lists.xenproject.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20190620160821.4210-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <79797c17-58d6-b09c-3aad-73e375a7f208@suse.com>
Date: Tue, 25 Jun 2019 10:25:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190620160821.4210-1-jgross@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH] mm: fix regression with deferred struct
 page init
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
Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2VudGxlIHBpbmcuCgpJJ2QgcmVhbGx5IGxpa2UgdG8gaGF2ZSB0aGF0IGluIDUuMiBpbiBvcmRl
ciB0byBhdm9pZCB0aGUgcmVncmVzc2lvbgppbnRyb2R1Y2VkIHdpdGggNS4yLXJjMS4KCgpKdWVy
Z2VuCgpPbiAyMC4wNi4xOSAxODowOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBDb21taXQgMGU1
NmFjYWU0YjRkZDRhOSAoIm1tOiBpbml0aWFsaXplIE1BWF9PUkRFUl9OUl9QQUdFUyBhdCBhIHRp
bWUKPiBpbnN0ZWFkIG9mIGRvaW5nIGxhcmdlciBzZWN0aW9ucyIpIGlzIGNhdXNpbmcgYSByZWdy
ZXNzaW9uIG9uIHNvbWUKPiBzeXN0ZW1zIHdoZW4gdGhlIGtlcm5lbCBpcyBib290ZWQgYXMgWGVu
IGRvbTAuCj4gCj4gVGhlIHN5c3RlbSB3aWxsIGp1c3QgaGFuZyBpbiBlYXJseSBib290Lgo+IAo+
IFJlYXNvbiBpcyBhbiBlbmRsZXNzIGxvb3AgaW4gZ2V0X3BhZ2VfZnJvbV9mcmVlbGlzdCgpIGlu
IGNhc2UgdGhlIGZpcnN0Cj4gem9uZSBsb29rZWQgYXQgaGFzIG5vIGZyZWUgbWVtb3J5LiBkZWZl
cnJlZF9ncm93X3pvbmUoKSBpcyBhbHdheXMKPiByZXR1cm5pbmcgdHJ1ZSBkdWUgdG8gdGhlIGZv
bGxvd2luZyBjb2RlIHNuaXBwbGV0Ogo+IAo+ICAgIC8qIElmIHRoZSB6b25lIGlzIGVtcHR5IHNv
bWVib2R5IGVsc2UgbWF5IGhhdmUgY2xlYXJlZCBvdXQgdGhlIHpvbmUgKi8KPiAgICBpZiAoIWRl
ZmVycmVkX2luaXRfbWVtX3Bmbl9yYW5nZV9pbl96b25lKCZpLCB6b25lLCAmc3BmbiwgJmVwZm4s
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmaXJzdF9kZWZl
cnJlZF9wZm4pKSB7Cj4gICAgICAgICAgICBwZ2RhdC0+Zmlyc3RfZGVmZXJyZWRfcGZuID0gVUxP
TkdfTUFYOwo+ICAgICAgICAgICAgcGdkYXRfcmVzaXplX3VubG9jayhwZ2RhdCwgJmZsYWdzKTsK
PiAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ICAgIH0KPiAKPiBUaGlzIGluIHR1cm4gcmVzdWx0
cyBpbiB0aGUgbG9vcCBhcyBnZXRfcGFnZV9mcm9tX2ZyZWVsaXN0KCkgaXMKPiBhc3N1bWluZyBm
b3J3YXJkIHByb2dyZXNzIGNhbiBiZSBtYWRlIGJ5IGRvaW5nIHNvbWUgbW9yZSBzdHJ1Y3QgcGFn
ZQo+IGluaXRpYWxpemF0aW9uLgo+IAo+IENjOiBBbGV4YW5kZXIgRHV5Y2sgPGFsZXhhbmRlci5o
LmR1eWNrQGxpbnV4LmludGVsLmNvbT4KPiBGaXhlczogMGU1NmFjYWU0YjRkZDRhOSAoIm1tOiBp
bml0aWFsaXplIE1BWF9PUkRFUl9OUl9QQUdFUyBhdCBhIHRpbWUgaW5zdGVhZCBvZiBkb2luZyBs
YXJnZXIgc2VjdGlvbnMiKQo+IFN1Z2dlc3RlZC1ieTogQWxleGFuZGVyIER1eWNrIDxhbGV4YW5k
ZXIuaC5kdXlja0BsaW51eC5pbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgo+IC0tLQo+ICAgbW0vcGFnZV9hbGxvYy5jIHwgMyArKy0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvbW0vcGFnZV9hbGxvYy5jIGIvbW0vcGFnZV9hbGxvYy5jCj4gaW5kZXggZDY2YmM4
YWJlMGFmLi44ZTNiYzk0OWViY2MgMTAwNjQ0Cj4gLS0tIGEvbW0vcGFnZV9hbGxvYy5jCj4gKysr
IGIvbW0vcGFnZV9hbGxvYy5jCj4gQEAgLTE4MjYsNyArMTgyNiw4IEBAIGRlZmVycmVkX2dyb3df
em9uZShzdHJ1Y3Qgem9uZSAqem9uZSwgdW5zaWduZWQgaW50IG9yZGVyKQo+ICAgCQkJCQkJIGZp
cnN0X2RlZmVycmVkX3BmbikpIHsKPiAgIAkJcGdkYXQtPmZpcnN0X2RlZmVycmVkX3BmbiA9IFVM
T05HX01BWDsKPiAgIAkJcGdkYXRfcmVzaXplX3VubG9jayhwZ2RhdCwgJmZsYWdzKTsKPiAtCQly
ZXR1cm4gdHJ1ZTsKPiArCQkvKiBSZXRyeSBvbmx5IG9uY2UuICovCj4gKwkJcmV0dXJuIGZpcnN0
X2RlZmVycmVkX3BmbiAhPSBVTE9OR19NQVg7Cj4gICAJfQo+ICAgCj4gICAJLyoKPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
