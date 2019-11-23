Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4A3107D3E
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2019 07:00:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYOQi-0000L7-0Q; Sat, 23 Nov 2019 05:58:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iYOQg-0000L1-SG
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2019 05:57:58 +0000
X-Inumbo-ID: 32f9aa2e-0db6-11ea-a370-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32f9aa2e-0db6-11ea-a370-12813bfff9fa;
 Sat, 23 Nov 2019 05:57:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 99659AD3A;
 Sat, 23 Nov 2019 05:57:57 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20191122185202.1375312-1-george.dunlap@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7cc24144-b3eb-8da2-1c4d-c9368f925415@suse.com>
Date: Sat, 23 Nov 2019 06:57:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191122185202.1375312-1-george.dunlap@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/mm: Adjust linear uses / entries when a
 page loses validation
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMTEuMTkgMTk6NTIsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gIkxpbmVhciBwYWdldGFi
bGVzIiBpcyBhIHRlY2huaXF1ZSB3aGljaCBpbnZvbHZlcyBlaXRoZXIgcG9pbnRpbmcgYQo+IHBh
Z2V0YWJsZSBhdCBpdHNlbGYsIG9yIHRvIGFub3RoZXIgcGFnZXRhYmxlIHRoZSBzYW1lIG9yIGhp
Z2hlciBsZXZlbC4KPiBYZW4gaGFzIGxpbWl0ZWQgc3VwcG9ydCBmb3IgbGluZWFyIHBhZ2V0YWJs
ZXM6IEEgcGFnZSBtYXkgZWl0aGVyIHBvaW50Cj4gdG8gaXRzZWxmLCBvciBwb2ludCB0byBhbm90
aGVyIHBhZ2Ugb2YgdGhlIHNhbWUgbGV2ZWwgKGkuZS4sIEwyIHRvIEwyLAo+IEwzIHRvIEwzLCBh
bmQgc28gb24pLgo+IAo+IFhTQS0yNDAgaW50cm9kdWNlZCBhbiBhZGRpdGlvbmFsIHJlc3RyaWN0
aW9uIHRoYXQgbGltaXRlZCB0aGUgImRlcHRoIgo+IG9mIHN1Y2ggY2hhaW5zIGJ5IGFsbG93aW5n
IHBhZ2VzIHRvIGVpdGhlciAqcG9pbnQgdG8qIG90aGVyIHBhZ2VzIG9mCj4gdGhlIHNhbWUgbGV2
ZWwsIG9yICpiZSBwb2ludGVkIHRvKiBieSBvdGhlciBwYWdlcyBvZiB0aGUgc2FtZSBsZXZlbCwK
PiBidXQgbm90IGJvdGguICBUbyBpbXBsZW1lbnQgdGhpcywgd2Uga2VlcCB0cmFjayBvZiB0aGUg
bnVtYmVyIG9mCj4gb3V0c3RhbmRpbmcgdGltZXMgYSBwYWdlIHBvaW50cyB0byBvciBpcyBwb2lu
dGVkIHRvIGFub3RoZXIgcGFnZQo+IHRhYmxlLCB0byBwcmV2ZW50IGJvdGggZnJvbSBoYXBwZW5p
bmcgYXQgdGhlIHNhbWUgdGltZS4KPiAKPiBBZGRpdGlvbmFsbHksIFhTQS0yOTkgaW50cm9kdWNl
ZCBhIG1vZGUgd2hlcmVieSBpZiBhIHBhZ2Ugd2FzIGtub3duIHRvCj4gaGF2ZSBiZWVuIG9ubHkg
cGFydGlhbGx5IHZhbGlkYXRlZCwgX3B1dF9wYWdlX3R5cGUoKSB3b3VsZCBiZSBjYWxsZWQKPiB3
aXRoIFBURl9wYXJ0aWFsX3NldCwgaW5kaWNhdGluZyB0aGF0IGlmIHRoZSBwYWdlIGhhZCBiZWVu
Cj4gZGUtdmFsaWRhdGVkIGJ5IHNvbWVvbmUgZWxzZSwgdGhlIHR5cGUgY291bnQgc2hvdWxkIGJl
IGxlZnQgYWxvbmUuCj4gCj4gVW5mb3J0dW5hdGVseSwgdGhpcyBjaGFuZ2UgZGlkIG5vdCBhY2Nv
dW50IGZvciB0aGUgcmVxdWlyZWQgYWNjb3VudGluZwo+IGZvciBsaW5lYXIgcGFnZSB0YWJsZSB1
c2VzIGFuZCBlbnRyaWVzOyBpbiB0aGUgY2FzZSB0aGF0IGEgcHJldmlvdXNseQo+IHBhcnRpYWxs
eS1kZXZhbGlkYXRlZCBwYWdldGFibGUgd2FzIGZ1bGx5LWRldmFsaWRhdGVkIGJ5IHNvbWVvbmUg
ZWxzZSwKPiB0aGUgbGluZWFyX3B0X2NvdW50cyBhcmUgbm90IHVwZGF0ZWQuCj4gCj4gVGhpcyBj
b3VsZCBoYXBwZW4gaW4gb25lIG9mIHR3byBwbGFjZXM6Cj4gCj4gMS4gSW4gdGhlIGNhc2UgYSBw
YXJ0aWFsbHktZGV2YWxpZGF0ZWQgcGFnZSB3YXMgcmUtdmFsaWRhdGVkIGJ5Cj4gc29tZW9uZSBl
bHNlCj4gCj4gMi4gRHVyaW5nIGRvbWFpbiB0ZWFyLWRvd24sIHdoZW4gcGFnZXMgYXJlIGZvcmNl
LWludmFsaWRhdGVkIHdoaWxlCj4gbGVhdmluZyB0aGUgdHlwZSBjb3VudCBpbnRhY3QuCj4gCj4g
VGhlIHNlY29uZCBjb3VsZCBiZSBpZ25vcmVkLCBzaW5jZSBhdCB0aGF0IHBvaW50IHRoZSBwYWdl
cyBjYW4gbm8KPiBsb25nZXIgYmUgYWJ1c2VkOyBidXQgdGhlIGZpcnN0IHJlcXVpcmVzIGhhbmRs
aW5nLiAgTm90ZSBob3dldmVyIHRoYXQKPiB0aGlzIHdvdWxkIG5vdCBiZSBhIHNlY3VyaXR5IGlz
c3VlOiBoYXZpbmcgdGhlIGNvdW50cyBiZSB0b28gaGlnaCBpcwo+IG92ZXJseSBzdHJpY3QgKGku
ZS4sIHdpbGwgcHJldmVudCBhIHBhZ2UgZnJvbSBiZWluZyB1c2VkIGluIGEgd2F5Cj4gd2hpY2gg
aXMgcGVyZmVjdGx5IHNhZmUpLCBidXQgc2hvdWxkbid0IGNhdXNlIGFueSBvdGhlciBpc3N1ZXMu
Cj4gCj4gRml4IHRoaXMgYnkgYWRqdXN0aW5nIHRoZSBsaW5lYXIgY291bnRzIHdoZW4gYSBwYWdl
IGxvc2VzIHZhbGlkYXRpb24sCj4gcmVnYXJkbGVzcyBvZiB3aGV0aGVyIHRoZSBkZS12YWxpZGF0
aW9uIGNvbXBsZXRlZCBvciB3YXMgb25seSBwYXJ0aWFsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdl
b3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
