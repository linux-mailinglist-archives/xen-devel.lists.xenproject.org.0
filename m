Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF564205DC
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 08:26:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201185.355609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXHQP-0006Ih-W2; Mon, 04 Oct 2021 06:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201185.355609; Mon, 04 Oct 2021 06:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXHQP-0006Gp-RY; Mon, 04 Oct 2021 06:26:09 +0000
Received: by outflank-mailman (input) for mailman id 201185;
 Mon, 04 Oct 2021 06:26:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h/Ch=OY=epam.com=prvs=0911b85996=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mXHQO-0006Gj-Hf
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 06:26:08 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8b82507-9200-454d-ae90-e7b2a686ecbf;
 Mon, 04 Oct 2021 06:26:07 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1945m8O4021351; 
 Mon, 4 Oct 2021 06:26:04 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bfkk5gqy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 06:26:04 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6065.eurprd03.prod.outlook.com (2603:10a6:208:15c::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Mon, 4 Oct
 2021 06:26:01 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 06:26:01 +0000
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
X-Inumbo-ID: c8b82507-9200-454d-ae90-e7b2a686ecbf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfT+QLxmAa5p+QEBkIpCyM9LQIlO3pIwp/1IPp/AgXtAkCW09c6oBPDfGW+v4vaatAeKjnrlowFzDwK4NJ3VOcZzTS3vRA2EXY0JHmkk6esO0ZIX8NT9zm9uQAImeH223CgtuYK7zPn7Mg19zwRd8gOYQyJBLy1OiQp2nNImt4lMk/uENh3b3BiD7NhZn+5g91RMK97wKWQBvw72v35OlAeJP0Y1vwW2txiMq3foICVQX4LOnaxhgy8WIviOfOnHWH/lB9uOYlydGkwOEpNZieogl6Q6glkuUAN2SvP29JIoEtnoohCYi4fyl+pVpqvruoSXYmFRipD6/n4e5Dx3mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baeOjaEe3e1UPUT4aYEJ5w1rhkqLJaAl/i8/ADtDl5M=;
 b=VjmYzXr6PciMst8v5fw1jX0VlG7XoDKuSkhzNDNlpcRokpH2xYiLWRlYLeXJCLYjEFQWVuV9+A43ZXeysH4t344BhYoj6rZs+/6ZD9Bhm3HjqYIRpjWJvpC+AYL7FYIpZ6vvMeWTSutads0G2fEhrDNhHwM/VWSZDtRQ/EcMB9actJrhkLph5DRA0vSbwfKkiuVc/BClL2U6KOYVhDFyMsRFKxaC5EuA0yaR01kZKyXh/WTvfhMeuB8+SMM8RvdD+pZy1G8h4rI7KgUDl6B3NVcMcefs6nFUlq/XALGnLz9NBQChlbMKRVIMHPUBdI/T+F1HmmqXO5OFjPUBSzBZ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baeOjaEe3e1UPUT4aYEJ5w1rhkqLJaAl/i8/ADtDl5M=;
 b=lCPvn8CdVtVoClNYdzISNhfuhsuSZSMX1fijdtxbzBoE1c6WFUvRZc1rfmIt1v2UKoZHzSjzJgUn/uOCgC3v1rrgIcup5z9lM2A9hU3LnFmKPVE25qio4jQnxB6zn0JYR8v5EhsORL2ufHkND6zJ3jxVbkZVK615UIza7ykspp8fwdF9UunJfUYoN8p/cQ8ntaindf/pJkO2SkDpiIG/JdsFWXnHLky16222aLPMy9ldEuKr4HJpDX2snqrK4NqwiUBDlZVUeZl7++oAMYbO9DbY6ZFTUcDzLLuuAtp3TEYdGFNixhgBm1Knx7nmgQ0uwSjYS4kOgrCnUCl331OnmA==
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
Subject: Re: [PATCH v3 07/11] vpci/header: program p2m with guest BAR view
Thread-Topic: [PATCH v3 07/11] vpci/header: program p2m with guest BAR view
Thread-Index: AQHXtdAjmfMhzz5BYkuDgpOXg2armqu+J5EAgAQ+NYA=
Date: Mon, 4 Oct 2021 06:26:01 +0000
Message-ID: <0d73ef42-0395-92c3-fc4f-81183ce5d5cb@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-8-andr2000@gmail.com>
 <39d756cb-6ea1-b787-b5e6-4d88e763feb1@suse.com>
In-Reply-To: <39d756cb-6ea1-b787-b5e6-4d88e763feb1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce857d4e-de2e-4b87-387b-08d986ffd62c
x-ms-traffictypediagnostic: AM0PR03MB6065:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB6065F68982ED3693D8290E19E7AE9@AM0PR03MB6065.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 W7Ot9ITtqa5FnDhrXzR1d0DbcTjTEhGZI5pmsVjKnX6/YkW3E/We3NiCs/1Lodx68JOa5stayXbhvS6onAtG742Yg43PD0CivkCAtgWR5/B01a34nhAYhje8jAq7VgZCoYZqPydKRfcmxCPnCcuOvDf8ZGzIVUBWKmu317Rpjims6ARhz5nBaRqB/9DX3aouOiOgw+1sOY8hWjS+3GHqjZ/W9XOUUNHkONkO4ZYc/Za5BdbPY2i2uPsgYMIFpgfOSgg+HKv1sGz6Q0dHR18vuBl7YQOHrE+VGR7BwHy+SJcY0ZFiq5C5ZEc5okVJ9Vrku4CP25l/Cc8uag0y8YmmZI43fbEJZl7ljmLxgik/eH4VG81FqwaLyO/f21Rqdtdd7se+yciQIXKvlMJ4CgtXoYTqgGE4uU06MShL6Je3gaLORn/MaPC3NfJa2gdeGNrQlvLt1EV3Ws24ElSD+gl6K0oEUUkWyutx/zRO8G8lk9lv0ZyLU2DoGdycTYZEj67w0kmLbzO1zkMzofgZy8LRypoJhDEDYcDx6M9dcnfOH1/pkklc6LWtSUMGshi2r9d8FFMrqGHfm3iOWq9mPnDDDepS2OpadkzX2V/ChEdA725vR7eWESRTcInX8GNSYlcq02TAio7wX2m3oEmULk+xX+wTa3H8jGEj6z4o/MBcDiGOfyCzPCypIBigqhhqNEskNfbZSdhB1i4uYTrLV37iuMU1hnXuGZrf4RhaeX01mVdqqz8VGy1JISRasfLWRY4J
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(64756008)(6486002)(6512007)(66476007)(38100700002)(316002)(8676002)(55236004)(66556008)(66946007)(36756003)(66446008)(122000001)(83380400001)(6506007)(508600001)(26005)(107886003)(2616005)(76116006)(31686004)(31696002)(71200400001)(5660300002)(54906003)(38070700005)(186003)(2906002)(4326008)(86362001)(8936002)(6916009)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cWZYNDBrYzFZQ2h5UGZjOEx6RVRCUkZCd01DTUpINkhEZlBTYVhJZ1lQc3lj?=
 =?utf-8?B?VzFqaldMU2VMZG9iZXpZd2tpRnRteHVzZUk1V2xuZ3laZ3VWbWJoRjRxT0pV?=
 =?utf-8?B?NXNRc05mZTdJdkNXTStPaTBja3E0aTkvNGh6TWxXM2hyenBsOWpEZHFBYk9Y?=
 =?utf-8?B?UlpkZzBGM291NE9abE1zcVpoanFvSXBBUVZldkpNNUR4c2xER2JRNHdaYXZP?=
 =?utf-8?B?TUozcXFMRncxRVNvalJlNGVUTXVoZkNZQ1pqZEV1T2NQS3BNQm9MYkowVDNt?=
 =?utf-8?B?RExrZ0tBTDFHeCtuZDdJWENTcHlrT2lqcHM5NjlHV1g1KzZ5MUt4d090WFZF?=
 =?utf-8?B?a29xbjFKYkhsR1dkYnRzTmxPUTduY1JWZ0UvaUZyM3VwOUZGNUVKYmcvSUVM?=
 =?utf-8?B?WWc2aDZ1QXhUUlg0QnlZbXFYa01XTllyMnlXZTQvSWlsa1JFWkxUN3V1Rmo3?=
 =?utf-8?B?ZnVLMUR2a2MxUGJkRkpiQVpoSU1NVFl2OGx2M2psbkY2WFVrRDExazNscEdH?=
 =?utf-8?B?NXRNcVNlSkliQUNiLzAwemF4WWVZK1ZmS3RQVjJhSDBpeXY4MEErdjQ1eUho?=
 =?utf-8?B?OFZidy9xTlpPd3VRcWRMam96NmE4Y0orRGdGM3hjdTVUQldjRnJrd2dOUHpP?=
 =?utf-8?B?WnBpNEFVdEFaMXpYSlFnTWhZK3ZnUFozUmVqeW1uQmNuZzFub2RlemJQdDI2?=
 =?utf-8?B?WG53WkRuWEVQaE9sdmRMMGw2NVhWaE9QQzdHVlo4bHduU1ZQMWtrTHJGelh5?=
 =?utf-8?B?ckxIOHMxNVdsU0Z2UVRZT0Myb0JROUo0WHpSV0tyT3Bxa29VZHlMcTU2NytD?=
 =?utf-8?B?d0JjQXhERWE3VUhqMDdQRFdBTXlmMnZMVHZYWUkwd1VPSENrbkt2bzMvd0Jz?=
 =?utf-8?B?cVRZQnZySFhoQmdHMXRpZkw2cVdLdDVqMVl6SnVHZHFTcEw4VFBmNUd3dzQ1?=
 =?utf-8?B?MjhLNXppTGkxUVJyUTVyUGNIY1BucHJ0YU1rUE1sUFdPY2E2YmJ0R0QxNHBQ?=
 =?utf-8?B?T1lFakx4bWVIWVhvaE5Ob2JITlNKbS9DZnNjaVlrRU4zUEZsQmxmZDhwOUtw?=
 =?utf-8?B?YUh2SWZ1MlozYUQ3eW5TUEZZVjlNajBRUndDek9Zd0JqNENDUFc0RkxDak5G?=
 =?utf-8?B?ZXd0d3dGOGphbHNEQjJBTlhrWTR5OEd4UkIxb1plY28vS25TWnpVbUxXTEFa?=
 =?utf-8?B?RjIwZnlJZFZPS2FXbVA4WE00REtRMm5LYi9uS3I1eWUyNFRxa0dRQzltQVoz?=
 =?utf-8?B?b2drdFkrSVVoSGFiZXNCRUZBTVNFaXpUVFdCOEY4eWttMVUzTUV5WVpXcHpi?=
 =?utf-8?B?QjVVRGhrcWFtSzZnRkhBdC9aVHVUWFNPenl3bXZjNkhEODAzUVRRR2NiTWFB?=
 =?utf-8?B?VkJOUFpmdldEK0pRSFhPRkR0SzRMbVhBcnIrRytGMU4yRlg2ZVhqdktuMlBW?=
 =?utf-8?B?bnpaUkNVMEZxd2o1eHBlUUhMSkxkY2FYa3lkbTJ2bGppWnhLeW1KckQ4dFRB?=
 =?utf-8?B?MFJra2s3NXlqRHBoRS9zY2NpV3E5Q0hWTm93amcxZWZ5NTJ3d2w4cnI2U1pS?=
 =?utf-8?B?eCtkbWJ2bXUwZ3I0cjd5aE1rUHhmQmkrTXhLcGIrZnJrTFA4Tjd4NjFNbThy?=
 =?utf-8?B?aXYza1JUQ0NWMllSRHZPR3kvV1J0SFIrOW10Wno2SkRHcHQ2UlRNUkRBSVNn?=
 =?utf-8?B?RzlpcWRxWmtVdXloaXdOWWY5eHFHZCtqWGZSd2w2cE9WU2Z0dHpsUTVhSHRa?=
 =?utf-8?B?elN1RXBIMEdXYmZ0WjMrL3o2SThKd2NpdWE3aVpoYlNKL0IyYkFDZFRJc0dC?=
 =?utf-8?B?SUxYOTN6OVN0eWw2THBBZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05AA2340532E544B8A8DB44D69A6B6D7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce857d4e-de2e-4b87-387b-08d986ffd62c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2021 06:26:01.6017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dr0X/NxzAvN4yFC/pIB+3NmRzRi8zptUsNvCkXJaqqOodu1c+H8Ym+cdX2z88V0N7x3G7duK1gKYE7GAD4NG/gt54i58czap+SFzulUMR+ak2cGPDcGWNHGNfdNIp7mQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6065
X-Proofpoint-GUID: wDpre0daeQzV7uLfshEPclCh4sWpSzqu
X-Proofpoint-ORIG-GUID: wDpre0daeQzV7uLfshEPclCh4sWpSzqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_01,2021-10-01_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110040045

DQoNCk9uIDAxLjEwLjIxIDE2OjM4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMzAuMDkuMjAy
MSAwOTo1MiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0K
Pj4gVGFrZSBpbnRvIGFjY291bnQgZ3Vlc3QncyBCQVIgdmlldyBhbmQgcHJvZ3JhbSBpdHMgcDJt
IGFjY29yZGluZ2x5Og0KPj4gZ2ZuIGlzIGd1ZXN0J3MgdmlldyBvZiB0aGUgQkFSIGFuZCBtZm4g
aXMgdGhlIHBoeXNpY2FsIEJBUiB2YWx1ZSBhcyBzZXQNCj4+IHVwIGJ5IHRoZSBob3N0IGJyaWRn
ZSBpbiB0aGUgaGFyZHdhcmUgZG9tYWluLg0KPj4gVGhpcyB3YXkgaGFyZHdhcmUgZG9hbWluIHNl
ZXMgcGh5c2ljYWwgQkFSIHZhbHVlcyBhbmQgZ3Vlc3Qgc2Vlcw0KPj4gZW11bGF0ZWQgb25lcy4N
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRy
X2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+IEp1c3QgYSBjb3VwbGUgb2Ygbml0cywgYXMgSSBy
ZW1haW4gdW5jb252aW5jZWQgb2YgdGhlIHJhbmdlc2V0IHJlbGF0ZWQNCj4gY2hvaWNlIGluIHRo
ZSBlYXJsaWVyIHBhdGNoLg0KPg0KPj4gQEAgLTM3LDEyICs0MSwyOCBAQCBzdGF0aWMgaW50IG1h
cF9yYW5nZSh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSwgdm9pZCAqZGF0YSwNCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyAqYykNCj4+ICAgew0KPj4gICAg
ICAgY29uc3Qgc3RydWN0IG1hcF9kYXRhICptYXAgPSBkYXRhOw0KPj4gKyAgICBnZm5fdCBzdGFy
dF9nZm47DQo+PiAgICAgICBpbnQgcmM7DQo+PiAgIA0KPj4gICAgICAgZm9yICggOyA7ICkNCj4+
ICAgICAgIHsNCj4+ICAgICAgICAgICB1bnNpZ25lZCBsb25nIHNpemUgPSBlIC0gcyArIDE7DQo+
PiAgIA0KPj4gKyAgICAgICAgLyoNCj4+ICsgICAgICAgICAqIEFueSBCQVIgbWF5IGhhdmUgaG9s
ZXMgaW4gaXRzIG1lbW9yeSB3ZSB3YW50IHRvIG1hcCwgZS5nLg0KPj4gKyAgICAgICAgICogd2Ug
ZG9uJ3Qgd2FudCB0byBtYXAgTVNJLVggcmVnaW9ucyB3aGljaCBtYXkgYmUgYSBwYXJ0IG9mIHRo
YXQgQkFSLA0KPj4gKyAgICAgICAgICogZS5nLiB3aGVuIGEgc2luZ2xlIEJBUiBpcyB1c2VkIGZv
ciBib3RoIE1NSU8gYW5kIE1TSS1YLg0KPiBUaGlzIHNlY29uZCAiZS5nLiIgc2VlbXMsIHRvIG1l
IGF0IGxlYXN0LCBxdWl0ZSByZWR1bmRhbnQgd2l0aCB0aGUgZmlyc3QNCj4gb25lLg0KT2sNCj4N
Cj4+ICsgICAgICAgICAqIEluIHRoaXMgY2FzZSBNU0ktWCByZWdpb25zIGFyZSBzdWJ0cmFjdGVk
IGZyb20gdGhlIG1hcHBpbmcsIGJ1dA0KPj4gKyAgICAgICAgICogbWFwLT5zdGFydF9nZm4gc3Rp
bGwgcG9pbnRzIHRvIHRoZSB2ZXJ5IGJlZ2lubmluZyBvZiB0aGUgQkFSLg0KPj4gKyAgICAgICAg
ICogU28gaWYgdGhlcmUgaXMgYSBob2xlIHByZXNlbnQgdGhlbiB3ZSBuZWVkIHRvIGFkanVzdCBz
dGFydF9nZm4NCj4+ICsgICAgICAgICAqIHRvIHJlZmxlY3QgdGhlIGZhY3Qgb2YgdGhhdCBzdWJz
dHJhY3Rpb24uDQo+PiArICAgICAgICAgKi8NCj4+ICsgICAgICAgIHN0YXJ0X2dmbiA9IGdmbl9h
ZGQobWFwLT5zdGFydF9nZm4sIHMgLSBtZm5feChtYXAtPnN0YXJ0X21mbikpOw0KPj4gKw0KPj4g
KyAgICAgICAgcHJpbnRrKFhFTkxPR19HX0RFQlVHDQo+IERvIHlvdSByZWFsbHkgbWVhbiB0aGlz
IHRvIGJlIGFjdGl2ZSBldmVuIGluIHJlbGVhc2UgYnVpbGRzPyBNaWdodCBnZXQNCj4gcXVpdGUg
bm9pc3kgLi4uDQpJIGNhbiBjaGFuZ2UgdGhpcyBvbmUgdG8gImdkcHJpbnRrKFhFTkxPR19HX0RF
QlVHIg0KYW5kIGxlYXZlIHRoZSBiZWxvdyBvbmUgYXMgInByaW50ayhYRU5MT0dfR19XQVJOSU5H
Ig0KT3IgeW91IGFsc28gbWVhbiB0aGUgd2FybmluZyB0byBiZSBnZHByaW50az8NCj4NCj4+ICsg
ICAgICAgICAgICAgICAiJXNtYXAgWyVseCwgJWx4XSAtPiAlIyJQUklfZ2ZuIiBmb3IgZCVkXG4i
LA0KPiAlcGQgcGxlYXNlIGluIG5ldyBvciBhbHRlcmVkIGNvZGUuDQpXaWxsIGNoYW5nZQ0KPg0K
PiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

