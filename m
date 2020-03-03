Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 755B217752A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 12:15:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j95SN-0006KQ-Hc; Tue, 03 Mar 2020 11:11:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Dy3W=4U=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j95SL-0006KL-Kc
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 11:11:21 +0000
X-Inumbo-ID: b601efca-5d3f-11ea-ac41-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b601efca-5d3f-11ea-ac41-bc764e2007e4;
 Tue, 03 Mar 2020 11:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583233880;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Z/tg9FzVXUVMX0PagireeJbGn8Cg0FfaD/yF4WhYZBY=;
 b=CqL9hen7Sv5n6ekcvU3XPrBwa6OUXBS7QAcK9rMbN7aEl+hWrmMKRh/f
 fnZhbg3f4l3RnEB1rUxEQeE+nOK5tEDDB2HaSIEZKP/AWd8hsroUfSPaD
 m0UoETDJGocoMuiwNygDzi7KGU8u8encV3X9Y/v9T1bKJ/8TtdQtuDU1p I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HClMv7USIxjUZcLwKrkiqpUwXo2SCqPk2W5boweeastbPo0OEBOTkm3N4v8wFUdZbnrnbAhuX6
 T0o8FYUMkwBo0pP9IdWydIBoCApoC1Qk2ibCGb4AUCA1i9xbVRhEXDGuyT53QJ/w8HCggp+l5g
 mMm15/QnQqZ+ff8+y+cBGaqWzTduWNJntCK++yKoOgI/3P1dc6I1GfkoVFnuCaldxdMkhWt3VU
 mJF2lH71PBozpvoJzd8pMZFg0eXVj2H7qd5aGbnk/oaTFZ0ElczfCY/wavRSzr4NFzTH3V/3z6
 Wnc=
X-SBRS: 2.7
X-MesageID: 13950245
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,511,1574139600"; d="scan'208";a="13950245"
Date: Tue, 3 Mar 2020 12:11:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200303111113.GO24458@Air-de-Roger.citrite.net>
References: <20200302155509.44753-1-roger.pau@citrix.com>
 <766fea94-422e-7f52-96e1-9f5e4cacbbec@suse.com>
 <20200303102909.GN24458@Air-de-Roger.citrite.net>
 <db850653-21e4-c94b-7484-caf69ca7a734@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db850653-21e4-c94b-7484-caf69ca7a734@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/dom0: improve PVH initrd and metadata
 placement
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

T24gVHVlLCBNYXIgMDMsIDIwMjAgYXQgMTI6MDA6MDBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDMuMDMuMjAyMCAxMToyOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFR1ZSwgTWFyIDAzLCAyMDIwIGF0IDEwOjE0OjUwQU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDAyLjAzLjIwMjAgMTY6NTUsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4g
KyAgICAgICAgICAgIC8qIFRydW5jYXRlIHRoZSBzdGFydCBvZiB0aGUgcmVnaW9uICovCj4gPj4+
ICsgICAgICAgICAgICBzdGFydCA9IFJPVU5EVVAoa2VybmVsX2VuZCwgUEFHRV9TSVpFKTsKPiA+
Pj4gKyAgICAgICAgZWxzZSBpZiAoIGtlcm5lbF9zdGFydCA8PSBlbmQgJiYga2VybmVsX2VuZCA+
PSBlbmQgKQo+ID4+Cj4gPj4gYW5kIDwgb24gdGhlIGxlZnQgc2lkZSBvZiB0aGUgJiYgaGVyZS4g
RnVydGhlcm1vcmUgLSBjYW4gdGhpcwo+ID4+IHJlYWxseSBiZSAiZWxzZSBpZigpIiBoZXJlLCBp
LmUuIGRvZXNuJ3QgaXQgbmVlZCB0byBiZSBwbGFpbgo+ID4+ICJpZigpIj8KPiA+IAo+ID4gSSBk
b24ndCB0aGluayBzbywgYXMgdGhlIHJlZ2lvbiB3aGVyZSB0aGUga2VybmVsIGhhcyBiZWVuIGxv
YWRlZCBtdXN0Cj4gPiBhbHdheXMgYmUgYSBzaW5nbGUgUkFNIHJlZ2lvbi4gSWU6IFtrZXJuZWxf
c3RhcnQsIGtlcm5lbF9lbmQpIGlzCj4gPiBhbHdheXMgZ29pbmcgdG8gYmUgYSBzdWJzZXQgb2Yg
YSBSQU0gcmVnaW9uLgo+IAo+IEkgdGhpcyB0cnVlIGV2ZW4gd2l0aCB0aGUgcGFnZSBzaXplIGFs
aWdubWVudCBnZXR0aW5nIGRvbmU/Cj4gSU9XIGFyZSBhbGwgRTgyMCByYW5nZXMgd2UgcHJvZHVj
ZSBleGFjdCBtdWx0aXBsZXMgb2YgNGsgaW4KPiBzaXplIGFuZCBhbGlnbmVkIHRvIDRrIGJvdW5k
YXJpZXM/CgpZZXMsIHB2aF9zZXR1cF9lODIwIGd1YXJhbnRlZXMgdGhhdCwgYXMgdGhlIEVQVC9O
UFQgY2Fubm90IGhhbmRsZQphbnl0aGluZyBzbWFsbGVyIHRoYW4gYSBwYWdlLiBUaGUgUkFNIHJl
Z2lvbnMgaW4gdGhlIG5hdGl2ZSBlODIwIGFyZQphZGp1c3RlZCB0byB0aGF0IGVmZmVjdC4KCj4g
Pj4gQWxzbywgZG8gYm90aCByZWdpb25zIG5lZWQgdG8gYmUgYWRqYWNlbnQ/IElmIG5vdCwgd291
bGRuJ3QgaXQgYmUKPiA+PiBiZXR0ZXIgdG8gZmluZCBzbG90cyBmb3IgdGhlbSBvbmUgYnkgb25l
Pwo+ID4gCj4gPiBUaGF0J3MgZ29pbmcgdG8gYmUgbXVjaCBtb3JlIGNvbXBsaWNhdGVkLCBhcyB5
b3Ugd291bGQgaGF2ZSB0byBhY2NvdW50Cj4gPiBmb3IgcHJldmlvdXMgcmVnaW9ucyB3aGlsZSBz
ZWFyY2hpbmcgZm9yIGVtcHR5IHNwYWNlcy4gSWYgd2Ugd2FudCB0bwo+ID4gZ28gdGhhdCByb3V0
ZSB3ZSB3b3VsZCBoYXZlIHRvIHVzZSBhIHJhbmdlc2V0IG9yIHNvbWUgc3VjaCBpbiBvcmRlciB0
bwo+ID4ga2VlcCB0cmFjayBvZiB1c2VkIGFyZWFzLgo+IAo+IEkgYWNjZXB0IHRoaXMgYmVpbmcg
bW9yZSBjb21wbGljYXRlZCwgYW5kIGhlbmNlIG5vdCByZWFsbHkKPiB3YW50aW5nIGRvaW5nIG5v
dyBhbmQgaGVyZS4gQnV0IHBlcmhhcHMgeW91IGNvdWxkIGxlYXZlIGEKPiBjb21tZW50IHRvIHRo
ZSBlZmZlY3QgdGhhdCB0aGUgY2hvaWNlIG9mIHVzaW5nIGEgc2luZ2xlCj4gcmVnaW9uIGlzIGZv
ciBzaW1wbGljaXR5IHJlYXNvbnM/CgpTdXJlLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
