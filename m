Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB10181DAC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 17:23:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC45q-0005wf-R5; Wed, 11 Mar 2020 16:20:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lkak=44=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jC45p-0005wa-LV
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 16:20:25 +0000
X-Inumbo-ID: 364bc136-63b4-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 364bc136-63b4-11ea-bec1-bc764e2007e4;
 Wed, 11 Mar 2020 16:20:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B6236AC50;
 Wed, 11 Mar 2020 16:20:23 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200228120753.38036-1-roger.pau@citrix.com>
 <20200228120753.38036-3-roger.pau@citrix.com>
 <6a031b3f-5807-572d-682b-9a0b05f0703d@suse.com>
 <20200311153437.GC24458@Air-de-Roger.citrite.net>
 <cd51c415-dfd4-42c4-caf9-2a19ddeb8b3f@suse.com>
 <20200311155118.GD24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <31a2da09-c82d-157f-3ca2-bbea45d9bcd0@suse.com>
Date: Wed, 11 Mar 2020 17:20:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200311155118.GD24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 2/2] x86: add accessors for scratch cpu
 mask
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDMuMjAyMCAxNjo1MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIE1h
ciAxMSwgMjAyMCBhdCAwNDozNzo1MFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTEuMDMuMjAyMCAxNjozNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIEZyaSwgRmVi
IDI4LCAyMDIwIGF0IDAxOjQyOjU4UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9u
IDI4LjAyLjIwMjAgMTM6MDcsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4gQ3VycmVudCB1
c2FnZSBvZiB0aGUgcGVyLUNQVSBzY3JhdGNoIGNwdW1hc2sgaXMgZGFuZ2Vyb3VzIHNpbmNlCj4+
Pj4+IHRoZXJlJ3Mgbm8gd2F5IHRvIGZpZ3VyZSBvdXQgaWYgdGhlIG1hc2sgaXMgYWxyZWFkeSBi
ZWluZyB1c2VkIGV4Y2VwdAo+Pj4+PiBmb3IgbWFudWFsIGNvZGUgaW5zcGVjdGlvbiBvZiBhbGwg
dGhlIGNhbGxlcnMgYW5kIHBvc3NpYmxlIGNhbGwgcGF0aHMuCj4+Pj4+Cj4+Pj4+IFRoaXMgaXMg
dW5zYWZlIGFuZCBub3QgcmVsaWFibGUsIHNvIGludHJvZHVjZSBhIG1pbmltYWwgZ2V0L3B1dAo+
Pj4+PiBpbmZyYXN0cnVjdHVyZSB0byBwcmV2ZW50IG5lc3RlZCB1c2FnZSBvZiB0aGUgc2NyYXRj
aCBtYXNrIGFuZCB1c2FnZQo+Pj4+PiBpbiBpbnRlcnJ1cHQgY29udGV4dC4KPj4+Pj4KPj4+Pj4g
TW92ZSB0aGUgZGVjbGFyYXRpb24gb2Ygc2NyYXRjaF9jcHVtYXNrIHRvIHNtcC5jIGluIG9yZGVy
IHRvIHBsYWNlIHRoZQo+Pj4+PiBkZWNsYXJhdGlvbiBhbmQgdGhlIGFjY2Vzc29ycyBhcyBjbG9z
ZSBhcyBwb3NzaWJsZS4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+Pj4KPj4+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4KPj4+IFBpbmc/IFRoaXMgc2VlbXMgdG8gaGF2ZSB0
aGUgcmVxdWlyZWQgUkIsIGJ1dCBoYXNuJ3QgYmVlbiBjb21taXR0ZWQuCj4+Cj4+IFdoaWxlIGFz
IHBlciB0aGUgUi1iIHRoaXMgdGVjaG5pY2FsbHkgaXMgZmluZSwgSSBjb250aW51ZSB0byBiZQo+
PiB1bmNlcnRhaW4gd2hldGhlciB3ZSBhY3R1YWxseSB3YW50IHRvIGdvIHRoaXMgZmFyLgo+IAo+
IElmIHRoaXMgaGFkIGJlZW4gaW4gcGxhY2UgNTUwMGQyNjVhMmE4ZmE2ICgneDg2L3NtcDogdXNl
IEFQSUMgQUxMQlVUCj4gZGVzdGluYXRpb24gc2hvcnRoYW5kIHdoZW4gcG9zc2libGUnKSB3b3Vs
ZG4ndCBoYXZlIGludHJvZHVjZWQgYQo+IGJvZ3VzIHVzYWdlIG9mIHRoZSBzY3JhdGNoIHBlciBj
cHUgbWFzaywgYXMgdGhlIGNoZWNrIHdvdWxkIGhhdmUKPiB0cmlnZ2VyZWQuCj4gCj4gQWZ0ZXIg
ZmluZGluZyB0aGF0IG9uZSBvZiBteSBjb21taXRzIGludHJvZHVjZWQgYSBidWcgSSB1c3VhbGx5
IGRvIHRoZQo+IGV4ZXJjaXNlIG9mIHRyeWluZyB0byBmaWd1cmUgb3V0IHdoaWNoIGNoZWNrcyBv
ciBzYWZlZ3VhcmRzIHdvdWxkIGhhdmUKPiBwcmV2ZW50ZWQgaXQsIGFuZCBoZW5jZSBjYW1lIHVw
IHdpdGggdGhpcyBwYXRjaC4KPiAKPiBJIHdvdWxkIGFsc28gbGlrZSB0byBub3RlIHRoYXQgdGhp
cyBhZGRzIDAgb3ZlcmhlYWQgdG8gbm9uLWRlYnVnCj4gYnVpbGRzLgo+IAo+PiBBbmRyZXcsIGFz
Cj4+IHBlciBhIGRpc2N1c3Npb24gd2UgaGFkIHdoZW4gSSB3YXMgcG9uZGVyaW5nIHdoZXRoZXIg
dG8gY29tbWl0Cj4+IHRoaXMsIGFsc28gbG9va3MgdG8gaGF2ZSBzaW1pbGFyIGNvbmNlcm5zICh3
aGljaCBpaXJjIGhlIHNhaWQgaGUKPj4gaGFkIHZvaWNlZCBvbiBpcmMpLgo+IAo+IElzIHRoZSBj
b25jZXJuIG9ubHkgcmVsYXRlZCB0byB0aGUgZmFjdCB0aGF0IHlvdSBoYXZlIHRvIHVzZSB0aGUK
PiBnZXQvcHV0IGFjY2Vzc29ycyBhbmQgdGh1cyBtb3JlIGxpbmVzIG9mIGNvZGUgYXJlIGFkZGVk
LCBvciBpcyB0aGVyZQo+IHNvbWV0aGluZyBlbHNlPwoKQWZhaWMgLSBsYXJnZWx5IHRoaXMsIGFs
b25nIHdpdGggaXQgbWFraW5nIGl0IG1vcmUgbGlrZWx5IHRoYXQKZXJyb3IgcGF0aHMgd2lsbCBi
ZSBub24tdHJpdmlhbCAoYW5kIGhlbmNlIHBvc3NpYmx5IGdldCBjb252ZXJ0ZWQKdG8gdXNlIGdv
dG8tcykuIEkgY2FuJ3Qgc3BlYWsgZm9yIEFuZHJldywgb2YgY291cnNlLgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
