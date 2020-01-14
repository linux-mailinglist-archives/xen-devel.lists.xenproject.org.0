Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD15E13AFFA
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 17:50:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irPKR-0005Yx-6h; Tue, 14 Jan 2020 16:46:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZPm=3D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irPKP-0005Ys-Dd
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 16:46:05 +0000
X-Inumbo-ID: 5790c920-36ed-11ea-8401-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5790c920-36ed-11ea-8401-12813bfff9fa;
 Tue, 14 Jan 2020 16:45:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A6D17AEBA;
 Tue, 14 Jan 2020 16:45:58 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200113175020.32730-1-andrew.cooper3@citrix.com>
 <20200113175020.32730-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <91da9495-d274-ccaa-a09f-aa0650aff623@suse.com>
Date: Tue, 14 Jan 2020 17:45:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200113175020.32730-5-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/4] x86/boot: Create the l2_xenmap[]
 mappings dynamically
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDEuMjAyMCAxODo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgYnVpbGQtdGlt
ZSBjb25zdHJ1Y3Rpb24gb2YgbDJfeGVubWFwW10gaW1wb3NlcyBhbiBhcmJpdHJhcnkgbGltaXQg
b2YgMTZNCj4gdG90YWwsIHdoaWNoIGlzIGEgbGltaXQgbG9va2luZyB0byBiZSBsaWZ0ZWQuCj4g
Cj4gTW92ZSBsMl94ZW5tYXBbXSBpbnRvIHRoZSBic3MsIGFuZCBhZGp1c3QgYm90aCB0aGUgQklP
UyBhbmQgRUZJIHBhdGhzIHRvIGZpbGwKPiBpdCBpbiBkeW5hbWljYWxseSwgYmFzZWQgb24gdGhl
IGZpbmFsIGxpbmtlZCBzaXplIG9mIFhlbi4gIEZvciBjdXJyZW50IGJ1aWxkcywKPiB0aGlzIHJl
ZHVjZXMgdGhlIG51bWJlciBvZiAudGV4dC9ldGMgbWFwcGluZ3MgZnJvbSA3IHRvIDQuCgpJcyB0
aGUgNCBuYW1lZCBoZXJlIGFwcGxpY2FibGUgdGhlIHNhbWUgdG8geGVuLmd6IGFuZCB4ZW4uZWZp
LCBkZXNwaXRlCnRoZSBsYXR0ZXIgdXNpbmcgbGFyZ2UgcGFnZXMgd2l0aCBkaXN0aW5jdCBwZXJt
aXNzaW9ucyB3aGlsZSB0aGUgZm9ybWVyCnN0aWxsIGRvZXNuJ3Q/Cgo+IEluIHByaW5jaXBsZSwg
dGhlIG5vbi1FRkkgY2FzZSBjb3VsZCBiZSBtYWRlIHRvIHdvcmsgYnkgaGF2aW5nIGEgcG9zdC1s
aW5rCj4gc2NyaXB0IGZpbGwgaW4gYSBzdWl0YWJsZSBudW1iZXIgb2YgX1BBR0VfUFJFU0VOVCBl
bnRyaWVzIGluIGwyX3hlbm1hcFtdLgo+IFRoaXMgZG9lc24ndCB3b3JrIGZvciB0aGUgRUZJIGNh
c2UsIGJlY2F1c2UgcGFnZXRhYmxlIHJlbG9jYXRpb24gaXMgaW5zdGVhZAo+IHRyaWdnZXJlZCBv
biB0aGUgYWQtaG9jIHJlbG9jYXRpb24gdGFibGUsIHdoaWNoIHdvdWxkIHJlcXVpcmUgdGhlCj4g
X1BBR0VfUFJFU0VOVCByZWZlcmVuY2VzIHRvIGJlIGluIHBsYWNlIGJlZm9yZSB0aGUgbGluayB0
YWtlcyBwbGFjZS4KCkFuZCB0byBiZSBob25lc3QsIHN1Y2ggYSBwb3N0LWxpbmsgc2NyaXB0IHdv
dWxkIHNlZW0gcmF0aGVyIHVnbHkKdG8gaGF2ZSB0byBtZS4KCj4gLS0tIGEveGVuL2FyY2gveDg2
L2Jvb3QvaGVhZC5TCj4gKysrIGIveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TCj4gQEAgLTY2OCw2
ICs2NjgsMjAgQEAgdHJhbXBvbGluZV9zZXR1cDoKPiAgICAgICAgICBhZGQgICAgICVlc2ksc3lt
X2ZzKF9fcGFnZV90YWJsZXNfc3RhcnQpLTgoLCVlY3gsOCkKPiAgMjogICAgICBsb29wICAgIDFi
Cj4gIAo+ICsgICAgICAgIC8qIE1hcCBYZW4gaW50byB0aGUgaGlnaGVyIG1hcHBpbmdzIHVzaW5n
IDJNIHN1cGVycGFnZXMuICovCj4gKyAgICAgICAgbGVhICAgICBfUEFHRV9QU0UgKyBQQUdFX0hZ
UEVSVklTT1JfUldYICsgc3ltX2VzaShfc3RhcnQpLCAlZWF4Cj4gKyAgICAgICAgbW92ICAgICAk
c3ltX29mZnMoX3N0YXJ0KSwgICAlZWN4ICAgLyogJWVheCA9IFBURSB0byB3cml0ZSAgICAgICAg
Ki8KClRoZSBjb21tZW50IGlzIG9uIHRoZSB3cm9uZyBsaW5lLCBpc24ndCBpdD8gUGVyaGFwcwoK
ICAgICAgICBsZWEgICAgIF9QQUdFX1BTRSArIFBBR0VfSFlQRVJWSVNPUl9SV1ggKyBzeW1fZXNp
KF9zdGFydCksIFwKICAgICAgICAgICAgICAgICVlYXggICAgICAgICAgICAgICAgLyogJWVheCA9
IFBURSB0byB3cml0ZSAgICAgICAgKi8KCj8KCj4gLS0tIGEveGVuL2FyY2gveDg2L2VmaS9lZmkt
Ym9vdC5oCj4gKysrIGIveGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oCj4gQEAgLTU4NSw2ICs1
ODUsMjAgQEAgc3RhdGljIHZvaWQgX19pbml0IGVmaV9hcmNoX21lbW9yeV9zZXR1cCh2b2lkKQo+
ICAgICAgaWYgKCAhZWZpX2VuYWJsZWQoRUZJX0xPQURFUikgKQo+ICAgICAgICAgIHJldHVybjsK
PiAgCj4gKyAgICAvKgo+ICsgICAgICogTWFwIFhlbiBpbnRvIHRoZSBoaWdoZXIgbWFwcGluZ3Ms
IHVzaW5nIDJNIHN1cGVycGFnZXMuCj4gKyAgICAgKgo+ICsgICAgICogTkI6IFdlIGFyZSBjdXJy
ZW50bHkgaW4gcGh5c2ljYWwgbW9kZSwgc28gYSBSSVAtcmVsYXRpdmUgcmVsb2NhdGlvbgo+ICsg
ICAgICogYWdhaW5zdCBfc3RhcnQvX2VuZCBnZXRzIHRoZWlyIHBvc2l0aW9uIGFzIHBsYWNlZCBi
eSB0aGUgYm9vdGxvYWRlciwKPiArICAgICAqIG5vdCBhcyBleHBlY3RlZCBpbiB0aGUgZmluYWwg
YnVpbGQuICBUaGlzIGhhcyBhcmJpdHJhcnkgMk0gYWxpZ25tZW50LAo+ICsgICAgICogc28gc3Vi
dHJhY3QgeGVuX3BoeXNfc3RhcnQgdG8gZ2V0IHRoZSBhcHByb3ByaWF0ZSBzbG90cyBpbiBsMl94
ZW5tYXBbXS4KPiArICAgICAqLwoKSXQgbWF5IGp1c3QgYmUgYSBsYW5ndWFnZSBpc3N1ZSwgYnV0
IEknbSBzdHJ1Z2dsaW5nIHdpdGggdGhlCiJhcmJpdHJhcnkiIGhlcmUuIElzIHRoaXMgaW4gYW55
IHdheSByZWxhdGVkIHRvIHRoZQotLXNlY3Rpb24tYWxpZ25tZW50PTB4MjAwMDAwIG9wdGlvbiB3
ZSBwYXNzIHRvIHRoZSBsaW5rZXIgKHdoZXJlCnRoZSB2YWx1ZSBpc24ndCBhcmJpdHJhcnkgYXQg
YWxsKT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
