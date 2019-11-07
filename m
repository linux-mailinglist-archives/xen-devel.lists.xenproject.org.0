Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3EFF33F6
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 16:58:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSk8i-000245-BM; Thu, 07 Nov 2019 15:56:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iSk8h-000240-CX
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 15:56:03 +0000
X-Inumbo-ID: 17750d67-0177-11ea-a1c9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17750d67-0177-11ea-a1c9-12813bfff9fa;
 Thu, 07 Nov 2019 15:56:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2CB00B14A;
 Thu,  7 Nov 2019 15:56:00 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191107150609.93004-1-roger.pau@citrix.com>
 <20191107150609.93004-3-roger.pau@citrix.com>
 <df702a74-0941-3491-fb18-165f7fb592b0@suse.com>
 <20191107154632.GA17494@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <edbb85f3-cddf-0791-06b9-7c868f50db3b@suse.com>
Date: Thu, 7 Nov 2019 16:56:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191107154632.GA17494@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] x86/ioapic: don't use raw
 entry reads/writes in clear_IO_APIC_pin
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMTEuMjAxOSAxNjo0NiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVGh1LCBO
b3YgMDcsIDIwMTkgYXQgMDQ6Mjg6NTZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDA3LjExLjIwMTkgMTY6MDYsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+IEBAIC01MzAsOSAr
NTMwLDkgQEAgc3RhdGljIHZvaWQgY2xlYXJfSU9fQVBJQ19waW4odW5zaWduZWQgaW50IGFwaWMs
IHVuc2lnbmVkIGludCBwaW4pCj4+PiAgICAgICAqLwo+Pj4gICAgICBtZW1zZXQoJmVudHJ5LCAw
LCBzaXplb2YoZW50cnkpKTsKPj4+ICAgICAgZW50cnkubWFzayA9IDE7Cj4+PiAtICAgIF9faW9h
cGljX3dyaXRlX2VudHJ5KGFwaWMsIHBpbiwgdHJ1ZSwgZW50cnkpOwo+Pj4gKyAgICBfX2lvYXBp
Y193cml0ZV9lbnRyeShhcGljLCBwaW4sIGZhbHNlLCBlbnRyeSk7Cj4+Cj4+IEkgbWF5IGJlIGFi
bGUgdG8gdW5kZXJzdGFuZCB3aHkgdGhpcyBvbmUgY2FuJ3QgdXNlIHJhdyBtb2RlLCBidXQgYXMK
Pj4gcGVyIGFib3ZlIGEgYmV0dGVyIG92ZXJhbGwgZGVzY3JpcHRpb24gaXMgbmVlZGVkLgo+IAo+
IFllcywgdGhpcyBpcyB0aGUgb25lIHRoYXQncyBhY3R1YWxseSBpbmNvcnJlY3QsIGJ1dCBzZWUg
bXkgcmVhc29uaW5nCj4gYmVsb3cuCj4gCj4+Cj4+PiAtICAgIGVudHJ5ID0gX19pb2FwaWNfcmVh
ZF9lbnRyeShhcGljLCBwaW4sIHRydWUpOwo+Pj4gKyAgICBlbnRyeSA9IF9faW9hcGljX3JlYWRf
ZW50cnkoYXBpYywgcGluLCBmYWxzZSk7Cj4+PiAgICAgIGlmIChlbnRyeS5pcnIpCj4+PiAgICAg
ICAgICBwcmludGsoS0VSTl9FUlIgIklPLUFQSUMlMDJ4LSV1OiBVbmFibGUgdG8gcmVzZXQgSVJS
XG4iLAo+Pj4gICAgICAgICAgICAgICAgIElPX0FQSUNfSUQoYXBpYyksIHBpbik7Cj4+Cj4+IFRo
aXMgcmVhZCBhZ2FpbiBzaG91bGRuJ3QgbmVlZCBjb252ZXJzaW9uLCBhcyB0aGUgSVJSIGJpdCBk
b2Vzbid0Cj4+IGdldCB0b3VjaGVkIChJIHRoaW5rKSBieSB0aGUgaW50ZXJydXB0IHJlbWFwcGlu
ZyBjb2RlIGR1cmluZyB0aGUKPj4gdHJhbnNsYXRpb24gaXQgZG9lcy4KPiAKPiBUQkgsIEkgdGhp
bmsgcmF3IG1vZGUgc2hvdWxkIG9ubHkgYmUgdXNlZCBieSB0aGUgaW9tbXUgY29kZSBpbiBvcmRl
cgo+IHRvIHNldHVwIHRoZSBlbnRyaWVzIHRvIHBvaW50IHRvIHRoZSBpbnRlcnJ1cHQgcmVtYXBw
aW5nIHRhYmxlLAo+IGV2ZXJ5dGhpbmcgZWxzZSBzaG91bGRuJ3QgYmUgdXNpbmcgcmF3IG1vZGUu
IFdoaWxlIGl0J3MgdHJ1ZSB0aGF0IHNvbWUKPiBvZiB0aGUgY2FzZXMgaGVyZSBhcmUgc2FmZSB0
byB1c2UgcmF3IG1vZGUgSSB3b3VsZCBkaXNjb3VyYWdlIGl0J3MKPiB1c2FnZSBhcyBpdCBjYW4g
bGVhZCB0byBpc3N1ZXMsIGFuZCB0aGlzIGlzIG5vdCBhIHBlcmZvcm1hbmNlIGNyaXRpY2FsCj4g
cGF0aCBhbnl3YXkuCgpZb3UgYWxzbyBzaG91bGQgdGFrZSB0aGUgb3RoZXIgcG9zc2libGUgcGVy
c3BlY3RpdmUgLSBub3QgdXNpbmcKcmF3IG1vZGUgbWVhbnMgZ29pbmcgdGhyb3VnaCBpbnRlcnJ1
cHQgcmVtYXBwaW5nIGxvZ2ljLCB3aGljaApjYW4gKG5lZWRsZXNzbHkpIHRyaWdnZXIgZXJyb3Jz
LiBJIHRoaW5rIHlvdSB3YW50IHRvIGJyZWFrIHRoZQpwYXRjaCBpbnRvIGEgbmVjZXNzYXJ5IGFu
ZCBhbiBvcHRpb25hbCBwYXJ0LiBUaGUgb3B0aW9uYWwgcGFydApzaG91bGQgYmUgZGlzY3Vzc2Vk
IHNlcGFyYXRlbHkgYW5kIGRlZmVycmVkIHVudGlsIGFmdGVyIDQuMTMuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
