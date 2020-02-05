Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB12153209
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 14:39:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izKqm-0007Qu-7O; Wed, 05 Feb 2020 13:36:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izKqk-0007Qm-V8
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 13:36:14 +0000
X-Inumbo-ID: 7a619f84-481c-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a619f84-481c-11ea-8396-bc764e2007e4;
 Wed, 05 Feb 2020 13:36:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 45E9FAD11;
 Wed,  5 Feb 2020 13:36:13 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200204133357.32101-1-julien@xen.org>
 <c24750e9-427b-1208-d220-f5c06e543966@suse.com>
 <3199dd4d-1b3e-4ba8-9f76-6a6ed0c7c067@xen.org>
 <93abbe1a-d6f5-1322-f1a2-5f0fa3393de8@suse.com>
 <55b1a771-04df-03ac-9ff5-e3d69e29101b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ef6b6b47-e7a8-f465-825c-960c0639e5c8@suse.com>
Date: Wed, 5 Feb 2020 14:36:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <55b1a771-04df-03ac-9ff5-e3d69e29101b@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/mm: Avoid assuming PG_state_inuse == 0
 in assign_pages()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDIuMjAyMCAxMjoyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEphbiwKPiAKPiBP
biAwNC8wMi8yMDIwIDE1OjEzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDQuMDIuMjAyMCAx
NDo1MSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAwNC8wMi8yMDIwIDEzOjQw
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwNC4wMi4yMDIwIDE0OjMzLCBKdWxpZW4gR3Jh
bGwgd3JvdGU6Cj4+Pj4+IEF0IHRoZSBtb21lbnQsIGFzc2lnbl9wYWdlcygpIHJlbGllcyBvbiBQ
R19zdGF0ZV9pbnVzZSB0byBiZSAwLiBUaGlzCj4+Pj4+IG1ha2VzIHRoZSBjb2RlIHNsaWdodGx5
IG1vcmUgZGlmZmljdWx0IHRvIHVuZGVyc3RhbmQuCj4+Pj4KPj4+PiBJIGNhbiBjZXJ0YWlubHkg
c2VlIHdoZXJlIHlvdSdyZSBjb21pbmcgZnJvbSwgYnV0IC4uLgo+Pj4+Cj4+Pj4+IC0tLSBhL3hl
bi9jb21tb24vcGFnZV9hbGxvYy5jCj4+Pj4+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5j
Cj4+Pj4+IEBAIC0yMjg2LDEwICsyMjg2LDExIEBAIGludCBhc3NpZ25fcGFnZXMoCj4+Pj4+ICAg
ICAgICBmb3IgKCBpID0gMDsgaSA8ICgxIDw8IG9yZGVyKTsgaSsrICkKPj4+Pj4gICAgICAgIHsK
Pj4+Pj4gICAgICAgICAgICBBU1NFUlQocGFnZV9nZXRfb3duZXIoJnBnW2ldKSA9PSBOVUxMKTsK
Pj4+Pj4gLSAgICAgICAgQVNTRVJUKCFwZ1tpXS5jb3VudF9pbmZvKTsKPj4+Pj4gKyAgICAgICAg
QVNTRVJUKHBhZ2Vfc3RhdGVfaXMoJnBnW2ldLCBpbnVzZSkpOwo+Pj4+PiArICAgICAgICBBU1NF
UlQoIShwZ1tpXS5jb3VudF9pbmZvICYgKH5QR0Nfc3RhdGUpKSk7Cj4+Pj4KPj4+PiAuLi4gSSB0
aGluayB0aGlzIG9uZSBpcyBiZXR0ZXIgaW4gaXRzIG9yaWdpbmFsIGZvcm0uIEFuIG9wdGlvbgo+
Pj4+IG1pZ2h0IGJlIHRvIHB1dCBhIEJVSUxEX0JVR19PTigpIG5leHQgdG8gaXQuCj4+Pgo+Pj4g
SSB3YW50IHRvIGF2b2lkIGEgQlVJTERfQlVHX09OKCkgaWYgcG9zc2libGUuIEkganVzdCByZWFs
aXplZCwgSSBjb3VsZAo+Pj4gc2ltcGxpZnkgdG8gIihwZ1tpXS5jb3VudF9pbmZvICE9IFBHQ19z
dGF0ZV9pbnVzZSkiLgo+Pj4KPj4+IFdvdWxkIHRoYXQgYmUgbW9yZSBzdWl0YWJsZT8KPj4KPj4g
WWVzLCBjZXJ0YWlubHkuCj4+Cj4+IEhvd2V2ZXIsIGlzbid0IHRoZSBBU1NFUlQoKSBpdHNlbGYg
d3Jvbmc/IFdlIGRvbid0IGhvbGQgdGhlIGhlYXAgbG9jawo+PiBoZXJlLCBzbyBtYXJrX3BhZ2Vf
b2ZmbGluZSgpIGNvdWxkIHRyYW5zaXRpb24gdGhlIHBhZ2UgZnJvbSBpbnVzZSB0bwo+PiBvZmZs
aW5pbmcgKGFuZCBwb3NzaWJseSBhbHNvIHNldCBQR0NfYnJva2VuIG9uIGl0KSBhdCBhbnkgcG9p
bnQgaW4KPj4gdGltZS4gVGhpcyB3YXNuJ3Qgb2J2aW91cyB3aXRob3V0IHRoZSB0d28gUEdDX2lu
dXNlIHVzZXMgeW91IGFkZCwgYnV0Cj4+IGJlY29tZXMgcHJldHR5IGFwcGFyZW50IHdpdGggdGhl
bS4gT2YgY291cnNlIHRoZSBzaW1wbGUgYXNzaWdubWVudAo+PiB0aGF0IHlvdSBhZGp1c3QgZnVy
dGhlciBkb3duIHRoZW4gYWxzbyBjYW4ndCBiZSBhIHNpbXBsZSBhc3NpZ25tZW50Cj4+IGFueW1v
cmUuCj4gCj4gWW91IGFyZSByaWdodCwgYXNzaWduX3BhZ2VzKCkgY291bGQgcmFjZSB3aXRoIG1h
cmtfcGFnZV9vZmZsaW5lKCkuIFdlIAo+IHdvdWxkIG5lZWQgdG8gdXNlIGEgY21weGNoZygpIGxv
b3AgdG8gY2hhbmdlIHR5cGUuIElmIG9uZSBvZiB0aGUgcGFnZSBpcyAKPiBnZXR0aW5nIG9mZmxp
bmVkLCB0aGVuIHdlIHdvdWxkIG5lZWQgdG8gcmV2ZXJ0IGFsbCB0aGUgY2hhbmdlcyBhbmQgCj4g
cmV0dXJuIGFuIGVycm9yLgoKSSdtIG5vdCBzdXJlIHdlIG5lZWQgdG8gZ28gdGhpcyBmYXIuIFRo
ZSBjaGFuZ2Ugb2YgcGFnZSBzdGF0ZQpoYXBwZW5pbmcgYmVoaW5kIGFzc2lnbl9wYWdlcygpJyBi
YWNrIGlzIG5vIGRpZmZlcmVudCBmcm9tIGl0CmhhcHBlbmluZyBhZnRlciBhc3NpZ25fcGFnZXMo
KSBpcyBkb25lLiBBbGwgd2UgbmVlZCB0byBtYWtlIHN1cmUgaXMKdGhhdCB3ZSBkb24ndCBjbG9i
YmVyIHRoZSBzdGF0ZSBjaGFuZ2UuCgpJJ20gYWxzbyBub3Qgc3VyZSBhIGNtcHhjaGcgbG9vcCBp
cyBuZWVkZWQgaGVyZS4gQWNxdWlyaW5nIGFuZApyZWxlYXNpbmcgdGhlIGhlYXAgbG9jayBtYXkg
ZG8sIHRvby4gWW91J2xsIGZpbmQgYW4gZXhhbXBsZSBvZiB0aGlzCmVsc2V3aGVyZSBpbiB0aGUg
c2FtZSBmaWxlLCBpaXJjLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
