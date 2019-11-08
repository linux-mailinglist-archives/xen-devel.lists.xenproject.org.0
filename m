Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5588AF3E12
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 03:27:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iStxa-0004LO-Ah; Fri, 08 Nov 2019 02:25:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ubwe=ZA=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iStxZ-0004LJ-6D
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 02:25:13 +0000
X-Inumbo-ID: fc668c72-01ce-11ea-a1cd-12813bfff9fa
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc668c72-01ce-11ea-a1cd-12813bfff9fa;
 Fri, 08 Nov 2019 02:25:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 18:25:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,280,1569308400"; d="scan'208";a="193028391"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga007.jf.intel.com with ESMTP; 07 Nov 2019 18:25:08 -0800
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 7 Nov 2019 18:25:08 -0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 7 Nov 2019 18:25:08 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.127]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.149]) with mapi id 14.03.0439.000;
 Fri, 8 Nov 2019 10:25:06 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v2] x86/passthrough: fix migration of MSI
 when using posted interrupts
Thread-Index: AQHVfqCENihm8ppmBU2310r9hCcUQqdx7EAAgACHRgCAAIn4AIAADI+AgAAKwoCAAOqsgIAAcsKAgAAIkwCAAylPMIACwf+AgAZSu0A=
Date: Fri, 8 Nov 2019 02:25:05 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D5E9FBF@SHSMSX104.ccr.corp.intel.com>
References: <20191009125252.3112-1-roger.pau@citrix.com>
 <c42e0852-2eb5-63e8-f542-b4f5d4a1e0a8@oracle.com>
 <20191030082428.GW17494@Air-de-Roger>
 <7cd007b2-8980-bac3-cd5c-812dcf2c1c61@oracle.com>
 <20191030172313.GX17494@Air-de-Roger>
 <35c7a91d-1c46-e99e-5f9c-60d9e17721bf@oracle.com>
 <83625673-5e84-20ba-b7bf-e3e527eecbc0@suse.com>
 <b61f1b50-c050-2482-527e-f7740058b5f9@oracle.com>
 <20191031152304.GY17494@Air-de-Roger>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D5E24A7@SHSMSX104.ccr.corp.intel.com>
 <20191104094633.GZ17494@Air-de-Roger>
In-Reply-To: <20191104094633.GZ17494@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMWM4MWY4MDctY2ZiZS00NjZjLTgxOTktZTAwNDA4MmQzZGY4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiaFlzY2JLV2tINVYxWjdTaXUxMkFOMjc1VjFLZlJ0eExsZnoxclVreG9CbDl2YVB0eDBqeTFmbXZxeXZVdm42RCJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] x86/passthrough: fix migration of MSI
 when using posted interrupts
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIFttYWlsdG86cm9nZXIucGF1QGNpdHJpeC5jb21dCj4g
U2VudDogTW9uZGF5LCBOb3ZlbWJlciA0LCAyMDE5IDU6NDcgUE0KPiAKPiBPbiBTYXQsIE5vdiAw
MiwgMjAxOSBhdCAwNzo0ODowNkFNICswMDAwLCBUaWFuLCBLZXZpbiB3cm90ZToKPiA+ID4gRnJv
bTogUm9nZXIgUGF1IE1vbm7DqSBbbWFpbHRvOnJvZ2VyLnBhdUBjaXRyaXguY29tXQo+ID4gPiBT
ZW50OiBUaHVyc2RheSwgT2N0b2JlciAzMSwgMjAxOSAxMToyMyBQTQo+ID4gPgo+ID4gPiBPbiBU
aHUsIE9jdCAzMSwgMjAxOSBhdCAwNzo1MjoyM0FNIC0wNzAwLCBKb2UgSmluIHdyb3RlOgo+ID4g
PiA+IE9uIDEwLzMxLzE5IDE6MDEgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPiA+ID4gT24g
MzAuMTAuMjAxOSAxOTowMSwgSm9lIEppbiB3cm90ZToKPiA+ID4gPiA+PiBPbiAxMC8zMC8xOSAx
MDoyMyBBTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gPiA+Pj4gT24gV2VkLCBPY3Qg
MzAsIDIwMTkgYXQgMDk6Mzg6MTZBTSAtMDcwMCwgSm9lIEppbiB3cm90ZToKPiA+ID4gPiA+Pj4+
IE9uIDEwLzMwLzE5IDE6MjQgQU0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiA+ID4gPj4+
Pj4gQ2FuIHlvdSB0cnkgdG8gYWRkIHRoZSBmb2xsb3dpbmcgZGVidWcgcGF0Y2ggb24gdG9wIG9m
IHRoZQo+IGV4aXN0aW5nCj4gPiA+ID4gPj4+Pj4gb25lIGFuZCByZXBvcnQgdGhlIG91dHB1dCB0
aGF0IHlvdSBnZXQgb24gdGhlIFhlbiBjb25zb2xlPwo+ID4gPiA+ID4+Pj4KPiA+ID4gPiA+Pj4+
IEFwcGxpZWQgZGVidWcgcGF0Y2ggYW5kIHJ1biB0aGUgdGVzdCBhZ2Fpbiwgbm90IG9mIGFueSBs
b2cKPiBwcmludGVkLAo+ID4gPiA+ID4+Pj4gYXR0YWNoZWQgWGVuIGxvZyBvbiBzZXJpYWwgY29u
c29sZSwgc2VlbXMgcGlfdXBkYXRlX2lydGUoKSBub3QKPiBiZWVuCj4gPiA+ID4gPj4+PiBjYWxs
ZWQgZm9yIGlvbW11X2ludHBvc3Qgd2FzIGZhbHNlLgo+ID4gPiA+ID4+Pgo+ID4gPiA+ID4+PiBJ
IGhhdmUgdG8gYWRtaXQgSSdtIGxvc3QgYXQgdGhpcyBwb2ludC4gRG9lcyBpdCBtZWFuIHRoZSBv
cmlnaW5hbAo+ID4gPiA+ID4+PiBpc3N1ZSBoYWQgbm90aGluZyB0byBkbyB3aXRoIHBvc3RlZCBp
bnRlcnJ1cHRzPwo+ID4gPiA+ID4+Cj4gPiA+ID4gPj4gTG9va3Mgd2hlbiBpbmplY3QgaXJxIGJ5
IHZsYXBpY19zZXRfaXJxKCksIGl0IGNoZWNrZWQgYnkKPiA+ID4gPiA+PiBodm1fZnVuY3MuZGVs
aXZlcl9wb3N0ZWRfaW50ciByYXRoZXIgdGhhbiBpb21tdV9pbnRwb3N0Ogo+ID4gPiA+ID4+Cj4g
PiA+ID4gPj4gIDE3NiAgICAgaWYgKCBodm1fZnVuY3MuZGVsaXZlcl9wb3N0ZWRfaW50ciApCj4g
PiA+ID4gPj4gIDE3NyAgICAgICAgIGh2bV9mdW5jcy5kZWxpdmVyX3Bvc3RlZF9pbnRyKHRhcmdl
dCwgdmVjKTsKPiA+ID4gPiA+Pgo+ID4gPiA+ID4+IEFuZCBkZWxpdmVyX3Bvc3RlZF9pbnRyKCkg
d291bGQgYmUgdGhlcmUsIHdoZW4gdm14IGVuYWJsZWQ6Cj4gPiA+ID4gPj4KPiA+ID4gPiA+PiAo
WEVOKSBIVk06IFZNWCBlbmFibGVkCj4gPiA+ID4gPj4gKFhFTikgSFZNOiBIYXJkd2FyZSBBc3Np
c3RlZCBQYWdpbmcgKEhBUCkgZGV0ZWN0ZWQKPiA+ID4gPiA+PiAoWEVOKSBIVk06IEhBUCBwYWdl
IHNpemVzOiA0a0IsIDJNQiwgMUdCCj4gPiA+ID4gPgo+ID4gPiA+ID4gSSBjYW4ndCBzZWUgdGhl
IGNvbm5lY3Rpb24uIHN0YXJ0X3ZteCgpIGhhcwo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICBpZiAo
IGNwdV9oYXNfdm14X3Bvc3RlZF9pbnRyX3Byb2Nlc3NpbmcgKQo+ID4gPiA+ID4gICAgIHsKPiA+
ID4gPiA+ICAgICAgICAgYWxsb2NfZGlyZWN0X2FwaWNfdmVjdG9yKCZwb3N0ZWRfaW50cl92ZWN0
b3IsCj4gPiA+IHBpX25vdGlmaWNhdGlvbl9pbnRlcnJ1cHQpOwo+ID4gPiA+ID4gICAgICAgICBp
ZiAoIGlvbW11X2ludHBvc3QgKQo+ID4gPiA+ID4gICAgICAgICAgICAgYWxsb2NfZGlyZWN0X2Fw
aWNfdmVjdG9yKCZwaV93YWtldXBfdmVjdG9yLAo+ID4gPiBwaV93YWtldXBfaW50ZXJydXB0KTsK
PiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAgICAgIHZteF9mdW5jdGlvbl90YWJsZS5kZWxpdmVyX3Bv
c3RlZF9pbnRyID0KPiB2bXhfZGVsaXZlcl9wb3N0ZWRfaW50cjsKPiA+ID4gPiA+ICAgICAgICAg
dm14X2Z1bmN0aW9uX3RhYmxlLnN5bmNfcGlyX3RvX2lyciAgICAgPSB2bXhfc3luY19waXJfdG9f
aXJyOwo+ID4gPiA+ID4gICAgICAgICB2bXhfZnVuY3Rpb25fdGFibGUudGVzdF9waXIgICAgICAg
ICAgICA9IHZteF90ZXN0X3BpcjsKPiA+ID4gPiA+ICAgICB9Cj4gPiA+ID4gPgo+ID4gPiA+ID4g
aS5lLiB0aGUgaG9vayBpcyBwcmVzZW50IG9ubHkgd2hlbiBwb3N0ZWQgaW50ZXJydXB0cyBhcmUK
PiA+ID4gPiA+IGF2YWlsYWJsZSBpbiBnZW5lcmFsLiBJLmUuIGFsc28gd2l0aCBqdXN0IENQVS1z
aWRlIHBvc3RlZAo+ID4gPiA+ID4gaW50ZXJydXB0cywgeWVzLCB3aGljaCBnZXRzIGNvbmZpcm1l
ZCBieSB5b3VyICJhcGljdj0wIgo+ID4gPiA+ID4gdGVzdC4gWWV0IHdpdGgganVzdCBDUFUtc2lk
ZSBwb3N0ZWQgaW50ZXJydXB0cyBJJ20KPiA+ID4gPiA+IHN0cnVnZ2xpbmcgYWdhaW4gdG8gdW5k
ZXJzdGFuZCB5b3VyIG9yaWdpbmFsIHByb2JsZW0KPiA+ID4gPiA+IGRlc2NyaXB0aW9uLCBhbmQg
dGhlIG5lZWQgdG8gZmlkZGxlIHdpdGggSU9NTVUgc2lkZSBjb2RlLgo+ID4gPiA+Cj4gPiA+ID4g
WWVzLCBvbiBteSB0ZXN0IGVudiwgY3B1X2hhc192bXhfcG9zdGVkX2ludHJfcHJvY2Vzc2luZyA9
PSB0cnVlICYmCj4gPiA+IGlvbW11X2ludHBvc3QgPT0gZmFsc2UsCj4gPiA+ID4gd2l0aCB0aGlz
LCBwb3N0ZWQgaW50ZXJydXB0cyBiZWVuIGVuYWJsZWQuCj4gPiA+Cj4gPiA+IEknbSBzdGlsbCBx
dWl0ZSBsb3N0LiBNeSByZWFkaW5nIG9mIHRoZSBJbnRlbCBWVC1kIHNwZWMgaXMgdGhhdCB0aGUK
PiA+ID4gcG9zdGVkIGludGVycnVwdCBkZXNjcmlwdG9yICh3aGljaCBjb250YWlucyB0aGUgUElS
UikgaXMgdXNlZCBpbgo+ID4gPiBjb25qdW5jdGlvbiB3aXRoIGEgcG9zdGVkIGludGVycnVwdCBy
ZW1hcHBpbmcgZW50cnkgaW4gdGhlIGlvbW11LCBzbwo+ID4gPiB0aGF0IGludGVycnVwdHMgZ2V0
IHJlY29yZGVkIGluIHRoZSBQSVJSIGFuZCBsYXRlciBzeW5jZWQgYnkgdGhlCj4gPiA+IGh5cGVy
dmlzb3IgaW50byB0aGUgdmxhcGljIElSUiB3aGVuIHJlc3VtaW5nIHRoZSB2aXJ0dWFsIENQVS4K
PiA+Cj4gPiB0aGVyZSBhcmUgdHdvIHBhcnRzLiBJbnRlbCBmaXJzdCBpbXBsZW1lbnRzIENQVSBw
b3N0ZWQgaW50ZXJydXB0LAo+ID4gd2hpY2ggYWxsb3dzIG9uZSBDUFUgdG8gcG9zdCBJUEkgaW50
byBub24tcm9vdCBjb250ZXh0IGluIGFub3RoZXIKPiA+IENQVSB0aHJvdWdoIHBvc3RlZCBpbnRl
cnJ1cHQgZGVzY3JpcHRvci4gTGF0ZXIgVlQtZCBwb3N0ZWQKPiA+IGludGVycnVwdCBjb21lcywg
d2hpY2ggdXNlIGludGVycnVwdCByZW1hcHBpbmcgZW50cnkgYW5kIHRoZQo+ID4gc2FtZSBwb3N0
ZWQgaW50ZXJydXB0IGRlc2NyaXB0b3IgKHVzaW5nIG1vcmUgZmllbGRzKSB0byBjb252ZXJ0Cj4g
PiBhIGRldmljZSBpbnRlcnJ1cHQgaW50byBhIHBvc3RlZCBpbnRlcnJ1cHQuIFRoZSBwb3N0aW5n
IHByb2Nlc3MgaXMKPiA+IHNhbWUgb24gdGhlIGRlc3QgQ1BVLCByZWdhcmRsZXNzIG9mIHdoZXRo
ZXIgaXQncyBmcm9tIGFub3RoZXIgQ1BVCj4gPiBvciBhIGRldmljZS4KPiAKPiBUaGFua3MgZm9y
IHRoZSBkZXNjcmlwdGlvbi4KPiAKPiBTbyB0aGUgcHJvYmxlbSByZXBvcnRlZCBieSBKaW4gaGFw
cGVucyB3aGVuIHVzaW5nIENQVSBwb3N0ZWQKPiBpbnRlcnJ1cHRzIGJ1dCBub3QgVlQtZCBwb3N0
ZWQgaW50ZXJydXB0cywgaW4gd2hpY2ggY2FzZSB0aGVyZQo+IHNob3VsZG4ndCBiZSBhIG5lZWQg
dG8gc3luYyBQSVJSIHdpdGggSVJSIHdoZW4gaW50ZXJydXB0cyBmcm9tIGEKPiBwYXNzdGhyb3Vn
aCBkZXZpY2UgYXJlIHJlY29uZmlndXJlZCwgYmVjYXVzZSBpbnRlcnJ1cHRzIGZyb20gdGhhdAo+
IGRldmljZSBzaG91bGRuJ3QgZW5kIHVwIHNpZ25hbGVkIGluIFBJUlIgYmVjYXVzZSBWVC1kIHBv
c3RlZAo+IGludGVycnVwdHMgaXMgbm90IGJlaW5nIHVzZWQuCj4gCj4gRG8gaW50ZXJydXB0cyBm
cm9tIHBhc3N0aHJvdWdoIGRldmljZXMgZW5kIHVwIHNpZ25hbGVkIGluIHRoZSBwb3N0ZWQKPiBp
bnRlcnJ1cHQgZGVzY3JpcHRvciBQSVJSIGZpZWxkIHdoZW4gbm90IHVzaW5nIFZULWQgcG9zdGVk
Cj4gaW50ZXJydXB0cyBidXQgdXNpbmcgQ1BVIHBvc3RlZCBpbnRlcnJ1cHRzPwoKTm8uIElmIFZU
LWQgcG9zdGVkIGludGVycnVwdCBpcyBkaXNhYmxlZCwgaW50ZXJydXB0cyBmcm9tIHBhc3N0aHJv
dWdoCmRldmljZXMgZG9uJ3QgZ28gdGhyb3VnaCBwb3N0ZWQgaW50ZXJydXB0IGRlc2NyaXB0b3Iu
IEJ1dCBhZnRlciBoeXBlcnZpc29yCnNlcnZlcyB0aGUgaW50ZXJydXB0IGFuZCB3aGVuIGl0IGRl
Y2lkZXMgdG8gaW5qZWN0IGEgdmlydHVhbCBpbnRlcnJ1cHQgaW50bwp0aGUgZ3Vlc3QsIFBJUlIg
d2lsbCBiZSB1cGRhdGVkIGlmIENQVSBwb3N0ZWQgaW50ZXJydXB0IGlzIGVuYWJsZWQuCgo+IAo+
IEZyb20gbXkgcmVhZGluZyBvZiB5b3VyIGRlc2NyaXB0aW9uIGFib3ZlIHdoZW4gdXNpbmcgQ1BV
IHBvc3RlZAo+IGludGVycnVwdHMgb25seSB0aGUgdmVjdG9ycyBzaWduYWxlZCBpbiB0aGUgUElS
UiBmaWVsZCBzaG91bGQgYmVsb25nCj4gdG8gSVBJcyBmcm9tIG90aGVyIHZDUFVzPwo+IAoKSSBk
aWRuJ3QgdW5kZXJzdGFuZCB5b3VyIHF1ZXN0aW9uLgoKVGhhbmtzCktldmluCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
