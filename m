Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E5017719C
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 09:54:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j93GA-0001Qc-Pg; Tue, 03 Mar 2020 08:50:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j93G8-0001QX-NY
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 08:50:36 +0000
X-Inumbo-ID: 0bb81656-5d2c-11ea-902a-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bb81656-5d2c-11ea-902a-bc764e2007e4;
 Tue, 03 Mar 2020 08:50:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C4A58B1A6;
 Tue,  3 Mar 2020 08:50:33 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-5-roger.pau@citrix.com>
 <cdb97977-2bae-5067-623d-76409fa643a2@suse.com>
 <20200228165048.GE24458@Air-de-Roger.citrite.net>
 <c81eb9d7-56f8-47aa-8551-da971b7d7c75@suse.com>
 <20200302165001.GM24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <08371a97-60ee-2c25-7bbc-7188bd3a3d50@suse.com>
Date: Tue, 3 Mar 2020 09:50:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302165001.GM24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 4/7] x86/tlb: introduce a flush guests
 TLB flag
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Tim Deegan <tim@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDMuMjAyMCAxNzo1MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIE1h
ciAwMiwgMjAyMCBhdCAxMTozMToyM0FNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MjguMDIuMjAyMCAxNzo1MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIEZyaSwgRmVi
IDI4LCAyMDIwIGF0IDA1OjE0OjA1UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9u
IDE5LjAyLjIwMjAgMTg6NDMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4gVGhpcyB3YXMg
cHJldmlvdXNseSB1bmNvbmRpdGlvbmFsbHkgZG9uZSBpbiBlYWNoIHByZV9mbHVzaCBjYWxsLCBi
dXQKPj4+Pj4gdGhhdCdzIG5vdCByZXF1aXJlZDogSFZNIGd1ZXN0cyBub3QgdXNpbmcgc2hhZG93
IGRvbid0IHJlcXVpcmUgbGluZWFyCj4+Pj4+IFRMQiBmbHVzaGVzIGFzIFhlbiBkb2Vzbid0IG1v
ZGlmeSB0aGUgZ3Vlc3QgcGFnZSB0YWJsZXMgaW4gdGhhdCBjYXNlCj4+Pj4+IChpZTogd2hlbiB1
c2luZyBIQVApLgo+Pj4+Cj4+Pj4gVGhpcyBleHBsYWlucyB0aGUgY29ycmVjdG5lc3MgaW4gb25l
IGRpcmVjdGlvbi4gV2hhdCBhYm91dCB0aGUKPj4+PiByZW1vdmFsIG9mIHRoaXMgZnJvbSB0aGUg
c3dpdGNoX2NyM19jcjQoKSBwYXRoPwo+Pj4KPj4+IEFGQUlDVCB0aGF0J3MgbmV2ZXIgdXNlZCBi
eSBzaGFkb3cgY29kZSB0byBtb2RpZnkgY3IzIG9yIGNyNCwgYW5kCj4+PiBoZW5jZSBkb2Vzbid0
IHJlcXVpcmUgYSBndWVzdCBsaW5lYXIgVExCIGZsdXNoLgo+Pgo+PiBYU0EtMjk0IHRlbGxzIG1l
IHRvIGJlIHZlcnkgY29uc2VydmF0aXZlIGhlcmUuIEl0IGlzIG5vdCBuZWNlc3NhcmlseQo+PiB0
aGUgZGlyZWN0IHVzZSBieSBzaGFkb3cgY29kZSB0aGF0IG1hdHRlcnM7IHRvZ2dsZV9ndWVzdF8q
KCkgaXNuJ3QKPj4gdXNlZCBkaXJlY3RseSBieSBpdCwgZWl0aGVyLgo+IAo+IHRvZ2dsZV9ndWVz
dF97bW9kZS9wdH0gc2VlbXMgdG8gYmUgZXhjbHVzaXZlbHkgdXNlZCBieSBQViBndWVzdHMuIEkn
bQo+IGZpbmUgd2l0aCBhZGRpbmcgZXh0cmEgZmx1c2hlcyB0byBiZSBvbiB0aGUgc2FmZSBzaWRl
LCBidXQgdGhvc2UKPiBmdW5jdGlvbnMgYXJlIG5ldmVyIHVzZWQgYWdhaW5zdCBhIEhWTSBndWVz
dCBBRkFJQ1QuIFRoZSBvbmx5IHJlYXNvbgo+IHRvIGZsdXNoIGEgSFZNIGd1ZXN0ICdpbnRlcm5h
bCcgVExCIGlzIHdoZW4gdXNpbmcgc2hhZG93LCBhbmQgaW4gdGhhdAo+IGNhc2UgdGhlIHNoYWRv
dyBjb2RlIG11c3QgYWxyZWFkeSB0YWtlIGNhcmUgb2YgaXNzdWluZyBzdWNoIGZsdXNoZXMuCgpX
aGF0IEknbSBhc2tpbmcgZm9yIHByaW1hcmlseSBpcyB0byBleHRlbmQgdGhlIGRlc2NyaXB0aW9u
LiBJZiBpdAppcyBjbGVhciBlbm91Z2gsIGl0IG91Z2h0IHRvIGFsc28gYmUgY2xlYXIgZW5vdWdo
IHRoYXQgbm8gZmx1c2hlcwpuZWVkIGluc2VydGluZyBhbnl3aGVyZS4KCj4+Pj4gSSBhZG1pdCB0
aGUgbmFtZXMgb2YgdGhlIGludm9sdmVkIGZ1bmN0aW9ucwo+Pj4+IChodm1fZmx1c2hfZ3Vlc3Rf
dGxicygpLCBodm1fYXNpZF9mbHVzaF9jb3JlKCkpIGFyZSBzb21ld2hhdAo+Pj4+IG1pc2xlYWRp
bmcsIGFzIHRoZXkgZG9uJ3QgYWN0dWFsbHkgZG8gYW55IGZsdXNoaW5nLCB0aGV5IG1lcmVseQo+
Pj4+IGFycmFuZ2UgZm9yIHdoYXQgaXMgaW4gdGhlIFRMQiB0byBubyBsb25nZXIgYmUgYWJsZSB0
byBiZSB1c2VkLAo+Pj4+IHNvIGdpdmluZyB0aGlzIGEgc3VpdGFibGUgbmFtZSBpcyAiaGlzdG9y
aWNhbGx5IiBjb21wbGljYXRlZC4KPj4+PiBXaGF0IGlmIHdlIGRpZCBhd2F5IHdpdGggdGhlIGh2
bV9mbHVzaF9ndWVzdF90bGJzKCkgd3JhcHBlciwKPj4+PiBuYW1pbmcgdGhlIGNvbnN0YW50IGhl
cmUgdGhlbiBhZnRlciBodm1fYXNpZF9mbHVzaF9jb3JlKCksIGUuZy4KPj4+PiBGTFVTSF9BU0lE
X0NPUkU/Cj4+Pgo+Pj4gSSdtIG5vdCBvcHBvc2VkIHRvIHJlbmFtaW5nLiBUaGUgY29tbWVudCBi
ZWZvcmUgdGhlIGRlZmluaXRpb24gd2FzCj4+PiBhbHNvIG1lYW50IHRvIGNsYXJpZnkgaXQncyB1
c2FnZSwgYW5kIGhlbmNlIHRoZSBleHBsaWNpdCBtZW50aW9uIG9mCj4+PiBBU0lEL1ZQSUQuCj4+
Cj4+IC4uLiB0aGVyZSdzIGFsc28gb25lIG1vcmUgYXJndW1lbnQgZm9yIHJlbmFtaW5nOiBUaGUg
cHJlc2VudAo+PiBuYW1lIGRvZXNuJ3QgY29udmV5IGF0IGFsbCB0aGF0IHRoaXMgb3BlcmF0aW9u
IGlzIEhWTS1vbmx5Cj4+IChpLmUuIFBWIGd1ZXN0cyB3b3VsZG4ndCBoYXZlIHRoZWlyIFRMQnMg
W2FzIGZhciBhcyBvbmUgY2FuCj4+IGNhbGwgdGhlbSAidGhlaXIiXSBmbHVzaGVkKS4KPiAKPiBE
byB5b3UgdGhpbmsgRkxVU0hfQVNJRF9DT1JFIGlzIGNsZWFyIGVub3VnaCwgb3Igd291bGQgeW91
IHByZWZlcgo+IEZMVVNIX0hWTV9BU0lEX0NPUkU/CgpXaGlsZSBpbiBwcmluY2lwbGUgaW4gb3Vy
IGNvZGUgYmFzZSBBU0lEIGltcGxpZXMgSFZNLCBwZXJoYXBzIHRoZQpsYXR0ZXIgd291bGQgc3Rp
bGwgYmUgZXZlbiBzbGlnaHRseSBiZXR0ZXIuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
