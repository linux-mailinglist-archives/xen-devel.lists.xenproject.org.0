Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3DE14B3B3
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 12:45:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwPFb-0002vR-Qw; Tue, 28 Jan 2020 11:41:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwPFa-0002vM-Ph
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 11:41:46 +0000
X-Inumbo-ID: 292b89ae-41c3-11ea-8689-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 292b89ae-41c3-11ea-8689-12813bfff9fa;
 Tue, 28 Jan 2020 11:41:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9E74EAD45;
 Tue, 28 Jan 2020 11:41:44 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200124153103.18321-1-pdurrant@amazon.com>
 <20200124153103.18321-5-pdurrant@amazon.com>
 <20130b6d-4428-6045-7e84-cd3b55d04ca8@suse.com>
 <feb92ac6511b4517a3c78cf49d182165@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <68c04abb-3994-7895-6753-29bf9c7ed631@suse.com>
Date: Tue, 28 Jan 2020 12:41:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <feb92ac6511b4517a3c78cf49d182165@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 4/7] x86 / vmx: move teardown from
 domain_destroy()...
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAyMCAwOToyMiwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
PiBTZW50OiAyOCBKYW51YXJ5IDIwMjAgMDg6MTUKPj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJy
YW50QGFtYXpvbi5jby51az4KPj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsg
SnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPjsKPj4gS2V2aW4gVGlhbiA8a2V2
aW4udGlhbkBpbnRlbC5jb20+OyBBbmRyZXcgQ29vcGVyCj4+IDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kKPj4gPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29t
Pgo+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDQvN10geDg2IC8gdm14OiBtb3ZlIHRlYXJkb3du
IGZyb20KPj4gZG9tYWluX2Rlc3Ryb3koKS4uLgo+Pgo+PiBPbiAyNC4wMS4yMDIwIDE2OjMxLCBQ
YXVsIER1cnJhbnQgd3JvdGU6Cj4+PiAuLi4gdG8gZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2Vz
KCkuCj4+Pgo+Pj4gVGhlIHRlYXJkb3duIGNvZGUgZnJlZXMgdGhlIEFQSUN2IHBhZ2UuIFRoaXMg
ZG9lcyBub3QgbmVlZCB0byBiZSBkb25lCj4+IGxhdGUKPj4+IHNvIGRvIGl0IGluIGRvbWFpbl9y
ZWxpbnF1aXNoX3Jlc291cmNlcygpIHJhdGhlciB0aGFuIGRvbWFpbl9kZXN0cm95KCkuCj4+Cj4+
IEZvciB0aGUgbm9ybWFsIGRvbWFpbiBkZXN0cnVjdGlvbiBwYXRoIHRoaXMgaXMgZmluZS4gRm9y
IHRoZSBlcnJvciBwYXRoCj4+IG9mIGRvbWFpbl9jcmVhdGUoKSwgaG93ZXZlciwgdGhpcyB3aWxs
IGxlYWsgdGhlIHBhZ2UsIGFzIGluIHRoaXMgY2FzZQo+PiBodm1fZG9tYWluX3JlbGlucXVpc2hf
cmVzb3VyY2VzKCkgd29uJ3QgYmUgY2FsbGVkLgo+IAo+IFdlbGwgaXQncyByZWFsbHkgYXJjaF9k
b21haW5fY3JlYXRlKCkgdGhhdCdzIGF0IGZhdWx0IGJ1dCwgeWVzIHRoYXQgbmVlZHMgZml4aW5n
LgoKV2h5IGFyY2hfZG9tYWluX2NyZWF0ZSgpPyBGb3IgSFZNIGRvbWFpbnMgaHZtX2RvbWFpbl9p
bml0aWFsaXNlKCkKaXMgdGhlIGxhc3QgdGhpbmcgdHJpZWQsIGFuZCBoZW5jZSBubyBmdXJ0aGVy
IGNsZWFudXAgaXMgbmVlZGVkCihhc3N1bWluZyBodm1fZG9tYWluX2luaXRpYWxpc2UoKSBjbGVh
bnMgdXAgaW4gY2FzZSBvZiBmYWlsdXJlCmFmdGVyIGl0c2VsZikuIEl0J3MgZmFpbHVyZXMgZW5j
b3VudGVyZWQgYnkgZG9tYWluX2NyZWF0ZSgpIGFmdGVyCmFyY2hfZG9tYWluX2NyZWF0ZSgpIGhh
cyBzdWNjZWVkZWQgd2hpY2ggYXJlIGEgcHJvYmxlbSBoZXJlLiBJbgp0aGlzIGNhc2UgYXJjaF9k
b21haW5fZGVzdHJveSgpIHdpbGwgYmUgY2FsbGVkLCBidXQgbm90aGluZyBkb3duCmZyb20gdGhl
cmUgaGFzIGNhbGxlZCBodm1fZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkgc28gZmFyLgoK
Pj4gSSdtIGFmcmFpZCB0aGVyZQo+PiBhbHJlYWR5IGlzIGEgc2ltaWxhciBpc3N1ZSB3aXRoIGUu
Zy4gdmlyaWRpYW5fZG9tYWluX2RlaW5pdCgpLiBJIGd1ZXNzCj4+IEknbGwgbWFrZSBhIHBhdGNo
Lgo+IAo+IE9rLCB0aGFua3MuCgpXaGljaCB0dXJuZWQgb3V0IHRvIHRha2UgbW9yZSB0aW1lIGJl
Y2F1c2Ugb2Ygb3RoZXIgaXNzdWVzIEkndmUKZm91bmQgaW4gdGhlIGNvdXJzZSwgYnV0IEkgdGhp
bmsgSSBub3cgaGF2ZSBzb21ldGhpbmcgSSBjYW4KYWN0dWFsbHkgdGVzdC4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
