Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDCC65B86
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2019 18:27:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlbs9-00078C-8b; Thu, 11 Jul 2019 16:24:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hlbs7-000787-1o
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2019 16:24:39 +0000
X-Inumbo-ID: 5fb349ce-a3f8-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5fb349ce-a3f8-11e9-8980-bc764e045a96;
 Thu, 11 Jul 2019 16:24:36 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 11 Jul 2019 16:24:33 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 11 Jul 2019 16:00:10 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 11 Jul 2019 16:00:10 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2906.namprd18.prod.outlook.com (20.179.49.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Thu, 11 Jul 2019 16:00:09 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.008; Thu, 11 Jul 2019
 16:00:09 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/smpboot: Remove redundant order calculations
Thread-Index: AQHVOABORM2zNMzYhU+psQNUAv9yyabFk2kA
Date: Thu, 11 Jul 2019 16:00:09 +0000
Message-ID: <9929b0f6-5812-51a2-30c4-a84e1e164e96@suse.com>
References: <20190711154945.7322-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190711154945.7322-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CH2PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:610:4c::26) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [172.98.100.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75f4fb4c-9005-470c-6a36-08d70618d947
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2906; 
x-ms-traffictypediagnostic: DM6PR18MB2906:
x-microsoft-antispam-prvs: <DM6PR18MB290601C569ED32C782111B44B3F30@DM6PR18MB2906.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(189003)(199004)(51444003)(6116002)(66476007)(76176011)(3846002)(4326008)(6512007)(2906002)(256004)(6246003)(64756008)(52116002)(68736007)(66946007)(6436002)(66446008)(6486002)(53936002)(31686004)(229853002)(99286004)(80792005)(81166006)(316002)(476003)(7736002)(11346002)(4744005)(66066001)(446003)(14444005)(8676002)(71200400001)(8936002)(486006)(26005)(71190400001)(6506007)(110136005)(54906003)(31696002)(478600001)(25786009)(36756003)(186003)(386003)(53546011)(5660300002)(81156014)(102836004)(14454004)(86362001)(66556008)(305945005)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2906;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UuOv4gqcM4fBQTZ2ELa05cZSAmb6WF41duExQ4UMxtci8aGX+RDNV4CSTfpdA5hggQj8AAD2FgOJhIu8BHgaLEiC++JaVtsLumrLbP8TJOpPWaEnVNSEWjW3H4+VcTb7xPoWY85NzmwrJ/bDlUZ0Lfc27owLodYHTyxtNrisIqrwqNGlbP8iMvW2NdyZ8+Eo2wfPtsaOj/4NT2n3RkP0/P7qQTZLaE67xQrtXAON7g/BsslNJXn/D7zcTgZL3MnsNIPW7OBCfFeGhVJz3KNHBNp6amSmZlCN7ZXb/LwNkKsSZncWCGJL4972K/JcqNh7cqimJ14s6bjQtF2NVjtpYQMcFV4/005KK+Aq2pidO9RQ8yOY/it2ria8oCy/3gESW1L0y6yvCbYXJ3dbsbot4B3v3UA3HCJPyAIc7MvNvbE=
Content-ID: <7226F03108786B49B26B99B14AE3F842@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f4fb4c-9005-470c-6a36-08d70618d947
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 16:00:09.2841 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2906
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/smpboot: Remove redundant order
 calculations
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
Cc: Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDcuMjAxOSAxNzo0OSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gVGhlIEdEVCBhbmQg
SURUIGFsbG9jYXRpb25zIGFyZSBhbGwgb3JkZXIgMCwgYW5kIG5vdCBnb2luZyB0byBjaGFuZ2Uu
DQo+IA0KPiBVc2UgYW4gZXhwbGljaXQgMCwgaW5zdGVhZCBvZiBjYWxsaW5nIGdldF9vcmRlcl9m
cm9tX3BhZ2VzKCkuICBUaGlzDQo+IGFsbG93cyBmb3IgdGhlIHJlbW92YWwgb2YgdGhlICdvcmRl
cicgbG9jYWwgcGFyYW1ldGVyIGluIGJvdGgNCj4gY3B1X3NtcGJvb3Rfe2FsbG9jLGZyZWV9KCku
DQo+IA0KPiBXaGlsZSBtYWtpbmcgdGhpcyBhZGp1c3RtZW50LCByZWFycmFuZ2UgY3B1X3NtcGJv
b3RfZnJlZSgpIHRvIGZvbGQgdGhlDQo+IHR3byAiaWYgKCByZW1vdmUgKSIgY2xhdXNlcy4gIFRo
ZXJlIGlzIG5vIGV4cGxpY2l0IHJlcXVpcmVtZW50cyBmb3IgdGhlDQo+IG9yZGVyIG9mIGZyZWUo
KXMuDQo+IA0KPiBObyBwcmFjdGljYWwgY2hhbmdlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KV2hpbGUgSSB0aGluayB0
aGF0IGl0IHdhcyBhcHByb3ByaWF0ZSBmb3IgdGhlIGNvZGUgdG8gYmUgaW5kZXBlbmRlbnQNCm9m
IGFjdHVhbCAoYWxiZWl0IG5ldmVyIGNoYW5naW5nKSBzaXplcywgSSBoYXZlIHRvIGFncmVlIHRo
YXQgd2l0aA0KdGhlIGNvbnRleHQgc3dpdGNoIHNpZGUgY2hhbmdlIGluIGl0J3MgYmV0dGVyIHRv
IGJlIGNvbnNpc3RlbnQgaGVyZS4NCkhlbmNlIGRlc3BpdGUgbXkgc2xpZ2h0IGRpc2xpa2UNClJl
dmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkphbg0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
