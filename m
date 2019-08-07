Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6202584C52
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 15:04:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvLZS-00027B-QO; Wed, 07 Aug 2019 13:01:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dGpx=WD=amazon.com=prvs=115058da6=elnikety@srs-us1.protection.inumbo.net>)
 id 1hvLZR-000274-0b
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 13:01:37 +0000
X-Inumbo-ID: 7b931664-b913-11e9-979a-972d7252e318
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b931664-b913-11e9-979a-972d7252e318;
 Wed, 07 Aug 2019 13:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1565182894; x=1596718894;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2IzwS+lJQmjMR/B7hE/uSyIgOwv7d8WfGqq7eAHW6jo=;
 b=qcu+hewVVSxHDlsfW/RLt7N97LcaGWMBZfnRUMCKcb4rHxtoHQlTaFFN
 U9+uRoNEH57xqCNsm3mSAt1DeAZjQZeifqmUMQAGsQGN6c1ztKJQyUByC
 dxKKxV6UaVB+3kjAHyRf14mV8fH4HY3KwYweOKICBf88hyFt6aqPJ7kT4 o=;
X-IronPort-AV: E=Sophos;i="5.64,357,1559520000"; d="scan'208";a="817570276"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 07 Aug 2019 13:01:31 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com (Postfix) with ESMTPS
 id 48636A20C1; Wed,  7 Aug 2019 13:01:27 +0000 (UTC)
Received: from EX13D08UEE001.ant.amazon.com (10.43.62.126) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 7 Aug 2019 13:01:27 +0000
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13D08UEE001.ant.amazon.com (10.43.62.126) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 7 Aug 2019 13:01:27 +0000
Received: from EX13D03EUA002.ant.amazon.com ([10.43.165.166]) by
 EX13D03EUA002.ant.amazon.com ([10.43.165.166]) with mapi id 15.00.1367.000;
 Wed, 7 Aug 2019 13:01:26 +0000
From: "Elnikety, Eslam" <elnikety@amazon.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] evtchn: make support for different ABIs tunable
Thread-Index: AQHVTRIxUNF+eOebUkSjRBUx8cK6Dqbvj84AgAAHUYCAAAaSAIAACJqA
Date: Wed, 7 Aug 2019 13:01:25 +0000
Message-ID: <05D843E0-BD95-4C40-9207-3DDF9D1703BE@amazon.com>
References: <20190807112024.19480-1-elnikety@amazon.com>
 <0aaa7b3b-fc94-d3fb-7afc-2f670511fea0@citrix.com>
 <9F89B8B5-D92E-4CA6-ABCF-5F8E9707AE94@amazon.com>
 <49a95cf4-0b76-234b-ebef-2ed290ef5330@citrix.com>
In-Reply-To: <49a95cf4-0b76-234b-ebef-2ed290ef5330@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.87]
Content-ID: <2DABB3F88F2B5D4CAB445904EF924366@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] evtchn: make support for different ABIs
 tunable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDcuIEF1ZyAyMDE5LCBhdCAxNDozMCwgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4gCj4gT24gMDcvMDgvMjAxOSAxMzowNywgRWxuaWtldHks
IEVzbGFtIHdyb3RlOgo+Pj4gT24gNy4gQXVnIDIwMTksIGF0IDEzOjQwLCBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+IAo+Pj4gT24gMDcvMDgvMjAx
OSAxMjoyMCwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4+Pj4gQWRkaW5nIHN1cHBvcnQgZm9yIEZJ
Rk8gZXZlbnQgY2hhbm5lbCBBQkkgd2FzIGZpcnN0IGludHJvZHVjZWQgaW4gWGVuIDQuNAo+Pj4+
IChzZWUgODg5MTAwNjFlYzYpLiBNYWtlIHRoaXMgc3VwcG9ydCB0dW5hYmxlLCBzaW5jZSB0aGUg
Y2hvaWNlIG9mIHdoaWNoCj4+Pj4gZXZlbnQgY2hhbm5lbCBBQkkgaGFzIGltcGxpY2F0aW9ucyBm
b3IgaGliZXJuYXRpb24uIENvbnNpZGVyIHJlc3VtaW5nIGEKPj4+PiBwcmUgWGVuIDQuNCBoaWJl
cm5hdGVkIExpbnV4IGd1ZXN0LiBUaGUgZ3Vlc3QgYm9vdCBrZXJuZWwgZGVmYXVsdHMgdG8gRklG
Two+Pj4+IEFCSSwgd2hlcmVhcyB0aGUgcmVzdW1lIGtlcm5lbCBhc3N1bWVzIDJMLiBUaGlzLCBp
biB0dXJuLCByZXN1bHRzIGluIFhlbgo+Pj4+IGFuZCB0aGUgcmVzdW1lZCBrZXJuZWwgdGFsa2lu
ZyBwYXN0IGVhY2ggb3RoZXIgKGR1ZSB0byBkaWZmZXJlbnQgcHJvdG9jb2xzCj4+Pj4gRklGTyB2
cyAyTCkuCj4+PiBJJ20gYWZyYWlkIEkgZG9uJ3QgZm9sbG93Lgo+Pj4gCj4+PiBXZSBoYXZlIGEg
TGludXgga2VybmVsIHdoaWNoIGtub3dzIGFib3V0IEZJRk8sIHdoaWNoIHdhcyBmaXJzdCBib290
ZWQgb24KPj4+IFhlbiA8IDQuNCwgc28gY29uZmlndXJlZCAyTCBtb2RlLgo+Pj4gCj4+PiBJdCBp
cyB0aGVuIHN1c3BlbmRlZCwgYW5kIHJlc3VtZWQgb24gYSBuZXdlciBYZW4gPj0gNC40LiAgVGhl
IGd1ZXN0IG5vdwo+Pj4gaGFzIGEgY2hvaWNlIGJldHdlZW4gMkwgbW9kZSwgYW5kIEZJRk8gbW9k
ZS4KPj4+IAo+Pj4gV2hhdCBpcyB0aGUgcHJvYmxlbT8KPj4+IAo+Pj4gV2hlbiByZXN1bWluZywg
dGhlIGd1ZXN0IGluIHF1ZXN0aW9uIHNob3VsZCBjb250aW51ZSB0byB1c2UgMkwgbW9kZSwKPj4+
IGJlY2F1c2UgdGhhdCBpcyB3aGF0IGl0IHdhcyB1c2luZyBwcmV2aW91c2x5Lgo+Pj4gCj4+PiB+
QW5kcmV3Cj4+IAo+PiBBZnRlciByZXN1bWluZyAoaS5lLiwgTGludXgncyBzb2Z0d2FyZV9yZXN1
bWUpLCB0aGUgZ3Vlc3Qgd2lsbCBpbmRlZWQgY29udGludWUgdG8gdXNlIDJMLiBIb3dldmVyLCBY
ZW4gaGFzIGFscmVhZHkgZG9uZSBldnRjaG5fZmlmb19pbml0X2NvbnRyb2wgYXMgcGFydCBvZiB0
aGUgYm9vdCBrZXJuZWwgaW5pdCAoYmVmb3JlIHRoZSBndWVzdCdzIHNvZnR3YXJlX3Jlc3VtZSku
IFRoZW4sIHdlIHJlYWNoIHRoZSBwb2ludCB3aGVyZSBndWVzdCBhc3N1bWVzIDJMIGFuZCBYZW4g
YXNzdW1lcyBGSUZPLgo+IAo+IFdpdGggRGF2aWRzIGV4cGxhbmF0aW9uLCBJIG5vdyB1bmRlcnN0
YW5kIHRoZSBwcm9ibGVtLiAgSG93ZXZlciBmb3IKPiBjbGFyaXR5LCBpdCBpcyBwcm9iYWJseSB3
b3J0aCBtYWtpbmcgYSBjb3JyZWN0aW9uIGhlcmUuCj4gCj4gSXQgaXNuJ3QgWGVuIHdoaWNoIGRv
ZXMgZXZ0Y2huX2ZpZm9faW5pdF9jb250cm9sKCkuICBJdCBpcyB0aGUgImJvb3QiCj4ga2VybmVs
IGlzc3VpbmcgRVZUQ0hOT1BfaW5pdF9jb250cm9sIGh5cGVyY2FsbCB3aGljaCBzd2l0Y2hlcyB0
aGUgZG9tYWluCj4gZnJvbSAyTCBtb2RlIGludG8gRklGTyBtb2RlLgo+IAo+IFhlbiBpcyBkb2lu
ZyBleGFjdGx5IGFzIGl0IHdhcyBpbnN0cnVjdGVkLiAgVGhlIHVuZGVybHlpbmcgYnVnIGlzIGEK
PiBtaXNtYXRjaCBpbiBiZWhhdmlvdXIgYmV0d2VlbiB0aGUgImJvb3QiIGtlcm5lbCBhbmQgdGhl
IG9uLWRpc2sKPiBrZXJuZWwvc3RhdGUuCgpUaGFua3MgYSBsb3QgZm9yIHRoZSBwcm9tcHQgcmVz
cG9uc2VzLCBldmVyeW9uZS4KClllcywgWGVuIGlzIGRvaW5nIHRoZSByaWdodCB0aGluZy4gQnV0
LCBJIHdvdWxkIG5vdCBjYWxsIGl0IGEgTGludXggYnVnIGVpdGhlci4gSGliZXJuYXRlL3Jlc3Vt
ZSAocmlnaHRmdWxseSkgYXNzdW1lcyB0aGF0IHRoZSB1bmRlcmx5aW5nIEhXIGFuZCB0aGUgdmly
dHVhbCBzdWJzeXN0ZW0gYW5kIGl0cyBjYXBhYmlsaXRpZXMgaGF2ZSBub3QgY2hhbmdlZCBkdXJp
bmcgdGhlIGd1ZXN0J3MgbG9naWNhbCBsaWZldGltZS4gVGhlIGtub2IgaW50cm9kdWNlZCBpbiB0
aGlzIHBhdGNoIGdvZXMgYWxvbmcgdGhlIHNhbWUgbGluZXM6IGFsbG93IGFuIGFkbWluaXN0cmF0
b3IgdG8gY29udHJvbCB3aGljaCBldmVudCBjaGFubmVsIEFCSSBzdXBwb3J0IGxldmVsIHRvIGV4
cG9zZSBpbiBvcmRlciB0byBtYWludGFpbiBhIHBhcnRpY3VsYXIgZ3Vlc3QncyB2aWV3IG9mIHRo
ZSB1bmRlcmx5aW5nIEhXIGFuZCB2aXJ0dWFsIHN1YnN5c3RlbS4KCj4gCj4gfkFuZHJldwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
