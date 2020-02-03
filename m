Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 072CA150AD1
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 17:21:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyeQq-0008Mx-1Z; Mon, 03 Feb 2020 16:18:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MGDo=3X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iyeQo-0008Ms-N5
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 16:18:38 +0000
X-Inumbo-ID: d528eada-46a0-11ea-b211-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d528eada-46a0-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 16:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580746718;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=x+WpHQ/lSreWYzH0pxwZoT/Pp/GsoyupkJd9TVQKv0I=;
 b=Ybby5QEqbPFOvIIB+DfBIMS/1fR/+1IKf2ljapv5Li21Aq9TluMTDqAO
 btxK2JYKtEEtLF59beFZADTqZidh5dWmnFOQziD0Gffxp8sy33EC5n6J8
 F2/66INkTeAKPIA5AJ8CgUGWGKWQxGbg40vgwmNbJf49r+SmqiDWyuK9m 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BGRgLW/cFnts2/+xMRL5ZIPVxg8qaOgVB+fHIqI7aLXVQOjXoQjXfsxuh1+7XDvCeXd90XZ0TE
 klUFPNsR9uliOzdfaJ1TD0apUeJdTKwk7YKlCu3uTh8H7yU/nn+Dxu58NYrXII/SE0hFRZvnDi
 t/9yFEpgxE++XSA5l2vv6iXLJTZR2ZZjK8ltuV0TCG9FSgPWWJws4BI/SfvV6eelEQYZxnwKwb
 j5M3fR3q9l9KWWfWUc8VLnBgyZFfmN8H39kQPQ6PNhg5aFJMz8MLNp+5U24ZqhnIExBw8Xsc4m
 RdY=
X-SBRS: 2.7
X-MesageID: 12031050
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,398,1574139600"; d="scan'208";a="12031050"
Date: Mon, 3 Feb 2020 17:18:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20200203161829.GC4679@Air-de-Roger>
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
 <20200201003303.2363081-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200201003303.2363081-1-dwmw2@infradead.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/8] x86/smp: reset x2apic_enabled in
 smp_send_stop()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Varad
 Gautam <vrd@amazon.de>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Hongyan Xia <hongyxia@amazon.com>, xen-devel@lists.xenproject.org,
 Paul Durrant <pdurrant@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBGZWIgMDEsIDIwMjAgYXQgMTI6MzI6NTZBTSArMDAwMCwgRGF2aWQgV29vZGhvdXNl
IHdyb3RlOgo+IEZyb206IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4gCj4g
SnVzdCBiZWZvcmUgc21wX3NlbmRfc3RvcCgpIHJlLWVuYWJsZXMgaW50ZXJydXB0cyB3aGVuIHNo
dXR0aW5nIGRvd24KPiBmb3IgcmVib290IG9yIGtleGVjLCBpdCBjYWxscyBfX3N0b3BfdGhpc19j
cHUoKSB3aGljaCBpbiB0dXJuIGNhbGxzCj4gZGlzYWJsZV9sb2NhbF9BUElDKCksIHdoaWNoIHB1
dHMgdGhlIEFQSUMgYmFjayBpbiB0byB0aGUgbW9kZSBYZW4gZm91bmQKPiBpdCBpbiBhdCBib290
Lgo+IAo+IElmIHRoYXQgbWVhbnMgdHVybmluZyB4MkFQSUMgb2ZmIGFuZCBnb2luZyBiYWNrIGlu
dG8geEFQSUMgbW9kZSwgdGhlbgo+IGEgdGltZXIgaW50ZXJydXB0IG9jY3VycmluZyBqdXN0IGFm
dGVyIGludGVycnVwdHMgY29tZSBiYWNrIG9uIHdpbGwKPiBsZWFkIHRvIGEgR1AjIHdoZW4gYXBp
Y190aW1lcl9pbnRlcnJ1cHQoKSBhdHRlbXB0cyB0byBhY2sgdGhlIElSUQo+IHRocm91Z2ggdGhl
IEVPSSByZWdpc3RlciBpbiB4MkFQSUMgTVNSIDB4ODBiOgo+IAo+IChYRU4pIEV4ZWN1dGluZyBr
ZXhlYyBpbWFnZSBvbiBjcHUwCj4gKFhFTikgLS0tLVsgWGVuLTQuMTQtdW5zdGFibGUgIHg4Nl82
NCAgZGVidWc9biAgIE5vdCB0YWludGVkIF0tLS0tCj4gKFhFTikgQ1BVOiAgICAwCj4gKFhFTikg
UklQOiAgICBlMDA4Ols8ZmZmZjgyZDA4MDI2YzEzOT5dIGFwaWNfdGltZXJfaW50ZXJydXB0KzB4
MjkvMHg0MAo+IChYRU4pIFJGTEFHUzogMDAwMDAwMDAwMDAxMDA0NiAgIENPTlRFWFQ6IGh5cGVy
dmlzb3IKPiAoWEVOKSByYXg6IDAwMDAwMDAwMDAwMDAwMDAgICByYng6IDAwMDAwMDAwMDAwMDAw
ZmEgICByY3g6IDAwMDAwMDAwMDAwMDA4MGIKPiDigKYKPiAoWEVOKSBYZW4gY29kZSBhcm91bmQg
PGZmZmY4MmQwODAyNmMxMzk+IChhcGljX3RpbWVyX2ludGVycnVwdCsweDI5LzB4NDApOgo+IChY
RU4pICBjMCBiOSAwYiAwOCAwMCAwMCA4OSBjMiA8MGY+IDMwIDMxIGZmIGU5IDBlIGM5IGZiIGZm
IDBmIDFmIDQwIDAwIDY2IDJlIDBmCj4g4oCmCj4gKFhFTikgWGVuIGNhbGwgdHJhY2U6Cj4gKFhF
TikgICAgWzxmZmZmODJkMDgwMjZjMTM5Pl0gUiBhcGljX3RpbWVyX2ludGVycnVwdCsweDI5LzB4
NDAKPiAoWEVOKSAgICBbPGZmZmY4MmQwODAyODM4MjU+XSBTIGRvX0lSUSsweDk1LzB4NzUwCj4g
4oCmCj4gKFhFTikgICAgWzxmZmZmODJkMDgwMmEwYWQyPl0gUyBzbXBfc2VuZF9zdG9wKzB4NDIv
MHhkMAo+IAo+IFdlIGNhbid0IGNsZWFyIHRoZSBnbG9iYWwgeDJhcGljX2VuYWJsZWQgdmFyaWFi
bGUgaW4gZGlzYWJsZV9sb2NhbF9BUElDKCkKPiBpdHNlbGYgYmVjYXVzZSB0aGF0IHJ1bnMgb24g
ZWFjaCBDUFUuIEluc3RlYWQsIGNvcnJlY3QgaXQgKGJ5IHVzaW5nCj4gY3VycmVudF9sb2NhbF9h
cGljX21vZGUoKSkgaW4gc21wX3NlbmRfc3RvcCgpIHdoaWxlIGludGVycnVwdHMgYXJlIHN0aWxs
Cj4gZGlzYWJsZWQgaW1tZWRpYXRlbHkgYWZ0ZXIgY2FsbGluZyBfX3N0b3BfdGhpc19jcHUoKSBm
b3IgdGhlIGJvb3QgQ1BVLAo+IGFmdGVyIGFsbCBvdGhlciBDUFVzIGhhdmUgYmVlbiBzdG9wcGVk
Lgo+IAo+IGNmOiBkNjM5YmRkOWJiZSAoIng4Ni9hcGljOiBEaXNhYmxlIHRoZSBMQVBJQyBsYXRl
ciBpbiBzbXBfc2VuZF9zdG9wKCkiKQo+ICAgICAuLi4gd2hpY2ggZGlkbid0IHF1aXRlIGZpeCBp
dCBjb21wbGV0ZWx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0Bh
bWF6b24uY28udWs+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+CgpUaGFua3MhCgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvc21wLmMgfCAxICsKPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9zbXAuYyBiL3hlbi9hcmNoL3g4Ni9zbXAuYwo+IGluZGV4IDY1ZWI3Y2JkYTguLmZhYzI5
NWZhNmYgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L3NtcC5jCj4gKysrIGIveGVuL2FyY2gv
eDg2L3NtcC5jCj4gQEAgLTM1NCw2ICszNTQsNyBAQCB2b2lkIHNtcF9zZW5kX3N0b3Aodm9pZCkK
PiAgICAgICAgICBkaXNhYmxlX0lPX0FQSUMoKTsKPiAgICAgICAgICBocGV0X2Rpc2FibGUoKTsK
PiAgICAgICAgICBfX3N0b3BfdGhpc19jcHUoKTsKPiArICAgICAgICB4MmFwaWNfZW5hYmxlZCA9
IChjdXJyZW50X2xvY2FsX2FwaWNfbW9kZSgpID09IEFQSUNfTU9ERV9YMkFQSUMpOwoKWW91IGNv
dWxkIGRvIHRoaXMgb25seSB3aGVuIGtleGVjaW5nLCBidXQgaXQncyBzYWZlIHRvIGRvCnVuY29u
ZGl0aW9uYWxseSwgYW5kIG1pZ2h0IGJlIGhlbHBmdWwgaWYgd2UgYWxzbyBkZWNpZGUgdG8gcGxh
eSB3aXRoCnRoZSBsYXBpYyBtb2RlIGV2ZW4gd2hlbiBub3Qga2V4ZWNpbmcuCgpSb2dlci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
