Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 127051501FA
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 08:26:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyW5h-0005bd-D5; Mon, 03 Feb 2020 07:24:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l9SF=3X=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iyW5f-0005bY-J7
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 07:24:15 +0000
X-Inumbo-ID: 2cb9178e-4656-11ea-8e32-12813bfff9fa
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2cb9178e-4656-11ea-8e32-12813bfff9fa;
 Mon, 03 Feb 2020 07:24:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Feb 2020 23:24:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,396,1574150400"; d="scan'208";a="263322864"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2020 23:24:11 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 2 Feb 2020 23:24:10 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 2 Feb 2020 23:24:07 -0800
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 2 Feb 2020 23:24:07 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.196]) with mapi id 14.03.0439.000;
 Mon, 3 Feb 2020 15:24:05 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Thread-Topic: [PATCH 1/2] nvmx: fix handling of interrupts
Thread-Index: AQHVxg/fbkeODa2AbkWncPoKamSpJafxcYCggAFyWwCAAZn1sIADQiQAgBFcS5A=
Date: Mon, 3 Feb 2020 07:24:04 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D75F802@SHSMSX104.ccr.corp.intel.com>
References: <20200108103857.77236-1-roger.pau@citrix.com>
 <20200108103857.77236-2-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D739C38@SHSMSX104.ccr.corp.intel.com>
 <20200120101906.GW11756@Air-de-Roger>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D73E81C@SHSMSX104.ccr.corp.intel.com>
 <20200123123154.GC57924@desktop-tdan49n.eng.citrite.net>
In-Reply-To: <20200123123154.GC57924@desktop-tdan49n.eng.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYmRkYWVjMDMtOTFkYS00NTk2LTg1NzctNjQ2MGIzMDdlNGFjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTFQ5b1ZtZWUxbUZKU2l0NkwrQnRyUjgwaDc2S0NyQytaVlA3WlR1eFpGWnNjYkVadE80ajROZWJYWTUycWtpQyJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/2] nvmx: fix handling of interrupts
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
 Wei Liu <wl@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBTZW50OiBU
aHVyc2RheSwgSmFudWFyeSAyMywgMjAyMCA4OjMyIFBNCj4gCj4gT24gVHVlLCBKYW4gMjEsIDIw
MjAgYXQgMDM6MzQ6MTNBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3JvdGU6Cj4gPiA+IEZyb206IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4gPiBTZW50OiBNb25kYXks
IEphbnVhcnkgMjAsIDIwMjAgNjoxOSBQTQo+ID4gPgo+ID4gPiBPbiBTdW4sIEphbiAxOSwgMjAy
MCBhdCAwNDoxNTowNEFNICswMDAwLCBUaWFuLCBLZXZpbiB3cm90ZToKPiA+ID4gPiA+IEZyb206
IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+ID4gPiBTZW50OiBX
ZWRuZXNkYXksIEphbnVhcnkgOCwgMjAyMCA2OjM5IFBNCj4gPiA+ID4gPgo+ID4gPiA+ID4gV2hl
biBkb2luZyBhIHZpcnR1YWwgdm1leGl0IChpZTogYSB2bWV4aXQgaGFuZGxlZCBieSB0aGUgTDEg
Vk1NKQo+ID4gPiA+ID4gaW50ZXJydXB0cyBzaG91bGRuJ3QgYmUgaW5qZWN0ZWQgdXNpbmcgdGhl
IHZpcnR1YWwgaW50ZXJydXB0IGRlbGl2ZXJ5Cj4gPiA+ID4gPiBtZWNoYW5pc20sIGFuZCBpbnN0
ZWFkIHNob3VsZCBiZSBzaWduYWxlZCBpbiB0aGUgdm1jcyB1c2luZyB0aGUgZXhpdAo+ID4gPiA+
ID4gcmVhc29uIGFuZCB0aGUgaW50ZXJydXB0aW9uLWluZm9ybWF0aW9uIGZpZWxkIGlmIHRoZSAi
QWNrbm93bGVkZ2UKPiA+ID4gPiA+IGludGVycnVwdCBvbiBleGl0IiB2bWV4aXQgY29udHJvbCBp
cyBzZXQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gUmVtb3ZlIHRoZSBudm14X3VwZGF0ZV9hcGljdiBo
ZWxwZXI6IGl0J3MgYm9ndXMgdG8gYXR0ZW1wdCB0byBpbmplY3QKPiA+ID4gPiA+IGludGVycnVw
dHMgb24gdmlydHVhbCB2bWV4aXQgdXNpbmcgdGhlIHZpcnR1YWwgaW50ZXJydXB0IGRlbGl2ZXJ5
Cj4gPiA+ID4gPiBhc3Npc3RhbmNlLCBhbmQgaXQncyBhbHNvIGJvZ3VzIHRvIGFjayBpbnRlcnJ1
cHRzIHdpdGhvdXQgY2hlY2tpbmcgaWYKPiA+ID4gPiA+IHRoZSB2bWV4aXQgIkFja25vd2xlZGdl
IGludGVycnVwdCBvbiBleGl0IiB2bWV4aXQgY29udHJvbCBpcyBzZXQuCj4gPiA+ID4gPiBudm14
X2ludHJfaW50ZXJjZXB0IGFscmVhZHkgaGFuZGxlcyBpbnRlcnJ1cHRzIGNvcnJlY3RseSBvbiB2
aXJ0dWFsCj4gPiA+ID4gPiB2bWV4aXQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gTm90ZSB0aGF0IHRo
aXMgZml4ZXMgdGhlIHVzYWdlIG9mIHgyQVBJQyBieSB0aGUgTDEgVk1NLCBhdCBsZWFzdCB3aGVu
Cj4gPiA+ID4gPiB0aGUgTDEgVk1NIGlzIFhlbi4KPiA+ID4gPgo+ID4gPiA+IHdoaWxlIHRoaXMg
Zml4IG1ha2VzIHNlbnNlIHRvIG1lLCBjYW4geW91IGFsc28gdGVzdCBvdGhlciBMMSBWTU1zLAo+
ID4gPiA+IHNvIHdlIGRvbid0IG92ZXJsb29rIHNvbWUgb3RoZXIgaW50ZW50aW9ucyBjb3ZlcmVk
IG9yIGhpZGRlbiBieQo+ID4gPiA+IHJlbW92ZWQgbG9naWM/Cj4gPiA+Cj4gPiA+IEkgY291bGQg
dGVzdCBvdGhlciBoeXBlcnZpc29ycywgYnV0IGRvIHdlIHJlYWxseSBleHBlY3QgYW55dGhpbmcK
PiA+ID4gdGhhdCdzIG5vdCBYZW4gb24gWGVuIHRvIHdvcms/Cj4gPiA+Cj4gPiA+IEknbSBhc2tp
bmcgYmVjYXVzZSB0aGF0J3MgdGhlIG9ubHkgY29tYmluYXRpb24gdGhhdCdzIGFjdHVhbGx5IHRl
c3RlZAo+ID4gPiBieSBvc3N0ZXN0Lgo+ID4gPgo+ID4gPiBUaGFua3MsIFJvZ2VyLgo+ID4KPiA+
IElmIG90aGVycyBhcmUgT0sgd2l0aCB5b3VyIGFzc3VtcHRpb24sIHRoZW4gaXQncyBmaW5lLiBJ
IGRpZG4ndCB0aWdodGx5Cj4gPiBmb2xsb3cgdGhlIG5lc3RlZCB2aXJ0dWFsaXphdGlvbiByZXF1
aXJlbWVudHMgaW4gWGVuLgo+ID4KPiA+IE9uIHRoZSBvdGhlciBoYW5kLCBJIHRoaW5rIHRoaXMg
cGF0Y2ggbmVlZHMgYSByZXZpc2lvbi4gSXQgaXMgbm90IGJvZ3VzCj4gPiB0byB1c2UgdmlydHVh
bCBpbnRlcnJ1cHQgZGVsaXZlcnkgb24gdmlydHVhbCBWTWV4aXQsIGlmICJBY2sgaW50ZXJydXB0
Cj4gPiBvbiBleGl0IiBpcyBvZmYuIEluIHN1Y2ggY2FzZSwgdGhlIGRlbGl2ZXJ5IGRvZXNuJ3Qg
aGFwcGVuIHVudGlsIEwxCj4gPiBoeXBlcnZpc29yIGVuYWJsZXMgaW50ZXJydXB0IHRvIGNsZWFy
IGludGVycnVwdCB3aW5kb3cuIFRoZW4gaXQgZG9lcwo+ID4gc2F2ZSBvbmUgZXhpdC4gVGhlIG9u
bHkgYm9ndXMgcG9pbnQgaXMgdGhhdCBudm14X3VkcGF0ZV9hcGljdiBkb2Vzbid0Cj4gPiBjaGVj
ayAiQWNrIGludGVycnVwdCBvbiBleGl0Ii4gU28gSSBwcmVmZXIgdG8gYWRkIHN1Y2ggY2hlY2sg
dGhlcmUKPiA+IGluc3RlYWQgb2YgY29tcGxldGVseSByZW1vdmluZyB0aGlzIG9wdGltaXphdGlv
bi4KPiAKPiBJIHdlbnQgYmFjayBvdmVyIHRoaXMsIGFuZCBJJ20gc3RpbGwgbm90IHN1cmUgY2Fs
bGluZwo+IG52bXhfdXBkYXRlX2FwaWN2IGlzIGFjdHVhbGx5IHJlcXVpcmVkOiBBRkFJQ1Qgdm14
X2ludHJfYXNzaXN0IHdpbGwKPiBhbHJlYWR5IGluamVjdCB0aGUgaW50ZXJydXB0IGNvcnJlY3Rs
eSB1c2luZyB2aXJ0dWFsIGludGVycnVwdAo+IGRlbGl2ZXJ5IGlmIGxlZnQgcGVuZGluZyBvbiB0
aGUgdmxhcGljLiBJIGd1ZXNzIHRoZSBjb2RlIGluCj4gbnZteF91cGRhdGVfYXBpY3YgZG9lc24n
dCBodXJ0IGFzIGxvbmcgYXMgaXQncyBnYXRlZCBvbiAiQWNrIG9uIGV4aXQiCj4gbm90IGJlaW5n
IGVuYWJsZWQsIGJ1dCBpdCdzIGxpa2VseSByZWR1bmRhbnQuCgpJdCdzIG5vdCByZWR1bmRhbnQu
IElmIHlvdSBsb29rIGF0IHRoZSBjb2RlIHNlcXVlbmNlLCB2bXhfaW50cl9hc3Npc3QKaXMgaW52
b2tlZCBiZWZvcmUgbnZteF9zd2l0Y2hfZ3Vlc3QuIEF0IHRoYXQgdGltZSwgdGhlIEwxIHZDUFUg
aXMgc3RpbGwKaW4gbmVzdGVkIGd1ZXN0IG1vZGUsIHRoZXJlYnkgbnZteF9pbnRyX2ludGVyY2Vw
dCB0YWtlcyBlZmZlY3Qgd2hpY2gKaW5qZWN0cyB0aGUgcGVuZGluZyB2ZWN0b3IgaW50byB2bWNz
MDIgYW5kIGJ5cGFzc2VzIHRoZSByZW1haW5pbmcKdmlydHVhbCBpbnRlcnJ1cHQgZGVsaXZlcnkg
bG9naWMgZm9yIHZtY3MwMS4gVGhhdCBpcyB0aGUgbWFpbiByZWFzb24sIGltbywKd2h5IG52bXhf
dXBkYXRlX2FwaWN2IGlzIGludHJvZHVjZWQuCgppaXVjLCBudm14X2ludHJfaW50ZXJjZXB0IGFu
ZCBudm14X3VwZGF0ZV9hcGljdiB3b3JrIHRvZ2V0aGVyIHRvCmNvbXBsZXRlIG5lc3RlZCBpbnRl
cnJ1cHQgaW5qZWN0aW9uOgoKKDEpIElmICJBY2sgaW50ZXJydXB0IG9uIGV4aXQiIGlzIG9uLCB0
aGUgcGVuZGluZyB2ZWN0b3IgaXMgYWNrZWQgYnkgCnRoZSBmb3JtZXIgYW5kIGRlbGl2ZXJlZCBp
biB2dm1leGl0IGluZm9ybWF0aW9uIGZpZWxkLgooMikgSWYgIkFjayBpbnRlcnJ1cHQgb24gZXhp
dCIgaXMgb2ZmIGFuZCBubyB2aXJ0dWFsIGludGVycnVwdCBkZWxpdmVyeSwgCm5vIGFjayBhbmQg
aW50ZXJydXB0IHdpbmRvdyBpcyBlbmFibGVkIGJ5IHRoZSBmb3JtZXIuCigzKSBPdGhlcndpc2Us
IHRoZSB2ZWN0b3IgaXMgYWNrZWQgYnkgdGhlIGxhdHRlciBhbmQgZGVsaXZlcmVkIHRocm91Z2gK
dmlydHVhbCBpbnRlcnJ1cHQgZGVsaXZlcnkgKHdoZXJlIHZtY3MwMSBoYXMgYmVlbiBzd2l0Y2hl
ZCBpbikuIAoKSG93ZXZlciwgdGhlcmUgYXJlIHR3byBpc3N1ZXMgaW4gY3VycmVudCBjb2RlLiBP
bmUgaXMgYWJvdXQgKDMpLCBpLmUuLAphcyB5b3UgaWRlbnRpZmllZCBudm14X3VwZGF0ZV9hcGlj
diBzaG91bGRuJ3QgYmxpbmRseSBlbmFibGUgdGhlCm9wdGltaXphdGlvbiB3aXRob3V0IGNoZWNr
aW5nIHRoZSBBY2sgc2V0dGluZy4gdGhlIG90aGVyIGlzIG5ldyAKYWJvdXQgKDIpIC0gY3VycmVu
dGx5IG52bXhfaW50cl9pbnRlcnJ1cHQgYWx3YXlzIGVuYWJsZXMgaW50ZXJydXB0IAp3aW5kb3cg
d2hlbiB0aGUgQWNrIHNldHRpbmcgaXMgb2ZmLCB3aGljaCBhY3R1YWxseSBuZWdhdGVzIHRoZSAK
b3B0aW1pemF0aW9uIG9mIG52bXhfdXBkYXRlX2FwaWN2LiBCb3RoIHNob3VsZCBiZSBmaXhlZC4K
Cj4gCj4gSSB3aWxsIHNlbmQgYW4gdXBkYXRlZCBwYXRjaCBhbnl3YXksIHNpbmNlIEkgd291bGQg
bGlrZSB0byBnZXQgdGhpcwo+IHNvcnRlZCBvdXQgc29vbmVyIHJhdGhlciB0aGFuIGxhdGVyIGFu
ZCB3aWxsIGZvbGxvdyB5b3VyIGFkdmlzZSBvZgo+IGxlYXZpbmcgbnZteF91cGRhdGVfYXBpY3Yg
aW4gcGxhY2UgZ2F0ZWQgYnkgYSBjaGVjayBvZiB3aGV0aGVyICJBY2sgb24KPiBleGl0IiBpcyBu
b3QgZW5hYmxlZC4KPiAKPiBUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
