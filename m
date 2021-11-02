Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 840C4442CCA
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 12:37:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220125.381270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhs6c-0003CJ-8C; Tue, 02 Nov 2021 11:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220125.381270; Tue, 02 Nov 2021 11:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhs6c-00039E-4W; Tue, 02 Nov 2021 11:37:30 +0000
Received: by outflank-mailman (input) for mailman id 220125;
 Tue, 02 Nov 2021 11:37:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8XNU=PV=epam.com=prvs=19406420d3=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mhs6a-00038X-AH
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 11:37:28 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bdecd0d-3fe8-4fb6-9396-98bc810c18e5;
 Tue, 02 Nov 2021 11:37:26 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A2AJhoX012705;
 Tue, 2 Nov 2021 11:37:24 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3c33fv8b9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 11:37:24 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3376.eurprd03.prod.outlook.com (2603:10a6:803:1d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.19; Tue, 2 Nov
 2021 11:37:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 11:37:21 +0000
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
X-Inumbo-ID: 6bdecd0d-3fe8-4fb6-9396-98bc810c18e5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCskQVbj7ExoHIufn3KdIBM1hGCar87lQLOHL0GevPv/JQXdaiIZtkHP/P10bqCKVcO5QfzUfiVP/ScnKHeMuaWho3zjm9SW4gifCSxOJDRz0qLdR0r8K4hjGhNUHOI7u3KC/acp8CPkQ65RnEuiRWNub+KGwuBUxdxK+H52UWkpreJlpn+Ow91HApQExDY9RUDRkNv+aYn6YxucqWt2KQdmt9caqEmQW34OT2zxV0U6Z8r3CWLNijtgte58Csb7o/JkDUMF9bNG0xaBFBFCou0gNmEXUqaaQzQIcsRgVW1XZFqz/OAvLONnvcOTUPGvyieZ4resauIHt4IfoIw3XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yfo3T76HMGwsUVYuWcZgKdzS1lHT1OVl8si1cxNKG0A=;
 b=cJifyOBzu21nXX2IgSW7PP7eRp1iwH7B8A9PnbbDBuUbrsQZ1OFFhUcV0ku0Tv6ACvg6w+KEvHCyk3qT1kYnyDGX3JMDwJ0xJH5+n/6sjKO47oLWjop8xCshmdwbL4Oa3Cqc8ikEdw5vk3v3qhefC4cHMoz2upxIMqrabSFvhvZ7N01eU4XsNXrqHUeZqL7JLsOz8MfVpkNkByMHexqkCwI+1wjpptgT1wMx8necHFPXAjG5QKFvtBPvsXQszyH4rmR7+YxMxYAGVKvIGciONmUnXX3zynpYM1VVH1p6cgrSK6djubXhiheqCSIcRDcp2ar47r7smZk7B+rk9odgEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yfo3T76HMGwsUVYuWcZgKdzS1lHT1OVl8si1cxNKG0A=;
 b=i0SlXpTo0Az+fFuqDnJFgVnW92kbTy6FPl9XYN+pOAc0ETWFzzHXf1P5kGNUd+feMRB5P1VOJCPofPLlR1O7EmYXm3L8c2cAm38XFK/wmpzmKejMZ8mHR/tcszSMX8KNtPVgTeU2ZPLTrciglFmSZJrOfLpmi4TTcrtm7hvQuUXah/ro2FVXQXHk6L4qB22/mqbNGFihOXnOdJ1+qQiPgHUOGLYTfaKAP6tEeX7444/OlsakJnDJmpthS41h0jJGWYaKN1gO7KRZqcctDB560vAg5pYjF86a7RwG8/ZLlcMb0xOcflZ5uOPeVGyYvQCKoOjy6t9VPmmJsbZ1ykLvEQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>, Ian Jackson <iwj@xenproject.org>,
        Juergen Gross
	<jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v5 07/10] libxl: Only map legacy PCI IRQs if they are
 supported
Thread-Topic: [PATCH v5 07/10] libxl: Only map legacy PCI IRQs if they are
 supported
Thread-Index: AQHXvAknuuGQJumtOE+ut83tChlOwKvjzqeAgAAEa4CADG+EAIAAAVUA
Date: Tue, 2 Nov 2021 11:37:21 +0000
Message-ID: <24347673-c286-f76a-33c3-8c3c3f665451@epam.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
 <20211008055535.337436-8-andr2000@gmail.com>
 <YXavl0e0zainVKT9@MacBook-Air-de-Roger.local>
 <3de59765-6bcb-d6a1-7e23-2b85123df71d@epam.com>
 <be2b31d5-5bf5-773b-969c-ba17e8342644@suse.com>
In-Reply-To: <be2b31d5-5bf5-773b-969c-ba17e8342644@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b0df9e0-d925-485d-8c00-08d99df5221a
x-ms-traffictypediagnostic: VI1PR0302MB3376:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB33761B49EF8F6E937F03F4A2E78B9@VI1PR0302MB3376.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MTYY8qSYOWFcIK4NmIFkUhNIRz6pqzDUY6DHRSdXRfhbRhMvya1hs963Lg079IkIRtig5L0sJtNmA7gnQyYplIOLyhL3Nnuz69OlmRZNk4UYme2cGHi4tuFy1eiT4LBFpwueGthVXWQ3G+VqjqdXpruvpxPQlkCyt1zw6ClRFcSgy5o7B0uGWFQ2HtlB9AV4ignxPycIwgx5urwHviWQVbnPfom6gEhjX74lvLyL6A+bSMXxxVV4J06/DuK6xFgY8yTIMq32kyN1a5wOURy/h06FGeB3CaGxhPDnHrmOB2wuBEbPPC+K3hoy926aZx3WROlHUYr0g2W3puY1mtz7xGUgPl5TUGStiIUWOaueCmm59jyGcExmjGUz9iCnXP0qDi6QE64VcLB+kjYIWWEHmCKBltjYLM5lUZG/HHp3n74dMeHhJk8nufOUNbipzujoKwvwjhZMuxzr1SyfbimMdyIJVFacldToa2pKa0XhRr2BNsyn0F6K+6XifrLIdzlnwRgRNrE7hbCNipuviWjtvuTXScX++sDN9m8pN9GCeT5Blaq/I3aw7yRCBHG+1iobRehdBo3xcsYmuHQ8sCya2IUi086dovEZ/RiQiobH9rG0l1N0gssyxpX0yKlE0ZjFsRiVsZrM8kvk2oMUUzFB/Q1kxnbob5Y05SSvUJPILyU70bNtoPCzOvLkGA3YsuaWhbDex6F3N/az8YsCs0Fl0zwNlU/tdrYW0zKtR0xbNVvzYyN76gdLjCKSTrGb/PcV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(76116006)(38100700002)(122000001)(91956017)(4326008)(6506007)(66556008)(66476007)(4744005)(38070700005)(66446008)(64756008)(2906002)(8676002)(186003)(53546011)(71200400001)(8936002)(36756003)(5660300002)(31696002)(6486002)(26005)(6916009)(54906003)(508600001)(7416002)(31686004)(316002)(86362001)(6512007)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?T2trN3Q0QmJBbndBblJVN2lwcG9TcFlsbDVYKzk2SUg2RjNhbDFnOTdXdUVy?=
 =?utf-8?B?aFVRd0hpU2pCMHhJc2FHeCsvWGhwYmRYMW1IVmJsS0pxM1dGbXN4eHJWR0Z3?=
 =?utf-8?B?ZDBPVjlUT3l4YWRXL0VzRXhwbW9jUmI0ck4rWDlZTWdUU2MzbUwyWWJSdkVU?=
 =?utf-8?B?VkxrdXlrT242a2Q1MzMzeUd5MGN4T2tJdHNad0l3YzM2VlFMMlg5a2pQZFBu?=
 =?utf-8?B?RVd6Ukk0TXRIUjVybWtGcTVKOU82blNwQm55a002aDRINTExUGZZN0d3Q0th?=
 =?utf-8?B?cjZjREVkUVZIcEpqL1pJc0ZmbU1PNjg3ZUV1SkRGQkFqUFBKbWZGZzZQVE9n?=
 =?utf-8?B?aHB1QTZ6T01KdVd1b25CeTdrUW5MZTE4MkxxYkVZY2o4WmdxcVhSM1V6YkhJ?=
 =?utf-8?B?Q25ERWpubTFyMkEvQkhFM3lSS2xwOW5oTElwaUgrbEJvRWxaTDJIK0M0NGs1?=
 =?utf-8?B?Nmg5T3VOSWRTakl0M255WjdVVHFQdnNnd0YrM3RtSU1JL283TVA5bmh0TDNZ?=
 =?utf-8?B?TU04SXBxWUduV3o5MUdPYnA1eXh3T3c4QUtZOEs4YWVZQjlMdmdLYjh1dWZR?=
 =?utf-8?B?UURBM2UyZjR2WEZCR3crTVRUQnFzbWF1am1wUzVVMG91Yk01L1NuRC9Bdjdy?=
 =?utf-8?B?ZDhuZUhHbWxIbUpFNHlhOGFSeWtobWhkK0luK0JrSC9iaUoyNEdGMGpkYmNW?=
 =?utf-8?B?ZUU4UkN5NjZYZzZIbGswaUZrK2NOOUo0YW1jbkc5dWJSa0RKemVIb1h0Y3hy?=
 =?utf-8?B?aU1YWGIzZ3hBOTAwbCtUcC9FTDNvVEpVa3FaRUlyQlYyUWpCOFQzMnAvdVMv?=
 =?utf-8?B?REdZaGtGWnVnTkZnWllsTFFEL0tjSFZYMDZId0Ira3hzcEpadVNSL0MxZkgz?=
 =?utf-8?B?U2tnTUVvYUNIaTIzTzV0ejZaMkVYTTdDWlV4cEhHemhUK2pzNUJhbDRlam9K?=
 =?utf-8?B?aGhOZCtvWTVPOERWSlNHNVN4YWl5WlNxVEFXTW14dEZpYXpZVEVSbHg5OWxN?=
 =?utf-8?B?a1dFaFN1b1E3K1BtS3pvYmYwekxqTnkyMlU4OGp2Nk9QWG9rRyt3WllpTTcw?=
 =?utf-8?B?SEJYT3drc3RWQXliS3NoeXFvQWw2TUFXM010OUMyY1Nlc1ZST1lSTiswVlF0?=
 =?utf-8?B?VjI1OTVkZTNHYVVHNmNqVnEwWVpsdENTejFDZ0o1V29xc2tVUTNxTUxYeFlq?=
 =?utf-8?B?YTh0ZnpNTXg5aHI5T2thWE45ZU1kZ1VNSVluRFJ6R3NCYXNJZFJWVTlHUVBn?=
 =?utf-8?B?dXoxZDFrMk1TelNqTTc1VElQdklTNVhkanhRWDNBY1dNS0E1UEkxMFdZdENW?=
 =?utf-8?B?RTVzMTZjN3pLeWFGM21HcTBOYWx5Mm9mb2I0Q0pnQUR5UFlGUkdDaGtVSExx?=
 =?utf-8?B?WGNjWlU0SWJraUV1VlpDRjY3dzgyYWVEKzRIUVdrWUFadnhpbGRuUW84d1Iv?=
 =?utf-8?B?WndHMkVoQXlzdTJFYkpJYVdFeXdkdDVET2hOMDI1RDdCWE00RDNocU53Q1J6?=
 =?utf-8?B?eUhjNHkwek8zdDhMSXFLV29PSTVmYXd4eElxaGtFZnMvcG4xUitsM3RCMmFI?=
 =?utf-8?B?TmdGdXVLUjJiZStaZnIvM1gwazE1NFFCZEtvUmg3clFvY3haZDAyRkZPbnN4?=
 =?utf-8?B?NnIyR0xCL00rcDRmTkc1Tm43LzJPUnJvSnVhc3FkeHFWUTFuejRZMTA1TkRX?=
 =?utf-8?B?WEtnT2JJVE1IcFJIbCtjNzF6UWNpTS9xYUhYbmM3SXpWQmZXNlhlMEF3aFNi?=
 =?utf-8?B?L2plQUJBeWtKR0RraUcyUnJKakgxeG1JV2FCQXpOL0dBamwwLythTkRteFFY?=
 =?utf-8?B?MHBzRUlmUVdvMXVZN002a0pvMzVHVmJKb1VuVU1TMHBHYmREWXpKbUtVdFlB?=
 =?utf-8?B?UGpBSlFIMTdwcTZQTFFpODc1RE81U0w2SGtnTkh5NXhaaFlCK1FGd2szek1r?=
 =?utf-8?B?Y3l6bEFmU3FTUVM2aERnVEM1RzAyMzhYRGI2UnQwaDZJWTVJRk56SDBtaEFm?=
 =?utf-8?B?K0N5QlN0MzlCc3lHUFFJblU2dmFjY3NoSTVRcVkybkI3Nmo0L3FNdFlnTzdq?=
 =?utf-8?B?dTZURVNsT3BSM0JvZGF5L0dTK0FLNks3alRCZk9TMDdEbks0Z3B2eWh4cjVS?=
 =?utf-8?B?aFoyUmdsZVoxeUZrVHBPODBHQUJjU2thV0NlNE5BNGdNU2hGT1JHcS9zNy9B?=
 =?utf-8?B?TFh3UHF2MXhZVVcyL2lMWmNvSlZIN0VsemlzZy9ndzE4MXpJS01pMlA0Z09E?=
 =?utf-8?B?WWZ0T0JjWDM4TXVERkRZQ2NNVFR6S1Z2S0FPb3pINHllaTNmOW9CZ0tqdXFS?=
 =?utf-8?B?UFF1d2xRZ2w5TmEzNU9hNWlYYzVueXEyS3Q3OGxUenRFSHYwSzJBdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5BA069CA11ECB468B7ABE1137A51BF0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0df9e0-d925-485d-8c00-08d99df5221a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 11:37:21.2736
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1y0FDuSb4AwYfjBu0YWx/fIfB/LYR+6VYN/EdQzwoCgufGpikNAX4XdwPaHK9ivFu23osAnH7NVMlGQMLaJ4rZOqIQZx6zYw155Kkpv9DneIqi6h3gnNDjEVGz1Ll4Di
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3376
X-Proofpoint-ORIG-GUID: 5jMJ_8-gtTH4UhwZRX4C4hBPJONeypkM
X-Proofpoint-GUID: 5jMJ_8-gtTH4UhwZRX4C4hBPJONeypkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_07,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=930 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111020068

DQoNCk9uIDAyLjExLjIxIDEzOjMyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjUuMTAuMjAy
MSAxNTozOCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAyNS4xMC4yMSAx
NjoyMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBGcmksIE9jdCAwOCwgMjAyMSBh
dCAwODo1NTozMkFNICswMzAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4g
LS0tIGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2kuYw0KPj4+PiArKysgYi90b29scy9saWJz
L2xpZ2h0L2xpYnhsX3BjaS5jDQo+Pj4+IEBAIC0xMzY0LDYgKzEzNjQsMTUgQEAgc3RhdGljIHZv
aWQgcGNpX2FkZF90aW1lb3V0KGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2V2X3RpbWUgKmV2LA0K
Pj4+PiAgICAgICAgcGNpX2FkZF9kbV9kb25lKGVnYywgcGFzLCByYyk7DQo+Pj4+ICAgIH0NCj4+
Pj4gICAgDQo+Pj4+ICtzdGF0aWMgYm9vbCBwY2lfc3VwcF9sZWdhY3lfaXJxKHZvaWQpDQo+Pj4g
QSBuYW1pbmcgbW9yZSBpbmxpbmUgd2l0aCB0aGUgUENJIHNwZWNpZmljYXRpb24gKHNpbmNlIHdl
IGluc2lzdGVkIG9uDQo+Pj4gdXNpbmcgRUNBTSBpbnN0ZWFkIG9mIE1DRkcpIHdvdWxkIGJlIGlu
dHgsIGllOiBwY2lfc3VwcG9ydHNfaW50eC4NCj4+IFRoaXMgd2lsbCByZXF1aXJlIGEgZm9sbG93
IHVwIHBhdGNoIGlmIHdlIGFsbCBhZ3JlZSB0aGlzIGNoYW5nZSBpcyBuZWVkZWQuDQo+PiBASmFu
LCBhcmUgeW91IG9rIHdpdGggdGhlIHJlbmFtZT8NCj4gU3VyZSwgYnV0IG15IHZpZXcgZG9lc24n
dCBtYXR0ZXIgYWxsIHRoaXMgbXVjaCBhbnl3YXkgZm9yIGxpYnhsIGNvZGUuDQpEbyB5b3Ugd2Fu
dCBhIGZvbGxvdy11cCBwYXRjaCBmb3IgdGhpcyBhcyB0aGUgb3JpZ2luYWwgY2hhbmdlIGhhcyBi
ZWVuIG1lcmdlZD8NCj4NCj4gSmFuDQo+DQpUaGFua3MsDQpPbGVrc2FuZHI=

