Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 214B12CF41C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 19:34:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45018.80490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klFts-0002m3-6j; Fri, 04 Dec 2020 18:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45018.80490; Fri, 04 Dec 2020 18:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klFts-0002le-2n; Fri, 04 Dec 2020 18:33:48 +0000
Received: by outflank-mailman (input) for mailman id 45018;
 Fri, 04 Dec 2020 18:33:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kc/5=FI=amazon.co.uk=prvs=6003cbb93=pdurrant@srs-us1.protection.inumbo.net>)
 id 1klFtq-0002lZ-H9
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 18:33:46 +0000
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6198d457-bf0f-4862-8914-c5112ad2a167;
 Fri, 04 Dec 2020 18:33:45 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 04 Dec 2020 18:33:39 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id 80E28C05B9; Fri,  4 Dec 2020 18:33:35 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D03EUC002.ant.amazon.com (10.43.164.60) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 4 Dec 2020 18:33:34 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Fri, 4 Dec 2020 18:33:34 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 6198d457-bf0f-4862-8914-c5112ad2a167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1607106825; x=1638642825;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=nTlTxptuem5odOY+jcWjS5Pof00CGGujTgfBoho2voo=;
  b=HufR3j87fRE9mNMF2tnARK72q9LoYqWEQncqUJk0Crc2Gn0fnAD9Qm1v
   ngc3uw+Of41RSEbutKqgzOTevuQQvdrDlCuO1EMTPLCUkDh5F21gySmQX
   yrkRM5ohXELHDbkOf/M62X/WG9C3/aDz2OXzAfUiF2sVNyXSb13HqkkFH
   U=;
X-IronPort-AV: E=Sophos;i="5.78,393,1599523200"; 
   d="scan'208";a="67403274"
Subject: RE: [PATCH v5 1/4] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_evtchn_fifo, ...
Thread-Topic: [PATCH v5 1/4] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_evtchn_fifo, ...
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	"paul@xen.org" <paul@xen.org>, "Elnikety, Eslam" <elnikety@amazon.com>, "'Ian
 Jackson'" <iwj@xenproject.org>, 'Wei Liu' <wl@xen.org>, 'Anthony PERARD'
	<anthony.perard@citrix.com>, 'George Dunlap' <george.dunlap@citrix.com>,
	'Christian Lindig' <christian.lindig@citrix.com>, 'David Scott'
	<dave@recoil.org>, 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
	=?utf-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Index: AQJzrCHAX/gquRkO4g65wfjgQBytUAJ7xs67Aj6rtzSoheWkIIAACFOAgAATywCAAPdoAIAACFeAgAAWa4CAACI7AIAAAc2AgABhdgCAAAEeAIAADUEw
Date: Fri, 4 Dec 2020 18:33:34 +0000
Message-ID: <19beb5b5a651415c83dfbdaa533e7bed@EX13D32EUC003.ant.amazon.com>
References: <20201203124159.3688-1-paul@xen.org>
 <20201203124159.3688-2-paul@xen.org>
 <fea91a65-1d7c-cd46-81a2-9a6bcb690ed1@suse.com>
 <00ee01d6c98b$507af1c0$f170d540$@xen.org>
 <8a4a2027-0df3-aee2-537a-3d2814b329ec@suse.com>
 <00f601d6c996$ce3908d0$6aab1a70$@xen.org>
 <946280c7-c7f7-c760-c0d3-db91e6cde68a@suse.com>
 <011201d6ca16$ae14ac50$0a3e04f0$@xen.org>
 <4fb9fb4c-5849-25f1-ff72-ba3a046d3fd8@suse.com>
 <df1df316-9512-7b0c-fde1-aa4fc60ac70b@xen.org>
 <5de9f051-4071-4e09-528c-c1fb8345dc25@citrix.com>
 <alpine.DEB.2.21.2012040940160.32240@sstabellini-ThinkPad-T480s>
 <7184a2de-f711-9683-3db6-7b880def022d@citrix.com>
In-Reply-To: <7184a2de-f711-9683-3db6-7b880def022d@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.90]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAwNCBEZWNlbWJlciAyMDIwIDE3OjQ1DQo+
IFRvOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IENjOiBK
dWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPjsgcGF1bEB4ZW4ub3JnOyBEdXJyYW50LCBQYXVsDQo+IDxwZHVycmFudEBhbWF6b24uY28u
dWs+OyBFbG5pa2V0eSwgRXNsYW0gPGVsbmlrZXR5QGFtYXpvbi5jb20+OyAnSWFuIEphY2tzb24n
IDxpd2pAeGVucHJvamVjdC5vcmc+Ow0KPiAnV2VpIExpdScgPHdsQHhlbi5vcmc+OyAnQW50aG9u
eSBQRVJBUkQnIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgJ0dlb3JnZSBEdW5sYXAnDQo+
IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyAnQ2hyaXN0aWFuIExpbmRpZycgPGNocmlzdGlh
bi5saW5kaWdAY2l0cml4LmNvbT47ICdEYXZpZCBTY290dCcNCj4gPGRhdmVAcmVjb2lsLm9yZz47
ICdWb2xvZHlteXIgQmFiY2h1aycgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgJ1JvZ2Vy
IFBhdSBNb25uw6knDQo+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSRTogW0VYVEVSTkFMXSBbUEFUQ0ggdjUgMS80XSBk
b21jdGw6IGludHJvZHVjZSBhIG5ldyBkb21haW4gY3JlYXRlIGZsYWcsDQo+IFhFTl9ET01DVExf
Q0RGX2V2dGNobl9maWZvLCAuLi4NCj4gDQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRl
ZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4NCj4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVyIGFu
ZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiANCj4gDQo+IE9uIDA0LzEyLzIwMjAg
MTc6NDEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gPj4+IEZBT0QsIEkgYW0gc3VyZSB0
aGVyZSBtaWdodCBiZSBvdGhlciBmZWF0dXJlcyB0aGF0IG5lZWQgdG8gYmUNCj4gPj4+IGRpc2Fi
bGVkLiBCdXQgd2UgaGF2ZSB0byBzdGFydCBzb21ld2hlcmUgOikuDQo+ID4+IEFic29sdXRlbHkg
dG9wIG9mIHRoZSBsaXN0LCBpbXBvcnRhbmNlIHdpc2UsIGlzIHNvIHdlIGNhbiB0ZXN0IGRpZmZl
cmVudA0KPiA+PiBjb25maWd1cmF0aW9ucywgd2l0aG91dCBuZWVkaW5nIHRvIHJlYnVpbGQgdGhl
IGh5cGVydmlzb3IgKGFuZCB0byBhDQo+ID4+IGxlc3NlciBleHRlbnQsIHdpdGhvdXQgaGF2aW5n
IHRvIHJlYm9vdCkuDQo+ID4+DQo+ID4+IEl0IGlzIGEgbWlzdGFrZSB0aGF0IGV2ZW50cy9ncmFu
dHMvZXRjIHdlcmUgZXZlciBhdmFpbGFibGUgdW5pbGF0ZXJhbGx5DQo+ID4+IGluIEhWTSBndWVz
dHMuICBUaGlzIGlzIGRlZmluaXRlbHkgYSBzdGVwIGluIHRoZSByaWdodCBkaXJlY3Rpb24gKGJ1
dCBJDQo+ID4+IHRob3VnaHQgaXQgd291bGQgYmUgdG9vIHJ1ZGUgdG8gYXNrIFBhdWwgdG8gbWFr
ZSBhbGwgb2YgdGhvc2UgQ0RGIGZsYWdzDQo+ID4+IGF0IG9uY2UpLg0KPiA+ICsxDQo+ID4NCj4g
PiBGb3IgRnVTYSB3ZSdsbCBuZWVkIHRvIGJlIGFibGUgdG8gZGlzYWJsZSB0aGVtIGF0IHNvbWUg
cG9pbnQgc29vbi4NCj4gDQo+IEZXSVcsIEkgaGF2ZSBhIHByb3BlciBwbGFuIGZvciB0aGlzIHN0
dWZmLCB3aGljaCBzdGFydCBhbG9uZ3NpZGUgdGhlDQo+IGZpeGVkIHRvb2xzdGFjayBBQkksIGFu
ZCB3aWxsIGNvdmVyIGFsbCBhc3BlY3RzIG9mIG9wdGlvbmFsDQo+IGZ1bmN0aW9uYWxpdHkgaW4g
YSBkb21haW4uDQo+IA0KDQpPSy4gQ2FuIHdlIGxpdmUgd2l0aCB0aGlzIHNlcmllcyBhcyBpdCBz
dGFuZHMgdW50aWwgdGhhdCBwb2ludD8gVGhlcmUgaXMgc29tZSB1cmdlbmN5IHRvIGdldCBhdCBs
ZWFzdCB0aGVzZSB0d28gdGhpbmdzIGZpeGVkLg0KDQogIFBhdWwNCg0KPiB+QW5kcmV3DQo=

