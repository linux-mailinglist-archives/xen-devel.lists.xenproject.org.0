Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC651733BD
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 10:22:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7bnY-0007Dc-Go; Fri, 28 Feb 2020 09:19:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7bnX-0007DS-9v
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 09:19:07 +0000
X-Inumbo-ID: 5e1fc070-5a0b-11ea-98da-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e1fc070-5a0b-11ea-98da-12813bfff9fa;
 Fri, 28 Feb 2020 09:19:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 71881AC4A;
 Fri, 28 Feb 2020 09:19:05 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200227184602.28282-1-andrew.cooper3@citrix.com>
 <7a55cd17-e006-ea81-0242-7a982aa89861@suse.com>
 <3c361cbd-06f3-9178-054b-131f91c28c72@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eb563b94-1ae1-8eae-0b2f-b5a135915e47@suse.com>
Date: Fri, 28 Feb 2020 10:19:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3c361cbd-06f3-9178-054b-131f91c28c72@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/grant: Fix signed/unsigned comparisons
 issues
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAxMDowOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEphbiwKPiAKPiBP
biAyOC8wMi8yMDIwIDA4OjQxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjcuMDIuMjAyMCAx
OTo0NiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IEVhY2ggZnVuY3Rpb24gdGFrZXMgYW4gdW5z
aWduZWQgY291bnQsIGFuZCBsb29wcyBiYXNlZCBvbiBhIHNpZ25lZCBpLiAgVGhpcwo+Pj4gY2F1
c2VzIHByb2JsZW1zIHdoZW4gYmV0d2VlbiAyIGFuZCA0IGJpbGxpb24gb3BlcmF0aW9ucyBhcmUg
cmVxdWVzdGVkLgo+Pgo+PiBJIGNhbiBzZWUgcHJvYmxlbXMsIGJ1dCBub3QgKGFzIHRoZSB0aXRs
ZSBzYXlzKSB3aXRoIGNvbXBhcmlzb24gaXNzdWVzCj4+ICh0aGUgc2lnbmVkIGkgZ2V0cyBjb252
ZXJ0ZWQgdG8gdW5zaWduZWQgZm9yIHRoZSBwdXJwb3NlIG9mIHRoZQo+PiBjb21wYXJpc29uKS4K
Pj4KPj4+IEluIHByYWN0aWNlLCBzaWduZWQtbmVzcyBpc3N1ZXMgYXJlbid0IHBvc3NpYmxlIGJl
Y2F1c2UgY291bnQgZXhjZWVkaW5nCj4+PiBJTlRfTUFYIGlzIGV4Y2x1ZGVkIGVhcmxpZXIgaW4g
ZG9fZ3JhbnRfb3AoKSwgYnV0IHRoZSBjb2RlIHJlYWRzIGFzIGlmIGl0IGlzCj4+PiBidWdneSwg
YW5kIEdDQyBvYnZpb3VzbHkgY2FuJ3Qgc3BvdCB0aGlzIGVpdGhlci4KPj4+Cj4+PiBCbG9hdC1v
LW1ldGVyIHJlcG9ydHM6Cj4+PiAgICBhZGQvcmVtb3ZlOiAwLzAgZ3Jvdy9zaHJpbms6IDAvNCB1
cC9kb3duOiAwLy05NSAoLTk1KQo+Pj4gICAgRnVuY3Rpb24gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgb2xkICAgICBuZXcgICBkZWx0YQo+Pj4gICAgZG9fZ3JhbnRfdGFibGVf
b3AgICAgICAgICAgICAgICAgICAgICAgICAgICA3MTU1ICAgIDcxNDAgICAgIC0xNQo+Pj4gICAg
Z250dGFiX3RyYW5zZmVyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAyNzMyICAgIDI3MTYg
ICAgIC0xNgo+Pj4gICAgZ250dGFiX3VubWFwX2dyYW50X3JlZiAgICAgICAgICAgICAgICAgICAg
ICAgNzcxICAgICA3MzkgICAgIC0zMgo+Pj4gICAgZ250dGFiX3VubWFwX2FuZF9yZXBsYWNlICAg
ICAgICAgICAgICAgICAgICAgNzcxICAgICA3MzkgICAgIC0zMgo+Pj4gICAgVG90YWw6IEJlZm9y
ZT0yOTk2MzY0LCBBZnRlcj0yOTk2MjY5LCBjaGcgLTAuMDAlCj4+Pgo+Pj4gYW5kIGluc3BlY3Rp
b24gb2YgZ250dGFiX3VubWFwX2dyYW50X3JlZigpIGF0IGxlYXN0IHJldmVhbHMgb25lIGZld2Vy
IGxvY2FsCj4+PiB2YXJpYWJsZXMgb24gdGhlIHN0YWNrLgo+Pgo+PiBUaGlzIGlzIGEgZ29vZCB0
aGluZyBmb3IgeDg2LiBIb3dldmVyLCBoYXZpbmcgc3RhcnRlZCB0byBmYW1pbGlhcml6ZQo+PiBt
eXNlbGYgYSB0aW55IGJpdCB3aXRoIFJJU0MtViwgSSdtIG5vIGxvbmdlciBjZXJ0YWluIG91ciBw
cmVzZW50IHdheQo+PiBvZiBwcmVmZXJyaW5nIHVuc2lnbmVkIGludCBmb3IgYXJyYXkgaW5kZXhp
bmcgdmFyaWFibGUgYW5kIGFsaWtlIGlzCj4+IGFjdHVhbGx5IGEgZ29vZCB0aGluZyB3aXRob3V0
IGZ1cnRoZXIgYWJzdHJhY3Rpb24uIE5ldmVydGhlbGVzcywgdGhpcwo+PiBpc24ndCBhbiBpbW1l
ZGlhdGUgaXNzdWUsIHNvIC4uLgo+IAo+IFdvdWxkIHlvdSBtaW5kIGV4cGFuZGluZyBhIGJpdCBt
b3JlIGFib3V0IHRoaXMgY29tbWVudCBoZXJlPyBIb3cgCj4gdW5zaWduZWQgaW50IGlzIGdvaW5n
IHRvIG1ha2UgdGhpbmdzIHdvcnNlIG9uIFJJU0MtVj8KCk90aGVyIHRoYW4geDg2LTY0IGFuZCBB
cm02NCwgNjQtYml0IChhbmQgd2lkZXIpIFJJU0MtViBzaWduLWV4dGVuZAp0aGUgcmVzdWx0IG9m
IDMyLWJpdCBvcGVyYXRpb25zIGJ5IGRlZmF1bHQuIEhlbmNlIGZvciBhbiB1bnNpZ25lZAozMi1i
aXQgdHlwZSB0byBiZSB1c2VkIGFzIGFycmF5IGluZGV4LCBhbiBhZGRpdGlvbmFsIHplcm8tZXh0
ZW5kaW5nCmluc24gaXMgZ29pbmcgdG8gYmUgbmVlZGVkIChqdXN0IGxpa2UgZm9yIG91ciBleGlz
dGluZyBwb3J0cyBhCnNpZ24tZXh0ZW5kaW5nIGluc24gaXMgbmVlZGVkIHdoZW4gYXJyYXkgaW5k
ZXhpbmcgdmFyaWFibGVzIGFyZQpjYWxjdWxhdGVkIGFzIDMyLWJpdCBzaWduZWQgcXVhbnRpdGll
cywgd2hpY2ggaXMgb25lIG9mIHRoZSByZWFzb25zCndoeSByaWdodCBub3cgd2UgcHJlZmVyIHVu
c2lnbmVkIGludCBpbiBzdWNoIGNhc2VzKS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
