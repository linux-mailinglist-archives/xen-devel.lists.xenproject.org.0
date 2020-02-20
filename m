Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6055165A13
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 10:24:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4i0e-00028e-Uh; Thu, 20 Feb 2020 09:20:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rOW3=4I=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4i0d-00028Z-JH
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 09:20:39 +0000
X-Inumbo-ID: 41a44474-53c2-11ea-aa99-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41a44474-53c2-11ea-aa99-bc764e2007e4;
 Thu, 20 Feb 2020 09:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582190438;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZOFeK2aUpocH7bZpnnNcsbz8KNetoQ8+8jrTspfUUJA=;
 b=hhIYp21H0UFyCOhG0BdQRj9ab14xbJ9Ce9foeF9P9lnIYkxazRymP5E3
 DRHFn1RjGyu+rVEMeAvT/i//UnK7WdPEEL2M03kKciIMFA7t60S/H8z0z
 YbkuLC6BgX1bJKdPytGR6wExDYVXyb6YFNGdCwOKWBdPVKLozvyhYfGRn I=;
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
IronPort-SDR: t8juKkgAlmmDqj0SNZOi0F00Y/0LO1C6UKgjm4mmw9J9eP2SIl6Nz8tbrFpWVP3MivvLwhrZDM
 UtBKy1iQeYiz1FlJ2Bsxi0jJIaO2GIMj1/sLhR8gb9ul3uIa0ytb9qxVWeNNndgeoQWBjgwST0
 X0dEiNeCdahRIVKezKXFhbXFHkjXtfQBr3/xe98H9Y42hnf9iGD1SoL4eV5WQY5HRuawaxcU9d
 JR3fP9A4zjy7gtm1zQzespMjjyaf9NnDihkiQHW/08UWAo/o8P9+VhskinSIB94HqfrdEWCFpv
 1tA=
X-SBRS: 2.7
X-MesageID: 13360754
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,463,1574139600"; d="scan'208";a="13360754"
Date: Thu, 20 Feb 2020 10:20:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200220092030.GJ4679@Air-de-Roger>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-2-roger.pau@citrix.com>
 <6700a65f-44eb-401f-755a-ebb5d68b9b21@suse.com>
 <8abb37bc-e1e8-d9ab-d66e-4c0e9c8f4da3@suse.com>
 <bb1ec887-0b04-20e4-20f4-e45b1e8aa8a3@suse.com>
 <560f20f0-db06-e21d-cf8a-cecf4d6cf09b@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <560f20f0-db06-e21d-cf8a-cecf4d6cf09b@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/2] smp: convert the cpu maps lock into a
 rw lock
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDg6NTc6MzNBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IAo+IAo+IE9uIDIwLzAyLzIwMjAgMDg6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4g
T24gMjAuMDIuMjAyMCAwOToyNywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiA+ID4gT24gMjAuMDIu
MjAgMDk6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPiA+IE9uIDEzLjAyLjIwMjAgMTI6MzIs
IFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+ID4gPiA+IE1vc3QgdXNlcnMgb2YgdGhlIGNwdSBt
YXBzIGp1c3QgY2FyZSBhYm91dCB0aGUgbWFwcyBub3QgY2hhbmdpbmcgd2hpbGUKPiA+ID4gPiA+
IHRoZSBsb2NrIGlzIGJlaW5nIGhlbGQsIGJ1dCBkb24ndCBhY3R1YWxseSBtb2RpZnkgdGhlIG1h
cHMuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IENvbnZlcnQgdGhlIGxvY2sgaW50byBhIHJ3IGxvY2ss
IGFuZCB0YWtlIHRoZSBsb2NrIGluIHJlYWQgbW9kZSBpbgo+ID4gPiA+ID4gZ2V0X2NwdV9tYXBz
IGFuZCBpbiB3cml0ZSBtb2RlIGluIGNwdV9ob3RwbHVnX2JlZ2luLiBUaGlzIHdpbGwgbG93ZXIK
PiA+ID4gPiA+IHRoZSBjb250ZW50aW9uIGFyb3VuZCB0aGUgbG9jaywgc2luY2UgcGx1ZyBhbmQg
dW5wbHVnIG9wZXJhdGlvbnMgdGhhdAo+ID4gPiA+ID4gdGFrZSB0aGUgbG9jayBpbiB3cml0ZSBt
b2RlIGFyZSBub3QgdGhhdCBjb21tb24uCj4gPiA+ID4gPiAKPiA+ID4gPiA+IE5vdGUgdGhhdCB0
aGUgcmVhZCBsb2NrIGNhbiBiZSB0YWtlbiByZWN1cnNpdmVseSAoYXMgaXQncyBhIHNoYXJlZAo+
ID4gPiA+ID4gbG9jayksIGFuZCBoZW5jZSB3aWxsIGtlZXAgdGhlIHNhbWUgYmVoYXZpb3IgYXMg
dGhlIHByZXZpb3VzbHkgdXNlZAo+ID4gPiA+ID4gcmVjdXJzaXZlIGxvY2suIEFzIGZvciB0aGUg
d3JpdGUgbG9jaywgaXQncyBvbmx5IHVzZWQgYnkgQ1BVCj4gPiA+ID4gPiBwbHVnL3VucGx1ZyBv
cGVyYXRpb25zLCBhbmQgdGhlIGxvY2sgaXMgbmV2ZXIgdGFrZW4gcmVjdXJzaXZlbHkgaW4KPiA+
ID4gPiA+IHRoYXQgY2FzZS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gV2hpbGUgdGhlcmUgYWxzbyBj
aGFuZ2UgZ2V0X2NwdV9tYXBzIHJldHVybiB0eXBlIHRvIGJvb2wuCj4gPiA+ID4gPiAKPiA+ID4g
PiA+IFJlcG9ydGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+ID4gPiA+ID4g
U3VnZ2VzdGVkLWFsc28tYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pgo+ID4gPiA+IAo+ID4gPiA+IEknbSBhZnJhaWQgSSBjYW4ndCBzZWUgaG93IG9mZmxpbmluZyBh
IENQVSB3b3VsZCBub3cgd29yay4KPiA+ID4gPiBDb25kZW5zZWQgdG8ganVzdCB0aGUgcmVsZXZh
bnQgY2FsbHMsIHRoZSBzZXF1ZW5jZSBmcm9tCj4gPiA+ID4gY3B1X2Rvd24oKSBpcwo+ID4gPiA+
IAo+ID4gPiA+IGNwdV9ob3RwbHVnX2JlZ2luKCkgKGkuZS4gbG9jayB0YWtlbiBpbiB3cml0ZSBt
b2RlKQo+ID4gPiA+IHN0b3BfbWFjaGluZV9ydW4oKQo+ID4gPiA+IC0+IGdldF9jcHVfbWFwcygp
IChsb2NrIHVuYXZhaWxhYmxlIHRvIHJlYWRlcnMpCj4gPiA+IAo+ID4gPiBJJ3ZlIGFscmVhZHkg
cG9pbnRlZCB0aGF0IG91dCBpbiBhbm90aGVyIHRocmVhZC4gOi0pCj4gPiAKPiA+IE9oLCBJIGRp
ZG4ndCByZWNhbGwuIE9yIGVsc2UgSSB3b3VsZG4ndCBoYXZlIGNvbW1pdHRlZCB0aGUKPiA+IHBh
dGNoIGluIHRoZSBmaXJzdCBwbGFjZS4KPiA+IAo+ID4gPiA+IE90aGVyIHRoYW4gcmVjdXJzaXZl
IHNwaW4gbG9ja3MsIHJ3IGxvY2tzIGRvbid0IGN1cnJlbnRseQo+ID4gPiA+IGhhdmUgYSBjb25j
ZXB0IG9mIHBlcm1pdHRpbmcgaW4gYSByZWFkZXIgd2hlbiB0aGlzIENQVQo+ID4gPiA+IGFscmVh
ZHkgaG9sZHMgdGhlIGxvY2sgaW4gd3JpdGUgbW9kZS4gSGVuY2UgSSBjYW4ndCBzZWUKPiA+ID4g
PiBob3cgdGhlIGdldF9jcHVfbWFwcygpIGFib3ZlIHdvdWxkIG5vdyBldmVyIHN1Y2NlZWQuIEFt
IEkKPiA+ID4gPiBtaXNzaW5nIGFueXRoaW5nLCBvciBkb2VzIHRoZSBwYXRjaCBuZWVkIHJldmVy
dGluZyB1bnRpbAo+ID4gPiA+IHRoZSByZWFkX3RyeWxvY2soKSBnb3QgZW5oYW5jZWQgdG8gY29w
ZSB3aXRoIHRoaXM/Cj4gPiA+IAo+ID4gPiBJIHRoaW5rIHRoaXMgY2FuIGJlIGhhbmRsZWQgbG9j
YWxseSBpbiBnZXRfY3B1X21hcHMoKSBhbmQKPiA+ID4gY3B1X2hvdHBsdWdfYmVnaW4oKSB3aXRo
IHRoZSB1c2Ugb2YgYSB2YXJpYWJsZSBob2xkaW5nIHRoZSBjcHUgKG9yCj4gPiA+IE5SX0NQVVMp
IG9mIHRoZSBjcHUgaG9sZGluZyB0aGUgd3JpdGUgbG9jay4gZ2V0X2NwdV9tYXBzKCkgY2FuIGp1
c3QKPiA+ID4gc3VjY2VlZCBpbiBjYXNlIHRoaXMgdmFyaWFibGUgY29udGFpbnMgc21wX3Byb2Nl
c3Nvcl9pZCgpLgo+ID4gCj4gPiBJdCBjb3VsZCwgeWVzLiBCdXQgdGhpcyBpcyBhIGdlbmVyYWwg
c2hvcnRjb21pbmcgb2Ygb3VyIHJ3Cj4gPiBsb2NrIGltcGxlbWVudGF0aW9uIChhbmQgaW1vIGEg
dHJhcCB3YWl0aW5nIGZvciBvdGhlcnMgdG8KPiA+IGZhbGwgaW50byBhcyB3ZWxsKSwgYW5kIGhl
bmNlIEkgdGhpbmsgaXQgd291bGQgYmV0dGVyIGJlCj4gPiB0YWtlbiBjYXJlIG9mIGluIGEgZ2Vu
ZXJpYyBtYW5uZXIuCj4gSSBhY3R1YWxseSBkaWQgZmFsbCBpbnRvIHRoaXMgdHJhcCBsYXN0IHdl
ZWsgd2hlbiBwbGF5aW5nIHdpdGggdGhlIHAybSBjb2RlCj4gYW5kIHRoZSBlbXVsYXRpb24gY29k
ZS4gVGhlIGVtdWxhdGlvbiBjb2RlIGlzIGdyYWJiaW5nIHRoZSB3cml0ZSBsb2NrIHZlcnkKPiBl
YXJseSAod2hpY2ggSSBkaWRuJ3QgaW5pdGlhbGx5IHNwb3QpIGFuZCBJIHdhcyB0cnlpbmcgdG8g
dXNlIHRoZSByZWFkIGxvY2sKPiBpbiBhIHN1YnNlcXVlbnQgY2FsbGVyIHF1aXRlIGRlZXAgaW4g
dGhlIHN0YWNrLgo+IAo+IFNvIGEgZ2VuZXJpYyBtYW5uZXIgdG8gc29sdmUgdGhlIHByb2JsZW0g
aGVyZSB3b3VsZCBiZSBpZGVhbC4KCkxldCBtZSB0YWtlIGEgbG9vaywgaXQgZG9lc24ndCBzZWVt
IHZlcnkgY29udm9sdXRlZCB0byBhZGFwdCBzb21lIG9mCnRoZSByZWN1cnNpdmUgbG9naWMgdG8g
YmUgdXNlZCBpbiBhIHJ3IGxvY2suCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
