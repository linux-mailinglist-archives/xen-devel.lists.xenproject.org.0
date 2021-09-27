Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2705541919A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 11:37:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196599.349511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUn3P-0004wj-D2; Mon, 27 Sep 2021 09:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196599.349511; Mon, 27 Sep 2021 09:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUn3P-0004um-7m; Mon, 27 Sep 2021 09:36:07 +0000
Received: by outflank-mailman (input) for mailman id 196599;
 Mon, 27 Sep 2021 09:36:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1Nw=OR=epam.com=prvs=9904516479=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mUn3N-0004ug-JO
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 09:36:05 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b642832-e845-424d-a1b0-e3c521a4dc3d;
 Mon, 27 Sep 2021 09:36:03 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18R9SnBp027392;
 Mon, 27 Sep 2021 09:36:00 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bbbbv80t4-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 09:35:59 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6881.eurprd03.prod.outlook.com (2603:10a6:20b:286::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 09:35:57 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 09:35:57 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2b642832-e845-424d-a1b0-e3c521a4dc3d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aX8I/J6PVdXLbESHY0Fvd6iLkbYllXXvRUSP8GuBSBVKPwGe39WpYK9vaSBITPJf0BWO1ZyF7qt4KiJviqiOFi3jxju+ttFvOJdHxhey/L/DItTpPIomKmAvjhqRoKUBcxccfDPr/4NoxKuuEHjLfhx5tQm0MxKEdEsfUMPDFs00IbQh5yh/jU+ir+Vmlax5uiJBZtJmwk1RAeYJKyQ2qYnoLmU+Mf7cwrvup5dxXBXqu5wiBeJSGdeAJdzK32nRFNvA6nESE4/g2BkerqoiXYz/puaejIBloKC+dPlBCHi4f7VH9dw9p3vyfD0KEVL5R2j7Dal2E7wvGZdyi5eY3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Gs2RrZQw62BoiJU6muXMOsnGwUgDw4TtrzVC3chvwr0=;
 b=capUWAQCEN+79BAkyeSOinKioDb8iyc7CNScrYjNFj7GQ/OnDVi/Q9TLMsivinTv6mVTLPWFE/r2QYLWLilDTJJ76dUb7Ns1Mt05T5e+KCuTxCNB/6ZmjeqbrSF38EOnijekop58fUwjfCCxEQw0MouDGl+o5PYvq6WBcboaYQ+8HZrQ39/asc1LEBVeHR5qC/r5ALswrnBJIsyiWE5+ErccIxr1FFk1WMGlCCkyoXADfPeevgTsdOdc8pIVISpxKICOt4poTLzHJaAhXEhn+Mf6s4QVzsJH2MYc1AbF5UBONZNd5KqyNTgsH+ZyuFD8i4xqGBswkw7KBD+MH5+GMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gs2RrZQw62BoiJU6muXMOsnGwUgDw4TtrzVC3chvwr0=;
 b=J5sC+PJB3ryDHnlsTSSEb4A+UK/NMOYX5AzhxeMsYLfP2VLAqX38iMk/x3PLHP6x+pouWFu8gfh1CDvtmEdAMuLJbHtzH/FM+LZv60/sfhS8PTqmMwH7GyCD0siKocpMcopHHL08jre27PjtQ6lrfCS/JnpruWGGJBVmtGwB34T8HB2PnLcWTH1exV0wjd8R0WfcKteh7F0JrG5Zv2p+yMonz1dXhw9dWiVQfoysU5oyLuQucfqKc79CHyk/H2H/kcEjTEEreDCv848EtCB9wRPG2fWatZOj+h3yVvtqNz0WIx4uEc2p/qnl8DqsM2ZwYWNl07RPytby/p7tiOIi+g==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
Thread-Topic: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
Thread-Index: AQHXsHoyHtx3VKSfZEKPQekyrs7GEau3hnIAgAAQrICAAAldgIAABLUA
Date: Mon, 27 Sep 2021 09:35:57 +0000
Message-ID: <23ae58de-6bd0-b299-a7d9-e6433d1b0689@epam.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-6-andr2000@gmail.com>
 <443f57db-7b0d-e14a-88bb-78a31c0271d6@suse.com>
 <55beed13-3a7f-7269-870c-ee0361e23a1c@epam.com>
 <7b093c2f-33cf-ac9d-9583-f0d8b2bb4f48@suse.com>
In-Reply-To: <7b093c2f-33cf-ac9d-9583-f0d8b2bb4f48@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ae5f236-e73b-45fc-b3f4-08d9819a3593
x-ms-traffictypediagnostic: AM9PR03MB6881:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB688156CFB0B119DFCDCC80C1E7A79@AM9PR03MB6881.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7b4l0kO97BzaoPvW5RQWQOXuG1HszzkcmtiwHKhu2EUF43eGinMIW36zeh+SdE1cwecYRXd9vkagJ02sR+Wmhoggj4pvIhl5Jn3xYIhdryfLlwj133d1sw8EW6UWkJl9EwksoXq/aBSgDEetKfPO81gi7h46B748N/hs916cgXj86ZDIQ47rzeWm2Imw5dIe/qae3Z/CfZ/dx91hN0UIZo+pfaRuXqU75j+dfD7I8fks4DrBnWWz1zf3m/rYmbG9U1/ZZ4iGOy1EmkGuRkeltQDSmHTimu6FE8LufPJgCtnptYRFObZ0LZ/HwoSY4Sr4m5BGo3z2Sy9/Wh0YABxQgnd3Pa1D6qIyxBL+a5EG7GjH994uiP36jkIaomVXfBxpxHjR/YcVb6AKSiVir59qqbUdGw0zxXYeHNOuo21XGatGQQToXst9izrb+bWXCzittANZtA+DzYXcni6/kjmQpsyHWhNqzE6InmQdUknMVUOgzYk0Os3VurwbgrMrkShl/gXh0Bj6FmKa3f2wtaghpTAk8j3Jy2Nc8o2Rd2EJ4RFflIx4ZP7um7QiMrQhY8kWmjLgdAIiG53hR5lWaggljR3UKBucbi1wY8X4ndRtwlhYaX+v/5fcnrGco3nUujnii352rV/l9A0nFtHDdTisYQJlbSKFdauLGncFdywAe/O3//CMoTPv4wROq2nGf4EQqZit77rgba6n1py2m/JU6bl42wG6nZ5rA9whaoQVjWqp2x7J1yfCerADEY4VawY0
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(38100700002)(6512007)(55236004)(53546011)(54906003)(6506007)(508600001)(316002)(66946007)(4326008)(26005)(64756008)(6916009)(66446008)(2906002)(83380400001)(36756003)(66556008)(31686004)(107886003)(38070700005)(66476007)(8676002)(71200400001)(76116006)(2616005)(91956017)(186003)(122000001)(86362001)(5660300002)(8936002)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RzdVZXN2djZJSmRnRkxkajFXWjJ2NmNKdmhhYWVUVytXMnNtLzB2VC9mcjJJ?=
 =?utf-8?B?NUViYlgwUkdZcHZQa0xxZUFOdkF6SnVwNmdsWG40MS9ZS3NOQlFNRGFrcDFI?=
 =?utf-8?B?a2xEK1VlSHk2ZE1JZlBJTWdSbW11UHRjd0JhQkd3SE9VQ3p3U0QyekU5SUVs?=
 =?utf-8?B?VXdyS2p6YURUOGI3T1lRUGRTeHh1bTRKcE9XK1pDdkVPaUtxWGp6ejdZR2JX?=
 =?utf-8?B?RTJrV3k4STh6bkV3c1lwNS8rTnhWck56djdxWUhKbWNZZWpSYjNXUTl1bHA2?=
 =?utf-8?B?UXpNNlRVbXZ5SXhVQ0RRWXdqU0U3RXh3VHdybGZWWndZS3ZIUlRVRUNXUTZs?=
 =?utf-8?B?NTdtZlhPV1pQbEczUEQybTdYb3FwMmgreEt0S1pnWklDbmI5ekpXOHVUYXRM?=
 =?utf-8?B?ZGU1RDM5SzZxQjhmWkZjZnFSUGU4K3lPQUErS0o1RFRqNEovVnY1QlIwVEV5?=
 =?utf-8?B?Y3NkRzJuNG14d1orRUJPdE1WaERpT3dRMXoxd1RMQ1Q0SDFkaXh4WnJONTNu?=
 =?utf-8?B?NjlsVllIeHZnQzVlS3ZCY0ZJY0FUWkd2RWpWRnVTYzdKb2FBMkx1MTgzMFJ5?=
 =?utf-8?B?akU2bm1XS1A3TTM2dlVlNjNVOFlLeFF5TmZBTjNlYmJnRWZpdnRlejdZM1FG?=
 =?utf-8?B?bmZMdGI0WU1xZXhGRG56cXpiVGE2dDlFbUdjVVUyUnhBWC9ZWGNYUnRId1NZ?=
 =?utf-8?B?UENGUlhVZnY4bDJ2aW5SYWpuUXBoblBDWnBWVzlnaVAweHh2R1A1M2dMR282?=
 =?utf-8?B?UlpBMDAzc2hnM2tnL2Q3dHpXRjBKU0pWWStxaVZiQVd3QlhTbTRhOWpKcmto?=
 =?utf-8?B?N2VsdVZDYitXT3kzRmxPUTNUd2pZK0tEdGttcnRUbC9XNmdQT3JCVlVxQkhD?=
 =?utf-8?B?K2VFVE1HQ1ZtY1U5OVVlajk4RGdqMnJMRVk1OTVqVVZ2N1c3ZHo1RGt1VzI4?=
 =?utf-8?B?cVlrSGhaMG1scDRjOWZSTm5ZYW1LR0lLMC90MHBCQVl1WXUvU1QyQ0ltZ241?=
 =?utf-8?B?SFdzSzhRaDdqaUFVVmVWS2NjeVBQU0VQOGl0QVhhM1JVTHdMeDRRMkoxcksz?=
 =?utf-8?B?eGJlbmRiK0JYL1JNUDUvdkFaaWNIcW1qRUpXUVl2UVNvem9DeTFRZVQwOENC?=
 =?utf-8?B?ZG1adUJOYk1mV0lGU3Zvd3pVU2dIOU9OVW4xcTdnWlgxR2JlUFFHYysvc293?=
 =?utf-8?B?VGg0VDQrdFoyM3pmd3Y2d09TTDRhK2UyRStFWlpkM3kwSU1OSTk3VGg1QXFN?=
 =?utf-8?B?V0VQSVN4Nit2VkVOS0c2NnM3dDR5NGNad3A2ZmJsQkJ4MExyVk1QOVU1bUV4?=
 =?utf-8?B?blMrTFQ4cnZaRC9IOFNNZTJja01EbTVIWWEwOUVFMnBUU2hIaDl1eFlIdWlZ?=
 =?utf-8?B?NVg1b3QzUE9xeVRvbVNzdkdQblViUUxKMVBKaVFXUit3a21rUDFqNWlCb0Fr?=
 =?utf-8?B?U1VUUDRoaFNzQTZGWnd0T1FuWmJpYlRrSGdObUJvOTh2aTh0QlpaSmlkM1h0?=
 =?utf-8?B?Mnd0RzlMWUx5UHhVc08wOGJQeURWMjdUMmc2UEhsQmpqY1NXS0ZkcUFZZlB2?=
 =?utf-8?B?RDJjREhaZmVUWFowdllQV2YvSVRZSXZjZ1FqbnJUV0NzMDA2ajM1SHBQR0Vv?=
 =?utf-8?B?MGU0ZEdwWCsxTDA1SkREYi9FMzkrdzJQTklQaUdtWHlhTW4zaWpWa214TFo4?=
 =?utf-8?B?RGdxSElaNnNZODZ1Vis3WEc2bnVqZmZtQWJWWXZPN2xSQndaVWhxV3Ztd3B6?=
 =?utf-8?B?eEFyU0pVNnNvcDErUHArcEd0Y2tyV05ma0wzRFdDUTNMSnc4eVJ6djg2UXlJ?=
 =?utf-8?B?T2dpalZBZU5McFVpUnEwZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <601BA19700D6074FB288583A66A12386@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae5f236-e73b-45fc-b3f4-08d9819a3593
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 09:35:57.2250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T+4emmEbaeCeCZzD6W/vGdUdTXIgnB8TjIqDvJClAUDjeTcJI5f445WytfPnXSKHOkrf7XM40Gm30JEy1GfYq1gq0LnA3Eph55syL7am29ZGiICfzUSkeJ27BEXLy9c1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6881
X-Proofpoint-GUID: SfQMmFDMH63LHz5VjRPIg8AIspt2-63H
X-Proofpoint-ORIG-GUID: SfQMmFDMH63LHz5VjRPIg8AIspt2-63H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_03,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 adultscore=0 mlxlogscore=895 priorityscore=1501 suspectscore=0 spamscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109270066

DQpPbiAyNy4wOS4yMSAxMjoxOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI3LjA5LjIwMjEg
MTA6NDUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMjcuMDkuMjEgMTA6
NDUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIzLjA5LjIwMjEgMTQ6NTQsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9wY2kuYw0KPj4+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4+PiBA
QCAtMzI4LDYgKzMyOCw5IEBAIHN0YXRpYyBzdHJ1Y3QgcGNpX2RldiAqYWxsb2NfcGRldihzdHJ1
Y3QgcGNpX3NlZyAqcHNlZywgdTggYnVzLCB1OCBkZXZmbikNCj4+Pj4gICAgICAgICooKHU4Kikg
JnBkZXYtPmJ1cykgPSBidXM7DQo+Pj4+ICAgICAgICAqKCh1OCopICZwZGV2LT5kZXZmbikgPSBk
ZXZmbjsNCj4+Pj4gICAgICAgIHBkZXYtPmRvbWFpbiA9IE5VTEw7DQo+Pj4+ICsjaWZkZWYgQ09O
RklHX0FSTQ0KPj4+PiArICAgIHBjaV90b19kZXYocGRldiktPnR5cGUgPSBERVZfUENJOw0KPj4+
PiArI2VuZGlmDQo+Pj4gSSBoYXZlIHRvIGFkbWl0IHRoYXQgSSdtIG5vdCBoYXBweSBhYm91dCBu
ZXcgQ09ORklHXzxhcmNoPiBjb25kaXRpb25hbHMNCj4+PiBoZXJlLiBJJ2QgcHJlZmVyIHRvIHNl
ZSB0aGlzIGRvbmUgYnkgYSBuZXcgYXJjaCBoZWxwZXIsIHVubGVzcyB0aGVyZSBhcmUNCj4+PiBv
YnN0YWNsZXMgSSdtIG92ZXJsb29raW5nLg0KPj4gRG8geW91IG1lYW4gc29tZXRoaW5nIGxpa2Ug
YXJjaF9wY2lfYWxsb2NfcGRldihkZXYpPw0KPiBJJ2QgcmVjb21tZW5kIGFnYWluc3QgImFsbG9j
IiBpbiBpdHMgbmFtZTsgIm5ldyIgaW5zdGVhZCBtYXliZT8NCg0KSSBhbSBmaW5lIHdpdGggYXJj
aF9wY2lfbmV3X3BkZXYsIGJ1dCBhcmNoIHByZWZpeCBwb2ludHMgdG8gdGhlIGZhY3QgdGhhdA0K
DQp0aGlzIGlzIGp1c3QgYW4gYXJjaGl0ZWN0dXJlIHNwZWNpZmljIHBhcnQgb2YgdGhlIHBkZXYg
YWxsb2NhdGlvbiByYXRoZXIgdGhhbg0KDQphY3R1YWwgcGRldiBhbGxvY2F0aW9uIGl0c2VsZiwg
c28gd2l0aCB0aGlzIHJlc3BlY3QgYXJjaF9wY2lfYWxsb2NfcGRldiBzZWVtcw0KDQptb3JlIG5h
dHVyYWwgdG8gbWUuDQoNCj4NCj4+IElmIHNvLCB3aGVyZSBzaG91bGQgd2UgcHV0IHRoaXMgY2Fs
bD8gQXQgdGhlIHZlcnkgYmVnaW5uaW5nIG9mIGFsbG9jX3BkZXYNCj4+IG9yIGF0IHRoZSBib3R0
b20ganVzdCBiZWZvcmUgcmV0dXJuaW5nIGZyb20gYWxsb2NfcGRldj8NCj4gUmlnaHQgd2hlcmUg
eW91IGhhdmUgdGhlICNpZmRlZiByaWdodCBub3csIEkgd291bGQgc2F5IChzZXBhcmF0ZWQgYnkN
Cj4gYSBibGFuayBsaW5lKS4NCk9rDQo+DQo+IEphbg0KPg0KPg0KVGhhbmsgeW91LA0KDQpPbGVr
c2FuZHINCg==

