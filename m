Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460CE12D9A5
	for <lists+xen-devel@lfdr.de>; Tue, 31 Dec 2019 16:14:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1imJBC-0005Op-Ih; Tue, 31 Dec 2019 15:11:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gg/0=2V=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1imJBB-0005Ok-M5
 for xen-devel@lists.xenproject.org; Tue, 31 Dec 2019 15:11:29 +0000
X-Inumbo-ID: d1b5372c-2bdf-11ea-a134-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1b5372c-2bdf-11ea-a134-12813bfff9fa;
 Tue, 31 Dec 2019 15:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577805089;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IIiK4bSg7gwxwDdQutIoPGDazA81RdlNHAIEiCNm744=;
 b=QU/4XfjsNsczfO+D27nEDcCTiyNrihv1MpLyBXpSs1qOGYtHzNhaQtWM
 odSZmDm/owjCgvALKZ1fVmlDQK2UuF3fUFEcsSwiwJ/4buytCtyWkRKtD
 Xn5u9YS2f7exLCsmmv/OhTLEewRd15dBdpZoSeaMp0ASDNhsHHDW/XJI/ 8=;
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
IronPort-SDR: AXvfoy1GKvF5EWF+qipTNAvtLi5Ojlwk3hvjW61Chc2iBK2wSVYIk4bkND3ZwgHk8YVZ1KAx/y
 4Gv1Ov4febkL8guriwFkeRebwFi23t/ID+cDZqPfH7P7cIEI6n9TTfeBit4Rxt6IxTAD1UlqrY
 N/EFCMmcVmmtr//R7SdK4JpEWWMW7lU/BQiTOjBPIvYPyc6Tfl1ojti/Zcsm7WNq676vjONWR9
 rxmBQh+cRNeh5/6zeX9x2nmMx8DXjDHd3q3UxjevdACONQpcVsm4AEurj8BBozBN+czcZGHZke
 OxM=
X-SBRS: 2.7
X-MesageID: 10340011
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,379,1571716800"; d="scan'208";a="10340011"
Date: Tue, 31 Dec 2019 16:11:07 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Message-ID: <20191231151107.GJ11756@Air-de-Roger>
References: <20191219094814.GB11756@Air-de-Roger>
 <CABfawhnVZmYOZb=wuc2TVDewH9nNtJBTBvJYUk-RDHLCGRVzPw@mail.gmail.com>
 <20191230175900.GF11756@Air-de-Roger>
 <CABfawhkiB=6zvTo6TBCE6y_-to65DFGDVRcqk7ANpSGdwwveFQ@mail.gmail.com>
 <3ff918fc-02a3-1413-4135-a378d65a19ab@xen.org>
 <CABfawh=Wvn16sWp8_MPy0kGAp-OhkCmug4nY272igyg+u4PKBw@mail.gmail.com>
 <CAF3u54B2+3q90jFftH+ZcuhdH6i8cOEpjiOjrVdNJCiBSzBtng@mail.gmail.com>
 <CABfawh=F8dsn4LLtdfYR4nb0djaswofEioDtqi2TKVJ0zCBK0Q@mail.gmail.com>
 <20191231104022.GG11756@Air-de-Roger>
 <CABfawh=tDFzsp61MmFxpmcBbNT2GXa4C=-eXD=044L1gdxPEpw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABfawh=tDFzsp61MmFxpmcBbNT2GXa4C=-eXD=044L1gdxPEpw@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v2 00/20] VM forking
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@gmail.com>,
 Alexandru
 Isaila <aisaila@bitdefender.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMzEsIDIwMTkgYXQgMDg6MDA6MTdBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IE9uIFR1ZSwgRGVjIDMxLCAyMDE5IGF0IDM6NDAgQU0gUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgRGVjIDMwLCAy
MDE5IGF0IDA1OjM3OjM4UE0gLTA3MDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+ID4gT24g
TW9uLCBEZWMgMzAsIDIwMTkgYXQgNToyMCBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBn
bWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gSGksCj4gPiA+ID4KPiA+ID4gPiBPbiBN
b24sIDMwIERlYyAyMDE5LCAyMDo0OSBUYW1hcyBLIExlbmd5ZWwsIDx0YW1hc0B0a2xlbmd5ZWwu
Y29tPiB3cm90ZToKPiA+ID4gPj4KPiA+ID4gPj4gT24gTW9uLCBEZWMgMzAsIDIwMTkgYXQgMTE6
NDMgQU0gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6Cj4gPiA+ID4+IEJ1dCBr
ZWVwIGluIG1pbmQgdGhhdCB0aGUgImZvcmstdm0iIGNvbW1hbmQgZXZlbiB3aXRoIHRoaXMgdXBk
YXRlCj4gPiA+ID4+IHdvdWxkIHN0aWxsIG5vdCBwcm9kdWNlIGZvciB5b3UgYSAiZnVsbHkgZnVu
Y3Rpb25hbCIgVk0gb24gaXRzIG93bi4KPiA+ID4gPj4gVGhlIHVzZXIgc3RpbGwgaGFzIHRvIHBy
b2R1Y2UgYSBuZXcgVk0gY29uZmlnIGZpbGUsIGNyZWF0ZSB0aGUgbmV3Cj4gPiA+ID4+IGRpc2ss
IHNhdmUgdGhlIFFFTVUgc3RhdGUsIGV0Yy4KPiA+Cj4gPiBJTU8gdGhlIGRlZmF1bHQgYmVoYXZp
b3Igb2YgdGhlIGZvcmsgY29tbWFuZCBzaG91bGQgYmUgdG8gbGVhdmUgdGhlCj4gPiBvcmlnaW5h
bCBWTSBwYXVzZWQsIHNvIHRoYXQgeW91IGNhbiBjb250aW51ZSB1c2luZyB0aGUgc2FtZSBkaXNr
IGFuZAo+ID4gbmV0d29yayBjb25maWcgaW4gdGhlIGZvcmsgYW5kIHlvdSB3b24ndCBuZWVkIHRv
IHBhc3MgYSBuZXcgY29uZmlnCj4gPiBmaWxlLgo+ID4KPiA+IEFzIEp1bGllbiBhbHJlYWR5IHNh
aWQsIG1heWJlIEkgd2Fzbid0IGNsZWFyIGluIG15IHByZXZpb3VzIHJlcGxpZXM6Cj4gPiBJJ20g
bm90IGFza2luZyB5b3UgdG8gaW1wbGVtZW50IGFsbCB0aGlzLCBpdCdzIGZpbmUgaWYgdGhlCj4g
PiBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgZm9yay12bSB4bCBjb21tYW5kIHJlcXVpcmVzIHlvdSB0
byBwYXNzIGNlcnRhaW4KPiA+IG9wdGlvbnMsIGFuZCB0aGF0IHRoZSBkZWZhdWx0IGJlaGF2aW9y
IGlzIG5vdCBpbXBsZW1lbnRlZC4KPiA+Cj4gPiBXZSBuZWVkIGFuIGludGVyZmFjZSB0aGF0J3Mg
c2FuZSwgYW5kIHRoYXQncyBkZXNpZ25lZCB0byBiZSBlYXN5IGFuZAo+ID4gY29tcHJlaGVuc2l2
ZSB0byB1c2UsIG5vdCBhbiBpbnRlcmZhY2UgYnVpbHQgYXJvdW5kIHdoYXQncyBjdXJyZW50bHkK
PiA+IGltcGxlbWVudGVkLgo+IAo+IE9LLCBzbyBJIHRoaW5rIHRoYXQgd291bGQgbG9vayBsaWtl
ICJ4bCBmb3JrLXZtIDxwYXJlbnRfZG9taWQ+IiB3aXRoCj4gYWRkaXRpb25hbCBvcHRpb25zIGZv
ciB0aGluZ3MgbGlrZSBuYW1lLCBkaXNrLCB2bGFuLCBvciBhIGNvbXBsZXRlbHkKPiBuZXcgY29u
ZmlnLCBhbGwgb2Ygd2hpY2ggYXJlIGN1cnJlbnRseSBub3QgaW1wbGVtZW50ZWQsICsgYW4KPiBh
ZGRpdGlvbmFsIG9wdGlvbiB0byBub3QgbGF1bmNoIFFFTVUgYXQgYWxsLCB3aGljaCB3b3VsZCBi
ZSB0aGUgb25seQo+IG9uZSBjdXJyZW50bHkgd29ya2luZy4gQWxzbyBrZWVwaW5nIHRoZSBzZXBh
cmF0ZSAieGwgZm9yay1sYXVuY2gtZG0iCj4gYXMgaXMuIElzIHRoYXQgd2hhdCB3ZSBhcmUgdGFs
a2luZyBhYm91dD8KCkkgdGhpbmsgZm9yay1sYXVuY2gtdm0gc2hvdWxkIGp1c3QgYmUgYW4gb3B0
aW9uIG9mIGZvcmstdm0gKGllOgotLWxhdW5jaC1kbS1vbmx5IG9yIHNvbWUgc3VjaCkuIEkgZG9u
J3QgdGhpbmsgdGhlcmUncyBhIHJlYXNvbiB0byBoYXZlCmEgc2VwYXJhdGUgdG9wLWxldmVsIGNv
bW1hbmQgdG8ganVzdCBsYXVuY2ggdGhlIGRldmljZSBtb2RlbC4KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
