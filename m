Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA26E443ED4
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 10:00:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220622.381953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miC7j-00038D-Va; Wed, 03 Nov 2021 08:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220622.381953; Wed, 03 Nov 2021 08:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miC7j-00036O-SE; Wed, 03 Nov 2021 08:59:59 +0000
Received: by outflank-mailman (input) for mailman id 220622;
 Wed, 03 Nov 2021 08:59:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UC4I=PW=epam.com=prvs=194164c520=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1miC7i-00036I-UG
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 08:59:58 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cd5da8a-ce97-466a-ad15-5b3791dbf6e5;
 Wed, 03 Nov 2021 08:59:57 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A38Q1DK029247;
 Wed, 3 Nov 2021 08:59:55 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3c3pwng4m5-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Nov 2021 08:59:55 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5796.eurprd03.prod.outlook.com (2603:10a6:208:156::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Wed, 3 Nov
 2021 08:59:52 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4669.011; Wed, 3 Nov 2021
 08:59:52 +0000
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
X-Inumbo-ID: 4cd5da8a-ce97-466a-ad15-5b3791dbf6e5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lq0naNXFMvwErvdwGYnZtHbRFRBqEZzLnF0JbRoQr2qNJfP5ULwk38LWFHqlvTDqje9gDYUZgj8aT84oUp6BN4mzIvkALIu3eq2VGbezc29ScuQd9jtnex1aMbKHtWcW7ZxTwI5lnufbcBg5POayUfIktERy0IMbb1Ux0qXA5vAXCZb/U80sqkYE8+NVRhgD45meUn7p9hc+MuIqofqjxnwAIC8jaWBfXRyrJnj1TKaAAkmmf52SikdX15OrvXnLJrdIAF64MhKOlPPV95WbYc154vRzRM+LsQG+DOM8NTFaOrjS9RLTF+5whsu2ZjNQotDaE6tj33QUWof6UYlBNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vf5AVhjAp6QbPQiqqwU+fUJP4Odh8MzRqHC2PNscXtQ=;
 b=jjeIn5De0M5muu+G/p7spbumQfXlqd74s1KA9uP3HwXBl7h1yx+xj8aXcI73iagliRujSbOldYvmVlm90ozxVImI0DjuoHOjwBdzYFW6eby2Xu/SbKlI4qm0ZQ+FBcdfS+qPyz4Tcq4met33a4T5nylmKwTFOS37h6pPeGp/DwzH1tpbi9Hq++IaIGRvQJD1ChBFuHOlH7SE3Pb6skI6AJQ0U7zeftZtm751JaBCxejrilU2LBxj6vh5fUA2M0ASYwL++hi9sJeHsB2CtwD7uPg8KnqPrlWnoeE2oRJP1gSm0u03hRbr4XqKGYQwXkvN8P5hMFejukMmjVOn3wXNAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vf5AVhjAp6QbPQiqqwU+fUJP4Odh8MzRqHC2PNscXtQ=;
 b=k+1Dl97rCd+30vROAPpC+oDwJyt3lPCqsL071ZRVyMAX5+bSzPwOEz4T9eEGne/Lb8v3j/CxzyfKfY1/h3Nwtwzu/LMYiwqeixwTrpHdXlrSgShQ3EwUhEjnsyTwVElwAI+J0/YJUHcREB7IZsdSWUrb6hSlxZ+TSyJFKZZAgL563X7H4eySTYfJiYl8rZ0fEhCeG5089dHZ3ikRbgBQ/4RVkuWiHKkUI9THfvhmzHwBqBY3BX1EBtnMcbaxpLJqeiTWIpXmHmhSn3ktsl1NMPvSYLLs3yVyFQQuWxybF6CHIubCUqtAdpPztT/fclgfvJgTWWnz8zP74h+3SvUFIQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "jbeulich@suse.com" <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH v3 10/11] vpci: Add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v3 10/11] vpci: Add initial support for virtual PCI bus
 topology
Thread-Index: AQHXtdAlOCu2AnkIOUC4Prsocox3sqvlTvCAgAw/FQCAACalgIAAAgiA
Date: Wed, 3 Nov 2021 08:59:52 +0000
Message-ID: <afe47397-a792-6b0c-0a89-b47c523e50d9@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-11-andr2000@gmail.com>
 <YXfng3PqDI6C4yxn@MacBook-Air-de-Roger.local>
 <52b1533d-4aeb-29be-2611-9b50adea3f73@epam.com>
 <YYJN028YTy92TLca@Air-de-Roger>
In-Reply-To: <YYJN028YTy92TLca@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28a3f6c0-c14c-4d8e-cf30-08d99ea84c61
x-ms-traffictypediagnostic: AM0PR03MB5796:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5796FF14D50D8F7C1BB30A29E78C9@AM0PR03MB5796.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QaNBXFC40pAIvuSiNmNhcY+prSwAfkoUAJoRUX42oOBMgO848fCJ/1H69qN0N972SCmMfHelNRk4FyRO51/aFUbjPpr5jBrUaoZOioeltcTpMbLoWfp1chai6eDXOeXSsb1cseraZ0WnGWB2vNm/FAQgFtK2hjyUbJtZGk0TwuKexYDFj8VA4ZmZetlIUT7I2MRBMm/UTf6ckPEGAIKcQPk43Q54CvlI9M1SxXxWmKcnvpdWeEn6xkksoFZvFIFTI1DOu+s9lRtHaXBq4wFEiB81gqsdefi7XP7101/ezUCu6EtJCspVEiS3e8YHOkJiTmrpI7fKPhpRr7/6fZbcbXEVWaXCvS9lz+okHZJpia9ZAJsCoryb3/S6CEseFarOPjtcPjAzSI/AqykunhQgljRGyzlMIP021TPqzrvCgka4ecOLu7L2Z4n3tUb8aHgJqglGjLpjcseFqq9acltizZMDiW4U7ObvWUFVIpfzU831DLIqO52pKlkQa1ABMLh6oQ1U0X+EQNPPe2cFWdLDOfr5mf1wF7HD7ELDKVbsLV6I6uYSbjJsefafqkmHgASZXUTcu9GHHDMR4el3texHRQUy7Hdtfqgqbk67RgDvWNe25DU3XkJy/DVuXbBRGlfTxT2o5xLg5p5nYuQKXCv4PhYHtsTVSEx618WwqujsJaUH6ko6v3jxqq0JayB2eIAejz+igizAXOkf1mNvfN9R4+lfyfCFcxkVLqJ3zGPWJXZz42XKknqaPHrSw+VpplCi
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(64756008)(31686004)(66446008)(38100700002)(122000001)(53546011)(83380400001)(6506007)(31696002)(186003)(66476007)(4326008)(5660300002)(508600001)(8936002)(66556008)(316002)(26005)(2906002)(91956017)(66946007)(76116006)(6512007)(2616005)(71200400001)(8676002)(36756003)(86362001)(6916009)(54906003)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NW1rSytaYUZlbjkrL2Nua0VEb2dNcDBOc2UrSkZjdytDODhxVW1ZWDBOakpZ?=
 =?utf-8?B?bFFFa3N6NDVNOHZvbGFpZmRNWkp2cUk0cktXT08yT0ZJcGJpV01lZmxTeHJ3?=
 =?utf-8?B?cFVLVVVlZ3pjQU1SdzVOeDRCSjdCeXF5RTFMcUJNWmlqcjFiS0U2K1N6UHhB?=
 =?utf-8?B?K0xDVkpUUnlNdGxwK3NRNFo2V2gwNXQxazk1TzcxZGl2U0Excm94ek51NXVa?=
 =?utf-8?B?eTFJeG41NXFrelFUVHR4b3JsVTZycHZVcDR4U21Hb2EyTHZRd1NjTkdXZ0RH?=
 =?utf-8?B?VnVGMm0yaTF5cjM3eWNVaStYNW43eXVhRTdZZ3RDOUxyTFIxNGNsdFkxS3hG?=
 =?utf-8?B?cDRITGYzYW9LVGRkM0lYVzNQV0JScnRGVlQyUHhPcVhLM1IxcEpZYTlURWFE?=
 =?utf-8?B?Ym54NlhZSnA2dVlVdHZDRkpDc3RVRG5XVGhkbVFyM0JYa1M0ai9wR0t1cW41?=
 =?utf-8?B?WCttMUJSdDJIMWQwakZmUTJkMkE5Vk5JbDBPOEpjWE4ySXpUY0xxaTZFNytj?=
 =?utf-8?B?a1F2S3p3eVZ2UStmZDFQWFFTVVgxMy91dnNvRVRiNTV0NmpQZzRQcWpMNmNS?=
 =?utf-8?B?VFN6ZDFkVFhiYUhKemZuN3UrWUdTTHBWTUZnQ3lzTTBmcmFQazZ2SlpUV1Yz?=
 =?utf-8?B?ekUwU1hPMXo3WVhJTk5aVWVhR1kxUUU0RGdDdTFIc1pvWjdBeDR3UHg3aXZE?=
 =?utf-8?B?ZzlNVWx0V3RPTGFYbGtJRlpOU0hFM0VIcENjRURlTjhuSUJVWVNtV1RHNTUz?=
 =?utf-8?B?UUZ4cXhObFlzbXhEdFFKNWRXemxjLzFsZU9PRWRvWnJCUkpNUmloYzFXZEVT?=
 =?utf-8?B?a0JCNHJXSkkwWnducEhrUTNHVUVCangzSTNEQVQ4WU9CY0UwS2QzQUcyM1V2?=
 =?utf-8?B?T1BlMEEzSmZkVmx4c3hBbE9kZGQvY2NPcFFsWXJPUXF1THlhL1pxdDBmdy9C?=
 =?utf-8?B?RUlNY3J6dHZrMlN5WDlqcGlRMjAvS3NVL0t0YjdBNVl4NjM3dk9EOEVPQzVp?=
 =?utf-8?B?Q3J0VVB1MGZwMHg5QXlGaUlXWDlyZit6dHN4RCtBbFFpQnJScUVBaHhWd1h2?=
 =?utf-8?B?ZUZlUWNFY2ZMd21yRS9aaGtrZHQ1UzNxcTNLM0lmT01Jb2d0TEU5SjNMd2hS?=
 =?utf-8?B?TWR5ZWc4cXA0TXY5cjlRODJTNHBZM1NkRkNFRU9TaEQ0Q0M4YnMrUG11OVV0?=
 =?utf-8?B?TThHNmRhWTVlc0p5UXhadmpoaWdKdEpQVW5LYU9lNUNDZVQzSEtvT0hVRHR4?=
 =?utf-8?B?TTFYWkxiNU11ODE4Vzl6OEhtZWZ2dExGUVI4N3RoNjZHYW4xbTZ1TlVVZGpY?=
 =?utf-8?B?NDNHTHZ1WVFVTVRURFZIQkt6TFdhMXUwcWhXUmZ6cDljMGErR0dDY0RUcTRR?=
 =?utf-8?B?MjZKTTBVY05oZW0vSWNnaVZRNUJpc3BTMHd4VGdrV0pPZG1tSVJEZkJxc1ZX?=
 =?utf-8?B?ZDdNRklhRnRVcmdSNUQ0TlVTRGZ0SDRHZFRYWnN3ZmVGMTFMWHV4YnFDTVR2?=
 =?utf-8?B?UTR1WVNla1cvRW9iVGxJUnl5a21NZXd3MzZaWW85VXp0ejNTMG5UT29VZVBP?=
 =?utf-8?B?NFAyVVVBeGVObVo1K2ltbjIvRzFzcDMvbGNFYjZMUmVvSUVTWG1NanFvaUJT?=
 =?utf-8?B?T09JNUxQUmxXMUdaTFBYTnBPZ054ZFlJSXpqU0U2NE12ZXpnSHNWNHR6NDN6?=
 =?utf-8?B?SjJvUllGY3lCWUFQVGRrdFI5dG4wTmNhK0J2R2g1Sk9rdGtaeTladGFpNDlq?=
 =?utf-8?B?UEh5YURhajRZaXRCKzRMcjRzdG1IOVVnTzlrcDY1ZXdZNWZEQjY2dTRBbURT?=
 =?utf-8?B?VWtkTVFEbTJhcENzSm9vc0o5Ky9iT0VObTRTa3VodmQ5VE5DbFVucmFCOVdN?=
 =?utf-8?B?SXJnTVRQaC9TS0xqa3RrZ3dGVUJ2NktUTW53TW14Q01RZjBYakVhOXFoR1Zu?=
 =?utf-8?B?akozeEhMQlhNVkNPazYvNkQ2RjZsK0NqTCtFekQyZGZFSmRTcUFuNkJpTmxh?=
 =?utf-8?B?bkhXZW9jb2JzdVdwNWoyY3pPZDE3R25ack1EQkZpRmlWcW1TeU8rcXhlaFdU?=
 =?utf-8?B?c3FWWE1QRm5Ed2xmcGhMZ21JQjhVVEFGTjdiL0VJc2FPWUxzU0JhOFoxOG52?=
 =?utf-8?B?MUZRT0VaQmk5TStjWUprVm1remhFNjZ0WHV1akp1MzJ6QkFONkZuMXUyWW5k?=
 =?utf-8?B?UDVURUxvN2oxVkcxZTdLNC94SyszQXJvd1RMYXVSUUV5YVhGN2JjL2J6VFhS?=
 =?utf-8?B?UDJMUUc4MGNZR0NrcEV0UmF6cnhnWk9LWVphR3p1L0NXUHZZa0d0NjFmU25k?=
 =?utf-8?B?TTd0TDJEbElDeTVSK1NPcExpcitEMGkrV2dqWmVjVzc3MkhNZlNaUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7304F6EF2A6234E8F8735BAB3984E85@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a3f6c0-c14c-4d8e-cf30-08d99ea84c61
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 08:59:52.1126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3YwpPxVvmI8rFbzKllBQYl8wUqo6dWUQr9/SMU+twW1UavFmUbrRgCm1IIUmzq5oAo80tl1p26prboc9ULMn+vjykoaNSICOSkNfW8bhnqpM4jMnfHE/DY//wZGty0k5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5796
X-Proofpoint-ORIG-GUID: qAn4a6BdHRSJpED2soRVAGbouhHIMVXX
X-Proofpoint-GUID: qAn4a6BdHRSJpED2soRVAGbouhHIMVXX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-03_02,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111030052

DQoNCk9uIDAzLjExLjIxIDEwOjUyLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBXZWQs
IE5vdiAwMywgMjAyMSBhdCAwNjozNDoxNkFNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IEhpLCBSb2dlcg0KPj4NCj4+IE9uIDI2LjEwLjIxIDE0OjMzLCBSb2dlciBQ
YXUgTW9ubsOpIHdyb3RlOg0KPj4+IE9uIFRodSwgU2VwIDMwLCAyMDIxIGF0IDEwOjUyOjIyQU0g
KzAzMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUveGVuL3BjaS5oIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oDQo+Pj4+IGluZGV4
IDQzYjhhMDgxNzA3Ni4uMzMwMzNhM2E4ZjhkIDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vaW5jbHVk
ZS94ZW4vcGNpLmgNCj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oDQo+Pj4+IEBAIC0x
MzcsNiArMTM3LDI0IEBAIHN0cnVjdCBwY2lfZGV2IHsNCj4+Pj4gICAgICAgIHN0cnVjdCB2cGNp
ICp2cGNpOw0KPj4+PiAgICB9Ow0KPj4+PiAgICANCj4+Pj4gKyNpZmRlZiBDT05GSUdfSEFTX1ZQ
Q0lfR1VFU1RfU1VQUE9SVA0KPj4+PiArc3RydWN0IHZwY2lfZGV2IHsNCj4+Pj4gKyAgICBzdHJ1
Y3QgbGlzdF9oZWFkIGxpc3Q7DQo+Pj4+ICsgICAgLyogUGh5c2ljYWwgUENJIGRldmljZSB0aGlz
IHZpcnR1YWwgZGV2aWNlIGlzIGNvbm5lY3RlZCB0by4gKi8NCj4+Pj4gKyAgICBjb25zdCBzdHJ1
Y3QgcGNpX2RldiAqcGRldjsNCj4+Pj4gKyAgICAvKiBWaXJ0dWFsIFNCREYgb2YgdGhlIGRldmlj
ZS4gKi8NCj4+Pj4gKyAgICB1bmlvbiB7DQo+Pj4+ICsgICAgICAgIHN0cnVjdCB7DQo+Pj4+ICsg
ICAgICAgICAgICB1aW50OF90IGRldmZuOw0KPj4+PiArICAgICAgICAgICAgdWludDhfdCBidXM7
DQo+Pj4+ICsgICAgICAgICAgICB1aW50MTZfdCBzZWc7DQo+Pj4+ICsgICAgICAgIH07DQo+Pj4+
ICsgICAgICAgIHBjaV9zYmRmX3Qgc2JkZjsNCj4+Pj4gKyAgICB9Ow0KPj4+PiArICAgIHN0cnVj
dCBkb21haW4gKmRvbWFpbjsNCj4+Pj4gK307DQo+Pj4+ICsjZW5kaWYNCj4+PiBJIHdvbmRlciB3
aGV0aGVyIHRoaXMgaXMgc3RyaWN0bHkgbmVlZGVkLiBXb24ndCBpdCBiZSBlbm91Z2ggdG8gc3Rv
cmUNCj4+PiB0aGUgdmlydHVhbCAoaWU6IGd1ZXN0KSBzYmRmIGluc2lkZSB0aGUgZXhpc3Rpbmcg
dnBjaSBzdHJ1Y3Q/DQo+Pj4NCj4+PiBJdCB3b3VsZCBhdm9pZCB0aGUgb3ZlcmhlYWQgb2YgdGhl
IHRyYW5zbGF0aW9uIHlvdSBkbyBmcm9tIHBkZXYgLT4NCj4+PiB2ZGV2LCBhbmQgdGhlcmUgZG9l
c24ndCBzZWVtIHRvIGJlIGFueXRoaW5nIHJlbGV2YW50IHN0b3JlZCBpbg0KPj4+IHZwY2lfZGV2
IGFwYXJ0IGZyb20gdGhlIHZpcnR1YWwgc2JkZi4NCj4+IFRMO0RSIEl0IHNlZW1zIGl0IG1pZ2h0
IGJlIG5lZWRlZCBmcm9tIHBlcmZvcm1hbmNlIFBPVi4gSWYgbm90IGltcGxlbWVudGVkDQo+PiBm
b3IgZXZlcnkgTU1JTyB0cmFwIHdlIHVzZSBhIGdsb2JhbCBQQ0kgbG9jaywgZS5nLiBwY2lkZXZz
X3tsb2NrfHVubG9ja30uDQo+PiBOb3RlOiBwY2lkZXZzJyBsb2NrIGlzIGEgcmVjdXJzaXZlIGxv
Y2sNCj4+DQo+PiBUaGVyZSBhcmUgMiBzb3VyY2VzIG9mIGFjY2VzcyB0byB2aXJ0dWFsIGRldmlj
ZXM6DQo+PiAxLiBEdXJpbmcgaW5pdGlhbGl6YXRpb24gd2hlbiB3ZSBhZGQsIGFzc2lnbiBvciBk
ZS1hc3NpZ24gYSBQQ0kgZGV2aWNlDQo+PiAyLiBBdCBydW4tdGltZSB3aGVuIHdlIHRyYXAgY29u
ZmlndXJhdGlvbiBzcGFjZSBhY2Nlc3MgYW5kIG5lZWQgdG8NCj4+IHRyYW5zbGF0ZSB2aXJ0dWFs
IFNCREYgaW50byBwaHlzaWNhbCBTQkRGDQo+PiAzLiBBdCBsZWFzdCBkZS1hc3NpZ24gY2FuIHJ1
biBjb25jdXJyZW50bHkgd2l0aCBNTUlPIGhhbmRsZXJzDQo+Pg0KPj4gTm93IGxldCdzIHNlZSB3
aGljaCBsb2NrcyBhcmUgaW4gdXNlIHdoaWxlIGRvaW5nIHRoYXQuDQo+Pg0KPj4gMS4gTm8gc3Ry
dWN0IHZwY2lfZGV2IGlzIHVzZWQuDQo+PiAxLjEuIFdlIHJlbW92ZSB0aGUgc3RydWN0dXJlIGFu
ZCBqdXN0IGFkZCBwZGV2LT52cGNpLT5ndWVzdF9zYmRmIGFzIHlvdSBzdWdnZXN0DQo+PiAxLjIu
IFRvIHByb3RlY3QgdmlydHVhbCBkZXZpY2VzIHdlIHVzZSBwY2lkZXZzX3tsb2NrfHVubG9ja30N
Cj4+IDEuMy4gTG9ja2luZyBoYXBwZW5zIG9uIHN5c3RlbSBsZXZlbA0KPj4NCj4+IDIuIHN0cnVj
dCB2cGNpX2RldiBpcyB1c2VkDQo+PiAyLjEuIFdlIGhhdmUgYSBwZXItZG9tYWluIGxvY2sgdmRl
dl9sb2NrDQo+PiAyLjIuIExvY2tpbmcgaGFwcGVucyBvbiBwZXIgZG9tYWluIGxldmVsDQo+Pg0K
Pj4gVG8gY29tcGFyZSB0aGUgdHdvOg0KPj4NCj4+IDEuIFdpdGhvdXQgdnBjaV9kZXYNCj4+IHBy
b3M6IG11Y2ggc2ltcGxlciBjb2RlDQo+PiBwcm9zL2NvbnM6IGdsb2JhbCBsb2NrIGlzIHVzZWQg
ZHVyaW5nIE1NSU8gaGFuZGxpbmcsIGJ1dCBpdCBpcyBhIHJlY3Vyc2l2ZSBsb2NrDQo+Pg0KPj4g
Mi4gV2l0aCB2cGNfZGV2DQo+PiBwcm9zOiBwZXItZG9tYWluIGxvY2tpbmcNCj4+IGNvbnM6IG1v
cmUgY29kZQ0KPj4NCj4+IEkgaGF2ZSBpbXBsZW1lbnRlZCB0aGUgdHdvIG1ldGhvZHMgYW5kIHdl
IG5lZWQgdG8gZGVjaWRlDQo+PiB3aGljaCByb3V0ZSB3ZSBnby4NCj4gV2UgY291bGQgYWx3YXlz
IHNlZSBhYm91dCBjb252ZXJ0aW5nIHRoZSBwY2lkZXZzIGxvY2sgaW50byBhIHJ3IG9uZSBpZg0K
PiBpdCB0dXJucyBvdXQgdGhlcmUncyB0b28gbXVjaCBjb250ZW50aW9uLiBQQ0kgY29uZmlnIHNw
YWNlIGFjY2Vzc2VzDQo+IHNob3VsZG4ndCBiZSB0aGF0IGNvbW1vbiBvciBwZXJmb3JtYW5jZSBj
cml0aWNhbCwgc28gaGF2aW5nIHNvbWUNCj4gY29udGVudGlvbiBtaWdodCBub3QgYmUgbm90aWNl
YWJsZS4NCj4NCj4gVEJIIEkgd291bGQgc3RhcnQgd2l0aCB0aGUgc2ltcGxlciBzb2x1dGlvbiAo
YWRkIGd1ZXN0X3NiZGYgYW5kIHVzZQ0KPiBwY2kgbG9jaykgYW5kIG1vdmUgdG8gc29tZXRoaW5n
IG1vcmUgY29tcGxleCBvbmNlIGlzc3VlcyBhcmUNCj4gaWRlbnRpZmllZC4NCk9rLCB0aGUgY29k
ZSBpcyBpbmRlZWQgd2F5IHNpbXBsZXIgd2l0aCBndWVzdF9zYmRmIGFuZCBwY2kgbG9jaw0KU28s
IEknbGwgdXNlIHRoaXMgYXBwcm9hY2ggZm9yIG5vdw0KPg0KPiBSZWdhcmRzLCBSb2dlci4NClRo
YW5rIHlvdSwNCk9sZWtzYW5kcg==

