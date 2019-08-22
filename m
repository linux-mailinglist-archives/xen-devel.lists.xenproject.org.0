Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0DC990A8
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 12:23:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0kDr-0007pI-8P; Thu, 22 Aug 2019 10:21:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JKi2=WS=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i0kDp-0007p8-NW
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 10:21:37 +0000
X-Inumbo-ID: 9ef0b418-c4c6-11e9-add4-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ef0b418-c4c6-11e9-add4-12813bfff9fa;
 Thu, 22 Aug 2019 10:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566469296;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ACOh+i3gv8PzYL3XFZAieidQktGCmDPIEGdnisp9ERY=;
 b=gP5pQjabKdocWnRNpq4mCXRAM2NEKlu4OHlEZgd5OeVlylO63aaVu25p
 rRSHr50tFTlaDIf9rFZgshM5xOuD0Rm3QAwFAHJhIbbdTIxChqO54gJyA
 BY+NP9XCa4hy3VsbXHmKPa1UacDaGftUyz667JBnlItlSNnQ9+ihkm4WO 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: D1NoZ3g0AHTrPmIHnWiKYpuicwaO0A50jzUceLYneLusE+ly/gcQ9IIA7cdTBWbapHAvdh/8bz
 JaFVTfbTq4MaK7GpIfdTvLzI90zY4sgI87qqF1PJAOVkF150XpfRjxVj9uPvELKEG92EmbPPMe
 prvX3ChSkSFbQtCzhtwo/L4xljrjDBr4NdD88F740EbWEhCJRK/1T5fJyY3qy3VxPpGy0HEK6O
 pKM26AR+sCkh6WO30yO4Sa/EhEK7goR80IiTfpjdvuIZa5gnqbgaNadGG4MuObT+F9C1CrLh/O
 Ygw=
X-SBRS: 2.7
X-MesageID: 4792433
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; 
   d="scan'208";a="4792433"
Date: Thu, 22 Aug 2019 11:21:32 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190822102132.GJ1289@perard.uk.xensource.com>
References: <20190821092020.17952-1-anthony.perard@citrix.com>
 <20190821092020.17952-3-anthony.perard@citrix.com>
 <703d5a46d4c74eb4afd93d76b7341efc@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <703d5a46d4c74eb4afd93d76b7341efc@AMSPEX02CL03.citrite.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 2/2] xen-bus: Avoid rewriting identical
 values to xenstore
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMDQ6NDA6MDVQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+ID4gU2VudDogMjEgQXVndXN0IDIwMTkg
MTA6MjAKPiA+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcKPiA+IENjOiBBbnRob255IFBlcmFy
ZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz47IFBhdWwKPiA+IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXgu
Y29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gPiBTdWJqZWN0OiBbUEFUQ0gg
Mi8yXSB4ZW4tYnVzOiBBdm9pZCByZXdyaXRpbmcgaWRlbnRpY2FsIHZhbHVlcyB0byB4ZW5zdG9y
ZQo+ID4gCj4gPiBXaGVuIFFFTVUgcmVjZWl2ZSBhIHhlbnN0b3JlIHdhdGNoIGV2ZW50IHN1Z2dl
c3RpbmcgdGhhdCB0aGUgInN0YXRlIiBvcgo+ID4gIm9ubGluZSIgc3RhdHVzIG9mIHRoZSBmcm9u
dGVuZCBvciB0aGUgYmFja2VuZCBjaGFuZ2VkLCBpdCByZWNvcmQgdGhpcwo+ID4gaW4gaXRzIG93
biBzdGF0ZSBidXQgaXQgYWxzbyByZS13cml0ZSB0aGUgdmFsdWUgYmFjayBpbnRvIHhlbnN0b3Jl
IGV2ZW4KPiA+IHNvIHRoZXJlIHdlcmUgbm8gY2hhbmdlZC4gVGhpcyB0cmlnZ2VyIGFuIHVubmVj
ZXNzYXJ5IHhlbnN0b3JlIHdhdGNoCj4gPiBldmVudCB3aGljaCBRRU1VIHdpbGwgcHJvY2VzcyBh
Z2FpbiAoYW5kIG1heWJlIHRoZSBmcm9udGVuZCBhcyB3ZWxsKS4KPiA+IAo+ID4gU2lnbmVkLW9m
Zi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gPiAtLS0K
PiA+ICBody94ZW4veGVuLWJ1cy5jIHwgMzcgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlv
bnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2h3L3hlbi94ZW4tYnVzLmMgYi9ody94ZW4veGVu
LWJ1cy5jCj4gPiBpbmRleCA5ODJlY2E0NTMzLi5jODNmMDc0MjRhIDEwMDY0NAo+ID4gLS0tIGEv
aHcveGVuL3hlbi1idXMuYwo+ID4gKysrIGIvaHcveGVuL3hlbi1idXMuYwo+ID4gQEAgLTQ4MSwy
MCArNDgxLDI3IEBAIHN0YXRpYyBpbnQgeGVuX2RldmljZV9iYWNrZW5kX3NjYW5mKFhlbkRldmlj
ZSAqeGVuZGV2LCBjb25zdCBjaGFyICprZXksCj4gPiAgICAgIHJldHVybiByYzsKPiA+ICB9Cj4g
PiAKPiA+IC12b2lkIHhlbl9kZXZpY2VfYmFja2VuZF9zZXRfc3RhdGUoWGVuRGV2aWNlICp4ZW5k
ZXYsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0geGVuYnVzX3N0
YXRlIHN0YXRlKQo+ID4gK3N0YXRpYyBib29sIHhlbl9kZXZpY2VfYmFja2VuZF9yZWNvcmRfc3Rh
dGUoWGVuRGV2aWNlICp4ZW5kZXYsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBlbnVtIHhlbmJ1c19zdGF0ZSBzdGF0ZSkKPiA+ICB7Cj4gPiAgICAgIGNv
bnN0IGNoYXIgKnR5cGUgPSBvYmplY3RfZ2V0X3R5cGVuYW1lKE9CSkVDVCh4ZW5kZXYpKTsKPiA+
IAo+ID4gICAgICBpZiAoeGVuZGV2LT5iYWNrZW5kX3N0YXRlID09IHN0YXRlKSB7Cj4gPiAtICAg
ICAgICByZXR1cm47Cj4gPiArICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiAgICAgIH0KPiA+IAo+
ID4gICAgICB0cmFjZV94ZW5fZGV2aWNlX2JhY2tlbmRfc3RhdGUodHlwZSwgeGVuZGV2LT5uYW1l
LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeHNfc3Ryc3RhdGUoc3Rh
dGUpKTsKPiA+IAo+ID4gICAgICB4ZW5kZXYtPmJhY2tlbmRfc3RhdGUgPSBzdGF0ZTsKPiA+IC0g
ICAgeGVuX2RldmljZV9iYWNrZW5kX3ByaW50Zih4ZW5kZXYsICJzdGF0ZSIsICIldSIsIHN0YXRl
KTsKPiA+ICsgICAgcmV0dXJuIHRydWU7Cj4gPiArfQo+ID4gKwo+ID4gK3ZvaWQgeGVuX2Rldmlj
ZV9iYWNrZW5kX3NldF9zdGF0ZShYZW5EZXZpY2UgKnhlbmRldiwKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZW51bSB4ZW5idXNfc3RhdGUgc3RhdGUpCj4gPiArewo+ID4g
KyAgICBpZiAoeGVuX2RldmljZV9iYWNrZW5kX3JlY29yZF9zdGF0ZSh4ZW5kZXYsIHN0YXRlKSkK
PiA+ICsgICAgICAgIHhlbl9kZXZpY2VfYmFja2VuZF9wcmludGYoeGVuZGV2LCAic3RhdGUiLCAi
JXUiLCBzdGF0ZSk7Cj4gPiAgfQo+ID4gCj4gPiAgZW51bSB4ZW5idXNfc3RhdGUgeGVuX2Rldmlj
ZV9iYWNrZW5kX2dldF9zdGF0ZShYZW5EZXZpY2UgKnhlbmRldikKPiA+IEBAIC01MDIsNyArNTA5
LDggQEAgZW51bSB4ZW5idXNfc3RhdGUgeGVuX2RldmljZV9iYWNrZW5kX2dldF9zdGF0ZShYZW5E
ZXZpY2UgKnhlbmRldikKPiA+ICAgICAgcmV0dXJuIHhlbmRldi0+YmFja2VuZF9zdGF0ZTsKPiA+
ICB9Cj4gPiAKPiA+IC1zdGF0aWMgdm9pZCB4ZW5fZGV2aWNlX2JhY2tlbmRfc2V0X29ubGluZShY
ZW5EZXZpY2UgKnhlbmRldiwgYm9vbCBvbmxpbmUpCj4gPiArc3RhdGljIHZvaWQgeGVuX2Rldmlj
ZV9iYWNrZW5kX3NldF9vbmxpbmUoWGVuRGV2aWNlICp4ZW5kZXYsIGJvb2wgb25saW5lLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgZXhwb3J0KQo+
ID4gIHsKPiA+ICAgICAgY29uc3QgY2hhciAqdHlwZSA9IG9iamVjdF9nZXRfdHlwZW5hbWUoT0JK
RUNUKHhlbmRldikpOwo+ID4gCj4gPiBAQCAtNTEzLDcgKzUyMSw4IEBAIHN0YXRpYyB2b2lkIHhl
bl9kZXZpY2VfYmFja2VuZF9zZXRfb25saW5lKFhlbkRldmljZSAqeGVuZGV2LCBib29sIG9ubGlu
ZSkKPiA+ICAgICAgdHJhY2VfeGVuX2RldmljZV9iYWNrZW5kX29ubGluZSh0eXBlLCB4ZW5kZXYt
Pm5hbWUsIG9ubGluZSk7Cj4gPiAKPiA+ICAgICAgeGVuZGV2LT5iYWNrZW5kX29ubGluZSA9IG9u
bGluZTsKPiA+IC0gICAgeGVuX2RldmljZV9iYWNrZW5kX3ByaW50Zih4ZW5kZXYsICJvbmxpbmUi
LCAiJXUiLCBvbmxpbmUpOwo+ID4gKyAgICBpZiAoZXhwb3J0KQo+ID4gKyAgICAgICAgeGVuX2Rl
dmljZV9iYWNrZW5kX3ByaW50Zih4ZW5kZXYsICJvbmxpbmUiLCAiJXUiLCBvbmxpbmUpOwo+ID4g
IH0KPiA+Cj4gCj4gUGVyaGFwcyB0aGUgYmVoYXZpb3VyIG9mIGJhY2tlbmRfc2V0X3N0YXRlKCkg
YW5kIGJhY2tlbmRfc2V0X29ubGluZSgpIGNvdWxkIGJlIHRoZSBzYW1lPyBJLmUuIHRoZXkgYm90
aCB0YWtlIGFuICdleHBvcnQnIChvciBwZXJoYXBzICdwdWJsaXNoJz8pIHBhcmFtZXRlciBhbmQg
b25seSB3cml0ZSB4ZW5zdG9yZSBpZiB0aGF0IGlzIHRydWUuIChJIHJlYWxpc2UgdGhhdCB3b3Vs
ZCBpbnZvbHZlIG1vZGlmeWluZyB4ZW4tYmxvY2sgdG8gcGFzcyAndHJ1ZScgYXMgdGhlIGV4dHJh
IGV4cG9ydC9wdWJsaXNoIHBhcmFtLCBidXQgSSB0aGluayBpdCB3b3VsZCBiZSBuZWF0ZXIgb3Zl
cmFsbCkuCgpJJ3ZlIGFjdHVhbGx5IGRpZCBpdCB0aGlzIHdheSBmb3IgYmFja2VuZF9zZXRfc3Rh
dGUoKSBiZWNhdXNlIHRoZSBvbmx5CnJlYXNvbiB0byB1cGRhdGUgaW50ZXJuYWwgc3RhdGVzIHdp
dGhvdXQgd3JpdGluZyB0aGF0IHN0YXRlIGludG8KeGVuc3RvcmUgaXMgYmVjYXVzZSB0aGUgeGVu
c3RvcmUgc3RhdGUgY2hhbmdlZCwgc28Ke2Zyb250LGJhY2t9ZW5kX2NoYW5nZWQoKSBhcmUgdGhl
IG9ubHkgZnVuY3Rpb24gdGhhdCBkb24ndCB3YW50L25lZWQgdG8Kd3JpdGUgdGhlIG5ldyBzdGF0
ZSBpbnRvIHhlbnN0b3JlLiBJIHdhbnRlZCB0byBhdm9pZCBtaXN1c2Ugb2YgdGhlCmV4dHJhIGV4
cG9ydC9wdWJsaXNoIHBhcmFtIGluIGZ1dHVyZSBiYWNrZW5kIGRyaXZlcnMuCgpBcyBmb3IgZnJv
bnRlbmRfc2V0X3N0YXRlKCkgYW5kIGJhY2tlbmRfc2V0X29ubGluZSgpLCB0aGV5IGFyZSBvbmx5
IHVzZWQKaW4geGVuLWJ1cy5jLCBjcmVhdGluZyBhIG5ldyBmdW5jdGlvbiBkaWRuJ3Qgc2VlbXMg
YXMgbmVlZGVkLgoKSSBraW5kIG9mIHRoaW5rIHRoYXQgbWF5YmUgSSBzaG91bGQgZ28gZnVydGhl
ciBhbmQgYWxzbyBoYXZlCmZyb250ZW5kX3JlY29yZF9zdGF0ZSgpIGlzIGl0IGNvdWxkIGJlIHBv
c3NpYmxlIHRvIGhhdmUgZnJvbnRlbmQgZHJpdmVycwppbiBRRU1VLiAoYW5kIG1heWJlIHJlY29y
ZF9vbmxpbmUgc28gdGhleSBhbGwgbG9va3MgdGhlIHNhbWUuKQoKU28sIHdvdWxkIHlvdSBwcmVm
ZXIgdG8gaGF2ZSB0aGUgZXh0cmEgcGFyYW0gdG8gKl9zZXRfKigpIHRoYXQgc2hvdWxkIGJlCiJ0
cnVlIiBvdXRzaWRlIG9mICpfY2hhbmdlZCgpLCBvciB0aGUgZXh0cmEgZnVuY3Rpb25zIGxpa2Ug
SSBkaWQgd2l0aApiYWNrZW5kX3tzZXQscmVjb3JkfV9zdGF0ZSgpID8KClRoYW5rcywKCi0tIApB
bnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
