Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FB7107362
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 14:38:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY970-0006nN-8p; Fri, 22 Nov 2019 13:36:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iY96z-0006nI-EN
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 13:36:37 +0000
X-Inumbo-ID: 1a9b6442-0d2d-11ea-a352-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a9b6442-0d2d-11ea-a352-12813bfff9fa;
 Fri, 22 Nov 2019 13:36:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 70747AB98;
 Fri, 22 Nov 2019 13:36:35 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <fba2992c-e306-dfb2-8edb-20fe5d18ca98@suse.com>
 <ad0a9bc4-dbd6-d59c-d33b-8bed744376ae@citrix.com>
 <ccebdbf3-7cd9-b1e9-b3c5-976ee5b5380b@suse.com>
 <7d2259af-188b-031f-6853-44a0151b7ee3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8b380be1-6220-dac0-91f2-35c8dd338f06@suse.com>
Date: Fri, 22 Nov 2019 14:36:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7d2259af-188b-031f-6853-44a0151b7ee3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: avoid HPET use on certain Intel
 platforms
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMTEuMjAxOSAxMzo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMi8xMS8yMDE5
IDEyOjU3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjIuMTEuMjAxOSAxMzo1MCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDIyLzExLzIwMTkgMTI6NDYsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IExpbnV4IGNvbW1pdCBmYzVkYjU4NTM5YjQ5MzUxZTc2ZjE5ODE3ZWQxMTAyYmY3Yzcx
MmQwIHNheXMKPj4+Pgo+Pj4+ICJTb21lIENvZmZlZSBMYWtlIHBsYXRmb3JtcyBoYXZlIGEgc2tl
d2VkIEhQRVQgdGltZXIgb25jZSB0aGUgU29DcyBlbnRlcmVkCj4+Pj4gIFBDMTAsIHdoaWNoIGlu
IGNvbnNlcXVlbmNlIG1hcmtzIFRTQyBhcyB1bnN0YWJsZSBiZWNhdXNlIEhQRVQgaXMgdXNlZCBh
cwo+Pj4+ICB3YXRjaGRvZyBjbG9ja3NvdXJjZSBmb3IgVFNDLiIKPj4+Pgo+Pj4+IEZvbGxvdyB0
aGlzIGZvciBYZW4gYXMgd2VsbC4gTG9va2luZyBhdCBpdHMgcGF0Y2ggY29udGV4dCBtYWRlIG1l
IG5vdGljZQo+Pj4+IHRoZXkgaGF2ZSBhIHByZS1leGlzdGluZyBxdWlyayBmb3IgQmF5IFRyYWls
IGFzIHdlbGwuIFRoZSBjb21tZW50IHRoZXJlLAo+Pj4+IGhvd2V2ZXIsIHBvaW50cyBhdCBhIENo
ZXJyeSBUcmFpbCBkb2N1bWVudC4gTG9va2luZyBhdCB0aGUgZGF0YXNoZWV0cyBvZgo+Pj4+IGJv
dGgsIHRoZXJlIGFwcGVhciB0byBiZSBzaW1pbGFyIGlzc3Vlcywgc28gZ28gYmV5b25kIExpbnV4
J2VzIGNvdmVyYWdlCj4+Pj4gYW5kIGV4Y2x1ZGUgYm90aC4gQWxzbyBrZXkgdGhlIGRpc2FibGUg
b24gdGhlIFBDSSBJRHMgb2YgdGhlIGFjdHVhbAo+Pj4+IGFmZmVjdGVkIGRldmljZXMsIHJhdGhl
ciB0aGFuIHRob3NlIG9mIDAwOjAwLjAuCj4+Pj4KPj4+PiBBcHBseSB0aGUgd29ya2Fyb3VuZHMg
b25seSB3aGVuIHRoZSB1c2Ugb2YgSFBFVCB3YXMgbm90IGV4cGxpY2l0bHkKPj4+PiByZXF1ZXN0
ZWQgb24gdGhlIGNvbW1hbmQgbGluZSBhbmQgd2hlbiB1c2Ugb2YgKGRlZXApIEMtc3RhdGVzIHdh
cyBub3QKPj4+PiBkaXNhYmxlZC4KPj4+Pgo+Pj4+IEFkanVzdCBhIGZldyB0eXBlcyBpbiB0b3Vj
aGVkIG9yIG5lYXJieSBjb2RlIGF0IHRoZSBzYW1lIHRpbWUuCj4+PiBSZXBvcnRlZC1ieSA/Cj4+
IFRoZSBMaW51eCBjb21taXQgaGFzIGEgU3VnZ2VzdGVkLWJ5LCBidXQgbm8gUmVwb3J0ZWQtYnku
IERvIHlvdQo+PiB3YW50IG1lIHRvIGNvcHkgdGhhdCBvbmU/IE9yIGVsc2UgZG8geW91IGhhdmUg
YW55IHN1Z2dlc3Rpb24gYXMKPj4gdG8gd2hvIHRoZSByZXBvcnRlciB3YXM/Cj4gCj4gV2VsbCAt
IHRoaXMgcGF0Y2ggd2FzIGlkZW50aWZpZWQgYnkgc29tZW9uZSBvbiB4ZW4tZGV2ZWwsIHdoaWNo
IEkKPiBwcmVzdW1lIHdhcyB5b3VyIGJhc2lzIGZvciBsb29raW5nIGludG8gaXQuCgpObywgaXQg
d2FzIG1lIHNwb3R0aW5nIHRoZSBMaW51eCBjb21taXQgaW4gdGhlIHN0YWJsZSA1LjMgQ2hhbmdl
TG9nLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
