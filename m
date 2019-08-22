Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0403F99046
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 12:02:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0jsf-0004VB-0k; Thu, 22 Aug 2019 09:59:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1g6i=WS=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i0jsd-0004V6-G9
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 09:59:43 +0000
X-Inumbo-ID: 8f4ddbf6-c4c3-11e9-8980-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f4ddbf6-c4c3-11e9-8980-bc764e2007e4;
 Thu, 22 Aug 2019 09:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566467981;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fsIi7e1/bpRHfkFyvftR+ITkTlvFYpqgeRVHMgrw7uA=;
 b=OJdi+sFrnNTVnAU9NrYC/AAeom5Hex6ceXPVDrUGRwlZJzEDyjtRI8O5
 Y5l0pt7bWyHjk0cUb8FNrw2CBmBR0nVk7t6CfcI/EssyqoAw59VYBQWXl
 C7QfX403zhCTaJPOuc8Jn6FBGuqgHD6xALKzKyBj2YCX5F4q0G1PM7Or/ A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: loCDtdyTUefkq2LnXSzqN4QRGdmZRnLt955lHP5jGGTdwvEAKRQCmxNjIONgeyw8cg6z6PUnCo
 YmN+iNAex8JynB+qLBzSXArJt+bQnWZnA+2JZs+3awyjNQQVn6lZXFye/2JNPq8Vqd7uplEa/L
 exjMSAapeoAQsyUJkUZasuOwe//SOr/K3nrV3/omwxMIRbKE02F6lp/fYTV+OWafwsfyJcBcH6
 gGNmk0x6uVxEt9qK0Ao0s8UtuohdhbmYjjELsq1h61wfjLfUaMjmDjevFYW64wztK55glxTUzn
 MRY=
X-SBRS: 2.7
X-MesageID: 4791675
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; 
   d="scan'208";a="4791675"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
Thread-Topic: [PATCH 1/2] xen-bus: Fix backend state transition on device reset
Thread-Index: AQHVWAGpRkr1DBFa80ag1hnV7DDUQKcFVfWwgAF2oICAACIB0A==
Date: Thu, 22 Aug 2019 09:59:38 +0000
Message-ID: <182b784c76aa42949990fc19619e8748@AMSPEX02CL03.citrite.net>
References: <20190821092020.17952-1-anthony.perard@citrix.com>
 <20190821092020.17952-2-anthony.perard@citrix.com>
 <b3a6a2e0022c4785a4a04a809d948cef@AMSPEX02CL03.citrite.net>
 <20190822095043.GI1289@perard.uk.xensource.com>
In-Reply-To: <20190822095043.GI1289@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgo+IFNlbnQ6IDIyIEF1Z3VzdCAyMDE5IDEwOjUxCj4gVG86
IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHFlbXUtZGV2ZWxA
bm9uZ251Lm9yZzsgcWVtdS1zdGFibGVAbm9uZ251Lm9yZzsgU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVuLQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIHhlbi1idXM6IEZpeCBiYWNrZW5kIHN0YXRlIHRy
YW5zaXRpb24gb24gZGV2aWNlIHJlc2V0Cj4gCj4gT24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMTA6
MzY6NDBBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+ID4gPiBkaWZmIC0tZ2l0IGEvaHcv
eGVuL3hlbi1idXMuYyBiL2h3L3hlbi94ZW4tYnVzLmMKPiA+ID4gaW5kZXggZTQwNTAwMjQyZC4u
OTgyZWNhNDUzMyAxMDA2NDQKPiA+ID4gLS0tIGEvaHcveGVuL3hlbi1idXMuYwo+ID4gPiArKysg
Yi9ody94ZW4veGVuLWJ1cy5jCj4gPiA+IEBAIC01NDAsOSArNTQwLDExIEBAIHN0YXRpYyB2b2lk
IHhlbl9kZXZpY2VfYmFja2VuZF9jaGFuZ2VkKHZvaWQgKm9wYXF1ZSkKPiA+ID4gICAgICAvKgo+
ID4gPiAgICAgICAqIElmIHRoZSB0b29sc3RhY2sgKG9yIHVucGx1ZyByZXF1ZXN0IGNhbGxiYWNr
KSBoYXMgc2V0IHRoZSBiYWNrZW5kCj4gPiA+ICAgICAgICogc3RhdGUgdG8gQ2xvc2luZywgYnV0
IHRoZXJlIGlzIG5vIGFjdGl2ZSBmcm9udGVuZCAoaS5lLiB0aGUKPiA+ID4gLSAgICAgKiBzdGF0
ZSBpcyBub3QgQ29ubmVjdGVkKSB0aGVuIHNldCB0aGUgYmFja2VuZCBzdGF0ZSB0byBDbG9zZWQu
Cj4gPiA+ICsgICAgICogc3RhdGUgaXMgbm90IENvbm5lY3RlZCBvciBDbG9zaW5nKSB0aGVuIHNl
dCB0aGUgYmFja2VuZCBzdGF0ZQo+ID4gPiArICAgICAqIHRvIENsb3NlZC4KPiA+ID4gICAgICAg
Ki8KPiA+ID4gICAgICBpZiAoeGVuZGV2LT5iYWNrZW5kX3N0YXRlID09IFhlbmJ1c1N0YXRlQ2xv
c2luZyAmJgo+ID4gPiArICAgICAgICB4ZW5kZXYtPmZyb250ZW5kX3N0YXRlICE9IFhlbmJ1c1N0
YXRlQ2xvc2luZyAmJgo+ID4gPiAgICAgICAgICB4ZW5kZXYtPmZyb250ZW5kX3N0YXRlICE9IFhl
bmJ1c1N0YXRlQ29ubmVjdGVkKSB7Cj4gPiA+ICAgICAgICAgIHhlbl9kZXZpY2VfYmFja2VuZF9z
ZXRfc3RhdGUoeGVuZGV2LCBYZW5idXNTdGF0ZUNsb3NlZCk7Cj4gPgo+ID4gQWN0dWFsbHksIEkg
d29uZGVyIHdoZXRoZXIgaXQgaXMgYmV0dGVyIHRvICd3aGl0ZWxpc3QnIGhlcmU/IEFGQUlLIHRo
ZSBvbmx5IHZhbGlkIGZyb250ZW5kIHN0YXRlcwo+IHdoZXRoZXIgdGhlIGJhY2tlbmQgc2hvdWxk
IHNldCBpdHNlbGYgJ2Nsb3NlZCcgYXJlICdjbG9zZWQnIChpLmUuIHRoZSBmcm9udGVuZCBpcyBm
aW5pc2hlZCkgYW5kCj4gJ2luaXRpYWxpc2luZycgKHRoZSBmcm9udGVuZCB3YXMgbmV2ZXIgdGhl
cmUpLgo+IAo+IExldCdzIHNlZSwgd2hhdCBhcmUgdGhlIHJlYXNvbiBiYWNrZW5kPUNsb3Npbmc/
Cj4gICAgIC0gZnJvbnRlbmQgY2hhbmdlZCB0byBDbG9zaW5nIChiZWNhdXNlIGl0IHdhbnRzIHRv
IGRpc2Nvbm5lY3QpCj4gICAgIC0gdG9vbHN0YWNrKGxpYnhsKSBvciBRRU1VKHVucGx1ZyByZXF1
ZXN0KSBzZXQgdGhlIHN0YXRlIHRvIENsb3NpbmcsCj4gICAgICAgYnV0IGFsc28gb25saW5lIHRv
IDAuCj4gCj4gV2hhdCBzaG91bGQgdGhlIGJhY2tlbmQgZG8gaW4gYm90aCBjYXNlOgo+ICAgICAt
IGZyb250ZW5kIGFsaXZlOiBiYWNrZW5kIHNob3VsZCB3YWl0Cj4gICAgICAgICBmcm9udGVuZCBz
dGF0ZSBtaWdodCBiZSBJbml0V2FpdCwgSW5pdGlhbGlzZWQsIENvbm5lY3RlZCwKPiAgICAgICAg
IENsb3NpbmcuCj4gICAgIC0gZnJvbnRlbmQgbm90IGV4aXN0aW5nIG9yIGRpc2Nvbm5lY3RlZDog
YmFja2VuZCBjYW4gc2tpcCB3YWl0aW5nCj4gICAgICAgYW5kIGdvIHRvIHRoZSBuZXh0IHN0ZXAs
IENsb3NlZC4KPiAgICAgICAgIGZyb250ZW5kIG1pZ2h0IGJlIEluaXRpYWxpc2luZywgQ2xvc2Vk
Lgo+ICAgICAgICAgQnV0IHRoZXJlIGFyZSBhbHNvIFVua25vd24sIFJlY29uZmlndXJpbmcgYW5k
IFJlY29uZmlndXJlZCB3aGljaAo+ICAgICAgICAgYXJlIHByb2JhYmx5IGVycm9ycy4KPiAKPiBT
bywgdGhlIHdoaXRlbGlzdCB3aXRoIENsb3NlZCBhbmQgSW5pdGlhbGlzaW5nIGlzIGEgZ29vZCBz
dGFydCwgYnV0IHdoYXQKPiBhYm91dCB0aGUgVW5rbm93biBzdGF0ZT8gKFFFTVUgZG9lc24ndCBo
YXZlIGJhY2tlbmRzIHdlcmUgdGhlIHN0YXRlCj4gUmVjb25maWd1ciogaXMgcG9zc2libGUsIHNv
IHRoZXkgY2FuIGJlIG1hcHBlZCB0byBVbmtub3duIGZvciBub3cpLgoKSSBndWVzcyB3ZSBzaG91
bGQgY29uc2lkZXIgVW5rbm93biAoYmFzaWNhbGx5IGEgbWlzc2luZyB4ZW5zdG9yZSBzdGF0ZSBr
ZXkpIHRvIG1lYW4gZWl0aGVyIGFuIGFkbWluLCBvciB0aGUgZnJvbnRlbmQgaGFzIHNjcmV3ZWQg
dXAgb3IgaXMgbWFsaWNpb3VzIHNvIEkgdGhpbmsgd2UganVzdCBjbG9zZSBkb3duIHRoZSBiYWNr
ZW5kIHN0cmFpZ2h0IGF3YXkuIFNvIG1heWJlIGxpc3RpbmcgSW5pdFdhaXQsIEluaXRpYWxpc2Vk
LCBDb25uZWN0ZWQsIGFuZCBDbG9zaW5nIGFzIGZyb250ZW5kIHN0YXRlcyB0aGF0IGFyZSAnZ29v
ZCcgKGkuZS4gd2Ugd2FpdCBpbiBhbnRpY2lwYXRpb24gb2YgdGhlIGZyb250ZW5kIGV2ZW50dWFs
bHkgZ2V0dGluZyB0byBDbG9zZWQpIGFuZCB0aGVuIHNheSBhbGwgb3RoZXIgc3RhdGVzIHJlc3Vs
dCBpbiBpbW1lZGlhdGUgY2xvc2Ugb2YgdGhlIGJhY2tlbmQuIFByb2JhYmx5IHdvcnRoIGhhdmlu
ZyBhIGhlbHBlciBmdW5jdGlvbiBmb3Igc2F5aW5nIHdoZXRoZXIgYSBzdGF0ZSBpcyBnb29kIG9y
IG5vdC4KCiAgQ2hlZXJzLAoKICAgIFBhdWwKCj4gCj4gQ2hlZXJzLAo+IAo+IC0tCj4gQW50aG9u
eSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
