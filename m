Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA2517B837
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 09:17:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jA88p-0005MS-FX; Fri, 06 Mar 2020 08:15:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D+BG=4X=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jA88o-0005MK-C4
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 08:15:30 +0000
X-Inumbo-ID: a3d15bd4-5f82-11ea-b74d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3d15bd4-5f82-11ea-b74d-bc764e2007e4;
 Fri, 06 Mar 2020 08:15:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 302B6ACCE;
 Fri,  6 Mar 2020 08:15:28 +0000 (UTC)
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
References: <20200213125449.14226-1-jgross@suse.com>
 <20200213125449.14226-5-jgross@suse.com>
 <6f6bf0ce-045f-6c6c-fd98-bba72bcf89d1@suse.com>
 <c9a90a26-b318-b93a-90fd-6df8292b3b55@suse.com>
Message-ID: <22d6b3b2-69d1-d1d9-ba4d-a2db3d7dfb5c@suse.com>
Date: Fri, 6 Mar 2020 09:15:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c9a90a26-b318-b93a-90fd-6df8292b3b55@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/8] xen: add locks with timeouts for
 keyhandlers
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAgMDk6MDgsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4gT24gMDUuMDMuMjAgMTY6
MjUsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxMy4wMi4yMDIwIDEzOjU0LCBKdWVyZ2VuIEdy
b3NzIHdyb3RlOgo+Pj4gTW9zdCBrZXloYW5kbGVycyBhcmUgdXNlZCB0byBkdW1wIGh5cGVydmlz
b3IgZGF0YSB0byB0aGUgY29uc29sZSBhbmQKPj4+IHRoZXkgYXJlIHVzZWQgbW9zdGx5IGZvciBk
ZWJ1Z2dpbmcgcHVycG9zZXMuIEluIHRob3NlIGNhc2VzIGl0IG1pZ2h0Cj4+PiBoYXBwZW4gdGhh
dCBzb21lIGRhdGEgc3RydWN0dXJlcyBhcmUgbG9ja2VkIGFuZCB0aHVzIGFyZSBibG9ja2luZyB0
aGUKPj4+IGhhbmRsZXIgdG8gYWNjZXNzIHRoZSBkYXRhLgo+Pj4KPj4+IEluIG9yZGVyIHRvIGJl
IGFibGUgdG8gc3RpbGwgZ2V0IHNvbWUgaW5mb3JtYXRpb24gZG9uJ3QgdXNlIHBsYWluCj4+PiBs
b2NraW5nIGZ1bmN0aW9ucyBpbiB0aGUga2V5aGFuZGxlcnMsIGJ1dCBhIHZhcmlhbnQgb2YgdHJ5
bG9ja3Mgd2l0aAo+Pj4gYSB0aW1lb3V0IHZhbHVlLiBUaGlzIGFsbG93cyB0byB3YWl0IGZvciBz
b21lIHRpbWUgYW5kIHRvIGdpdmUgdXAgaW4KPj4+IGNhc2UgdGhlIGxvY2sgd2FzIG5vdCBvYnRh
aW5lZC4KPj4+Cj4+PiBBZGQgdGhlIG1haW4gaW5mcmFzdHJ1Y3R1cmUgZm9yIHRoaXMgZmVhdHVy
ZSBpbmNsdWRpbmcgYSBuZXcgcnVudGltZQo+Pj4gcGFyYW1ldGVyIGFsbG93aW5nIHRvIHNwZWNp
ZnkgdGhlIHRpbWVvdXQgdmFsdWUgaW4gbWlsbGlzZWNvbmRzLgo+Pj4KPj4+IFVzZSB0aGUgbmV3
IGxvY2tpbmcgc2NoZW1lIGluIHRoZSBoYW5kbGVycyBkZWZpbmVkIGluIGtleWhhbmRsZXIuYy4K
Pj4KPj4gUGVyc29uYWxseSBJIHRoaW5rIHRyeWxvY2sgKGFzIGFscmVhZHkgdXNlZCBpbiBzb21l
IHBsYWNlcykgaXMgdGhlCj4+IHdheSB0byBnby4gSWlyYyBvdGhlcnMgZGlzYWdyZWVkLCBidXQg
YWxzbyBkaWRuJ3QgbGlrZSB0aGUgYXBwcm9hY2gKPj4gdGFrZW4gaGVyZS4gSSdtIG5vdCBpbnRl
bmRpbmcgdG8gc3RhbmQgaW4gdGhlIHdheSBpZiBhIG1ham9yaXR5Cj4+IGFwcHJvdmVzIG9mIHRo
aXMgbW9kZWwsIGJ1dCBJJ20gbm90IGdvaW5nIHRvIGFjayB0aGVzZSBjaGFuZ2VzCj4+IG15c2Vs
Zi4KPiAKPiBGYWlyIGVub3VnaC4KPiAKPiBCVFcsIHRyeWxvY2sgaXMgdXNlZCBhdCBleGFjdGx5
IHRocmVlIHBsYWNlczogZm9yIGR1bXBpbmcgdk5VTUEsIE1TSSBhbmQKPiBsaXZlcGF0Y2ggaW5m
by4KPiAKPiBBbmQgVEJIOiB0aGUgdk5VTUEgY2FzZSBpcyByZWFsbHkgc3RyYW5nZSwgYXMgdGhp
cyBpcyBhIHJ3bG9jayB3aGljaCBpcwo+IGhlbGQgYXMgd3JpdGVyIG9ubHkgaW4gb25lIHBsYWNl
IGZvciBhIHZlcnkgYnJpZWYgdGltZSBwZXJpb2Qgd2hlbgo+IGZyZWVpbmcgdGhlIGRvbWFpbidz
IHZudW1hIGRhdGEuCj4gCj4gVGhlIE1TSSBjYXNlIGlzIG1vcmUgY29tcGxpY2F0ZWQgYW5kIGxv
b2tpbmcgYXQgaXQgaW4gbW9yZSBkZXRhaWwgSSd2ZQo+IHJlYWxpemVkIHRoYXQgdGhlcmUgaXMg
YW5vdGhlciB0cnlsb2NrIGhpZGRlbiBpbiBhIHN1YmZ1bmN0aW9uOgo+IHZwY2lfbXNpeF9hcmNo
X3ByaW50KCkuIEFzIHZwY2lfbXNpeF9hcmNoX3ByaW50KCkgd2lsbCBkcm9wIHRoZSBsb2NrIGlu
Cj4gdGhlIGVycm9yIGNhc2UgdGhlIGludGVyZmFjZSB0byB0aGlzIGZ1bmN0aW9uIGlzIHJhdGhl
ciB3ZWlyZC4gSW4KPiBhZGRpdGlvbiB0aGUgb2NjYXNpb25hbCBzb2Z0aXJxIHByb2Nlc3Npbmcg
aXMgZXJybyBwcm9uZSwgdG9vLCBhcyBpdAo+IHdpbGwgaGFwcGVuIG9ubHkgaWYgYSBzaW5nbGUg
ZG9tYWluIGhhcyBhdCBsZWFzdCA2NCBNU0kgZW50cmllcy4gSW4gY2FzZQo+IG9mIGxvdHMgb2Yg
ZG9tYWlucyB3aXRoIHVwIHRvIDYzIGVudHJpZXMgd2F0Y2hkb2cgdGltZW91dHMgY2FuIHN0aWxs
Cj4gaGFwcGVuLCBzbyBJJ2xsIHNlbmQgYSBwYXRjaCByZXBhaXJpbmcgdGhpcyBpc3N1ZSBieSBs
ZXR0aW5nCj4gdnBjaV9tc2l4X2FyY2hfcHJpbnQoKSBkdW1wIG9ubHkgb25lIGVudHJ5IGFuZCBw
dXR0aW5nIHRoZSBsb29wIGFuZAo+IHNvZnRpcnEgaGFuZGxpbmcgaW50byB2cGNpX2R1bXBfbXNp
KCkuCgpPaCwgc29ycnksIHNvZnRpcnFzIGFyZSBwcm9jZXNzZWQgb2Z0ZW4gZW5vdWdoLCBJIG1p
c3NlZCBvbmUgY2FsbC4KCk5ldmVydGhlbGVzcyB0aGUgbG9ja2luZyBpbnRlcmZhY2Ugd2FudHMg
dG8gYmUgY29ycmVjdGVkIElNTy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
