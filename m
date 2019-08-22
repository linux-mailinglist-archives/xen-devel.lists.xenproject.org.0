Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE811997A7
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 17:05:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0oad-0003zl-Jd; Thu, 22 Aug 2019 15:01:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JKi2=WS=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i0oab-0003ze-Tq
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 15:01:26 +0000
X-Inumbo-ID: b5849b96-c4ed-11e9-951b-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5849b96-c4ed-11e9-951b-bc764e2007e4;
 Thu, 22 Aug 2019 15:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566486084;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xX9kQoky48XNuZMh0VoPELOE33q8lA4AkiTo74IRF2w=;
 b=c6jyre9J+diMLqJSqHVQMNHXEYwl4mN7bNxH/cUpYO5Z2dAfq9CMWGpR
 4AyoD9BsUXYpC+Q7KtTqDSxtiN3Wl1uQdEtGGjRfRXIlwsz2+iJ0+5Q16
 x9kOieTBg/yaSsfzdbdOeqhm3Vtupl6j38wVbL0LBT4L30EcHcDXr9P4g E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mp0gQo6ZNQp39OKlEYggJbIfleWw9b3rYw5U/8vP+QjE27yAvus078wXYSEzUbFbHkm1i6Hj4p
 RHnKPXejwuW+z03B+dRtNuDX5H9uTsNFO7BsEmQUnhjwKn6j43nnIROBTfnvN5FJh7iys5YkpK
 A8HLIXyZStTDjK8nN07Pz/c60NMezstax4ug8vUib9j8Z+TfMOJetboK1tdGuxtbiGiRaI3n/U
 bJFwYn54WeqFlRTQdlLOho3B34GaOT+hzhCkadvCf2t5Wk5QYg/H+I2BisxJ/CzOLyjvjkMXWe
 +0k=
X-SBRS: 2.7
X-MesageID: 4843618
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,417,1559534400"; 
   d="scan'208";a="4843618"
Date: Thu, 22 Aug 2019 16:01:22 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190822150122.GM1289@perard.uk.xensource.com>
References: <20190821092020.17952-1-anthony.perard@citrix.com>
 <20190821092020.17952-2-anthony.perard@citrix.com>
 <b3a6a2e0022c4785a4a04a809d948cef@AMSPEX02CL03.citrite.net>
 <20190822095043.GI1289@perard.uk.xensource.com>
 <182b784c76aa42949990fc19619e8748@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <182b784c76aa42949990fc19619e8748@AMSPEX02CL03.citrite.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 1/2] xen-bus: Fix backend state transition
 on device reset
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMTA6NTk6MzhBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+ID4gU2VudDogMjIgQXVndXN0IDIwMTkg
MTA6NTEKPiA+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+ID4g
Q2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1zdGFibGVAbm9uZ251Lm9yZzsgU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVuLQo+ID4gZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSB4ZW4tYnVzOiBG
aXggYmFja2VuZCBzdGF0ZSB0cmFuc2l0aW9uIG9uIGRldmljZSByZXNldAo+ID4gCj4gPiBPbiBX
ZWQsIEF1ZyAyMSwgMjAxOSBhdCAxMDozNjo0MEFNICswMTAwLCBQYXVsIER1cnJhbnQgd3JvdGU6
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2h3L3hlbi94ZW4tYnVzLmMgYi9ody94ZW4veGVuLWJ1cy5j
Cj4gPiA+ID4gaW5kZXggZTQwNTAwMjQyZC4uOTgyZWNhNDUzMyAxMDA2NDQKPiA+ID4gPiAtLS0g
YS9ody94ZW4veGVuLWJ1cy5jCj4gPiA+ID4gKysrIGIvaHcveGVuL3hlbi1idXMuYwo+ID4gPiA+
IEBAIC01NDAsOSArNTQwLDExIEBAIHN0YXRpYyB2b2lkIHhlbl9kZXZpY2VfYmFja2VuZF9jaGFu
Z2VkKHZvaWQgKm9wYXF1ZSkKPiA+ID4gPiAgICAgIC8qCj4gPiA+ID4gICAgICAgKiBJZiB0aGUg
dG9vbHN0YWNrIChvciB1bnBsdWcgcmVxdWVzdCBjYWxsYmFjaykgaGFzIHNldCB0aGUgYmFja2Vu
ZAo+ID4gPiA+ICAgICAgICogc3RhdGUgdG8gQ2xvc2luZywgYnV0IHRoZXJlIGlzIG5vIGFjdGl2
ZSBmcm9udGVuZCAoaS5lLiB0aGUKPiA+ID4gPiAtICAgICAqIHN0YXRlIGlzIG5vdCBDb25uZWN0
ZWQpIHRoZW4gc2V0IHRoZSBiYWNrZW5kIHN0YXRlIHRvIENsb3NlZC4KPiA+ID4gPiArICAgICAq
IHN0YXRlIGlzIG5vdCBDb25uZWN0ZWQgb3IgQ2xvc2luZykgdGhlbiBzZXQgdGhlIGJhY2tlbmQg
c3RhdGUKPiA+ID4gPiArICAgICAqIHRvIENsb3NlZC4KPiA+ID4gPiAgICAgICAqLwo+ID4gPiA+
ICAgICAgaWYgKHhlbmRldi0+YmFja2VuZF9zdGF0ZSA9PSBYZW5idXNTdGF0ZUNsb3NpbmcgJiYK
PiA+ID4gPiArICAgICAgICB4ZW5kZXYtPmZyb250ZW5kX3N0YXRlICE9IFhlbmJ1c1N0YXRlQ2xv
c2luZyAmJgo+ID4gPiA+ICAgICAgICAgIHhlbmRldi0+ZnJvbnRlbmRfc3RhdGUgIT0gWGVuYnVz
U3RhdGVDb25uZWN0ZWQpIHsKPiA+ID4gPiAgICAgICAgICB4ZW5fZGV2aWNlX2JhY2tlbmRfc2V0
X3N0YXRlKHhlbmRldiwgWGVuYnVzU3RhdGVDbG9zZWQpOwo+ID4gPgo+ID4gPiBBY3R1YWxseSwg
SSB3b25kZXIgd2hldGhlciBpdCBpcyBiZXR0ZXIgdG8gJ3doaXRlbGlzdCcgaGVyZT8gQUZBSUsg
dGhlIG9ubHkgdmFsaWQgZnJvbnRlbmQgc3RhdGVzCj4gPiB3aGV0aGVyIHRoZSBiYWNrZW5kIHNo
b3VsZCBzZXQgaXRzZWxmICdjbG9zZWQnIGFyZSAnY2xvc2VkJyAoaS5lLiB0aGUgZnJvbnRlbmQg
aXMgZmluaXNoZWQpIGFuZAo+ID4gJ2luaXRpYWxpc2luZycgKHRoZSBmcm9udGVuZCB3YXMgbmV2
ZXIgdGhlcmUpLgo+ID4gCj4gPiBMZXQncyBzZWUsIHdoYXQgYXJlIHRoZSByZWFzb24gYmFja2Vu
ZD1DbG9zaW5nPwo+ID4gICAgIC0gZnJvbnRlbmQgY2hhbmdlZCB0byBDbG9zaW5nIChiZWNhdXNl
IGl0IHdhbnRzIHRvIGRpc2Nvbm5lY3QpCj4gPiAgICAgLSB0b29sc3RhY2sobGlieGwpIG9yIFFF
TVUodW5wbHVnIHJlcXVlc3QpIHNldCB0aGUgc3RhdGUgdG8gQ2xvc2luZywKPiA+ICAgICAgIGJ1
dCBhbHNvIG9ubGluZSB0byAwLgo+ID4gCj4gPiBXaGF0IHNob3VsZCB0aGUgYmFja2VuZCBkbyBp
biBib3RoIGNhc2U6Cj4gPiAgICAgLSBmcm9udGVuZCBhbGl2ZTogYmFja2VuZCBzaG91bGQgd2Fp
dAo+ID4gICAgICAgICBmcm9udGVuZCBzdGF0ZSBtaWdodCBiZSBJbml0V2FpdCwgSW5pdGlhbGlz
ZWQsIENvbm5lY3RlZCwKPiA+ICAgICAgICAgQ2xvc2luZy4KPiA+ICAgICAtIGZyb250ZW5kIG5v
dCBleGlzdGluZyBvciBkaXNjb25uZWN0ZWQ6IGJhY2tlbmQgY2FuIHNraXAgd2FpdGluZwo+ID4g
ICAgICAgYW5kIGdvIHRvIHRoZSBuZXh0IHN0ZXAsIENsb3NlZC4KPiA+ICAgICAgICAgZnJvbnRl
bmQgbWlnaHQgYmUgSW5pdGlhbGlzaW5nLCBDbG9zZWQuCj4gPiAgICAgICAgIEJ1dCB0aGVyZSBh
cmUgYWxzbyBVbmtub3duLCBSZWNvbmZpZ3VyaW5nIGFuZCBSZWNvbmZpZ3VyZWQgd2hpY2gKPiA+
ICAgICAgICAgYXJlIHByb2JhYmx5IGVycm9ycy4KPiA+IAo+ID4gU28sIHRoZSB3aGl0ZWxpc3Qg
d2l0aCBDbG9zZWQgYW5kIEluaXRpYWxpc2luZyBpcyBhIGdvb2Qgc3RhcnQsIGJ1dCB3aGF0Cj4g
PiBhYm91dCB0aGUgVW5rbm93biBzdGF0ZT8gKFFFTVUgZG9lc24ndCBoYXZlIGJhY2tlbmRzIHdl
cmUgdGhlIHN0YXRlCj4gPiBSZWNvbmZpZ3VyKiBpcyBwb3NzaWJsZSwgc28gdGhleSBjYW4gYmUg
bWFwcGVkIHRvIFVua25vd24gZm9yIG5vdykuCj4gCj4gSSBndWVzcyB3ZSBzaG91bGQgY29uc2lk
ZXIgVW5rbm93biAoYmFzaWNhbGx5IGEgbWlzc2luZyB4ZW5zdG9yZSBzdGF0ZSBrZXkpIHRvIG1l
YW4gZWl0aGVyIGFuIGFkbWluLCBvciB0aGUgZnJvbnRlbmQgaGFzIHNjcmV3ZWQgdXAgb3IgaXMg
bWFsaWNpb3VzIHNvIEkgdGhpbmsgd2UganVzdCBjbG9zZSBkb3duIHRoZSBiYWNrZW5kIHN0cmFp
Z2h0IGF3YXkuIFNvIG1heWJlIGxpc3RpbmcgSW5pdFdhaXQsIEluaXRpYWxpc2VkLCBDb25uZWN0
ZWQsIGFuZCBDbG9zaW5nIGFzIGZyb250ZW5kIHN0YXRlcyB0aGF0IGFyZSAnZ29vZCcgKGkuZS4g
d2Ugd2FpdCBpbiBhbnRpY2lwYXRpb24gb2YgdGhlIGZyb250ZW5kIGV2ZW50dWFsbHkgZ2V0dGlu
ZyB0byBDbG9zZWQpIGFuZCB0aGVuIHNheSBhbGwgb3RoZXIgc3RhdGVzIHJlc3VsdCBpbiBpbW1l
ZGlhdGUgY2xvc2Ugb2YgdGhlIGJhY2tlbmQuIFByb2JhYmx5IHdvcnRoIGhhdmluZyBhIGhlbHBl
ciBmdW5jdGlvbiBmb3Igc2F5aW5nIHdoZXRoZXIgYSBzdGF0ZSBpcyBnb29kIG9yIG5vdC4KClNv
dW5kcyBnb29kLCBidXQgSSdsbCB1c2UgImFjdGl2ZSIgaW5zdGVhZCBvZiAiZ29vZCIgdG8gbmFt
ZSB0aGUgaGVscGVyCmFzIHRoYXQgZmVlbHMgbW9yZSBhY2N1cmF0ZSB0byBtZS4gQWxzbyAiYWN0
aXZlIiBpcyBhbHJlYWR5IHVzZWQgaW4gdGhlCmNvbW1lbnQuIEknbGwgbmFtZSB0aGUgbmV3IGhl
bHBlciB4ZW5fZGV2aWNlX3N0YXRlX2lzX2FjdGl2ZSgpLgoKVGhhbmtzLAoKLS0gCkFudGhvbnkg
UEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
