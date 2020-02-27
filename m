Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED291711EB
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 09:05:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7E7z-0007Kt-5N; Thu, 27 Feb 2020 08:02:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qtag=4P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7E7y-0007Ko-2r
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 08:02:38 +0000
X-Inumbo-ID: 849c9522-5937-11ea-95eb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 849c9522-5937-11ea-95eb-12813bfff9fa;
 Thu, 27 Feb 2020 08:02:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CC455AD69;
 Thu, 27 Feb 2020 08:02:36 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
 <20200226202221.6555-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ba5f767b-6f17-adf4-083f-d6b6048fa2fb@suse.com>
Date: Thu, 27 Feb 2020 09:02:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226202221.6555-5-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 04/10] x86/gen-cpuid: Create max and default
 variations of INIT_*_FEATURES
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

T24gMjYuMDIuMjAyMCAyMToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBGb3Igbm93LCB3cml0
ZSB0aGUgc2FtZSBjb250ZW50IGZvciBib3RoLiAgVXBkYXRlIHRoZSB1c2VycyBvZiB0aGUKPiBp
bml0aWFsaXNlcnMgdG8gdXNlIHRoZSBuZXcgbmFtZSwgYW5kIGV4dGVuZCB4ZW4tY3B1aWQgdG8g
ZHVtcCBib3RoIGRlZmF1bHQKPiBhbmQgbWF4IGZlYXR1cmVzZXRzLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpIeXBlcnZpc29y
IGFuZCBsaWJ4YyBwYXJ0cwpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKPiAtLS0gYS90b29scy9taXNjL3hlbi1jcHVpZC5jCj4gKysrIGIvdG9vbHMvbWlzYy94
ZW4tY3B1aWQuYwo+IEBAIC0yODMsMTIgKzI4MywxOCBAQCBzdGF0aWMgdm9pZCBkdW1wX2luZm8o
eGNfaW50ZXJmYWNlICp4Y2gsIGJvb2wgZGV0YWlsKQo+ICAgICAgICAgICAgICAgICAgICAgICAg
bnJfZmVhdHVyZXMsICJLbm93biIsIGRldGFpbCk7Cj4gICAgICBkZWNvZGVfZmVhdHVyZXNldCh4
Y19nZXRfc3RhdGljX2NwdV9mZWF0dXJlbWFzayhYQ19GRUFUVVJFTUFTS19TUEVDSUFMKSwKPiAg
ICAgICAgICAgICAgICAgICAgICAgIG5yX2ZlYXR1cmVzLCAiU3BlY2lhbCIsIGRldGFpbCk7Cj4g
LSAgICBkZWNvZGVfZmVhdHVyZXNldCh4Y19nZXRfc3RhdGljX2NwdV9mZWF0dXJlbWFzayhYQ19G
RUFUVVJFTUFTS19QViksCj4gLSAgICAgICAgICAgICAgICAgICAgICBucl9mZWF0dXJlcywgIlBW
IE1hc2siLCBkZXRhaWwpOwo+IC0gICAgZGVjb2RlX2ZlYXR1cmVzZXQoeGNfZ2V0X3N0YXRpY19j
cHVfZmVhdHVyZW1hc2soWENfRkVBVFVSRU1BU0tfSFZNX1NIQURPVyksCj4gLSAgICAgICAgICAg
ICAgICAgICAgICBucl9mZWF0dXJlcywgIkhWTSBTaGFkb3cgTWFzayIsIGRldGFpbCk7Cj4gLSAg
ICBkZWNvZGVfZmVhdHVyZXNldCh4Y19nZXRfc3RhdGljX2NwdV9mZWF0dXJlbWFzayhYQ19GRUFU
VVJFTUFTS19IVk1fSEFQKSwKPiAtICAgICAgICAgICAgICAgICAgICAgIG5yX2ZlYXR1cmVzLCAi
SFZNIEhhcCBNYXNrIiwgZGV0YWlsKTsKPiArICAgIGRlY29kZV9mZWF0dXJlc2V0KHhjX2dldF9z
dGF0aWNfY3B1X2ZlYXR1cmVtYXNrKFhDX0ZFQVRVUkVNQVNLX1BWX01BWCksCj4gKyAgICAgICAg
ICAgICAgICAgICAgICBucl9mZWF0dXJlcywgIlBWIE1heCIsIGRldGFpbCk7Cj4gKyAgICBkZWNv
ZGVfZmVhdHVyZXNldCh4Y19nZXRfc3RhdGljX2NwdV9mZWF0dXJlbWFzayhYQ19GRUFUVVJFTUFT
S19QVl9ERUYpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgbnJfZmVhdHVyZXMsICJQViBEZWZh
dWx0IiwgZGV0YWlsKTsKPiArICAgIGRlY29kZV9mZWF0dXJlc2V0KHhjX2dldF9zdGF0aWNfY3B1
X2ZlYXR1cmVtYXNrKFhDX0ZFQVRVUkVNQVNLX0hWTV9TSEFET1dfTUFYKSwKPiArICAgICAgICAg
ICAgICAgICAgICAgIG5yX2ZlYXR1cmVzLCAiSFZNIFNoYWRvdyBNYXgiLCBkZXRhaWwpOwo+ICsg
ICAgZGVjb2RlX2ZlYXR1cmVzZXQoeGNfZ2V0X3N0YXRpY19jcHVfZmVhdHVyZW1hc2soWENfRkVB
VFVSRU1BU0tfSFZNX1NIQURPV19ERUYpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgbnJfZmVh
dHVyZXMsICJIVk0gU2hhZG93IERlZmF1bHQiLCBkZXRhaWwpOwo+ICsgICAgZGVjb2RlX2ZlYXR1
cmVzZXQoeGNfZ2V0X3N0YXRpY19jcHVfZmVhdHVyZW1hc2soWENfRkVBVFVSRU1BU0tfSFZNX0hB
UF9NQVgpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgbnJfZmVhdHVyZXMsICJIVk0gSGFwIE1h
eCIsIGRldGFpbCk7Cj4gKyAgICBkZWNvZGVfZmVhdHVyZXNldCh4Y19nZXRfc3RhdGljX2NwdV9m
ZWF0dXJlbWFzayhYQ19GRUFUVVJFTUFTS19IVk1fSEFQX0RFRiksCj4gKyAgICAgICAgICAgICAg
ICAgICAgICBucl9mZWF0dXJlcywgIkhWTSBIYXAgRGVmYXVsdCIsIGRldGFpbCk7CgpTcG90dGlu
ZyBkaWZmZXJlbmNlcyBiZXR3ZWVuIG1heCBhbmQgZGVmYXVsdCB0aGlzIHdheSBpcywgSSBhc3N1
bWUsCmdvaW5nIHRvIGJlIHF1aXRlIGRpZmZpY3VsdCAvIGVycm9yIHByb25lLiBXb3VsZG4ndCBp
dCBiZSBiZXR0ZXIgdG8KcHJvZHVjZSB0aGUgZGVmYXVsdCBzZXQgaW4gZnVsbCwgYW5kIHRoZW4g
bGlzdCBqdXN0IHRoZSBleHRyYSBpdGVtcwppbiBtYXg/IEFpdWkgbWF4IGlzIGFsd2F5cyBnb2lu
ZyB0byBiZSBhIHN1cGVyc2V0IG9mIGRlZi4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
