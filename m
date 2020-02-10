Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C37158012
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 17:47:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1CC3-0002Uf-FE; Mon, 10 Feb 2020 16:45:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1CC2-0002UX-DL
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 16:45:54 +0000
X-Inumbo-ID: cd0a558a-4c24-11ea-b4e3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd0a558a-4c24-11ea-b4e3-12813bfff9fa;
 Mon, 10 Feb 2020 16:45:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7E7E2AE84;
 Mon, 10 Feb 2020 16:45:52 +0000 (UTC)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <da353fee-b7f7-73ab-9ebe-632b4ea4152d@suse.com>
 <5ecf685c-7109-4ad6-cba9-bb138f750268@suse.com>
 <20200207095249.GB4679@Air-de-Roger>
 <86e31583-7f4c-c365-17f1-92b82acb5d81@suse.com>
 <CABfawhkcHMbiRFSp9WoP2ZPXgOjaWU02tmmOqRafo8VmoQaBCw@mail.gmail.com>
 <CABfawhm+_xA_-Bcv9easAq6d0uQe_hBt4AS_ioigYCCNNhDPRA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bb9f64ca-eb1e-3132-8173-5ed602e9b13f@suse.com>
Date: Mon, 10 Feb 2020 17:46:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CABfawhm+_xA_-Bcv9easAq6d0uQe_hBt4AS_ioigYCCNNhDPRA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/p2m: drop p2m_access_t parameter from
 set_mmio_p2m_entry()
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDIuMjAyMCAxODoyMSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIEZyaSwgRmVi
IDcsIDIwMjAgYXQgMTA6MTYgQU0gVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29t
PiB3cm90ZToKPj4KPj4gT24gRnJpLCBGZWIgNywgMjAyMCBhdCA5OjU0IEFNIEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gT24gMDcuMDIuMjAyMCAxMDo1Miwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+PiBPbiBGcmksIEZlYiAwNywgMjAyMCBhdCAwOTow
ODoxNUFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDYuMDIuMjAyMCAxNjoy
MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92
bXguYwo+Pj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPj4+Pj4+IEBAIC0z
MDM3LDkgKzMwMzcsOCBAQCBzdGF0aWMgaW50IHZteF9hbGxvY192bGFwaWNfbWFwcGluZyhzdHJ1
Cj4+Pj4+PiAgICAgIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3QocGcsIGQsIFNIQVJFX3J3KTsK
Pj4+Pj4+ICAgICAgZC0+YXJjaC5odm0udm14LmFwaWNfYWNjZXNzX21mbiA9IG1mbjsKPj4+Pj4+
Cj4+Pj4+PiAtICAgIHJldHVybiBzZXRfbW1pb19wMm1fZW50cnkoZCwgcGFkZHJfdG9fcGZuKEFQ
SUNfREVGQVVMVF9QSFlTX0JBU0UpLCBtZm4sCj4+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgUEFHRV9PUkRFUl80SywKPj4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwMm1fZ2V0X2hvc3RwMm0oZCktPmRlZmF1bHRfYWNjZXNzKTsKPj4+Pj4+ICsgICAgcmV0
dXJuIHNldF9tbWlvX3AybV9lbnRyeShkLCBnYWRkcl90b19nZm4oQVBJQ19ERUZBVUxUX1BIWVNf
QkFTRSksIG1mbiwKPj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQUdFX09S
REVSXzRLKTsKPj4+Pj4+ICB9Cj4+Pj4+Cj4+Pj4+IFVwb24gMm5kIHRob3VnaHQgLSBkb2VzIHRo
aXMgcmVhbGx5IHdhbnQgdG8gdXNlIGRlZmF1bHQgYWNjZXNzPwo+Pj4+PiBFeGVjdXRlIHBlcm1p
c3Npb24gZm9yIHRoaXMgcGFnZSBsb29rcyBhIGxpdHRsZSBzdXNwaWNpb3VzLgo+Pj4+PiBJc24n
dCBpdCB0aGUgY2FzZSB0aGF0IHRoaXMgcGFnZSBkb2Vzbid0IChub3JtYWxseT8pIGdldAo+Pj4+
PiBhY2Nlc3NlZCBhdCBhbGwsIGFuZCBpbnN0ZWFkIGl0cyBhZGRyZXNzIHNlcnZlcyBhcyBhbiBp
bmRpY2F0b3IKPj4+Pj4gdG8gdGhlIENQVT8gKEkgZXZlbiB2YWd1ZWx5IHJlY2FsbCBpdCBoYXZp
bmcgYmVlbiBjb25zaWRlcmVkIHRvCj4+Pj4+IGNvbnNvbGlkYXRlIHRoaXMsIHRvIGUuZy4gYSBz
aW5nbGUgcGFnZSBwZXIgZG9tYWluLikgSW4gd2hpY2gKPj4+Pj4gY2FzZSBldmVuIHAybV9hY2Nl
c3NfbiBtaWdodCBiZSBnb29kIGVub3VnaD8KPj4+Pgo+Pj4+IEhtLCBJIHRoaW5rIHAybV9hY2Nl
c3NfbiBpcyBub3QgZW5vdWdoLCBhcyB0aGF0IHdvdWxkIHRyaWdnZXIgYW4gRVBUCj4+Pj4gZmF1
bHQgd2hpY2ggaGFzIHByZWZlcmVuY2Ugb3ZlciB0aGUgQVBJQyBhY2Nlc3MgVk0gZXhpdCAoc2Vl
IDI5LjQuMQo+Pj4+IFByaW9yaXR5IG9mIEFQSUMtQWNjZXNzIFZNIEV4aXRzKS4KPj4+Cj4+PiBB
aCwgeWVzLCByZWFkaW5nIHRoYXQgdGV4dCBJIGFncmVlLiBIYXZpbmcganVzdCBhIHNpbmdsZSBz
dWNoIHBhZ2UKPj4+IHBlciBkb21haW4gd291bGQgc3RpbGwgc2VlbSBwb3NzaWJsZSwgdGhvdWdo
LiBBbHRob3VnaCwgaWYgd2UgbWVhbnQKPj4+IHRvIHN1cHBvcnQgYSBndWVzdCBtb3ZpbmcgdGhl
IEFQSUMgYmFzZSBhZGRyZXNzLCB0aGVuIHdlIGNvdWxkbid0LAo+Pj4gYWdhaW4uCj4+Pgo+Pj4+
IEkgdGhpbmsgc2V0dGluZyBpdCB0byBwMm1fYWNjZXNzX3J3IHNob3VsZCBiZSBlbm91Z2gsIGFu
ZCB3ZSB3b3VsZCBnZXQKPj4+PiBFUFQgZmF1bHRzIHdoZW4gdHJ5aW5nIHRvIGV4ZWN1dGUgZnJv
bSBBUElDIHBhZ2UuCj4+Pgo+Pj4gVGhlbiB0aGUgb3RoZXIgcXVlc3Rpb24gaXMgd2hldGhlciB0
aGVyZSdzIGFueSB1c2UgZm9yIGludHJvc3BlY3Rpb24KPj4+IHRvIGZ1cnRoZXIgbGltaXQgcGVy
bWlzc2lvbnMgb24gdGhpcyAoa2luZCBvZiBmYWtlKSBwYWdlLiBUYW1hcz8KPj4KPj4gSSdtIG5v
dCBhd2FyZSBvZiBhbnkgdXNlLWNhc2UgdGhhdCB3b3VsZCByZXN0cmljdCB0aGUgRVBUIHBlcm1p
c3Npb24KPj4gZm9yIE1NSU8gcGFnZXMuIFRoYXQgc2FpZCwgYW4gYXBwbGljYXRpb24gY291bGQg
c3RpbGwgcmVxdWVzdCB0aGF0IHRvCj4+IGJlIHNldCBsYXRlciBvbi4gU2luY2UgdGhpcyBmdW5j
dGlvbiBoZXJlIGdldHMgY2FsbGVkIGluCj4+IHZteF9kb21haW5faW5pdGlhbGlzZSBJIHN1c3Bl
Y3QgYSBtZW1fYWNjZXNzIHVzZXIgZGlkbid0IGV2ZW4gaGF2ZSBhCj4+IGNoYW5jZSB0byBjaGFu
Z2UgdGhlIGRlZmF1bHRfYWNjZXNzIHRvIGFueXRoaW5nIGN1c3RvbSBzbyBJIHZlbnR1cmUgaXQK
Pj4gd291bGQgYmUgc2FmZSB0byBjaG9vc2Ugd2hhdGV2ZXIgcGVybWlzc2lvbiBpcyBzZW5zaWJs
ZS4gSWYgYW55b25lCj4+IHdhbnRzIHRvIG1lc3Mgd2l0aCB0aGUgcGVybWlzc2lvbiBsYXRlciB0
aGV5IGNhbiBkbyB0aGF0IHJlZ2FyZGxlc3Mgb2YKPj4gd2hhdCB3YXMgc2V0IGhlcmUuCj4gCj4g
T25lIHRoaW5nIHRvIGFkZCB0aG91Z2ggcmVnYXJkaW5nIHVzaW5nIHAybV9hY2Nlc3NfcncgaGVy
ZSBpcyB0aGF0IGluCj4gY2FzZSBzb21ldGhpbmcgd291bGQgdHJpZ2dlciBhbiBYIHZpb2xhdGlv
biBpdCB3b3VsZCBsZWFkIHRvIGFuIGV2ZW50Cj4gYmVpbmcgc2VudCB0byBhIHZtX2V2ZW50IHN1
YnNjcmliZXIsIHdoaWNoIHRoZXkgbWF5IG5vdCBiZSBhYmxlIHRvCj4gbWFrZSBzZW5zZSBvZi4K
CkhtbSwgZ29vZCBwb2ludC4KCj4gU28gSSB3b3VsZCBzdWdnZXN0IHRoYXQgaWYgeW91IHdhbnQg
dG8gbWFrZSB0aGlzCj4gcGFnZXRhYmxlIGVudHJ5IFIvVyBvbmx5IHRvIHVzZSBhIHAybV90eXBl
IGZvciB0aGF0IGluc3RlYWQgb2YgYQo+IHAybV9hY2Nlc3MuCgpUaGlzIHdvdWxkIHRoZW4gdGFr
ZSBhIGZ1cnRoZXIgdHlwZSBkZXJpdmVkIGZyb20gcDJtX21taW9fZGlyZWN0LAp3aXRoIGl0cyBk
cml2aW5nIG1vdmVkIHRvIHRoZSBoeXBlcmNhbGwgaW50ZXJmYWNlIChhcyBYZW4gY2FuJ3QKdGVs
bCB3aGljaCBvbmUgaXMgd2hpY2gsIGUuZy4gUk9NIHZzICJvcmRpbmFyeSIgTU1JTywgX2V4Y2Vw
dF8gaW4KdGhpcyBzcGVjaWFsIGNhc2UgaGVyZSkuIFNvIEkgZ3Vlc3MgdGhlIHBhdGNoIGFzIGlz
IGxvb2tzIHRvIGJlCnRoZSBiZXR0ZXIgYWx0ZXJuYXRpdmUgb3ZlcmFsbC4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
