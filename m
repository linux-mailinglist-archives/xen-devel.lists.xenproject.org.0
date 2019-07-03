Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A705E37F
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 14:09:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hie1C-0007Uw-RX; Wed, 03 Jul 2019 12:05:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hie1B-0007Up-6v
 for xen-devel@lists.xen.org; Wed, 03 Jul 2019 12:05:45 +0000
X-Inumbo-ID: e0768416-9d8a-11e9-b80b-a7abc525c0b6
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0768416-9d8a-11e9-b80b-a7abc525c0b6;
 Wed, 03 Jul 2019 12:05:43 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 12:05:40 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 12:00:55 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 12:00:55 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3426.namprd18.prod.outlook.com (10.255.136.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 12:00:54 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 12:00:54 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] x86/pv: Enable pv-l1tf mitigations for dom0 by default
Thread-Index: AQHVMZPLCn6Ezi5hZEmJfUyo2LJbi6a4ysCA
Date: Wed, 3 Jul 2019 12:00:54 +0000
Message-ID: <69257b19-5b42-9e08-3f5e-cd4b7289b204@suse.com>
References: <1548943164-24888-1-git-send-email-andrew.cooper3@citrix.com>
 <5C53054A0200007800212C98@prv1-mh.provo.novell.com>
 <f2777259-176d-ff46-5450-13ed6b9c5800@citrix.com>
 <5C5328590200007800212E7A@prv1-mh.provo.novell.com>
 <8e823487-3f3a-fc7e-4ffc-9bda20c3d5da@citrix.com>
 <5C53F7B0020000780021305B@prv1-mh.provo.novell.com>
 <ee4f96eb-d47a-6f2f-9963-7b3ae7f7e94c@citrix.com>
In-Reply-To: <ee4f96eb-d47a-6f2f-9963-7b3ae7f7e94c@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0601CA0009.eurprd06.prod.outlook.com
 (2603:10a6:4:7b::19) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 127b8eca-9331-4141-05f2-08d6ffae19e8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3426; 
x-ms-traffictypediagnostic: BY5PR18MB3426:
x-microsoft-antispam-prvs: <BY5PR18MB34269E50931F20D2A8C89F64B3FB0@BY5PR18MB3426.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(189003)(199004)(66476007)(386003)(53546011)(76176011)(52116002)(6436002)(72206003)(478600001)(6506007)(66946007)(102836004)(6486002)(64756008)(66446008)(99286004)(186003)(6116002)(26005)(6916009)(71190400001)(5660300002)(71200400001)(86362001)(3846002)(31696002)(80792005)(68736007)(6246003)(73956011)(66556008)(229853002)(4326008)(36756003)(25786009)(54906003)(6512007)(8676002)(305945005)(14454004)(53936002)(8936002)(446003)(11346002)(2906002)(14444005)(476003)(316002)(2616005)(486006)(7736002)(66066001)(81166006)(256004)(81156014)(31686004)(473944003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3426;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ddz4vWPydbBohHRRfaS6GVVE4yEwVGwy624DDxVqkjppb0IdTgsI4d+ySbozvPhddBi3u4A14RNSfOOL5eYa9aaQMaFAP54gN/Ha1oau5WvqxogMnPAe/tu36j1Xl+FiLrZvrzGJhwtLZlocoo/x5S8YgyzomfGoLBqTye3/pidbwK6Szgz0KO8qrgnXi6ym0dD3T7MRGcH3wdurA9g50G8NeeAyTvS6QrxDBGhJPYhbHnlTkrdzXJNPsQ/CXZagMMjCugVtq/gFEDa0DwSHN1LVdLtJppOut09/Ibd3S7lsyEVTGi3pSW9P801OJoj9mdc5xzUpIcguneVlH4g5VqAi77X8hRbUCwI1R4SoCdXgtQ0TW0n1KDEzIUjnxEbavfMNDWjGf8I5TXIxDeWz0mUbH9WTuazDVi6DsctnTGk=
Content-ID: <8F8AE8816138504AA39B9C48FCD3EAD3@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 127b8eca-9331-4141-05f2-08d6ffae19e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 12:00:54.6071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3426
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/pv: Enable pv-l1tf mitigations for dom0
 by default
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
Cc: Juergen Gross <JGross@suse.com>, Xen-devel <xen-devel@lists.xen.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMjAxOSAxMzozNywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDEvMDIvMjAx
OSAwNzozOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBCYXNpY2FsbHksIGlmIHlvdSd2ZSBn
b3QgYW4gdXBkYXRlZCBkb20wIGtlcm5lbCwgeW91J2xsIGJlIGZpbmUgZXZlbg0KPj4+Pj4gd2l0
aCB0aGlzIGRlZmF1bHQgZmxpcHBlZC4gIElmIHlvdSd2ZSBmb3Jnb3R0ZW4vbWlzc2VkIHRoYXQs
IHRoZW4geW91J3JlDQo+Pj4+PiBhbHJlYWR5IHdpZGUgb3BlbiAoaW4gYSBsYWNrIG9mIGRlZmVu
Y2UgaW4gZGVwdGggd2F5KSBhbmQgZmxpcHBpbmcgdGhlDQo+Pj4+PiBkZWZhdWx0IGhlcmUgd2ls
bCBtYWtlIHRoaW5ncyBibGluZGx5IG9idmlvdXMuDQo+Pj4+IFdlbGwsIGZvciBuZXcgdmVyc2lv
bnMgZmxpcHBpbmcgdGhlIGRlZmF1bHQgbWF5IGluZGVlZCBiZSBhY2NlcHRhYmxlDQo+Pj4+IGJh
c2VkIG9uIHRoaXMgYXJndW1lbnQuIEJ1dCBldmVuIHRoZW4gLSBhbmQgZXZlbiBtb3JlIHNvIGZv
ciBzdGFibGUNCj4+Pj4gdmVyc2lvbnMgLSB0aGUgY2hhbmdlIGluIGJlaGF2aW9yIG1heSBjb21l
IGFzIGEgc3VycHJpc2UgdG8gcGVvcGxlDQo+Pj4+IHdobyBoYXZlIHBlcmhhcHMgZXZlbiBkZWxp
YmVyYXRlbHkgY2hvc2VuIG5vdCB0byB1cGdyYWRlIHRoZWlyDQo+Pj4+IGtlcm5lbHMuDQo+Pj4g
SWYgaXQgd2VyZSBub3Qgd2l0aCB0aGUgaW5zdGFiaWxpdHksIFhTQS0yNzMgd291bGQgaGF2ZSBn
b25lIG91dCB3aXRoDQo+Pj4gdGhpcyBkZWZhdWx0Lg0KPj4gSSdtIG5vdCBzdXJlIHRoaXMgd291
bGQgaGF2ZSBiZWVuIHRoZSBjYXNlIC0gdGhlIGFyZ3VtZW50IG9mDQo+PiBhdm9pZGluZyBhIGhv
c3QgY3Jhc2ggd291bGQgc3RpbGwgaGF2ZSBiZWVuIG9uZSB0byBjb25zaWRlci4NCj4+IEkndmUg
anVzdCBjaGVja2VkLCBhbmQgSSBkaWQgYnJpbmcgdXAgdGhhdCBhc3BlY3QgYmFjayBhdCB0aGUN
Cj4+IHRpbWUgYWxyZWFkeSwgZXNwZWNpYWxseSBhbHNvIGZvciB0aGUgIVNIQURPV19QQUdJTkcg
Y2FzZQ0KPj4gKHdoZXJlIEkgYWxzbyBjb250aW51ZSB0byB0aGluayBpdCB3b3VsZCBiZSB3cm9u
ZyB0byBjcmFzaCB0aGUNCj4+IGhvc3QgYnkgZGVmYXVsdCksIGlycmVzcGVjdGl2ZSBvZiB3aGV0
aGVyIGFjdHVhbGx5IGJ1aWxkaW5nIHRoYXQNCj4+IHdheSBpcyBhIHZpYWJsZSBvcHRpb24gYXQg
dGhlIG1vbWVudC4NCj4gDQo+IEkga25vdyB3aGF0IHlvdSBzYWlkIGF0IHRoZSB0aW1lLCBhbmQg
cGVyaGFwcyBpdCBvdWdodCB0byBiZSB0ZWxsaW5nDQo+IHRoYXQgeW91IGRpZG4ndCBjaGFuZ2Ug
bXkgbWluZC4NCj4gDQo+IEl0IGlzIGZyYW5rbHkgZXhoYXVzdGluZyBoYXZpbmcgdGhpcyBhcmd1
bWVudCByZXBlYXRlZGx5LCBidXQgbXkNCj4gcG9zaXRpb24gaXMgbm90IGNoYW5naW5nLg0KDQpJ
IGNvdWxkIGJlIHNheWluZyB0aGUgc2FtZSwgYW5kIHRoZXJlIHdlJ2QgYmUgaW4gYW5vdGhlciBk
ZWFkIGVuZC4NCg0KPiBUbyBiZSBhYnNvbHV0ZWx5IGNsZWFyLCBJIHdvdWxkIGhhdmUgZ29uZSBh
cyBmYXIgYXMgbmFja2luZyBhbiBhdHRlbXB0DQo+IHRvIG1ha2UgaXQgbm90IHRoZSBkZWZhdWx0
LCBoYWQgaXQgbm90IGJlZW4gZm9yIHRoZSBpbnN0YWJpbGl0eSB3ZQ0KPiB1bHRpbWF0ZWx5IGZh
aWxlZCB0byBmaXggd2l0aGluIHRoZSBlbWJhcmdvIHdpbmRvdy4NCj4gDQo+IEFib3V0IH4xMDAl
IG9mIGRlcGxveW1lbnRzIHdoaWNoIGFyZSBnb2luZyB0byB0YWtlIHRoaXMgY2hhbmdlIHdpbGwg
aGF2ZQ0KPiBhIGZpeGVkIGRvbTAga2VybmVsLCBzbyB0aGlzIGlzIGEgbm8tb3AgaW4gdGVybXMg
b2YgYmVoYXZpb3VyLg0KDQpJIGRvbid0IGJ1eSB0aGlzIGFyZ3VtZW50LCBzZWVpbmcgaG93IGVz
cGVjaWFsbHkgbGFyZ2UgY3VzdG9tZXJzDQphcmUgcmF0aGVyIHNsb3cgaW4gYXBwbHlpbmcgdXBk
YXRlcyB0byB0aGVpciBzeXN0ZW1zLiBJIHNheSB0aGlzIGluDQpwYXJ0aWN1bGFyIGJlY2F1c2Ug
aW4gcHJpbmNpcGxlIHRoaXMgY2hhbmdlIGlzIGEgY2FuZGlkYXRlIGZvcg0KYmFja3BvcnRpbmcg
KHdoaWNoIHByaW9yIGRpc2N1c3Npb24gc2hvd3Mgd2UncmUgaW4gYWdyZWVtZW50IG9uKSwNCnll
dCB0aGVuIGl0IHdvdWxkbid0IGJlIGp1c3QgbmV3IGluc3RhbGxhdGlvbnMgb3IgcHJvcGVybHkg
dXBncmFkZWQNCm9uZXMgdGhhdCBtaWdodCBnZXQgdGhlIGNoYW5nZSBpbiBiZWhhdmlvci4gT25l
IGNvdWxkIG9ubHkgaG9wZSB0aGF0DQp0b2dldGhlciB3aXRoIGEgaHlwZXJ2aXNvciB1cGRhdGUg
cGVvcGxlIHdvdWxkIGFsc28gcHV0IGluIHBsYWNlIGFueQ0KYXZhaWxhYmxlIERvbTAga2VybmVs
IG9uZXMuDQoNCkkgaGFkIHRvIGRlYWwgd2l0aCBwZW9wbGUgYmVpbmcgcHV6emxlZCBhYm91dCB0
aGVpciBndWVzdHMgZ2V0dGluZw0KY3Jhc2hlZCwgZGVzcGl0ZSB0aGUgbG9nIGNsZWFybHkgc2F5
aW5nIHdoeS4gSSBkb24ndCBmYW5jeSBoYXZpbmcNCnRvIGRlYWwgd2l0aCBzaW1pbGFyIGhvc3Qt
d2lkZSBpc3N1ZXMuDQoNCj4gSG93ZXZlciwgd2UgcmVhbGx5IGRvIGhhdmUgcHJvZHVjdGlvbiBk
b3duc3RyZWFtIHVzZXJzIHdoZXJlIGRvbTANCj4gZG9lc24ndCBoYXZlIGNhcnRlIGJsYW5jaCBh
Y2Nlc3MgdG8gZ3Vlc3QgbWVtb3J5LCBhbmQgdGhlcmVmb3JlIHRoZSAiaXMNCj4gYWxsIHBvd2Vy
ZnVsIiBhcmd1bWVudCBpcyBmYWxzZS7CoCBGb3IgdGhvc2UgZGVwbG95bWVudHMsIHRoZSBjdXJy
ZW50DQo+IGRlZmF1bHQgaXMgYSBzZWN1cml0eSByaXNrLg0KPiANCj4gRG9tMCBpcyBub3Qgc3Vm
ZmljaWVudGx5IHNwZWNpYWwgdGhhdCB0aGUgcHYtbDF0ZiBkZWZhdWx0IHdhcnJhbnRzIGJlaW5n
DQo+IHRoZSBvZGQtZmVhdHVyZS1vdXQuDQoNCkknbSB3aWxsaW5nIHRvIGFjayB0aGlzIChvbiB0
aGUgYmFzaXMgdGhhdCB0aGlzIGlzIG92ZXJyaWRhYmxlIHZpYQ0KY29tbWFuZCBsaW5lIG9wdGlv
biksIHByb3ZpZGVkIHdlIGNhbiBzZXR0bGUgb24gb25lIG9mIHRoZSBhc3BlY3RzDQpJJ3ZlIG1l
bnRpb25lZCBiZWZvcmUgKHdoaWNoIG1heSByZXF1aXJlIGNoYW5nZXMgZWxzZXdoZXJlIHRoZW4p
Og0KDQoiPj4gQXMgdG8gY3Jhc2hpbmcsIHRoYXQgaXMgb25seSBpZiB5b3UgY29tcGlsZSBTSEFE
T1cgb3V0LCBhbmQgSSByZW1haW4gdG8NCiAgPj4gYmUgY29udmluY2VkIHRoYXQgY29tcGlsaW5n
IHNoYWRvdyBvdXQgb2YgWGVuIGlzIGEgdmlhYmxlIG9wdGlvbiBhdCB0aGUNCiAgPj4gbW9tZW50
Lg0KICA+IE9yIHNpbXBseSBydW5uaW5nIG91dCBvZiBtZW1vcnkuDQogIA0KICBTaGFkb3dzIGdl
dCByZWN5Y2xlZC4iDQoNCkkgZG9uJ3Qgc2VlIGhvdyByZWN5Y2xpbmcgaGVscHMgYXQgdGhlIHBv
aW50IHdoZXJlIHdlIHdhbnQgdG8gZW5hYmxlDQpzaGFkb3cgbW9kZSBvbiBEb20wLiBZZXQgSSBj
b250aW51ZSB0byB0aGluayB0aGF0IHN1Y2ggYSBjb25kaXRpb24NCihpbiBwYXJ0aWN1bGFyIGJl
Y2F1c2UgaXQncyBub3Qgc29tZXRoaW5nIGFueW9uZSB3b3VsZCBwcmVkaWN0IGNvdWxkDQpoYXBw
ZW4gYXQgYSBwYXJ0aWN1bGFyIHBvaW50IGluIHRpbWUpIHNob3VsZCBleHBsaWNpdGx5IG5vdCBi
ZSBmYXRhbA0KdG8gYSBob3N0Lg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
