Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 811BD155872
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 14:29:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j03ey-0004Y6-MC; Fri, 07 Feb 2020 13:27:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KURy=33=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j03ex-0004Xw-GL
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 13:27:03 +0000
X-Inumbo-ID: 85db3fcd-49ad-11ea-b16f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85db3fcd-49ad-11ea-b16f-12813bfff9fa;
 Fri, 07 Feb 2020 13:27:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E0C03AAC6;
 Fri,  7 Feb 2020 13:27:01 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <6ef37772-81da-dfd0-01e7-c83998b2c2c4@suse.com>
 <68fb9767-3104-3f0b-d052-20df7603e1e9@suse.com>
 <20200207122021.GD4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <be40b0b2-10ec-60ef-bd14-1041045d5a02@suse.com>
Date: Fri, 7 Feb 2020 14:27:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200207122021.GD4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] VT-d: check all of an RMRR for being
 E820-reserved
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
 Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDIuMjAyMCAxMzoyMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIEZl
YiAwNiwgMjAyMCBhdCAwMjozMTowM1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQ2hl
Y2tpbmcganVzdCB0aGUgZmlyc3QgYW5kIGxhc3QgcGFnZSBpcyBub3Qgc3VmZmljaWVudCAoYW5k
IHJlZHVuZGFudAo+PiBmb3Igc2luZ2xlLXBhZ2UgcmVnaW9ucykuIEFzIHdlIGRvbid0IG5lZWQg
dG8gY2FyZSBhYm91dCBJQTY0IGFueW1vcmUsCj4+IHVzZSBhbiB4ODYtc3BlY2lmaWMgZnVuY3Rp
b24gdG8gZ2V0IHRoaXMgZG9uZSB3aXRob3V0IGxvb3Bpbmcgb3ZlciBlYWNoCj4+IGluZGl2aWR1
YWwgcGFnZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+Pgo+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvZG1hci5jCj4+ICsr
KyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmMKPj4gQEAgLTI5LDYgKzI5LDcg
QEAKPj4gICNpbmNsdWRlIDx4ZW4vcGNpLmg+Cj4+ICAjaW5jbHVkZSA8eGVuL3BjaV9yZWdzLmg+
Cj4+ICAjaW5jbHVkZSA8YXNtL2F0b21pYy5oPgo+PiArI2luY2x1ZGUgPGFzbS9lODIwLmg+Cj4+
ICAjaW5jbHVkZSA8YXNtL3N0cmluZy5oPgo+PiAgI2luY2x1ZGUgImRtYXIuaCIKPj4gICNpbmNs
dWRlICJpb21tdS5oIgo+PiBAQCAtNjMyLDE0ICs2MzMsMTEgQEAgYWNwaV9wYXJzZV9vbmVfcm1y
cihzdHJ1Y3QgYWNwaV9kbWFyX2hlYQo+PiAgICAgICAqIG5vdCBwcm9wZXJseSByZXByZXNlbnRl
ZCBpbiB0aGUgc3lzdGVtIG1lbW9yeSBtYXAgYW5kCj4+ICAgICAgICogaW5mb3JtIHRoZSB1c2Vy
Cj4+ICAgICAgICovCj4+IC0gICAgaWYgKCAoIXBhZ2VfaXNfcmFtX3R5cGUocGFkZHJfdG9fcGZu
KGJhc2VfYWRkciksIFJBTV9UWVBFX1JFU0VSVkVEKSkgfHwKPj4gLSAgICAgICAgICghcGFnZV9p
c19yYW1fdHlwZShwYWRkcl90b19wZm4oZW5kX2FkZHIpLCBSQU1fVFlQRV9SRVNFUlZFRCkpICkK
Pj4gLSAgICB7Cj4+ICsgICAgaWYgKCAhZTgyMF9hbGxfbWFwcGVkKGJhc2VfYWRkciwgZW5kX2Fk
ZHIgKyAxLCBSQU1fVFlQRV9SRVNFUlZFRCkgKQo+IAo+IERvIHlvdSBuZWVkIHRvIGFkZCBvbmUg
dG8gdGhlIGVuZD8KPiAKPiBUaGUgb3RoZXIgdXNlciBvZiBlODIwX2FsbF9tYXBwZWQgc2VlbXMg
dG8gdHJlYXQgZW5kIGFzIHN0YXJ0ICsgc2l6ZQo+IC0gMSwgd2hpY2ggbWFrZXMgbWUgdGhpbmsg
dGhlIHBhcmFtZXRlcnMgdG8gdGhlIGZ1bmN0aW9uIGFyZSBhbgo+IGluY2x1c2l2ZSByYW5nZSBb
c3RhcnQsIGVuZF0gYW5kIHRoYXQncyB3aGF0J3MgcHJlc2VudCBpbiB0aGUgUk1SUgo+IEFDUEkg
ZW50cmllcz8KCldlbGwsIGl0J3MgdGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBmdW5jdGlvbiB3
aGljaCBtYXR0ZXJzLiBUaGlzCm9uZSBvdGhlciBjYWxsZXIgaXMgd3JvbmcgYWZhaWN0LCBhbmQg
SSd2ZSBqdXN0IHNlbnQgYSBwYXRjaC4gVGhlCm5vbi1pbmNsdXNpdmVuZXNzIGlzIGFsc28gaW4g
bGluZSB3aXRoIExpbnV4J2VzIHZhcmlhbnQgb2YgdGhlCmZ1bmN0aW9uICh3aGVyZSB3ZSd2ZSBn
b3Qgb3VycyBmcm9tIG9yaWdpbmFsbHksIGp1c3QgdGhhdCBpdCBoYXMKYmVlbiByZW5hbWVkIGFu
ZCBzbGlnaHRseSBleHRlbmRlZCBzaW5jZSB0aGVuKS4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
