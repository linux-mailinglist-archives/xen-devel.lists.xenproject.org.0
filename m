Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD121A5B8
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2019 02:14:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hPFcQ-0000oa-1e; Sat, 11 May 2019 00:12:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C3x+=TL=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hPFcP-0000oV-Bl
 for xen-devel@lists.xenproject.org; Sat, 11 May 2019 00:12:01 +0000
X-Inumbo-ID: 64120a5e-7381-11e9-a5c0-a333e29c9d01
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64120a5e-7381-11e9-a5c0-a333e29c9d01;
 Sat, 11 May 2019 00:11:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 May 2019 17:11:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,454,1549958400"; d="scan'208";a="170488289"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga002.fm.intel.com with ESMTP; 10 May 2019 17:11:57 -0700
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 10 May 2019 17:11:57 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 10 May 2019 17:11:57 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.33]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.70]) with mapi id 14.03.0415.000;
 Sat, 11 May 2019 08:11:55 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2 07/12] x86/IRQ: fix locking around
 vector management
Thread-Index: AQHVBZ/ZOnq2lkspgUK3207eAhMqKqZgryKAgARgZTA=
Date: Sat, 11 May 2019 00:11:55 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19CA2A30C@SHSMSX104.ccr.corp.intel.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
 <5CD2D563020000780022CD40@prv1-mh.provo.novell.com>
 <5CD2D6AD020000780022CDAC@prv1-mh.provo.novell.com>
In-Reply-To: <5CD2D6AD020000780022CDAC@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTY0NTUyNzEtMjA3NC00MTczLWE5ODAtZDhjNWVkM2FkYzYwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoicjNFcGNJZXFZWlB5OHV4U0lNc3lEem9CY1dzVURONitRVjU5ZU5sZzdKbnFRRnRVZld0VVViUTRRRktPNHNrciJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 07/12] x86/IRQ: fix locking around vector
 management
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFdl
ZG5lc2RheSwgTWF5IDgsIDIwMTkgOToxNiBQTQo+IAo+ID4+PiBPbiAwOC4wNS4xOSBhdCAxNTox
MCwgPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPiA+IEFsbCBvZiBfX3thc3NpZ24sYmluZCxj
bGVhcn1faXJxX3ZlY3RvcigpIG1hbmlwdWxhdGUgc3RydWN0IGlycV9kZXNjCj4gPiBmaWVsZHMs
IGFuZCBoZW5jZSBvdWdodCB0byBiZSBjYWxsZWQgd2l0aCB0aGUgZGVzY3JpcHRvciBsb2NrIGhl
bGQgaW4KPiA+IGFkZGl0aW9uIHRvIHZlY3Rvcl9sb2NrLiBUaGlzIGlzIGN1cnJlbnRseSB0aGUg
Y2FzZSBmb3Igb25seQo+ID4gc2V0X2Rlc2NfYWZmaW5pdHkoKSAoaW4gdGhlIGNvbW1vbiBjYXNl
KSBhbmQgZGVzdHJveV9pcnEoKSwgd2hpY2ggYWxzbwo+ID4gY2xhcmlmaWVzIHdoYXQgdGhlIG5l
c3RpbmcgYmVoYXZpb3IgYmV0d2VlbiB0aGUgbG9ja3MgaGFzIHRvIGJlLgo+ID4gUmVmbGVjdCB0
aGUgbmV3IGV4cGVjdGF0aW9uIGJ5IGhhdmluZyB0aGVzZSBmdW5jdGlvbnMgYWxsIHRha2UgYQo+
ID4gZGVzY3JpcHRvciBhcyBwYXJhbWV0ZXIgaW5zdGVhZCBvZiBhbiBpbnRlcnJ1cHQgbnVtYmVy
Lgo+ID4KPiA+IEFsc28gdGFrZSBjYXJlIG9mIHRoZSB0d28gc3BlY2lhbCBjYXNlcyBvZiBjYWxs
cyB0byBzZXRfZGVzY19hZmZpbml0eSgpOgo+ID4gc2V0X2lvYXBpY19hZmZpbml0eV9pcnEoKSBh
bmQgVlQtZCdzIGRtYV9tc2lfc2V0X2FmZmluaXR5KCkgZ2V0IGNhbGxlZAo+ID4gZGlyZWN0bHkg
YXMgd2VsbCwgYW5kIGluIHRoZXNlIGNhc2VzIHRoZSBkZXNjcmlwdG9yIGxvY2tzIGhhZG4ndCBn
b3QKPiA+IGFjcXVpcmVkIHRpbGwgbm93LiBGb3Igc2V0X2lvYXBpY19hZmZpbml0eV9pcnEoKSB0
aGlzIG1lYW5zIGFjcXVpcmluZyAvCj4gPiByZWxlYXNpbmcgb2YgdGhlIElPLUFQSUMgbG9jayBj
YW4gYmUgcGxhaW4gc3Bpbl97LHVufWxvY2soKSB0aGVuLgo+ID4KPiA+IERyb3Agb25lIG9mIHRo
ZSB0d28gbGVhZGluZyB1bmRlcnNjb3JlcyBmcm9tIGFsbCB0aHJlZSBmdW5jdGlvbnMgYXQKPiA+
IHRoZSBzYW1lIHRpbWUuCj4gPgo+ID4gVGhlcmUncyBvbmUgY2FzZSBsZWZ0IHdoZXJlIGRlc2Ny
aXB0b3JzIGdldCBtYW5pcHVsYXRlZCB3aXRoIGp1c3QKPiA+IHZlY3Rvcl9sb2NrIGhlbGQ6IHNl
dHVwX3ZlY3Rvcl9pcnEoKSBhc3N1bWVzIGl0cyBjYWxsZXIgdG8gYWNxdWlyZQo+ID4gdmVjdG9y
X2xvY2ssIGFuZCBoZW5jZSBjYW4ndCBpdHNlbGYgYWNxdWlyZSB0aGUgZGVzY3JpcHRvciBsb2Nr
cyAod3JvbmcKPiA+IGxvY2sgb3JkZXIpLiBJIGRvbid0IGN1cnJlbnRseSBzZWUgaG93IHRvIGFk
ZHJlc3MgdGhpcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4gPiAtLS0KPiA+IHYyOiBBbHNvIGFkanVzdCBzZXRfaW9hcGljX2FmZmluaXR5
X2lycSgpIGFuZCBWVC1kJ3MKPiA+ICAgICBkbWFfbXNpX3NldF9hZmZpbml0eSgpLgo+IAo+IEkn
bSBzb3JyeSwgS2V2aW4sIEkgc2hvdWxkIGhhdmUgQ2MtZWQgeW91IG9uIHRoaXMgb25lLgoKUmV2
aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPiBmb3IgdnRkIHBhcnQu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
