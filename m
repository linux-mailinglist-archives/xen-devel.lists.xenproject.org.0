Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8E62B01F7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 10:30:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25597.53466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd8vr-0006QC-NW; Thu, 12 Nov 2020 09:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25597.53466; Thu, 12 Nov 2020 09:30:19 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd8vr-0006Pm-K5; Thu, 12 Nov 2020 09:30:19 +0000
Received: by outflank-mailman (input) for mailman id 25597;
 Thu, 12 Nov 2020 09:30:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OBBx=ES=amazon.co.uk=prvs=578ce244f=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kd8vp-0006Pg-JO
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 09:30:17 +0000
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1671864-d7ea-44e8-bd2f-c92a481e3590;
 Thu, 12 Nov 2020 09:30:17 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 12 Nov 2020 09:30:05 +0000
Received: from EX13D32EUC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id 11429A1EB6; Thu, 12 Nov 2020 09:30:05 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 12 Nov 2020 09:30:03 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Thu, 12 Nov 2020 09:30:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=OBBx=ES=amazon.co.uk=prvs=578ce244f=pdurrant@srs-us1.protection.inumbo.net>)
	id 1kd8vp-0006Pg-JO
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 09:30:17 +0000
X-Inumbo-ID: c1671864-d7ea-44e8-bd2f-c92a481e3590
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c1671864-d7ea-44e8-bd2f-c92a481e3590;
	Thu, 12 Nov 2020 09:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1605173417; x=1636709417;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=23Oe8AETpKPh3SVX1ugGRGv+HDiKQYeXhI5QXpGkVVw=;
  b=OVk9mfNInHFt1vkOgQxkCaIaqNjraHs9RMTmmCBP6dL6Wn5ve3nwGQnf
   Tak9Y8WBkCtJjv2ISFme4cIfinhpWbV/zbqDq7S1+efqGchgy/DUfZeY3
   R+/O03C0BxJj1Tr0IyOl0oaUo+zVHOsH/HU5XWAO+eEBRWwVD7ZMUdkZy
   Q=;
X-IronPort-AV: E=Sophos;i="5.77,471,1596499200"; 
   d="scan'208";a="63736465"
Subject: RE: [PATCH 02/10] viridian: move IPI hypercall implementation into separate
 function
Thread-Topic: [PATCH 02/10] viridian: move IPI hypercall implementation into separate
 function
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP; 12 Nov 2020 09:30:05 +0000
Received: from EX13D32EUC002.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
	by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS id 11429A1EB6;
	Thu, 12 Nov 2020 09:30:05 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 12 Nov 2020 09:30:03 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Thu, 12 Nov 2020 09:30:03 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
CC: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Index: AQHWuM8ka4kmeZEn5kq2cFxSC3hucanEOquw
Date: Thu, 12 Nov 2020 09:30:03 +0000
Message-ID: <d6efef7bcf4d4c40bf87071fb26096bf@EX13D32EUC003.ant.amazon.com>
References: <20201111200721.30551-1-paul@xen.org>
 <20201111200721.30551-3-paul@xen.org>
 <37655f80-2f72-5069-6de4-0b2c8dce47bf@suse.com>
In-Reply-To: <37655f80-2f72-5069-6de4-0b2c8dce47bf@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.78]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDEyIE5vdmVtYmVyIDIwMjAgMDg6MzgNCj4gVG86IFBhdWwg
RHVycmFudCA8cGF1bEB4ZW4ub3JnPg0KPiBDYzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1h
em9uLmNvLnVrPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEFuZHJldyBDb29wZXINCj4gPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSRTogW0VY
VEVSTkFMXSBbUEFUQ0ggMDIvMTBdIHZpcmlkaWFuOiBtb3ZlIElQSSBoeXBlcmNhbGwgaW1wbGVt
ZW50YXRpb24gaW50byBzZXBhcmF0ZQ0KPiBmdW5jdGlvbg0KPiANCj4gQ0FVVElPTjogVGhpcyBl
bWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3Qg
Y2xpY2sgbGlua3Mgb3Igb3Blbg0KPiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJt
IHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0KPiANCj4g
T24gMTEuMTEuMjAyMCAyMTowNywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IEZyb206IFBhdWwg
RHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggbW92ZXMg
dGhlIGltcGxlbWVudGF0aW9uIG9mIEhWQ0FMTF9TRU5EX0lQSSB0aGF0IGlzIGN1cnJlbnRseQ0K
PiA+IGlubGluZSBpbiB2aXJpZGlhbl9oeXBlcmNhbGwoKSBpbnRvIGEgbmV3IGh2Y2FsbF9pcGko
KSBmdW5jdGlvbi4NCj4gPg0KPiA+IFRoZSBuZXcgZnVuY3Rpb24gcmV0dXJucyBYZW4gZXJybm8g
dmFsdWVzIHNpbWlsYXJseSB0byBodmNhbGxfZmx1c2goKS4gSGVuY2UNCj4gPiB0aGUgZXJybm8g
dHJhbnNsYXRpb24gY29kZSBpbiB2aXJpZGlhbF9oeXBlcmNhbGwoKSBpcyBnZW5lcmFsaXplZCwg
cmVtb3ZpbmcNCj4gPiB0aGUgbmVlZCBmb3IgdGhlIGxvY2FsICdzdGF0dXMnIHZhcmlhYmxlLg0K
PiA+DQo+ID4gTk9URTogVGhlIGZvcm1hdHRpbmcgb2YgdGhlICdvdXQnIGxhYmVsIGFsc28gY29y
cmVjdGVkIGFzIHBlciBDT0RJTkdfU1RZTEUNCj4gDQo+IEhvdyBhYm91dCBjb3JyZWN0aW5nIHRo
ZSBhZGphY2VudCBzd2l0Y2goKSBhdCB0aGUgc2FtZSB0aW1lIGFzIHdlbGw/DQo+IA0KDQpTdXJl
Lg0KDQo+ID4gICAgICAgYW5kIHRoZSBjb2RlIGlzIGFkanVzdGVkIHRvIGF2b2lkIGEgcmVnaXN0
ZXIgY29weS1iYWNrIGlmICdtb2RlJyBpcw0KPiA+ICAgICAgIG5laXRoZXIgOCBub3IgNC4NCj4g
DQo+IFdoaWxlIHlvdSBtZW50aW9uIGl0IGhlcmUsIGlzbid0IHRoaXMgYW4gdW5yZWxhdGVkIGNo
YW5nZSB3YW50aW5nDQo+IGl0cyBvd24ganVzdGlmaWNhdGlvbj8NCj4gDQoNCkl0IHdhcyBzdWNo
IHNtYWxsIG1vZCB0aGF0IEkgZm9sZGVkIGl0IGJ1dCBtYXliZSBpdCB3b3VsZCBiZSBiZXN0IHRv
IGJyZWFrIGl0IG91dCBpbnRvIGEgc2VwYXJhdGUgcGF0Y2ggYW5kIGFsc28gZG8gdGhlIGZvcm1h
dCBhZGp1c3RtZW50IHRoZXJlLg0KDQogIFBhdWwNCg0KPiBKYW4NCg==

