Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C2141C60B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 15:50:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199176.353073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZy2-00051b-TG; Wed, 29 Sep 2021 13:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199176.353073; Wed, 29 Sep 2021 13:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZy2-0004zG-OS; Wed, 29 Sep 2021 13:49:50 +0000
Received: by outflank-mailman (input) for mailman id 199176;
 Wed, 29 Sep 2021 13:49:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mM9C=OT=epam.com=prvs=09065c5b4f=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mVZy1-0004zA-3f
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 13:49:49 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a42bd75a-15cc-4f6d-aed7-cf0c17291b1c;
 Wed, 29 Sep 2021 13:49:47 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18TDJbs6005612; 
 Wed, 29 Sep 2021 13:49:43 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bcrx90448-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 13:49:43 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4148.eurprd03.prod.outlook.com (2603:10a6:208:c7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.19; Wed, 29 Sep
 2021 13:49:38 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.015; Wed, 29 Sep 2021
 13:49:38 +0000
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
X-Inumbo-ID: a42bd75a-15cc-4f6d-aed7-cf0c17291b1c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EymcXtyUMFiWXOzfyVKXEB83wK9g+s0Sq//z3Eojrg5X87JH3pFoN2zsVcMZeGQu5PZZHLNnQ2OVPcYOtWwO1FAOpXGc2N9wLx+0FbT95d0Osso2522xQwDzZVBYHKNuyeo4BL+008PndPjtCe2JqZCx7w03PelAjptXE4Ll7Ry4EgxuIBnPYuGRlGUcpcMyiwUonOBd9XNaa7zWYLizSEr5T8ZA9KVXOSjm9z30x/QOol23RK+5b44CM/vwtgFJZ2IsYR5kpsU6IT4XtxUFKfjhMKVzQ6tyssw4c35SStBVwm8BPA+0vMnrkkewFlSoQOWnzEhRPsWc+HQrt9f2PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=LDjzv/JHOi1ZoCTSe65PJ2JY2i/NlwXfIkaTelbeItA=;
 b=XHivATxkABGL7nJp3T8sMiC+yRlUSpSkTsYZpJKt4f0DNrzrdR0x+4G2lJ7cD8O81q8H3xr3PDfX9KX4ILF2GtbuKqub7kHDuGXmvY4XUivAhinbZw2yc9hwDwWD9v7NKnK1+0v5An+1JZFqZ4NbUOSFURSZDQThsarSsoTAf0P4/QpVOk6Xpk8T9PyQ4Ce4SnbG/0I1dQwxg4VAAOuu9coLwt5WDnAe6P74RICtKBXsKePLatnuJ9EXtwrS8LjzFDFwsoYAymkKD/a/znVQq4Sz7hSc84BabjPL7oTp3mTKoxZx8n33lWc7wM8aqiLS4iaUtoflJiwGS3MbM7YHvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDjzv/JHOi1ZoCTSe65PJ2JY2i/NlwXfIkaTelbeItA=;
 b=lbUBa+Xcp8YyefeKnjk8O+Q5rbxPhj6oaHvVCLV7k7AesnSiUlW1LAqtMh9vRsFAxX2CthKAa46yn0W6jxWRom3woL3RGAUR7B7N/TxfyGRTEg8iFwiFdFRikIozEvQ4FaTF+FEqBrfzOZlLLgA39oiNMat/0dVd2oZurQeKovOPtmQkE0r1Lx4pEzgCZuFhLopO2ozGugGDSg2Fs5Wfkti0kYaDn/KQPUi8BrCBXV5AyG5l21jvLpbRJHM9Eje5jKA6XtmsTbzHi2025e6GLykqD8UfNSEYkJhzChip8eaU07S97os8mAys/9PDHNoeb6zRW5mKkC4LK+FYRbze/g==
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
Thread-Index: 
 AQHXsHpEaYKJY1uGNUmlwbBKeBrI6Ku5GYwAgAAC+oCAAAUNAIAATmyAgAFQpACAAAGzgIAALsGAgAAQSwCAAAYBgIAAAhkAgAAHPoA=
Date: Wed, 29 Sep 2021 13:49:38 +0000
Message-ID: <5dad2004-f507-3610-cdec-cbf26f77cd5a@epam.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-11-andr2000@gmail.com>
 <6a760126-ba6e-bdf7-97a3-205d75d3d99f@arm.com>
 <66cc2b43-eedf-5d58-bf93-5047ecf9ac7b@suse.com>
 <71d8eda6-49f8-691c-1e6b-711ce9f99d50@arm.com>
 <600cc603-5e6c-b430-def3-74a9b596daa0@epam.com>
 <8f5f9b93-2b13-30dc-372b-10326130b71d@epam.com>
 <4bde7d37-6b11-675e-79c1-e6e413fc97f9@suse.com>
 <7402aa24-e203-795b-0ca7-69e55c6b3f4b@epam.com>
 <38d64660-bf9f-98a5-9aef-5a3c39804f7f@suse.com>
 <26c228b1-eb4d-1984-4f24-30dcd24e1cb5@epam.com>
 <548561a6-f878-cacc-cda2-30508a43072d@suse.com>
In-Reply-To: <548561a6-f878-cacc-cda2-30508a43072d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18c614e2-8659-4ad1-e108-08d9834ffae2
x-ms-traffictypediagnostic: AM0PR03MB4148:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4148BB2ABAF96F3EB5DF5817E7A99@AM0PR03MB4148.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 b8Udbz6UzngyhCwSYcW1rBB3GNPf2RkNKB/l2M549AIBPYtrl/Q1oy2RLQd1lzOMGud7Ud6r7E9zWEFrSvvxLSmyCYPKnpPwuvKHWTUu9YXzB898FvzyF/9q3CWZWf0FwlFer9uE2WwrcCjGn8CyCIwkDBf5S+Hv+4w3o6ZwwxhrOyuQKPmRKcoyigZyrzaJJi81Rx8FRhJdrMID7gb9wK4WqCO8E8chWGoqe6MGrNGg7vTPcil0wLFU266Xx5lg9JsHJo82sZ5XdDnLkZKXuf7UEIK4hzNuUfONVh0SZ2ib47eRqmkXc1HYu0a1KjoWcCLJgIvQOWUJq8rM5AK2SHKUl5mVIg9dpo8lBux8PsEOc7Cv1Dd91Bkh3zeLKxVTRtaxNfsk+FsLkPFBVvHBregQXcaa9PSxdpdRuo2Lbiv1zcqeHyYnve9t49CWUVPTCyhYgF8MN7nXDPINb/HiFHbV0ztuzzB/EkluezCR/QZT7LXtC8gzMYFsEb9MLP20x4U2/CdxVwaVHhY5I7Cp56NTyWJk0YwqiyByIuzwfxOALtypAvz9yS4EdtkvgoQrrwUUv7eDdMO4o71p2lJLN4g+h6kbtTg+T9R1uVos77+F9IEWeF9mSvcfje8zO16UiJ9R6dR6pG6vz4Tdax8U9NfTY7xyDWXz8jHMqBu425NS+iGPcjjM5asKImnmjltxaoCP08O//x/vVtBul87n2JP5TMbPuwJfZh4SQvm91ahtaEelPpBtsGZ+RcAcDdk4
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(31696002)(91956017)(2616005)(86362001)(36756003)(31686004)(54906003)(76116006)(38100700002)(122000001)(107886003)(6486002)(2906002)(4326008)(71200400001)(6916009)(26005)(55236004)(316002)(66946007)(186003)(66446008)(66556008)(66476007)(64756008)(8676002)(8936002)(6506007)(53546011)(6512007)(5660300002)(38070700005)(508600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M2Y1UFB0QlJjR0czRE1xb0IydE8waDdMMmVjZm1HVGxDQVFNY1c5K1VwWmtz?=
 =?utf-8?B?ajBOdHFzMlZWQ1AxbmF3cWFBWUZNOGFSYXdiRyt5eGp1Tm9Bc0ZkQ21hVFpN?=
 =?utf-8?B?TlkyNERsMm1ucmUrOEFObUxMSUFKb2NyalQ1OThlbGE2L1pwOHAwOG9SRkNL?=
 =?utf-8?B?SHE1Q0l0S0pXTXBHN2FBS3FFQzhxVHlxYVNtSU5MSkhEMUhoZlBpVzMxSXhs?=
 =?utf-8?B?UEFBWHJLYUFVWklxeDRBa0Z2M1U5UlFlbzBBaW1hRitUM3ZGT3k5M092cmRz?=
 =?utf-8?B?WmJIS0dIdWZIS1hiUXVZWUJudUNXdXR6SjFTWVUwY1VMSkhUUjE5WXlwOFds?=
 =?utf-8?B?MFVZOHFiTnpnSnZpVVpSNVBRNlhIa1pzSHlOMmRoQitnbDVsU3RNS2g5WDUv?=
 =?utf-8?B?NXRRUzZSYXYvZDAvUjJLTklWcWVQcGtuVlRVMnhBSSsxb0IwVEZ4RG52c09i?=
 =?utf-8?B?a3cyaUhGdmRHb0NtSVpUdzRBamtnZUxZWnl2WXJERC9abFhkQWxqRlRzZGxB?=
 =?utf-8?B?TkhPVGppcStMLzczVDM5QlYvWi93N2FCd051QTExM1c2eWRHMWJoZFUxa2th?=
 =?utf-8?B?SVJmQ05OUmZIY1gxcElCNUpmdXAwUlBMT29aN3JRT3FqUHRLc3kvc3FZNnQx?=
 =?utf-8?B?NVdmSnZjT2U5eUR0NFp2MTdHY2sveW9CSktwOEs4THlOemxRa3J3c08xYjdW?=
 =?utf-8?B?azZ5OXNWSmpOSlJJZDNtN3dzQnNWay9lbEJFNjNCK24zZXhuUUQrY0VqSFlB?=
 =?utf-8?B?c1M4bnRKU3E4WGEwdkVWaitEbVNvK3paUVlPWEhyK3NNK05CRHBXM0RVS2Q3?=
 =?utf-8?B?cmZ3ZlN2WWpVdGc1Ni9CYk5aM3R6TVdMV3hzci9UbVVVclhzcEVpYkdVRHRD?=
 =?utf-8?B?eVcwSmlpZnpzejFmK29jSWRlRHQxYSt4VlFUUlFRMGQ1TVE3OTVQNmhYVGg2?=
 =?utf-8?B?MzRYYUc5MURwb1dxZXUvOHJHY1ZhVGptUW1UVzd4YzVUem05YjZlaFdGbXJB?=
 =?utf-8?B?YkI1dndlcTVTRUdtVnA5cUtpVXhHaGRrUSt4Z0o0Q0Z1Z2tNa1dDUzFMVWZ1?=
 =?utf-8?B?ZitCYkU2WG9yQmhrUFI4OE9zMGhCNUhlak05emFjNFJLMnVybDM1Sjl3ODFJ?=
 =?utf-8?B?WEI0eDhoMFA0SXJjU2oxZUpEZEhDNzJkYm55VlJka3k2TVFKU0NBVGg2UW9u?=
 =?utf-8?B?ZWNHNE55dzVwdHA5RW4wSFROdUd5ckc0Z0dmMFUrb29kMzNhWWlpVmZxR2ZT?=
 =?utf-8?B?Uis3RDVETW9Ra3B4M3lOWVhNVU5VSHVNWTdKK2FsSGhjZGp0eHdubUhYaXlC?=
 =?utf-8?B?dHNsbFhGbWlUcWovdUx4QlovS0VFU2VaUVQwdk45WlhHZnBBeCtGdDZISE95?=
 =?utf-8?B?K0kwM0lHcHFaRGQ0cWtKOUQxak5MSVdyOWhlNjUvR2J4bEZvRmlLNnEzNExu?=
 =?utf-8?B?ME8zdkRuUndPd3JFUmJXSmwwenB6VlFORXpjZktwRnJSZ2xPaUZXTTJWeks5?=
 =?utf-8?B?ajBXWS9PSW1SaHgzUEJ0NXdvSjFLV0VRWHhRRy9scGwrcTFCRlREbFVSL21h?=
 =?utf-8?B?cnJlSTd0RmhwbHZ6Y1VRc1dMbVNLUXZ4Sis0OUQzdDY1dkRTTEdvL2ZQT1J1?=
 =?utf-8?B?am9LekNuOTNPNG9rNlNUSHZPejgvRGI5cXNGTWtGMDd0RHFoU2xvdENFTTE2?=
 =?utf-8?B?eHlvQ01tTk9TODd4bC9KVkgxLzlMR2ZGUUN2a1VvM2JnZ2lrbEFsMjJoT0Rv?=
 =?utf-8?B?VmtzTys0V3FLdDc2UWVUTkladTlnV2I0eGNoL0tUYnNreGF1QUc1dGNaazVE?=
 =?utf-8?B?UXJZY3Rwd3JhWFJkVXFoQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A86E25AAA90C134D9C74152CDF13E8C9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c614e2-8659-4ad1-e108-08d9834ffae2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2021 13:49:38.3089
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 40o+kPzM2P0BJkazHqil93kTxjOBeKZ4fHu9FOdI53L50vVdPlbCoMAsWcibOkA99LJd0oZjQ9yn3AuKHi9JXXedZ8peyKXTaMivrBmNVOd5pdeIqkulidj6GTaB5s8/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4148
X-Proofpoint-ORIG-GUID: CPToLJk17EHajEhHou77XrOGBCzg2zUP
X-Proofpoint-GUID: CPToLJk17EHajEhHou77XrOGBCzg2zUP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_05,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 mlxlogscore=836 impostorscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109290086

DQoNCk9uIDI5LjA5LjIxIDE2OjIzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjkuMDkuMjAy
MSAxNToxNiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAyOS4wOS4yMSAx
NTo1NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMjkuMDkuMjAyMSAxMzo1NiwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IE9uIDI5LjA5LjIxIDEyOjA5LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4+IE9uIDI5LjA5LjIwMjEgMTE6MDMsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOg0KPj4+Pj4+IFNvcnJ5IGZvciB0b3AgcG9zdGluZywgYnV0IHRoaXMgaXMg
YSBnZW5lcmFsIHF1ZXN0aW9uIG9uIHRoaXMgcGF0Y2gvZnVuY3Rpb25hbGl0eS4NCj4+Pj4+Pg0K
Pj4+Pj4+IERvIHlvdSBzZWUgd2UgbmVlZCB0byBnYXRlIGFsbCB0aGlzIHdpdGggQ09ORklHX0hB
U19WUENJX0dVRVNUX1NVUFBPUlQNCj4+Pj4+PiBhcyB0aGlzIHJlbmRlcnMgaW4gc29tZXdoYXQg
ZGVhZCBjb2RlIGZvciB4ODYgZm9yIG5vdz8gSSBkbyB0aGluayB0aGlzIHN0aWxsDQo+Pj4+Pj4g
bmVlZHMgdG8gYmUgaW4gdGhlIGNvbW1vbiBjb2RlIHRob3VnaC4NCj4+Pj4+IEkgYWdyZWUgaXQg
d2FudHMgdG8gbGl2ZSBpbiBjb21tb24gY29kZSwgYnV0IEknZCBzdGlsbCBsaWtlIHRoZSBjb2Rl
IHRvDQo+Pj4+PiBub3QgYmxvYXQgeDg2IGJpbmFyaWVzLiBIZW5jZSB5ZXMsIEkgdGhpbmsgdGhl
cmUgd2FudCB0byBiZQ0KPj4+Pj4gImlmICggIUlTX0VOQUJMRUQoKSApIiBlYXJseSBiYWlsb3V0
IHBhdGhzIG9yLCB3aGVuZXZlciB0aGlzIGlzbid0DQo+Pj4+PiBwb3NzaWJsZSB3aXRob3V0IGJy
ZWFraW5nIHRoZSBidWlsZCwgcmVzcGVjdGl2ZSAjaWZkZWYtcy4NCj4+Pj4gVGhlbiBpdCBuZWVk
cyB0byBiZSBkZWZpbmVkIGFzICh4ZW4vZHJpdmVycy9LY29uZmlnKToNCj4+Pj4NCj4+Pj4gY29u
ZmlnIEhBU19WUENJX0dVRVNUX1NVUFBPUlQNCj4+Pj4gICAgwqDCoMKgICMgdlBDSSBndWVzdCBz
dXBwb3J0IGlzIG9ubHkgZW5hYmxlZCBmb3IgQXJtIG5vdw0KPj4+PiAgICDCoMKgwqAgZGVmX2Jv
b2wgeSBpZiBBUk0NCj4+Pj4gICAgwqDCoMKgIGRlcGVuZHMgb24gSEFTX1ZQQ0kNCj4+Pj4NCj4+
Pj4gQmVjYXVzZSBpdCBuZWVkcyB0byBiZSBkZWZpbmVkIGFzICJ5IiBmb3IgQXJtIHdpdGggdlBD
SSBzdXBwb3J0Lg0KPj4+Pg0KPj4+PiBPdGhlcndpc2UgaXQgYnJlYWtzIHRoZSBQQ0kgcGFzc3Ro
cm91Z2ggZmVhdHVyZSwgZS5nLiBpdCBjb21waWxlcywNCj4+Pj4NCj4+Pj4gYnV0IHRoZSByZXN1
bHRpbmcgYmluYXJ5IGJlaGF2ZXMgd3JvbmcuDQo+Pj4+DQo+Pj4+IERvIHlvdSBzZWUgdGhpcyBh
cyBhbiBhY2NlcHRhYmxlIHNvbHV0aW9uPw0KPj4+IExpa2UgYWxsIChvciBhdCBsZWFzdCB0aGUg
bWFqb3JpdHkpIG9mIG90aGVyIEhBU18qLCBpdCBvdWdodCB0byBiZQ0KPj4+ICJzZWxlY3QiLWVk
IChieSBhcm0vS2NvbmZpZykuIElzIHRoZXJlIGEgcmVhc29uIHRoaXMgaXNuJ3QgcG9zc2libGU/
DQo+Pj4gKEkgZG9uJ3QgbWluZCB0aGUgImRlcGVuZHMgb24iLCBhcyBsb25nIGFzIGl0J3MgY2xl
YXIgdGhhdCBpdCBleGlzdHMNCj4+PiBzb2xlbHkgdG8gYWxsb3cga2NvbmZpZyB0byB3YXJuIGFi
b3V0IGJvZ3VzICJzZWxlY3Qicy4pDQo+PiBUaGVyZSBpcyB5ZXQgbm8gS2NvbmZpZyBleGlzdHMg
KGV2ZW4gZm9yIEFybSkgdGhhdCBlbmFibGVzIEhBU19WUENJLA0KPj4NCj4+IHRodXMgSSBjYW4n
dCBkbyB0aGF0IGF0IHRoZSBtb21lbnQgZXZlbiBpZiBJIHdhbnQgdG8uIFllcywgdGhpcyBjYW4g
YmUgZGVmZXJyZWQNCj4+DQo+PiB0byB0aGUgbGF0ZXIgc3RhZ2Ugd2hlbiB3ZSBlbmFibGUgVlBD
SSBmb3IgQXJtLCBiaXQgdGhpcyBjb25maWcgb3B0aW9uIGlzIHN0aWxsDQo+Pg0KPj4gY29uc2lk
ZXJlZCBhcyAiY29tbW9uIGNvZGUiIGFzIHRoZSBmdW5jdGlvbmFsaXR5IGJlaW5nIGFkZGVkDQo+
Pg0KPj4gdG8gdGhlIGNvbW1vbiBjb2RlIGlzIGp1c3QgZ2F0ZWQgd2l0aCBDT05GSUdfSEFTX1ZQ
Q0lfR1VFU1RfU1VQUE9SVC4NCj4+DQo+PiBXaXRoIHRoaXMgZGVmaW5lZCBub3cgYW5kIG5vdCBs
YXRlciB0aGUgY29kZSBzZWVtcyB0byBiZSBjb21wbGV0ZSBhbmQgbW9yZSBjbGVhbg0KPj4NCj4+
IGFzIGl0IGlzIHNlZW4gd2hhdCBpcyB0aGlzIGNvbmZpZ3VyYXRpb24gb3B0aW9uIGFuZCBob3cg
aXQgaXMgZW5hYmxlZCBhbmQgdXNlZCBpbiB0aGUNCj4+DQo+PiBjb2RlLg0KPj4NCj4+IFNvLCBJ
IHNlZSBubyBwcm9ibGVtIGlmIGl0IGlzIGRlZmluZWQgaW4gdGhpcyBLY29uZmlnIGFuZCBldmFs
dWF0ZXMgdG8gIm4iIGZvciB4ODYNCj4+DQo+PiBhbmQgZXZlbnR1YWxseSB3aWxsIGJlICJ5IiBm
b3IgQXJtIHdoZW4gaXQgZW5hYmxlcyBIQVNfVlBDSS4NCj4gSSdtIGFmcmFpZCBJIGRvbid0IHZp
ZXcgdGhpcyBhcyBhIHJlcGx5IHJlZmxlY3RpbmcgdGhhdCB5b3UgaGF2ZQ0KPiB1bmRlcnN0b29k
IHdoYXQgSSdtIGFza2luZyBmb3IuIFRoZSBwcmltYXJ5IHJlcXVlc3QgaXMgZm9yIHRoZXJlIHRv
DQo+IG5vdCBiZSAiZGVmX2Jvb2wgeSIgYnV0IGp1c3QgImJvb2wiIGFjY29tcGFuaWVkIGJ5IGEg
InNlbGVjdCIgaW4NCj4gQXJtJ3MgS2NvbmZpZy4gSWYgSEFTX1ZQQ0kgZG9lc24ndCBleGlzdCBh
cyBhbiBvcHRpb24geWV0LCBzaW1wbHkNCj4gb21pdCB0aGUgKHF1ZXN0aW9uYWJsZSkgImRlcGVu
ZHMgb24iLg0KSSB1bmRlcnN0b29kIHRoYXQsIGJ1dCB3YXMgdHJ5aW5nIHRvIG1ha2Ugc3VyZSB3
ZSBkb24ndCBtaXNzDQp0aGlzIG9wdGlvbiB3aGlsZSBlbmFibGluZyB2UENJIG9uIEFybSwgYnV0
IG9rLCBJJ2xsIGhhdmUgdGhlIGZvbGxvd2luZzoNCmNvbmZpZyBIQVNfVlBDSQ0KIMKgwqDCoCBi
b29sDQoNCmNvbmZpZyBIQVNfVlBDSV9HVUVTVF9TVVBQT1JUDQogwqDCoMKgIGJvb2wNCiDCoMKg
wqAgZGVwZW5kcyBvbiBIQVNfVlBDSQ0KYW5kIHNlbGVjdCBpdCBmb3IgQXJtIHhlbi9hcmNoL2Fy
bS9LY29uZmlnDQo+DQo+IEphbg0KDQo+IFBTOiBUaGUgbW9yZSByZXBsaWVzIEkgZ2V0IGZyb20g
eW91LCB0aGUgbW9yZSBhbm5veWluZyBJIGZpbmQgdGhlDQo+IGluc2VydGlvbiBvZiBibGFuayBs
aW5lcyBiZXR3ZWVuIGV2ZXJ5IHR3byBsaW5lcyBvZiB0ZXh0LiBCbGFuaw0KPiBsaW5lcyBhcmUg
dXN1YWxseSB1c2VkIHRvIHNlcGFyYXRlIHBhcmFncmFwaHMuIElmIGl0IGlzIHlvdXIgbWFpbA0K
PiBwcm9ncmFtIHdoaWNoIGluc2VydHMgdGhlc2UsIGNhbiB5b3UgcGxlYXNlIHRyeSB0byBkbyBz
b21ldGhpbmcNCj4gYWJvdXQgdGhpcz8gVGhhbmtzLg0KPg0KSSBmaXJzdCB0aG91Z2h0IHRoYXQg
dGhpcyBpcyBob3cgVGh1bmRlcmJpcmQgc3RhcnRlZCBzaG93aW5nDQpteSByZXBsaWVzIGFuZCB3
YXMgYWxzbyBjdXJpb3VzIGFib3V0IHRoZSBkaXN0YW5jZSBiZXR3ZWVuIHRoZSBsaW5lcw0Kd2hp
Y2ggc2VlbWVkIHRvIGJlIGFzIGRvdWJsZS1saW5lLCBidXQgSSBjb3VsZG4ndCBkZWxldGUgb3Ig
ZWRpdA0KdGhvc2UuIEkgdGhvdWdodCB0aGlzIGlzIG9ubHkgdmlzaWJsZSB0byBtZS4uLg0KSXQg
Y2FtZSBvdXQgdGhhdCB0aGlzIHdhcyBiZWNhdXNlIG9mIHNvbWUgVGh1bmRlcmJpcmQgc2V0dGlu
Z3Mgd2hpY2gNCm1hZGUgbXkgcmVwbGllcyB3aXRoIHRob3NlIGRvdWJsZS1saW5lcnMuIEhvcGUg
aXQgaXMgZml4ZWQgbm93Lg0KDQpJIGFtIHJlYWxseSBzb3JyeSBhYm91dCB0aGF0IGFuZCBkbyB1
bmRlcnN0YW5kIGhvdyBhbm5veWluZyBpdCB3YXMuDQoNCkJlc3QgcmVnYXJkcywNCk9sZWtzYW5k
cg==

