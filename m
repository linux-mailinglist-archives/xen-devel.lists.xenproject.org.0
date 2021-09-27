Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A56419110
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 10:46:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196532.349420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUmGd-00032N-87; Mon, 27 Sep 2021 08:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196532.349420; Mon, 27 Sep 2021 08:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUmGd-000300-3I; Mon, 27 Sep 2021 08:45:43 +0000
Received: by outflank-mailman (input) for mailman id 196532;
 Mon, 27 Sep 2021 08:45:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1Nw=OR=epam.com=prvs=9904516479=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mUmGb-0002zu-KP
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 08:45:41 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f79fda3-5b70-4732-b871-e781ed1b43f0;
 Mon, 27 Sep 2021 08:45:40 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18R8dGBY028451; 
 Mon, 27 Sep 2021 08:45:38 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bbamm00w4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 08:45:38 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7345.eurprd03.prod.outlook.com (2603:10a6:20b:273::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 08:45:36 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 08:45:36 +0000
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
X-Inumbo-ID: 3f79fda3-5b70-4732-b871-e781ed1b43f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QVhr9Xj/lvjEnR49097+K07D8vDTz0C2UUVQZkINwgfevutkYViotzKKqgmNT7KCrW6YsnSeAfHdFi7GSvmC0hU2Rfk+N/1KAIwm0WznSqQH6nf8jkI9OqVF+eu3SfbEAL5tZ9WYZD7v78rTVBKEVXnX+jv0xvOH7/5PHxGpxIBFzEI3IwcVBvgXtyZpkIjuD1oEMeCAec6B9ClItdrKxLpflmptKJWY3nIrO0T00PpuqzM0o4wX10JacGtSAI4if66z0EW879Nzug4HTwzfpYMl9EpBhlBY4ScbWZeCxtkxnMThi+gm2h/z0LrFAoHSp0c94vxzYV0E/J3Ek/MdyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hGETNBeow91mbr0JYZi6wOx7KspMQktzcVUBI+Y7uN8=;
 b=kt/yFDcajnTyOGcIBgk+FgGriBei+LDDH3dq8Kpnq4/3dDPZrNfQd/gfYzTgNP+NYXIzr0bWiqQXlnwj9XaGPDUu4ZeqXu+vo0mtXsyPoglQA7KEvoAki+ywd9GNIHQYxAmQYFHKT4zJpYO+uQvSWWeG3ft1oPeF+wJGRI0e1Ty8TTjOqljKrND3h4bc2C8cLk8Azwpk3ppqduA62P+lFsiw9cVtVas9m9LrPXQuHvD3L/4MUkrPlw9L2sR6He2xiKgzZc6ffHSO0aAWWnJyN7NE8uBtv66LrSVR/GdfXFyDhBHKKXFL9+nASCjgjU4FE8PQzsn4NZwe4Z+maIdexw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGETNBeow91mbr0JYZi6wOx7KspMQktzcVUBI+Y7uN8=;
 b=rR1IbgBnQrGJvt1lGN04tYn13XUDN+87zjnNKPDYCzqU6MxwbnYnlz6eGkkhFH5cJCshMyAi8CJcqvkEO+wdFKKJNHkexBTwYpt9+dcGIjAvvXEvhzakqU6I4fCIc7sh//DCRr3r5yBqS6jOx944+d2Ljch/CzEJB3G+tcCNwvh77r4Mq3yFDT1fHaPcNoUuQgst6LhJHKwdRUCs+oq9H7pQWSxkiT5i31yQ63/t6ZCe5yRMGLQP67JwRyzglchgQbsTPQuUGbTzIzeaBnn1pFSZe3rj0cSrzKvswaFU9dPFfWNyyYZQOaH2UBaQGRHTuu2B42sx8HAgLjWtYP+e1g==
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
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
Thread-Topic: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
Thread-Index: AQHXsHoyHtx3VKSfZEKPQekyrs7GEau3hnIAgAAQrIA=
Date: Mon, 27 Sep 2021 08:45:36 +0000
Message-ID: <55beed13-3a7f-7269-870c-ee0361e23a1c@epam.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-6-andr2000@gmail.com>
 <443f57db-7b0d-e14a-88bb-78a31c0271d6@suse.com>
In-Reply-To: <443f57db-7b0d-e14a-88bb-78a31c0271d6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49599abe-8ac5-49db-d97f-08d981932cf3
x-ms-traffictypediagnostic: AM9PR03MB7345:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB7345DD057F56F0D36366B760E7A79@AM9PR03MB7345.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0j28hTdQRCnJvewDrhgPexQbrdL8zWfvTw4OtVMoY4MK8MRRYGzAqoZRiyXKHM9hQGVEI05Rma8+UnflgMh3vIjxRg+U/cwahcOXCdS2EUoSApwFwLvRan6X1WtllI6+9CjT4f9+759mZHpHa4WM98Ju65n+f3ATlQBXMznQkjC8FX7yf9gs9V2Te3Qxd3NaXf2pZWMB0dvvoZV7kjtJYP7pgD0GaluYOgrPC7eDFh/uYbwoNF2xkPOCpdG7yc5WEbTN6L7+CLHfCqwjVgeX/VJGCFU3lvjM85riZAzogPWIGE6vXojp7A97fwBuhGALpD71fE7foFJcJHViLxKG3SI1aG74W6jy82dZr2XpyAy8hrs0guIgKl4ZgLUVB8q/jJ5NgDYqsGsrp6Q4iSW7u/L2LMYcKPziM7jJmBfodNrvhLQNUTJhf7IhdWyjVXwAK6XMwoINQDg2GpYcLzrAwIdHEo4PLcpaO8V+fR4f+3kZOCuKVaKQsOU2ghn1EyPYzN0HBBTg8VVKgj6AhbHTB/PH6GSYrLMo30nN+pa5/I4OzABMmjNHc4CDEmYmwARB9w2z9ERq5mXqPg/b1DMq42hAMu3SA4cSFftaCHB1z1gb0Hhq1SxsJcurf1IUzKyi2x7N+WrCLH4ycgdNd1hediKb8zRJcQaQUd31h6nT3NkVdQ/RBCxCH0BkXhi06oWCmAcHbEQJqnGs21h7iuuykTcBAVkxnm6PN1GiiExQFGbmcOOvj6FcTU+GlqbYduFi
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(4744005)(38070700005)(26005)(66946007)(66446008)(64756008)(55236004)(53546011)(6506007)(186003)(6486002)(31696002)(31686004)(66556008)(66476007)(2906002)(6916009)(122000001)(86362001)(91956017)(36756003)(54906003)(38100700002)(8676002)(316002)(4326008)(71200400001)(6512007)(76116006)(508600001)(8936002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cmNtM1I4cENHVHZtSjczMXMwQTd4cnFWYjJHVElRcjNxc0M0eFZuRTZVbVN6?=
 =?utf-8?B?TWpFV1RwUklNekxtVFlCeFp0UnNOQUJ6S2c5dGQyQmFGdS9KN1VPU3JZNnIx?=
 =?utf-8?B?eWt2ckQwVmxVYVIvb24wSnZscjNtQWRsOGM0MFF0RExJM3BoK2FZRUhXVEpy?=
 =?utf-8?B?d2Y2bktscnUvUDhVUXZROUNrOElYcjVwTUJKRmVlZXN0eHMxaFcwbkFMeW9i?=
 =?utf-8?B?ZWhEeDJYK0JKYldtRDRPeUhMb0FTTWVpVWtOSFRVNXhRa3NSeU95ZWFudlpG?=
 =?utf-8?B?MTVOU2Z0UzRtNHZ0VWY5R3JyVzBDTVZzY0t4aCtGbWhNcjNOUVlKM0FXak1O?=
 =?utf-8?B?UDFmS2RaQlYzR1NrQmZUdHhXQW5HNW5DYkttMzFTZEIrQUtyM1BTcFZ4VVhT?=
 =?utf-8?B?S3E1eDVJQlI5alU2ekxKVTVpekFOWTFIM0x3T2k3T2tkc0VXT1l1MnJQVG5z?=
 =?utf-8?B?dHJmcjRnRHFORkczbkFobm1VUDhSUXZIcHZhKzkrWFI3UStkSWlMSXZCemhM?=
 =?utf-8?B?SjNySlNyWTR4Sm4zYkJxYzBLVGtGMkFPak43Tjc0Vlo2dzVGbkFMNHIvTlpz?=
 =?utf-8?B?REdKRnpXVGhxVzJyWFVMM2tycmZ4Ui82WlkwRytlanQ1KzdzZTU2NlM2NE5S?=
 =?utf-8?B?Yk9xMFdvdXdiYWRPZHk2ZnprSEozS0I4ZzZPRGpNbExFcEJ3SmpJVzlFYmhy?=
 =?utf-8?B?VGhMNFB6clZTdjRERXdTYWF2V2ZNWjhoSU9CU2VQKzE5eE8rVndSSzIydHIr?=
 =?utf-8?B?SHdLeDRBK21FVHYrSGxBanF4MEtCUjdzTFF4ZFdvUlA1eHFYeTVkaUZKY2Qz?=
 =?utf-8?B?MXk4MW82VDl4RzVudmZJZmhpTG51UURlcitpeUhJV1pMeHFMakFBR2w5WFJZ?=
 =?utf-8?B?aXlONFplVUlkb2FVMElxRWl3MmlJT29wTjVQdTE4alNBakt1MUdBSkpXVnFT?=
 =?utf-8?B?a2hQVExjSm41SEozc3N2ZU5BU3NuSldBQm51QjFPY2VKcURiNXFIOXRUMGpl?=
 =?utf-8?B?SmxrblRTUlVjNExqRFE3c3UzNHl3WlBjUEpaYUZJSjhyQnI0RkVPNWZHb0tm?=
 =?utf-8?B?ZDdpTUF5K1IrL2N0T3FYbm84TkFWWGpjMXJ0cXBuWlJraE03MTBFSTBlcUN0?=
 =?utf-8?B?azl3RVhVK2srWTM0Y0NlSVg2SDBZNVBkQUcyS1YxLzA5U1dNNEJsSEFvc0kw?=
 =?utf-8?B?TVNYV08rRXQvbTllN05wOE5CbnRTT3RoRkphU0ZiU2NQcW9kMHVneUdGTWVF?=
 =?utf-8?B?OHYzaFVnR3RzY25VbE1jblhFL0EzZ0pQencvMGJLWE9nQ2ZJalJlZTFyc25n?=
 =?utf-8?B?VjN3dHBYRGJrOHN5cGlHYlhaTXhVY1F0dzZhSTIrM3M3RjNKU2JRU1Y3VTIy?=
 =?utf-8?B?aXJOdWRyZStTZmVrR200eUxSNmgweWw4bVFpZmlidmYxb045VlI2clVMU0FZ?=
 =?utf-8?B?a3V4MStsT2VOOTFZNCtDSlFZRjlrcXRGOVJlUGpNOXZObUVXZ1FhMGtGb09L?=
 =?utf-8?B?QWM1dDlCWHRmRXBtR2hyM2dvblFGRi93MWN0dVM5cExUYWlQbUwwSFRFV2pE?=
 =?utf-8?B?ZUtiN2lCbXpXVHNFMTNpY0svRmQzc3BXYm96K2hMVk90eUV0b2ExSkx3RTlP?=
 =?utf-8?B?djQ5NjdoL2xqTnd6Z2NpTDlPTGhRUFhxU0pLUU9XZzRNbnlkNEZyMDh0WXls?=
 =?utf-8?B?R2ZrMzR6M0t4cWZUdW5IODJoYWRuWUVOZGlWR0xuTDd4b2tualRadTBGb0ZX?=
 =?utf-8?B?NnJGejFJY3dCVVFObGJISHNVZEZlOW1vUCt1cW9Vb2dHbnowVFh3L3N1akdo?=
 =?utf-8?B?SlAxaTBvd2pQdlVEaWM5dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7647998DE5B1644B0F9C805D2F7C145@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49599abe-8ac5-49db-d97f-08d981932cf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 08:45:36.2257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TH+qC/8be+hXblMV+JKZDfADOorUV3O6yKWAewU2khSQ2aC88lDHB0fAiRtzTw1JXL5pfYhxGb/MhOJth9Tme46o6KjzzClPSEMzRASRhzf4CsuWgrz3ohBkHf3rEhK8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7345
X-Proofpoint-GUID: BjDK9cGi4wZjwZPald8aqXbrQEAw1tzP
X-Proofpoint-ORIG-GUID: BjDK9cGi4wZjwZPald8aqXbrQEAw1tzP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_02,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=963 adultscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109270059

DQpPbiAyNy4wOS4yMSAxMDo0NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIzLjA5LjIwMjEg
MTQ6NTQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gLS0tIGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Bj
aS5jDQo+PiBAQCAtMzI4LDYgKzMyOCw5IEBAIHN0YXRpYyBzdHJ1Y3QgcGNpX2RldiAqYWxsb2Nf
cGRldihzdHJ1Y3QgcGNpX3NlZyAqcHNlZywgdTggYnVzLCB1OCBkZXZmbikNCj4+ICAgICAgICoo
KHU4KikgJnBkZXYtPmJ1cykgPSBidXM7DQo+PiAgICAgICAqKCh1OCopICZwZGV2LT5kZXZmbikg
PSBkZXZmbjsNCj4+ICAgICAgIHBkZXYtPmRvbWFpbiA9IE5VTEw7DQo+PiArI2lmZGVmIENPTkZJ
R19BUk0NCj4+ICsgICAgcGNpX3RvX2RldihwZGV2KS0+dHlwZSA9IERFVl9QQ0k7DQo+PiArI2Vu
ZGlmDQo+IEkgaGF2ZSB0byBhZG1pdCB0aGF0IEknbSBub3QgaGFwcHkgYWJvdXQgbmV3IENPTkZJ
R188YXJjaD4gY29uZGl0aW9uYWxzDQo+IGhlcmUuIEknZCBwcmVmZXIgdG8gc2VlIHRoaXMgZG9u
ZSBieSBhIG5ldyBhcmNoIGhlbHBlciwgdW5sZXNzIHRoZXJlIGFyZQ0KPiBvYnN0YWNsZXMgSSdt
IG92ZXJsb29raW5nLg0KDQpEbyB5b3UgbWVhbiBzb21ldGhpbmcgbGlrZSBhcmNoX3BjaV9hbGxv
Y19wZGV2KGRldik/DQoNCklmIHNvLCB3aGVyZSBzaG91bGQgd2UgcHV0IHRoaXMgY2FsbD8gQXQg
dGhlIHZlcnkgYmVnaW5uaW5nIG9mIGFsbG9jX3BkZXYNCg0Kb3IgYXQgdGhlIGJvdHRvbSBqdXN0
IGJlZm9yZSByZXR1cm5pbmcgZnJvbSBhbGxvY19wZGV2Pw0KDQo+DQo+IEphbg0KPg0KVGhhbmsg
eW91LA0KDQpPbGVrc2FuZHINCg==

