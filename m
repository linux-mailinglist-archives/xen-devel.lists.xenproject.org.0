Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B6E18CEAE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 14:20:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFHWC-00012f-FI; Fri, 20 Mar 2020 13:16:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jFHWB-00012a-6Z
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 13:16:55 +0000
X-Inumbo-ID: 10b95e1b-6aad-11ea-bd58-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10b95e1b-6aad-11ea-bd58-12813bfff9fa;
 Fri, 20 Mar 2020 13:16:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 83AB3ABD1;
 Fri, 20 Mar 2020 13:16:52 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200319154716.34556-1-roger.pau@citrix.com>
 <20200319154716.34556-2-roger.pau@citrix.com>
 <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
 <20200319173825.GQ24458@Air-de-Roger.citrite.net>
 <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
 <20200319184305.GR24458@Air-de-Roger.citrite.net>
 <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
 <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
 <20200320090155.GS24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9f6c3b5b-13e7-05aa-1ff6-930724674323@suse.com>
Date: Fri, 20 Mar 2020 14:16:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320090155.GS24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDMuMjAyMCAxMDowMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIE1h
ciAyMCwgMjAyMCBhdCAwODoyMToxOUFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTkuMDMuMjAyMCAyMDowNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gT24gMTkvMDMvMjAyMCAx
ODo0MywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+PiBPbiBUaHUsIE1hciAxOSwgMjAyMCBh
dCAwNjowNzo0NFBNICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+
IE9uIDE5LzAzLzIwMjAgMTc6MzgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4+PiBPbiBU
aHUsIE1hciAxOSwgMjAyMCBhdCAwNDoyMToyM1BNICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6
Cj4+Pj4+PiDCoCA+PiBXaHkgY2FuJ3QgeW91IGtlZXAgZmx1c2hfdGxiX21hc2soKSBoZXJlPwo+
Pj4+Pj4KPj4+Pj4+IEJlY2F1c2UgZmlsdGVyZWRfZmx1c2hfdGxiX21hc2sgaXMgdXNlZCBpbiBw
b3B1bGF0ZV9waHlzbWFwLCBhbmQKPj4+Pj4+IGNoYW5nZXMgdG8gdGhlIHBoeW1hcCByZXF1aXJl
IGFuIEFTSUQgZmx1c2ggb24gQU1EIGhhcmR3YXJlLgo+Pj4+Pgo+Pj4+PiBJIGFtIGFmcmFpZCB0
aGlzIGRvZXMgbm90IHlldCBleHBsYWluIG1lIHdoeSBmbHVzaF90bGJfbWFzaygpIGNvdWxkIG5v
dCBiZQo+Pj4+PiB1cGRhdGVkIHNvIGl0IGZsdXNoIHRoZSBBU0lEIG9uIEFNRCBoYXJkd2FyZS4K
Pj4+Pgo+Pj4+IEN1cnJlbnQgYmVoYXZpb3IgcHJldmlvdXMgdG8gdGhpcyBwYXRjaCBpcyB0byBm
bHVzaCB0aGUgQVNJRHMgb24KPj4+PiBldmVyeSBUTEIgZmx1c2guCj4+Pj4KPj4+PiBmbHVzaF90
bGJfbWFzayBpcyB0b28gd2lkZWx5IHVzZWQgb24geDg2IGluIHBsYWNlcyB3aGVyZSB0aGVyZSdz
IG5vCj4+Pj4gbmVlZCB0byBmbHVzaCB0aGUgQVNJRHMuIFRoaXMgcHJldmVudHMgdXNpbmcgYXNz
aXN0ZWQgZmx1c2hlcyAoYnkgTDApCj4+Pj4gd2hlbiBydW5uaW5nIG5lc3RlZCwgc2luY2UgdGhv
c2UgYXNzaXN0ZWQgZmx1c2hlcyBwZXJmb3JtZWQgYnkgTDAKPj4+PiBkb24ndCBmbHVzaCB0aGUg
TDIgZ3Vlc3RzIFRMQnMuCj4+Pj4KPj4+PiBJIGNvdWxkIGtlZXAgY3VycmVudCBiZWhhdmlvciBh
bmQgbGVhdmUgZmx1c2hfdGxiX21hc2sgYWxzbyBmbHVzaGluZyB0aGUKPj4+PiBBU0lEcywgYnV0
IHRoYXQgc2VlbXMgd3JvbmcgYXMgdGhlIGZ1bmN0aW9uIGRvZXNuJ3QgaGF2ZSBhbnl0aGluZyBp
bgo+Pj4+IGl0J3MgbmFtZSB0aGF0IHN1Z2dlc3RzIGl0IGFsc28gZmx1c2hlcyB0aGUgaW4tZ3Vl
c3QgVExCcyBmb3IgSFZNLgo+Pj4KPj4+IEkgYWdyZWUgdGhlIG5hbWUgaXMgY29uZnVzaW5nLCBJ
IGhhZCB0byBsb29rIGF0IHRoZSBpbXBsZW1lbnRhdGlvbiB0byB1bmRlcnN0YW5kIHdoYXQgaXQg
ZG9lcy4KPj4+Cj4+PiBIb3cgYWJvdXQgcmVuYW1pbmcgKG9yIGludHJvZHVjaW5nKSB0aGUgZnVu
Y3Rpb24gdG8gZmx1c2hfdGxiX2FsbF9ndWVzdHNfbWFzaygpIG9yIGZsdXNoX3RsYl9hbGxfZ3Vl
c3RzX2NwdW1hc2soKSkgPwo+Pgo+PiBBbmQgdGhpcyB3b3VsZCB0aGVuIGZsdXNoIF9vbmx5XyBn
dWVzdCBUTEJzPwo+IAo+IE5vLCBJIHRoaW5rIGZyb20gSnVsaWVuJ3MgcHJvcG9zYWwgKGlmIEkg
dW5kZXJzdG9vZCBpdCBjb3JyZWN0bHkpCj4gZmx1c2hfdGxiX2FsbF9ndWVzdHNfbWFzayB3b3Vs
ZCBkbyB3aGF0IGZsdXNoX3RsYl9tYXNrIGN1cnJlbnRseSBkb2VzCj4gcHJldmlvdXMgdG8gdGhp
cyBwYXRjaCAoZmx1c2ggWGVuJ3MgVExCcyArIEhWTSBBU0lEcykuCj4gCj4+Pj4gSSB3b3VsZCBy
YXRoZXIgcHJlZmVyIHRoZSBkZWZhdWx0IHRvIGJlIHRvIG5vdCBmbHVzaCB0aGUKPj4+PiBBU0lE
cywgc28gdGhhdCB1c2VycyBuZWVkIHRvIHNwZWNpZnkgc28gYnkgcGFzc2luZyB0aGUgZmxhZyB0
bwo+Pj4+IGZsdXNrX21hc2suCj4+PiBUaGF0J3MgeDg2IGNob2ljZS4gRm9yIGNvbW1vbiwgSSB3
b3VsZCByYXRoZXIgbm8gaW50cm9kdWNlIHRob3NlIGZsYWdzIHVudGlsIHdlIGhhdmUgYW5vdGhl
ciBhcmNoIHRoYXQgbWFrZSB1c2Ugb2YgaXQuCj4+Cj4+IFRoZSBmbGFncyBzaG91bGQgcGVyaGFw
cyBpbmRlZWQgcmVtYWluIHg4Ni1zcGVjaWZpYywgYnV0IHN1aXRhYmxlCj4+IHdyYXBwZXJzIHVz
YWJsZSBmcm9tIGNvbW1vbiBjb2RlIHNob3VsZCBleGlzdCAoYXMgeW91IHN1Z2dlc3QKPj4gYmVs
b3cpLgo+IAo+IEkgZG9uJ3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9uIHJlIG5hbWluZywgYXJlIHlv
dSBPSyB3aXRoIHRoZSBuYW1lcwo+IHByb3Bvc2VkIGFib3ZlPwoKV2VsbCwgbm8gLSBpbW8gYSBm
dW5jdGlvbiBuYW1lZCBlLmcuIGZsdXNoX3RsYl9hbGxfZ3Vlc3RzX2NwdW1hc2soKSBpcwpub3Qg
c3VwcG9zZWQgdG8gZmx1c2ggYW55IGhvc3QgVExCcy4gQnV0IEknbGwgYWxzbyByZXBseSB0byBK
dWxpZW4ncwpzdWJzZXF1ZW50IHJlcGx5IGluIGEgbWludXRlLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
