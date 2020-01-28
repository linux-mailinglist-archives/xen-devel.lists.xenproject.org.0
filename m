Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D40BD14B557
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 14:48:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwRBM-0006Yx-FU; Tue, 28 Jan 2020 13:45:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0vDG=3R=amazon.co.uk=prvs=289a7b1b7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwRBL-0006Ys-Hl
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 13:45:31 +0000
X-Inumbo-ID: 73495f32-41d4-11ea-86c6-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73495f32-41d4-11ea-86c6-12813bfff9fa;
 Tue, 28 Jan 2020 13:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580219131; x=1611755131;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/7RuKpCoRQoUJUP1Qu8+j9rYhmW/rhxLfcA5WCBN/0M=;
 b=cgiKhdBdfrDVaMJ9l5itLrCKky9f3FhAMzDRbet2hiw7ZJE3k4JnZQ+5
 RO+2MfKaDnt9xwJLkxK6luP+7fi0SA6eBi+P04+WVk2gdsww3iHnsjUkv
 WvVX3O80CczhOyFgqk80IE+VBcGcOGgLBcNukAHJWEXS4nwb+EJUtP2EZ Q=;
IronPort-SDR: Df/OoZ3n2tyZY1hLIs9fsZQEvlHZr4Z6Wa6Oj01PaazqE97eCKeeFq8qNitsYnhQlAnlqQXkkE
 YHBV6tHc2Z+A==
X-IronPort-AV: E=Sophos;i="5.70,374,1574121600"; d="scan'208";a="14576486"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 28 Jan 2020 13:45:29 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com (Postfix) with ESMTPS
 id A4BB4A1FDC; Tue, 28 Jan 2020 13:45:28 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 28 Jan 2020 13:45:28 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 28 Jan 2020 13:45:27 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 28 Jan 2020 13:45:27 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v3 2/2] docs/designs: Add a design document
 for migration of xenstore data
Thread-Index: AQHV1dZ3TShEBUoOd0SzRCxqU6JPRagAE/iAgAACVmA=
Date: Tue, 28 Jan 2020 13:45:27 +0000
Message-ID: <3344610fdf974ad6a5265f5877251886@EX13D32EUC003.ant.amazon.com>
References: <20200128122823.12920-1-pdurrant@amazon.com>
 <20200128122823.12920-3-pdurrant@amazon.com>
 <d4303602-e4b0-d08a-b1e3-da598c6ecc1b@suse.com>
In-Reply-To: <d4303602-e4b0-d08a-b1e3-da598c6ecc1b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 2/2] docs/designs: Add a design document
 for migration of xenstore data
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+IFNlbnQ6IDI4IEphbnVhcnkgMjAyMCAxMzozNg0KPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
OyBKdWxpZW4gR3JhbGwNCj4gPGp1bGllbkB4ZW4ub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47
IEtvbnJhZCBSemVzenV0ZWsgV2lsaw0KPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEdlb3Jn
ZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT47DQo+IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBJYW4gSmFja3Nvbg0KPiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MyAyLzJd
IGRvY3MvZGVzaWduczogQWRkIGEgZGVzaWduDQo+IGRvY3VtZW50IGZvciBtaWdyYXRpb24gb2Yg
eGVuc3RvcmUgZGF0YQ0KPiANCj4gT24gMjguMDEuMjAgMTM6MjgsIFBhdWwgRHVycmFudCB3cm90
ZToNCj4gPiBUaGlzIHBhdGNoIGRldGFpbHMgcHJvcG9zZXMgZXh0cmEgbWlncmF0aW9uIGRhdGEg
YW5kIHhlbnN0b3JlIHByb3RvY29sDQo+ID4gZXh0ZW5zaW9ucyB0byBzdXBwb3J0IG5vbi1jb29w
ZXJhdGl2ZSBsaXZlIG1pZ3JhdGlvbiBvZiBndWVzdHMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+ID4gLS0tDQo+ID4gQ2M6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+ID4gQ2M6IEdlb3JnZSBE
dW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4NCj4gPiBDYzogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+DQo+ID4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4NCj4gPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gPiBD
YzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPg0KPiA+IENj
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+ID4gQ2M6IFdl
aSBMaXUgPHdsQHhlbi5vcmc+DQo+ID4NCj4gPiB2MzoNCj4gPiAgIC0gTmV3IGluIHYzDQo+ID4g
LS0tDQo+ID4gICBkb2NzL2Rlc2lnbnMveGVuc3RvcmUtbWlncmF0aW9uLm1kIHwgMTIyICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTIyIGluc2Vy
dGlvbnMoKykNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL2Rlc2lnbnMveGVuc3RvcmUt
bWlncmF0aW9uLm1kDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZG9jcy9kZXNpZ25zL3hlbnN0b3Jl
LW1pZ3JhdGlvbi5tZCBiL2RvY3MvZGVzaWducy94ZW5zdG9yZS0NCj4gbWlncmF0aW9uLm1kDQo+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwLi45MDIwYjZmZjlh
DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RvY3MvZGVzaWducy94ZW5zdG9yZS1taWdy
YXRpb24ubWQNCj4gPiBAQCAtMCwwICsxLDEyMiBAQA0KPiA+ICsqKndhdGNoIGRhdGEqKg0KPiA+
ICsNCj4gPiArDQo+ID4gK2A8cGF0aD58PHRva2VuPnxgDQo+ID4gKw0KPiA+ICtgPHBhdGg+YCBh
Z2FpbiBpcyBjb25zaWRlcmVkIHJlbGF0aXZlIGFuZCwgdG9nZXRoZXIgd2l0aCBgPHRva2VuPmAs
DQo+IHNob3VsZA0KPiA+ICtiZSBzdWl0YWJsZSB0byBmb3JtdWxhdGUgYW4gYEFERF9ET01BSU5f
V0FUQ0hFU2Agb3BlcmF0aW9uIChzZWUgYmVsb3cpLg0KPiA+ICtOb3RlIHRoYXQgYDxwYXRoPmAg
bXVzdCBub3QgYmUgYSAqc3BlY2lhbCogdmFsdWUgKGJlZ2lubmluZyB3aXRoIGBAYCkuDQo+IA0K
PiBXaHkgbm90PyBUaGlzIGlzIHBvc3NpYmxlIGZvciBhIGd1ZXN0LCBzbyBpdCBzaG91bGQgYmUg
cG9zc2libGUgdG8NCj4gbWlncmF0ZSBzdWNoIGEgd2F0Y2guDQo+IA0KPiBUb2RheSBpdCBtaWdo
dCBub3QgbWFrZSBhbnkgc2Vuc2UsIGJ1dCB3ZSBzaG91bGQgbm90IGJsb2NrIGFueSBmdXR1cmUN
Cj4gc3BlY2lhbCB2YWx1ZXMgd2hpY2ggbWlnaHQgbWFrZSBzZW5zZSBmb3IgYSBndWVzdCB0byB1
c2UuDQo+IA0KDQpPay4gSSB3YXMganVzdCBsaW1pdGluZyB0aGluZ3MgdG8gd2hhdCBpcyBhY3R1
YWxseSBuZWVkZWQuIElmIHlvdSB0aGluayB0aGVyZSBpcyBtZXJpdCBpbiBhbGxvd2luZyB0aGVt
IHRoZW4gSSBoYXZlIG5vIG9iamVjdGlvbi4gSSdsbCByZW1vdmUgdGhlIGV4Y2x1c2lvbnMuDQoN
CiAgUGF1bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
