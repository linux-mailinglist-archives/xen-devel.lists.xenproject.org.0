Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2CD602E2
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 11:07:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjK9r-0006FU-0o; Fri, 05 Jul 2019 09:05:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hjK9p-0006FJ-6r
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 09:05:29 +0000
X-Inumbo-ID: 07dd3a46-9f04-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 07dd3a46-9f04-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 09:05:27 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  5 Jul 2019 09:05:19 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 5 Jul 2019 09:03:57 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 5 Jul 2019 09:03:57 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3267.namprd18.prod.outlook.com (10.255.138.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Fri, 5 Jul 2019 09:03:56 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.019; Fri, 5 Jul 2019
 09:03:56 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 4/5] xen/gnttab: Refactor gnttab_clear_flag() to be
 gnttab_clear_flags()
Thread-Index: AQHVMpzG2WxsxlTPpU+k4vEoqy7Qjaa7u+oA
Date: Fri, 5 Jul 2019 09:03:56 +0000
Message-ID: <07e6706f-9e8f-f1de-480a-0488c1d90f74@suse.com>
References: <1561109798-8744-5-git-send-email-andrew.cooper3@citrix.com>
 <20190704191449.22486-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190704191449.22486-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR09CA0036.eurprd09.prod.outlook.com
 (2603:10a6:10:a0::49) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47e301d3-b5f1-4a27-167c-08d70127b5a7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3267; 
x-ms-traffictypediagnostic: BY5PR18MB3267:
x-microsoft-antispam-prvs: <BY5PR18MB326798832CD83632F449D486B3F50@BY5PR18MB3267.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(189003)(199004)(5660300002)(71190400001)(71200400001)(4744005)(7736002)(2906002)(110136005)(54906003)(102836004)(4326008)(186003)(316002)(8936002)(31696002)(66446008)(64756008)(66556008)(66476007)(86362001)(66946007)(73956011)(14454004)(81166006)(486006)(81156014)(256004)(8676002)(305945005)(2616005)(11346002)(446003)(476003)(6116002)(3846002)(478600001)(76176011)(31686004)(99286004)(68736007)(53936002)(52116002)(6436002)(6512007)(6486002)(386003)(72206003)(66066001)(229853002)(53546011)(25786009)(6506007)(6246003)(80792005)(36756003)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3267;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UfzzYE218FGusLDDEyhQ7YBtTyyjogAwWw5qvSFV9t6ere5mefSlq8Py6GCUm1l1ZxxzdSGMQl/aMwaPHYYVGDyqOT+cliQg0gHNpPiVf33HeXH6Ljx/NJx+TbHulHhKOQu3WDamLF1WzBJo9+f3DlcVivWtz6UK3uk323t8TBUdo3cOwm5iV6B8+/ktIy+jvObcqC3Oz8iWd49TBP897D9iljx5YY3NNprIvppDTdgLbT2nIwzSyuD8xC4sj/miykYxUkBgwxJLrSpWnWeL26+HIWZz6uJA5GFPD7eXj0Jhst2L80hnYTmdYQZkZ/Y79an34oRvbU/pzCVDQ0mJSVKB+iBLJicX6qsJxJT2V+CodQfFXGKEqL1B2Li/1ibvC9w+uwTYHdyDBl/GF+rN7rhDtxw+Qx2Lz1T3y6+JEtQ=
Content-ID: <9A478C2575013049B0B0027F83186234@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e301d3-b5f1-4a27-167c-08d70127b5a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 09:03:56.3680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3267
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 4/5] xen/gnttab: Refactor
 gnttab_clear_flag() to be gnttab_clear_flags()
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
 Julien Grall <julien.grall@arm.com>,
 StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDcuMjAxOSAyMToxNCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gVG8gYWxsb3cgZm9y
IGZ1cnRoZXIgaW1wcm92ZW1lbnRzLCBpdCBpcyB1c2VmdWwgdG8gYmUgYWJsZSB0byBjbGVhciBt
b3JlIHRoYW4NCj4gYSBzaW5nbGUgZmxhZyBhdCBvbmNlLiAgUmV3b3JrIGdudHRhYl9jbGVhcl9m
bGFnKCkgaW50byBnbnR0YWJfY2xlYXJfZmxhZ3MoKQ0KPiB3aGljaCB0YWtlcyBhIGJpdG1hc2sg
cmF0aGVyIHRoYW4gYSBiaXQgbnVtYmVyLg0KPiANCj4gTm8gcHJhY3RpY2FsIGNoYW5nZSB5ZXQu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPg0KDQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
