Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA8941C07A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 10:17:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198806.352495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUm2-0007RC-Tw; Wed, 29 Sep 2021 08:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198806.352495; Wed, 29 Sep 2021 08:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUm2-0007PO-QL; Wed, 29 Sep 2021 08:17:06 +0000
Received: by outflank-mailman (input) for mailman id 198806;
 Wed, 29 Sep 2021 08:17:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mM9C=OT=epam.com=prvs=09065c5b4f=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mVUm1-0007PI-4u
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 08:17:05 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ec8781a-af25-4cdf-944f-38545501e0a5;
 Wed, 29 Sep 2021 08:17:04 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18T5wVTJ024723; 
 Wed, 29 Sep 2021 08:16:59 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bcg2wrra7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 08:16:59 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3713.eurprd03.prod.outlook.com (2603:10a6:208:41::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Wed, 29 Sep
 2021 08:16:55 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.015; Wed, 29 Sep 2021
 08:16:55 +0000
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
X-Inumbo-ID: 9ec8781a-af25-4cdf-944f-38545501e0a5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n46qY9F7QXQ7CBLVLG6GPN3LSjj9lVBlwZWh5YT+NUbiz9ZbNbZ5W8MQJiTcOeUPM3YBbAL2VkokTN5dQDmGd12LsTTB6EgPGtZZq8m+sR7mUz172HEUdeddEcbzKE0Mkfxe+prjN/9vLF5QofdXXDd4YJqjW2Q2brPO+S8s/XQU60HoFVDQRaR1zdRM0MFGpyoBUEU5omjUD1GxzlAtwJkv0owAEq0Lr6iQKGiG7IM3aeH+gSmHGhkER0Q/fq15gVTGvtItpVmavR39bgTbsWAa5leHIJxEfsZvkRM6vtvL4OwX/Fp65koSQV/XxLNNqeRJqV36Oafkr/m/6FLlhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=GOpDnCXDg05zX46BeGyQhbthEhLxry7AJ9p8Mph3xEU=;
 b=nvj+gHjhkfIyrLZvlIs/oiTKePp7+ocMGPCra7SXFkr+RGMD71KBTbKEmGc86tiI0/CYjb/7cUnvZNNWprauCsXn91ZihAZQg+QMzaVhPPRlF/ULHtKFqlJLMTV6s7pxomJby6dV/NmZsYPfTp6K0uHKjkcPQ4FlGiP231Fks6Rh+LsNP6+xYtHL0ma6hz0lKfqrHB/Vuu1sDiyQht7Ein1z2adFEF48p9vSET22/NYLzppCADHD/kPSqFuuXdfWGUaSoH9cP3TUhbKh/K63dkYCPbZbkk79/jFJgNseIz3O9vG29/mTZhEQiQ/KZRt1kIaOCOyGwPyEGD1HycWfag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOpDnCXDg05zX46BeGyQhbthEhLxry7AJ9p8Mph3xEU=;
 b=i6chVexfdNSFs5+h5NNOnOogz4NWCT/zDIPa9qnys3obIlsEBeiPlig57DRhV4+29KIUH3Eocpr0hEbnD570Bu2UCSMRAIVLJf4I/I/tWqfjiAD+SX/t7MuIqvTfnZzDNGjKLpgUH5BAZ0lu2TZDN41mdcAaLZdozPXODuVY40ZN0F1dxftZrCswFkN/xe6XmKWf6OzH4+Ia7gIv0ns2CWlQA81ITa40m0FNzY/hSayRaC0E3AZIbaYbt3vBCaNx/xl6LuewO9NwXK4VoQ05Imk7A38I+chrvbGlcp/TDRoZc2WD6kZ2c3zAoH6bFO9KL4S85o7+IPkd3tIZLVwqdA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Michal Orzel <michal.orzel@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v2 07/11] vpci/header: program p2m with guest BAR view
Thread-Topic: [PATCH v2 07/11] vpci/header: program p2m with guest BAR view
Thread-Index: AQHXsHpCfe0n3k8oF0eTl7KOfxT3R6u6ssAAgAABBoA=
Date: Wed, 29 Sep 2021 08:16:55 +0000
Message-ID: <2a2a3122-ff1f-9002-9ad1-58f339bb4c42@epam.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-8-andr2000@gmail.com>
 <1a341bc1-f7ad-e7ae-1241-a2d5f38f368f@arm.com>
In-Reply-To: <1a341bc1-f7ad-e7ae-1241-a2d5f38f368f@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d549037-58f9-4312-6ecc-08d983218047
x-ms-traffictypediagnostic: AM0PR03MB3713:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB371318298FDAAE74B295DDD1E7A99@AM0PR03MB3713.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 a8lLMMIhykQF33xcgWPaudqL7WiXnjs6N84CieBElNEZ17jtTnluhxtY/L0IB4o9GpyyiUyw5DqZSgRlSMx37BmoXQYyNaGz0rXLZgHMjFDy4k0o/l/yMZW4p40nmeSIhBTGq4q5YztpaquonGvz62w/ZH0hm6qHw32Cai/xh3wNdE3AdwmCIha+1qjq0+vcDveorz0oZKTMTRhaEHIv+dGz8i7bTlSaNKVRqq7WE7eAg04ryOfqe9K8Eq0Hhj9XxqLDsOAas+2b6bo1+AVY7h9JxXAatIrBb+FGKNor7Fx1m3m385nHks6debw0RZZlcBEv4YBcF0727dX+jT7eMlHr7veAEfNS/n7XmCOuIaOi2J0xe7pcThYlYQ7wTo0KR9ZuPNtjpPrz1b96/5Nfb9c0ZaZLmNT3OM3yS8P5p7IlljpMFWrni3xwaKA2m6AEnn4BdqBEOz7TN6ZWAgPh0PQwNIJ4+aUVmFQQ4ZZYgBf07CdNjIix6ekT964g5VAxjdz8AqmXCV498gtWXtar0A6CcxSxpZR5r/Wpm96rxLrvQ0jONSgzox7ASj+5CX+rT9dXko9KogN624VwSZqlr8euV9mJMCWN4vibHxnVpIseWT6XUHv7WSiUhrO9Re0KZWJBX6LvC9mJczIcu9BokPxA8MZtsnQ7h5IfGiMYByWAaQT2Ac9fRmg7fn/LfEbc9oM/1yFODT8rDVVgFiT0p1LuTnRK9q5JkToL/ysqVqbeU+QGAolwgQRaB3rYVpFh
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(31686004)(6506007)(36756003)(66476007)(64756008)(2616005)(83380400001)(55236004)(66556008)(66446008)(508600001)(4326008)(38070700005)(66946007)(76116006)(107886003)(71200400001)(53546011)(6486002)(2906002)(316002)(38100700002)(122000001)(6512007)(8936002)(31696002)(54906003)(110136005)(26005)(186003)(86362001)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?amRUeDRMMGpYbFZ2SUJqSEx5MFNkWXFPbXpsT1AvMmQ4S0Q3NDRJWWhkVUR2?=
 =?utf-8?B?RUVXYlJ0eG13MG90bFVhY0NRYWxNRUNlREZNRytpTG1qOVo4bGVkc0VnZG9W?=
 =?utf-8?B?bWFnQndJWEZJVWNlODVhT2dSV2ZhVG1Mc25nTnAwUVhvUmp5Sk9zYm5yT1A1?=
 =?utf-8?B?NVJoVE5xTFFvQ0pnNlZBVSs0ajJrcU9EbERwUS9rbys0Yng3TEdyWUFHNEpk?=
 =?utf-8?B?K1M5dWc2TzdGZko2Z2kxbUlhZ2hjWGVVdlhpNmNIV3AxMk5QZURuRHVTT2tS?=
 =?utf-8?B?NjJmVGJJdUxGQ1cxZCt4RXduRnZaak9BcXZ0Q1Y1Sks5b1JEMFZWanhmZnpQ?=
 =?utf-8?B?amVQSUM3NGZPRzNYSEN6ZEhaenhlVmQzWmQrYTIrSkIvQXU2aE9KYXAzQVQ1?=
 =?utf-8?B?WCs0VTV5M3djam4zVldKbjdwTm5iNzQxWFNzeFJXdWZjSUFHMlJPNXJocURR?=
 =?utf-8?B?T1NqYjRhYXB4V1hiSkF0dzhjSW1Wc0tQMGZ1R0dQejJVSHFEcjg0YjZKUHVX?=
 =?utf-8?B?QzQxVEI5R05haEsyellqMXRmQWxGQkJHeHdwSU4rKzUzV3ZSNHdjYmpSem4r?=
 =?utf-8?B?VjdrSGNjT2NmMndLMXlwZjVJUGZRME9mZUIzblduT0VYeStMaGExcG9OTzZD?=
 =?utf-8?B?VjY3TEpMdjRRM1FaQWN2VHV2SS94VFFmdjVlV2U3c1VaK3V3YnZIQzFSajNC?=
 =?utf-8?B?eVlUdDliSGpVN3kyUU52a05neDNQRDhML3ZoRlRhQkM3bXhyN2tSckJlRWtV?=
 =?utf-8?B?bGovWGpheG1mbjhVSHlKd2lKMmI5N2V3Y2VXYXhyb0JNOEtwNU5OSHIweURE?=
 =?utf-8?B?MlpQTE5hbnNLWGo1WCt1dFgyRnVsZnJveFdEb291MGJNQW44YVRieTZ3UGRI?=
 =?utf-8?B?Q2RMUXpiaE1ORERJdEw0MkVZUXJqRjhNMTQzWmUxL3N2cEo2bUVEaGJ6Um50?=
 =?utf-8?B?cVM1VisvRlU0NXpuNC8rM0JveGJrZ2Nob3RpNmlrc2plMnN6a2lhcVZreVlZ?=
 =?utf-8?B?ZnlGK293dGFGZzlkTjZNNHFFN2hyd1VyZWd2UUFpbDcvdi9LWWxDTEhLTFc3?=
 =?utf-8?B?NFZWd250MWdJeFFBRlFUMm9yZXpIZWlQVVAxNTFna2ZpQXBOMzVhQVBvdHF4?=
 =?utf-8?B?bkJRL0FUZE8xbkdUeUFLbjZrUlZwVDRpeXA1bjAvS1lVU2tidU05QnJWeXRk?=
 =?utf-8?B?WmM2d3hmK1A4NmhWTHI2Qks4aU5Va2QvU2lCNDY1Ti9nTkx2dXB3bzlyS2x1?=
 =?utf-8?B?R2JWMEtHcVJNQ2lhb3FkaHR1aUJKQ2Z6UVpZb1JIUllZZUFWa2w4dU56VTZn?=
 =?utf-8?B?a3ZJYkRzcDQ4bDdFamljRWJETTQrc0tycVpxREh3aVJHaXdScitlWGpONDZm?=
 =?utf-8?B?RTJDa0dDRmhFamNsdkdjbDNWaytrekpqRkZWeElGSXVMMUI1TmxMTktHRWpP?=
 =?utf-8?B?bWJIRG9GZlZ5M3YvY0ZSZkZUUER1VC81dEkvbGdsTWp6S09KamlBVmF2eFFP?=
 =?utf-8?B?TWhOYUZVeG9CdjFMZmhIZXV2OFVnR0QveElqcndGTmovTTFQaHRwaVdpTmJ6?=
 =?utf-8?B?SUYzaUhQb0YxTzVMdzVGclFuSmNVSWZraSthYXN6MVZNSVhSanpZQzBWZnM1?=
 =?utf-8?B?eG1zRUtvdXRPaHQ0U2d4STlEOFdnZnppSmdyM3d6YjhrMHhQMUQyMWR2V2VM?=
 =?utf-8?B?RlZJWTB1dGtxRkhidko2OU0vazZ5RTBrZXpwTE5pNmFuMzhSdHV4YVlFWDdH?=
 =?utf-8?B?blA5V0R4UXVmQUpQLy9xVnIyNXc1QXExRCtNVXdEVWNnRnpSZjJLbWlSNCs3?=
 =?utf-8?B?bHZPQ2d2ei83ZHNXWisrQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D9D997E9A1A894E8E0B534C8AC9F1D2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d549037-58f9-4312-6ecc-08d983218047
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2021 08:16:55.7247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y3agMluNOHZTXFSM4pT3O5ujbQiLSBXvWZsuRWCsrpmBg/bGJkyNRyrf+gDgA6EwmGbovtZq8h6GejHN5qORw3BpcV1+GKo/PXMw6gFy3HGO76hlFt3gDFwcpscvXw28
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3713
X-Proofpoint-GUID: qLaRTHc3N9hjO4fKK5m8mBjngETbbk3L
X-Proofpoint-ORIG-GUID: qLaRTHc3N9hjO4fKK5m8mBjngETbbk3L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_02,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109290048

SGksIE1pY2hhbCENCg0KT24gMjkuMDkuMjEgMTE6MTMsIE1pY2hhbCBPcnplbCB3cm90ZToNCj4g
SGkgT2xla3NhbmRyLA0KPg0KPiBPbiAyMy4wOS4yMDIxIDE0OjU0LCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiBUYWtlIGludG8gYWNjb3VudCBndWVz
dCdzIEJBUiB2aWV3IGFuZCBwcm9ncmFtIGl0cyBwMm0gYWNjb3JkaW5nbHk6DQo+PiBnZm4gaXMg
Z3Vlc3QncyB2aWV3IG9mIHRoZSBCQVIgYW5kIG1mbiBpcyB0aGUgcGh5c2ljYWwgQkFSIHZhbHVl
IGFzIHNldA0KPj4gdXAgYnkgdGhlIGhvc3QgYnJpZGdlIGluIHRoZSBoYXJkd2FyZSBkb21haW4u
DQo+PiBUaGlzIHdheSBoYXJkd2FyZSBkb2FtaW4gc2VlcyBwaHlzaWNhbCBCQVIgdmFsdWVzIGFu
ZCBndWVzdCBzZWVzDQo+PiBlbXVsYXRlZCBvbmVzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4N
Cj4+DQo+PiAtLS0NCj4+IFNpbmNlIHYxOg0KPj4gICAtIHMvTVNJL01TSS1YIGluIGNvbW1lbnRz
DQo+PiAtLS0NCj4+ICAgeGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyB8IDM1ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92
cGNpL2hlYWRlci5jIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4gaW5kZXggOWM2MDNk
MjZkMzAyLi5iZGQxODU5OWIyMDUgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hl
YWRlci5jDQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+PiBAQCAtMzAsNiAr
MzAsMTAgQEANCj4+ICAgDQo+PiAgIHN0cnVjdCBtYXBfZGF0YSB7DQo+PiAgICAgICBzdHJ1Y3Qg
ZG9tYWluICpkOw0KPj4gKyAgICAvKiBTdGFydCBhZGRyZXNzIG9mIHRoZSBCQVIgYXMgc2VlbiBi
eSB0aGUgZ3Vlc3QuICovDQo+PiArICAgIGdmbl90IHN0YXJ0X2dmbjsNCj4+ICsgICAgLyogUGh5
c2ljYWwgc3RhcnQgYWRkcmVzcyBvZiB0aGUgQkFSLiAqLw0KPj4gKyAgICBtZm5fdCBzdGFydF9t
Zm47DQo+PiAgICAgICBib29sIG1hcDsNCj4+ICAgfTsNCj4+ICAgDQo+PiBAQCAtMzcsMTIgKzQx
LDI4IEBAIHN0YXRpYyBpbnQgbWFwX3JhbmdlKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQgbG9u
ZyBlLCB2b2lkICpkYXRhLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25n
ICpjKQ0KPj4gICB7DQo+PiAgICAgICBjb25zdCBzdHJ1Y3QgbWFwX2RhdGEgKm1hcCA9IGRhdGE7
DQo+PiArICAgIGdmbl90IHN0YXJ0X2dmbjsNCj4+ICAgICAgIGludCByYzsNCj4+ICAgDQo+PiAg
ICAgICBmb3IgKCA7IDsgKQ0KPj4gICAgICAgew0KPj4gICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
c2l6ZSA9IGUgLSBzICsgMTsNCj4+ICAgDQo+PiArICAgICAgICAvKg0KPj4gKyAgICAgICAgICog
QW55IEJBUiBtYXkgaGF2ZSBob2xlcyBpbiBpdHMgbWVtb3J5IHdlIHdhbnQgdG8gbWFwLCBlLmcu
DQo+PiArICAgICAgICAgKiB3ZSBkb24ndCB3YW50IHRvIG1hcCBNU0ktWCByZWdpb25zIHdoaWNo
IG1heSBiZSBhIHBhcnQgb2YgdGhhdCBCQVIsDQo+PiArICAgICAgICAgKiBlLmcuIHdoZW4gYSBz
aW5nbGUgQkFSIGlzIHVzZWQgZm9yIGJvdGggTU1JTyBhbmQgTVNJLVguDQo+PiArICAgICAgICAg
KiBJbiB0aGlzIGNhc2UgTVNJLVggcmVnaW9ucyBhcmUgc3VidHJhY3RlZCBmcm9tIHRoZSBtYXBw
aW5nLCBidXQNCj4+ICsgICAgICAgICAqIG1hcC0+c3RhcnRfZ2ZuIHN0aWxsIHBvaW50cyB0byB0
aGUgdmVyeSBiZWdpbm5pbmcgb2YgdGhlIEJBUi4NCj4+ICsgICAgICAgICAqIFNvIGlmIHRoZXJl
IGlzIGEgaG9sZSBwcmVzZW50IHRoZW4gd2UgbmVlZCB0byBhZGp1c3Qgc3RhcnRfZ2ZuDQo+PiAr
ICAgICAgICAgKiB0byByZWZsZWN0IHRoZSBmYWN0IG9mIHRoYXQgc3Vic3RyYWN0aW9uLg0KPj4g
KyAgICAgICAgICovDQo+PiArICAgICAgICBzdGFydF9nZm4gPSBnZm5fYWRkKG1hcC0+c3RhcnRf
Z2ZuLCBzIC0gbWZuX3gobWFwLT5zdGFydF9tZm4pKTsNCj4+ICsNCj4+ICsgICAgICAgIHByaW50
ayhYRU5MT0dfR19ERUJVRw0KPj4gKyAgICAgICAgICAgICAgICIlc21hcCBbJWx4LCAlbHhdIC0+
ICUjIlBSSV9nZm4iIGZvciBkJWRcbiIsDQo+PiArICAgICAgICAgICAgICAgbWFwLT5tYXAgPyAi
IiA6ICJ1biIsIHMsIGUsIGdmbl94KHN0YXJ0X2dmbiksDQo+PiArICAgICAgICAgICAgICAgbWFw
LT5kLT5kb21haW5faWQpOw0KPj4gICAgICAgICAgIC8qDQo+PiAgICAgICAgICAgICogQVJNIFRP
RE9zOg0KPj4gICAgICAgICAgICAqIC0gT24gQVJNIHdoZXRoZXIgdGhlIG1lbW9yeSBpcyBwcmVm
ZXRjaGFibGUgb3Igbm90IHNob3VsZCBiZSBwYXNzZWQNCj4+IEBAIC01Miw4ICs3MiwxMCBAQCBz
dGF0aWMgaW50IG1hcF9yYW5nZSh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSwgdm9p
ZCAqZGF0YSwNCj4+ICAgICAgICAgICAgKiAtIHt1bn1tYXBfbW1pb19yZWdpb25zIGRvZXNuJ3Qg
c3VwcG9ydCBwcmVlbXB0aW9uLg0KPj4gICAgICAgICAgICAqLw0KPj4gICANCj4+IC0gICAgICAg
IHJjID0gbWFwLT5tYXAgPyBtYXBfbW1pb19yZWdpb25zKG1hcC0+ZCwgX2dmbihzKSwgc2l6ZSwg
X21mbihzKSkNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgOiB1bm1hcF9tbWlvX3JlZ2lvbnMo
bWFwLT5kLCBfZ2ZuKHMpLCBzaXplLCBfbWZuKHMpKTsNCj4+ICsgICAgICAgIHJjID0gbWFwLT5t
YXAgPyBtYXBfbW1pb19yZWdpb25zKG1hcC0+ZCwgc3RhcnRfZ2ZuLA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZSwgX21mbihzKSkNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgOiB1bm1hcF9tbWlvX3JlZ2lvbnMobWFwLT5kLCBzdGFydF9nZm4sDQo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemUsIF9tZm4o
cykpOw0KPj4gICAgICAgICAgIGlmICggcmMgPT0gMCApDQo+PiAgICAgICAgICAgew0KPj4gICAg
ICAgICAgICAgICAqYyArPSBzaXplOw0KPj4gQEAgLTY5LDYgKzkxLDcgQEAgc3RhdGljIGludCBt
YXBfcmFuZ2UodW5zaWduZWQgbG9uZyBzLCB1bnNpZ25lZCBsb25nIGUsIHZvaWQgKmRhdGEsDQo+
PiAgICAgICAgICAgQVNTRVJUKHJjIDwgc2l6ZSk7DQo+PiAgICAgICAgICAgKmMgKz0gcmM7DQo+
PiAgICAgICAgICAgcyArPSByYzsNCj4+ICsgICAgICAgIGdmbl9hZGQobWFwLT5zdGFydF9nZm4s
IHJjKTsNCj4+ICAgICAgICAgICBpZiAoIGdlbmVyYWxfcHJlZW1wdF9jaGVjaygpICkNCj4+ICAg
ICAgICAgICAgICAgICAgIHJldHVybiAtRVJFU1RBUlQ7DQo+PiAgICAgICB9DQo+PiBAQCAtMTQ5
LDYgKzE3MiwxMCBAQCBib29sIHZwY2lfcHJvY2Vzc19wZW5kaW5nKHN0cnVjdCB2Y3B1ICp2KQ0K
Pj4gICAgICAgICAgICAgICBpZiAoICFiYXItPm1lbSApDQo+PiAgICAgICAgICAgICAgICAgICBj
b250aW51ZTsNCj4+ICAgDQo+PiArICAgICAgICAgICAgZGF0YS5zdGFydF9nZm4gPSBpc19oYXJk
d2FyZV9kb21haW4odi0+dnBjaS5wZGV2LT5kb21haW4pID8NCj4+ICsgICAgICAgICAgICAgICAg
X2dmbihQRk5fRE9XTihiYXItPmFkZHIpKSA6DQo+PiArICAgICAgICAgICAgICAgIF9nZm4oUEZO
X0RPV04oYmFyLT5ndWVzdF9hZGRyKSk7DQo+IEkgYmVsaWV2ZSB0aGlzIHdvdWxkIGxvb2sgYmV0
dGVyIHdpdGggdGhlIGZvbGxvd2luZyBhbGlnbm1lbnQ6DQo+IGRhdGEuc3RhcnRfZ2ZuID0gaXNf
aGFyZHdhcmVfZG9tYWluKHYtPnZwY2kucGRldi0+ZG9tYWluKQ0KPiAgICAgICAgICAgICAgICAg
ICA/IF9nZm4oUEZOX0RPV04oYmFyLT5hZGRyKSkNCj4gICAgICAgICAgICAgICAgICAgOiBfZ2Zu
KFBGTl9ET1dOKGJhci0+Z3Vlc3RfYWRkcikpOw0KSSBjYW4gY2hhbmdlIHRoYXQgaWYgaXQgaW1w
cm92ZXMgcmVhZGFiaWxpdHkNCj4+ICsgICAgICAgICAgICBkYXRhLnN0YXJ0X21mbiA9IF9tZm4o
UEZOX0RPV04oYmFyLT5hZGRyKSk7DQo+PiAgICAgICAgICAgICAgIHJjID0gcmFuZ2VzZXRfY29u
c3VtZV9yYW5nZXMoYmFyLT5tZW0sIG1hcF9yYW5nZSwgJmRhdGEpOw0KPj4gICANCj4+ICAgICAg
ICAgICAgICAgaWYgKCByYyA9PSAtRVJFU1RBUlQgKQ0KPj4gQEAgLTE5NCw2ICsyMjEsMTAgQEAg
c3RhdGljIGludCBfX2luaXQgYXBwbHlfbWFwKHN0cnVjdCBkb21haW4gKmQsIGNvbnN0IHN0cnVj
dCBwY2lfZGV2ICpwZGV2LA0KPj4gICAgICAgICAgIGlmICggIWJhci0+bWVtICkNCj4+ICAgICAg
ICAgICAgICAgY29udGludWU7DQo+PiAgIA0KPj4gKyAgICAgICAgZGF0YS5zdGFydF9nZm4gPSBp
c19oYXJkd2FyZV9kb21haW4oZCkgPw0KPj4gKyAgICAgICAgICAgIF9nZm4oUEZOX0RPV04oYmFy
LT5hZGRyKSkgOg0KPj4gKyAgICAgICAgICAgIF9nZm4oUEZOX0RPV04oYmFyLT5ndWVzdF9hZGRy
KSk7DQo+IFRoaXMgb25lIGFsc28uDQpkaXR0bw0KPj4gKyAgICAgICAgZGF0YS5zdGFydF9tZm4g
PSBfbWZuKFBGTl9ET1dOKGJhci0+YWRkcikpOw0KPj4gICAgICAgICAgIHdoaWxlICggKHJjID0g
cmFuZ2VzZXRfY29uc3VtZV9yYW5nZXMoYmFyLT5tZW0sIG1hcF9yYW5nZSwNCj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkYXRhKSkgPT0gLUVSRVNU
QVJUICkNCj4+ICAgICAgICAgICAgICAgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCk7DQo+Pg0K
PiBDaGVlcnMsDQo+IE1pY2hhbA==

