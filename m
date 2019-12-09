Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 554F7116C91
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 12:52:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieHZ2-0001St-UG; Mon, 09 Dec 2019 11:50:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieHZ1-0001SM-5K
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 11:50:55 +0000
X-Inumbo-ID: 26e315e2-1a7a-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26e315e2-1a7a-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 11:50:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7530BAD14;
 Mon,  9 Dec 2019 11:50:52 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <ad758354-b8e7-f5ef-b3cf-94a6a0d92bd4@suse.com>
 <e882a253-848a-0f03-4dbd-af7714c1fb3f@citrix.com>
 <5d805323-cfa0-cf59-d575-bba6b29efbb4@suse.com>
 <c7862dd8-2354-faf7-0bcb-7a7ea13c1299@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bac42b4f-4413-38e0-bd92-2ad321431ac8@suse.com>
Date: Mon, 9 Dec 2019 12:51:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <c7862dd8-2354-faf7-0bcb-7a7ea13c1299@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4] gnttab: don't expose host physical
 address without need
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
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTIuMjAxOSAyMDo0OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNS8xMi8yMDE5
IDE2OjU3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDUuMTIuMjAxOSAxNjo0NywgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDA1LzEyLzIwMTkgMTU6MzQsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IFRyYW5zbGF0ZWQgZG9tYWlucyBzaG91bGRuJ3Qgc2VlIGhvc3QgcGh5c2ljYWwgYWRk
cmVzc2VzLiBXaGlsZSB0aGUKPj4+PiBhZGRyZXNzIGlzIGFsc28gbm90IHN1cHBvc2VkIHRvIGJl
IGhhbmRlZCBiYWNrIGV2ZW4gdG8gbm9uLXRyYW5zbGF0ZWQKPj4+PiBkb21haW5zIHdoZW4gR05U
TUFQX2RldmljZV9tYXAgaXMgbm90IHNldCAoYXMgZXhwbGljaXRseSBzdGF0ZWQgYnkgYQo+Pj4+
IGNvbW1lbnQgaW4gdGhlIHB1YmxpYyBoZWFkZXIpLCBQViBrZXJuZWxzIChMaW51eCBhdCBsZWFz
dCkgYXNzdW1lIHRoZQo+Pj4+IGZpZWxkIHRvIGdldCBwb3B1bGF0ZWQgbmV2ZXJ0aGVsZXNzLgo+
Pj4gVGhpcyByZWFsbHkgbWVhbnMgdGhhdCB0aGUgcHVibGljIGhlYWRlciBuZWVkcyBjb3JyZWN0
aW5nLsKgIFRoZSBmaWVsZAo+Pj4gbWF5IG5vdCBoYXZlIGludGVuZGVkIHRvIGVzY2FwZSBvdXQg
b2YgWGVuLCBidXQgaXQgaXMgZGVmYWN0byBwYXJ0IG9mCj4+PiB0aGUgQUJJIG5vdy4KPj4gV2Vs
bCwgdGhhdCdzIG9uZSBvZiB0d28gcG9zc2libGUgcm91dGVzLiBUaGUgb3RoZXIgaXMgdG8gaGF2
ZSwgbGlrZQo+PiB5b3UgZGlkIHN1Z2dlc3QgZWFybGllciBvbiwgYSBtb2RlIGluIHdoaWNoIHdl
IGJlaGF2ZSBtb3JlIHN0cmljdGx5LAo+PiBhbmQgY3VycmVudCBMaW51eCB0aGVuIHdvdWxkbid0
IHdvcmsgb24gc3VjaCBhIFhlbiB1bnRpbCBmaXhlZC4KPiAKPiBJJ20gc29yZWx5IHRlbXB0ZWQg
dG8gaW50cm9kdWNlIGEgImZ1bGx5IHN0cmljdCBtb2RlIiByaWdodCBub3csIGJlaGluZAo+IGEg
Y29tbWFuZCBsaW5lIG9wdGlvbiwgd2hpY2ggY2hvcHMgb2ZmIGFsbCB0aGUgYml0cyB3aGljaCBz
aG91bGRuJ3QgYmUKPiB1c2FibGUgaW4gdGhlaXIgY3VycmVudCBmb3JtLgo+IAo+IEhvd2V2ZXIs
IG5vdGhpbmcsIG5vdCBldmVuIGRvbTAsIHdpbGwgYm9vdCBzdWNjZXNzZnVsbHksIHNvIGl0IHBy
b2JhYmx5Cj4gaXNuJ3QgYSBncmVhdCBpZGVhIHJpZ2h0IG5vdy7CoCBBbHNvLCB3ZSdkIGhhdmUg
YW4gZWFzaWVyIHRpbWUgc3RhcnRpbmcKPiBmcm9tIG5vdGhpbmcgYW5kIHdoaXRlbGlzdGluZyBv
ayB0aGluZ3MgaW4sIHRoYW4gYXR0ZW1wdCB0byBsb2NhdGUKPiBldmVyeXRoaW5nIHRoYXQgd2Ug
c2hvdWxkIGJsYWNrbGlzdCBpbiB0aGUgY3VycmVudCBjb25maWd1cmF0aW9uLgoKT2theSwgSSds
bCBhZGQgYSByZW1hcmsgdG8gdGhlIHB1YmxpYyBoZWFkZXIgY29tbWVudCB0aGVuIGZvciBub3cu
Cgo+Pj4+IChTaW1pbGFybHkgbWFwa2luZCgpIHNob3VsZCBjaGVjayBvbmx5IEdOVE1BUF9kZXZp
Y2VfbWFwLikKPj4+IElzIHRoaXMgY29tbWVudCBzdGFsZSwgb3IgaGF2ZSBJIG1pc3VuZGVyc3Rv
b2Qgc29tZSBvZiB0aGUgcmVhc29uaW5nPwo+PiBJdCdzIGNlcnRhaW5seSBub3Qgc3RhbGUuIG1h
cGtpbmQoKSBpcyB1c2VkIHRvIGRldGVybWluZSB3aGV0aGVyCj4+IElPTU1VIG1hcHBpbmcgYWRq
dXN0bWVudHMgYXJlIG5lZWRlZC4gV2l0aCB0aGlzLCBpdCBzaG91bGQgaW4KPj4gcHJpbmNpcGxl
IG9ubHkgY29uc2lkZXIgd2hldGhlciB0aGUgY3VycmVudCBvcGVyYXRpb24gd291bGQKPj4gcG9z
c2libHkgYWx0ZXIgSU9NTVUgbWFwcGluZyBuZWVkcy4gV2hhdCBuZWVkcyBkb2luZyBzaG91bGQs
Cj4+IGFjY29yZGluZyB0byBteSBpbnRlcnByZXRhdGlvbiBvZiB0aGUgb3JpZ2luYWxseSBpbnRl
bmRlZCBkZXNpZ24sCj4+IG9ubHkgZGVwZW5kIG9uIGN1cnJlbnQgYW5kIHByaW9yIHJlcXVlc3Rz
IHdpdGggR05UTUFQX2RldmljZV9tYXAKPj4gc2V0Lgo+IAo+IFRoYXQncyBhbGwgcmVhc29uYWJs
ZSwgYnV0IHRoZXJlIGFyZSBubyBlZGl0cyB0byBtYXBraW5kKCksIHNvIEknbQo+IGNvbmZ1c2Vk
IGFzIHRvIHdoeSB0aGlzIGlzIHByZXNlbnQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoKV2VsbCwg
aXQncyB0aGUgc2FtZSB1bmRlcmx5aW5nIHByb2JsZW0gLSBpbXByb3BlciBzZXBhcmF0aW9uIG9m
Cmhvc3RfbWFwIGZyb20gZGV2aWNlX21hcC4gSSd2ZSBhZGRlZCB0aGlzIGp1c3QgdG8gZW1waGFz
aXplIHRoYXQKdGhpcyBsaWtlbHkgd2Fzbid0IGFuIG92ZXJzaWdodCwgYnV0IGludGVudGlvbmFs
ICh5ZXQgd3JvbmcsIGF0CmxlYXN0IGFmYWljdCkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
