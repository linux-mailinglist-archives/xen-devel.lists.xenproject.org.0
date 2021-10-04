Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FAC4205A7
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 07:59:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201176.355598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXGzd-0002wT-Nr; Mon, 04 Oct 2021 05:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201176.355598; Mon, 04 Oct 2021 05:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXGzd-0002ti-Jv; Mon, 04 Oct 2021 05:58:29 +0000
Received: by outflank-mailman (input) for mailman id 201176;
 Mon, 04 Oct 2021 05:58:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h/Ch=OY=epam.com=prvs=0911b85996=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mXGzc-0002tJ-CD
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 05:58:28 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d65eb80c-57a2-4eb3-a531-e6a7fe3d4ad0;
 Mon, 04 Oct 2021 05:58:27 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1945mJtS024268; 
 Mon, 4 Oct 2021 05:58:24 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bfu8mg25w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 05:58:24 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB2766.eurprd03.prod.outlook.com (2603:10a6:800:dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Mon, 4 Oct
 2021 05:58:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 05:58:21 +0000
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
X-Inumbo-ID: d65eb80c-57a2-4eb3-a531-e6a7fe3d4ad0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moWQp0X0lh74gaXilzCwfi4JBDX9c8aBFkhRzqF9yhmt+vqT51NwaD/ka2H6OGiajLmIp4U6rlU4MFhz3uw6e7OdxshRNUji+UAsLbdnT0jYqA7YlYupCNCG2m3iDwGIszyFRt5YkNFnWpZ4Q13XlcE7/QitGmU9pvJPh1tzM51hvvcQDQzj1Iv8Vyp0JJ9ESv3gu6eZUjMZzi61vGajEq5k2meqVSF835nJ009YrVMPQZbJb8996ldNPpqh1JwW5/5ohAsxzDyXVgZvIK/ShjAvUkdWW7GUD+gn+cYU1MV6zGfZtlT9zHp2jgWHhDb/5xVb/7BlIWYtd+JvNMy1qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Or5bN5AFgnGV9W2xYcfJ1mgb0piJ8h17FuIPymu2rQo=;
 b=YuWSZPK4mb60ah32UWfKN2CXoTaEKv5KIzdU5qHCHmTX7n3m+nKUpUPYJVU4uXfgVqYZ9p/vkUyng+Z4uaJbSUfrz2P1NT0/egy65yLrazTBc/8f4fYULzBrg0uNxiPdeUhCR/qO7aJmr6HvSQjpdL97Hlq89jbUmWTE/ZLJkf2kRoEkdb0sRqPOJqd/kUVQukTxpxUsSe4LcjKHZZFP+Zogyp1+tl77iuAJQP/qBmndLgaG7s2+VyP3R9WP8csz8da5IGnvkBaOui3kFNAL8r95s9o94ZBOvAX+9T1fkSoW2/meXpJ0+buGDV8A7lkJaBbj+wSxFsh48L+rdSzq6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Or5bN5AFgnGV9W2xYcfJ1mgb0piJ8h17FuIPymu2rQo=;
 b=3P0Q23mxJ1RAdvFQBjELiqKQBeTb/v2JWG2XFWXhDYXd0HXZsk6Mr8Vq7+lsmAGBr3rM9KXSMFhluNLdH7L5JVAWMU66Y9fUVp68xXpw+PFqjq2GtnNtfoCfCarUGszMVNtI9WdhiGmtsMRDUsUsMHrUeeBTSNzlckrmWv4b4Oc8SQQ3r92bdNqlHVaMB2OSGGetBFZmRZFjea6nQb6wFscM3Z8/gJwmQIXHmWfA3iyQW9nAm9///iLqa4+RrdgqRWgo23NFWK2rog6vsOkLHCyyxA0UyVXwlZx+n3Ehi/hlCGId8BUrvgYFDMXbWQJZHBzC4JOT6M3RfTFop7irtQ==
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
Subject: Re: [PATCH v3 04/11] vpci/header: Add and remove register handlers
 dynamically
Thread-Topic: [PATCH v3 04/11] vpci/header: Add and remove register handlers
 dynamically
Thread-Index: AQHXtdAhL3wGQmCTxkGG8eG4L2Ylc6u+JFCAgAQ5ugA=
Date: Mon, 4 Oct 2021 05:58:20 +0000
Message-ID: <e3730616-c51f-c453-3f74-584473313e54@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-5-andr2000@gmail.com>
 <2b575750-83a5-588e-fd6b-dd9cdb9500dd@suse.com>
In-Reply-To: <2b575750-83a5-588e-fd6b-dd9cdb9500dd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cced4e55-ee7d-4c7f-b267-08d986fbf853
x-ms-traffictypediagnostic: VI1PR0302MB2766:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB2766DE9213766BE98FD2BAE1E7AE9@VI1PR0302MB2766.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 iQ0Z03GSoEBQk/4IyjhGSGKGj4rSGFwzWzgJE7FThupUqlYWkaVuw2enmqugEaAidEOC3D2OayQyoXEld/nKzks6XgLPhzu4Aagx90sPAa0OGqDJLZ3wyADizevPZajECeM1SvtoHrnsKohYT/0l8Rxt/DWttPymNRA6OwwawLjmixB8cASST17aHflTguBq7aYdyo7bBLnHXGKXJE8nbVFVxvHkQP7qpqSAkKV453dozLAn6ztM27VFx3rQx6g6j4tkjlkqKaoCrGeBnpcvnKSehwlySlECWLjrio+5PFdFdBbdXo2fXo6XRwzvyHuMJSB8hq2xv02I8ThqmtUXjXBNg6ccbO0ECiRptDKG3czV/ZOPVnMtiWx6DzuoaNK1mJ85Ql215nkhE32+711iUDX23sODI20yV9+ZrKgtaIN6VN0CMFkZ5zxue8Pp63NBUMhLm6Wy4BrAnCvCL0SNdQgObmGnWlQyBGWtrwpRcO1/IkTF0BmviARXrGyNTR/OegAZ1VaO+qZCmQ3tUOsDU90sVoPyLxRiilDbHdtAFDDXNVbuMjKWccIWCEUcpKAcPhnHPZvMa+cPRgfUKmLmgGv3pIzVAd3L7GB3t0XgpX/Mdhv2KXxtLsKeToOoxBGa+qBeHanrvp26xFT4A0V1NqBkrWLnx492dNxLgCWCaaeCAABY5+kX5SDz/PR0PVys185mwbqNkFpiMnCJB0SEsQxB1wZVVA6SmAXitbYMQzhOoL/jpeQAu+QyphPdM2B6
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(6512007)(55236004)(53546011)(66946007)(6506007)(2906002)(38070700005)(66556008)(64756008)(66446008)(66476007)(91956017)(6486002)(2616005)(76116006)(107886003)(4326008)(508600001)(122000001)(71200400001)(8936002)(31686004)(6916009)(5660300002)(31696002)(36756003)(186003)(54906003)(8676002)(316002)(26005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cjBZaTYxTGQ5ZDh0VUU5VEpON1hJcGphTXdVTFVvY1N4bVZlQVF6RVhvdjl0?=
 =?utf-8?B?c0VNNnZWNzZQcVVWa2YyN3BmZElHdk9ZN01Ubm9HeFVxZVVyKzdjMEJLeDZv?=
 =?utf-8?B?QVduclErQUR4NUVWVjNZYTE0dmY2NGhVMTRMWjVSRU5RZ3FmMnk4QVV4Qmhm?=
 =?utf-8?B?UzNXbjN0RUZuVlhIVnpSd2EzRUh4SG10UjBaT0o0WlROejN1alNmUGU1dlJD?=
 =?utf-8?B?dWl2TzNsVlhuQ01DOTE5QVZ6L3BQaWxrSS9odjBQV3NRR0dqYnRuNUV0VXdu?=
 =?utf-8?B?aW9MRHVZTzJkenJDYTI5Wkh4Mm9aSDBIYUc5MkhWQmNoaWFVMFR4VFFLaU9o?=
 =?utf-8?B?V2FkallrTEhXZGI4Nm01cmppRVUvOTRyWDNzQU1UOFhGN3lPUk1lMWlPWUJH?=
 =?utf-8?B?dmdVeEpSS0t3MHphWTNrZlFzVXdmLzJWNTJVVzh0eVR6VVF0cmN6N2lnOWt0?=
 =?utf-8?B?RnkxcGhodlhRb0NCeFdyRG1mMXZ0aE5sY083a2ZCV2tvUXVxOVp5THZ3c3FT?=
 =?utf-8?B?cVVHdTdPSFQ1UUtiR1RXd0FNdlBWSXl6VEpYdEVRQUxpVC9jOTdTY1FEZ0FB?=
 =?utf-8?B?aGp1UHhsaitZQ3VFbFhJOUl0NlZjNWN6NndhYnZNQ1Vaa1hBUE5UYlB0T0dF?=
 =?utf-8?B?TzVVRG9ydlp3bG55N3JhckNlRldmVUg3a1BEakVuZ1hSTVM4d1Z3VFM2ZVls?=
 =?utf-8?B?aDJxQmVGdkxqN3JrNWowT09qNlN5QTRHM21Lblo3VkplUG5MMzQ4UllhZWQ1?=
 =?utf-8?B?L1NKaU1tZXNXdE5DZXFEekJxT1hweGU5M3pKQWhNQ1Irc0N4bTRsVFhHb1NC?=
 =?utf-8?B?RlJoZUd2NUFMeVBhVExpa2Zlamc3RU9JM2FrQXNQSWUydmtJZkxZdHovMVBz?=
 =?utf-8?B?TWZ2T2JSSFAra3ZHWlFMK3Y4TERLWlBHQWFWU05zdDVBSnRNUy9sL3FJcHVF?=
 =?utf-8?B?THRsVks0RStJSkRySXJHUEwwYTlvc3dRR0dXMzNnYnFxTHJ1UDRLWVZiQThZ?=
 =?utf-8?B?Rm1pWXRUWEt4MEluMnBJeUVKWW5lRE81cEtIcDZBMnpabHUzRjBYTkJ4YUFw?=
 =?utf-8?B?M3Nac1RpWCtJZVFDaEFHck5XbFFuQXp1Y1FqSFFMRnMzV1Y5V05zNnRFZWhW?=
 =?utf-8?B?Y25RK1cwT1VTbzJhZU55OU5BS0swWDdtRFN0bEpCUFY0ZGxQQ2phSzFuM3VC?=
 =?utf-8?B?d25wbHNYTVFEQndlNUl5RHdkMkRLbGdhL3o4MkQ1THpZZktyN1VPdURFUVph?=
 =?utf-8?B?YUphMWhOK3lzNStaQ1IrazZxZkNETXc0d3V5aWcyYzlrS21Xam11bnFxT2dB?=
 =?utf-8?B?TFFrMHVkc1VhRElXdFU3THh4c2ttWXVvZXI2eS8rYXlUNXA3bXcxTmhnYnpo?=
 =?utf-8?B?K29xVW9ZVDVvWTdqOWM4cFByaE1Ia0tkWElFM2dGUkRSSkRhU3lwbTY2OVdW?=
 =?utf-8?B?bWNOenVVOFFpeXhUckh6NUhmRjhPTTdQM2lKSEpTU1dzNmloU3lXeDhmdUNK?=
 =?utf-8?B?RkV6M2pKbG5kOVdxbkl6RDhQaWJjKzN5dkNQcHpKYm4vSDg4QTh2eS9ueHI0?=
 =?utf-8?B?Z2RvT2s0aGgwTGxGWUtUK3Q5dUxHTWpKUnJiOVlYSFpLcFRuYUIyUHJIa0ZR?=
 =?utf-8?B?a3ZzZlNpQ3M3TFFWMFNGNExPQWFQdEoybUlVYUZaK0ZGNDM1NncydlJJVkFl?=
 =?utf-8?B?VjBIQ0UyY2ZkdU85M3QvNlBKS25nK0JDR0YzNHdYaWlKUHR1ejJIcHVPa1ph?=
 =?utf-8?B?Q3hKalRFVCtzU3UzQVJwY1krTE1YZzdwamVWbCtKNjZpNGt0bnZCL3dxbHVJ?=
 =?utf-8?B?OVNsdEZrSytFNHE0a0t1dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05E45539709DC94F8AD9FA355B991980@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cced4e55-ee7d-4c7f-b267-08d986fbf853
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2021 05:58:20.9260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a7MY/dcZS3zXipvIRPxMlhr4ROiviaauciAXBwA8ShdAfryO966Uis1p/sgjLJwVqnfJgj/csZm/dRt0aNgXw/TSMcAyjLvjLEZZ0EMVKBOlKSBz5niBs62l/bIg4JA3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2766
X-Proofpoint-GUID: xazyIYOI8ok6FRNFUwhiWo3rhSA74Qlu
X-Proofpoint-ORIG-GUID: xazyIYOI8ok6FRNFUwhiWo3rhSA74Qlu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_01,2021-10-01_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110040042

DQoNCk9uIDAxLjEwLjIxIDE2OjI2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMzAuMDkuMjAy
MSAwOTo1MiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBAQCAtNDQ1LDE0ICs0
NTYsMjUgQEAgc3RhdGljIHZvaWQgcm9tX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2
LCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4gICAgICAgICAgIHJvbS0+YWRkciA9IHZhbCAmIFBDSV9S
T01fQUREUkVTU19NQVNLOw0KPj4gICB9DQo+PiAgIA0KPj4gLXN0YXRpYyBpbnQgYWRkX2Jhcl9o
YW5kbGVycyhjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICtzdGF0aWMgdm9pZCBndWVz
dF9yb21fd3JpdGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcs
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHZhbCwgdm9pZCAqZGF0
YSkNCj4+ICt7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyB1aW50MzJfdCBndWVzdF9yb21fcmVh
ZChjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqZGF0YSkNCj4+ICt7DQo+PiArICAgIHJl
dHVybiAweGZmZmZmZmZmOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgaW50IGFkZF9iYXJfaGFu
ZGxlcnMoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIGJvb2wgaXNfaHdkb20pDQo+IEkgcmVt
YWluIHVuY29udmluY2VkIHRoYXQgdGhpcyBib29sZWFuIGlzIHRoZSBiZXN0IHdheSB0byBnbyBo
ZXJlLA0KSSBjYW4gcmVtb3ZlICJib29sIGlzX2h3ZG9tIiBhbmQgaGF2ZSB0aGUgY2hlY2tzIGxp
a2U6DQoNCnN0YXRpYyBpbnQgYWRkX2Jhcl9oYW5kbGVycyhjb25zdCBzdHJ1Y3QgcGNpX2RldiAq
cGRldikNCnsNCi4uLg0KIMKgwqDCoCBpZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihwZGV2LT5kb21h
aW4pICkNCiDCoMKgwqDCoMKgwqDCoCByYyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ks
IHZwY2lfaHdfcmVhZDE2LCBjbWRfd3JpdGUsDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBDSV9DT01NQU5ELCAyLCBoZWFkZXIp
Ow0KIMKgwqDCoCBlbHNlDQogwqDCoMKgwqDCoMKgwqAgcmMgPSB2cGNpX2FkZF9yZWdpc3Rlcihw
ZGV2LT52cGNpLCB2cGNpX2h3X3JlYWQxNiwgZ3Vlc3RfY21kX3dyaXRlLA0KIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBQQ0lfQ09N
TUFORCwgMiwgaGVhZGVyKTsNCklzIHRoaXMgZ29pbmcgdG8gYmUgYmV0dGVyPw0KPiAgIGJ1dA0K
PiBJJ2xsIGxlYXZlIHRoZSBkZWNpc2lvbiB0aGVyZSB0byBSb2dlci4gSnVzdCBhIGNvdXBsZSBv
ZiBuaXRzOg0KPg0KPj4gQEAgLTU5Myw2ICs2MjUsMzAgQEAgc3RhdGljIGludCBpbml0X2JhcnMo
c3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgIH0NCj4+ICAgUkVHSVNURVJfVlBDSV9JTklUKGlu
aXRfYmFycywgVlBDSV9QUklPUklUWV9NSURETEUpOw0KPj4gICANCj4+ICsjaWZkZWYgQ09ORklH
X0hBU19WUENJX0dVRVNUX1NVUFBPUlQNCj4+ICtpbnQgdnBjaV9iYXJfYWRkX2hhbmRsZXJzKGNv
bnN0IHN0cnVjdCBkb21haW4gKmQsIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gK3sN
Cj4+ICsgICAgaW50IHJjOw0KPj4gKw0KPj4gKyAgICAvKiBSZW1vdmUgcHJldmlvdXNseSBhZGRl
ZCByZWdpc3RlcnMuICovDQo+PiArICAgIHZwY2lfcmVtb3ZlX2RldmljZV9yZWdpc3RlcnMocGRl
dik7DQo+PiArDQo+PiArICAgIHJjID0gYWRkX2Jhcl9oYW5kbGVycyhwZGV2LCBpc19oYXJkd2Fy
ZV9kb21haW4oZCkpOw0KPj4gKyAgICBpZiAoIHJjICkNCj4+ICsgICAgICAgIGdkcHJpbnRrKFhF
TkxPR19FUlIsDQo+PiArICAgICAgICAgICAgICAgICAiJXBwOiBmYWlsZWQgdG8gYWRkIEJBUiBo
YW5kbGVycyBmb3IgZG9tJXBkOiAlZFxuIiwNCj4gT25seSAlcGQgcGxlYXNlLCBhcyB0aGF0IGFs
cmVhZHkgZXhwYW5kcyB0byBkPG51bT4uDQpHb29kIGNhdGNoLCB0aGFuayB5b3UhDQo+DQo+PiAr
ICAgICAgICAgICAgICAgICAmcGRldi0+c2JkZiwgZCwgcmMpOw0KPj4gKyAgICByZXR1cm4gcmM7
DQo+IEJsYW5rIGxpbmUgcGxlYXNlIGFoZWFkIG9mIHRoZSBtYWluIHJldHVybiBzdGF0ZW1lbnQg
b2YgYSBmdW5jdGlvbi4NCldpbGwgYWRkDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91LA0KT2xla3Nh
bmRy

