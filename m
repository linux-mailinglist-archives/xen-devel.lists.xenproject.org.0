Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E073914EA11
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 10:28:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixSZ3-0007nm-I2; Fri, 31 Jan 2020 09:26:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pgE6=3U=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ixSZ1-0007nh-9l
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 09:26:11 +0000
X-Inumbo-ID: b74e47b8-440b-11ea-8396-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b74e47b8-440b-11ea-8396-bc764e2007e4;
 Fri, 31 Jan 2020 09:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580462771;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qvXOMA2ysXNDIhWvLm+w2eNaH73j1vnGezVz0FK+/EA=;
 b=Hwpbo+54DbRc1zx+hhyVCT3irF45uhyhYoiYsTGwZzG1KwgoKK7ItMSi
 q8lZqs52pJa4+zmFGGfXZ3ah4NdM9EwGfTdSj9RXB3T5GzOH+iF0Cq3JT
 rTeu73yCMeUBb666JWzALLP6uWAqeovQkq3+ohucF4DsaU4N2aFJg9VVu E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rz634cC9I3zJAiVLeAzH0uETbuW/fOXH3peeWsfa0/AjpH3MH0UUNwRVZadkhezMEyq7Q0UV3H
 k78eTHPgGVezr7xwCYzvcAGUtG8bhpXAs7FSSoxjv9n0AZ8AiYjzrkQo9+2nwdE85jOcZIixk1
 kkRTuLoaNHHnvbyDEFfhR9ZV5jVGpgSFlhy9HeMaGdgQ38abrsc5uV23e9HDqyHyCNqJ4qXPeQ
 mQTItZEDSKOX+7WJUf8Y7EmXHpC3Kve+G3v6d+L2AZPtY2DGn1Si4LtENeDsaQ6hpAp9lsvU4p
 BjY=
X-SBRS: 2.7
X-MesageID: 11744657
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,385,1574139600"; d="scan'208";a="11744657"
Date: Fri, 31 Jan 2020 10:25:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>, Jan Beulich <jbeulich@suse.com>
Message-ID: <20200131092552.GR4679@Air-de-Roger>
References: <9a84d6bd-2aa0-e97f-a517-3c51aabdfe27@citrix.com>
 <b898ca9e-d1dd-5091-d182-a3b0c5a7f88e@citrix.com>
 <d961303d-d198-8f46-f0d9-a70e3d4e1b87@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d961303d-d198-8f46-f0d9-a70e3d4e1b87@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Xen clocksource and PV shim
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMDk6MjY6NTBBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMzEuMDEuMjAyMCAwNDowMiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gPiBPbiAz
MC8wMS8yMDIwIDIzOjE0LCBJZ29yIERydXpoaW5pbiB3cm90ZToKPiA+PiBJIHdhcyBkZWJ1Z2dp
bmcgY29uc3RhbnQgZnJlZXplcyBvZiBQViBzaGltIG9uIEFNRCBoYXJkd2FyZQo+ID4+IGFmdGVy
IGdvaW5nIG91dCBvZiBhIGxvbmcgc3VzcGVuZC4KPiAKPiBXaGF0IGlzICJzdXNwZW5kIiBoZXJl
PyBTMz8gSWYgc28sIC4uLgo+IAo+ID4+IEFzIGl0IHR1cm5lZCBvdXQgdGhlIHJvb3QgY2F1c2UK
PiA+PiBvZiB0aGlzIGlzIHBsYXRmb3JtIHRpbWUganVtcGluZyBmb3J3YXJkIHRvIHRoZSBhbW91
bnQgb2YgdGltZQo+ID4+IHNwZW50IGluIHN1c3BlbmRlZCBzdGF0ZS4gT24gSW50ZWwgdGhpcyBp
c3N1ZSBpcyBwYXBlcmVkIG92ZXIKPiA+PiBieSBDT05TVEFOVF9UU0MgYmVpbmcgc2V0IHdoaWNo
IGF2b2lkcyBDUFUgdGltZSBzeW5jIHdpdGgKPiA+PiBwbGF0Zm9ybSB0aW1lLgo+ID4+Cj4gPj4g
VXBvbiBmdXJ0aGVyIGV4YW1pbmF0aW9uIGl0IGFwcGVhcnMgdGhhdCBqdW1waW5nIGlzIGJha2Vk
Cj4gPj4gaW50byB0aGUgaW1wbGVtZW50YXRpb24gb2YgTDAgWGVuIGFuZCB0aGVyZSBpcyBubyBz
ZWVtaW5nbHkKPiA+PiBzdHJhaWdodCBmb3J3YXJkIHdheSB0byBleHRyYWN0IHN0YWJsZSBjb250
aW51b3VzIHJhdGUgb3V0Cj4gPj4gb2Ygd2hhdCB3ZSBoYXZlLgo+ID4+Cj4gPj4gSSBleHBlY3Qg
dGhpcyBpcyBhIGtub3duIGlzc3VlIHdpdGggWGVuIFBWIGNsb2NrIGFzIEkgZm91bmQKPiA+PiB0
aGlzIGFsbW9zdCBpbW1lZGlhdGVseTogaHR0cHM6Ly93aWtpLmRlYmlhbi5vcmcvWGVuL0Nsb2Nr
c291cmNlCj4gPj4gQ3VycmVudGx5IEkgZG9uJ3QgdW5kZXJzdGFuZCBob3cgaW4gdGhhdCBjYXNl
IFhlbiBjbG9jayBzb3VyY2UKPiA+PiBjb3VsZCBiZSBzdWl0YWJsZSBhcyBhIHBsYXRmb3JtIHRp
bWVyIGZvciBuZXN0ZWQgWGVuLgo+ID4+Cj4gPj4gSXMgbXkgdW5kZXJzdGFuZGluZyBvZiB0aGUg
c2l0dWF0aW9uIGNvcnJlY3Q/IENvdWxkIGl0IGJlCj4gPj4gZml4ZWQgaW4gTDAgWGVuIG9yIGl0
J3MgYWxyZWFkeSBiYWNrZWQgaW50byB0aGUgQUJJPyBTaG91bGQKPiA+PiB3ZSBrZWVwIFhlbiBw
bGF0Zm9ybSB0aW1lciBpbiB0aGUgc291cmNlIGNvZGUgdGhlbj8gRG9lcyB1c2luZwo+ID4+IGFs
dGVybmF0aXZlIGNsb2NrIHNvdXJjZSBmb3IgUFYgc2hpbSBtYWtlIHNlbnNlPwo+ID4gCj4gPiAu
Li4gT2ssIEkgc2VlbSB0byBnZXQgbG9zdCBpbiB0aGUgd2VlZHMgb2YgdGltZWtlZXBpbmcgY29k
ZSAtCj4gPiBwbGF0Zm9ybSB0aW1lciBpbmZyYXN0cnVjdHVyZSBpcyBhbHJlYWR5IHByZXBhcmVk
IGZvciB0aGlzIHNvcnQKPiA+IG9mIHNjZW5hcmlvIHdoaWxlIGV4aXRpbmcgUzMuIEkganVzdCBu
ZWVkIHRvIGNhbGwgcmVzdW1lX3BsYXRmb3JtX3RpbWVyKCkKPiA+IGZyb20gaHlwZXJ2aXNvcl9y
ZXN1bWUoKSBvciBzb21ldGhpbmcgc2ltaWxhci4gUGF0Y2ggd2lsbCBmb2xsb3cuCgpBRkFJQ1Qg
eW91IHdpbGwgYWxzbyBoYXZlIHRvIGltcGxlbWVudCB0aGUgcmVzdW1lIGhvb2sgZm9yCnBsdF94
ZW5fdGltZXIgaW4gb3JkZXIgdG8gcmVzZXQgbGFzdF92YWx1ZSB0byAwIG9uIHJlc3VtZS4KCj4g
Li4uIHdoeSB3b3VsZCB0aW1lX3Jlc3VtZSgpIG5vdCBiZSBjYWxsZWQ/IE9oLCBwdl9zaGltX3No
dXRkb3duKCkKPiB1c2VzIFBWIG1lY2hhbmlzbXMgdG8gZG8gdGhlIHN1c3BlbmQvcmVzdW1lLiBJ
IHdvbmRlciB3aGF0IGVsc2UsCj4gYmVzaWRlcyB0aW1lX3Jlc3VtZSgpLCBpcyBtaXNzaW5nIHRo
ZXJlLgoKTm90IHN1cmUgdGltZV9yZXN1bWUoKSBpcyBzdWl0YWJsZSBhcy1pcywgaXQgcG9rZXMg
YXQgSU8gcG9ydHMgZm9yIFBJVAp3aGljaCBhcmUgbm90IGltcGxlbWVudGVkLCBhbmQgaGVuY2Ug
bWlnaHQgbmVlZCBzb21lIG1hc3NhZ2luZyB0byB3b3JrCm9uIGEgUFZIIGVudmlyb25tZW50LgoK
SSdtIG5vdCBzdXJlIHRoZXJlJ3MgYSBsb3QgbW9yZSB0aGF0IG5lZWRzIHJlc3VtaW5nLCB0aGUg
c3RhdGUgb2YKZW11bGF0ZWQgZGV2aWNlcyBpcyBwcmVzZXJ2ZWQgYWNyb3NzIHN1c3BlbmQvcmVz
dW1lLCBhbmQgdGhlIHNoaW0KaXRzZWxmIG9ubHkgdXNlcyBldmVudCBjaGFubmVscywgZ3JhbnQg
dGFibGVzIGFuZCB0aGUgdGltZXIgUFYKaW50ZXJmYWNlcywgd2hpY2ggYXJlIHRoZSBvbmVzIHRo
YXQgbmVlZCByZXN1bWluZyBzaW5jZSBzdGF0ZSBpcyBub3QKcHJlc2VydmVkIGZvciBQViBpbnRl
cmZhY2VzLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
