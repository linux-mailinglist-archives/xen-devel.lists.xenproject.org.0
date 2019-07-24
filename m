Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 293CA72C66
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 12:36:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqEZu-0006b5-Nn; Wed, 24 Jul 2019 10:32:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9cpT=VV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqEZu-0006b0-1b
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 10:32:58 +0000
X-Inumbo-ID: 637c19c4-adfe-11e9-936e-fb16b51bc91f
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 637c19c4-adfe-11e9-936e-fb16b51bc91f;
 Wed, 24 Jul 2019 10:32:53 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 24 Jul 2019 10:32:42 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 24 Jul 2019 10:32:13 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 24 Jul 2019 10:32:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVo2GLZFNyu3j85gq7tG16ijTqXqtU/kuSufvAvbLNctI/m/nkpfxCgXQ5YpJZlh4TX+yPNv0EeQ+HyPZiAY4KFBON7JLYGO1Gx4crUHGjBNopeHjtGJpiCZZo1bCIyMVmJ2rMr6As0hrF/RJ8+3z7ZVIf25K2GdHOHpcSPWkD7pwHAukQWqWP1H8NhP2O8xFqDBZftO+LCS0uAc9jyLm32v8p7BTMxYTQoK38rl2VeaCYsTBxuddwe2uUk5aal/0qsnaLniaO5uBUXuXWBnr3dN3UgaVsKrra+Jc51LzPbW0xXxidWsUAj2wOh9RlsBiMyA3nznCMORWyLo8NPWIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9otGz6+aHTISs+J91N7XjXOZ3KC3tLehzwc98W10wo=;
 b=JNKodrmYk1WmJ9mQppGQBgDCmChwYARtGJXsKMo2y1Dp26nY3rCooWAG75rOIZ97DPdO6I5oGxU45zDmX6ttE3K0qEN/Ezbnx0DhMHKymigZKTGf535zBnNSYxsV+iZpCmi0tAQVFm0mhy6tZNRJDq1iKdoL9SQH1wtDhyg37WfworclqUcj9/zIkn9Wm8kFc3GbZ44NX6zlp+1UQlZmnETiT0RibE7KTKneaNkt79BsMAw8M+IF2dx+Q4mx0UtpLF9gh1vt20ndWR3/2743+yefe/01RAxSJ2fuQYo+VJxyeLDCFVgo2+hhAzL66u2ih4HsTZlr3jz9i5WUSoEz5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3409.namprd18.prod.outlook.com (10.255.139.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Wed, 24 Jul 2019 10:32:12 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 10:32:12 +0000
From: Jan Beulich <JBeulich@suse.com>
To: George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>
Thread-Topic: [Xen-devel] [PATCH v1 1/5] xen: sched: null: refactor core
 around vcpu_deassign()
Thread-Index: AQHVOyTYJ+LR9n2cjEqlpBUws/eRLqbZn8uA
Date: Wed, 24 Jul 2019 10:32:12 +0000
Message-ID: <90e866b9-86e4-6195-ef5f-c1497d5eba35@suse.com>
References: <153515586506.7407.8908626058440527641.stgit@Palanthas.fritz.box>
 <153515649785.7407.12930278485576636398.stgit@Palanthas.fritz.box>
 <f0acbdd3-200d-0c75-34aa-ab87b0c91f2a@citrix.com>
In-Reply-To: <f0acbdd3-200d-0c75-34aa-ab87b0c91f2a@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P191CA0009.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::19)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b21be70-f3f4-40cd-9476-08d71022305b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3409; 
x-ms-traffictypediagnostic: BY5PR18MB3409:
x-microsoft-antispam-prvs: <BY5PR18MB340995AD9955527F7C0DB7A3B3C60@BY5PR18MB3409.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(189003)(199004)(8676002)(99286004)(4326008)(305945005)(316002)(81166006)(66476007)(6246003)(64756008)(11346002)(6636002)(26005)(186003)(66556008)(476003)(66946007)(110136005)(81156014)(66446008)(54906003)(229853002)(446003)(14454004)(86362001)(7736002)(4744005)(256004)(5660300002)(31696002)(36756003)(486006)(66066001)(6512007)(68736007)(2906002)(6436002)(80792005)(53936002)(71200400001)(71190400001)(6486002)(102836004)(53546011)(6506007)(386003)(52116002)(478600001)(76176011)(2616005)(6116002)(25786009)(8936002)(3846002)(31686004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3409;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uuwk8flEC74RkgJLm73eZDyZTGAj1u/lHISvmuvZoWja8Mr+R2j/XPUAXORO0KU/uY4+tNZpyRRyWNIlepW1GeKvaxoh8rBRlDW8roQTDMiNPW9CvmlOfvrjj+C9rd7KgWAClWcDzaO4PucraYHnipSka+OEHCOWyX2AS2jbrHD8/0pSAoePBGMVkB2AfBcDVBkz7q3AfQi0McoyC0zQ98E3g+Xvd7HMDbeh57rCBdGSi2fLRZAbdaSDXznpMc3wdxfZwOHOYMNQqFmBMlE4RIiaLiG/x53Vf6RlcYBNVllZU/05hGOAXQLkNL3kElSbiXQwrc1k8eWO9ZKMx3sAikkvulWLBz3nQXNM+50AtQx4NzYT8tZwJtUmDNbyuimeTgmEGu/AXAvue0MkbgNcP1H+sFQyiOMywLmduBojmRE=
Content-ID: <036015DDCB62FC48B3C7931AE0E696EC@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b21be70-f3f4-40cd-9476-08d71022305b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 10:32:12.5623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3409
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v1 1/5] xen: sched: null: refactor core
 around vcpu_deassign()
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDcuMjAxOSAxNzo0NiwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4gT24gOC8yNS8xOCAx
OjIxIEFNLCBEYXJpbyBGYWdnaW9saSB3cm90ZToNCj4+IHZjcHVfZGVhc3NpZ24oKSBoYXMgb25s
eSBvbmUgY2FsbGVyOiBfdmNwdV9yZW1vdmUoKS4NCj4+IExldCdzIGNvbnNvbGlkYXRlIHRoZSB0
d28gZnVuY3Rpb25zIGludG8gb25lLg0KPj4NCj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVu
ZGVkLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3Vz
ZS5jb20+DQo+IA0KPiBBY2tlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRy
aXguY29tPg0KDQpJIHRob3VnaHQgSSdkIGFwcGx5IHRoaXMsIGJ1dCBJIGNhbid0IGZpbmQgdGhl
IG1haWwgaW4gbXkgbWFpbGJveA0KYW55bW9yZS4gQW5kIEknbSBub3Qgc3VycHJpc2VkLCBzZWVp
bmcgdGhlIGRhdGUgb2YgdGhlIG9yaWdpbmFsDQpwb3N0aW5nLiBTbyB1bmxlc3MgR2VvcmdlIHdh
bnRzIHRvIGFwcGx5IGl0LCBjb3VsZCBJIGFzayB5b3UsDQpEYXJpbywgdG8gcmVzZW5kPw0KDQpK
YW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
