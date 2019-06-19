Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE014B902
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 14:46:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdZw3-0004dd-5M; Wed, 19 Jun 2019 12:43:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdZw1-0004dY-55
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 12:43:29 +0000
X-Inumbo-ID: d501ecc0-928f-11e9-a97e-7f656cae95e3
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d501ecc0-928f-11e9-a97e-7f656cae95e3;
 Wed, 19 Jun 2019 12:43:27 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 19 Jun 2019 06:43:25 -0600
Message-Id: <5D0A2DEC0200007800239AA5@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 19 Jun 2019 06:43:24 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B8567020000780021F24E@prv1-mh.provo.novell.com>
 <fae78615-6f38-d163-e245-c048b0938f0c@citrix.com>
In-Reply-To: <fae78615-6f38-d163-e245-c048b0938f0c@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v8 32/50] x86emul: support AVX512F gather
 insns
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE5LjA2LjE5IGF0IDE0OjA1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDMvMjAxOSAxMDo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFRoaXMgcmVx
dWlyZXMgZ2V0dGluZyBtb2RybV9yZWcgYW5kIHNpYl9pbmRleCBzZXQgY29ycmVjdGx5IGluIHRo
ZSBFVkVYCj4+IGNhc2UsIHRvIGFjY291bnQgZm9yIHRoZSBoaWdoIDE2IFtYWVpdTU0gcmVnaXN0
ZXJzLiBFeHRlbmQgdGhlCj4+IGFkanVzdG1lbnRzIHRvIG1vZHJtX3JtIGFzIHdlbGwsIHN1Y2gg
dGhhdCB4ODZfaW5zbl9tb2RybSgpIHdvdWxkCj4+IGNvcnJlY3RseSByZXBvcnQgcmVnaXN0ZXIg
bnVtYmVycyAodGhpcyB3YXMgYSBsYXRlbnQgaXNzdWUgb25seSBhcyB3ZQo+PiBkb24ndCBjdXJy
ZW50bHkgaGF2ZSBjYWxsZXJzIG9mIHRoYXQgZnVuY3Rpb24gd2hpY2ggd291bGQgY2FyZSBhYm91
dCBhbgo+PiBFVkVYIGNhc2UpLiBUaGUgYWRqdXN0bWVudCBpbiB0dXJuIHJlcXVpcmVzIGRyb3Bw
aW5nIHRoZSBhc3NlcnRpb24gZnJvbQo+PiBkZWNvZGVfZ3ByKCkgYXMgd2VsbCBhcyByZS1pbnRy
b2R1Y2luZyB0aGUgZXhwbGljaXQgbWFza2luZywgYXMgd2Ugbm93Cj4+IG5lZWQgdG8gYWN0aXZl
bHkgbWFzayBvZmYgdGhlIGhpZ2ggYml0IHdoZW4gYSBHUFIgaXMgbWVhbnQuCj4+IF9kZWNvZGVf
Z3ByKCkgaW52b2NhdGlvbnMgYWxzbyBuZWVkIHNsaWdodCBhZGp1c3RtZW50cywgd2hlbiBpbnZv
a2VkIGluCj4+IGdlbmVyaWMgY29kZSBhaGVhZCBvZiB0aGUgbWFpbiBzd2l0Y2goKS4gQWxsIG90
aGVyIHVzZXMgb2YgbW9kcm1fcmVnIGFuZAo+PiBtb2RybV9ybSBhbHJlYWR5IGdldCBzdWl0YWJs
eSBtYXNrZWQgd2hlcmUgbmVjZXNzYXJ5Lgo+Pgo+PiBUaGVyZSB3YXMgYWxzbyBhbiBlbmNvZGlu
ZyBtaXN0YWtlIGluIHRoZSBFVkVYIERpc3A4IHRlc3QgY29kZSwgd2hpY2gKPj4gd2FzIGJlbmln
biAoZHVlIHRvICVyZHggZ2V0dGluZyBzZXQgdG8gemVybykgdG8gYWxsIG5vbi12U0lCIHRlc3Rz
IGFzIGl0Cj4+IG1pc3Rha2VubHkgZW5jb2RlZCA8ZGlzcDg+KCVyZHgsJXJkeCkgaW5zdGVhZCBv
ZiA8ZGlzcDg+KCVyZHgsJXJpeikuIEluCj4+IHRoZSB2U0lCIGNhc2UgdGhpcyBtZWFudCA8ZGlz
cDg+KCVyZHgsJXptbTIpIGluc3RlYWQgb2YgdGhlIGludGVuZGVkCj4+IDxkaXNwOD4oJXJkeCwl
em1tNCkuCj4+Cj4+IExpa2V3aXNlIHRoZSBhY2Nlc3MgY291bnQgY2hlY2sgd2Fzbid0IGVudGly
ZWx5IGNvcnJlY3QgZm9yIHRoZSBTL0cKPj4gY2FzZTogSW4gdGhlIHF1YWQtd29yZC1pbmRleCBi
dXQgZHdvcmQtZGF0YSBjYXNlIG9ubHkgaGFsZiB0aGUgbnVtYmVyCj4+IG9mIGZ1bGwgdmVjdG9y
IGVsZW1lbnRzIGdldCBhY2Nlc3NlZC4KPj4KPj4gQXMgYW4gdW5yZWxhdGVkIGNoYW5nZSBpbiB0
aGUgbWFpbiB0ZXN0IGhhcm5lc3Mgc291cmNlIGZpbGUgZGlzdGluZ3Vpc2gKPj4gdGhlICJuL2Ei
IG1lc3NhZ2VzIGJ5IGJpdG5lc3MuCj4gCj4gVGhlcmUgaXMgYSB2ZXJ5IGxhcmdlIGFtb3VudCBn
b2luZyBvbiBoZXJlLCBhbmQgdG9vIG11Y2ggZm9yIGEgc2luZ2xlIHBhdGNoLgo+IAo+IEkgdGhp
bmsgdGhlIG1vZHJtIGZpeGVzIHdhbnQgc3BsaXR0aW5nIG91dCBiZWNhdXNlIHRob3NlIGFsb25l
IGFyZQo+IHN1YnRsZS4gIEl0cyByZWFzb25hYmxlIHRvIGtlZXAgdGhlIGVtdWxhdG9yIHRlc3Qg
Zml4ZXMgaW4gd2l0aCB0aGUgbmV3Cj4gZnVuY3Rpb25hbGl0eSB3aGljaCBub3RpY2VzIHRoZSBi
dWcsIGFuZCBpdCBpcyBhIG9uZS1saW5lci4KClNwbGl0dGluZyBvdXQgdGhlIE1vZFIvTSBoYW5k
bGluZyBjaGFuZ2VzIGlzIGNlcnRhaW5seSBwb3NzaWJsZS4gSSdsbApkbyBzbyBzaW5jZSB5b3Ug
YXNrIGZvciBpdCwgYnV0IEkgaGFkIGRlbGliZXJhdGVseSBub3QgZG9uZSBzbwpiZWNhdXNlIHRv
IG1lIHRoZXkgbG9va2VkICJvdXQgb2YgY29udGV4dCIgd2l0aG91dCB0aGUgYWN0dWFsIHVzZXMu
Cgo+PiAtLS0gYS94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuaAo+PiArKysg
Yi94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuaAo+PiBAQCAtNjYyLDggKzY2
Miw2IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyAqZGVjb2RlX2dwcigKPj4gICAgICBC
VUlMRF9CVUdfT04oQVJSQVlfU0laRShjcHVfdXNlcl9yZWdzX2dwcl9vZmZzZXRzKSAmCj4+ICAg
ICAgICAgICAgICAgICAgIChBUlJBWV9TSVpFKGNwdV91c2VyX3JlZ3NfZ3ByX29mZnNldHMpIC0g
MSkpOwo+PiAgCj4+IC0gICAgQVNTRVJUKG1vZHJtIDwgQVJSQVlfU0laRShjcHVfdXNlcl9yZWdz
X2dwcl9vZmZzZXRzKSk7Cj4+IC0KPj4gICAgICAvKiBOb3RlIHRoYXQgdGhpcyBhbHNvIGFjdHMg
YXMgYXJyYXlfYWNjZXNzX25vc3BlYygpIHN0YW5kLWluLiAqLwo+IAo+IEkgY2FuJ3QgbG9jYXRl
IHRoaXMgY29tbWVudCBhbnl3aGVyZSBpbiBYZW4ncyBoaXN0b3J5Lgo+IAo+IFRoZSBjb21tZW50
IGN1cnJlbnRseSBpbiB0cmVlIGlzOgo+IAo+IC8qIEZvciBzYWZldHkgaW4gcmVsZWFzZSBidWls
ZHMuICBEZWJ1ZyBidWlsZHMgd2lsbCBoaXQgdGhlIEFTU0VSVCgpICovCj4gCj4gd2hpY2ggd2ls
bCBuZWVkIGFkanVzdGluZyB0byBtYWtlIGl0IGNsZWFyIHRoYXQgd2UgbWF5IG1vZHJtID4KPiBB
UlJBWV9TSVpFKCkgYW5kIHRoYXQgdGhpcyB0cnVuY2F0aW9uIG9wZXJhdGlvbiBpcyB0aGUgY29y
cmVjdCBhY3Rpb24gdG8KPiB0YWtlLgoKU2VlICJ4ODZlbXVsOiBhdm9pZCBzcGVjdWxhdGl2ZSBv
dXQgb2YgYm91bmRzIGFjY2Vzc2VzIiB3aGljaCwgdG9nZXRoZXIKd2l0aCAzIG90aGVyIHBhdGNo
ZXMgaW4gdGhlIHNhbWUgb3JpZ2luYWwgc2VyaWVzLCBpcyBzdGlsbCBhd2FpdGluZyB5b3VyIHJl
dmlldy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
