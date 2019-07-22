Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8EC6FFB1
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 14:32:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpXRp-0003VB-HI; Mon, 22 Jul 2019 12:29:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpXRn-0003V6-7p
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 12:29:43 +0000
X-Inumbo-ID: 610db626-ac7c-11e9-a393-7f788710b90e
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 610db626-ac7c-11e9-a393-7f788710b90e;
 Mon, 22 Jul 2019 12:29:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30BA0344;
 Mon, 22 Jul 2019 05:29:41 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B321B3F71A;
 Mon, 22 Jul 2019 05:29:39 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <1563469897-2773-1-git-send-email-andrii.anisov@gmail.com>
 <2d71f4c0-023f-7a09-731e-e84e21378e26@suse.com>
 <261e0c5e-a886-f389-3c37-413613c9bf4f@gmail.com>
 <a4877031-1abd-e683-aae9-5d8ce5df98b5@suse.com>
 <7ddef8b7-ec79-d7ce-4123-31ae63a5e7b3@arm.com>
 <35df7b4d-068d-15d3-2197-d5a6dee23917@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6e608435-a414-320b-307a-a413c82cf9aa@arm.com>
Date: Mon, 22 Jul 2019 13:29:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <35df7b4d-068d-15d3-2197-d5a6dee23917@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] vunmap: let vunmap align virtual address by
 itself
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Andrii Anisov <andrii.anisov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMi8wNy8yMDE5IDEzOjExLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyMi4wNy4y
MDE5IDE0OjAyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uIDIyLzA3LzIwMTkgMTE6MjMsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMjIuMDcuMjAxOSAxMTozMCwgQW5kcmlpIEFuaXNvdiB3
cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4gT24gMTkuMDcuMTkgMTI6MzcsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+PiBPbiAxOC4wNy4yMDE5IDE5OjExLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+Pj4+Pj4g
TGV0IHZ1bm1hcCBhbGlnbiBwYXNzZWQgdmlydHVhbCBhZGRyZXNzIGJ5IFBBR0VfU0laRS4KPj4+
Pj4KPj4+Pj4gRGVzcGl0ZSBzZWVpbmcgQW5kcmV3J3MgUi1iIHlvdSd2ZSBhbHJlYWR5IGdvdCBJ
J2QgbGlrZSB0byBwb2ludCBvdXQKPj4+Pj4gdGhhdCB0aGlzIGluY3JlYXNlcyB0aGUgcmlzayBv
ZiBzb21lIGNvZGUgcGFzc2luZyB0aGUgd3JvbmcgcG9pbnRlcgo+Pj4+PiBpbnRvIGhlcmUuIHss
dW59bWFwX2RvbWFpbl9wYWdlKCkgYWN0IG9uIHNpbmdsZSBwYWdlcyBvbmx5LCBzbyB0aGVyZSdz
Cj4+Pj4+IG5vIGFtYmlndWl0eS4gV2hlbiB0YWxraW5nIGFib3V0IG11bHRpLXBhZ2UgcmVnaW9u
cyB0aG91Z2gsIG5vdCB1bmRvaW5nCj4+Pj4+IGFyaXRobWV0aWMgcHJldmlvdXNseSBkb25lIG1h
eSBtZWFuIGFjdHVhbGx5IHBvaW50aW5nIGF0IG90aGVyIHRoYW4gdGhlCj4+Pj4+IGZpcnN0IHBh
Z2Ugb2YgdGhlIG1hcHBpbmcuCj4+Pj4KPj4+PiBXZWxsLCB3aGF0IHdlIGFyZSBtb3ZpbmcgaW50
byB2dW5tYXAoKSwgaXMgYSBwYWdlIGFsaWdubWVudCBvbmx5LiBJdCBjYW4ndCBzYXZlIHVzIGZy
b20gdGhlIHdyb25nIHBvaW50ZXIsIGV2ZW4gaWYgaXQgaXMgZG9uZSBvdXRzaWRlIHRoZSB2dW5t
YXAoKS4KPj4+Pgo+Pj4+Pj4gV2l0aCB0aGUgbWFpbiBjaGFuZ2UsIGFsc286Cj4+Pj4+PiAgwqDC
oMKgIC0gc3RyaXAgYWxsIGV4aXN0aW5nIHZ1bm1hcCgpIGNhbGxzIGZyb20gcHJpb3IgbWFza2lu
Zwo+Pj4+Pgo+Pj4+PiBfSWZfIHdlIGFyZSB0byBnbyB0aGlzIHJvdXRlLCB0aGVuIHVubWFwX2Rv
bWFpbl9wYWdlX2dsb2JhbCgpCj4+Pj4+IGNhbGxlcnMgc2hvdWxkIGFsc28gYmUgYWRqdXN0ZWQu
IFRoZXJlLCBhcyBmb3IgdW5tYXBfZG9tYWluX3BhZ2UoKSwKPj4+Pj4gSSBhZ3JlZSBpdCB3b3Vs
ZCBtYWtlIHNlbnNlIHRvIGJlIG1vcmUgdG9sZXJhbnQuCj4+Pj4KPj4+PiBJJ3ZlIGZvdW5kIHR3
byBwYWdlIGFsaWdubWVudHMgcHJpb3IgdG8gYHVubWFwX2RvbWFpbl9wYWdlX2dsb2JhbCgpYCBj
YWxsLiBTaG91bGQgSSB3aXBlIHRoZW0gaW4gdGhpcyBwYXRjaCwgb3IgaW4gc2VwYXJhdGU/Cj4+
Pgo+Pj4gSWYgd2UncmUgdG8gZ28gdGhlIHN1Z2dlc3RlZCByb3V0ZSB0aGVuIGl0IG1pZ2h0IG5v
dCBtYXR0ZXIgbXVjaC4KPj4+IEFzIEknbSBub3QgZW50aXJlbHkgY2VydGFpbiB5ZXQgdGhhdCB3
ZSB3aWxsLCBtYWtpbmcgdGhpcyBhIHByZXJlcQo+Pj4gb25lIGRlYWxpbmcgd2l0aCB0aGUgYWxp
Z25tZW50IGluIHVubWFwX2RvbWFpbl9wYWdlX2dsb2JhbCgpIG1pZ2h0Cj4+PiBiZSBiZXR0ZXIu
IFlvdXIgZXhpc3RpbmcgcGF0Y2ggd291bGQgdGhlbiBmdXJ0aGVyIHNoaWZ0IHRoaXMgaW50bwo+
Pj4gdnVubWFwKCkuCj4+Cj4+IEkgdGhpbmsgYWxsb3dpbmcgdnVubWFwIHRvIGRlYWwgd2l0aCB1
bmFsaWduZWQgYWRkcmVzcyBjb3VsZCBzaW1wbGlmeSBzb21lIG9mIHRoZSBjYWxsZXJzLiBQYXNz
aW5nIHRoZSB3cm9uZyBwYWdlLWFsaWduZWQgcG9pbnRlciBpcyBsZXNzIGNyaXRpY2FsIHRoYW4g
cGFzc2luZyBhbiB1bmFsaWduZWQgYWRkcmVzcy4KPj4KPj4gVGhlIGxhdHRlciBtYXkgcmVzdWx0
IGluIG1pc2JlaGF2aW5nIGNvZGUuCj4gCj4gV2h5IG9ubHkgdGhlIGxhdHRlcj8KPiAKPj4gVGhl
IHZtYXAgd2lsbCBlbmQtdXAgdG8gbm90IGJlIHN5bmMgd2l0aCB0aGUgcGFnZS10YWJsZSBhcyB3
ZSBhc3N1bWUKPj4gcGFnZS10YWJsZSB1cGRhdGUgY2Fubm90IGZhaWwgKHRoaXMgcHJvYmFibHkg
c2hvdWxkIGJlIGNoYW5nZWQpLiBPbgo+PiBBcm0sIHRoaXMgd2lsbCByZXN1bHQgdG8gYW55IG5l
dyB2bWFwIGZ1bmN0aW9uIHRvIGxpa2VseSBmYWlsICh3ZQo+PiBkb24ndCBhbGxvdyByZXBsYWNl
IGFuIGV4aXN0aW5nIHZhbGlkIHBhZ2UtdGFibGUgZW50cnkpLgo+Pgo+PiBJSVVDIHRoZSBjb2Rl
LCB0aGUgZm9ybWVyIHdpbGwgcmVzdWx0IHRvIG9ubHkgdW5tYXBwaW5nIHNvbWUgcGFydCBvZgo+
PiB0aGUgdm1hcC4KPiAKPiBBSVVJIHRoZSB1bm1hcCByZXF1ZXN0IHdpbGwgc2ltcGx5IGZhaWw6
IHZtX2luZGV4KCkgYW5kIGhlbmNlIHZtX3NpemUoKQo+IHdpbGwgc2ltcGx5IHJldHVybiAwLiBI
ZW5jZSwgd2l0aCB2dW5tYXAoKSBub3QgaXRzZWxmIHJldHVybmluZyBhbnkKPiBlcnJvciwgdGhl
cmUnbGwgYmUgYSBzaWxlbnQgbGVhayBvZiBtYXBwaW5ncy4KCkhtbW0sIEkgbWlzcmVhZCB0aGUg
cmVhZC4gdm1faW5kZXgoKSB3aWxsIGluZGVlZCByZXR1cm4gMCBpbiB0aGF0IGNhc2UuIEJ1dCwg
CnRoaXMgd2lsbCBub3Qgc2lsZW50bHkgbGVhayB0aGUgbWFwcGluZ3MgdGhhbmtzIHRvIHRoZSBX
QVJOX09OKCkgaW4gdGhlIGNvZGUuCgpIb3dldmVyLCBldmVuIGlmIHRoZXJlIGFyZSBhIGxlYWss
IHRoZSB2bWFwIGFuZCBwYWdlLXRhYmxlIHdpbGwgc3RheSBpbiBzeW5jLiBTbyAKdGhpcyBpcyBu
b3QgYXMgYmFkIGFzIHRoZSB1bmFsaWduZWQgY2FzZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
