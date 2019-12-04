Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF0F1126F0
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 10:20:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icQn5-00011J-MG; Wed, 04 Dec 2019 09:17:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WV3s=Z2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1icQn3-00011E-Ud
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 09:17:45 +0000
X-Inumbo-ID: edf17f1e-1676-11ea-a0d2-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edf17f1e-1676-11ea-a0d2-bc764e2007e4;
 Wed, 04 Dec 2019 09:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575451064;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=l6l+O87Vs1Ourv1CsvJ1c8nDz6SaLRsGQuh6iAyLUzg=;
 b=Js7rRkpo82uQwDVr7E/1N4bF/H/Sngzbwk38djXVc0djgaVctdMJ8QII
 9xr1kqOVPzgXJ/LBiNuM+CfFvlf5fDDP1hi8FFHFGtZoekPaufDKgh5JV
 kew94oMQ3TH56YbbAtnD3rrtpimTw+plE81ol1vR+v7xJYNCbAL065sQR U=;
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
IronPort-SDR: 5OCZPiA+GUgLRDv9JgDl3OtKFIDB+X9e0eVFa5RgRTvEgxt+Y0CKR6wbI1jnZh7dDGG2gFIs1w
 i4eSRYvsTJkY/Hbb04F3//+vAxbKm9f0bRToAkyT22EjmvfHnV6fEH2Mi1xF2AoiVin3DWoITD
 4M7/aPDORWMSyUezj1zy5SkyFpE9b5rrGM1+Ev5pAG63RNWPy+IkNiiRGOC5dJMcllpnVAixaK
 HXrHckxg1l1euupJKlJsR17NWqC1wXv4Zs/6zfRn+S8dLDyrnI71XaUPYQpci5nakmKvpOZSG5
 pUc=
X-SBRS: 2.7
X-MesageID: 9722692
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,277,1571716800"; 
   d="scan'208";a="9722692"
Date: Wed, 4 Dec 2019 10:17:34 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191204091734.GG980@Air-de-Roger>
References: <20191129112851.19273-1-roger.pau@citrix.com>
 <20191129112851.19273-3-roger.pau@citrix.com>
 <20191129113813.GX980@Air-de-Roger>
 <c06efe66-389c-2124-d4c1-f26a54d5ac5f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c06efe66-389c-2124-d4c1-f26a54d5ac5f@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 2/4] x86/apic: force phys mode if
 interrupt remapping is disabled
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

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMDQ6MTQ6NDZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjkuMTEuMjAxOSAxMjozOCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBGcmksIE5vdiAyOSwgMjAxOSBhdCAxMjoyODo0OVBNICswMTAwLCBSb2dlciBQYXUgTW9ubmUg
d3JvdGU6Cj4gPj4gQ2x1c3RlciBtb2RlIGNhbiBvbmx5IGJlIHVzZWQgd2l0aCBpbnRlcnJ1cHQg
cmVtYXBwaW5nIHN1cHBvcnQsIHNpbmNlCj4gPj4gdGhlIHRvcCAxNmJpdHMgb2YgdGhlIEFQSUMg
SUQgYXJlIGZpbGxlZCB3aXRoIHRoZSBjbHVzdGVyIElELCBhbmQKPiA+PiBoZW5jZSBvbiBzeXN0
ZW1zIHdoZXJlIHRoZSBwaHlzaWNhbCBJRCBpcyBzdGlsbCBzbWFsbGVyIHRoYW4gMjU1IHRoZQo+
ID4+IGNsdXN0ZXIgSUQgaXMgbm90LiBGb3JjZSB4MkFQSUMgdG8gdXNlIHBoeXNpY2FsIG1vZGUg
aWYgdGhlcmUncyBubwo+ID4+IGludGVycnVwdCByZW1hcHBpbmcgc3VwcG9ydC4KPiA+Pgo+ID4+
IE5vdGUgdGhhdCB0aGlzIHJlcXVpcmVzIGEgZnVydGhlciBwYXRjaCBpbiBvcmRlciB0byBlbmFi
bGUgeDJBUElDCj4gPj4gd2l0aG91dCBpbnRlcnJ1cHQgcmVtYXBwaW5nIHN1cHBvcnQuCj4gPj4K
PiA+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KPiA+IAo+ID4gVGhpcyBpcyBtaXNzaW5nIGEgY29tbWFuZCBsaW5lIGRvYyB1cGRhdGUgYW5k
IHRoZSBsb2dpYyBiZWxvdyBpZ25vcmVzCj4gPiBhIHVzZXItc2V0IHgyYXBpY19waHlzIHZhbHVl
Lgo+IAo+IFNvIHdoYXQgd291bGQgdGhlIGJlaGF2aW9yIGJlIGluIHlvdXIgb3BpbmlvbiB3aGVu
IHRoZSB1c2VyCj4gaGFzIHJlcXVlc3RlZCBjbHVzdGVyIG1vZGU/IEkgY2FuJ3Qgc2VlIHlvdSBk
byBtdWNoIG90aGVyCj4gdGhhbiBwYW5pYygpLWluZywgcGVyaGFwcyBpdCdzIGJldHRlciB0byBv
dmVycmlkZSB0aGUgcmVxdWVzdAo+IChhcyB5b3UgYWxyZWFkeSBkbyk/CgpJIHRoaW5rIHBhbmlj
J2luZyBpcyBmaW5lLCBhIHVzZXIgc2hvdWxkbid0IGJlIHNldHRpbmcgeDJhcGljX3BoeXMKdW5s
ZXNzIHRoZXkga25vdyB3aGF0IGFyZSBkb2luZywgYW5kIHRoZW4gWGVuIGNoYW5naW5nIGl0IG9u
IHRoZSBiYWNrCm9mIHRoZSB1c2VyIGFsc28gZG9lc24ndCBzZWVtIGZpbmUuCgpBIHBhbmljIGV4
cGxhaW5pbmcgdGhhdCB4MmFwaWNfcGh5cz1mYWxzZSBpcyBub3Qgc3VwcG9ydGVkIGFuZCB0aGF0
CnRoZSBib3ggY2FuIG9ubHkgYmUgYm9vdGVkIHdpdGggeDJhcGljIHBoeXMgbW9kZSBzaG91bGQg
YmUgZmluZSBJTU8uCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
