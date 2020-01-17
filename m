Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7A3140C6A
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 15:27:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isSYk-00016i-Ei; Fri, 17 Jan 2020 14:25:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zPxh=3G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isSYi-00016R-OO
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 14:25:12 +0000
X-Inumbo-ID: 2607e362-3935-11ea-9fd7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2607e362-3935-11ea-9fd7-bc764e2007e4;
 Fri, 17 Jan 2020 14:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579271103;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=gkcfGlnD3viBgJ9JXmv5v5Lyr5pNp1Ubs3NGLNFT0/Y=;
 b=YobvXuMTxKPMD1vWo1s4GRSUJ+vpX6OQ5hpAYL9WEWiYhgZz13jcvCSd
 wg3qYLMdTcp4/VikCVIFl+h5pIaIRLJ6vqZ/L8yx+Qtg7YDrh0Y9ABcYT
 xFUvykUXV0BnlpAcU+ezkADr/Ja1i7e4YC66exD8oBm1FoHlccoVSVxst s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: W6omavvv54He0QPJtAuA7dw8sQaOIoldWPm7Z/Av6OijxivhweVXiOvjbm6QYNp/WeYSdxg3QD
 jP+gdqSTAZQWk0ItWov9HmAu7J3bx0rL/sdPID04inhQVMfm0ra16+aYE1VQjSlKlhrv25tfoq
 nyh1iDmgRhiDJ2eygashKAq++D7HyoUNeEjoD+FajCArn4yMTsRt3dqBLYI29Cv91PvFqpWjnx
 qO6TqXx9dIV+awRSBQmfynCcdU/UcAEHbv3bDJc6uQET8A4DWQRft0qG1OV5GDyVfLIw9XFPIx
 4rQ=
X-SBRS: 2.7
X-MesageID: 11088357
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11088357"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24097.50107.530788.219066@mariner.uk.xensource.com>
Date: Fri, 17 Jan 2020 14:24:59 +0000
To: George Dunlap <george.dunlap@citrix.com>
In-Reply-To: <1d3336b4-939f-d2a5-2f0e-91c651d788ff@citrix.com>
References: <20200113170843.21332-1-ian.jackson@eu.citrix.com>
 <20200113170843.21332-11-ian.jackson@eu.citrix.com>
 <1d3336b4-939f-d2a5-2f0e-91c651d788ff@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 10/10] libxl: event: Move poller pipe
 emptying to the end of afterpoll
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1BBVENIIHYyIDEwLzEwXSBsaWJ4bDogZXZlbnQ6
IE1vdmUgcG9sbGVyIHBpcGUgZW1wdHlpbmcgdG8gdGhlIGVuZCBvZiBhZnRlcnBvbGwiKToKPiBP
biAxLzEzLzIwIDU6MDggUE0sIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gSWYgYSB0aW1lciBldmVu
dCBjYWxsYmFjayBjYXVzZXMgdGhpcyBwb2xsZXIgdG8gYmUgd29rZW4gKG5vdCB2ZXJ5Cj4gPiB1
bmxpa2VseSkgd2Ugd291bGQgZ28gcm91bmQgdGhlIHBvbGwgbG9vcCB0d2ljZSByYXRoZXIgdGhh
biBvbmNlLgo+ID4gCj4gPiBEbyB0aGUgcG9sbGVyIHBpcGUgZW1wdHlpbmcgYXQgdGhlIGVuZDsg
dGhpcyBpcyBzbGlnaHRseSBtb3JlCj4gPiBlZmZpY2llbnQgYmVjYXVzZSBpdCBjYW4ndCBjYXVz
ZSBhbnkgY2FsbGJhY2tzLCBzbyBpdCBoYXBwZW5zIGFmdGVyCj4gPiBhbGwgdGhlIGNhbGxiYWNr
cyBoYXZlIGJlZW4gcnVuLgo+ID4gCj4gPiAoVGhpcyBwaXBlLWVtcHR5aW5nIGhhcyB0byBoYXBw
ZW4gaW4gYWZ0ZXJwb2xsIHJhdGhlciB0aGFuIHRoZQo+ID4gYXBwYXJlbnRseSBtb3JlIGxvZ2lj
YWwgYmVmb3JlcG9sbCwgYmVjYXVzZSB0aGUgYXBwbGljYXRpb24gY2FsbGluZwo+ID4gYmVmb3Jl
cG9sbCBkb2Vzbid0IGNvbnN0aXR1dGUgYSBwcm9taXNlIHRvIGFjdHVhbGx5IGRvIGFueXRoaW5n
LikKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNp
dHJpeC5jb20+Cj4gCj4gSSBjYW4ndCBxdWl0ZSBmaWd1cmUgb3V0OiB3aHkgd291bGQgeW91IGVu
ZCB1cCBnb2luZyBhcm91bmQgdGhlIGxvb3AKPiB0d2ljZSwgYW5kIGhvdyBkb2VzIHRoaXMgZml4
IGl0PwoKSSBub3cgdGhpbmsgdGhpcyBpcyBub3QgdHJ1ZSBhbmQgdGhlIHNpdHVhdGlvbiBJIGRl
c2NyaWJlIGNhbm5vdApoYXBwZW4uCgpXaGF0IEkgd2FzIHRoaW5raW5nIHdhcyB0aGF0IHBvbGxl
cnNfbm90ZV9vc2V2ZW50X2FkZGVkIG1pZ2h0IGJlCmNhbGxlZCBieSBzb21ldGhpbmcgZnJvbSB0
aW1lX29jY3VycywgYW5kIHRoYXQgd291bGQgd3JpdGUgYSBieXRlIGludG8KdGhlIHBvbGxlciBw
aXBlLiAgQnV0IHBvbGxlcnNfbm90ZV9vc2V2ZW50X2FkZGVkIGRvZXNuJ3Qgd2FrZSB1cApwb2xs
ZXJzOyBpdCBqdXN0IHRhZ3MgdGhlbSBvc2V2ZW50c19hZGRlZC4KCkkgbm93IHRoaW5rIHRoZSBz
cHVyaW91cyB3YWtldXAgY2Fubm90IGhhcHBlbiBiZWNhdXNlOgoKRm9yIHRoaXMgcGF0Y2ggdG8g
bWFrZSBhbnkgZGlmZmVyZW5jZSwgdGhlIHBvbGxlciBwaXBlIHdvdWxkIGhhdmUgdG8KYmUgd29r
ZW4gdXAgYnkgc29tZXRoaW5nIGluIHRoZSB0aW1lIHNjYW4gbG9vcCBpbiBhZnRlcnBvbGxfaW50
ZXJuYWwuCgpCdXQgcG9sbGVyIHBpcGVzIGFyZSBvbmx5IHdva2VuIHVwIGJ5IGFvIGNvbXBsZXRp
b24gb3IgYnkKY2xlYW51cF8xX2JhdG9uLgoKY2xlYW51cF8xX2JhdG9uIGlzIG5vdCBjYWxsZWQg
YW55d2hlcmUgdGhlcmUgKGFzIGFuIGFyZ3VtZW50IGFnYWluc3Q6CmFueSBzdWNoIGNhbGwgd291
bGQgdmlvbGF0ZSB0aGUgcnVsZSB0aGF0IGNsZWFudXBfMV9iYXRvbiBtYXkgbm90IGJlCmNhbGxl
ZCB3aXRoIGEgcG9sbGVyIGluIGhhbmQpLgoKQW5kIGFzIGZvciBhbyBjb21wbGV0aW9uLCB3ZSB3
b3VsZCBpbmRlZWQgd2FrZSB1cCB0aGUgcG9sbGVyLiAgQnV0IHdlCmFsc28gbWFyayB0aGUgYW8g
YXMgY29tcGxldGUsIHNvIGFvX2lucHJvZ3Jlc3Mgd291bGQgc3BvdAohYW9fd29ya19vdXRzdGFu
ZGluZywgYW5kIG5vdCByZWVudGVyIGV2ZW50bG9vcF9pdGVyYXRpb24gYXQgYWxsLgpUaGUgd29r
ZW4tdXAgcG9sbGVyIHdvdWxkIGJlIHB1dCBieSBhb19pbnByb2dyZXNzLgoKVGhpcyBsZWFkcyBt
ZSB0byB0aGlzIG9ic2VydmF0aW9uOiBwb2xsZXJfZ2V0IG1pZ2h0IGdpdmUgeW91IGEKd29rZW4t
dXAgcG9sbGVyLiAgVGhpcyBpcyBub3QgaW5jb3JyZWN0LCBidXQgaXQgaXMgcG9pbnRsZXNzLiAg
U28KbWF5YmUgSSBzaG91bGQgd3JpdGUgYSBwYXRjaCB0aGF0IHB1dHMgYSBjYWxsIHRvCmxpYnhs
X19zZWxmX3BpcGVfZWF0YWxsIGluIGxpYnhsX19wb2xsZXJfZ2V0LgoKVEJIIEkgc3RpbGwgdGhp
bmsgdGhpcyBwYXRjaCB0aWRpZXMgdGhlIGNvZGUgdXAgYSBiaXQuCgpJYW4uCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
