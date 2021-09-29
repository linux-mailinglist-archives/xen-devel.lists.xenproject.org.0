Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 253E741C13F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 11:03:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198902.352639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVVUd-0003UI-6n; Wed, 29 Sep 2021 09:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198902.352639; Wed, 29 Sep 2021 09:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVVUd-0003SV-3J; Wed, 29 Sep 2021 09:03:11 +0000
Received: by outflank-mailman (input) for mailman id 198902;
 Wed, 29 Sep 2021 09:03:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mM9C=OT=epam.com=prvs=09065c5b4f=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mVVUb-0003SP-D3
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 09:03:09 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 074228cf-8055-43ad-9131-69ea4828a387;
 Wed, 29 Sep 2021 09:03:08 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18T84lhI019579;
 Wed, 29 Sep 2021 09:03:03 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bcg0n0tr8-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 09:03:03 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6242.eurprd03.prod.outlook.com (2603:10a6:20b:15c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 29 Sep
 2021 09:03:00 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.015; Wed, 29 Sep 2021
 09:03:00 +0000
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
X-Inumbo-ID: 074228cf-8055-43ad-9131-69ea4828a387
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtALfyxxNmaU/48YZTJxNw6Ysoaj2QQdD3N0nwL4l+r/7H03WATekiGlujRT0fDyoRF0scVV3mJFma2MVArkeGMokS8L3SPdglXzE1OXKfAR+HDpX0J055e/WAJqXxC+EFUZeiJ3MKQyR0aa8HT8HoIryk72XQphdA8P8Y2W6oB/VGz/K1jwDTsAifAWR6tMh0FmRWb5o/W5UVX/2M+zPmbsKbIpWO5XVn0w6hbHQEcCDkr0szc9qHbXF9G0oq47tft0qFSkIslTHNigQGNab7Oi7sNcCTxzzKYPvnnQPbl+P48lIZc+2Kj3ozvbtyglWqOIcvkBZ1YC0Z9Ykk2+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=THBeAc5jY29gXIe48ZUd/K3VVnp852+rISS9da95/mo=;
 b=kX8Oq8+tmd3RMbD7KFkWIYExALk050C32M6Zims69o/SugRrbS1whlPw+Yk4rbk0CZu0FT5frckIvPJy4swRfWV/5mwdd9XWYwtOdhR1H4HeQqWdsUuElnpw2JtBTH5B1l6T88+AN9JszuXbDeCJlbKvwPV8CpkUPkUxmHKAYL9R//8jrCwUjvw31aeHcWy3FByi9eqw2pJ+izDjmnzib5MrvI5cYJOiNdFqOklvNkpNTcH0YvCMTZ/8Fz/MxD0LkFJfcpA0hU2LwvdZynJTQ8FxdJMcbg8+lfBnEm7X/gWCbrrnEQG+cDE/ntgVcq0HX6Lo1+LVzwjO4N2LIoJ8mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THBeAc5jY29gXIe48ZUd/K3VVnp852+rISS9da95/mo=;
 b=GchXwt1mV70i5S6C6zZrNwl9wQkUeb+xR73hPVq0RAslSFBaGN89rHtgkB1DhoqJxnIU0myBpnaSTj+wOTP1jvpIPy58/3yv4NtoOOqYlu60H1EjxtptPFS4GHXj4ICjyPIg5Cr1NTK/oMenvki3I6zKSuY6CenBfW3zmMERvLiSiQN8nwCuDFP6q8O5zxgs+i1spaE2b6H0nrxUErKoa3kVl0InpMA+/zN2zsKi41V3vJwa/OjbO9amZWWIuNi8nmLTKA3pHgGVsDXvfb5jYHxv/qmJ09FJJL80/Sx0K/C5jFZ5g6YpUOdJiygw6w9FFfIjP9uZp1jzt3xe4v9g9w==
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
        Michal
 Orzel <michal.orzel@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v2 10/11] vpci: Add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v2 10/11] vpci: Add initial support for virtual PCI bus
 topology
Thread-Index: AQHXsHpEaYKJY1uGNUmlwbBKeBrI6Ku5GYwAgAAC+oCAAAUNAIAATmyAgAFQpAA=
Date: Wed, 29 Sep 2021 09:03:00 +0000
Message-ID: <8f5f9b93-2b13-30dc-372b-10326130b71d@epam.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-11-andr2000@gmail.com>
 <6a760126-ba6e-bdf7-97a3-205d75d3d99f@arm.com>
 <66cc2b43-eedf-5d58-bf93-5047ecf9ac7b@suse.com>
 <71d8eda6-49f8-691c-1e6b-711ce9f99d50@arm.com>
 <600cc603-5e6c-b430-def3-74a9b596daa0@epam.com>
In-Reply-To: <600cc603-5e6c-b430-def3-74a9b596daa0@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ed6eaaa-edd7-488b-b33e-08d98327efff
x-ms-traffictypediagnostic: AM0PR03MB6242:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB6242C621B606727219525E47E7A99@AM0PR03MB6242.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GMqyo3Ef33T7nrF0hUrMxnWOX62TTyXcy64C7j1956Trh3bRlWzeinUCf8KXJG9CZmjwWcHt5Hbmx1tAd2rl3M+VT99Ee8rPcQ2KpUbl23sY/iJ37isUELEB2Db7e+T7bqv/FTconXlEOILeHP3lxBWvf2tEZgJyoCS44rf2nJAu3hfPMfjMbxkus7z270PcyQpufp8J+2VG09PzLrCDKyeVyYYHqgd3GZ77X9SoWydpeoxU0vOI+7C3OOdNYe2qNjF6QQtvrgH+pXAJ5iUgiv65yRFwmsVbHe1iiuzDo80JbKdpfJW7cRdvDpTPxX+U+1c5DkL0/FJ+J8XezC21Sol9s9OZg0f3LnmoZqZACkss22IwD2EfKnndkqE8CvOQHvW4Hq7xFJgcyCPtfu1z9CAlCDgWofgBI5fDwfGYLdOXjiuscBL3HtACpmKfcg7zmBluYnjDpODCATsSbnJ+YYx1iZAjREpDjLc3UDzcUeRHdep0wNafn+GAsUvvCpn3M7ljcF6jlQh9QgwmUfVCY9D5ccC2EeWbuypa6EzU3WYhkHHU5GfKE3TbWpjCmjrNmF4jREqYDjspCS1i33s3malc5Dl4bTw3YDPMmloBpKot7Es0+GgcqnDhLb9KrhuVhBupF7PoSDfEXrXhRMpcEHSlJhcqRQpZMhBgVlUIsuPajwlDyJs2HVIPtmN2rXtL+aLpeeqqmhthtNQoaQUTUe+ruzHYm9if4TbS9eInEWLgZ+Hjdtg1goMdNUaVMUQN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(6916009)(26005)(83380400001)(55236004)(36756003)(4326008)(316002)(2616005)(2906002)(5660300002)(71200400001)(38070700005)(186003)(8676002)(66446008)(107886003)(31686004)(6512007)(54906003)(64756008)(508600001)(66556008)(66476007)(76116006)(8936002)(6506007)(91956017)(53546011)(31696002)(66946007)(6486002)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WlRHSGpwVWpNaFdrTWFNYVdnU2d6ZWlCUjhodUtuTFAxTHVwVVQ5QTB1WVRH?=
 =?utf-8?B?enBvT2xva1RUS3gydVlZRFErS0VrYkFtQldpUkhrSmNrek9jS3ZMbm1IbzB1?=
 =?utf-8?B?c0NZZm1IaFZCRENxZjVIWElVL24rYVdTaWFUeDBxNWFCMTg2RzRVdEF0bDhP?=
 =?utf-8?B?NmordlltaTZINXdORVRXcVhiMHZaUkE5OW95aGdzZTNuTUFFUGRaZ2Z4YjYr?=
 =?utf-8?B?MUtNQ3NNQldnM1hwczU2Wk8zTHU2ZVhEejBIN1IzTkw0Skl6Uko4S2NCNnlK?=
 =?utf-8?B?VGFabHNkNDFVQUxjK2Y1TWJvdkFCbUdCRjMrcXRFWXVqZzBEemFQaXJZMG9p?=
 =?utf-8?B?b3dQejRZQ3IxclV3V3FrWGc4eHU5d1BRUjhlN09PNnUvR1ljZjF2L3p2U3Bv?=
 =?utf-8?B?TzA5NnUyaVZYczZoMngvV05Sa0F6MnBiQzdUaU5TV05sbjJyeWVWZnhYVEtm?=
 =?utf-8?B?RzkyNUFQdzhMcDRrU25keHhYd2ZuRFI0T2pjNGVPbCtaZU53YTJwVHRndm00?=
 =?utf-8?B?MERNbmlaTjY2dWVLdnlXVUFwdHdMRDNFVjNCWnNOR0xJSGMzVHAzN2RYTlZ5?=
 =?utf-8?B?bWIrdEpvWS9QaTdQa3NVSGlSRGVsaGlVWDNId25nTmlPamRVTlpNb1kzRlNS?=
 =?utf-8?B?UmlvU05uUWxMQkxhK3FvaVNFWE5tZHZEN1Q2a2RodHFYTFM4a3ZPTlN5dzNy?=
 =?utf-8?B?NlZvYm40YzFSWC9HekQ5aTV1UEdmU2toZjZxUHpDYTVnNzlZMmVKcW1PQXdl?=
 =?utf-8?B?MWJxSHkwWmlhd0tEaUhCK2R5aGJJYXZoS05zYVV3czhzbm5NWVRMT2xnZG12?=
 =?utf-8?B?YTFnWEhka3Y0SGI0aE9tMUVTNEwwTmEyTHpCREJZSVo5cXdOemtvRjVxbVB2?=
 =?utf-8?B?cS9uNUw0b0xTMVZZYWhKbnVTR0NMdk04YmFrRG5QSXRnUi9iMlFEVCtFdjln?=
 =?utf-8?B?aGRtZmVpcWVidm93WDRvSmg1dExDclhUNlZ6TUJlTmdkbHFjbWV2MTlKM2ZS?=
 =?utf-8?B?ZDZHL1U1dlozeWhRNWFzRmV5U0ZHMkFkQmJTYkFxczZNdlBmaksvUnJlYkpl?=
 =?utf-8?B?WGRIZjkvTTdTQ3NyYmhXVVAyRW5tdFQ0WjhtaFhkZ2FKTmtsRjBiOHJaTmFy?=
 =?utf-8?B?MGNleE1YRDFGSEJMVmFZMnhQbURYMFJBYW9DNndPUGlDVDFpWUNTWFB5NDg3?=
 =?utf-8?B?aE5GVUw4VlNMaFQzc3FRK3I5NGlpcDV3ajAvL3ZURzVkMmRVclY2TFdFVDlC?=
 =?utf-8?B?NWVUOXJrNDduT3oxK2Fwc3RoaDR2RWljeE9RVnFDV29semlxWWNaM0RBbU9X?=
 =?utf-8?B?dXZZNmt3M2NQaHNiS3FEdUlPTXZieFM1ZkpPVU1BY2RJWHlNaDl3bkRjNmxa?=
 =?utf-8?B?Q2dSdWpNbGVncGt5QkhMeWhzQnZKQWh4L2REN2VwUmNkWkVLQVZvNFYxTE5Y?=
 =?utf-8?B?bndFQ2VzcytITG9wQUFYdzhJOE9JYVU4am5PZ1VwUkgyWFI2R3dPSkowbzFk?=
 =?utf-8?B?ZXlURGRGZHU1Qi8xb1BGUzJQSzc3TFVudlJOM3ZjUjBnUVFwdDlOaXl0NUJY?=
 =?utf-8?B?bEpzaVVwZjJ3UFJGM1FyQUV1OHJ0eU9QVHhFenR4V0pOWjNobDNqWlErNUs2?=
 =?utf-8?B?UFdwU3hhWjRyUUt4TS8xeXFaY0M4T3FiWXZiMUoySE1qa3U3ODU3TzZrdG9U?=
 =?utf-8?B?N3MxMUhTeWdtOG95bTRaOHM5a2NiSGhwT1oyeUg5SXhPbWJkUkJvelA2cXFK?=
 =?utf-8?B?N283bjU1ZmJLSW5xaGcwSk5BOFNHak9Rb1p1c2d2Tk13R0IxQVpaVENvMEg2?=
 =?utf-8?B?cmgzcmlTbWQzOEZRWkVCUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <87860C08B85D9742923CFAAF1CE02867@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed6eaaa-edd7-488b-b33e-08d98327efff
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2021 09:03:00.1577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sRlIidDIiXlyO0zX5SateYioKuZX6w0jP+GdTs1EbKrvFqmIDIrLo5JdT7O75qwlR90HIs4yzWFIHBR5ALvDAqAOm+6S6rVx6YQXbkuEqzbSsnGQnJnwGBJbmvaeJuF0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6242
X-Proofpoint-ORIG-GUID: -n36QO8qPpBaxIrifhObUOFpCxoocXa7
X-Proofpoint-GUID: -n36QO8qPpBaxIrifhObUOFpCxoocXa7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_02,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 adultscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109290054

SGksIEphbiENCg0KU29ycnkgZm9yIHRvcCBwb3N0aW5nLCBidXQgdGhpcyBpcyBhIGdlbmVyYWwg
cXVlc3Rpb24gb24gdGhpcyBwYXRjaC9mdW5jdGlvbmFsaXR5Lg0KDQpEbyB5b3Ugc2VlIHdlIG5l
ZWQgdG8gZ2F0ZSBhbGwgdGhpcyB3aXRoIENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUDQoN
CmFzIHRoaXMgcmVuZGVycyBpbiBzb21ld2hhdCBkZWFkIGNvZGUgZm9yIHg4NiBmb3Igbm93PyBJ
IGRvIHRoaW5rIHRoaXMgc3RpbGwNCg0KbmVlZHMgdG8gYmUgaW4gdGhlIGNvbW1vbiBjb2RlIHRo
b3VnaC4NCg0KVGhhbmsgeW91IGluIGFkdmFuY2UsDQoNCk9sZWtzYW5kcg0KDQpPbiAyOC4wOS4y
MSAxNTo1OCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+IE9uIDI4LjA5LjIxIDEx
OjE3LCBNaWNoYWwgT3J6ZWwgd3JvdGU6DQo+PiBPbiAyOC4wOS4yMDIxIDA5OjU5LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAyOC4wOS4yMDIxIDA5OjQ4LCBNaWNoYWwgT3J6ZWwgd3JvdGU6
DQo+Pj4+IE9uIDIzLjA5LjIwMjEgMTQ6NTUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3Rl
Og0KPj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+Pj4+ICsrKyBi
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+Pj4+PiBAQCAtODMzLDYgKzgzMyw2MyBA
QCBpbnQgcGNpX3JlbW92ZV9kZXZpY2UodTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbikNCj4+Pj4+
ICAgICAgICByZXR1cm4gcmV0Ow0KPj4+Pj4gICAgfQ0KPj4+Pj4gICAgDQo+Pj4+PiArc3RhdGlj
IHN0cnVjdCB2cGNpX2RldiAqcGNpX2ZpbmRfdmlydHVhbF9kZXZpY2UoY29uc3Qgc3RydWN0IGRv
bWFpbiAqZCwNCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4+ICt7DQo+Pj4+PiArICAg
IHN0cnVjdCB2cGNpX2RldiAqdmRldjsNCj4+Pj4+ICsNCj4+Pj4+ICsgICAgbGlzdF9mb3JfZWFj
aF9lbnRyeSAoIHZkZXYsICZkLT52ZGV2X2xpc3QsIGxpc3QgKQ0KPj4+Pj4gKyAgICAgICAgaWYg
KCB2ZGV2LT5wZGV2ID09IHBkZXYgKQ0KPj4+Pj4gKyAgICAgICAgICAgIHJldHVybiB2ZGV2Ow0K
Pj4+Pj4gKyAgICByZXR1cm4gTlVMTDsNCj4+Pj4+ICt9DQo+Pj4+PiArDQo+Pj4+PiAraW50IHBj
aV9hZGRfdmlydHVhbF9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0IHBjaV9k
ZXYgKnBkZXYpDQo+Pj4+PiArew0KPj4+Pj4gKyAgICBzdHJ1Y3QgdnBjaV9kZXYgKnZkZXY7DQo+
Pj4+PiArDQo+Pj4+PiArICAgIEFTU0VSVCghcGNpX2ZpbmRfdmlydHVhbF9kZXZpY2UoZCwgcGRl
dikpOw0KPj4+Pj4gKw0KPj4+Pj4gKyAgICAvKiBFYWNoIFBDSSBidXMgc3VwcG9ydHMgMzIgZGV2
aWNlcy9zbG90cyBhdCBtYXguICovDQo+Pj4+PiArICAgIGlmICggZC0+dnBjaV9kZXZfbmV4dCA+
IDMxICkNCj4+Pj4+ICsgICAgICAgIHJldHVybiAtRU5PU1BDOw0KPj4+Pj4gKw0KPj4+Pj4gKyAg
ICB2ZGV2ID0geHphbGxvYyhzdHJ1Y3QgdnBjaV9kZXYpOw0KPj4+Pj4gKyAgICBpZiAoICF2ZGV2
ICkNCj4+Pj4+ICsgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPj4+Pj4gKw0KPj4+Pj4gKyAgICAv
KiBXZSBlbXVsYXRlIGEgc2luZ2xlIGhvc3QgYnJpZGdlIGZvciB0aGUgZ3Vlc3QsIHNvIHNlZ21l
bnQgaXMgYWx3YXlzIDAuICovDQo+Pj4+PiArICAgICoodTE2KikgJnZkZXYtPnNlZyA9IDA7DQo+
Pj4+IEVtcHR5IGxpbmUgaGVhciB3b3VsZCBpbXByb3ZlIHJlYWRhYmlsaXR5IGR1ZSB0byB0aGUg
YXN0ZXJpc2tzIGJlaW5nIHNvIGNsb3NlIHRvIGVhY2ggb3RoZXIuDQo+IFdpbGwgYWRkDQo+Pj4+
IEFwYXJ0IGZyb20gdGhhdDoNCj4+Pj4gUmV2aWV3ZWQtYnk6IE1pY2hhbCBPcnplbCA8bWljaGFs
Lm9yemVsQGFybS5jb20+DQo+Pj4+PiArICAgIC8qDQo+Pj4+PiArICAgICAqIFRoZSBidXMgbnVt
YmVyIGlzIHNldCB0byAwLCBzbyB2aXJ0dWFsIGRldmljZXMgYXJlIHNlZW4NCj4+Pj4+ICsgICAg
ICogYXMgZW1iZWRkZWQgZW5kcG9pbnRzIGJlaGluZCB0aGUgcm9vdCBjb21wbGV4Lg0KPj4+Pj4g
KyAgICAgKi8NCj4+Pj4+ICsgICAgKigodTgqKSAmdmRldi0+YnVzKSA9IDA7DQo+Pj4+PiArICAg
ICooKHU4KikgJnZkZXYtPmRldmZuKSA9IFBDSV9ERVZGTihkLT52cGNpX2Rldl9uZXh0KyssIDAp
Ow0KPj4+IEFsbCBvZiB0aGVzZSBjYXN0cyBhcmUgKGEpIG1hbGZvcm1lZCBhbmQgKGIpIHVubmVj
ZXNzYXJ5IGluIHRoZSBmaXJzdA0KPj4+IHBsYWNlLCBhZmFpY3MgYXQgbGVhc3QuDQo+Pj4NCj4+
IEFncmVlLg0KPj4gKigodTgqKSAmdmRldi0+YnVzKSA9IDA7DQo+PiBpcyB0aGUgc2FtZSBhczoN
Cj4+IHZkZXYtPmJ1cyA9IDA7DQo+IE92ZXJlbmdpbmVlcmluZyBhdCBpdHMgYmVzdCA7KQ0KPg0K
PiBXaWxsIGZpeCB0aGF0DQo+DQo+Pj4gSmFuDQo+Pj4NCj4gVGhhbmsgeW91LA0KPg0KPiBPbGVr
c2FuZHI=

