Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95105C32DF
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 13:44:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFGXE-0002gN-Fv; Tue, 01 Oct 2019 11:41:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=itvi=X2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFGXC-0002gI-JI
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 11:41:38 +0000
X-Inumbo-ID: 6c699eda-e440-11e9-96f8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 6c699eda-e440-11e9-96f8-12813bfff9fa;
 Tue, 01 Oct 2019 11:41:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3CDA8ACC3;
 Tue,  1 Oct 2019 11:41:35 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <98fd2d35-30f6-961d-a03d-3354b77d49b0@suse.com>
 <20191001113008.dquc2jhxgjenst5a@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <72ca9492-5204-5f5c-1ee1-2760cf98559a@suse.com>
Date: Tue, 1 Oct 2019 13:40:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001113008.dquc2jhxgjenst5a@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAxMzozMCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVHVlLCBP
Y3QgMDEsIDIwMTkgYXQgMTE6MDc6NTVBTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9odm0vZG0uYwo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2RtLmMK
Pj4gQEAgLTI1NSwxNiArMjU1LDMzIEBAIHN0YXRpYyBpbnQgc2V0X21lbV90eXBlKHN0cnVjdCBk
b21haW4gKmQKPj4gIAo+PiAgICAgIG1lbV90eXBlID0gYXJyYXlfaW5kZXhfbm9zcGVjKGRhdGEt
Pm1lbV90eXBlLCBBUlJBWV9TSVpFKG1lbXR5cGUpKTsKPj4gIAo+PiAtICAgIGlmICggbWVtX3R5
cGUgPT0gSFZNTUVNX2lvcmVxX3NlcnZlciApCj4+ICsgICAgc3dpdGNoICggbWVtX3R5cGUgKQo+
PiAgICAgIHsKPj4gICAgICAgICAgdW5zaWduZWQgaW50IGZsYWdzOwo+PiAgCj4+ICsgICAgY2Fz
ZSBIVk1NRU1faW9yZXFfc2VydmVyOgo+PiAgICAgICAgICBpZiAoICFoYXBfZW5hYmxlZChkKSAp
Cj4+ICAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4+ICAKPj4gICAgICAgICAgLyog
RG8gbm90IGNoYW5nZSB0byBIVk1NRU1faW9yZXFfc2VydmVyIGlmIG5vIGlvcmVxIHNlcnZlciBt
YXBwZWQuICovCj4+ICAgICAgICAgIGlmICggIXAybV9nZXRfaW9yZXFfc2VydmVyKGQsICZmbGFn
cykgKQo+PiAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+ICsKPj4gKyAgICAgICAgYnJl
YWs7Cj4+ICsKPj4gKyAgICBjYXNlIEhWTU1FTV9yYW1fcm86Cj4+ICsgICAgICAgIC8qIHAybV9y
YW1fcm8gY2FuJ3QgYmUgcmVwcmVzZW50ZWQgaW4gSU9NTVUgbWFwcGluZ3MuICovCj4+ICsgICAg
ICAgIGRvbWFpbl9sb2NrKGQpOwo+PiArICAgICAgICBpZiAoIGhhc19hcmNoX3BkZXZzKGQpICkK
PiAKPiBJIHdvdWxkIHVzZSBpc19pb21tdV9lbmFibGVkIGJlY2F1c2UgSSB0aGluayBpdCdzIGNs
ZWFyZXIgaW4gdGhpcwo+IGNvbnRleHQgKGdpdmluZyB0aGUgY29tbWVudCBhYm92ZSBleHBsaWNp
dGx5IHJlZmVycyB0byBoYXZpbmcgaW9tbXUKPiBtYXBwaW5ncykuCgpCdXQgdGhlIHdob2xlIHBv
aW50IG9mIHRoZSByZS1iYXNpbmcgb3ZlciBQYXVsJ3MgY2hhbmdlIGlzIHRoYXQgbm93CnRoZSBv
cGVyYXRpb24gZ2V0cyByZWZ1c2VkIG9ubHkgaWYgYSBkZXZpY2Ugd2FzIGFjdHVhbGx5IGFzc2ln
bmVkLgoKPj4gKyAgICAgICAgICAgIHJjID0gLUVYREVWOwo+IAo+IEVPUE5PVFNVUFAgbWlnaHQg
YmUgYmV0dGVyLCBzaW5jZSBpdCdzIHBvc3NpYmxlIHRoYXQgZnV0dXJlIGlvbW11cwo+IHN1cHBv
cnQgc3VjaCBwYWdlIHR5cGU/CgpJIGRvbid0IHRoaW5rIGZ1dHVyZSBJT01NVSBiZWhhdmlvciBh
ZmZlY3RzIHRoZSBjaG9pY2Ugb2YgZXJyb3IKY29kZS4gSSB3YW50ZWQgdG8gdXNlIHNvbWV0aGlu
ZyBoYWxmIHdheSByZWFzb25hYmxlLCB5ZXQgbm90IHRvbwpjb21tb24sIGluIG9yZGVyIHRvIGJl
IGFibGUgdG8gZWFzaWx5IGlkZW50aWZ5IHRoZSBzb3VyY2Ugb2YgdGhlCmVycm9yLiBJZiB5b3Ug
YW5kIG90aGVycyB0aGluayB0aGlzIGlzbid0IGEgbWVhbmluZ2Z1bCBjb25jZXJuLApJJ2QgYmUg
b2theSBzd2l0Y2hpbmcgdG8gLUVPUE5PVFNVUFAuCgo+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9wY2kuYwo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYwo+PiBA
QCAtMTQ4NiwxNSArMTQ4NiwzMyBAQCBzdGF0aWMgaW50IGFzc2lnbl9kZXZpY2Uoc3RydWN0IGRv
bWFpbiAqCj4+ICAgICAgaWYgKCAhaXNfaW9tbXVfZW5hYmxlZChkKSApCj4+ICAgICAgICAgIHJl
dHVybiAwOwo+PiAgCj4+IC0gICAgLyogUHJldmVudCBkZXZpY2UgYXNzaWduIGlmIG1lbSBwYWdp
bmcgb3IgbWVtIHNoYXJpbmcgaGF2ZSBiZWVuIAo+PiAtICAgICAqIGVuYWJsZWQgZm9yIHRoaXMg
ZG9tYWluICovCj4+IC0gICAgaWYgKCB1bmxpa2VseShkLT5hcmNoLmh2bS5tZW1fc2hhcmluZ19l
bmFibGVkIHx8Cj4+IC0gICAgICAgICAgICAgICAgICB2bV9ldmVudF9jaGVja19yaW5nKGQtPnZt
X2V2ZW50X3BhZ2luZykgfHwKPj4gKyAgICBkb21haW5fbG9jayhkKTsKPj4gKwo+PiArICAgIC8q
Cj4+ICsgICAgICogUHJldmVudCBkZXZpY2UgYXNzaWdubWVudCBpZiBhbnkgb2YKPj4gKyAgICAg
KiAtIG1lbSBwYWdpbmcKPj4gKyAgICAgKiAtIG1lbSBzaGFyaW5nCj4+ICsgICAgICogLSB0aGUg
cDJtX3JhbV9ybyB0eXBlCj4+ICsgICAgICogLSBnbG9iYWwgbG9nLWRpcnR5IG1vZGUKPj4gKyAg
ICAgKiBhcmUgaW4gdXNlIGJ5IHRoaXMgZG9tYWluLgo+PiArICAgICAqLwo+PiArICAgIGlmICgg
dW5saWtlbHkodm1fZXZlbnRfY2hlY2tfcmluZyhkLT52bV9ldmVudF9wYWdpbmcpIHx8Cj4+ICsj
aWZkZWYgQ09ORklHX0hWTQo+PiArICAgICAgICAgICAgICAgICAgKGlzX2h2bV9kb21haW4oZCkg
JiYKPj4gKyAgICAgICAgICAgICAgICAgICAoZC0+YXJjaC5odm0ubWVtX3NoYXJpbmdfZW5hYmxl
ZCB8fAo+PiArICAgICAgICAgICAgICAgICAgICBkLT5hcmNoLmh2bS5wMm1fcmFtX3JvX3VzZWQp
KSB8fAo+PiArI2VuZGlmCj4+ICAgICAgICAgICAgICAgICAgICBwMm1fZ2V0X2hvc3RwMm0oZCkt
Pmdsb2JhbF9sb2dkaXJ0eSkgKQo+IAo+IElzIHN1Y2ggY2hlY2sgbmVlZGVkIGFueW1vcmU/Cj4g
Cj4gV2l0aCB0aGUgZW5hYmxpbmcgb2YgdGhlIGlvbW11IHJpZ2h0IGF0IGRvbWFpbiBjcmVhdGlv
biBpdCBzaG91bGRuJ3QKPiBiZSBwb3NzaWJsZSB0byBlbmFibGUgYW55IG9mIHRoZSBhYm92ZSBm
ZWF0dXJlcyBhdCBhbGwgYW55bW9yZS4KClNlZSBhYm92ZSAtIGFsbCBzdWNoIGNoZWNrcyBzaG91
bGQgbm93IGJlIC8gZ2V0IGNvbnZlcnRlZCB0byBjaGVjawp3aGV0aGVyIGRldmljZXMgYXJlIGFz
c2lnbmVkLCBub3Qgd2hldGhlciBJT01NVSBwYWdlIHRhYmxlcyBleGlzdC4KQWZ0ZXIgYWxsIHdl
IHdhbnQgdG8gcmVmdXNlIHJlcXVlc3RzIG9ubHkgaWYgc3RyaWN0bHkgbmVjZXNzYXJ5LgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
