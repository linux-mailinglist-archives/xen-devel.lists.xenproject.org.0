Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D032C177920
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 15:36:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j98cc-0007we-3e; Tue, 03 Mar 2020 14:34:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j98ca-0007wZ-Vr
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 14:34:09 +0000
X-Inumbo-ID: 0a3b3a1c-5d5c-11ea-8adc-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a3b3a1c-5d5c-11ea-8adc-bc764e2007e4;
 Tue, 03 Mar 2020 14:34:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 51386B307;
 Tue,  3 Mar 2020 14:34:07 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <1e1ccd2a-526c-631b-7889-35f993b2005e@suse.com>
 <146b8935-2a48-2de7-4c21-8390b6846c05@suse.com>
 <e1293a6fcb0942bda81a5690c20a6771@EX13D32EUC003.ant.amazon.com>
 <2bb05913-2573-4799-aa96-d9d0e2d74f0b@suse.com>
 <bd5988b9966b403991f4059216bfb93e@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e98154a1-425d-028c-bb93-42fa7d6aa75e@suse.com>
Date: Tue, 3 Mar 2020 15:34:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <bd5988b9966b403991f4059216bfb93e@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 1/4] x86/HVM: cancel emulation when
 register state got altered
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
Cc: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAyMCAxNToyNSwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
PiBTZW50OiAwMyBNYXJjaCAyMDIwIDE0OjIxCj4+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFu
dEBhbWF6b24uY28udWs+Cj4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEFu
ZHJldyBDb29wZXIKPj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaQo+PiBMaXUgPHdsQHhlbi5vcmc+OyBQYXVs
IER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KPj4gU3ViamVjdDogUkU6IFtFWFRFUk5BTF1bWGVuLWRl
dmVsXSBbUEFUQ0ggdjUgMS80XSB4ODYvSFZNOiBjYW5jZWwKPj4gZW11bGF0aW9uIHdoZW4gcmVn
aXN0ZXIgc3RhdGUgZ290IGFsdGVyZWQKPj4KPj4gT24gMDMuMDMuMjAyMCAxNDoxNiwgRHVycmFu
dCwgUGF1bCB3cm90ZToKPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+Pj4+IEZyb206
IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJl
aGFsZiBPZgo+PiBKYW4KPj4+PiBCZXVsaWNoCj4+Pj4gU2VudDogMDMgTWFyY2ggMjAyMCAxMDox
Nwo+Pj4+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPj4+PiBDYzogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kKPj4+
PiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUGF1bCBEdXJy
YW50Cj4+IDxwYXVsQHhlbi5vcmc+Cj4+Pj4gU3ViamVjdDogW0VYVEVSTkFMXVtYZW4tZGV2ZWxd
IFtQQVRDSCB2NSAxLzRdIHg4Ni9IVk06IGNhbmNlbCBlbXVsYXRpb24KPj4+PiB3aGVuIHJlZ2lz
dGVyIHN0YXRlIGdvdCBhbHRlcmVkCj4+Pj4KPj4+PiBSZS1leGVjdXRpb24gKGFmdGVyIGhhdmlu
ZyByZWNlaXZlZCBkYXRhIGZyb20gYSBkZXZpY2UgbW9kZWwpIHJlbGllcyBvbgo+Pj4+IHRoZSBz
YW1lIHJlZ2lzdGVyIHN0YXRlIHN0aWxsIGJlaW5nIGluIHBsYWNlIGFzIGl0IHdhcyB3aGVuIHRo
ZSByZXF1ZXN0Cj4+Pj4gd2FzIGZpcnN0IHNlbnQgdG8gdGhlIGRldmljZSBtb2RlbC4gVGhlcmVm
b3JlIHZDUFUgc3RhdGUgY2hhbmdlcwo+Pj4+IGVmZmVjdGVkIGJ5IHJlbW90ZSBzb3VyY2VzIG5l
ZWQgdG8gcmVzdWx0IGluIG5vIGF0dGVtcHQgb2YgcmUtCj4+IGV4ZWN1dGlvbi4KPj4+PiBJbnN0
ZWFkIHRoZSByZXR1cm5lZCBkYXRhIGlzIHRvIHNpbXBseSBiZSBpZ25vcmVkLgo+Pj4+Cj4+Pj4g
Tm90ZSB0aGF0IGFueSBzdWNoIGFzeW5jaHJvbm91cyBzdGF0ZSBjaGFuZ2VzIGhhcHBlbiB3aXRo
IHRoZSB2Q1BVIGF0Cj4+Pj4gbGVhc3QgcGF1c2VkIChwb3RlbnRpYWxseSBkb3duIGFuZC9vciBu
b3QgbWFya2VkIC0+aXNfaW5pdGlhbGlzZWQpLCBzbwo+Pj4+IHRoZXJlJ3Mgbm8gaXNzdWUgd2l0
aCBmaWRkbGluZyB3aXRoIHJlZ2lzdGVyIHN0YXRlIGJlaGluZCB0aGUgYWN0aXZlbHkKPj4+PiBy
dW5uaW5nIGVtdWxhdG9yJ3MgYmFjay4gSGVuY2UgdGhlIG5ldyBmdW5jdGlvbiBkb2Vzbid0IG5l
ZWQgdG8KPj4+PiBzeW5jaHJvbml6ZSB3aXRoIHRoZSBjb3JlIGVtdWxhdGlvbiBsb2dpYy4KPj4+
Pgo+Pj4+IFN1Z2dlc3RlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Cj4+Pgo+Pj4gTmVlZCB3ZSBiZSBjb25jZXJuZWQgd2l0aCBhbnkgcGFnZS1zcGxpdCBJL08gaGVy
ZT8gVGhhdCBtYXkgbWFuaWZlc3QgYXMKPj4+IHR3byBzZXBhcmF0ZSBlbXVsYXRpb25zIGFuZCBB
RkFJQ1QgaXQgd291bGQgYmUgcG9zc2libGUgZm9yIG9ubHkgdGhlCj4+PiBzZWNvbmQgcGFydCB0
byBiZSBhYm9ydGVkIGJ5IHRoaXMgY2hhbmdlLgo+Pgo+PiBJJ20gbm90IHN1cmUgd2hldGhlciBl
LmcuIElOSVQgaXMgcmVjb2duaXplZCBvbmx5IG9uIGluc24gYm91bmRhcmllcy4KPj4gSS5lLiB0
aGlzIG1heSBub3QgYmUgdGhhdCBkaWZmZXJlbnQgZnJvbSByZWFsIGhhcmR3YXJlIGJlaGF2aW9y
LiBfSWZfCj4+IHdlIHdlcmUgdG8gdGFrZSBjYXJlIG9mIHRoaXMsIGhvdyB3b3VsZCB5b3UgZW52
aXNpb24gdW5kb2luZyB0aGUKPj4gZmlyc3QgcGFydCBvZiBzdWNoIGFuIGFjY2VzcywgbW9zdCBu
b3RhYmx5IHdoZW4gdGhlIGFjY2VzcyBoYXMgc2lkZQo+PiBlZmZlY3RzPwo+IAo+IEkgd2Fzbid0
IHRoaW5raW5nIG9mIHVuZG9pbmcuLi4gSSB3YXMgbW9yZSB0aGlua2luZyB0aGF0IHZjcHVfcGF1
c2UoKQo+IG91Z2h0IHRvIGRlZmVyIHVudGlsIGFuIGluLXByb2dyZXNzIGVtdWxhdGlvbiBoYXMg
ZnVsbHkgY29tcGxldGVkLgoKSG1tLCBhdCB0aGUgZmlyc3QgZ2xhbmNlIHRoaXMgbG9va3MgdWds
eS9mcmFnaWxlIHRvIGFycmFuZ2UgZm9yLiBJJ20KaGF2aW5nIGEgaGFyZCB0aW1lIHRoaW5raW5n
IG9mIGEgcm91Z2ggc2tldGNoIG9mIGhvdyBzdWNoIGNvdWxkIGJlCm1hZGUgd29yaywgaW4gcGFy
dGljdWxhciB3aXRob3V0IGJsb2NraW5nIHRoZSB2Y3B1X3BhdXNlKCkgaXRzZWxmCmZvciB0b28g
bG9uZy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
