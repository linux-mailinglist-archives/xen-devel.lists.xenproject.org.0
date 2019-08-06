Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DD582FCC
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 12:37:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huwmm-0001BS-P5; Tue, 06 Aug 2019 10:33:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1huwml-0001BN-1u
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 10:33:43 +0000
X-Inumbo-ID: a85dabff-b835-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a85dabff-b835-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 10:33:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 39480B0B6;
 Tue,  6 Aug 2019 10:33:40 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20190717101843.2nmigl4dt4kekuax@Air-de-Roger.citrite.net>
 <20190717235426.GX1250@mail-itl>
 <20190718134604.owj6l4hk7rjq72es@Air-de-Roger.citrite.net>
 <9d0c36b7-97d3-5da8-c35b-7073c2066841@suse.com>
 <20190718165212.rj23yh5bphtc2cq5@Air-de-Roger.citrite.net>
 <f5ff77af-d2d5-1a89-06d4-6049f607ec80@suse.com>
 <20190719090202.vzeernrydawwnzan@Air-de-Roger.citrite.net>
 <b7d4e591-a5e3-94f1-6870-f0b6e7e9daf7@suse.com>
 <20190805134424.GJ1549@mail-itl>
 <c16737dc-f5f1-45f7-e743-970016820aab@suse.com>
 <20190806094601.GG1250@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b62dcc6f-7239-b3a2-9c8b-bec931ee023c@suse.com>
Date: Tue, 6 Aug 2019 12:33:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806094601.GG1250@mail-itl>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 5/6] xen/x86: add PHYSDEVOP_msi_control
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
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDguMjAxOSAxMTo0NiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBPbiBUdWUsIEF1ZyAwNiwgMjAxOSBhdCAwNzo1NjozOUFNICswMDAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4gT24gMDUuMDguMjAxOSAxNTo0NCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp
ICB3cm90ZToKPj4+IE9uIEZyaSwgSnVsIDE5LCAyMDE5IGF0IDA5OjQzOjI2QU0gKzAwMDAsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE5LjA3LjIwMTkgMTE6MDIsIFJvZ2VyIFBhdSBNb25u
w6kgIHdyb3RlOgo+Pj4+PiBPbiBGcmksIEp1bCAxOSwgMjAxOSBhdCAwODowNDo0NUFNICswMDAw
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDE4LjA3LjIwMTkgMTg6NTIsIFJvZ2VyIFBh
dSBNb25uw6kgIHdyb3RlOgo+Pj4+Pj4+IE9uIFRodSwgSnVsIDE4LCAyMDE5IGF0IDAzOjE3OjI3
UE0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+PiBPbiAxOC4wNy4yMDE5IDE1OjQ2
LCBSb2dlciBQYXUgTW9ubsOpICB3cm90ZToKPj4+Pj4+Pj4+IEluIGZhY3QgSSBkb24ndCB0aGlu
ayBJTlR4IHNob3VsZCBiZSBlbmFibGVkIHdoZW4gTVNJKC1YKSBpcyBkaXNhYmxlZCwKPj4+Pj4+
Pj4+IFFFTVUgYWxyZWFkeSB0cmFwcyB3cml0ZXMgdG8gdGhlIGNvbW1hbmQgcmVnaXN0ZXIsIGFu
ZCBpdCB3aWxsIG1hbmFnZQo+Pj4+Pj4+Pj4gSU5UeCBlbmFibGluZy9kaXNhYmxpbmcgYnkgaXRz
ZWxmLiBJIHRoaW5rIHRoZSBvbmx5IGNoZWNrIHJlcXVpcmVkIGlzCj4+Pj4+Pj4+PiB0aGF0IE1T
SSgtWCkgY2Fubm90IGJlIGVuYWJsZWQgaWYgSU5UeCBpcyBhbHNvIGVuYWJsZWQuIEluIHRoZSBz
YW1lCj4+Pj4+Pj4+PiB3YXkgYm90aCBNU0kgY2FzcGFiaWxpdGllcyBjYW5ub3QgYmUgZW5hYmxl
ZCBzaW11bHRhbmVvdXNseS4gVGhlCj4+Pj4+Pj4+PiBmdW5jdGlvbiBzaG91bGQgbm90IGV4cGxp
Y2l0bHkgZGlzYWJsZSBhbnkgb2YgdGhlIG90aGVyIGNhcGFiaWxpdGllcywKPj4+Pj4+Pj4+IGFu
ZCBqdXN0IHJldHVybiAtRUJVU1kgaWYgdGhlIGNhbGxlciBhdHRlbXB0cyBmb3IgZXhhbXBsZSB0
byBlbmFibGUKPj4+Pj4+Pj4+IE1TSSB3aGlsZSBJTlR4IG9yIE1TSS1YIGlzIGVuYWJsZWQuCj4+
Pj4+Pj4+Cj4+Pj4+Pj4+IFlvdSBkbyByZWFsaXplIHRoYXQgcGNpX2ludHgoKSBvbmx5IGV2ZXIg
Z2V0cyBjYWxsZWQgZm9yIFhlbgo+Pj4+Pj4+PiBpbnRlcm5hbGx5IHVzZWQgaW50ZXJydXB0cywg
aS5lLiBtYWlubHkgdGhlIHNlcmlhbCBjb25zb2xlIG9uZT8KPj4+Pj4+Pgo+Pj4+Pj4+IFlvdSB3
aWxsIGhhdmUgdG8gYmVhciB3aXRoIG1lIGJlY2F1c2UgSSdtIG5vdCBzdXJlIEkgdW5kZXJzdGFu
ZCB3aHkKPj4+Pj4+PiBpdCBkb2VzIG1hdHRlci4gRG8geW91IG1lYW4gdG8gcG9pbnQgb3V0IHRo
YXQgZG9tMCBpcyB0aGUgb25lIGluIGZ1bGwKPj4+Pj4+PiBjb250cm9sIG9mIElOVHgsIGFuZCB0
aHVzIFhlbiBzaG91bGRuJ3QgY2FyZSBvZiB3aGV0aGVyIElOVHggYW5kCj4+Pj4+Pj4gTVNJKC1Y
KSBhcmUgZW5hYmxlZCBhdCB0aGUgc2FtZSB0aW1lPwo+Pj4+Pj4+Cj4+Pj4+Pj4gSSBzdGlsbCB0
aGluayB0aGF0IGF0IGxlYXN0IGEgd2FybmluZyBzaG91bGQgYmUgcHJpbnRlZCBpZiBhIGNhbGxl
cgo+Pj4+Pj4+IHRyaWVzIHRvIGVuYWJsZSBNU0koLVgpIHdoaWxlIElOVHggaXMgYWxzbyBlbmFi
bGVkLCBidXQgdW5sZXNzIHRoZXJlJ3MKPj4+Pj4+PiBhIHJlYXNvbiB0byBoYXZlIGJvdGggTVNJ
KC1YKSBhbmQgSU5UeCBlbmFibGVkIGF0IHRoZSBzYW1lIHRpbWUgKG1heWJlCj4+Pj4+Pj4gYSBx
dWlyayBmb3Igc29tZSBoYXJkd2FyZSBpc3N1ZT8pIGl0IHNob3VsZG4ndCBiZSBhbGxvd2VkIG9u
IHRoaXMgbmV3Cj4+Pj4+Pj4gaW50ZXJmYWNlLgo+Pj4+Pj4KPj4+Pj4+IEkgZG9uJ3QgbWluZCBp
bXByb3ZlbWVudHMgdG8gdGhlIGN1cnJlbnQgc2l0dWF0aW9uIChpLmUuIHN1Y2ggYQo+Pj4+Pj4g
d2FybmluZyBtYXkgaW5kZWVkIG1ha2Ugc2Vuc2UpOyBJIG1lcmVseSBzdGF0ZWQgaG93IHRoaW5n
cyBjdXJyZW50bHkKPj4+Pj4+IGFyZS4gSU5UeCB0cmVhdG1lbnQgd2FzIGNvbXBsZXRlbHkgbGVm
dCBhc2lkZSB3aGVuIE1TSSBzdXBwb3J0IHdhcwo+Pj4+Pj4gaW50cm9kdWNlZCBpbnRvIFhlbi4K
Pj4+Pj4KPj4+Pj4gSW4gb3JkZXIgdG8gZ2l2ZSBNYXJlayBhIG1vcmUgY29uY2lzZSByZXBseSwg
d291bGQgeW91IGFncmVlIHRvIHJldHVybgo+Pj4+PiAtRUJVU1kgKG9yIHNvbWUgZXJyb3IgY29k
ZSkgYW5kIHByaW50IGEgd2FybmluZyBtZXNzYWdlIGlmIHRoZSBjYWxsZXIKPj4+Pj4gYXR0ZW1w
dHMgdG8gZW5hYmxlIE1TSSgtWCkgd2hpbGUgSU5UeCBpcyBhbHNvIGVuYWJsZWQ/Cj4+Pj4KPj4+
PiBBcyB0byByZXR1cm5pbmcgYW4gZXJyb3IgLSBJIHRoaW5rIHNvLCB5ZXMuIEknbSBsZXNzIHN1
cmUgYWJvdXQgbG9nZ2luZwo+Pj4+IGEgbWVzc2FnZS4KPj4+Cj4+PiBJJ20gdHJ5aW5nIHRvIGdl
dCBpdCB3b3JraW5nIGFuZCBpdCBpc24ndCBjbGVhciB0byBtZSB3aGF0IHNob3VsZCBJCj4+PiBj
aGVjayBmb3IgIklOVHggaXMgYWxzbyBlbmFibGVkIi4gSSBhc3N1bWVkIFBDSV9DT01NQU5EX0lO
VFhfRElTQUJMRQo+Pj4gYml0LCBidXQgaXQgbG9va3MgbGlrZSBndWVzdCBoYXMgbm8gY29udHJv
bCBvdmVyIHRoaXMgYml0LCBldmVuIGluCj4+PiBwZXJtaXNzaXZlIG1vZGUuICBUaGlzIG1lYW5z
IGVuYWJsaW5nIE1TSSgtWCkgYWx3YXlzIGZhaWxzIGJlY2F1c2UgZ3Vlc3QKPj4+IGhhcyBubyB3
YXkgdG8gc2V0IFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRSBiaXQgYmVmb3JlLgo+Pgo+PiBXZWxs
LCB0aGUgZ3Vlc3QgaGFzIG5vIGNvbnRyb2wsIGJ1dCBpbiBvcmRlciB0byBlbmFibGUgTVNJeywt
WH0gSSdkCj4+IGhhdmUgZXhwZWN0ZWQgcWVtdSBvciB0aGUgRG9tMCBrZXJuZWwgdG8gc2V0IHRo
aXMgYml0IHVwIGZyb250Lgo+IAo+IHFlbXUgd291bGQgZG8gdGhhdCwgd2hlbiBydW5uaW5nIGlu
IGRvbTAuIEJ1dCBpbiBQViBzdHViZG9tYWluIGl0IHRhbGtzCj4gdG8gcGNpYmFjaywgd2hpY2gg
ZmlsdGVycyBpdCBvdXQuCgpGaWx0ZXJpbmcgb3V0IHRoZSBndWVzdCBhdHRlbXB0IGlzIGZpbmUs
IGJ1dCBpdCBzaG91bGQgdGhlbiBzZXQgdGhlCmJpdCB3aGlsZSBwcmVwYXJpbmcgTVNJL01TSS1Y
IGZvciB0aGUgZ3Vlc3QuIChJJ20gbm90IHN1cmUgaXQgd291bGQKbmVlZCB0byBkbyBzbyBleHBs
aWNpdGx5LCBvciB3aGV0aGVyIGl0IGNvdWxkbid0IHJlbHkgb24gY29kZQplbHNld2hlcmUgaW4g
dGhlIGtlcm5lbCBkb2luZyBzby4pCgo+PiBJZgo+PiB0aGF0J3Mgbm90IHRoZSBjYXNlLCB0aGVu
IG9mIGNvdXJzZSBuZWl0aGVyIGNoZWNraW5nIG5vciBsb2dnaW5nIGEKPj4gbWVzc2FnZSBpcyBh
cHByb3ByaWF0ZSBhdCB0aGlzIHBvaW50IGluIHRpbWUuIEl0IG1heSBiZSB3b3J0aHdoaWxlCj4+
IGNhbGxpbmcgb3V0IHRoaXMgYW5vbWFseSB0aGVuIGluIHRoZSBkZXNjcmlwdGlvbi4KPiAKPiBP
aywgc28gSSdsbCBnbyBiYWNrIHRvIHNldHRpbmcgUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFIGlu
c3RlYWQgb2YganVzdAo+IHZlcmlmaWNhdGlvbi4KPiAKPiBKdXN0IHRvIGNsYXJpZnk6IHNob3Vs
ZCBJIGFsc28gY2xlYXIgUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFIHdoZW4KPiBkaXNhYmxpbmcg
TVNJPyBOb3cgSSB0aGluayB5ZXMsIGJlY2F1c2Ugbm90aGluZyBlbHNlIHdvdWxkIGRvIHRoYXQK
PiBvdGhlcndpc2UsIGJ1dCBJIHdvdWxkIGxpa2UgdG8gZG91YmxlIGNoZWNrLgoKV2VsbCwgSSB0
aGluayBJJ3ZlIG1hZGUgbXkgcG9zaXRpb24gY2xlYXI6IFNvIGZhciB3ZSB1c2UgcGNpX2ludHgo
KQpvbmx5IG9uIGRldmljZXMgdXNlZCBieSBYZW4gaXRzZWxmLiBJIHRoaW5rIHRoaXMgc2hvdWxk
IHJlbWFpbiB0byBiZQp0aGF0IHdheS4gRGV2aWNlcyBpbiBwb3NzZXNzaW9uIG9mIGRvbWFpbnMg
KGluY2x1ZGluZyBEb20wKSBzaG91bGQKYmUgdW5kZXIgRG9tMCdzIGNvbnRyb2wgaW4gdGhpcyBy
ZWdhcmQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
