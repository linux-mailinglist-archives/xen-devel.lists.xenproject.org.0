Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7C3BDF16
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 15:37:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD7Qz-0002uN-D4; Wed, 25 Sep 2019 13:34:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD7Qx-0002uG-Gj
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 13:34:19 +0000
X-Inumbo-ID: 2c7834c2-df99-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 2c7834c2-df99-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 13:34:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C043FAC63;
 Wed, 25 Sep 2019 13:34:17 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
 <14624609-019f-2993-261c-d4f45ce78cbe@suse.com>
 <20190923142253.dqvbg2tsfke3mmtc@Air-de-Roger>
 <db9b21f5-108b-eee4-692b-199d25c02b10@suse.com>
 <0069008f-596f-13ba-0e4c-841e8957a24a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c6ee983-9ced-9e55-6218-5f3c5469f32c@suse.com>
Date: Wed, 25 Sep 2019 15:34:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0069008f-596f-13ba-0e4c-841e8957a24a@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 3/8] x86/PCI: read maximum MSI vector
 count early
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
 Wei Liu <wl@xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMjAxOSAxNTozMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMy8wOS8yMDE5
IDE1OjQxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjMuMDkuMjAxOSAxNjoyMiwgUm9nZXIg
UGF1IE1vbm7DqSAgd3JvdGU6Cj4+PiBPbiBUaHUsIFNlcCAxOSwgMjAxOSBhdCAwMzoyMjo1NFBN
ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBSYXRoZXIgdGhhbiBkb2luZyB0aGlzIGV2
ZXJ5IHRpbWUgd2Ugc2V0IHVwIGludGVycnVwdHMgZm9yIGEgZGV2aWNlCj4+Pj4gYW5ldyAoYW5k
IHRoZW4gaW4gc2V2ZXJhbCBwbGFjZXMpIGZpbGwgdGhpcyBpbnZhcmlhbnQgZmllbGQgcmlnaHQg
YWZ0ZXIKPj4+PiBhbGxvY2F0aW5nIHN0cnVjdCBwY2lfZGV2Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4gTEdUTToKPj4+Cj4+PiBS
ZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+IFRo
YW5rcy4KPj4KPj4+IEp1c3Qgb25lIG5pdCBiZWxvdy4KPj4+Cj4+Pj4gQEAgLTcxMSw3ICs3MTAs
NyBAQCBzdGF0aWMgaW50IG1zaV9jYXBhYmlsaXR5X2luaXQoc3RydWN0IHBjCj4+Pj4gIAo+Pj4+
ICAgICAgICAgIC8qIEFsbCBNU0lzIGFyZSB1bm1hc2tlZCBieSBkZWZhdWx0LCBNYXNrIHRoZW0g
YWxsICovCj4+Pj4gICAgICAgICAgbWFza2JpdHMgPSBwY2lfY29uZl9yZWFkMzIoZGV2LT5zYmRm
LCBtcG9zKTsKPj4+PiAtICAgICAgICBtYXNrYml0cyB8PSB+KHUzMikwID4+ICgzMiAtIG1heHZl
Yyk7Cj4+Pj4gKyAgICAgICAgbWFza2JpdHMgfD0gfih1MzIpMCA+PiAoMzIgLSBkZXYtPm1zaV9t
YXh2ZWMpOwo+Pj4gR0VOTUFTSyB3b3VsZCBiZSBzbGlnaHRseSBlYXNpZXIgdG8gcGFyc2UgSU1P
IChoZXJlIGFuZCBiZWxvdykuCj4+IEJlc2lkZXMgdGhpcyBiZWluZyBhbiB1bnJlbGF0ZWQgY2hh
bmdlLCBJJ20gYWZyYWlkIEknbSBnb2luZyB0bwo+PiBvYmplY3QgdG8gdXNlIG9mIGEgbWFjcm8g
d2hlcmUgaXQncyB1bmNsZWFyIHdoYXQgaXRzIHBhcmFtZXRlcnMKPj4gbWVhbjogRXZlbiB0aGUg
ZXhhbXBsZSBpbiB4ZW4vYml0b3BzLmggaXMgc28gY29uZnVzaW5nIHRoYXQgSQo+PiBjYW4ndCB0
ZWxsIHdoZXRoZXIgImgiIGlzIG1lYW50IHRvIGJlIGV4Y2x1c2l2ZSBvciBpbmNsdXNpdmUKPj4g
KGxvb2tzIGxpa2UgdGhlIGxhdHRlciBpcyBpbnRlbmRlZCkuIFRvIG1lIHRoZSB0d28gcGFyYW1l
dGVycwo+PiBhbHNvIGxvb2sgcmV2ZXJzZWQgLSBJJ2QgZXhwZWN0ICJsb3ciIGZpcnN0IGFuZCAi
aGlnaCIgc2Vjb25kLgo+PiAoSVNUUiBoYXZpbmcgdm9pY2VkIHJlc2VydmF0aW9ucyBhZ2FpbnN0
IGl0cyBpbnRyb2R1Y3Rpb24sIGFuZAo+PiBJJ20gaGFwcHkgdG8gc2VlIHRoYXQgaXQncyB1c2Vk
IGluIEFybSBjb2RlIG9ubHkuKQo+IAo+IEZ1cnRoZXJtb3JlLCBMaW51eCBpcyBoYXZpbmcgZW5v
dWdoIHByb2JsZW1zIHdpdGggaXQgdGhhdCB0aGV5IHdlcmUKPiBjb25zaWRlcmluZyBhYm9saXNo
aW5nIGl0IGVudGlyZWx5Lgo+IAo+IEdldHRpbmcgdGhlIHR3byBudW1iZXJzIHRoZSB3cm9uZyB3
YXkgYXJvdW5kIGdldHMgeW91IGEgbWFzayBvZiAwLsKgIEl0Cj4gaXMgYSB2ZXJ5IHVuc2FmZSBt
YWNyby4KCldoZXJlLCBoYXZpbmcgbG9va2VkIGF0IGl0IHNvbWUgd2hlbiByZXBseWluZyB0byBS
b2dlciwgaXQgc2VlbWVkCnRvIG1lIHRoYXQgaXQgd291bGQgaGF2ZSBiZWVuIHF1aXRlIHNpbXBs
ZSB0byBtYWtlIHRoZSBtYWNybwp0b2xlcmF0ZSBlaXRoZXIgb3JkZXIuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
