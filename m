Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B502D114EEE
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 11:19:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idAgH-000368-Tm; Fri, 06 Dec 2019 10:17:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1idAgG-00035y-DX
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 10:17:48 +0000
X-Inumbo-ID: a66a88c4-1811-11ea-b4e9-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a66a88c4-1811-11ea-b4e9-bc764e2007e4;
 Fri, 06 Dec 2019 10:17:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E5D97B2B3;
 Fri,  6 Dec 2019 10:17:46 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
 <36c45366-35e2-68a9-fbc7-01fd935bf720@suse.com>
 <62e68657-dd09-85ea-662b-0f54688ed93a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d83a00c5-77ca-0c8e-71f7-5e67bd0aec24@suse.com>
Date: Fri, 6 Dec 2019 11:18:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <62e68657-dd09-85ea-662b-0f54688ed93a@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/6] xen: Support continuations from tasklets
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTIuMjAxOSAxMToxNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNi8xMi8yMDE5
IDA5OjU4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDUuMTIuMjAxOSAyMzozMCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IEZyb20gdGVzdGluZyB0aGlzIHNlcmllcywgSSBoYXZlIHJlLWNv
bmZpcm1lZCB0aGUgcHJldmlvdXMgcmVwb3J0ZWQKPj4+IG9ic2VydmF0aW9uIHRoYXQ6Cj4+Pgo+
Pj4gICAjIHdoaWxlIDo7IGRvIHhlbi1ocHRvb2wgc210LWVuYWJsZTsgeGVuLWhwdG9vbCBzbXQt
ZGlzYWJsZTsgZG9uZQo+Pj4KPj4+IGluIGRvbTAgZXZlbnR1YWxseSBjYXVzZXMgdGhlIHNlcmlh
bCBjb25zb2xlIHRvIGNlYXNlIHdvcmtpbmcgKHdlZGdlIG1pZHdheQo+Pj4gdGhyb3VnaCBwcmlu
dGluZyBhIGxpbmUpLgo+Pj4KPj4+IFRoZXJlIGFyZSBzcG9yYWRpYyAiQnJva2UgYWZmaW5pdHkg
Zm9yIElSUTI2LCBuZXc6IGZmZmYiIG1lc3NhZ2VzLCBidXQgdGhlCj4+PiBzZXJpYWwgYWx3YXlz
IHNlZW1zIHRvIGJyZWFrIHNob3J0bHkgYWZ0ZXIgdGhlIGZpcnN0ICJCcm9rZSBhZmZpbml0eSBm
b3IKPj4+IElSUTMwLCBuZXc6IGZmZmYiLiAgQm90aCBJUlFzIGFyZSBub24tZGVzY3JpcHQgUENJ
LU1TSS8tWCBpbnRlcnJ1cHRzIGJvdW5kIHRvCj4+PiBkb20wLgo+PiBBbmQgbmVpdGhlciBJUlEz
MCBub3QgSVJRMjYgYXJlIHRoZSBzZXJpYWwgb25lcz8gQW5kIHNlcmlhbCBkb2VzCj4+IHVzZSBh
biBJUlEgKGkuZS4gaXNuJ3QgcnVubmluZyBpbiBwb2xsaW5nIG1vZGUpPyBJJ2xsIHNlZSBpZiBJ
Cj4+IGNhbiByZXBybyAoYW5kIHRoZW4gbWF5YmUgYmUgYWJsZSB0byBkZWJ1ZykuCj4gCj4gU2Vy
aWFsIHVzZXMgSVJRMCBhbmQgbmV2ZXIgaGFzIGFmZmluaXR5IGNoYW5nZXMgYXMgaXQgaXMgYWx3
YXlzIGJvdW5kIHRvCj4gQ1BVMC4KCklSUTA/IERZTSBJUlEzIG9yIElSUTQ/IChJbiBhbnkgZXZl
bnQgdGhlIGltcG9ydGFudCBwYXJ0IGlzIGZvciBpdAp0byBiZSBpbiB0aGUgSVNBIHJhbmdlLCBy
YXRoZXIgdGhhbiB0aGUgUENJIG9uZS4pCgo+IEdpdmVuIG91ciByZWNlbnQgZnVuIHdpdGggdGhl
IFBFT0kgc3RhY2ssIHRoYXQgd2FzIGdvaW5nIHRvIGJlIG15IG5leHQKPiBwb3J0IG9mIGNhbGwu
wqAgSG93ZXZlciBldmVyeXRoaW5nIGVsc2UgaW4gdGhlIHN5c3RlbSBsb29rcyB0byBiZSB3b3Jr
aW5nCj4gZmluZSwgaW5jbHVkaW5nIHRoZSBkaXNrcyBhbmQgbmV0d29yaywgc3VnZ2VzdGluZyB0
aGF0IHdlIGFyZW4ndCBsb3NpbmcKPiBvdGhlciBpbnRlcnJ1cHRzLgoKVGhlIGhpZ2ggcHJpb3Jp
dHkgdmVjdG9yIHdlIHVzZSBmb3Igc2VyaWFsIG1ha2VzIHRoZSBQRU9JIHN0YWNrCnVucmVsYXRl
ZCBhZmFpY3QsIGFzIG1lbnRpb25lZCBpbiB0aGUgZGlzY3Vzc2lvbiB0aGVyZSBhcyB3ZWxsLgoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
