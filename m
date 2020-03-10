Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FC017F435
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 10:55:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBbYi-0007wd-Vb; Tue, 10 Mar 2020 09:52:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBbYh-0007wY-Hi
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 09:52:19 +0000
X-Inumbo-ID: d45dae62-62b4-11ea-bc08-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d45dae62-62b4-11ea-bc08-bc764e2007e4;
 Tue, 10 Mar 2020 09:52:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AF068AD86;
 Tue, 10 Mar 2020 09:52:17 +0000 (UTC)
To: "Tian, Kevin" <kevin.tian@intel.com>
References: <1e1ccd2a-526c-631b-7889-35f993b2005e@suse.com>
 <b9aa8053-b35b-1d0f-8303-abc39e1ae17d@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5BBA@SHSMSX104.ccr.corp.intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1e0237c7-dba5-29c9-b75f-d24abe1db52c@suse.com>
Date: Tue, 10 Mar 2020 10:52:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5BBA@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 2/4] x86/HVM: implement memory read
 caching for insn emulation
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAwMzozOSwgVGlhbiwgS2V2aW4gd3JvdGU6Cj4+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gU2VudDogVHVlc2RheSwgTWFyY2ggMywgMjAyMCA2
OjE3IFBNCj4+Cj4+IEVtdWxhdGlvbiByZXF1aXJpbmcgZGV2aWNlIG1vZGVsIGFzc2lzdGFuY2Ug
dXNlcyBhIGZvcm0gb2YgaW5zdHJ1Y3Rpb24KPj4gcmUtZXhlY3V0aW9uLCBhc3N1bWluZyB0aGF0
IHRoZSBzZWNvbmQgKGFuZCBhbnkgZnVydGhlcikgcGFzcyB0YWtlcwo+PiBleGFjdGx5IHRoZSBz
YW1lIHBhdGguIFRoaXMgaXMgYSB2YWxpZCBhc3N1bXB0aW9uIGFzIGZhciBhcyB1c2Ugb2YgQ1BV
Cj4gCj4gYWgsIEkgd2FzIG5vdCBhd2FyZSBvZiBzdWNoIGZvcm0uIEkgdGhvdWdodCB0aGUgZW11
bGF0aW9uIGlzIHNwbGl0Cj4gaW50byB0d28gcGhhc2VzOiBkZWNvZGluZyBhbmQgc2VuZCBpL28g
cmVxdWVzdCB0byBkZXZpY2UgbW9kZWwsIGFuZAo+IHRoZW4gY29tcGxldGluZyBpbnN0IGVtdWxh
dGlvbiB3aXRoIGRldmljZSBtb2RlbCdzIHJlc3BvbnNlIGFuZAo+IHByZXZpb3VzbHktZGVjb2Rl
ZCBpbmZvcm1hdGlvbi4uLiAKCkluIHRoZW9yeSB0aGlzIHdvdWxkIGJlIGFuIG9wdGlvbiwgYnV0
IHdvdWxkIHJlcXVpcmUgc3RvcmluZyBxdWl0ZQphIGJpdCBtb3JlIGluZm9ybWF0aW9uIHRvIGJl
IGFibGUgdG8gcmVzdW1lIHdpdGhvdXQgZ29pbmcgdGhyb3VnaApkZWNvZGUgYWdhaW4uIFBsdXMg
aXQncyBub3QgZGVjb2RlIGFsb25lIHdoaWNoIG1hdHRlcnMsIHBhZ2Ugd2Fsa3MKZHVyaW5nIHRo
ZSBleGVjdXRpb24gcGhhc2UsIGZvciBleGFtcGxlLCBhbHNvIG5lZWQgdG8gbWF0Y2guCgo+PiBy
ZWdpc3RlcnMgZ29lcyAoYXMgdGhvc2UgY2FuJ3QgY2hhbmdlIHdpdGhvdXQgYW55IG90aGVyIGlu
c3RydWN0aW9uCj4+IGV4ZWN1dGluZyBpbiBiZXR3ZWVuIFsxXSksIGJ1dCBpcyB3cm9uZyBmb3Ig
bWVtb3J5IGFjY2Vzc2VzLiBJbgo+PiBwYXJ0aWN1bGFyIGl0IGhhcyBiZWVuIG9ic2VydmVkIHRo
YXQgV2luZG93cyBtaWdodCBwYWdlIG91dCBidWZmZXJzCj4+IHVuZGVybmVhdGggYW4gaW5zdHJ1
Y3Rpb24gY3VycmVudGx5IHVuZGVyIGVtdWxhdGlvbiAoaGl0dGluZyBiZXR3ZWVuIHR3bwo+PiBw
YXNzZXMpLiBJZiB0aGUgZmlyc3QgcGFzcyByZWFkIGEgbWVtb3J5IG9wZXJhbmQgc3VjY2Vzc2Z1
bGx5LCBhbnkKPj4gc3Vic2VxdWVudCBwYXNzIG5lZWRzIHRvIGdldCB0byBzZWUgdGhlIGV4YWN0
IHNhbWUgdmFsdWUuCj4+Cj4+IEludHJvZHVjZSBhIGNhY2hlIHRvIG1ha2Ugc3VyZSBhYm92ZSBk
ZXNjcmliZWQgYXNzdW1wdGlvbiBob2xkcy4gVGhpcwo+PiBpcyBhIHZlcnkgc2ltcGxpc3RpYyBp
bXBsZW1lbnRhdGlvbiBmb3Igbm93OiBPbmx5IGV4YWN0IG1hdGNoZXMgYXJlCj4+IHNhdGlzZmll
ZCAobm8gb3ZlcmxhcHMgb3IgcGFydGlhbCByZWFkcyBvciBhbnl0aGluZyk7IHRoaXMgaXMgc3Vm
ZmljaWVudAo+PiBmb3IgdGhlIGltbWVkaWF0ZSBwdXJwb3NlIG9mIG1ha2luZyByZS1leGVjdXRp
b24gYW4gZXhhY3QgcmVwbGF5LiBUaGUKPj4gY2FjaGUgYWxzbyB3b24ndCBiZSB1c2VkIGp1c3Qg
eWV0IGZvciBndWVzdCBwYWdlIHdhbGtzOyB0aGF0J2xsIGJlIHRoZQo+PiBzdWJqZWN0IG9mIGEg
c3Vic2VxdWVudCBjaGFuZ2UuCj4gCj4gYSBjYWNoZSBpbXBsaWVzIHRoYXQgdGhlIGFmb3JlbWVu
dGlvbmVkIHR3by1wYXNzIHByb2JsZW0gaXMgb25seQo+IG1pdGlnYXRlZCBpbnN0ZWFkIG9mIGNv
bXBsZXRlbHkgZml4ZWQ/CgpObywgYWl1aSB0aGUgRW5nbGlzaCB3b3JkICJjYWNoZSIgaXMgYnJv
YWRlciB0aGFuIHdoYXQgaXQncyB0eXBpY2FsbHkKdXNlZCBmb3Igd2l0aCBjb21wdXRlcnMgaW4g
bWluZCAtIHNlZSBlLmcuIGl0cyB1c2UgaW4gImdlb2NhY2hpbmciLiBJCnJlYWxpemUgdGhlIHVz
ZSBvZiB0aGUgd29yZCBoZXJlIG1heSBjYXVzZSBtaXN1bmRlcnN0YW5kaW5ncywgYnV0IG15CnNl
ZWsgb2YgYSBiZXR0ZXIgdGVybSBpbiBlYXJsaWVyIHZlcnNpb25zIGhhc24ndCByZWFsbHkgbGVk
IHRvIGFueQpzdWdnZXN0aW9ucyBJJ2QgY29uc2lkZXIgc3RyaWN0bHkgYmV0dGVyLgoKPiBidHcg
aXMgdGhlcmUgYW55IHBlcmZvcm1hbmNlIGltcGFjdCBmcm9tIHRoaXMgcGF0Y2g/CgpTaW5jZSBj
b3JyZWN0bmVzcyBpcyB0aGUgZ29hbCwgSSBkaWRuJ3QgdGhpbmsgSSdkIG5lZWQgdG8gbWVhc3Vy
ZQp0aGluZ3MgdG8gc3VwcG9ydCB0aGUgdXRpbGl0eSBvZiB0aGUgY2hhbmdlcy4KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
