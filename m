Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE34B10C3D2
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 07:02:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaCoR-0008Re-S3; Thu, 28 Nov 2019 05:57:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FMNu=ZU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iaCoQ-0008RZ-9g
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 05:57:58 +0000
X-Inumbo-ID: 05bb0034-11a4-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05bb0034-11a4-11ea-a55d-bc764e2007e4;
 Thu, 28 Nov 2019 05:57:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CBD2AAEEC;
 Thu, 28 Nov 2019 05:57:54 +0000 (UTC)
To: Hans van Kranenburg <hans@knorrie.org>,
 "Durrant, Paul" <pdurrant@amazon.com>, Ian Jackson <ian.jackson@citrix.com>
References: <20191126171747.3185988-1-george.dunlap@citrix.com>
 <20191126171747.3185988-2-george.dunlap@citrix.com>
 <24029.25218.75565.126333@mariner.uk.xensource.com>
 <c95b8096d1054d88bce16310aafe978a@EX13D32EUC003.ant.amazon.com>
 <24030.22924.67150.575753@mariner.uk.xensource.com>
 <19cdd60b0df341d38f94fa6433ef568c@EX13D32EUC003.ant.amazon.com>
 <bdbaf3d0-4b78-cbc9-3943-5bc4cfd7cb27@knorrie.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8649c91d-7896-283f-75c5-89dc577af7af@suse.com>
Date: Thu, 28 Nov 2019 06:57:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <bdbaf3d0-4b78-cbc9-3943-5bc4cfd7cb27@knorrie.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMTkgMjM6MzIsIEhhbnMgdmFuIEtyYW5lbmJ1cmcgd3JvdGU6Cj4gSGkgYWxsLAo+
IAo+IE9uIDExLzI3LzE5IDEyOjEzIFBNLCBEdXJyYW50LCBQYXVsIHdyb3RlOgo+Pj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBj
aXRyaXguY29tPgo+Pj4gU2VudDogMjcgTm92ZW1iZXIgMjAxOSAxMToxMAo+Pj4gWy4uLl0KPj4+
IFN1YmplY3Q6IFJFOiBbWGVuLWRldmVsXSBbUEFUQ0ggZm9yLTQuMTMgMi8yXSBSYXRpb25hbGl6
ZSBtYXhfZ3JhbnRfZnJhbWVzCj4+PiBhbmQgbWF4X21hcHRyYWNrX2ZyYW1lcyBoYW5kbGluZwo+
Pj4KPj4+IER1cnJhbnQsIFBhdWwgd3JpdGVzICgiUkU6IFtYZW4tZGV2ZWxdIFtQQVRDSCBmb3It
NC4xMyAyLzJdIFJhdGlvbmFsaXplCj4+PiBtYXhfZ3JhbnRfZnJhbWVzIGFuZCBtYXhfbWFwdHJh
Y2tfZnJhbWVzIGhhbmRsaW5nIik6Cj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+
Pj4+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5v
cmc+IE9uIEJlaGFsZiBPZgo+Pj4gSWFuCj4+Pj4+IEphY2tzb24KPj4+Pj4gSSBoYXZlIHNlZW4g
cmVwb3J0cyBvZiB1c2VycyB3aG8gcmFuIG91dCBvZiBncmFudC9tYXB0cmFjayBmcmFtZXMKPj4+
Pj4gYmVjYXVzZSBvZiB1cGRhdGVzIHRvIHVzZSBtdWx0aXJpbmcgcHJvdG9jb2xzIGV0Yy4gIFRo
ZSBlcnJvciBtZXNzYWdlcwo+Pj4+PiBhcmUgbm90IHZlcnkgZ29vZCBhbmQgdGhlIHJlY29tbWVu
ZGVkIHdvcmthcm91bmQgaGFzIGJlZW4gdG8gaW5jcmVhc2UKPj4+Pj4gdGhlIGRlZmF1bHQgbGlt
aXQgb24gdGhlIGh5cGVydmlzb3IgY29tbWFuZCBsaW5lLgo+Pj4+Pgo+Pj4+PiBJdCBpcyBpbXBv
cnRhbnQgdGhhdCB3ZSBkb24ndCBicmVhayB0aGF0IHdvcmthcm91bmQhCj4+Pj4KPj4+PiBBbGFz
IGl0IGhhcyBhcHBhcmVudGx5IGJlZW4gYnJva2VuIGZvciBzZXZlcmFsIHJlbGVhc2VzIG5vdyA6
LSgKPj4+Cj4+PiBJIGd1ZXNzIGF0IGxlYXN0IGluIERlYmlhbiAod2hlcmUgSSBoYXZlIHNlZW4g
dGhpcykgd2UgaGF2ZW4ndAo+Pj4gcmVsZWFzZWQgd2l0aCBhbnkgYWZmZWN0ZWQgdmVyc2lvbnMg
eWV0Li4uCj4+Cj4+IEkgYmVsaWV2ZSB0aGUgcHJvYmxlbSB3YXMgaW50cm9kdWNlIGluIDQuMTAs
IHNvIEkgdGhpbmsgaXQgd291bGQgYmUgcHJ1ZGVudCB0byBhbHNvIGJhY2stcG9ydCB0aGUgZmlu
YWwgZml4IHRvIHN0YWJsZSB0cmVlcyBmcm9tIHRoZW4gb24uCj4gCj4gWWVzLCB0aGUgbWF4IGdy
YW50IGZyYW1lIGlzc3VlIGhhcyBoaXN0b3JpY2FsbHkgYWx3YXlzIGJlZW4gYSBwYWluZnVsCj4g
ZXhwZXJpZW5jZSBmb3IgZW5kIHVzZXJzLCBhbmQgWGVuIDQuMTEgd2hpY2ggd2Ugbm93IGhhdmUg
aW4gdGhlIGN1cnJlbnQKPiBEZWJpYW4gc3RhYmxlIGhhcyBtYWRlIGl0IHdvcnNlIGNvbXBhcmVk
IHRvIHByZXZpb3VzIHZlcnNpb25zIGluZGVlZC4KPiAKPiBDaGFuZ2luZyB0aGUgaHlwZXJ2aXNv
ciBjb21tYW5kIGxpbmUgd29ya2VkIGluIHRoZSBwYXN0LCBhbmQgbm93IHRoYXQKPiB2YWx1ZSBp
cyBvdmVyd3JpdHRlbiBhZ2FpbiBieSBhIGxvd2VyIHZhbHVlIGluIHRoZSB0b29sc3RhY2ssIHdo
aWNoCj4gcmVxdWlyZXMgc2V0dGluZyBwZXItZG9tVSBzZXR0aW5ncywgb3IsIHdoYXQgSSBkaWQs
IGp1c3QgYWRkaXRpb25hbGx5Cj4gYWxzbyBzZXR0aW5nIG1heF9ncmFudF9mcmFtZXMgaW4gL2V0
Yy94ZW4veGwuY29uZiB0byB0aGUgc2FtZSB2YWx1ZSBhcwo+IHRoZSBoeXBlcnZpc29yIGNvbW1h
bmQgbGluZS4KPiAKPiBUaGlzIGNoYW5nZSBpcyB2ZXJ5IHdlbGNvbWUsIGV2ZW4gdG8gNC4xMS1z
dGFibGUgaWYgcG9zc2libGUsIHNpbmNlIGl0Cj4gd2lsbCBub3QgYnJlYWsgZXhpc3RpbmcgY29u
ZmlndXJhdGlvbiBvZiB1c2Vycy4KPiAKPiBJZiBjaGFuZ2luZyBvbmx5IHRoZSB2YWx1ZSBvZiB0
aGUgaHlwZXJ2aXNvciBjb21tYW5kIGxpbmUgd29ya3MgYWdhaW4sCj4gdGhlbiBvbGQgaW5mb3Jt
YXRpb24gdGhhdCBzaG93cyB1cCB3aGVuIHRoZSB1c2VycyBzZWFyY2hlcyB0aGUgd2ViIHdpbGwK
PiBiZSB1c2VmdWwgYWdhaW4sIHdoaWNoIGlzIGdvb2QuCj4gCj4gSGFucwo+IAo+IFAuUy4gTm93
IEknbSBjdXJpb3VzIHRvIGZpZ3VyZSBvdXQgd2hhdCBhIG1hcHRyYWNrIGZyYW1lIGlzLCBkaWRu
J3QgaGVhcgo+IGFib3V0IHRoYXQgb25lIGJlZm9yZS4KClRoZSBtYXB0cmFjayBmcmFtZXMgYXJl
IHVzZWQgYnkgdGhlIGh5cGVydmlzb3IgZm9yIGtlZXBpbmcgdHJhY2sgd2hpY2gKZ3JhbnRzIGFy
ZSBtYXBwZWQgYnkgYSBzcGVjaWZpYyBkb21haW4uIFNvIHRoZXkgYXJlIG5lY2Vzc2FyeSBmb3Ig
ZHJpdmVyCmRvbWFpbnMgKGluY2x1ZGluZyBkb20wKSwgYW5kIG1heF9tYXB0cmFja19mcmFtZXMg
bGltaXRzIGhvdyBtYW55Cm1hcHBpbmdzIG9mIG90aGVyIGRvbWFpbidzIHBhZ2VzIGNhbiBiZSBh
Y3RpdmUgc2ltdWx0YW5lb3VzbHkgaW4gYQpkb21haW4uCgoKSnVlcmdlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
