Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAAA4047A4
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 11:17:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182848.330658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGB9-0005vZ-QH; Thu, 09 Sep 2021 09:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182848.330658; Thu, 09 Sep 2021 09:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGB9-0005s6-Ms; Thu, 09 Sep 2021 09:17:07 +0000
Received: by outflank-mailman (input) for mailman id 182848;
 Thu, 09 Sep 2021 09:17:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6so6=N7=epam.com=prvs=9886dc581d=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOGB8-0005s0-Lp
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 09:17:06 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4bb0cd0c-d34c-4926-aa54-0237910ac66b;
 Thu, 09 Sep 2021 09:17:05 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1899E0OG012082; 
 Thu, 9 Sep 2021 09:17:02 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
 by mx0a-0039f301.pphosted.com with ESMTP id 3ayddm8w9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 09:17:02 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6963.eurprd03.prod.outlook.com (2603:10a6:20b:2d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15; Thu, 9 Sep
 2021 09:16:58 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 09:16:58 +0000
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
X-Inumbo-ID: 4bb0cd0c-d34c-4926-aa54-0237910ac66b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aU5Te7fkqva71CCFT0t3QnPQmPSblMH9kO5g1Ni+Ed752q/w7Za82oRGnWn6QS6hblUIO9mtRU9c/rbr9Y2nGKjfdCto1DSaUMOaYT+o0cQZnIJOZwos0pRR/hplg6Q1EQoeVdsbPUoYEtxqTaxjwtXwFV6o/xJGpDZYRXYzE5ZKrvwWvpcMYycf7UiZqYg8/vAHAv9NLbRV2OsuMNQWOl5SXuiTJuQpcp+lPjdaEhg2eUhpCbMvyf0oqaRGv9YZSX7AK0IS02V5Ps5MorUUaHltTks6C+dv7VogVnmmUCtAzjJdj1S9tdxysS2A7s7jZXYWuXsQz9jknKcIzVoqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=chX/GOJFxoeWG/qEndEZOLb8ztbNtxyQ22IOr+l1lS4=;
 b=TQqqeGEMsSteV2ycJ0HDCxtby0sNBxFFV14eN/lpS7ngEJsrR/GQSmNF8qKmOba0BKMGv+2rp1c07XwHfajydXpjbCsAzIBGgc9VXbmxu4/Lmr4zRo1QR3Z53JOwvgTOMlPZwPj5PkoZReI6OjLYa0zrqS0c05/rk0v9SOoBLdDm4vGV7SCQze0DUk3ASmDOODQMdgWKgXxEJ/sw4gOkz49sU6h4YUxugxIitok21CpZSySXerLOxiRanfVZFkQZ3o3SXRcyJrOvX9/siwpE3xxLRzrUZw/54GemJogxJfB55jyyaNaPG5SZIpRTojKHHLIiikXUkOx8XE2XXC6Mfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chX/GOJFxoeWG/qEndEZOLb8ztbNtxyQ22IOr+l1lS4=;
 b=t3I1hAAURy6sFAac7ULkRzQvy3QERGzPXdUd7/DKKl36We6njwXn+c/V0sgXR6BTL04rfVxsIM4naIb2yvXNn8E43+IrTWvySKe1HFkJST5UG/lW4+cAWV4vUZ30oRA9ocPtNnc80xa+BmP0bsZuD4imRktuPCE5WOh0oaHzTbkv7lFj9vyWpIwFCd8S/VT0tCZlynI7J5T8O29g4f24qM+ENVcxRoXc4VVhaZ1My1asnAy7OBvWsbBhHsarA/EtTtSvZTB2xiM0XJ3ZkrkbCHXWN6Ghp8abx5UiRMS4L/+vsmEpQXZmPrYPFEN7nC9+Lk7aM4BmIjIxzZBhiI5peg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
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
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 7/9] vpci/header: program p2m with guest BAR view
Thread-Topic: [PATCH 7/9] vpci/header: program p2m with guest BAR view
Thread-Index: AQHXoKxowwaOW1OR4UKei+2TOBJan6uXHAEAgAQmJoCAACVpAIAADfgA
Date: Thu, 9 Sep 2021 09:16:58 +0000
Message-ID: <b9fe88da-3bdb-0b37-f2f4-9a575806e6de@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-8-andr2000@gmail.com>
 <90813678-d873-d346-5f53-ab97aaedd3e6@suse.com>
 <f35a7bbb-8a9a-06c3-c7b3-60b49013d8e5@epam.com>
 <ee9a69f1-6b47-a944-7255-4ffaa3e1c601@suse.com>
In-Reply-To: <ee9a69f1-6b47-a944-7255-4ffaa3e1c601@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e73ba585-155e-4a6b-15be-08d973729392
x-ms-traffictypediagnostic: AM9PR03MB6963:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB696345396B0F8FDAC631D108E7D59@AM9PR03MB6963.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 i4DGXvuKlOrWm2wDFzQYSZztG1vKwGDCB39is9htYHhRQY1jpddalbj3Jt5+ULHSDYUV0yKipf60D0iSE2VqK+/vn6WMjODCWZH5ClutlYS/fMzSVW5aWYJC6wNtp/g+eNNdYFzzdQxsfJORbuuhoqSoQ4gQlXWXgyimrRhUhhJ9+NG9ZFAHvf4/BfWOaj20ep19JDIWTRIcYgFUEfN+VCDUSf03kauLDeVigV+pus98m9LiEzJDhJYCOA8pVXY6JpX5BoURgbeZMqKh9s/fcFU197xeK3jWpoEzuOF9N1kCJOYfI8lwAk1Rl7PAYLY9y2NMxp0eL3dJQMiad6U0MvJuP1L+gOl0R8a2t23Ww/LWsuej0amNVZQXYvIanzvyQxxWZ/gDaaC9wsBb2J+6rMeUJyIS5vYDXKVLUW/Yo4GHwVxLmuwnxcnV4CLWCLVh45g51bH8kLRN90Z+S2B0qjJ3Y3lLO5L6xqrBktfPQ911e4mm+/uusx//naWEG16q4cvD+IX3ZP9t3DUk5ZG+6uz6JqFohNceOf6KuVKel33BzY0PKt34YuniUludEbs5zbcwynYboQ8VQi1V4mIw6UyD446ZyN3cQdSVR1sLynR3IT1xYlOw8ZZHY7UaMDpfBkKaGvtS337bOBpZFDNEvBg35z95XXys5Iy/yIQrkKNlv7G8Jhh3kyX0+aTCikAYelH6DJYB7BhS66Pf0OeDLxnoaT4+4rgeMOxFlpsM72vPBpR0JDCOlnHmpajyxrs+
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(110136005)(71200400001)(6506007)(6512007)(53546011)(186003)(38070700005)(6486002)(122000001)(4326008)(316002)(5660300002)(86362001)(38100700002)(66556008)(26005)(83380400001)(8936002)(66446008)(64756008)(66476007)(76116006)(91956017)(31696002)(36756003)(508600001)(2616005)(2906002)(54906003)(31686004)(8676002)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WlJkTHR0MVR1c1IwQjBpR2VPNW1UREd4K2lEL0tHSHpvdUVLcnY5NTRTSng4?=
 =?utf-8?B?NXhpN1U1eW9xa2tDOWZIUVRlNXFWaUFGMU9ZbE8zOXJxd3R1NHY4dFQvNUFq?=
 =?utf-8?B?UWlIV3h2ZUNVRnhPMmlBdzlTREJWMytYYTYzME1KZDNlWHBUMStPS0Fxc3FU?=
 =?utf-8?B?QVc3cVQ2RkpFdW8rL2V2TVQ2Z2FLdEJ3SDJncExTc05ZM2paK1NoU2YvYzFB?=
 =?utf-8?B?VENjUHJiS09BWUh6VE5DeVVKd3VDVmgvMkV6REN0QzUwd1FCTU9ydXVQdkRh?=
 =?utf-8?B?UmNXQkVHajZpQ3FVSUlEcE9EU0c1TGphSE5vUHplVjRGNnpsUmtKNWJRMm1N?=
 =?utf-8?B?LzI2RXp5cU05VkpreDVKMkhtWkdkVzl5NE5mVXRuUGY2TGU0UDhFNTJTUWhL?=
 =?utf-8?B?alB0cUxEdERENGdkVjEyektjdThjM1N1RmljU0VsWnQ4RWJmd1Y2aDNWMEZy?=
 =?utf-8?B?SWp4MlVHaFJUUVdtWkpWMmVXb1JmWE1xcndxWFFjTHhsYVUvNUJYdU5mMTZO?=
 =?utf-8?B?cG1KUzNlb09WeTA4czl5U2p6RFBta0tDVVd5c1Z1YjhwdEhURlVHUDNOZVdq?=
 =?utf-8?B?RWtvOWxxQTdKOVFPam45UG9CTFU1TEFnMXBJRUNHb1RTazVxWExCcGdVR0Jl?=
 =?utf-8?B?QlVxL3pzdnZlbVRFbUFRclVrRjdkWHBDV3pQQkdCWXRuRDJjSFg0NEtSdU5x?=
 =?utf-8?B?RmNmQmhDVUJlY1pvR2wvUmx2Zjd4KzZMUHJjTVdjaU10VDNyQ25GS21BV0Fo?=
 =?utf-8?B?RnpkM3M1YSs1RnlzNlM0ZUc5cmhwdDhLUlRvYmV6TDBXa1RxUVIzc2xadmJw?=
 =?utf-8?B?YUM5Vndqa2x3dElnM0VSdUVRd2hpN2tLMmJoQnFRbWVPMFhVZ0d6SGovZllE?=
 =?utf-8?B?b3paN3puWkVCOHpKL2QzZDV1UlVpdDRGdStlbVJETW9tMUIwclRBZHQzNStr?=
 =?utf-8?B?VS9aOU42QVQyTFhLRGRXSG96d2RFTkN2eE13VkVhQU1hVGVhKytzVHZPWTBD?=
 =?utf-8?B?WXBKc3RCUHByV3RQV2NuR05EMmtqMjRFcFpHYm1ZSTl4OXJkeE5MVitJb0Z2?=
 =?utf-8?B?SXNtL01SWjFqVHhSMUVSUjBkK0c5a3FCQmlSODNjMjdRcCtmK0tDWjNUeTdB?=
 =?utf-8?B?STRpMHd4a29aanYyaUNUOGNRWUhhZTZEaUI4N29pWE5UVWNWNld6MG1MV01K?=
 =?utf-8?B?MVBYN0R0NUE0dVRUY0RUdjNrMWdncHQwejZFQWdtZjVTdkZXMG9qbC9Gd3l0?=
 =?utf-8?B?R2RNZDBkRytYUHI4TEtKaWpXK2xiQVkvTGtVc1dsbWxGbjZ3QnRnc0hZbDhP?=
 =?utf-8?B?dTYrTjhESGpUVmppaW1rREI0RXVXNHpnUUZSQzZ5SU5NdFd1ajlFaWhHWlRw?=
 =?utf-8?B?KzFGaDM2YUZydkdBeFpYa3Bqb0lCZnEySlJRQ2Y0VVR2WGJtb2ovMUp6Qkhm?=
 =?utf-8?B?bGx3bDR6Rnd5aGw1Wm5QZElsbWJram5SbFJQL2VwNmJ6OG1iblI4cDQ5eStw?=
 =?utf-8?B?Rmx0T1daQ09ib3VRVFVKMCtiV2ttUktnQVV5aksyNVQrQUlIVU1JUnd5cXlt?=
 =?utf-8?B?R2VuU0RBZHFXMUJwekdPR21FTHlBMngxa2hxM2ZxMmRyQ0pkMjI5UnY4eG9h?=
 =?utf-8?B?OTFicWRqb0JLYnVLSy9qL09hMGhZUHNFdmhWQ2RJQjZRbGpSN01BN3dmZ1dV?=
 =?utf-8?B?M3Q3Y0E3MU41ekNlcWRrK1dFb3FUUkZ1YVJFM2Y3ME5MZkFWSkFnUXBuOUFl?=
 =?utf-8?Q?UayEYM5MYqJlus2KfOacektxmWXHh69EZYUF7TA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CAE81B8B40FE1048B16615AF98F72ADC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e73ba585-155e-4a6b-15be-08d973729392
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 09:16:58.7482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o6kvI8FesfDkzlcNLqb3wXmtclu4JXVjcW5pGoWFlPBM585LG6mWoTIS3pf+o22b2mdUTub6uMbE3KqwBBSDb4LwTw1TD9yjZ1Nr+FaNXKTPqZQO4COZsJO0/6f6csFW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6963
X-Proofpoint-GUID: xk3LBsux2er1dBVXKsXmlN4ZXT_FJch1
X-Proofpoint-ORIG-GUID: xk3LBsux2er1dBVXKsXmlN4ZXT_FJch1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-09_03,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 mlxlogscore=993 priorityscore=1501
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090056

DQpPbiAwOS4wOS4yMSAxMToyNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA5LjA5LjIwMjEg
MDg6MTMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDYuMDkuMjEgMTc6
NTEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDAzLjA5LjIwMjEgMTI6MDgsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBAQCAtMzcsMTIgKzQxLDI4IEBAIHN0YXRpYyBp
bnQgbWFwX3JhbmdlKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB2b2lkICpkYXRh
LA0KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nICpjKQ0KPj4+PiAg
ICB7DQo+Pj4+ICAgICAgICBjb25zdCBzdHJ1Y3QgbWFwX2RhdGEgKm1hcCA9IGRhdGE7DQo+Pj4+
ICsgICAgZ2ZuX3Qgc3RhcnRfZ2ZuOw0KPj4+PiAgICAgICAgaW50IHJjOw0KPj4+PiAgICANCj4+
Pj4gICAgICAgIGZvciAoIDsgOyApDQo+Pj4+ICAgICAgICB7DQo+Pj4+ICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyBzaXplID0gZSAtIHMgKyAxOw0KPj4+PiAgICANCj4+Pj4gKyAgICAgICAgLyoN
Cj4+Pj4gKyAgICAgICAgICogQW55IEJBUiBtYXkgaGF2ZSBob2xlcyBpbiBpdHMgbWVtb3J5IHdl
IHdhbnQgdG8gbWFwLCBlLmcuDQo+Pj4+ICsgICAgICAgICAqIHdlIGRvbid0IHdhbnQgdG8gbWFw
IE1TSSByZWdpb25zIHdoaWNoIG1heSBiZSBhIHBhcnQgb2YgdGhhdCBCQVIsDQo+Pj4+ICsgICAg
ICAgICAqIGUuZy4gd2hlbiBhIHNpbmdsZSBCQVIgaXMgdXNlZCBmb3IgYm90aCBNTUlPIGFuZCBN
U0kuDQo+Pj4+ICsgICAgICAgICAqIEluIHRoaXMgY2FzZSBNU0kgcmVnaW9ucyBhcmUgc3VidHJh
Y3RlZCBmcm9tIHRoZSBtYXBwaW5nLCBidXQNCj4+Pj4gKyAgICAgICAgICogbWFwLT5zdGFydF9n
Zm4gc3RpbGwgcG9pbnRzIHRvIHRoZSB2ZXJ5IGJlZ2lubmluZyBvZiB0aGUgQkFSLg0KPj4+PiAr
ICAgICAgICAgKiBTbyBpZiB0aGVyZSBpcyBhIGhvbGUgcHJlc2VudCB0aGVuIHdlIG5lZWQgdG8g
YWRqdXN0IHN0YXJ0X2dmbg0KPj4+PiArICAgICAgICAgKiB0byByZWZsZWN0IHRoZSBmYWN0IG9m
IHRoYXQgc3Vic3RyYWN0aW9uLg0KPj4+PiArICAgICAgICAgKi8NCj4+Pj4gKyAgICAgICAgc3Rh
cnRfZ2ZuID0gZ2ZuX2FkZChtYXAtPnN0YXJ0X2dmbiwgcyAtIG1mbl94KG1hcC0+c3RhcnRfbWZu
KSk7DQo+Pj4gSSBtYXkgYmUgbWlzc2luZyBzb21ldGhpbmcsIGJ1dCBkb24ndCB5b3UgbmVlZCB0
byBhZGp1c3QgInNpemUiIHRoZW4NCj4+PiBhcyB3ZWxsPw0KPj4gTm8sIGFzIHJhbmdlIHNldHMg
Z2V0IGNvbnN1bWVkIHdlIGhhdmUgZSBhbmQgcyB1cGRhdGVkIGFjY29yZGluZ2x5LA0KPj4gc28g
ZWFjaCB0aW1lIHNpemUgcmVwcmVzZW50cyB0aGUgcmlnaHQgdmFsdWUuDQo+IEl0IGZlZWxzIGxp
a2Ugc29tZXRoaW5nJ3Mgd3Jvbmcgd2l0aCB0aGUgcmFuZ2VzZXQgY29uc3RydWN0aW9uIHRoZW46
DQo+IEVpdGhlciBpdCByZXByZXNlbnRzIF9hbGxfIGhvbGVzIChpbmNsdWRpbmcgZGVnZW5lcmF0
ZSBvbmVzIGF0IHRoZQ0KPiBzdGFydCBvZiBlbmQgb2YgYSByYW5nZSksIG9yIG5vbmUgb2YgdGhl
bS4NCg0KVGhlIHJlc3VsdGluZyByYW5nZSBzZXQgb25seSBoYXMgdGhlIE1NSU9zIGluIGl0LiBX
aGlsZSBjb25zdHJ1Y3RpbmcgdGhlIHJhbmdlIHNldA0KDQp3ZSBjdXQgb2ZmIE1TSS1YIG91dCBv
ZiBpdCAobWFrZSBob2xlcykuIEJ1dCBmaW5hbGx5IGl0IG9ubHkgaGFzIHRoZSByYW5nZXMgdGhh
dCB3ZQ0KDQpuZWVkIHRvIG1hcC91bm1hcC4NCg0KPg0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCg0K
T2xla3NhbmRyDQo=

