Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA651B2394
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 17:39:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8nct-0002KI-DH; Fri, 13 Sep 2019 15:36:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g+tJ=XI=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i8ncr-0002JM-JL
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 15:36:45 +0000
X-Inumbo-ID: 47a439a0-d63c-11e9-978d-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47a439a0-d63c-11e9-978d-bc764e2007e4;
 Fri, 13 Sep 2019 15:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568389001;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vK9H2FuAGPOOWGVYgdWyF+mF3vxGa/lNkxsq+rCpvGs=;
 b=AZPYNcUftPd+usnYKo2Qpd4tw+qY8sQZsH91mL6AEwTvzo2Fzt6mcBUu
 2PcVOVTWbSuu4vKnpk/m4Hn8orMyP9oi7gO6m2wYUgCFwJyQymoHkNeri
 VHwm37LZXcLnxSHPT0KmGLmYPCt95DSayyEbyPA85LXYzodY2UbzDS8ts g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6E7rUHjIV5jvqumxc2PsIkXctHvkBxP+IWbMBAwNWCckljK93sMYHNdX74CZffodVxrrSXu1eg
 +mVwXfZoBIPAF1lu0q23EA0WYavfx+ivRerXmfDbHt00UZJwlOKbJELRFeecR/XaFuGJv1vvI5
 IBO8XfEeRkoRnmfu0+I1CPaP0oR8o9iSSWwt79Kt85vULicxf5mWsK97IY2AL9XqDaqc2zCR36
 5ovH2RNcEM4tTizwe/5BVQ00/rP98rpSHng4XmXdve7LrgnBtjkMF+oPNzpsIBMj2/RK7a+GhG
 Vio=
X-SBRS: 2.7
X-MesageID: 5544761
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,501,1559534400"; 
   d="scan'208";a="5544761"
Date: Fri, 13 Sep 2019 16:36:37 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190913153637.GF1308@perard.uk.xensource.com>
References: <20190913082159.31338-1-paul.durrant@citrix.com>
 <20190913082159.31338-4-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190913082159.31338-4-paul.durrant@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH v3 3/3] xen: perform XenDevice clean-up in
 XenBus watch handler
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
Cc: xen-devel@lists.xenproject.org, Stefano
 Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMDk6MjE6NThBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IENsZWFuaW5nIHVwIG9mZmxpbmUgWGVuRGV2aWNlIG9iamVjdHMgZGlyZWN0bHkgaW4K
PiB4ZW5fZGV2aWNlX2JhY2tlbmRfY2hhbmdlZCgpIGlzIGRhbmdlcm91cyBhcyB4ZW5fZGV2aWNl
X3VucmVhbGl6ZSgpIHdpbGwKPiBtb2RpZnkgdGhlIHdhdGNoIGxpc3QgdGhhdCBpcyBiZWluZyB3
YWxrZWQuIEV2ZW4gdGhlIFFMSVNUX0ZPUkVBQ0hfU0FGRSgpCj4gdXNlZCBpbiBub3RpZmllcl9s
aXN0X25vdGlmeSgpIGlzIGluc3VmZmljaWVudCBhcyAqdHdvKiBub3RpZmllcnMgKGZvcgo+IHRo
ZSBmcm9udGVuZCBhbmQgYmFja2VuZCB3YXRjaGVzKSBhcmUgcmVtb3ZlZCwgdGh1cyBwb3RlbnRp
YWxseSByZW5kZXJpbmcKPiB0aGUgJ25leHQnIHBvaW50ZXIgdW5zYWZlLgo+IAo+IFRoZSBzb2x1
dGlvbiBpcyB0byB1c2UgdGhlIFhlbkJ1cyBiYWNrZW5kX3dhdGNoIGhhbmRsZXIgdG8gZG8gdGhl
IGNsZWFuLXVwCj4gaW5zdGVhZCwgYXMgaXQgaXMgaW52b2tlZCB3aGlsc3Qgd2Fsa2luZyBhIHNl
cGFyYXRlIHdhdGNoIGxpc3QuCj4gCj4gVGhpcyBwYXRjaCB0aGVyZWZvcmUgYWRkcyBhIG5ldyAn
aW5hY3RpdmVfZGV2aWNlcycgbGlzdCB0byBYZW5CdXMsIHRvIHdoaWNoCj4gb2ZmbGluZSBkZXZp
Y2VzIGFyZSBhZGRlZCBieSB4ZW5fZGV2aWNlX2JhY2tlbmRfY2hhbmdlZCgpLiBUaGUgWGVuQnVz
Cj4gYmFja2VuZF93YXRjaCByZWdpc3RyYXRpb24gaXMgYWxzbyBjaGFuZ2VkIHRvIG5vdCBvbmx5
IGludm9rZQo+IHhlbl9idXNfZW51bWVyYXRlKCkgYnV0IGFsc28gYSBuZXcgeGVuX2J1c19jbGVh
bnVwKCkgZnVuY3Rpb24sIHdoaWNoIHdpbGwKPiB3YWxrICdpbmFjdGl2ZV9kZXZpY2VzJyBhbmQg
cGVyZm9ybSB0aGUgbmVjZXNzYXJ5IGFjdGlvbnMuCj4gRm9yIHNhZmV0eSBhbiBleHRyYSAnb25s
aW5lJyBjaGVjayBpcyBhbHNvIGFkZGVkIHRvIHhlbl9idXNfdHlwZV9lbnVtZXJhdGUoKQo+IHRv
IG1ha2Ugc3VyZSB0aGF0IG5vIGF0dGVtcHQgaXMgbWFkZSB0byBjcmVhdGUgYSBuZXcgWGVuRGV2
aWNlIG9iamVjdCBmb3IgYQo+IGJhY2tlbmQgdGhhdCBpcyBvZmZsaW5lLgo+IAo+IE5PVEU6IFRo
aXMgcGF0Y2ggYWxzbyBpbmNsdWRlcyBzb21lIGNvc21ldGljIGNoYW5nZXM6Cj4gICAgICAgLSBz
dWJzdGl0dXRlIHRoZSBsb2NhbCB2YXJpYWJsZSBuYW1lICdiYWNrZW5kX3N0YXRlJwo+ICAgICAg
ICAgaW4geGVuX2J1c190eXBlX2VudW1lcmF0ZSgpIHdpdGggJ3N0YXRlJywgc2luY2UgdGhlcmUK
PiAgICAgICAgIGlzIG5vIGFtYmlndWl0eSB3aXRoIGFueSBvdGhlciBzdGF0ZSBpbiB0aGF0IGNv
bnRleHQuCj4gICAgICAgLSBjaGFuZ2UgeGVuX2RldmljZV9zdGF0ZV9pc19hY3RpdmUoKSB0bwo+
ICAgICAgICAgeGVuX2RldmljZV9mcm9udGVuZF9pc19hY3RpdmUoKSAoYW5kIHBhc3MgYSBYZW5E
ZXZpY2UgZGlyZWN0bHkpCj4gICAgICAgICBzaW5jZSB0aGUgc3RhdGUgdGVzdHMgY29udGFpbmVk
IHRoZXJlaW4gb25seSBhcHBseSB0byBhIGZyb250ZW5kLgo+ICAgICAgIC0gdXNlICdzdGF0ZScg
cmF0aGVyIHRoZW4gJ3hlbmRldi0+YmFja2VuZF9zdGF0ZScgaW4KPiAgICAgICAgIHhlbl9kZXZp
Y2VfYmFja2VuZF9jaGFuZ2VkKCkgdG8gc2hvcnRlbiB0aGUgY29kZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IC0tLQo+IENjOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ2M6IEFudGhvbnkg
UGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IAo+IHYzOgo+ICAtIHMvb2ZmbGlu
ZV9kZXZpY2VzL2luYWN0aXZlX2RldmljZXMvZwo+ICAtIEFsc28gYWRkIGFuICdpbmFjdGl2ZScg
Ym9vbGVhbiB0byBYZW5EZXZpY2Ugd2hpY2ggaXMgc2V0IHdoZW4gdGhlCj4gICAgZGV2aWNlIGlz
IGFkZGVkIHRvIHRoZSBpbmFjdGl2ZSBsaXN0IHNvIHdlIHJlYWxseSBjYW4gbWFrZSBzdXJlIHRo
YXQgaXQKPiAgICBkb2Vzbid0IGhhcHBlbiBtb3JlIHRoYW4gb25jZQoKUmV2aWV3ZWQtYnk6IEFu
dGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKVGhhbmtzLAoKLS0gCkFu
dGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
