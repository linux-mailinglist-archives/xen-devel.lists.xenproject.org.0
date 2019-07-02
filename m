Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E795CC84
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 11:20:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiEuG-000588-29; Tue, 02 Jul 2019 09:16:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Sn/J=U7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hiEuE-000583-Vs
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 09:16:55 +0000
X-Inumbo-ID: 1fe47c0c-9caa-11e9-9536-3b092277763a
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fe47c0c-9caa-11e9-9536-3b092277763a;
 Tue, 02 Jul 2019 09:16:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D04E2B152;
 Tue,  2 Jul 2019 09:16:49 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <be24ad7e-9510-912c-9984-7eec792fae86@suse.com>
 <45139cf0-0b53-1ca2-c8b2-2c2e8813a82d@suse.com>
 <de741925-b823-92ee-c9be-c4cc55da859d@suse.com>
 <0bb81eb9-8303-2dae-2fba-28c73ac74050@suse.com>
 <ee6a055b-2a47-e6ee-91d4-f23bfce5243d@suse.com>
 <cbd5a52f-f9cb-2efe-0e62-22a58614e322@suse.com>
 <948bef8c-79bb-a5e1-f510-91ce95c4082f@suse.com>
 <64f37be6-1dd4-60fb-fe23-d9d4e9e3cf63@suse.com>
 <5302284d-bb1d-0df6-f853-86bb21645269@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <2ffc25f2-bd06-32f6-53bc-e2fd7f98866a@suse.com>
Date: Tue, 2 Jul 2019 11:16:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5302284d-bb1d-0df6-f853-86bb21645269@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 13/60] xen/sched: move some per-vcpu items
 to struct sched_unit
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
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Meng Xu <mengxu@cis.upenn.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDcuMTkgMTE6MDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDAyLjA3LjIwMTkgMTA6
NDQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDAyLjA3LjE5IDEwOjI3LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDAyLjA3LjIwMTkgMTA6MTQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gT24gMDIuMDcuMTkgMDk6NTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBBbmQgYWdhaW4g
LSBpZiBzb21lb25lIHBpbnMgZXZlcnkgdkNQVSB0byBhIHNpbmdsZSBwQ1BVLCB0aGF0IGxhc3QK
Pj4+Pj4gc3VjaCBwaW5uaW5nIG9wZXJhdGlvbiB3aWxsIGJlIHdoYXQgdGFrZXMgbG9uZyB0ZXJt
IGVmZmVjdC4gQWl1aSBhbGwKPj4+Pj4gdkNQVS1zIGluIHRoZSB1bml0IHdpbGwgdGhlbiBiZSBw
aW5uZWQgdG8gdGhhdCBvbmUgcENQVSwgaS5lLgo+Pj4+PiB0aGV5J2xsIGVpdGhlciBhbGwgY29t
cGV0ZSBmb3IgdGhlIG9uZSBwQ1BVJ3MgdGltZSwgb3Igb25seSBvbmUgb2YKPj4+Pj4gdGhlbSB3
aWxsIGV2ZXIgZ2V0IHNjaGVkdWxlZC4KPj4+Pgo+Pj4+IE5vLCB0aGF0J3Mgbm90IGhvdyBpdCB3
b3Jrcy4gTGV0cyBzYXkgd2UgaGF2ZSBhIHN5c3RlbSB3aXRoIHRoZQo+Pj4+IGZvbGxvd2luZyB0
b3BvbG9neSBhbmQgY29yZSBzY2hlZHVsaW5nIGFjdGl2ZToKPj4+Pgo+Pj4+IGNwdTA6IGNvcmUg
MCwgdGhyZWFkIDAKPj4+PiBjcHUxOiBjb3JlIDAsIHRocmVhZCAxCj4+Pj4gY3B1MjogY29yZSAx
LCB0aHJlYWQgMAo+Pj4+IGNwdTM6IGNvcmUgMSwgdGhyZWFkIDEKPj4+Pgo+Pj4+IFRoZW4gYW55
IGV2ZW4gbnVtYmVyZWQgdmNwdSB3aWxsIG9ubHkgZXZlciBiZSBzY2hlZHVsZWQgb24gY3B1MCBv
ciBjcHUyLAo+Pj4+IHdoaWxlIGFueSBvZGQgbnVtYmVyZWQgdmNwdSB3aWxsIG9ubHkgcnVuIG9u
IGNwdTEgb3IgY3B1My4KPj4+Pgo+Pj4+IFNvIHZpcnR1YWwgY29yZXMgZ2V0IHNjaGVkdWxlZCBv
biBwaHlzaWNhbCBjb3Jlcy4gVmlydHVhbCB0aHJlYWQgMCB3aWxsCj4+Pj4gb25seSBydW4gb24g
cGh5c2ljYWwgdGhyZWFkIDAgYW5kIHRoZSBhc3NvY2lhdGVkIHZpcnR1YWwgdGhyZWFkIDEgd2ls
bAo+Pj4+IHJ1biBvbiB0aGUgYXNzb2NpYXRlZCBwaHlzaWNhbCB0aHJlYWQgMSBvZiB0aGUgc2Ft
ZSBwaHlzaWNhbCBjb3JlLgo+Pj4+Cj4+Pj4gUGlubmluZyBhIHZpcnR1YWwgdGhyZWFkIDEgdG8g
YSBwaHlzaWNhbCB0aHJlYWQgMCBpcyBub3QgcG9zc2libGUgKGluCj4+Pj4gcmVhbGl0eSBvbmx5
IHRoZSB2aXJ0dWFsIGNvcmUgaXMgYmVpbmcgcGlubmVkIHRvIHRoZSBwaHlzaWNhbCBjb3JlKS4K
Pj4+Cj4+PiBCdXQgdGhhdCdzIHdoYXQgZXhpc3RpbmcgZ3Vlc3RzIG1heSBiZSBkb2luZy4gWW91
IG1heSB3YW50IHRvCj4+PiB0YWtlIGEgbG9vayBhdCBvdXIgb2xkLCBub24tcHZvcHMga2VybmVs
cywgaW4gcGFydGljdWxhciB0aGUKPj4+IGZ1bmN0aW9uYWxpdHkgcHJvdmlkZWQgYnkgdGhlaXIg
ZHJpdmVycy94ZW4vY29yZS9kb21jdGwuYy4gWWVzLAo+Pj4ge3N5cyxkb219Y3RsLXMgYXJlbid0
IHN1cHBvc2VkIHRvIGJlIHVzZWQgYnkgdGhlIGtlcm5lbCwgYnV0IHRvCj4+PiBhY2hpZXZlIHRo
ZSBpbnRlbmRlZCBlZmZlY3RzIEkgc2F3IG5vIHdheSBhcm91bmQgKGFiKXVzaW5nIHRoZW0uCj4+
PiAoSSBtZWFuIHRoaXMgdG8gYmUgdGFrZW4gYXMgYW4gZXhhbXBsZSBvbmx5IC0gSSByZWFsaXpl
IHRoYXQgdGhlCj4+PiBjb2RlIHRoZXJlIHdvdWxkbid0IHdvcmsgb24gbW9kZXJuIFhlbiB3aXRo
b3V0IHVwZGF0aW5nLCBkdWUgdG8KPj4+IHRoZSBzeXNjdGwvZG9tY3RsIGludGVyZmFjZSB2ZXJz
aW9uIHRoYXQgbmVlZHMgc2V0dGluZy4pCj4+Cj4+IEZpcnN0IC0gc3BlYWtpbmcgb2YgImd1ZXN0
cyIgaXMgYSBsaXR0bGUgYml0IG1pc2xlYWRpbmcgaGVyZS4gVGhpcyBpcwo+PiByZXN0cmljdGVk
IHRvIGRvbTAuCj4+Cj4+IFNvIHdoZW4geW91IHdhbnQgdG8gdXNlIHN1Y2ggYSBkb20wIGtlcm5l
bCB3aXRoIFhlbiA0LjEzIG9yIGxhdGVyIHlvdSdkCj4+IG5lZWQgdG8gc3RheSB3aXRoIGNwdSBz
Y2hlZHVsaW5nLiBBbnkgcmVjZW50IGtlcm5lbCB3aWxsIHJ1biBqdXN0IGZpbmUKPj4gYXMgZG9t
MCB3aXRoIGNvcmUgc2NoZWR1bGluZyBhY3RpdmUuCj4gCj4gUmlnaHQsIGJ1dCBzdWNoIHJlY2Vu
dCBrZXJuZWxzIGhhdmUgKGFmYWljdCkgbm8gc29sdXRpb24gdG8gc29tZSBvZgo+IHRoZSBwcm9i
bGVtcyB0aGF0IHRoZSAoYWIpdXNlIG9mIHRoZSB7c3lzLGRvbX1jdGwtcyB3ZXJlIG1lYW50IHRv
Cj4gYWRkcmVzcy4KCldpdGggU0NIRURPUF9waW5fb3ZlcnJpZGUgdGhpcyBzaG91bGQgYWxsIGJl
IGRvYWJsZS4gVGhlIGtlcm5lbCB3b3VsZApuZWVkIHRvIGV4ZWN1dGUgdGhlIFNDSEVET1BfcGlu
X292ZXJyaWRlIGNvZGUgb24gYSBzdWl0YWJsZSB2Y3B1CihpZGVhbGx5IHdpdGggdmNwdS1pZCA9
PSBwY3B1LWlkKS4KCkknZCBwcmVmZXIgbmV3IGh5cGVydmlzb3IgaW50ZXJmYWNlcyBmb3IgdGhh
dCBwdXJwb3NlLCB0aG91Z2guCgo+IAo+Pj4+Pj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9z
Y2hlZC1pZi5oCj4+Pj4+Pj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKPj4+
Pj4+Pj4+PiBAQCAtNDM4LDExICs0MzgsMTEgQEAgc3RhdGljIGlubGluZSBjcHVtYXNrX3QqIGNw
dXBvb2xfZG9tYWluX2NwdW1hc2soc3RydWN0IGRvbWFpbiAqZCkKPj4+Pj4+Pj4+PiAgwqDCoMKg
wqDCoCAqICogVGhlIGhhcmQgYWZmaW5pdHkgaXMgbm90IGEgc3Vic2V0IG9mIHNvZnQgYWZmaW5p
dHkKPj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoCAqICogVGhlcmUgaXMgYW4gb3ZlcmxhcCBiZXR3ZWVu
IHRoZSBzb2Z0IGFuZCBoYXJkIGFmZmluaXR5IG1hc2tzCj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqAg
Ki8KPj4+Pj4+Pj4+PiAtc3RhdGljIGlubGluZSBpbnQgaGFzX3NvZnRfYWZmaW5pdHkoY29uc3Qg
c3RydWN0IHZjcHUgKnYpCj4+Pj4+Pj4+Pj4gK3N0YXRpYyBpbmxpbmUgaW50IGhhc19zb2Z0X2Fm
ZmluaXR5KGNvbnN0IHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQo+Pj4+Pj4+Pj4+ICDCoMKgwqDC
oCB7Cj4+Pj4+Pj4+Pj4gLcKgwqDCoCByZXR1cm4gdi0+c29mdF9hZmZfZWZmZWN0aXZlICYmCj4+
Pj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgICFjcHVtYXNrX3N1YnNldChjcHVwb29sX2Rv
bWFpbl9jcHVtYXNrKHYtPmRvbWFpbiksCj4+Pj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdi0+Y3B1X3NvZnRfYWZmaW5pdHkpOwo+
Pj4+Pj4+Pj4+ICvCoMKgwqAgcmV0dXJuIHVuaXQtPnNvZnRfYWZmX2VmZmVjdGl2ZSAmJgo+Pj4+
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCAhY3B1bWFza19zdWJzZXQoY3B1cG9vbF9kb21h
aW5fY3B1bWFzayh1bml0LT52Y3B1LT5kb21haW4pLAo+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuaXQtPmNwdV9zb2Z0X2Fm
ZmluaXR5KTsKPj4+Pj4+Pj4+PiAgwqDCoMKgwqAgfQo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IE9rYXks
IGF0IHRoZSBtb21lbnQgdGhlcmUgbG9va3MgdG8gYmUgYSAxOjEgcmVsYXRpb25zaGlwIGJldHdl
ZW4gc2NoZWQKPj4+Pj4+Pj4+IHVuaXRzIGFuZCB2Q1BVLXMuIFRoaXMgd291bGQgLSBhdCB0aGlz
IHBvaW50IG9mIHRoZSBzZXJpZXMgLSBpbnZhbGlkYXRlIG1vc3QKPj4+Pj4+Pj4+IG15IGVhcmxp
ZXIgY29tbWVudHMuIEhvd2V2ZXIsIGluIHBhdGNoIDU3IEkgZG9uJ3Qgc2VlIGhvdyB0aGlzIHVu
aXQtPnZjcHUKPj4+Pj4+Pj4+IG1hcHBpbmcgd291bGQgZ2V0IGJyb2tlbiwgYW5kIEkgY2FuJ3Qg
c2VlbSB0byBpZGVudGlmeSBhbnkgb3RoZXIgcGF0Y2gKPj4+Pj4+Pj4+IHdoZXJlIHRoaXMgbWln
aHQgYmUgaGFwcGVuaW5nLiBMb29raW5nIGF0IHRoZSBnaXRodWIgYnJhbmNoIEkgYWxzbyBnZXQg
dGhlCj4+Pj4+Pj4+PiBpbXByZXNzaW9uIHRoYXQgdGhlIHN0cnVjdCB2Y3B1ICogcG9pbnRlciBv
dXQgb2Ygc3RydWN0IHNjaGVkX3VuaXQgc3Vydml2ZXMKPj4+Pj4+Pj4+IHVudGlsIHRoZSBlbmQg
b2YgdGhlIHNlcmllcywgd2hpY2ggZG9lc24ndCBzZWVtIHJpZ2h0IHRvIG1lLgo+Pj4+Pj4+Pgo+
Pj4+Pj4+PiBJdCBpcyByaWdodC4gVGhlIHZjcHUgcG9pbnRlciBpbiB0aGUgc2NoZWRfdW5pdCBp
cyBwb2ludGluZyB0byB0aGUgZmlyc3QKPj4+Pj4+Pj4gdmNwdSBvZiB0aGUgdW5pdCBhdCB0aGUg
ZW5kIG9mIHRoZSBzZXJpZXMuIEZ1cnRoZXIgdmNwdXMgYXJlIGZvdW5kIHZpYQo+Pj4+Pj4+PiB2
LT5uZXh0X2luX2xpc3QuCj4+Pj4+Pj4KPj4+Pj4+PiBJJ20gYWZyYWlkIHRoaXMgc2V0cyB1cyB1
cCBmb3IgbWlzdW5kZXJzdGFuZGluZyBhbmQgbWlzdXNlLiBJIGRvbid0Cj4+Pj4+Pj4gdGhpbmsg
dGhlcmUgc2hvdWxkIGJlIGEgc3RyYWlnaHQgc3RydWN0IHZjcHUgKiBvdXQgb2Ygc3RydWN0IHNj
aGVkX3VuaXQuCj4+Pj4+Pgo+Pj4+Pj4gVGhhdCB3YXMgdGhlIG1vc3QgZWZmZWN0aXZlIHdheSB0
byBkbyBpdC4gV2hhdCBhcmUgeW91IHN1Z2dlc3Rpbmc/Cj4+Pj4+Cj4+Pj4+IEFuIGFjdHVhbCBs
aXN0LCBpLmUuIHdpdGggYSBzdHJ1Y3QgbGlzdF9oZWFkLiBUaGF0J2xsIG1ha2Ugb2J2aW91cyB0
aGF0Cj4+Pj4+IG1vcmUgdGhhbiBvbmUgdkNQVSBtaWdodCBiZSBhc3NvY2lhdGVkIHdpdGggYSB1
bml0LiBUaGF0J3MgZXZlbiBtb3JlIHNvCj4+Pj4+IHRoYXQgdGhlIGFiaWxpdHkgdG8gYXNzb2Np
YXRlIG1vcmUgdGhhbiBvbmUgYXBwZWFycyBvbmx5IHF1aXRlIGxhdGUgaW4KPj4+Pj4gdGhlIHNl
cmllcywgaS5lLiB0aGVyZSBtYXkgYmUgZnVydGhlciBpbnN0YW5jZXMgbGlrZSB0aGUgY29kZSBh
Ym92ZSwgYW5kCj4+Pj4+IGl0IHdvdWxkIHJlcXVpcmUgYSBjYXJlZnVsIGF1ZGl0IChyYXRoZXIg
dGhhbiB0aGUgY29tcGlsZXIgZmluZGluZyBzdWNoCj4+Pj4+IGluc3RhbmNlKSB0byBkZXRlcm1p
bmUgYWxsIHBsYWNlcyB3aGVyZSB1c2luZyB0aGUgZmlyc3QgdkNQVSBpbiBhIHVuaXQKPj4+Pj4g
aXNuJ3QgcmVhbGx5IHdoYXQgd2FzIG1lYW50Lgo+Pj4+Cj4+Pj4gVEJIIEkgZG9uJ3Qgc2VlIGhv
dyB0aGlzIHdvdWxkIGhlbHAgYXQgYWxsLgo+Pj4+Cj4+Pj4gSW5zdGVhZCBvZiB1c2luZyB0aGUg
dmNwdSBwb2ludGVyIEknZCBoYWQgdG8gdXNlIHRoZSBsaXN0IGhlYWQgaW5zdGVhZC4KPj4+PiBX
aHkgaXMgdGhhdCBkaWZmZXJlbnQgdG8gYSBwbGFpbiBwb2ludGVyIHJlZ2FyZGluZyBmaW5kaW5n
IHRoZSBwbGFjZXMKPj4+PiB3aGVyZSB1c2luZyB0aGUgZmlyc3QgdmNwdSB3YXMgd3Jvbmc/Cj4+
Pgo+Pj4gVGFrZSB0aGUgZXhhbXBsZSBhYm92ZTogSXMgaXQgY29ycmVjdCB0byBhY3Qgb24ganVz
dCB0aGUgZmlyc3QgdkNQVT8KPj4+IEkgZ3Vlc3MgX2hlcmVfIGl0IGlzLCBidXQgdGhlIHNhbWUg
cGF0dGVybiBjb3VsZCBiZSBmb3VuZCBlbHNld2hlcmUuCj4+PiBJZiwgZnJvbSB0aGUgYmVnaW5u
aW5nLCB5b3UgdXNlIGEgY2xlYXJseSBpZGVudGlmaWFibGUgbGlzdCBjb25zdHJ1Y3QsCj4+PiB0
aGVuIGl0J2xsIGJlIG9idmlvdXMgdG8geW91IGFzIHRoZSB3cml0ZXIgYW5kIHRvIHJldmlld2Vy
cyB0aGF0IGJ5Cj4+PiB0aGUgZW5kIG9mIHRoZSBzZXJpZXMgdGhlcmUgbWF5IGJlIG11bHRpcGxl
IGVudGl0aWVzIHRoYXQgbmVlZCBkZWFsaW5nCj4+PiB3aXRoIC0gd2UnZCBzZWUgbGlzdF9maXJz
dCooKSBvciBmb3JfZWFjaCooKSBjb25zdHJ1Y3RzIHJpZ2h0IGF3YXkKPj4+IChhbmQgeW91IHdv
dWxkbid0IGJlIGFibGUgdG8gY2lyY3VtdmVudCB0aGVpciB1c2UgaW4gYSB3YXkgdGhhdAo+Pj4g
d291bGRuJ3QgdHJpZ2dlciAiZG9uJ3Qgb3Blbi1jb2RlIiBjb21tZW50cykuCj4+Cj4+IFdvdWxk
IHlvdSBiZSBmaW5lIHdpdGgganVzdCByZW5hbWluZyB0aGUgcG9pbnRlciB0byAidmNwdV9saXN0
Ij8KPj4gVGhpcyB3b3VsZCBhdm9pZCB0aGUgbmVlZCB0byBpbnRyb2R1Y2UgYW5vdGhlciB2Y3B1
IGxpc3QgaW4gc3RydWN0IHZjcHUKPj4gYW5kIEkgY291bGQgcmUtdXNlIHRoZSBhbHJlYWR5IGV4
aXN0aW5nIGxpc3QgYXMgdG9kYXkuCj4gCj4gV2VsbCwgeWVzLCB0aGlzIHdvdWxkIGF0IGxlYXN0
IG1ha2Ugb2J2aW91cyBhdCB1c2Ugc2l0ZXMgdGhhdCB0aGVyZQo+IG1heSBiZSBtb3JlIHRoYW4g
b25lIG9mIHRoZW0uCgpUaGFua3MuCgo+IAo+PiBJdCBzaG91bGQgYmUgbm90ZWQgdGhhdCBJIG5h
bWVkIHRoZSBwb2ludGVyIGp1c3QgInZjcHUiIGluIG9yZGVyIHRvCj4+IGF2b2lkIGxvdHMgb2Yg
cmVmb3JtYXR0aW5nIGR1ZSB0byBsb25nZXIgbGluZXMsIHRob3VnaC4KPiAKPiBJIGNhbiBhcHBy
ZWNpYXRlIHRoaXMgYXNwZWN0LCBidXQgYXMgc2FpZCBJJ20gYWZyYWlkIGl0IHdvdWxkIGJlCj4g
bWlzbGVhZGluZyAoYW5kIHBvdGVudGlhbGx5IGludml0aW5nIGZvciBtaXMtdXNlKS4KCk9rYXks
IGxldHMgbGl2ZSB3aXRoIHNvbWUgbW9yZSBtdWx0aS1saW5lIHN0YXRlbWVudHMgdGhlbi4KCgpK
dWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
