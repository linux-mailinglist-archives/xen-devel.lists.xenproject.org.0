Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CC3419012
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 09:36:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196407.349244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUlAq-0001wm-GF; Mon, 27 Sep 2021 07:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196407.349244; Mon, 27 Sep 2021 07:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUlAq-0001uu-C8; Mon, 27 Sep 2021 07:35:40 +0000
Received: by outflank-mailman (input) for mailman id 196407;
 Mon, 27 Sep 2021 07:35:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1Nw=OR=epam.com=prvs=9904516479=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mUlAo-0001uo-UQ
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 07:35:38 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42745704-7912-4ee9-b686-10c0f686db88;
 Mon, 27 Sep 2021 07:35:37 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18R7FFBk008580;
 Mon, 27 Sep 2021 07:35:36 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bb9dd82k1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 07:35:36 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7345.eurprd03.prod.outlook.com (2603:10a6:20b:273::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 07:35:33 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 07:35:33 +0000
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
X-Inumbo-ID: 42745704-7912-4ee9-b686-10c0f686db88
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPIKHTqGkPEpCx9R6pCch7gdELFMyCQ1PEg4uilZXUze9m1QxT+WcS+tUBJaiDOde2gkx7G/eJOYolKJlkIQD5/i7zt5nPRDxS21shJgZihdb3XLPAgLfJjD46bd1WrjRoHCcGVYQaLhrkatLfVcCir4Z+5w3/dM6NOKe3ufL/bzsxO4HTD2uq6GKGxq+lLOfCTZvSKu6J5LLCe3LMriWtPPe7Gu0v/CjW1tTWL5ifDx5YiTUnRIQ/RnT6gmSDDBV8VQE1n8yNVOyqMyI4zbD6oIfAtd9eRBZHEHWwaSvoXQValc8mO5SBg7h5kl0PbJSa5qBi6bvfEn7Rhs9WaMtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=9nSSwAihiXK3S+MOrY7xQjjBWbyyoTUWXuyU+f9frco=;
 b=mHr1xj4TdNDUj9M87Ahuc4z12poAoh8HSA4EnBAAz+cDPQ7ITcySEHwGzD8bf5swXrOyf1z7s9AECrWOhbYINV1hyM0CIhh1y756wQ9ImYFbcU5wcqAPnQfEuoHHJu1Pah1aL3Wz4PYMDyY+u0Czd/dQipfGea11AtSqmGq+tJiw50V58nwU0J3K+lHawsGCtKUqFzHjXb76/A3VX70oXgvRrN6jSrCDWhOEZ8hDlnTJWuOx/zXA3/YgHz/u3TCoApjW6sZL8c82AaDx635q0QTu7XcC73vXEHVdeNzL0+yxDj1ntwJxyJYC/vY8SHXOQfkLNMXkXg88KJyJIIS32g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nSSwAihiXK3S+MOrY7xQjjBWbyyoTUWXuyU+f9frco=;
 b=eE60XSqn0Zs4o8chBco3lq1AL2QMV7639V8z6zxgHbw+q34tseqT7PXVLJLzy6UNXFhyewgp8dl+N2tZcg8SfPONr0jP4mOks3HUohU5jNg8nDaktUqF8Z/yfSMUOQXOqvMORPuX2aNE1hyIsEIpurSN7rNva1VPbL/SN3jyABTXEYYsUfrht59x5eMUehWPrWqoG0XEjLmWD13iVLLmqIj9+ac2Oe5q6k7loWzh+yN4ZSUM2jYPDJ+f3MEVTNtsGKy4htgm0ZX2n0tj4RQdshLCSA/XKORwyrKT+lIX81Hp1FBOdi/jyaZoPvUeW4UZbcx0nqLPEKMXaik7ucCS6g==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
        "jgross@suse.com" <jgross@suse.com>, "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] xen-pciback: prepare for the split for stub and PV
Thread-Topic: [PATCH v4 1/2] xen-pciback: prepare for the split for stub and
 PV
Thread-Index: AQHXs20TiZWMfq6cRkakGi7ds9CK56u3ezoAgAACbAA=
Date: Mon, 27 Sep 2021 07:35:33 +0000
Message-ID: <accd0220-a9d7-145b-6632-9dee085ffc65@epam.com>
References: <20210927065822.350973-1-andr2000@gmail.com>
 <e472468a-625e-6c4d-a9c2-85594e2ff908@suse.com>
In-Reply-To: <e472468a-625e-6c4d-a9c2-85594e2ff908@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1df5d8d6-5f25-498d-604a-08d9818963e5
x-ms-traffictypediagnostic: AM9PR03MB7345:
x-microsoft-antispam-prvs: 
 <AM9PR03MB7345D61C3F857661F958BBC2E7A79@AM9PR03MB7345.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zib9rlm9eXEWaQszhi4fPevHqekS0czU1A6HMuKl3z6iQ22UOH3sOf8G+j6drtEwj6/S55pNXU67v7AEsI1nIQIBxFlGvEetWDjcADIObgOOxeTogccQ0bffHAx2FbFmSJAcbGide99gsvjvxX0c3J1n/sKWE/i4uvHZb+FhuWE1VBFN/I9FEkOXzgc2JsAvUPPp0qdFcSPqgWU1o4alkpMNWkfQEOzid9twSQHUmRMkN84P6qFP8UeSL9srvsVBzPgppO7jApga10uWX81wdxrfhyaXbsNIcJk9OghVM0THHcaDgVHmfzZ4EkozFtLsbvn+LUoX7k9MC3xqtfv9USPemtcItQZ5RRafQ96vFUEBWDoyjfNCGXMSKpZ+4/qsPyx98namgHH/af8H8GlZ/VxVfhwOs0pvaWBWKpwDpZYAiyTShNqcFHmCfU7SqMpVl/v4gvn4XvicMFXn5+f6pQkixT22cB73d+gwAwA/C8jYeRpnmwQGOgOaVVaocUHCgiE8ryADFWiNaxYetCNcVI+12B7nn7y2GvsCxv6vOp0MOpVjV4hzjp4O7biUD3++6cIvavjbcGGLUs7cFo/wvJVSGMEaVxccd190cZ0kPoULducw4ntCO2rH4rR2Qj0GcquAiDkAQBMcrdMv85yWCXTc+12p3B4eKT9anVOdC3caIM7Nqc4m+jASK6kEX6CmcH6/Y3PRi5zabauVXcUJX5PlUz7wH0HShO8vXl72h4VyASESqjSP81xRb001rT4d
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(91956017)(36756003)(38100700002)(54906003)(122000001)(86362001)(8936002)(76116006)(508600001)(110136005)(2906002)(5660300002)(8676002)(316002)(71200400001)(4326008)(6512007)(64756008)(66946007)(66446008)(53546011)(6506007)(55236004)(2616005)(26005)(38070700005)(31686004)(6486002)(31696002)(66556008)(66476007)(83380400001)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MTlzamdnUEdjZ1dmREJvbEY2cVVrRFBwdlpQQ09KOU1EK2srT3hkS0hneFNY?=
 =?utf-8?B?QytLSnJsWjgyaTNYVUxWdDY4MWVBTjM1bHAwa1IrcnF0K0NERE9abkRXcDh1?=
 =?utf-8?B?aCtzU2xaUlJYNnpCUXBScDlOZXB6eEZpZXRKUWhpM242a0F0bktHL0o0MXJ1?=
 =?utf-8?B?TjFvUlNpSTAxWkxibCtmQkprbXR6WVFndk4yeEg4RkRkMlF1UWlhckI5NjJ1?=
 =?utf-8?B?anp6YkdxbkVTbDBzZUczdEsrd3ByTDh4MGd2aEM1TjkzVEk2cExtZlFPNFp1?=
 =?utf-8?B?U01sWU1uVkdQM2o1LytORmhlb0hianNFSkVjNmkzWHp2Y3J2cmtCc2V3K1dm?=
 =?utf-8?B?UzNOdmJHeDVhck5PNE9qek5YeTNvVjlSc2wrRkFVVndMRy9IRW5HZWtNWEcx?=
 =?utf-8?B?YjFCekt4MmgvMFBYcXhnUTFXeWl0bTJJWmpmY3FSOHFmTVdZSVh4d3kydGtn?=
 =?utf-8?B?SVZKS25XTUxPWGZXNEpEQnpRMktVa05WeHMrLzhscEphaHRhamFNcHFWMkZw?=
 =?utf-8?B?U0h2emxPZUIxTnNTdk1PUWltejVFcDZwUzNuenU1bkRJY1FTY25NMDdpdVI2?=
 =?utf-8?B?dVpvL3hzVlhUZWN4TmFZUitjOWdtVThxK1d6U2NMa01vMGsyUk9CUVB6cDZj?=
 =?utf-8?B?NlZsNVdYdEU2RTdBMzIvdHd6WUlVS0dac0dYeUFtNGNya3YyMWRCN3ZlbGpQ?=
 =?utf-8?B?dG5xRG5ZczVBMEtkRzRFSUpDMGhGQ2pENGZtYytCRnJTTlZhc3VtZDhsZmtR?=
 =?utf-8?B?elg5NXVjMnFIQWdYWnY1VGEwTnZBUDhRL2xWdnN6YmZYZkpPcFJwNm9BQ095?=
 =?utf-8?B?cktHd2t1a1hreU1ESnJMN1hUQW1iOVlNc2pJeEFhWnBUQmZHMTdKWXZzTVU4?=
 =?utf-8?B?eEhMOHh3aFY3a3RGSVRkdURERVZYa1FEYkRZN0M0L1dqcXdFbzBkalU4bGdY?=
 =?utf-8?B?bndyc3IvMWEwVmRDTWkzWEZtWTFtc0E4NXF4VVkrUE1kei9mTExuWWJhWEcx?=
 =?utf-8?B?L1k4V05BR3FSZHVMKzlyVm9kWkNxMUNiRHRDRi9IUm9PODlFQy9qNUVlc09i?=
 =?utf-8?B?ODFpN3BFL0s4bTlGRlZCd3M1UDA4MDFwTEszNzBibzE2dFJvcWhkaW5XaUEz?=
 =?utf-8?B?TU1QR1lRVjNZcVozK3FadHpid1VRTTBLQ3NsRGtwb1NZZEN0NFV4SURlb1FW?=
 =?utf-8?B?YkZ5L2ZNUEdxMTh1VVY5RFEwUlAvNitnVW1ldnhYZ05lSlIySms5azJ0Nmd6?=
 =?utf-8?B?NXVHeVJDd1JkQi9vamVEVSs4ZG5vc0JWR1l1bzFqb1lFaVpicUNhdndDdnlq?=
 =?utf-8?B?cDFwaHM1cTR6NUt5UmZMUzRRaWlSWkxsUUNzNGt6MG9tSWYrbjdTamlpQU1W?=
 =?utf-8?B?V292VGo0dmw0eEZ4ZHVJUHA3OE9yck1WeUVaUzY0WTNrY3hvNnozUTBDTnU4?=
 =?utf-8?B?N1ptd205MDN4MmpVR01zYVFzQ2paUmF3M1UwZEwvY2p4bWJLd0JDTUo3Uisr?=
 =?utf-8?B?R1lheDdWbWNLQ2NmdU81TEVEOUoxSHV4T0VzdFNlVkl2QTBwZG5FQWU5Vi9Z?=
 =?utf-8?B?VjYrSGxhTVNEZjBzUzlsMGR5OWtIWnd4NkpnRkZpcmN4dWNRTnZxLy9vNGls?=
 =?utf-8?B?QmFxMkRBL1cyVEl4eUR6a1grYjlJcXljNXEzWFkvUWdDR3d5RUpYMm5Ob2xQ?=
 =?utf-8?B?VHdFYlpBUG9aejVidnlDR3V4aXl6Kys5QkpoU2ZON3NMQzNOSW9ML1ZKZStZ?=
 =?utf-8?B?L2llaExWVmFJbTZYNnB6VERONFdIZzc5elFrL0dYQmppT0tJM1pFV0hFOGpE?=
 =?utf-8?B?aXJ3VEpvT1I2b1lsdng2dz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6969D1A2AAD37408B0B3D31E9085D4A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df5d8d6-5f25-498d-604a-08d9818963e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 07:35:33.5448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rSNRzDlRFlhzTtTqyYeiluDXogNQ8/2RvcsG3Mv8TiAdVXEWboXhtWp/4kLb97zJolZgvicnpraeTPRwtS3F6LDTtWBtHraTFNPtvUehoKABJX1dxUrqweepmWHbjALx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7345
X-Proofpoint-GUID: nSkETDT8JU0GjmcNUTkm-BY_BB7BmUj3
X-Proofpoint-ORIG-GUID: nSkETDT8JU0GjmcNUTkm-BY_BB7BmUj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_02,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109270051

DQpPbiAyNy4wOS4yMSAxMDoyNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI3LjA5LjIwMjEg
MDg6NTgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gRnJvbTogT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4NCj4+
IEN1cnJlbnRseSBQQ0kgYmFja2VuZCBpbXBsZW1lbnRzIG11bHRpcGxlIGZ1bmN0aW9uYWxpdGll
cyBhdCBhIHRpbWUuDQo+PiBUbyBuYW1lIGEgZmV3Og0KPj4gMS4gSXQgaXMgdXNlZCBhcyBhIGRh
dGFiYXNlIGZvciBhc3NpZ25hYmxlIFBDSSBkZXZpY2VzLCBlLmcuIHhsDQo+PiAgICAgcGNpLWFz
c2lnbmFibGUte2FkZHxyZW1vdmV8bGlzdH0gbWFuaXB1bGF0ZXMgdGhhdCBsaXN0LiBTbywgd2hl
bmV2ZXINCj4+ICAgICB0aGUgdG9vbHN0YWNrIG5lZWRzIHRvIGtub3cgd2hpY2ggUENJIGRldmlj
ZXMgY2FuIGJlIHBhc3NlZCB0aHJvdWdoDQo+PiAgICAgaXQgcmVhZHMgdGhhdCBmcm9tIHRoZSBy
ZWxldmFudCBzeXNmcyBlbnRyaWVzIG9mIHRoZSBwY2liYWNrLg0KPj4gMi4gSXQgaXMgdXNlZCB0
byBob2xkIHRoZSB1bmJvdW5kIFBDSSBkZXZpY2VzIGxpc3QsIGUuZy4gd2hlbiBwYXNzaW5nDQo+
PiAgICAgdGhyb3VnaCBhIFBDSSBkZXZpY2UgaXQgbmVlZHMgdG8gYmUgdW5ib3VuZCBmcm9tIHRo
ZSByZWxldmFudCBkZXZpY2UNCj4+ICAgICBkcml2ZXIgYW5kIGJvdW5kIHRvIHBjaWJhY2sgKHN0
cmljdGx5IHNwZWFraW5nIGl0IGlzIG5vdCByZXF1aXJlZA0KPj4gICAgIHRoYXQgdGhlIGRldmlj
ZSBpcyBib3VuZCB0byBwY2liYWNrLCBidXQgcGNpYmFjayBpcyBhZ2FpbiB1c2VkIGFzIGENCj4+
ICAgICBkYXRhYmFzZSBvZiB0aGUgcGFzc2VkIHRocm91Z2ggUENJIGRldmljZXMsIHNvIHdlIGNh
biByZS1iaW5kIHRoZQ0KPj4gICAgIGRldmljZXMgYmFjayB0byB0aGVpciBvcmlnaW5hbCBkcml2
ZXJzIHdoZW4gZ3Vlc3QgZG9tYWluIHNodXRzIGRvd24pDQo+PiAzLiBEZXZpY2UgcmVzZXQgZm9y
IHRoZSBkZXZpY2VzIGJlaW5nIHBhc3NlZCB0aHJvdWdoDQo+PiA0LiBQYXJhLXZpcnR1YWxpc2Vk
IHVzZS1jYXNlcyBzdXBwb3J0DQo+Pg0KPj4gVGhlIHBhcmEtdmlydHVhbGlzZWQgcGFydCBvZiB0
aGUgZHJpdmVyIGlzIG5vdCBhbHdheXMgbmVlZGVkIGFzIHNvbWUNCj4+IGFyY2hpdGVjdHVyZXMs
IGUuZy4gQXJtIG9yIHg4NiBQVkggRG9tMCwgYXJlIG5vdCB1c2luZyBiYWNrZW5kLWZyb250ZW5k
DQo+PiBtb2RlbCBmb3IgUENJIGRldmljZSBwYXNzdGhyb3VnaC4gRm9yIHN1Y2ggdXNlLWNhc2Vz
IG1ha2UgdGhlIHZlcnkNCj4+IGZpcnN0IHN0ZXAgaW4gc3BsaXR0aW5nIHRoZSB4ZW4tcGNpYmFj
ayBkcml2ZXIgaW50byB0d28gcGFydHM6IFhlbg0KPj4gUENJIHN0dWIgYW5kIFBDSSBQViBiYWNr
ZW5kIGRyaXZlcnMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4NCj4+IC0tLQ0KPj4gQ2hh
bmdlcyBzaW5jZSB2MzoNCj4+IC0gTW92ZSBDT05GSUdfWEVOX1BDSURFVl9TVFVCIHRvIHRoZSBz
ZWNvbmQgcGF0Y2gNCj4gSSdtIGFmcmFpZCB0aGlzIHdhc24ndCBmdWxseSBkb25lOg0KPg0KPj4g
LS0tIGEvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svTWFrZWZpbGUNCj4+ICsrKyBiL2RyaXZlcnMv
eGVuL3hlbi1wY2liYWNrL01ha2VmaWxlDQo+PiBAQCAtMSw1ICsxLDYgQEANCj4+ICAgIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPj4gICBvYmotJChDT05GSUdfWEVOX1BDSURF
Vl9CQUNLRU5EKSArPSB4ZW4tcGNpYmFjay5vDQo+PiArb2JqLSQoQ09ORklHX1hFTl9QQ0lERVZf
U1RVQikgKz0geGVuLXBjaWJhY2subw0KPiBXaGlsZSBiZW5pZ24gd2hlbiBhZGRlZCBoZXJlLCB0
aGlzIGFkZGl0aW9uIHN0aWxsIGRvZXNuJ3Qgc2VlbSB0bw0KPiBiZWxvbmcgaGVyZS4NCg0KTXkg
YmFkLiBTbywgaXQgc2VlbXMgd2l0aG91dCBDT05GSUdfWEVOX1BDSURFVl9TVFVCIHRoZSBjaGFu
Z2Ugc2VlbXMNCg0KdG8gYmUgbm9uLWZ1bmN0aW9uYWwuIFdpdGggQ09ORklHX1hFTl9QQ0lERVZf
U1RVQiB3ZSBmYWlsIHRvIGJ1aWxkIG9uIDMyLWJpdA0KDQphcmNoaXRlY3R1cmVzLi4uDQoNCldo
YXQgd291bGQgYmUgdGhlIHByZWZlcmVuY2UgaGVyZT8gU3RlZmFubyBzdWdnZXN0ZWQgdGhhdCB3
ZSBzdGlsbCBkZWZpbmUNCg0KQ09ORklHX1hFTl9QQ0lERVZfU1RVQiwgYnV0IGluIGRpc2FibGVk
IHN0YXRlLCBlLmcuIHdlIGFkZCB0cmlzdGF0ZSB0byBpdA0KDQppbiB0aGUgc2Vjb25kIHBhdGNo
DQoNCkFub3RoZXIgb3B0aW9uIGlzIGp1c3QgdG8gc3F1YXNoIHRoZSB0d28gcGF0Y2hlcy4NCg0K
Pg0KPiBKYW4NCj4=

