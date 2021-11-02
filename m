Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE0B4428CC
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 08:47:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219753.380725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhoVP-0000js-T7; Tue, 02 Nov 2021 07:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219753.380725; Tue, 02 Nov 2021 07:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhoVP-0000hB-Ps; Tue, 02 Nov 2021 07:46:51 +0000
Received: by outflank-mailman (input) for mailman id 219753;
 Tue, 02 Nov 2021 07:46:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8XNU=PV=epam.com=prvs=19406420d3=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mhoVN-0000h5-Sr
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 07:46:49 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c723417-85b8-408e-82f5-697c11a14d0f;
 Tue, 02 Nov 2021 07:46:48 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A27ONKM001152;
 Tue, 2 Nov 2021 07:46:42 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3c2yjbra8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 07:46:42 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3374.eurprd03.prod.outlook.com (2603:10a6:803:18::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Tue, 2 Nov
 2021 07:46:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 07:46:39 +0000
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
X-Inumbo-ID: 3c723417-85b8-408e-82f5-697c11a14d0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLKr56GaldDYVR8CEq5TyUBiML5e6amXzeNtzJ/hvOISzO2sLEmUepjHhYCr4GMEfOqh2ch2ssyRtoawoFCCsd948zaYUi8qwESDPqyXOhQzeIovoXgAPuhmKPeTl/IzjBBNOR2dA/ojfZbMZQlCttcyAFzPiA4VoDdygYu2svNUfb7wSkexBIMPqbzl4ddSW23d2tiJ7HxjscJEDthS3ebE8AIJSNE6XKrkIPsXt30KcLC7CoLBzMprA2xsxIQW7U1+GyYhvRzziYwj2O+zDBsOewub9YUl/GBHKntVtKT7iHjU0fnhWqyu2yEaqujCyS+l6h0roDtBaXIXyfTgvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHITBb+UTW++S1bOyK+dJtHcoo0ZAndTr/VBmTGE/zc=;
 b=cWbsgPSWqxCPv/Tt7YqbIrfmMFIpEXatXc5f2/bkKaMJoaIWwqMkbwajSRwwqfskeqcXagb9xJTuIAaZ6Jq4G0UHEVYnvVZInxCwqqiLhLnpci4S9WqOzvYFig6HkyF+vgj/SIRUdlGNW64fB6EArrx6Ypk+yKmfI8NRBR6tLES07oabhzfocX/DOksRKuK/qTXZaCCaKFeOruo1ljI37+L5mhvB2RbpnfjgQ1aBM7k3MqJF4QtHzbFsU3LlxSRALC1IoJIK5Si8DO49W0U+wFzjzSsZvm5qKj8jW+qIdOqltjqZWp57hOGPVJ8RD8qO2l0UCoVt6DPhI3VjxZzL3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHITBb+UTW++S1bOyK+dJtHcoo0ZAndTr/VBmTGE/zc=;
 b=KkiFyVaJdMh0c8zrW6+iRYI9koxE14VghzwObKUlVcRFSAq9qxMARh1YJ+wpWFOjnEtp0PVtbr0YUuNLx6OeexRYsN6UwZCXYTKexnFZ4toIecC9+SKncJMNS35VpwOYjKpXHtvGSNZ6Vd4UPS4ZwRMdNxAT/6v2ZZUyo9YVrZg70yzBahTieTv1RZblpwLM1LE8JkveAJrW7QL+4Yy4aZZwTyImtQn9t4G/YUgmTycwyVAaZSW0GY4EeMWMdpXfvBOKh76fOTHa3XuPk+Auq39QckvSroWVQEFP89i0ahd+ug8UVfs/R2CU/yHJTy85UyuVGuBI6q6QvB3OFv7jFA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Wei Chen <Wei.Chen@arm.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Thread-Topic: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Thread-Index: 
 AQHXyww6rKHs3LJru0q52eLUia+oNavnHBIAgAE3H4CAABhAgIAADTsAgAAb4gCAAB9PgIAA5K+AgASg3ICAAamVAIAAAnMA
Date: Tue, 2 Nov 2021 07:46:39 +0000
Message-ID: <eae1776e-79ea-e219-741d-632aeceeeb12@epam.com>
References: <20211027082533.1406015-1-andr2000@gmail.com>
 <cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
 <d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
 <YXqnS7iZUvokJby6@Air-de-Roger>
 <3206478e-f230-cd91-5de9-85ef6c251405@epam.com>
 <YXrJyLMiMxaNmFAs@Air-de-Roger>
 <5de6c2f1-ef5c-9d8c-4287-9b0e3ff08b34@epam.com>
 <YXuj4frtHIRuSgOO@Air-de-Roger>
 <0ba7aa82-40bc-c0d3-38a2-8c4d141d0afd@epam.com>
 <74ea74b7-d9e9-a030-753d-a1108cc244d0@arm.com>
In-Reply-To: <74ea74b7-d9e9-a030-753d-a1108cc244d0@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84851a54-6be8-4805-0dc3-08d99dd4e7b4
x-ms-traffictypediagnostic: VI1PR0302MB3374:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB3374EFDDD02A2581DCE84DD4E78B9@VI1PR0302MB3374.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MPc/bMc+lH6j4eVKHpYsz7/VwxVJiXOfblOJmGnm4dv+4Abbo+7DO2/ga2hBkZ5zPPfB76UyFqTofju8fJ0uMdIO4uVVmGBMJP4Juwg+BMGh8XtjZzPsMrZSatxwqfXa8cSjiHC3FgAq+cX5Z+KyP24VD+xrKd7sQANjXIDZ/IFarPWiGrifsnyR3A21OhwfVULErS1AF5oU78BjenaEvIuY5cn8ORRoaZdOvkGfqqqeCKllZ+xjZQyulFqhuBrVLuIc01vkxy94vbZbbNGoBVFjBxEGlSzPGuCiyeOQ1rVYdaFRfvgGseQDYc39HnANh8DdOm7A5gvQ5/BnzMvBUXmm81f/tYFAxj4ancYxtJ5QMLLo69w4SgVff/Q3yi8I0UjVE7usZ1BvbLIzZ5Uw4O9ktwqATr2YD7TaPehzMkyd4xiSUOcD+ix0XNI8VYj8IipIFHyp3wZsbL8QcD7yytf6SP8w2avA0k1aATQARD6oNb1vjCgtTiKoNqGO0D0YWSNCQRzg3JusfnvsEezsRaI6eda2UhNPjNrGlfla6dOITWTmTVxAyfwwIqwZF2Aa1fRSonBA3BqgcAgyEfi3+pwCiEmDmC9cqW3y6v8L/A5eufEKbF+Pv07GcYTnEaRFS+iIVENowLFOaMOPQ8F57l7Ar9ieVTvxGQlBSrYGW489UCjlpl9bCiidMMfSLoePU41gSUA9NhJLHM8Hac3SDjAmflnsrKGWrutcJyVa0FLWOIowbuK1DsoSe4q6jPum
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(110136005)(316002)(83380400001)(54906003)(6512007)(26005)(86362001)(53546011)(6506007)(31696002)(6486002)(2906002)(31686004)(186003)(38070700005)(8676002)(5660300002)(8936002)(2616005)(36756003)(66446008)(64756008)(66556008)(66476007)(4326008)(66946007)(76116006)(91956017)(122000001)(38100700002)(508600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aDQ1bnREaVp4akhwb1dwa1NObGwrSXNhWG9zT0Fyd2lhVkE1V1lXMFhaVkFF?=
 =?utf-8?B?S0RCQmhGYlZOK0RLYWp2QllBVnEzRXNRYTlMbVRFUEF1OWRpcjE0dUZHUzRH?=
 =?utf-8?B?c2ZyeitLK0dHYjhJaXVESVZtMGhrSUVxc3loclc0T0lYazYyN1ZrcnJOMVFi?=
 =?utf-8?B?aXdEaFFFWGZYYnNVek1JcW0rWDNiaU53RE1QUnZBRDJsMnhJVjVWcjlsR2tv?=
 =?utf-8?B?bmZMMTM3cGFvdjZOaVRXU29qRzE4cURBRXdubmVwelpHMnVsR0hEKzhkdjV2?=
 =?utf-8?B?ZmQyaWhWeGppZWYvVXVLcThhTS9XWlVUaGJFRXduN1RybUpKZWY2RWx3eEY2?=
 =?utf-8?B?aC9XOE0zYVBNZU1uS3U0VmxBRmdrUDVtQXZDdXExSllMUno0MUgrMTVNb013?=
 =?utf-8?B?YnB6MFZlVmFkWFlVdS9xVitpWDdrQ2tVMUhQL0lmR3Vza280bEFocTdmbjBa?=
 =?utf-8?B?UXFpc0ZBS2JTVFcrZ3VBeTEzOTBSc00rQ3BQdkN6cmxEQTVHTlh0dHdoK1Rj?=
 =?utf-8?B?RmdwdkI1RVdvU21JUE4zUGx5WnowYU15SVZUbUVqTnNCMUVCY2dXNDBlb3Iw?=
 =?utf-8?B?MGhhS29QS2NBQitMdnY4bU1RMW9USUY1Wncxa1BVTFAvS0toVmdBOHNJd2E0?=
 =?utf-8?B?Nk1YdVJ5MHpaNk5ZbElwMGtwbFRBRHVtdGpsZFF0alRBWU1zV055NXJtMzJt?=
 =?utf-8?B?TzZuR1cxeCtYM2YzVDAxb0tMMzJKNmtPOHNHcjlOTlpKaXNNOUFjdlNmM3lj?=
 =?utf-8?B?c2h5ZDBRaTdzWUxXMmRSRVlxdGJ4aEtTZVdkOVkrR0pxVDFQakE5MjNUTnB5?=
 =?utf-8?B?SXlnMUpIajl3VW9PMnZ0em16MGxjWWNlMVFEN2hsMUhua2t1RC9yMnloYXJs?=
 =?utf-8?B?YjZDZ3NxSVJaZDBpR2djVVlHazZQRzZrTlRrZEhwMWpYMXVoWHdXT2Q3djJz?=
 =?utf-8?B?RXNGVWFpRk1QSEo4ZDZST3RodzJxdk05dVBWMHFPRDBpTHlpS3EwTjB6eTlp?=
 =?utf-8?B?dUd0cndOV0o4K0VyK3NNMEVzSE55NVNHUklTQmZuTDc1ZS9RMWNYTFg1dGRO?=
 =?utf-8?B?NjVqMkR1UU83M1dIVjJSQnNQNE9DSHhrWmFWMUhYTGFxN0xSRHM1OWlTYlBV?=
 =?utf-8?B?S053R1FXczE1S3dsUnZNVG53Vy9iMUgzZUc1Z2ZhclNvdXNwOUFWRWhSeXFE?=
 =?utf-8?B?QWhwSVZ4N1J2QmJZeVBma2ZrekU4Qmt3cmtMYWdVeFRvdnNwSnlMVytTdW9H?=
 =?utf-8?B?QkVxa21qVUpjTktONFl3Wjd2NzNma2VkYnVqNWNPKzlqM1ZKN2R4cE15eWdu?=
 =?utf-8?B?WXdOSjFycE9ueWJJVnBvMWNOTFU1VUJpSlZtdjN1eVQ4MVZFTHMwQnZaU0ty?=
 =?utf-8?B?T25pcGZpWHd3RjBFS29qZlJmSUxteHlRV0xEblA0ZHdmU2lWYWhwK0ZSV2Zz?=
 =?utf-8?B?REE4clpUSjRTUUR3UHZjN1BqWXpXQ2VNWHFqd0hUTSthd3lGQmNkMnA1Zll4?=
 =?utf-8?B?dTZNdUtOc1dBVCtlNXY5QWZDb2VGZmRnUTNwRGREdnZ5czBudVNvRGVvWWdX?=
 =?utf-8?B?clNaR0pGOUdSRDdtWHN2SHFyRkltK2V5eFZvOEhWRXpTR1R6QUdnNmtIVW9D?=
 =?utf-8?B?N051bCtHZUJ3YS9GOWVibWt4OWhEMGlSbGorZGQvYXlQcXAwK2hFWUtOazJH?=
 =?utf-8?B?OVk1RnRQRGpzdXl5OEV3ZWU5NEQzdFdsTlBhRkdLeDByKzNXajdVTlV2T2la?=
 =?utf-8?B?VnQyMERyL0w1QXpjK0dUUGppTUJ4MVlBUjFuRENuOVErdzY5ektXb1FlbFRB?=
 =?utf-8?B?TjE2L0NnQlBacUp1UFdIZmFXNE9Tcis3d0kzTU80MHR1c21mN0dBckNIakVD?=
 =?utf-8?B?c25hM1FSU0JhNkt1V0hiWjRJcmxuT2xpM0k3V2JjUmd0bW1JTU5Cb1p3eWlE?=
 =?utf-8?B?UDIvU1o1MGFVd2lNQkRpSzhvWm8xL1M5SlZManRiZTFDc0RRekp1SDVjeU9O?=
 =?utf-8?B?ODB6MmtKVE1iQWFXRFh0Q1dUNVNNNk1pODNPNld3K29tUkhCYUNWQ3d5Nm12?=
 =?utf-8?B?WXVOSzZ4Q2lWelhEWWJ2TzdkWXRVbk5nOUIyOUtlZ0hzTFhsdmNYVWI3V1lt?=
 =?utf-8?B?M2t4dzB1THBQQVk0RjVVMGcrellWOStYS3Y1RVg1RWQyRW9OUmFHY3Z5RERw?=
 =?utf-8?B?aHZ1blJ5UUExclJPWks4emxOM0tvZFZ1S20xc3d0dXhMQjhHVWdiS3FEVHI0?=
 =?utf-8?B?b0tXODlXMnFRNGZyMVFpWnptTXYyaTJmWFB5L0JCaHNubkVrVUs5amJjRWRL?=
 =?utf-8?B?ZUl4QUdBSnl1V3RZcndtaXJGZ05Xa1ZoNW5rYmpGYTZvSm1ZdGd0Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C976850144BDB4BB609893F2739EBF2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84851a54-6be8-4805-0dc3-08d99dd4e7b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 07:46:39.4793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fTANblu2PCo3vv1jGezqTO39mU8QivkhyW9+CVUX0NBFhUrdcaKqh7R5Kqt7YHdNjQrPljkt95QgMR2oERB2A2PDKtS8ORaAzbZKc3N0rk2tgIW1jRvj0Sf0SOBM0LRl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3374
X-Proofpoint-GUID: OUXAm4Y13liNUeSdQxpeSX3wY8wmka3l
X-Proofpoint-ORIG-GUID: OUXAm4Y13liNUeSdQxpeSX3wY8wmka3l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_06,2021-11-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111020045

SGksDQoNCk9uIDAyLjExLjIxIDA5OjM3LCBXZWkgQ2hlbiB3cm90ZToNCj4gSGkgT2xla3NhbmRy
LA0KPg0KPiBPbiAyMDIxLzExLzEgMTQ6MTQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3Rl
Og0KPj4NCj4+DQo+PiBPbiAyOS4xMC4yMSAxMDozMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4+PiBPbiBUaHUsIE9jdCAyOCwgMjAyMSBhdCAwNTo1NToyNVBNICswMDAwLCBPbGVrc2FuZHIg
QW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4NCj4+Pj4gT24gMjguMTAuMjEgMTk6MDMsIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+PiBPbiBUaHUsIE9jdCAyOCwgMjAyMSBhdCAwMjoyMzoz
NFBNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAyOC4x
MC4yMSAxNjozNiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+Pj4gT24gVGh1LCBPY3Qg
MjgsIDIwMjEgYXQgMTI6MDk6MjNQTSArMDAwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3Jv
dGU6DQo+Pj4+Pj4+PiBIaSwgSnVsaWVuIQ0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IE9uIDI3LjEwLjIx
IDIwOjM1LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+Pj4+Pj4gSGkgT2xla3NhbmRyLA0KPj4+
Pj4+Pj4+DQo+Pj4+Pj4+Pj4gT24gMjcvMTAvMjAyMSAwOToyNSwgT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gd3JvdGU6DQo+Pj4+Pj4+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxv
bGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4g
V2hpbGUgaW4gdlBDSSBNTUlPIHRyYXAgaGFuZGxlcnMgZm9yIHRoZSBndWVzdCBQQ0kgaG9zdCBi
cmlkZ2UgaXQgaXMgbm90DQo+Pj4+Pj4+Pj4+IGVub3VnaCBmb3IgU0JERiB0cmFuc2xhdGlvbiB0
byBzaW1wbHkgY2FsbCBWUENJX0VDQU1fQkRGKGluZm8tPmdwYSkgYXMNCj4+Pj4+Pj4+Pj4gdGhl
IGJhc2UgYWRkcmVzcyBtYXkgbm90IGJlIGFsaWduZWQgaW4gdGhlIHdheSB0aGF0IHRoZSB0cmFu
c2xhdGlvbg0KPj4+Pj4+Pj4+PiBhbHdheXMgd29yay4gSWYgbm90IGFkanVzdGVkIHdpdGggcmVz
cGVjdCB0byB0aGUgYmFzZSBhZGRyZXNzIGl0IG1heSBub3QgYmUNCj4+Pj4+Pj4+Pj4gYWJsZSB0
byBwcm9wZXJseSBjb252ZXJ0IFNCREYgYW5kIGNyYXNoZXM6DQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+
Pj4+IChYRU4pIHZwY2lfbW1pb19yZWFkIDAwMDA6NjU6MWEuMCByZWcgOGJjIGdwYSBlNjVkMDhi
Yw0KPj4+Pj4+Pj4+IEkgY2FuJ3QgZmluZCBhIHByaW50aygpIHRoYXQgbWF5IG91dHB1dCB0aGlz
IG1lc3NhZ2UuIFdoZXJlIGRvZXMgdGhpcyBjb21lcyBmcm9tPw0KPj4+Pj4+Pj4gVGhhdCB3YXMg
YSBkZWJ1ZyBwcmludC4gSSBzaG91bGRuJ3QgaGF2ZSB1c2VkIHRoYXQgaW4gdGhlIHBhdGNoIGRl
c2NyaXB0aW9uLCBidXQNCj4+Pj4+Pj4+IHByb2JhYmx5IGFmdGVyICItLS0iIHRvIGJldHRlciBl
eHBsYWluIHdoYXQncyBoYXBwZW5pbmcNCj4+Pj4+Pj4+PiBBbnl3YXksIElJVUMgdGhlIGd1ZXN0
IHBoeXNpY2FsIGFkZHJlc3MgaXMgMHhlNjVkMDhiYyB3aGljaCwgaWYgSSBhbSBub3QgbWlzdGFr
ZW4sIGRvZXNuJ3QgYmVsb25nIHRvIHRoZSByYW5nZSBhZHZlcnRpc2VkIGZvciBHVUVTVF9WUENJ
X0VDQU0uDQo+Pj4+Pj4+PiBUaGlzIGlzIGZyb20gZG9tMCBJIGFtIHdvcmtpbmcgb24gbm93Lg0K
Pj4+Pj4+Pj4+IElNSE8sIHRoZSBzdGFjayB0cmFjZSBzaG91bGQgY29tZSBmcm9tIHVzcHRyZWFt
IFhlbiBvciBuZWVkIHNvbWUgaW5mb3JtYXRpb24gdG8gZXhwbGFpbiBob3cgdGhpcyB3YXMgcmVw
cm9kdWNlZC4NCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiAoWEVOKSBEYXRhIEFib3J0IFRyYXAuIFN5
bmRyb21lPTB4Ng0KPj4+Pj4+Pj4+PiAoWEVOKSBXYWxraW5nIEh5cGVydmlzb3IgVkEgMHg0Njdh
MjhiYyBvbiBDUFUwIHZpYSBUVEJSIDB4MDAwMDAwMDA0ODFkNTAwMA0KPj4+Pj4+Pj4+IEkgY2Fu
IHVuZGVyc3RuYWQgdGhhdCBpZiB3ZSBkb24ndCBzdWJzdHJhY3QgR1VFU1RfVlBDSV9FQ0FNLCB3
ZSB3b3VsZCAoaW4gdGhlb3J5KSBub3QgZ2V0IHRoZSBjb3JyZWN0IEJERi4gQnV0Li4uIEkgZG9u
J3QgdW5kZXJzdGFuZCBob3cgdGhpcyB3b3VsZCByZXN1bHQgdG8gYSBkYXRhIGFib3J0IGluIHRo
ZSBoeXBlcnZpc29yLg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gSW4gZmFjdCwgSSB0aGluayB0aGUg
dlBDSSBjb2RlIHNob3VsZCBiZSByZXNpbGllbnQgZW5vdWdoIHRvIG5vdCBjcmFzaCBpZiB3ZSBw
YXNzIHRoZSB3cm9uZyBCREYuDQo+Pj4+Pj4+PiBXZWxsLCB0aGVyZSBpcyBubyAoPykgZWFzeSB3
YXkgdG8gdmFsaWRhdGUgU0JERi4gQW5kIHRoaXMgY291bGQgYmUgYSBwcm9ibGVtIGlmIHdlIGhh
dmUgYSBtaXNiZWhhdmluZw0KPj4+Pj4+Pj4gZ3Vlc3Qgd2hpY2ggbWF5IGZvcmNlIFhlbiB0byBh
Y2Nlc3MgdGhlIG1lbW9yeSBiZXlvbmQgdGhhdCBvZiBQQ0kgaG9zdCBicmlkZ2UNCj4+Pj4+Pj4g
SG93IGNvdWxkIHRoYXQgYmU/IFRoZSBFQ0FNIHJlZ2lvbiBleHBvc2VkIHRvIHRoZSBndWVzdCB5
b3Ugc2hvdWxkIGJlDQo+Pj4+Pj4+IHRoZSBzYW1lIGFzIHRoZSBwaHlzaWNhbCBvbmUgZm9yIGRv
bTA/DQo+Pj4+Pj4gT2ssIEkgaGF2ZSBhIERlc2lnbndhcmUgUENJIGhpc3Qgd2hpY2ggaGFzIDIg
RUNBTSByZWdpb25zIChJIGFtIHN0YXJ0aW5nIHRvDQo+Pj4+Pj4gaW1wbGVtZW50IHRoZSBkcml2
ZXIgZm9yIGl0LCBzbyBJIGNhbiBiZSB3cm9uZyBoZXJlKToNCj4+Pj4+PiAtIFJvb3QgQ29tcGxl
eCBFQ0FNIGFyZWEgKCJkYmkiKSwgaXQgaXMgc29tZXRoaW5nIGxpa2UgMHgzMDAwIGJ5dGVzIGxv
bmcNCj4+Pj4+PiAtICJDbGllbnQiIEVDQU0gYXJlYSAoImNvbmZpZyIpDQo+Pj4+Pj4gU28gZnJv
bSBEb20wIFBPViB3ZSBoYXZlIDIgRUNBTSByZWdpb25zIGFuZCBmb3IgdGhlIGd1ZXN0DQo+Pj4+
Pj4gd2UgYWx3YXlzIGVtdWxhdGUgYSBzaW5nbGUgYmlnIHJlZ2lvbjoNCj4+Pj4+IFlvdSBuZWVk
IHN1cHBvcnQgZm9yIG11bHRpcGxlIEVDQU0gcmVnaW9ucy4gVGhhdCdzIGhvdyB3ZSBkbyBpdCBv
biB4ODYNCj4+Pj4+IFBWSCBkb20wLiBTZWUgcmVnaXN0ZXJfdnBjaV9tbWNmZ19oYW5kbGVyIGFu
ZCByZWxhdGVkIG1hY2hpbmVyeS4NCj4+Pj4gSXMgaXQgY29tbW9uIGZvciBhIFBDSSBob3N0IGJy
aWRnZSB0byBoYXZlIG11bHRpcGxlIEVDQU0gcmVnaW9ucz8NCj4+Pj4gQ3VycmVudGx5IG9uIEFy
bSB3ZSB3ZXJlIGFib3V0IHRvIHN1cHBvcnQgInBjaS1ob3N0LWVjYW0tZ2VuZXJpYyIgWzFdLA0K
Pj4+PiBlLmcuIGdlbmVyaWMgRUNBTSBob3N0IGJyaWRnZSB3aGljaCBub3JtYWxseSAoPykgaGFz
IGEgc2luZ2xlIEVDQU0NCj4+Pj4gcmVnaW9uIFsyXS4gQnV0IHRoZSBob3N0IGJyaWRnZSBJIHdh
bnQgdG8gc3VwcG9ydCBoYXMgbXVsdGlwbGUsIHNvDQo+Pj4+IHN0cmljdGx5IHNwZWFraW5nIGl0
IGlzIG5vdCB0aGUgb25lIHRoYXQgd2UgaW1wbGVtZW50Lg0KPj4+IEl0J3MgcG9zc2libGUgb24g
eDg2IHRvIGhhdmUgbXVsdGlwbGUgRUNBTSByZWdpb25zLCB3aGV0aGVyIHRoYXQgbWVhbnMNCj4+
PiBtdWx0aXBsZSBob3N0IGJyaWRnZXMsIG9yIGhvc3QgYnJpZGdlcyBoYXZpbmcgbXVsdGlwbGUg
RUNBTSByZWdpb25zIGlzDQo+Pj4gdW5rbm93biB0byBtZS4gSXQncyBhbGwgcmVwb3J0ZWQgaW4g
dGhlIE1DRkcgQUNQSSB0YWJsZSAoc2VlIFBDSQ0KPj4+IEZpcm13YXJlIGRvY3VtZW50IGZvciB0
aGUgZGV0YWlsZWQgZGVzY3JpcHRpb24gb2YgTUNGRykgdXNpbmcgdGhlDQo+Pj4gIkNvbmZpZ3Vy
YXRpb24gU3BhY2UgQmFzZSBBZGRyZXNzIEFsbG9jYXRpb24gU3RydWN0dXJlIiwgYW5kIHRoZXJl
IGNhbg0KPj4+IGJlIG11bHRpcGxlIG9mIHRob3NlIHN0cnVjdHVyZXMuDQo+PiBBcyB3ZSBhcmUg
Y3VycmVudGx5IHN1cHBvcnRpbmcgZ2VuZXJpYyBFQ0FNIGhvc3QgYnJpZGdlIHdoaWNoDQo+PiBo
YXMgYSBzaW5nbGUgRUNBTSByZWdpb24gSSB0aGluayB0aGUgZXhpc3RpbmcgY29kZSB3ZSBoYXZl
IGFuZA0KPj4gYWJvdXQgdG8gdXBzdHJlYW0gaXMgb2sgYXMgaXMgZm9yIG5vdy4NCj4+IEkgb3du
IGEgYnJpZGdlIHdoaWNoIGhhcyAyIEVDQU0gcmVnaW9ucywgc28gSSB3aWxsIHdvcmsgdG93YXJk
cw0KPj4gYWRkaW5nIGl0cyBzdXBwb3J0IHNvb24uDQo+Pj4NCj4+Pj4gQXJtIGZvbGtzLCBkbyB3
ZSB3YW50IHRoaXMgZ2VuZXJhbGl6YXRpb24gYXQgdGhpcyBtb21lbnQgdG8gYWxpZ24gd2l0aCB4
ODYNCj4+Pj4gd2l0aCB0aGlzIHJlc3BlY3Q/DQo+Pj4+DQo+Pj4+IFdlIGNhbiBsaXZlIHdpdGgg
dGhlIGN1cnJlbnQgYXBwcm9hY2ggYW5kIHdoZW4gSSBoYXZlIG15IGRyaXZlciBpbXBsZW1lbnRl
ZA0KPj4+PiBJIGNhbiBzZW5kIHBhdGNoZXMgdG8gbWFrZSB0aGF0IGdlbmVyYWxpemF0aW9uLg0K
Pj4+Pj4+IC8qDQo+Pj4+Pj4gwqDCoMKgIMKgKiAyNTYgTUIgaXMgcmVzZXJ2ZWQgZm9yIFZQQ0kg
Y29uZmlndXJhdGlvbiBzcGFjZSBiYXNlZCBvbiBjYWxjdWxhdGlvbg0KPj4+Pj4+IMKgwqDCoCDC
oCogMjU2IGJ1c2VzIHggMzIgZGV2aWNlcyB4IDggZnVuY3Rpb25zIHggNCBLQiA9IDI1NiBNQg0K
Pj4+Pj4+IMKgwqDCoCDCoCovDQo+Pj4+Pj4gI2RlZmluZSBHVUVTVF9WUENJX0VDQU1fQkFTRSB4
ZW5fbWtfdWxsb25nKDB4MTAwMDAwMDApDQo+Pj4+Pj4gI2RlZmluZSBHVUVTVF9WUENJX0VDQU1f
U0laRSB4ZW5fbWtfdWxsb25nKDB4MTAwMDAwMDApDQo+Pj4+Pj4NCj4+Pj4+PiBTbywgd2UgaGF2
ZSB0aGUgYmFzZSBhZGRyZXNzIGFuZCBzaXplIG9mIHRoZSBlbXVsYXRlZCBFQ0FNIHNwYWNlDQo+
Pj4+Pj4gbm90IGNvbm5lY3RlZCB0byB0aGUgcmVhbCBob3N0IGJyaWRnZQ0KPj4+Pj4+PiBBbmQg
Zm9yIGRvbVVzIHlvdSByZWFsbHkgbmVlZCB0byBmaXggdnBjaV97cmVhZCx3cml0ZX0gdG8gbm90
DQo+Pj4+Pj4+IHBhc3N0aHJvdWdoIGFjY2Vzc2VzIG5vdCBleHBsaWNpdGx5IGhhbmRsZWQuDQo+
Pj4+Pj4gRG8geW91IG1lYW4gdGhhdCB3ZSBuZWVkIHRvIHZhbGlkYXRlIFNCREZzIHRoZXJlPw0K
Pj4+Pj4+IFRoaXMgY2FuIGJlIHRyaWNreSBpZiB3ZSBoYXZlIGEgdXNlLWNhc2Ugd2hlbiBhIFBD
SSBkZXZpY2UgYmVpbmcNCj4+Pj4+PiBwYXNzZWQgdGhyb3VnaCBpZiBub3QgcHV0IGF0IDAwMDA6
MDA6MC4wLCBidXQgcmVxdWVzdGVkIHRvIGJlLCBmb3INCj4+Pj4+PiBleGFtcGxlLCAwMDAwOjBk
OjAuMC4gU28sIHdlIG5lZWQgdG8gZ28gb3ZlciB0aGUgbGlzdCBvZiB2aXJ0dWFsDQo+Pj4+Pj4g
ZGV2aWNlcyBhbmQgc2VlIGlmIFNCREYgdGhlIGd1ZXN0IGlzIHRyeWluZyB0byBhY2Nlc3MgaXMg
YSB2YWxpZCBTQkRGLg0KPj4+Pj4+IElzIHRoaXMgd2hhdCB5b3UgbWVhbj8NCj4+Pj4+IE5vLCB5
b3UgbmVlZCB0byBwcmV2ZW50IGFjY2Vzc2VzIHRvIHJlZ2lzdGVycyBub3QgZXhwbGljaXRseSBo
YW5kbGVkDQo+Pj4+PiBieSB2cGNpLiBJZTogZG8gbm90IGZvcndhcmQgdW5oYW5kbGVkIGFjY2Vz
c2VzIHRvDQo+Pj4+PiB2cGNpX3tyZWFkLHdyaWV9X2h3KS4NCj4+Pj4gSSBzZWUsIHNvIHRob3Nl
IHdoaWNoIGhhdmUgbm8gaGFuZGxlcnMgYXJlIG5vdCBwYXNzZWQgdG8gdGhlIGhhcmR3YXJlLg0K
Pj4+PiBJIG5lZWQgdG8gc2VlIGhvdyB0byBkbyB0aGF0DQo+Pj4gSW5kZWVkLiBXaXRob3V0IGZp
eGluZyB0aGF0IHBhc3N0aHJvdWdoIHRvIGRvbVVzIGlzIGNvbXBsZXRlbHkgdW5zYWZlLA0KPj4+
IGFzIHlvdSBhbGxvdyBkb21VcyBmdWxsIGFjY2VzcyB0byByZWdpc3RlcnMgbm90IGV4cGxpY2l0
bHkgaGFuZGxlZCBieQ0KPj4+IGN1cnJlbnQgdlBDSSBjb2RlLg0KPj4gV2VsbCwgbXkgdW5kZXJz
dGFuZGluZyBpczogd2UgY2FuIGxldCB0aGUgZ3Vlc3QgYWNjZXNzIHdoYXRldmVyDQo+PiByZWdp
c3RlcnMgaXQgd2FudHMgd2l0aCB0aGUgZm9sbG93aW5nIGV4Y2VwdGlvbnM6DQo+PiAtICJzcGVj
aWFsIiByZWdpc3RlcnMgd2UgYWxyZWFkeSB0cmFwIGluIHZQQ0ksIGUuZy4gY29tbWFuZCwgQkFS
cw0KPj4gLSB3ZSBtdXN0IG5vdCBsZXQgdGhlIGd1ZXN0IGdvIG91dCBvZiB0aGUgY29uZmlndXJh
dGlvbiBzcGFjZSBvZiBhDQo+PiBzcGVjaWZpYyBQQ0kgZGV2aWNlLCBlLmcuIHByZXZlbnQgaXQg
ZnJvbSBhY2Nlc3NpbmcgY29uZmlndXJhdGlvbg0KPj4gc3BhY2VzIG9mIG90aGVyIGRldmljZXMu
DQo+PiBUaGUgcmVzdCBhY2Nlc3NlcyBzZWVtIHRvIGJlIG9rIHRvIG1lIGFzIHdlIGRvIG5vdCBy
ZWFsbHkgd2FudDoNCj4+IC0gaGF2ZSBoYW5kbGVycyBhbmQgZW11bGF0ZSBhbGwgcG9zc2libGUg
cmVnaXN0ZXJzDQo+PiAtIHdlIGRvIG5vdCB3YW50IHRoZSBndWVzdCB0byBmYWlsIGlmIGl0IGFj
Y2Vzc2VzIGEgdmFsaWQgcmVnaXN0ZXIgd2hpY2gNCj4+IHdlIGRvIG5vdCBlbXVsYXRlLg0KPg0K
PiBJIGFtIHRyaW5nIHRvIHJldmlldyB5b3VyIHBhdGNoLCBwbGVhc2UgcG9pbnQgb3V0IGlmIHRo
ZXJlIGlzIGFueXRoaW5nDQo+IHdyb25nLiBJSVVDLCB2UENJIG9ubHkgZW11bGF0ZXMgc29tZSBy
ZWdpc3RlcnMsIGFuZCBmb3J3YXJkIHVuaGFuZGxlZA0KPiBhY2Nlc3NlcyB0byBwaHlzaWNhbCBk
ZXZpY2UgY29uZmlndXJhdGlvbiBzcGFjZSAoaWYgdGhlIGFjY2Vzc2VzIHBhc3NlZCB0aGUgdmFs
aWRhdGUuKT8NClJpZ2h0DQo+IERvZXMgdGhhdCBtYWtlIHRoZSBjb250ZXh0IGluY29uc2lzdGVu
dCBpbiBwaHlzaWNhbCBkZXZpY2UncyBjb25maWd1cmF0aW9uIHNwYWNlPyANCkl0IGlzIGFsd2F5
cyBjb25zaXN0ZW50IGZvciB0aGUgaGFyZHdhcmUgZG9tYWluIGFuZCBzb21lIHBhcnRzIG9mIGl0
IGFyZSBlbXVsYXRlZA0KZm9yIGd1ZXN0cw0KPiBGb3IgZXhhbXBsZSwgb25lIHJlZ2lzdGVyIGlu
IHBoeXNpY2FsIGRldmljZQ0KPiBjb25maWcgc3BhY2UgaXMgcmVsYXRlZCB0byBhbm90aGVyIHJl
Z2lzdGVyLiBCdXQgd2UganVzdCBlbXVsYXRlDQo+IG9ubHkgb25lIGluIHZQQ0k/DQpTbywgd2Ug
dHJhcCBmb3IgYWxsIGRvbWFpbnMgYW5kIGVtdWxhdGUgZm9yIGd1ZXN0cywgZS5nLiBoYXJkd2Fy
ZSBkb21haW4ncyB2aWV3IG9uIHRoZQ0KcmVnaXN0ZXJzIGlzIGNvbnNpc3RlbnQuIEZvciBndWVz
dHMgd2UgZW11bGF0ZToNCi0gUENJX0NPTU1BTkQgLSBub3QgdG8gYWxsb3cgSU5UeCBhcyB3ZSBk
byBub3Qgc3VwcG9ydCB0aGF0IG9uIEFybQ0KLSBCQVJzIC0gd2UgZW11bGF0ZSBndWVzdCdzIHZp
ZXcgb24gdGhlc2UgYWNjb3JkaW5nIHRvIHRoZSBtZW1vcnkgc3BhY2VzDQpvZiB0aGUgZW11bGF0
ZWQgaG9zdCBicmlkZ2UsIHNvIHRoZSByZWFsIEJBUnMgc3RpbGwgaGF2ZSBwaHlzaWNhbCB2YWx1
ZXMsIGJ1dA0KZ3Vlc3RzIHNlZSBlbXVsYXRlZCBvbmVzDQoNCkhvcGUgdGhpcyBoZWxwcw0KPg0K
Pg0KPj4+DQo+Pj4gUmVnYXJkcywgUm9nZXIuDQo+Pj4NCj4+IFRoYW5rcywNCj4+IE9sZWtzYW5k
cg0KPj4NCg==

