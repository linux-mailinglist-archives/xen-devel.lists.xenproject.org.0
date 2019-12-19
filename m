Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19741126085
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 12:10:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihte0-0003hg-Sd; Thu, 19 Dec 2019 11:07:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KiZr=2J=amazon.com=prvs=249f004f8=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihtdz-0003hY-Be
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 11:06:59 +0000
X-Inumbo-ID: ac754b9e-224f-11ea-9187-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac754b9e-224f-11ea-9187-12813bfff9fa;
 Thu, 19 Dec 2019 11:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576753618; x=1608289618;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/waVxG7HL0xuD1RKncSMJspNMN4/QqOU//xG666c1+0=;
 b=dAttl1mujLtxkk5O/FgH+KcKH+kFp/KStG4MDfEnHiWlX3pF3HVy0bsj
 8045Gw5LVitV2IhEDKOFnxcU3NoXgAMoT/gxvDqCILJ+gDVlLDCKwAWNg
 lpA+nbe3OnQwlmyomsx+7iaQen9Pk1XiCFcRE4VNNCkag4N2KnuLqd9Y0 w=;
IronPort-SDR: rKMEpRhhfd1X8WnE52O870J7KQNq4e+LAaneZFtX3xHzhFcsZLhmUWAo01G0w2xbpXqGkKV1QG
 QsI/hdMaAevQ==
X-IronPort-AV: E=Sophos;i="5.69,331,1571702400"; d="scan'208";a="15813596"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 19 Dec 2019 11:06:40 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com (Postfix) with ESMTPS
 id C6CF0A1DC9; Thu, 19 Dec 2019 11:06:39 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Dec 2019 11:06:39 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Dec 2019 11:06:38 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 19 Dec 2019 11:06:38 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] x86/save: reserve HVM save record numbers
 that have been consumed...
Thread-Index: AQHVtb2HD8UZZLEQMEaUpPbPmxeuyqfAS8OAgADZnRCAACP1gIAAAonA
Date: Thu, 19 Dec 2019 11:06:38 +0000
Message-ID: <80696690f8874a4da7a6c2f724cc78b4@EX13D32EUC003.ant.amazon.com>
References: <20191218160926.12538-1-pdurrant@amazon.com>
 <f72c26d5-ba96-5804-126a-865af62ceff1@citrix.com>
 <671333aff34f4e92bded1ad705264e02@EX13D32EUC003.ant.amazon.com>
 <0a4f237a-b744-50f8-7bd2-e53ddffea78e@citrix.com>
In-Reply-To: <0a4f237a-b744-50f8-7bd2-e53ddffea78e@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.49]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] x86/save: reserve HVM save record numbers
 that have been consumed...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAxOSBEZWNlbWJlciAyMDE5IDEwOjUyDQo+
IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPjsgeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnDQo+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJp
eC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0hdIHg4Ni9zYXZlOiByZXNl
cnZlIEhWTSBzYXZlIHJlY29yZCBudW1iZXJzDQo+IHRoYXQgaGF2ZSBiZWVuIGNvbnN1bWVkLi4u
DQo+IA0KPiBPbiAxOS8xMi8yMDE5IDA4OjUyLCBEdXJyYW50LCBQYXVsIHdyb3RlOg0KPiA+PiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gPj4gQW5kcmV3
IENvb3Blcg0KPiA+PiBTZW50OiAxOCBEZWNlbWJlciAyMDE5IDE5OjQ1DQo+ID4+IFRvOiBEdXJy
YW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+ID4+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPjsgUm9nZXIgUGF1DQo+IE1vbm7DqQ0KPiA+PiA8cm9nZXIucGF1QGNpdHJp
eC5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0hdIHg4Ni9zYXZlOiBy
ZXNlcnZlIEhWTSBzYXZlIHJlY29yZA0KPiBudW1iZXJzDQo+ID4+IHRoYXQgaGF2ZSBiZWVuIGNv
bnN1bWVkLi4uDQo+ID4+DQo+ID4+IE9uIDE4LzEyLzIwMTkgMTY6MDksIFBhdWwgRHVycmFudCB3
cm90ZToNCj4gPj4+IC4uLmZvciBwYXRjaGVzIG5vdCAoeWV0KSB1cHN0cmVhbS4NCj4gPj4+DQo+
ID4+PiBUaGlzIHBhdGNoIGlzIHNpbXBseSByZXNlcnZpbmcgc2F2ZSByZWNvcmQgbnVtYmVyIHNw
YWNlIHRvIGF2b2lkIHRoZQ0KPiA+Pj4gcmlzayBvZiBjbGFzaGVzIGJldHdlZW4gZXhpc3RlbnQg
ZG93bnN0cmVhbSBjaGFuZ2VzIG1hZGUgYnkgQW1hem9uIGFuZA0KPiA+Pj4gZnV0dXJlIHVwc3Ry
ZWFtIGNoYW5nZXMgd2hpY2ggbWF5IGJlIGluY29tcGF0aWJsZS4NCj4gPj4+DQo+ID4+PiBTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+ID4+IElzIHRo
aXMgInlvdSd2ZSBhbHJlYWR5IHVzZWQgc29tZSBvZiB0aGVzZSIsIG9yIHlvdSBwbGFuIHRvPw0K
PiA+IEFscmVhZHkgdXNlZCBpbiBjb2RlIHRoYXQgaGFzIGJlZW4gZGVwbG95ZWQsIGFsdGhvdWdo
IEkgaGF2ZSBsZWZ0IHNvbWUNCj4gaGVhZHJvb20gYmVjYXVzZSBJIGtub3cgdGhlcmUgaXMgY29k
ZSBpbiBkZXZlbG9wbWVudCB3aGljaCBpcyB1c2luZyBuZXcNCj4gb25lcy4NCj4gPg0KPiA+IFdo
ZXJlIHJlY29yZHMgY2FuIGJlIHVwc3RyZWFtZWQgaW4gYSB3YXkgdGhhdCBpcyBjb21wYXRpYmxl
IHdpdGgNCj4gZG93bnN0cmVhbSB1c2UsIHdlIHdpbGwga2VlcCB0aGUgZXhpc3RpbmcgbnVtYmVy
LiBJZiBpbmNvbXBhdGlibGUgY2hhbmdlcw0KPiBhcmUgbmVjZXNzYXJ5IHRvIGdldCB0aGUgY29k
ZSB1cHN0cmVhbSB0aGVuIHdlIHdpbGwgaGF2ZSB0byB1c2UgYSBuZXcNCj4gbnVtYmVyIGFuZCBt
YWludGFpbiBkb3duc3RyZWFtIGNvbXBhdGliaWxpdHkgcGF0Y2hlcy4NCj4gDQo+IEV2ZXJ5IGJ1
bXAgdG8gdGhpcyBudW1iZXIgaXMgbW9yZSB3YXN0ZWQgbWVtb3J5IGluIFhlbi4NCj4gDQoNCkhv
dyBtdWNoIG1vcmUgbWVtb3J5Pw0KDQo+IEl0IGlzIG5vdCBmYWlyIG9yIHJlYXNvbmFibGUgdG8g
aW5jbHVkZSBleHRyYSBoZWFkcm9vbSBpbiBhICJvaCBkZWFyIHdlDQo+IHNjcmV3ZWQgdXAgLSB3
aWxsIHRoZSBjb21tdW5pdHkgYmUga2luZCBlbm91Z2ggdG8gaGVscCB1cyB3b3JrIGFyb3VuZA0K
PiBvdXIgQUJJIHByb2JsZW1zIiBzY2VuYXJpby4NCj4gDQoNCkkgd291bGQgaGF2ZSB0aG91Z2h0
IGFsbCB0aGUgcGFpbiB5b3Ugd2VudCB0aHJvdWdoIHRvIGtlZXAgWGVuU2VydmVyIGdvaW5nIHdp
dGggaXRzIG5vbi11cHN0cmVhbWVkIGh5cGVyY2FsbCBudW1iZXJzIHdvdWxkIGhhdmUgbWFkZSB5
b3UgYSBsaXR0bGUgbW9yZSBzeW1wYXRoZXRpYyB0byBkZWFsaW5nIHdpdGggcGFzdCBtaXN0YWtl
cy4NCg0KPiBGb3Igbm93LCBJJ2QganVzdCBsZWF2ZSBpdCBhcyBhIGNvbW1lbnQsIGFuZCBzdHJp
Y3RseSBvbmx5IGNvdmVyaW5nIHRoZQ0KPiBvbmVzIHlvdSBoYXZlIHVzZWQuwqAgVGhlcmUgaXMg
bm8gbmVlZCB0byBhY3R1YWxseSBidW1wIHRoZSBzdHJ1Y3R1cmUNCj4gc2l6ZXMgaW4geGVuIGZv
ciBub3cgLSBzaW1wbHkgdGhhdCB0aGUgb25lcyB5b3UgaGF2ZSBjdXJyZW50bHkgdXNlZA0KPiBk
b24ndCBnZXQgYWxsb2NhdGVkIGZvciBzb21ldGhpbmcgZGlmZmVyZW50IGluIHRoZSBmdXR1cmUu
DQo+DQoNCk9rLCB3ZSBjYW4gZGVmZXIgYWN0dWFsbHkgYnVtcGluZyBIVk1fU0FWRV9DT0RFX01B
WCwgYnV0IGl0J3MgYWxtb3N0IGNlcnRhaW4gdG8gaGFwcGVuIGV2ZW50dWFsbHkuDQoNCiAgUGF1
bA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
