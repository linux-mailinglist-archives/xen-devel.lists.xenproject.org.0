Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0268D155C47
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 17:59:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j06u5-0000ip-FO; Fri, 07 Feb 2020 16:54:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KURy=33=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j06u3-0000ib-Im
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 16:54:51 +0000
X-Inumbo-ID: 8dc0d0e0-49ca-11ea-a677-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8dc0d0e0-49ca-11ea-a677-bc764e2007e4;
 Fri, 07 Feb 2020 16:54:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 20539AC50;
 Fri,  7 Feb 2020 16:54:49 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <da353fee-b7f7-73ab-9ebe-632b4ea4152d@suse.com>
 <5ecf685c-7109-4ad6-cba9-bb138f750268@suse.com>
 <20200207095249.GB4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <86e31583-7f4c-c365-17f1-92b82acb5d81@suse.com>
Date: Fri, 7 Feb 2020 17:54:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200207095249.GB4679@Air-de-Roger>
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDIuMjAyMCAxMDo1MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEZl
YiAwNywgMjAyMCBhdCAwOTowODoxNUFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MDYuMDIuMjAyMCAxNjoyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94
ODYvaHZtL3ZteC92bXguYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPj4+
IEBAIC0zMDM3LDkgKzMwMzcsOCBAQCBzdGF0aWMgaW50IHZteF9hbGxvY192bGFwaWNfbWFwcGlu
ZyhzdHJ1Cj4+PiAgICAgIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3QocGcsIGQsIFNIQVJFX3J3
KTsKPj4+ICAgICAgZC0+YXJjaC5odm0udm14LmFwaWNfYWNjZXNzX21mbiA9IG1mbjsKPj4+ICAK
Pj4+IC0gICAgcmV0dXJuIHNldF9tbWlvX3AybV9lbnRyeShkLCBwYWRkcl90b19wZm4oQVBJQ19E
RUZBVUxUX1BIWVNfQkFTRSksIG1mbiwKPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBQQUdFX09SREVSXzRLLAo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV9n
ZXRfaG9zdHAybShkKS0+ZGVmYXVsdF9hY2Nlc3MpOwo+Pj4gKyAgICByZXR1cm4gc2V0X21taW9f
cDJtX2VudHJ5KGQsIGdhZGRyX3RvX2dmbihBUElDX0RFRkFVTFRfUEhZU19CQVNFKSwgbWZuLAo+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBBR0VfT1JERVJfNEspOwo+Pj4gIH0K
Pj4KPj4gVXBvbiAybmQgdGhvdWdodCAtIGRvZXMgdGhpcyByZWFsbHkgd2FudCB0byB1c2UgZGVm
YXVsdCBhY2Nlc3M/Cj4+IEV4ZWN1dGUgcGVybWlzc2lvbiBmb3IgdGhpcyBwYWdlIGxvb2tzIGEg
bGl0dGxlIHN1c3BpY2lvdXMuCj4+IElzbid0IGl0IHRoZSBjYXNlIHRoYXQgdGhpcyBwYWdlIGRv
ZXNuJ3QgKG5vcm1hbGx5PykgZ2V0Cj4+IGFjY2Vzc2VkIGF0IGFsbCwgYW5kIGluc3RlYWQgaXRz
IGFkZHJlc3Mgc2VydmVzIGFzIGFuIGluZGljYXRvcgo+PiB0byB0aGUgQ1BVPyAoSSBldmVuIHZh
Z3VlbHkgcmVjYWxsIGl0IGhhdmluZyBiZWVuIGNvbnNpZGVyZWQgdG8KPj4gY29uc29saWRhdGUg
dGhpcywgdG8gZS5nLiBhIHNpbmdsZSBwYWdlIHBlciBkb21haW4uKSBJbiB3aGljaAo+PiBjYXNl
IGV2ZW4gcDJtX2FjY2Vzc19uIG1pZ2h0IGJlIGdvb2QgZW5vdWdoPwo+IAo+IEhtLCBJIHRoaW5r
IHAybV9hY2Nlc3NfbiBpcyBub3QgZW5vdWdoLCBhcyB0aGF0IHdvdWxkIHRyaWdnZXIgYW4gRVBU
Cj4gZmF1bHQgd2hpY2ggaGFzIHByZWZlcmVuY2Ugb3ZlciB0aGUgQVBJQyBhY2Nlc3MgVk0gZXhp
dCAoc2VlIDI5LjQuMQo+IFByaW9yaXR5IG9mIEFQSUMtQWNjZXNzIFZNIEV4aXRzKS4KCkFoLCB5
ZXMsIHJlYWRpbmcgdGhhdCB0ZXh0IEkgYWdyZWUuIEhhdmluZyBqdXN0IGEgc2luZ2xlIHN1Y2gg
cGFnZQpwZXIgZG9tYWluIHdvdWxkIHN0aWxsIHNlZW0gcG9zc2libGUsIHRob3VnaC4gQWx0aG91
Z2gsIGlmIHdlIG1lYW50CnRvIHN1cHBvcnQgYSBndWVzdCBtb3ZpbmcgdGhlIEFQSUMgYmFzZSBh
ZGRyZXNzLCB0aGVuIHdlIGNvdWxkbid0LAphZ2Fpbi4KCj4gSSB0aGluayBzZXR0aW5nIGl0IHRv
IHAybV9hY2Nlc3Nfcncgc2hvdWxkIGJlIGVub3VnaCwgYW5kIHdlIHdvdWxkIGdldAo+IEVQVCBm
YXVsdHMgd2hlbiB0cnlpbmcgdG8gZXhlY3V0ZSBmcm9tIEFQSUMgcGFnZS4KClRoZW4gdGhlIG90
aGVyIHF1ZXN0aW9uIGlzIHdoZXRoZXIgdGhlcmUncyBhbnkgdXNlIGZvciBpbnRyb3NwZWN0aW9u
CnRvIGZ1cnRoZXIgbGltaXQgcGVybWlzc2lvbnMgb24gdGhpcyAoa2luZCBvZiBmYWtlKSBwYWdl
LiBUYW1hcz8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
