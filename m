Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C161778D4
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 15:28:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j98U9-0006yi-SF; Tue, 03 Mar 2020 14:25:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x433=4U=amazon.co.uk=prvs=32428865a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j98U8-0006yd-G5
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 14:25:24 +0000
X-Inumbo-ID: d1094780-5d5a-11ea-a17c-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1094780-5d5a-11ea-a17c-12813bfff9fa;
 Tue, 03 Mar 2020 14:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583245523; x=1614781523;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=sXvwfcIHnCZMuxiLnrYxGqXu0kifDjZBeOrVJQy2NkQ=;
 b=tGMnowRXWYdJOPfWJ8wbhyhDy8ZbBgsQuElGDlct5vnZScgri01EUBcH
 VeGlbjidoD2/YO/0zw+GeKbfAmeuxWUekCmWE43CE6eGTJXYBgGS6Aic8
 qIOUawAXHzYpDp/lzzgk+2Mo0wMkKvrLuS65RxN+N6w9+gZ2sv4ia+x4e I=;
IronPort-SDR: hSZnGDKuwOqyBnHMnwO1JKfR9v2ZwETiSEFssZfAOY7vze2vjtfDHJkvOJcdq0GkYpaxxGf3Ov
 2QdZXF+WZMpg==
X-IronPort-AV: E=Sophos;i="5.70,511,1574121600"; d="scan'208";a="20507183"
Thread-Topic: [Xen-devel] [PATCH v5 1/4] x86/HVM: cancel emulation when
 register state got altered
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 03 Mar 2020 14:25:21 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 31519A40FC; Tue,  3 Mar 2020 14:25:20 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 3 Mar 2020 14:25:19 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 3 Mar 2020 14:25:18 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 3 Mar 2020 14:25:18 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Index: AQHV8UTsG/SnSOoqCEyyMrudkBjJ3qg22IbggAAS9wCAAADAcA==
Date: Tue, 3 Mar 2020 14:25:18 +0000
Message-ID: <bd5988b9966b403991f4059216bfb93e@EX13D32EUC003.ant.amazon.com>
References: <1e1ccd2a-526c-631b-7889-35f993b2005e@suse.com>
 <146b8935-2a48-2de7-4c21-8390b6846c05@suse.com>
 <e1293a6fcb0942bda81a5690c20a6771@EX13D32EUC003.ant.amazon.com>
 <2bb05913-2573-4799-aa96-d9d0e2d74f0b@suse.com>
In-Reply-To: <2bb05913-2573-4799-aa96-d9d0e2d74f0b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.151]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 1/4] x86/HVM: cancel emulation when
 register state got altered
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAzIE1hcmNoIDIwMjAgMTQ6MjENCj4gVG86IER1cnJhbnQs
IFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2VpDQo+IExpdSA8d2xA
eGVuLm9yZz47IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSRTogW0VY
VEVSTkFMXVtYZW4tZGV2ZWxdIFtQQVRDSCB2NSAxLzRdIHg4Ni9IVk06IGNhbmNlbA0KPiBlbXVs
YXRpb24gd2hlbiByZWdpc3RlciBzdGF0ZSBnb3QgYWx0ZXJlZA0KPiANCj4gT24gMDMuMDMuMjAy
MCAxNDoxNiwgRHVycmFudCwgUGF1bCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5w
cm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mDQo+IEphbg0KPiA+PiBCZXVsaWNoDQo+ID4+IFNlbnQ6
IDAzIE1hcmNoIDIwMjAgMTA6MTcNCj4gPj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiA+PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47
IFJvZ2VyIFBhdSBNb25uw6kNCj4gPj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2VpIExpdSA8
d2xAeGVuLm9yZz47IFBhdWwgRHVycmFudA0KPiA8cGF1bEB4ZW4ub3JnPg0KPiA+PiBTdWJqZWN0
OiBbRVhURVJOQUxdW1hlbi1kZXZlbF0gW1BBVENIIHY1IDEvNF0geDg2L0hWTTogY2FuY2VsIGVt
dWxhdGlvbg0KPiA+PiB3aGVuIHJlZ2lzdGVyIHN0YXRlIGdvdCBhbHRlcmVkDQo+ID4+DQo+ID4+
IFJlLWV4ZWN1dGlvbiAoYWZ0ZXIgaGF2aW5nIHJlY2VpdmVkIGRhdGEgZnJvbSBhIGRldmljZSBt
b2RlbCkgcmVsaWVzIG9uDQo+ID4+IHRoZSBzYW1lIHJlZ2lzdGVyIHN0YXRlIHN0aWxsIGJlaW5n
IGluIHBsYWNlIGFzIGl0IHdhcyB3aGVuIHRoZSByZXF1ZXN0DQo+ID4+IHdhcyBmaXJzdCBzZW50
IHRvIHRoZSBkZXZpY2UgbW9kZWwuIFRoZXJlZm9yZSB2Q1BVIHN0YXRlIGNoYW5nZXMNCj4gPj4g
ZWZmZWN0ZWQgYnkgcmVtb3RlIHNvdXJjZXMgbmVlZCB0byByZXN1bHQgaW4gbm8gYXR0ZW1wdCBv
ZiByZS0NCj4gZXhlY3V0aW9uLg0KPiA+PiBJbnN0ZWFkIHRoZSByZXR1cm5lZCBkYXRhIGlzIHRv
IHNpbXBseSBiZSBpZ25vcmVkLg0KPiA+Pg0KPiA+PiBOb3RlIHRoYXQgYW55IHN1Y2ggYXN5bmNo
cm9ub3VzIHN0YXRlIGNoYW5nZXMgaGFwcGVuIHdpdGggdGhlIHZDUFUgYXQNCj4gPj4gbGVhc3Qg
cGF1c2VkIChwb3RlbnRpYWxseSBkb3duIGFuZC9vciBub3QgbWFya2VkIC0+aXNfaW5pdGlhbGlz
ZWQpLCBzbw0KPiA+PiB0aGVyZSdzIG5vIGlzc3VlIHdpdGggZmlkZGxpbmcgd2l0aCByZWdpc3Rl
ciBzdGF0ZSBiZWhpbmQgdGhlIGFjdGl2ZWx5DQo+ID4+IHJ1bm5pbmcgZW11bGF0b3IncyBiYWNr
LiBIZW5jZSB0aGUgbmV3IGZ1bmN0aW9uIGRvZXNuJ3QgbmVlZCB0bw0KPiA+PiBzeW5jaHJvbml6
ZSB3aXRoIHRoZSBjb3JlIGVtdWxhdGlvbiBsb2dpYy4NCj4gPj4NCj4gPj4gU3VnZ2VzdGVkLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiA+PiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4NCj4gPiBOZWVkIHdl
IGJlIGNvbmNlcm5lZCB3aXRoIGFueSBwYWdlLXNwbGl0IEkvTyBoZXJlPyBUaGF0IG1heSBtYW5p
ZmVzdCBhcw0KPiA+IHR3byBzZXBhcmF0ZSBlbXVsYXRpb25zIGFuZCBBRkFJQ1QgaXQgd291bGQg
YmUgcG9zc2libGUgZm9yIG9ubHkgdGhlDQo+ID4gc2Vjb25kIHBhcnQgdG8gYmUgYWJvcnRlZCBi
eSB0aGlzIGNoYW5nZS4NCj4gDQo+IEknbSBub3Qgc3VyZSB3aGV0aGVyIGUuZy4gSU5JVCBpcyBy
ZWNvZ25pemVkIG9ubHkgb24gaW5zbiBib3VuZGFyaWVzLg0KPiBJLmUuIHRoaXMgbWF5IG5vdCBi
ZSB0aGF0IGRpZmZlcmVudCBmcm9tIHJlYWwgaGFyZHdhcmUgYmVoYXZpb3IuIF9JZl8NCj4gd2Ug
d2VyZSB0byB0YWtlIGNhcmUgb2YgdGhpcywgaG93IHdvdWxkIHlvdSBlbnZpc2lvbiB1bmRvaW5n
IHRoZQ0KPiBmaXJzdCBwYXJ0IG9mIHN1Y2ggYW4gYWNjZXNzLCBtb3N0IG5vdGFibHkgd2hlbiB0
aGUgYWNjZXNzIGhhcyBzaWRlDQo+IGVmZmVjdHM/DQoNCkkgd2Fzbid0IHRoaW5raW5nIG9mIHVu
ZG9pbmcuLi4gSSB3YXMgbW9yZSB0aGlua2luZyB0aGF0IHZjcHVfcGF1c2UoKSBvdWdodCB0byBk
ZWZlciB1bnRpbCBhbiBpbi1wcm9ncmVzcyBlbXVsYXRpb24gaGFzIGZ1bGx5IGNvbXBsZXRlZC4N
Cg0KICBQYXVsDQoNCj4gDQo+IEphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
