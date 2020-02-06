Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D28181543C5
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 13:09:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izfvx-00042g-1k; Thu, 06 Feb 2020 12:07:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I8Ts=32=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1izfvv-00042Z-Mj
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 12:06:59 +0000
X-Inumbo-ID: 2d224788-48d9-11ea-8080-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d224788-48d9-11ea-8080-bc764e2007e4;
 Thu, 06 Feb 2020 12:06:59 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izfvu-0001v8-0l; Thu, 06 Feb 2020 12:06:58 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izfvt-0003Q7-IT; Thu, 06 Feb 2020 12:06:57 +0000
Date: Thu, 6 Feb 2020 12:06:54 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200206120654.qi5v5lpdqdeulnnl@debian>
References: <20200204165535.17214-1-liuwe@microsoft.com>
 <6e488f84-bc56-5bcf-0c60-3cdee48770e8@suse.com>
 <20200204171959.pejeoqfg4n37gno6@debian>
 <c31b8129-2c6a-17c5-b30b-c3a2ff577768@suse.com>
 <20200205114539.c4kduolb3va3vrdf@debian>
 <20200206113403.7watd75fiaciekvu@debian>
 <3f6efcf0-5bed-880c-8cc4-726c8b2d73ae@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f6efcf0-5bed-880c-8cc4-726c8b2d73ae@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86: fix off-by-one error when printing
 memory ranges
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMDYsIDIwMjAgYXQgMTI6Mzg6MzdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDYuMDIuMjAyMCAxMjozNCwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFdlZCwgRmVi
IDA1LCAyMDIwIGF0IDExOjQ1OjM5QU0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6Cj4gPj4gT24gV2Vk
LCBGZWIgMDUsIDIwMjAgYXQgMDk6MTI6NTBBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4g
Pj4+IE9uIDA0LjAyLjIwMjAgMTg6MTksIFdlaSBMaXUgd3JvdGU6Cj4gPj4+PiBPbiBUdWUsIEZl
YiAwNCwgMjAyMCBhdCAwNjowNzowMFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4+
PiBPbiAwNC4wMi4yMDIwIDE3OjU1LCBXZWkgTGl1IHdyb3RlOgo+ID4+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+ID4+Pj4+PiAtLS0KPiA+Pj4+Pj4g
IHhlbi9hcmNoL3g4Ni9lODIwLmMgfCAyICstCj4gPj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Pj4+Pj4KPiA+Pj4+Pj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9lODIwLmMgYi94ZW4vYXJjaC94ODYvZTgyMC5jCj4gPj4+Pj4+IGluZGV4
IGI5ZjU4OWNhYzMuLmQ2NzM4N2YxMzcgMTAwNjQ0Cj4gPj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9lODIwLmMKPiA+Pj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L2U4MjAuYwo+ID4+Pj4+PiBAQCAt
OTQsNyArOTQsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcHJpbnRfZTgyMF9tZW1vcnlfbWFwKHN0
cnVjdCBlODIwZW50cnkgKm1hcCwgdW5zaWduZWQgaW50IGVudAo+ID4+Pj4+PiAgICAgIGZvciAo
aSA9IDA7IGkgPCBlbnRyaWVzOyBpKyspIHsKPiA+Pj4+Pj4gICAgICAgICAgcHJpbnRrKCIgJTAx
Nkx4IC0gJTAxNkx4ICIsCj4gPj4+Pj4+ICAgICAgICAgICAgICAgICAodW5zaWduZWQgbG9uZyBs
b25nKShtYXBbaV0uYWRkciksCj4gPj4+Pj4+IC0gICAgICAgICAgICAgICAodW5zaWduZWQgbG9u
ZyBsb25nKShtYXBbaV0uYWRkciArIG1hcFtpXS5zaXplKSk7Cj4gPj4+Pj4+ICsgICAgICAgICAg
ICAgICAodW5zaWduZWQgbG9uZyBsb25nKShtYXBbaV0uYWRkciArIG1hcFtpXS5zaXplKSAtIDEp
Owo+ID4+Pj4+Cj4gPj4+Pj4gV2h5IHdhcyB0aGlzIGFuIGVycm9yPyBJZiB3ZSB1c2VkIFssXSBs
aWtlIExpbnV4IGRvZXMgLSBzdXJlLgo+ID4+Pj4+IEJ1dCB3ZSBkb24ndC4gVGhlIHByZXNlbnRh
dGlvbiwgd2l0aG91dCBsb29raW5nIGF0IHRoZSBzb3VyY2UsCj4gPj4+Pj4gc2ltcGx5IGxlYXZl
cyBvcGVuIHdoZXRoZXIgdGhpcyB3YXMgbWVhbnQgdG8gYmUgWyxdIG9yIFssKS4KPiA+Pj4+PiBB
bmQgaXQgY29udGludWVzIHRvIGJlIGxlZnQgb3BlbiB3aXRoIHRoZSBhZGp1c3RtZW50IG1hZGUu
Cj4gPj4+Pj4KPiA+Pj4+Cj4gPj4+PiBXZWxsLCBMaW51eCdzIHJlcHJlc2VudGF0aW9uIGlzIG5v
dCB3aGF0IGlzIG5vcm1hbGx5IGRvbmUgaW4gbWF0aAo+ID4+Pj4gZWl0aGVyLgo+ID4+Pj4KPiA+
Pj4+IEl0IGlzIGxpa2UKPiA+Pj4+Cj4gPj4+PiAgIFhlbjogW21lbSAweDAwMDAwMDAwMDAwMDAw
MDAtMHgwMDAwMDAwMDAwMDllZmZmXSB1c2FibGUKPiA+Pj4+Cj4gPj4+PiBOb3RlIGl0IGlzIHVz
aW5nICctJywgbm90ICcsJy4gQW5kIHRoZXJlIGlzICJtZW0iIGF0IHRoZSBiZWdpbm5pbmcuCj4g
Pj4+Pgo+ID4+Pj4gSSBoYXZlIGFsd2F5cyBpbnRlcnByZXRlZCB0aGUgW10gcGFpciBhcyBzb21l
dGhpbmcgdG8gZW5jbG9zZSB0aGUgcmFuZ2UsCj4gPj4+PiBub3Qgb2YgbWF0aGVtYXRpY2FsbHkg
bWVhbmluZy4KPiA+Pj4+Cj4gPj4+PiBJZiB5b3Ugd2FudCwgSSBjYW4gY2hhbmdlIFhlbidzIGZv
cm1hdCBzdHJpbmcgdG8gIlslMDE2THgsICUwMTZMeF0iLgo+ID4+Pgo+ID4+PiBJIHRoaW5rIHRo
aXMgd291bGQgbWFrZSB0aGluZ3MgbGVzcyBhbWJpZ3VvdXMsIHllcy4gQnV0IG15IHByaW1hcnkK
PiA+Pj4gcmVxdWVzdCBoZXJlIGlzIHRvIGhhdmUgbmVpdGhlciAiZml4IiBub3IgImVycm9yIiBu
b3IgYW55dGhpbmcKPiA+Pj4gYWxpa2UgaW4gdGhlIHRpdGxlIG9yIGRlc2NyaXB0aW9uLgo+ID4+
Cj4gPj4gT0suIEkgY2FuIGNlcnRhaW5seSBjaGFuZ2UgdGhlIHN1YmplY3QgbGluZSB0bwo+ID4+
Cj4gPj4gICB4ODY6IHN1YnRyYWN0IDEgd2hlbiBwcmludGluZyBlODIwIHJhbmdlcwo+ID4gCj4g
PiBJZiBJIGhlYXIgbm8gZnVydGhlciBvYmplY3Rpb25zIEkgd2lsbCBjb21taXQgdGhpcyBwYXRj
aCB3aXRoIHRoZSBhYm92ZQo+ID4gc3ViamVjdCBsaW5lIHRvZGF5Lgo+IAo+IEFuZCB3aXRoIHRo
ZSBwcmVzZW50YXRpb24gY2hhbmdlZCB0byBbLF0/CgpGaW5lIGJ5IG1lIHRvby4gSSB3aWxsIHBv
c3QgYSBuZXcgcGF0Y2ggc2hvcnRseS4KCldlaS4KCj4gCj4gSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
