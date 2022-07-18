Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E15578C91
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 23:16:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370121.601773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDY5q-00040V-G2; Mon, 18 Jul 2022 21:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370121.601773; Mon, 18 Jul 2022 21:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDY5q-0003xa-D4; Mon, 18 Jul 2022 21:15:54 +0000
Received: by outflank-mailman (input) for mailman id 370121;
 Mon, 18 Jul 2022 21:15:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e+2m=XX=epam.com=prvs=91983e950e=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1oDY5o-0003xU-UL
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 21:15:53 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc83e0d7-06de-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 23:15:51 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26IImA9Q005163;
 Mon, 18 Jul 2022 21:15:45 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3hcrm7v72d-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jul 2022 21:15:45 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by VI1PR03MB6288.eurprd03.prod.outlook.com (2603:10a6:800:134::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 21:15:42 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::3db3:dad:7bd7:4488]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::3db3:dad:7bd7:4488%7]) with mapi id 15.20.5417.035; Mon, 18 Jul 2022
 21:15:42 +0000
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
X-Inumbo-ID: cc83e0d7-06de-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOBvARjaHrV3kFe71EpnIPF63BTk02OQMSqRhEm/9mhND9KUnKZVyLrDfe+Qx48F53fZVI7qWgVjW6kEHLKalHeqhsWoSzWBQh3zoYBbXNBtjmV08r8TuII4DA/bLOM7J5ahL7SwNdOCmP1DLv8AUtPSF/0NH6SBY3wkoK/h3WhWiFBQ0B6kCoA6NcFPs41Ig02J7d+A64sqEoKdjI13zn0UXm516VNKsRttcaxV09bfNfhU3aOxJsRdfeBEE0MI1J4E9c0PAOq8EhPUExXhRZclXXDZzo2aVdzGSh5woMBCaA6bIHvHRfF0lIOj0QFY0xguM4w/K7tCFleGPYLAFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4aVJIa9/bhaGhacjrCd+o+XlsceCPV6UM3umTjKOTc=;
 b=n8qkOFGJQmMVVy6/LZvbhb0O+57XTg7pVSb57KZJWjUAJEUViTphNQpaAdw/y7iMqYR7U1fDtTEBi8fxB4zDF5REXYReMoIIu1OiDgjwInmXYM7gJ6RWpYRR3U2Cx3UqEiSUlAYSslEzRXuoogQHs9ON1hweC0MtyE0C7yc2xrA9JGHFWf/WqbIl9E0+N2rYO8ZvcczDrly8foiO65IQFHoXRYPgPmX10X+ThKHKUuaagKXqbbA9DVj6JbHDqisObYcXBphNwXXlyneNLlGuzciIXAEeXrCOQCqzPqCAmPJ/cMTf2lqa02knDcMlfCH7+/W2I5eR11kkZOxLXkSSBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4aVJIa9/bhaGhacjrCd+o+XlsceCPV6UM3umTjKOTc=;
 b=pLuqQgdYNZhHAHmIRlXCWNS3CQQBS5nHJxJz1tEUUk603gilKpLuCU4/X89r2H790gU+kBNmV72+OgNgfxo+vXFPJIZDFF5v2aAw/BffzXDgb/FR90iPUlJI+w9JVdVvCmPKfviNiTKi2+5ZUO9KqVRrCPANGR733SJ4fqr1rrao+pY21paHEcloIE7X70hZPVkL9EgArIcePZsMAnnmRDc2wp3OhgHeBJYv+21EfIIBu31lFgNR7+w3LnqQ2CArVWdL+HQeLd1I0biTuUUm7FM7anHkHkuDNXAgq69OCD1G7mpd0jYIeY9PVGyAus5vjfeh+SMhZ8pOGpN++XVWGQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/4] vpci: restrict unhandled read/write operations for
 guests
Thread-Topic: [PATCH v2 2/4] vpci: restrict unhandled read/write operations
 for guests
Thread-Index: AQHYmuuJ9rK3Yz1P9ESDEYkc1v52zw==
Date: Mon, 18 Jul 2022 21:15:42 +0000
Message-ID: <20220718211521.664729-3-volodymyr_babchuk@epam.com>
References: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.36.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c438cfa-7cae-43d5-c2c9-08da6902ac28
x-ms-traffictypediagnostic: VI1PR03MB6288:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0aRk/lKutfhDcHfnwhIMWg7jFqWqRhnFnjh8ea1V//kZgSesLkPYXPaAFBeqH+NreOmciL1gjH0ImHZ1LgssGVeBbAVL/hJj/20H0JHtxf1SZMXFOFMiysF3EU3CiPWLuZs5uyZjSINvDMylanO2z2zdHcNBAWvdnV1CR96Npwi3zYwZsVgmwD/OIJ9+8+KwCrtCYeSgy/xMjPHAooGiXUTedAr53LmuMGoEWyJ38/VzS0wUEdFPEoiho7VazuRQ6u3Q2gpVANGREsWdYF4e5JlW26IEttNoE4bMTQaaY47Q6unhWhZP6oBjekNnZCQN4RTCxMBqOkkR0ReMpzsvAiMXXtTIo5BOISzzla8V1Qt2vWL3i/0KcCZo5nDxnY9NgRKEXZmjZdrsii6e7jwrrdgXkaigF91CSG+SwaD70ZGCDkQuhvzE/PTKs9BYbTF7wVPYsr1iHw0328JX5bfqzO5enEZhzcRojU+bZgsT+UGnxXEHSxsPApMIa5t37LPxyjY1fJzEzf6xhFXGjbtA2urf9BXqgeHReaMo8aWcofgr8U/uMqp8mhDjtlwA4k7ZIqJlWZZYWw5v17qfKpOFBNq2IUwhXu50DLCikY18JFXjXeXEmhsRYzOTzS2RvY+JACw57YWJZnPxiI0hbEY+RGJ6dAV5wS5sUnH/bK6Z10x/aNjepzmwCs7gALZQumpawLGfMZadooQ5fkRET1IbkVErf8at6t+aSwTYMBCMdscbB3H69/zmNgHcVye9/LTY+VXQQhBYQZdihs9Owrb1s0TsUUeIN1KMdWrtoloYHFzzu+IJUrjj9/z2IO4E2bDL
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(2906002)(5660300002)(8936002)(36756003)(186003)(4326008)(86362001)(91956017)(64756008)(66946007)(66556008)(8676002)(66446008)(66476007)(76116006)(122000001)(6506007)(478600001)(316002)(2616005)(6512007)(6916009)(26005)(54906003)(6486002)(55236004)(1076003)(41300700001)(38070700005)(83380400001)(38100700002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RVpNRENYTmo1ZDJwUE9sdmtiQy9iSkI2N3dPSW02SUVuUGlpVjNVdDNadTZG?=
 =?utf-8?B?Ti9reXVIRXVwcFMrM2VPb0RjT255bGRCQjFHaHJLSlkvdm5iWVBibTk2SGtZ?=
 =?utf-8?B?NjVDT1AreUVMdWFIMlhUTE04UnV1SEc3SmNKWGlBTHNUZytDaU4vbXpKK2Zp?=
 =?utf-8?B?VWZSY1c3VEtCTkM1bVFTbnJNOEtZb0gzQW9BM0k2NHVqMVFJcWI1dUxrVDhp?=
 =?utf-8?B?a0pQOXpuNURqNjdGbGc1enZmRGt2MzM5Mk5JZVBhTS9hdDRUb2lNckFBRWRO?=
 =?utf-8?B?MXo0SEpEdXZUeFo4KzBJV2QvSVZtZTExbjVsR2ljcFRmM0tjTk8vYU9FQk5w?=
 =?utf-8?B?cDNIWUtqZFBqQlZWWFBTV3A0cjkwbHpyN0pWT3RyOHprNGZra1BlUURjZkZr?=
 =?utf-8?B?cTg1Q3hmakpxeXlaRmd4c29HMFhOZjVvNWEzb1M2TXQxSVFmd2tNaXBQdkF6?=
 =?utf-8?B?aGduWnYxVXQ4a01nbzlpbFp0SnJXUkNENUZtcUJHNTJaamdsVFV0WEVlcm5m?=
 =?utf-8?B?QktzZzIvN09SVVRNZ0k0eWQ0bWZCZHprSVh3aFpJNVg5NDFQUldGWWtQYnpm?=
 =?utf-8?B?SWhiOEpiN0JyOE9SRnNnKzQvNEJ2RnVCNEdncGtLeUxUTnVXbHpGZExDa3d3?=
 =?utf-8?B?d3JQWSttb25jQ204eFU0VmNFa0FkYkNHa2hCQ29Sa0JZQXViRUV5cjNKQjQz?=
 =?utf-8?B?elRwMXIxWHVTejdneCtUZFJUMFJRQzdSUG0xNTdYYTZFcnZoTTUxMCsxQ1Bj?=
 =?utf-8?B?TzZCTW5McFJtS1VkYVV4OWVQNjAzNVZsMGdpUWorREs2QlUvMzBZTTZwMFQy?=
 =?utf-8?B?YVUxRzM1VjhJcnIyVGtYbnBDZ0MzZVVJdzhNSnM1cmJSZ0lvUVJBTHZBeDFQ?=
 =?utf-8?B?UkE3ZVhLZkRUYlJjSG1GYkg1Qi9Ma2w1TWFVVlJ6UnJRZ3JrOEp6bzhjRFdY?=
 =?utf-8?B?LzBiNmpKcVNESUJ1OUFscURxRWNuUlloeDIyMDJ2OXhNamwyOUNoc1E5TlEx?=
 =?utf-8?B?S2RFdjBtaXRjY09YaEo2VlNLa0x1QW1vbUlnTEpuMHdhNHZlOEJQd2JRWDkv?=
 =?utf-8?B?OGtsNmhkbkxDSkpRWmw5U0UvdzFGN0J0RzFkd21JK3BsbDR3c1Z0eEtCNnVs?=
 =?utf-8?B?K1FOVFczbFI0RXU5MUcwckRKTm5ia2VpRXZSZVVlMlBpMHQ5ZVEyZkVzNjhr?=
 =?utf-8?B?d3RSWGFKR0F4VHZmVUVUdFhpNFpsVGt4TmlnSFVObjcranNzWWRITmRDT0dW?=
 =?utf-8?B?NXRLZnlPQTlVSHBaVmViMVJ5N2JtTVZqd0xjNzJNSzdibEcvSnZPN0hkbTJL?=
 =?utf-8?B?enZmRDI3azY2WkFOeDlyQ1c0TXpoOWRITDI2aDNFVnFXZWVnQlNiYU5MUVhs?=
 =?utf-8?B?MTZnK1MxcTlPRldpbmIwUStXNEJ4a1l0YzVPa0txM0lhWGMvb0lzZ0R3cSth?=
 =?utf-8?B?b1ppQnNZRFNheTIzNWJVRTgyMjRBOVVINWpzUk96N1I4MkpNVXRralJNdzcv?=
 =?utf-8?B?dzZqay9oUlJOanRCSENKYXhmdnpMS3d5cG9UdytEZlJldmtuQi9TQlgyY2tN?=
 =?utf-8?B?V2l2aFE5ZFVqY3QwWVhJNWNFaytnWlc2TGN1VUxNb09obmhHK0tpaGcrSmlW?=
 =?utf-8?B?K0NRQSszV3kyVzNQNmo1YjJreTdXanVXbitGSml0dkJZci96MVA3bStlOXF3?=
 =?utf-8?B?WGFHaEQ2NGg1U2tGQ3ZHRlBpQmczQTVma0ZGMEJXbDFnUld5REZUMnlXSzBS?=
 =?utf-8?B?NEtOaXYzTnhTMi94M3A1RkZRVmp4T3NKaVUxbHVONjMzQllEWmwraG0xUmpZ?=
 =?utf-8?B?SnlvRW53b0JRMkE2d3RHT2ZBa1NiVTNaa1M1M3k4VzVmWm5Cd2hJMGM5MTFH?=
 =?utf-8?B?NktQcEV0bHBjRktoS3N2TjFiKzdsc25OMWR3VHN6TldoZzU2ekN3aXBsVkxt?=
 =?utf-8?B?ZEtlRGt1Q1JqVFVMVnBPaDJVYkVQK3dEVGJPOEQ5Z1dzSjJGMEVneDQramNl?=
 =?utf-8?B?WXlSUGtxTG1sRFZUdGdZVE9TUXVxUVlkU1M5eC9wT0tIbzVBMXhUdU5URFdk?=
 =?utf-8?B?OVNSV3pZSUErTnZCbEVuNXRWM1RwVEVwUzNPZEVtc1gzaEYyd2tianpuMFlp?=
 =?utf-8?B?dXpvR2d6NFpuTE1zK3ZuODhkRWxPdVRLOEhQNHhaeGgvbEZPcGhqdTZiWCtu?=
 =?utf-8?B?dUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D95F0D67B20544C809C0743122493D2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c438cfa-7cae-43d5-c2c9-08da6902ac28
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 21:15:42.4925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N04M2wFrNwB4re/zwa2o9dMddffbO+wlqVD1+mOHiqUwdTrhK7RtLS1z5KJp8UGlfi15Ib+Ve6tUZkJaE206t4KHIsO75qXdfDqgMkadR2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6288
X-Proofpoint-GUID: zhFlXhG--pwUbkfipFwlwnGzJ__2JklR
X-Proofpoint-ORIG-GUID: zhFlXhG--pwUbkfipFwlwnGzJ__2JklR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_20,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207180089

RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPg0KDQpBIGd1ZXN0IHdvdWxkIGJlIGFibGUgdG8gcmVhZCBhbmQgd3JpdGUgdGhvc2Ug
cmVnaXN0ZXJzIHdoaWNoIGFyZSBub3QNCmVtdWxhdGVkIGFuZCBoYXZlIG5vIHJlc3BlY3RpdmUg
dlBDSSBoYW5kbGVycywgc28gaXQgd2lsbCBiZSBwb3NzaWJsZQ0KZm9yIGl0IHRvIGFjY2VzcyB0
aGUgaGFyZHdhcmUgZGlyZWN0bHkuDQpJbiBvcmRlciB0byBwcmV2ZW50IGEgZ3Vlc3QgZnJvbSBy
ZWFkcyBhbmQgd3JpdGVzIGZyb20vdG8gdGhlIHVuaGFuZGxlZA0KcmVnaXN0ZXJzIG1ha2Ugc3Vy
ZSBvbmx5IGhhcmR3YXJlIGRvbWFpbiBjYW4gYWNjZXNzIHRoZSBoYXJkd2FyZSBkaXJlY3RseQ0K
YW5kIHJlc3RyaWN0IGd1ZXN0cyBmcm9tIGRvaW5nIHNvLg0KDQpTdWdnZXN0ZWQtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KU2lnbmVkLW9mZi1ieTogT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KDQot
LS0NClNpbmNlIHY2Og0KLSBkbyBub3QgdXNlIGlzX2h3ZG9tIHBhcmFtZXRlciBmb3IgdnBjaV97
cmVhZHx3cml0ZX1faHcgYW5kIHVzZQ0KICBjdXJyZW50LT5kb21haW4gaW50ZXJuYWxseQ0KLSB1
cGRhdGUgY29tbWl0IG1lc3NhZ2UNCk5ldyBpbiB2Ng0KTW92ZWQgaW50byBhbm90aGVyIHNlcmll
cw0KLS0tDQogeGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgfCAxMiArKysrKysrKysrLS0NCiAxIGZp
bGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCmlu
ZGV4IDlmYjNjMDViMmIuLmM3YTQwYTJmNDEgMTAwNjQ0DQotLS0gYS94ZW4vZHJpdmVycy92cGNp
L3ZwY2kuYw0KKysrIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCkBAIC0yMTUsNiArMjE1LDEw
IEBAIHN0YXRpYyB1aW50MzJfdCB2cGNpX3JlYWRfaHcocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25l
ZCBpbnQgcmVnLA0KIHsNCiAgICAgdWludDMyX3QgZGF0YTsNCiANCisgICAgLyogR3Vlc3QgZG9t
YWlucyBhcmUgbm90IGFsbG93ZWQgdG8gcmVhZCByZWFsIGhhcmR3YXJlLiAqLw0KKyAgICBpZiAo
ICFpc19oYXJkd2FyZV9kb21haW4oY3VycmVudC0+ZG9tYWluKSApDQorICAgICAgICByZXR1cm4g
fih1aW50MzJfdCkwOw0KKw0KICAgICBzd2l0Y2ggKCBzaXplICkNCiAgICAgew0KICAgICBjYXNl
IDQ6DQpAQCAtMjU1LDkgKzI1OSwxMyBAQCBzdGF0aWMgdWludDMyX3QgdnBjaV9yZWFkX2h3KHBj
aV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywNCiAgICAgcmV0dXJuIGRhdGE7DQogfQ0K
IA0KLXN0YXRpYyB2b2lkIHZwY2lfd3JpdGVfaHcocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBp
bnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSwNCi0gICAgICAgICAgICAgICAgICAgICAgICAgIHVp
bnQzMl90IGRhdGEpDQorc3RhdGljIHZvaWQgdnBjaV93cml0ZV9odyhwY2lfc2JkZl90IHNiZGYs
IHVuc2lnbmVkIGludCByZWcsDQorICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBp
bnQgc2l6ZSwgdWludDMyX3QgZGF0YSkNCiB7DQorICAgIC8qIEd1ZXN0IGRvbWFpbnMgYXJlIG5v
dCBhbGxvd2VkIHRvIHdyaXRlIHJlYWwgaGFyZHdhcmUuICovDQorICAgIGlmICggIWlzX2hhcmR3
YXJlX2RvbWFpbihjdXJyZW50LT5kb21haW4pICkNCisgICAgICAgIHJldHVybjsNCisNCiAgICAg
c3dpdGNoICggc2l6ZSApDQogICAgIHsNCiAgICAgY2FzZSA0Og0KLS0gDQoyLjM2LjENCg==

