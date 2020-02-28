Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5747173562
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 11:34:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7cvm-0006p4-Bh; Fri, 28 Feb 2020 10:31:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7cvk-0006oz-LO
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 10:31:40 +0000
X-Inumbo-ID: 80efb056-5a15-11ea-b0f0-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80efb056-5a15-11ea-b0f0-bc764e2007e4;
 Fri, 28 Feb 2020 10:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582885900;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r3a9VjuqovTpu5NRg/d8EF3p7L8AQZ21mciDL7SVi58=;
 b=FJP9t2hLLxpnt030d8zI74HFhDCZFARZqSOITTkSBTt/XFgXwhBeVam5
 YwojtbRSU5I5sU/wQw9Yt8CZlQwDap8H3hwYrgC09HyAfvMnz40cRYZwD
 jhNaPYXC36Sog2jPMhJ/1Vb4EoETmhgQdbmn89KC/q7ta5XPciI9mDYRG o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zi/h9BH+mflF1ToVmQTvwhVBVUi7SVfmBwuau97AEBM3YLhWDEgLGj/gZlJw29m1CT72OewbY7
 L051UtvjJK3qGKStQl3X7y7gDV1P/ruidLaS5zlfUY20i5tnh4WcAlh9j1v9AJX6rDks2IcIIJ
 rlb5/haYxhy0aHgWZ+vQgJ5MGRoqh/OLbjnVZPGZOjS90TSinwMK/emkbqk324cCDHqntq1+O3
 qJhXjpzo6haeBSGpk/0hMx1oCcuDG0q4kOhVInwDMKp3RdGg9oyeTeRkzyfk5iD33NWPr6MD2h
 BaQ=
X-SBRS: 2.7
X-MesageID: 13141471
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,495,1574139600"; d="scan'208";a="13141471"
Date: Fri, 28 Feb 2020 11:31:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200228103131.GU24458@Air-de-Roger.citrite.net>
References: <20200228093334.36586-1-roger.pau@citrix.com>
 <20200228093334.36586-3-roger.pau@citrix.com>
 <12c75d73-cc89-9b8c-011a-b6e11f6cf58d@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <12c75d73-cc89-9b8c-011a-b6e11f6cf58d@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v4 2/2] x86: add accessors for scratch cpu
 mask
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjgsIDIwMjAgYXQgMTE6MTY6NTVBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjguMDIuMjAyMCAxMDozMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gQ3Vy
cmVudCB1c2FnZSBvZiB0aGUgcGVyLUNQVSBzY3JhdGNoIGNwdW1hc2sgaXMgZGFuZ2Vyb3VzIHNp
bmNlCj4gPiB0aGVyZSdzIG5vIHdheSB0byBmaWd1cmUgb3V0IGlmIHRoZSBtYXNrIGlzIGFscmVh
ZHkgYmVpbmcgdXNlZCBleGNlcHQKPiA+IGZvciBtYW51YWwgY29kZSBpbnNwZWN0aW9uIG9mIGFs
bCB0aGUgY2FsbGVycyBhbmQgcG9zc2libGUgY2FsbCBwYXRocy4KPiA+IAo+ID4gVGhpcyBpcyB1
bnNhZmUgYW5kIG5vdCByZWxpYWJsZSwgc28gaW50cm9kdWNlIGEgbWluaW1hbCBnZXQvcHV0Cj4g
PiBpbmZyYXN0cnVjdHVyZSB0byBwcmV2ZW50IG5lc3RlZCB1c2FnZSBvZiB0aGUgc2NyYXRjaCBt
YXNrIGFuZCB1c2FnZQo+ID4gaW4gaW50ZXJydXB0IGNvbnRleHQuCj4gPiAKPiA+IE1vdmUgdGhl
IGRlZmluaXRpb24gb2Ygc2NyYXRjaF9jcHVtYXNrIHRvIHNtcC5jIGluIG9yZGVyIHRvIHBsYWNl
IHRoZQo+ID4gZGVjbGFyYXRpb24gYW5kIHRoZSBhY2Nlc3NvcnMgYXMgY2xvc2UgYXMgcG9zc2li
bGUuCj4gCj4gWW91J3ZlIGNoYW5nZWQgb25lIGluc3RhbmNlIG9mICJkZWNsYXJhdGlvbiIsIGJ1
dCBub3QgYWxzbyB0aGUgb3RoZXIuCgpPaCwgc29ycnkuIFNhZGx5IHlvdSBhcmUgbm90IHRoZSBv
bmx5IG9uZSB3aXRoIGEgY29sZCB0aGlzIHdlZWsgOikuCgo+ID4gLS0tIGEveGVuL2FyY2gveDg2
L2lycS5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvaXJxLmMKPiA+IEBAIC0xOTYsNyArMTk2LDcg
QEAgc3RhdGljIHZvaWQgX2NsZWFyX2lycV92ZWN0b3Ioc3RydWN0IGlycV9kZXNjICpkZXNjKQo+
ID4gIHsKPiA+ICAgICAgdW5zaWduZWQgaW50IGNwdSwgb2xkX3ZlY3RvciwgaXJxID0gZGVzYy0+
aXJxOwo+ID4gICAgICB1bnNpZ25lZCBpbnQgdmVjdG9yID0gZGVzYy0+YXJjaC52ZWN0b3I7Cj4g
PiAtICAgIGNwdW1hc2tfdCAqdG1wX21hc2sgPSB0aGlzX2NwdShzY3JhdGNoX2NwdW1hc2spOwo+
ID4gKyAgICBjcHVtYXNrX3QgKnRtcF9tYXNrID0gZ2V0X3NjcmF0Y2hfY3B1bWFzaygpOwo+ID4g
IAo+ID4gICAgICBCVUdfT04oIXZhbGlkX2lycV92ZWN0b3IodmVjdG9yKSk7Cj4gPiAgCj4gPiBA
QCAtMjA4LDYgKzIwOCw3IEBAIHN0YXRpYyB2b2lkIF9jbGVhcl9pcnFfdmVjdG9yKHN0cnVjdCBp
cnFfZGVzYyAqZGVzYykKPiA+ICAgICAgICAgIEFTU0VSVChwZXJfY3B1KHZlY3Rvcl9pcnEsIGNw
dSlbdmVjdG9yXSA9PSBpcnEpOwo+ID4gICAgICAgICAgcGVyX2NwdSh2ZWN0b3JfaXJxLCBjcHUp
W3ZlY3Rvcl0gPSB+aXJxOwo+ID4gICAgICB9Cj4gPiArICAgIHB1dF9zY3JhdGNoX2NwdW1hc2so
dG1wX21hc2spOwo+ID4gIAo+ID4gICAgICBkZXNjLT5hcmNoLnZlY3RvciA9IElSUV9WRUNUT1Jf
VU5BU1NJR05FRDsKPiA+ICAgICAgY3B1bWFza19jbGVhcihkZXNjLT5hcmNoLmNwdV9tYXNrKTsK
PiA+IEBAIC0yMjcsOCArMjI4LDkgQEAgc3RhdGljIHZvaWQgX2NsZWFyX2lycV92ZWN0b3Ioc3Ry
dWN0IGlycV9kZXNjICpkZXNjKQo+ID4gIAo+ID4gICAgICAvKiBJZiB3ZSB3ZXJlIGluIG1vdGlv
biwgYWxzbyBjbGVhciBkZXNjLT5hcmNoLm9sZF92ZWN0b3IgKi8KPiA+ICAgICAgb2xkX3ZlY3Rv
ciA9IGRlc2MtPmFyY2gub2xkX3ZlY3RvcjsKPiA+IC0gICAgY3B1bWFza19hbmQodG1wX21hc2ss
IGRlc2MtPmFyY2gub2xkX2NwdV9tYXNrLCAmY3B1X29ubGluZV9tYXApOwo+ID4gIAo+ID4gKyAg
ICBjcHVtYXNrX2FuZCh0bXBfbWFzaywgZGVzYy0+YXJjaC5vbGRfY3B1X21hc2ssICZjcHVfb25s
aW5lX21hcCk7Cj4gPiArICAgIHRtcF9tYXNrID0gZ2V0X3NjcmF0Y2hfY3B1bWFzaygpOwo+IAo+
IERpZCB5b3UgdGVzdCB0aGlzPyBJdCBsb29rcyBvdmVyd2hlbG1pbmdseSBsaWtlbHkgdGhhdCB0
aGUgdHdvCj4gbGluZXMgbmVlZCB0byBiZSB0aGUgb3RoZXIgd2F5IGFyb3VuZC4KClVyZywgeWVz
LCBJJ3ZlIHRlc3RlZCBpdCBidXQgbGlrZWx5IG1pc3NlZCB0byB0cmlnZ2VyIHRoaXMgY2FzZSBh
bmQKZXZlbiB3b3JzZSBmYWlsZWQgdG8gc3BvdCBpdCBvbiBteSBvd24gcmV2aWV3LiBJdCdzIG9i
dmlvdXNseSB3cm9uZy4KCj4gPiArICAgIC8qCj4gPiArICAgICAqIER1ZSB0byByZWVudHJhbmN5
IHNjcmF0Y2ggY3B1bWFzayBjYW5ub3QgYmUgdXNlZCBpbiBJUlEsICNNQyBvciAjTk1JCj4gPiAr
ICAgICAqIGNvbnRleHQuCj4gPiArICAgICAqLwo+ID4gKyAgICBCVUdfT04oaW5faXJxKCkgfHwg
aW5fbWNlX2hhbmRsZXIoKSB8fCBpbl9ubWlfaGFuZGxlcigpKTsKPiA+ICsKPiA+ICsgICAgaWYg
KCB1c2UgJiYgdW5saWtlbHkodGhpc19jcHUoc2NyYXRjaF9jcHVtYXNrX3VzZSkpICkKPiA+ICsg
ICAgewo+ID4gKyAgICAgICAgcHJpbnRrKCJzY3JhdGNoIENQVSBtYXNrIGFscmVhZHkgaW4gdXNl
IGJ5ICVwcyAoJXApXG4iLAo+ID4gKyAgICAgICAgICAgICAgIHRoaXNfY3B1KHNjcmF0Y2hfY3B1
bWFza191c2UpLCB0aGlzX2NwdShzY3JhdGNoX2NwdW1hc2tfdXNlKSk7Cj4gCj4gV2h5IHRoZSBy
YXcgJXAgYXMgd2VsbD8gV2UgZG9uJ3QgZG8gc28gZWxzZXdoZXJlLCBJIHRoaW5rLiBZZXMsCj4g
aXQncyBkZWJ1Z2dpbmcgY29kZSBvbmx5LCBidXQgSSB3b25kZXIgYW55d2F5LgoKSSB1c2UgYWRk
cjJsaW5lIHRvIGZpbmQgdGhlIG9mZmVuZGluZyBsaW5lLCBhbmQgaXQncyBtdWNoIGVhc2llciB0
byBkbwpzbyBpZiB5b3UgaGF2ZSB0aGUgYWRkcmVzcyBkaXJlY3RseSwgcmF0aGVyIHRoYW4gaGF2
aW5nIHRvIHVzZSBubSBpbgpvcmRlciB0byBmaWd1cmUgb3V0IHRoZSBhZGRyZXNzIG9mIHRoZSBz
eW1ib2wgYW5kIHRoZW4gYWRkIHRoZSBvZmZzZXQuCgpNYXliZSBJJ20gbWlzc2luZyBzb21lIG90
aGVyIHdheSB0byBkbyB0aGlzIG1vcmUgZWFzaWx5PwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
