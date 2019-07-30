Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A22CC7A74A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 13:49:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsQae-00024f-VM; Tue, 30 Jul 2019 11:46:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsQad-00024P-Fo
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 11:46:47 +0000
X-Inumbo-ID: b49f0c41-b2bf-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b49f0c41-b2bf-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 11:46:45 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 11:46:42 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 11:44:21 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 11:44:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhRN986ifbX8SLHmV9BXSWJrrNktG4YgyR+nxWa90r+RyRxsnKyhs84CdjUmgmkj9Gdj0ptt94o0UyXlRI20ta9f5+B9n9kqv+1UYRiEIcuYr0w/36U5JMbkXP5Wbzr8FMvGQXaj91dEJa4hRMJBBk/+glgNndacdHeqqf2dvos7m/wHc6NsdfJjr0/olpwck/IZhMstUX2+2Y7Bhmpo2lMl8Q6353uqhA+cfyGNRLCOMX+KY12c7HsPRw3bNfzkQdq/8uKwfXZh1OtnVXaPkTmKF9dGii7Ho/WB4YfcHQGlKeaZw97kBbYtb+w7dqAWE4k6XEVbplnFVBOEBqPs4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXxu0tLnENErI66LtoaE0xgP04IeXtPwjWumElQVfEk=;
 b=GOFRUprQTSPYk4/outCmEnw8Zvi1zkrzrgAqLilV685K93EJNlKvBtp6SVL0JXflWvZfpvPNHYSKJWvMG8L8DFbq1ERpGr6agtA1OyWXs7PfgRqJAiEh0B/Z96DyVBk0Ba39akVQcdY7DSDonrzxy+G59tGBkYiER8eFJt4hSfka3wTjN7BEYlhGYa3b9WEt5NSIVA3rhLvO4HThTzsBHYsLil6OKpyYYMqxw9R3Nr+DSLdvUKJvQuenkh7B0xI8pbd2rauukRXlkKFP0QUWXCRCzs9+ES4MvsPNxH29zm49TpphvPtjY95ULxJm07s6Jv8OmCMGF2kjF0Qei0pdvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3155.namprd18.prod.outlook.com (10.255.136.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 11:44:20 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 11:44:20 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v3 10/10] xen/nodemask: Drop remaining
 refeces to linux
Thread-Index: AQHVRgkcjxSqKXtTJ0W5x85sbrI7FqbjDCYA
Date: Tue, 30 Jul 2019 11:44:20 +0000
Message-ID: <159f42a8-bd42-40c0-5fba-1184c1f3d019@suse.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
 <20190729121204.13559-11-andrew.cooper3@citrix.com>
In-Reply-To: <20190729121204.13559-11-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR03CA0101.eurprd03.prod.outlook.com
 (2603:10a6:10:72::42) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b482eb53-314e-4737-6b5b-08d714e34254
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3155; 
x-ms-traffictypediagnostic: BY5PR18MB3155:
x-microsoft-antispam-prvs: <BY5PR18MB3155E21926A820A3B75E8155B3DC0@BY5PR18MB3155.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(189003)(199004)(66476007)(66946007)(66556008)(64756008)(66446008)(558084003)(486006)(54906003)(71190400001)(71200400001)(31686004)(3846002)(8936002)(80792005)(478600001)(31696002)(4326008)(476003)(7736002)(66066001)(6246003)(14454004)(86362001)(6116002)(6916009)(6512007)(53546011)(446003)(186003)(53936002)(6436002)(8676002)(52116002)(2616005)(68736007)(102836004)(2906002)(36756003)(6486002)(5660300002)(99286004)(25786009)(26005)(305945005)(6506007)(386003)(316002)(76176011)(229853002)(81166006)(81156014)(256004)(11346002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3155;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HtKMU2MoB83qK4yydVlcBnlYVidiqH2jrdIcOY3vLOimu+er+OeLALVZiF2SDeSIk10hTMrW87RS5np231/qaFF5eBn5JAmJLSv/ZMLDQ/qbiyU7KKaOcFac4L9fKiQtfioQkmAJ95UtmtRknOho2kqn63G6ROPhz3CLG05P3swwVPYF/Cou74RRbjdMyQzNt1g5WUNlIbodlkWdJKVm4IDGGVVWRXCwbqcmJ/G5R+dA/aPOGGFuEYBJBFN2SZFXidnG94TpQ0nluvQgsqevMEvTftz89ySdI8HPH5+jHhTlL4X5ujOmbazyZOIpLAEZ71ZqqSryPg/t5u/7AsXVqATD4Kjglnq05ukOy0jjQEellxJpAiwvK+6VKYliU/qKTix9TTtwE4X+Duczv/m5d69r/LCjiDzIg6shjw+eDso=
Content-ID: <AE9BF9988C13E6408864E8F6613BD7FF@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b482eb53-314e-4737-6b5b-08d714e34254
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 11:44:20.2982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3155
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 10/10] xen/nodemask: Drop remaining
 refeces to linux
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAxNDoxMiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gVGhpcyBmaWxlIGhh
cyBub3cgZGl2ZXJnZWQgY29tcGxldGVseSBmcm9tIGl0cyBMaW51eCByb290cy4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoN
CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkkgZ3Vlc3MgdGhl
IHRpdGxlIHdhbnRzIHRvIHNheSAicmVmZXJlbmNlcyIuDQoNCkphbg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
