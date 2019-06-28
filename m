Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DED598A4
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 12:43:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgoJ0-000212-4Q; Fri, 28 Jun 2019 10:40:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hgoIz-00020x-4q
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 10:40:33 +0000
X-Inumbo-ID: 1dca424c-9991-11e9-830c-9775b24e44f0
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1dca424c-9991-11e9-830c-9775b24e44f0;
 Fri, 28 Jun 2019 10:40:28 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 28 Jun 2019 10:40:19 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 28 Jun 2019 10:40:03 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 28 Jun 2019 10:40:03 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3209.namprd18.prod.outlook.com (10.255.172.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Fri, 28 Jun 2019 10:40:02 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::302a:6fe1:31f0:3abf]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::302a:6fe1:31f0:3abf%4]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 10:40:02 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 1/5] make: simplify setting HOST{CC/CXX}
Thread-Index: AQHVLZQKRk+ndxEiz0+XlRTNmtzJFKaw2l1GgAAGGgA=
Date: Fri, 28 Jun 2019 10:40:02 +0000
Message-ID: <0fabe327-ba46-399d-12f5-23ce46ab1c3b@suse.com>
References: <decd4108-1234-921f-ba89-f2eec18d21f5@suse.com>
 <20190628101544.7hey7guj4k6gu7pp@MacBook-Air-de-Roger.local>
In-Reply-To: <20190628101544.7hey7guj4k6gu7pp@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0802CA0041.eurprd08.prod.outlook.com
 (2603:10a6:4:a3::27) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7360fdcc-96c8-4660-28de-08d6fbb4f989
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3209; 
x-ms-traffictypediagnostic: DM6PR18MB3209:
x-microsoft-antispam-prvs: <DM6PR18MB3209472A873CCD78E70525F9B3FC0@DM6PR18MB3209.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(199004)(52314003)(189003)(305945005)(7736002)(66066001)(25786009)(6486002)(4326008)(36756003)(54906003)(66446008)(64756008)(66556008)(66476007)(316002)(2906002)(73956011)(66946007)(256004)(476003)(486006)(11346002)(446003)(31686004)(2616005)(8936002)(6436002)(71200400001)(71190400001)(3846002)(6116002)(8676002)(68736007)(81166006)(81156014)(14454004)(76176011)(7416002)(99286004)(52116002)(102836004)(31696002)(86362001)(72206003)(229853002)(53936002)(6512007)(5660300002)(53546011)(80792005)(386003)(6506007)(478600001)(6246003)(186003)(26005)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3209;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rnAzZj8SEtHCFR+l+OHWlM5GBhsh5T7AOWcC9zkT5dr8vFeW2smIsSERK9I67UiaXUiq3OIS/wfvRwapk6QhnAGRK+AjRDma9qJolhU7/eW5KmjcVdidszBrLAWtPL5bpYvVdsb/SLAeL7uNowKTGUX/l4HvC7C7x6B9qkDZOod0YU0+MRHVwukE2NohxgrjD6EJnHi8fRDq/sw5YiT4MEqJT5zgIMdNLjdNVwnjcQvsKNWb4ZSDvetTk0UBIfvqXOvizSym8cjXyrNuEmyQSWONS0/PHWXXr+P2B+qd8JE7ykW91VwRDPbU6Or5XTeSQnewsHwVoflA12M4dJUN9pg2+yZiOpFTTAR3gVsTEI+IIc+lFq+3Zc2y+FD49BlBAcAUDtfcF8bYgfsgV2nKeMsal/4TlpehcrUBpymGunk=
Content-ID: <E2577D6BAF38EB478D84266ECD56D1CD@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7360fdcc-96c8-4660-28de-08d6fbb4f989
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 10:40:02.0673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3209
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/5] make: simplify setting HOST{CC/CXX}
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "Ian.Jackson@eu.citrix.com" <Ian.Jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDYuMjAxOSAxMjoxNSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIEZyaSwg
SnVuIDI4LCAyMDE5IGF0IDA5OjI5OjUzQU0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4g
ICA+Pj4gT24gMjYuMDYuMTkgYXQgMTU6NTUsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6
DQo+PiAgID4gLS0tIGEvQ29uZmlnLm1rDQo+PiAgID4gKysrIGIvQ29uZmlnLm1rDQo+PiAgID4g
QEAgLTM5LDIyICszOSwxMiBAQCBERVNURElSICAgICA/PSAvDQo+PiAgID4gICMgQWxsb3cgcGhv
bnkgYXR0cmlidXRlIHRvIGJlIGxpc3RlZCBhcyBkZXBlbmRlbmN5IHJhdGhlciB0aGFuIGZha2UN
Cj4+IHRhcmdldA0KPj4gICA+ICAuUEhPTlk6IC5waG9ueQ0KPj4gICA+DQo+PiAgID4gLSMgSWYg
d2UgYXJlIG5vdCBjcm9zcy1jb21waWxpbmcsIGRlZmF1bHQgSE9TVEN7Qy9YWH0gdG8gQ3tDL1hY
fQ0KPj4gICA+IC1pZmVxICgkKFhFTl9UQVJHRVRfQVJDSCksICQoWEVOX0NPTVBJTEVfQVJDSCkp
DQo+PiAgID4gLUhPU1RDQyA/PSAkKENDKQ0KPj4gICA+IC1IT1NUQ1hYID89ICQoQ1hYKQ0KPj4g
ICA+IC1lbmRpZg0KPj4gICA+IC0NCj4+ICAgPiAgIyBVc2UgQ2xhbmcvTExWTSBpbnN0ZWFkIG9m
IEdDQz8NCj4+ICAgPiAgY2xhbmcgPz0gbg0KPj4gICA+ICBpZmVxICgkKGNsYW5nKSxuKQ0KPj4g
ICA+ICBnY2MgOj0geQ0KPj4gICA+IC1IT1NUQ0MgPz0gZ2NjDQo+PiAgID4gLUhPU1RDWFggPz0g
ZysrDQo+PiAgID4gIGVsc2UNCj4+ICAgPiAgZ2NjIDo9IG4NCj4+ICAgPiAtSE9TVENDID89IGNs
YW5nDQo+PiAgID4gLUhPU1RDWFggPz0gY2xhbmcrKw0KPj4gICA+ICBlbmRpZg0KPj4NCj4+IFRo
ZSBpbmNsdXNpb24gcG9pbnQgbGVhZGluZyB0byBjb25maWcvU3RkR05VLm1rIHNpdHMgYmVsb3cN
Cj4+IGhlcmUgYWZhaWN0LCBzbyBJIGRvbid0IHNlZSBob3cgLi4uDQo+Pg0KPj4gICA+IC0tLSBh
L2NvbmZpZy9TdGRHTlUubWsNCj4+ICAgPiArKysgYi9jb25maWcvU3RkR05VLm1rDQo+PiAgID4g
QEAgLTksNiArOSwxMCBAQCBDQyAgICAgICAgPz0gJChDUk9TU19DT01QSUxFKWdjYw0KPj4gICA+
ICBDWFggICAgICAgPz0gJChDUk9TU19DT01QSUxFKWcrKw0KPj4gICA+ICBMRF9MVE8gICAgPz0g
JChDUk9TU19DT01QSUxFKWxkDQo+PiAgID4gIGVuZGlmDQo+PiAgID4gKw0KPj4gICA+ICtIT1NU
Q0MgICAgPz0gJChDQykNCj4+ICAgPiArSE9TVENYWCAgID89ICQoQ1hYKQ0KPj4NCj4+IC4uLiB0
aGVzZSBhcmUgZXZlcnkgZ29pbmcgdG8gdGFrZSBlZmZlY3QgLSB0aGUgdHdvIHZhcmlhYmxlcyBh
cmVuJ3QNCj4+IHVuc2V0IGFueW1vcmUgYXQgdGhhdCBwb2ludC4NCj4gDQo+IEknbSBub3Qgc3Vy
ZSBJIGZvbGxvdywgYWZ0ZXIgdGhpcyBjaGFuZ2UgdGhlIG9ubHkgcGxhY2Ugd2hlcmUNCj4gSE9T
VHtDQy9DWFh9IGFyZSBzZXQgaXMgaW4gU3RkR05VLm1rLCBzbyB0aG9zZSB2YXJpYWJsZXMgd291
bGQgYmUNCj4gdW5zZXQgdW5sZXNzIHRoZXkgYXJlIHNldCBpbiB0aGUgZW52aXJvbm1lbnQuDQoN
Ck9oLCBJJ20gc29ycnkgLSB0aGUgZmlyc3QgcGFpciBiZWluZyBhIHJlbW92YWwgb2YgbGluZXMg
SSB0b29rIGl0IHRoYXQNCnRoZSAybmQgYW5kIDNyZCBwYWlycyB3b3VsZCBiZSBhZGRpdGlvbnMs
IHdoZW4gY2xlYXJseSB0aGV5J3JlDQpyZW1vdmFscyB0b28uIEknbSBzb3JyeSBmb3IgdGhlIG5v
aXNlIGhlcmUuDQoNCj4+IEZ1cnRoZXJtb3JlLCB3aGVuIENST1NTX0NPTVBJTEUNCj4+IGlzIG5v
dCBlbXB0eSwgdGhpcyBpcyBjZXJ0YWlubHkgbm90IHdoYXQgd2Ugd2FudC4NCj4gDQo+IFRCSCBJ
IHdvdWxkIGxpa2Ugc29tZSBndWlkZWxpbmVzIGFib3V0IGhvdyBDUk9TU19DT01QSUxFIGlzIHN1
cHBvc2VkDQo+IHRvIGJlIHVzZWQuDQoNCkl0IG5ldmVyIGhhdmluZyBiZWVuIHNwZWxsZWQgb3V0
LCBJIGd1ZXNzIGl0J3MgZG93biB0byB0aGUgdmFyaW91cyBmbGF2b3JzDQpwZW9wbGUgbWlnaHQg
YmUgdXNpbmcuIEZvciBtZSBwZXJzb25hbGx5IENST1NTX0NPTVBJTEUgaXNuJ3QgZmxleGlibGUN
CmVub3VnaCBhbnl3YXksIHNvIEkgaGF2ZSB0byBmdXJ0aGVyIGFsdGVyIGl0IGluIGEgbG9jYWwg
cGF0Y2ggSSBjYXJyeSAodG8NCmFjY29tbW9kYXRlIGZvciBzdWZmaXhlcyBvbiB0aGUgY29tbWFu
ZCBuYW1lcyBhbG9uZ3NpZGUgcHJlZml4ZXMpLg0KDQo+IEkgYWdyZWUgdGhlIGFib3ZlIGlzIG5v
dCB2ZXJ5IG5pY2Ugd2hlbiBDUk9TU19DT01QSUxFIGlzIHNldC4gV2hhdA0KPiBhYm91dCBzb21l
dGhpbmcgbGlrZToNCj4gDQo+IGlmZXEgKCQoY2xhbmcpLHkpDQo+IENDICAgICAgICA/PSBjbGFu
Zw0KPiBDWFggICAgICAgPz0gY2xhbmcrKw0KPiBMRF9MVE8gICAgPz0gbGx2bS1sZA0KPiBIT1NU
Q0MgICAgPz0gJChDQykNCj4gSE9TVENYWCAgID89ICQoQ1hYKQ0KPiBDQyAgICAgICAgID0gJChD
Uk9TU19DT01QSUxFKSQoQ0MpDQo+IENYWCAgICAgICAgPSAkKENST1NTX0NPTVBJTEUpJChDWFgp
DQo+IExEX0xUTyAgICAgPSAkKENST1NTX0NPTVBJTEUpJChMRF9MVE8pDQo+IGVsc2UNCj4gWy4u
Ll0NCj4gDQo+IFRoYXQgd291bGQga2VlcCB0aGUgY3VycmVudCBiZWhhdmlvdXIgb2Ygc2V0dGlu
ZyBDQz1nY2MNCj4gQ1JPU1NfQ09NUElMRT1hcm0tbGludXgtZ251ZWFiaS0sIHdoaWNoIG15IHBy
ZXZpb3VzIGFwcHJvYWNoIGRpZG4ndC4NCg0KSG1tLCB5ZXMsIHRoaXMgbWlnaHQgd29yayBmb3Ig
bWFueSBjYXNlcy4gKFRoZSBDQy9DWFgvTERfTFRPIGxpbmVzIHRoZW4NCndvdWxkbid0IG5lZWQg
dG8gYmUgaW5zaWRlIHRoZSBpZmVxKCkgYW55bW9yZSwgdGhvdWdoLikNCg0KSG93ZXZlciwgY29u
c2lkZXIgdGhpcyBpbnZvY2F0aW9uLCB3aGljaCBJIHVzZSBmb3IgcHJlLXB1c2ggYnVpbGQgY2hl
Y2tzDQpvbiBhIDMyLWJpdCBob3N0Og0KDQptYWtlIC1zQyBidWlsZC94ZW4vJHYge1hFTl9UQVJH
RVRfQVJDSCx0fT14ODZfNjQgQ0M9Z2NjeCBMRD1sZHggT0JKQ09QWT1vYmpjb3B5eCBOTT1ubXgg
LWozMiB4ZW4NCg0KVGhlICJ0IiBlbnZpcm9ubWVudCB2YXJpYWJsZSBpcyB1c2VkIGJ5IGdjY3gg
KHdoaWNoIGlzIGEgc2hlbGwgc2NyaXB0KS4NClRoYXQgc2FtZSBzaGVsbCBzY3JpcHQgd291bGQg
dGhlbiBnZXQgaW52b2tlZCBmb3IgdXNlcyBvZiAkKEhPU1RDQyksDQphbmQgd3JvbmdseSB0cnkg
dG8gYnVpbGQgYSA2NC1iaXQgb2JqZWN0L2JpbmFyeS4gSSdtIGFmcmFpZCBpdCBpcyB3cm9uZw0K
aW4gZ2VuZXJhbCB0byBkZXJpdmUgSE9TVENDIGZyb20gQ0MuDQoNCkphbg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
