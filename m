Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1504540C4A5
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 13:56:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187534.336430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQTVl-0001NA-Mt; Wed, 15 Sep 2021 11:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187534.336430; Wed, 15 Sep 2021 11:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQTVl-0001KO-JQ; Wed, 15 Sep 2021 11:55:33 +0000
Received: by outflank-mailman (input) for mailman id 187534;
 Wed, 15 Sep 2021 11:55:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFB7=OF=epam.com=prvs=9892afeb01=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mQTVj-0001KI-S3
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 11:55:32 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3529b484-06ef-42ef-aa8d-de39ec1c8679;
 Wed, 15 Sep 2021 11:55:30 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18FAwY3x017285; 
 Wed, 15 Sep 2021 11:55:28 GMT
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59])
 by mx0a-0039f301.pphosted.com with ESMTP id 3b3d53rsnd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 11:55:27 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5940.eurprd03.prod.outlook.com (2603:10a6:208:15a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 11:55:25 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%3]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 11:55:25 +0000
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
X-Inumbo-ID: 3529b484-06ef-42ef-aa8d-de39ec1c8679
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PspGxfzzQLPU4lVATu3MAx+j3BmD/YDGx1RE0oblgM+SMpjfxBZh+uB9YGPdar+TN38sz2NmSu38pFWWeoxuxn732E2r0cEpr19AcPl4Bi43vcflLYfzFL13WoY9Urz6N5MsWNB5iQ32cXa0HS8pAz8JRdHk12bmIv7IthuS35kQ5YTt0KKQAcSuRe9Cx6vywEJusipS7vFXWodXms2Iz2KVp3PmIO4QpSsJvHZTszoCy6vAjWdz5YmyxCFBwqAHp7KVykBM13jnjXJxAp8Cw1k82RmvBQP0h0CquGAjWrIFzJhgzSDClPDWMONY77LdiTVjyWzItEO6KDZMHMT/dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=aJ4furlTlTUdKoH9lwvuuuT37pwVAddPVfoym+Z5CPc=;
 b=OycMEN1WeAHLjHjQGco6wdY/jaNRYI9hMhBU72zfI8VQ8DBqTWeusyt267zpOxyldHyuB8J7K4D9wQc8vLtLcyPVy4MQkGZB/CvDFJ2gCv9aMH5MwLXGwjuM2miHslitnjDO+xkgXsOTbgMfddyNkCjFH9/GMlDVSnuJuLt9QzgQh5v1BJD0B83CG8w5GJOAtp6B0R49XhLRVopKhnukP119GJ866+VWhERG+ttxOS4iZYmG63y75Ai1M45KipO1OsIiuvUcIOizq3IyIx5W65YwTCHFth6pWhvtSZNPJzNa37gBCZnLGgUehsgjsl4QVzKnXIqCTAvRSsOXks6DsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJ4furlTlTUdKoH9lwvuuuT37pwVAddPVfoym+Z5CPc=;
 b=u5h31lRJx5Z6KaX/CpjP4weg+kY7KhgmjUJLmoOgf0Ef76fowNylc2clg8AgCXWdXeMcxv/YCabVm8mR1+xEa5gaA7NrBC33GtnRGDPgm9n2mMJZp4FCaB9TEj0C6bYC/BV6Ey8C+C0ILQ0gezil0BElV3LzMu1TH37Mf6eSc+0tmGrg7JAvMnlp78HQ5nmpjtci1Y+5jiFIVtifIR0FtgDip3CG7wtabKGUV9I1Ac3UqG/Lu6WkVhYrAlxu64fAWV/G13fB78dinf6g++0LlZkQwuQCyAsaRdzryGcJ24rCyKMlpW+HT7G1mTCNt7dRf8q8RU7Ku0rQwTnkw8vtkA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Rahul Singh <rahul.singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Index: AQHXoJ6eIuPEzuAZLUmx1GA90MGEBKudvyQAgAXn/ACAAP1GAIAAWBmAgAATZQA=
Date: Wed, 15 Sep 2021 11:55:25 +0000
Message-ID: <067006ee-5390-dc68-c10e-acf236c0e69d@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-10-andr2000@gmail.com>
 <alpine.DEB.2.21.2109101308490.10523@sstabellini-ThinkPad-T480s>
 <6a4e6a1d-12c9-09bb-442d-ce7f6586ef89@epam.com>
 <20b0a8c0-10dc-7473-3c56-a9baeaa43e62@epam.com>
 <6EA9A8EE-8101-4679-832C-A912819891BC@arm.com>
In-Reply-To: <6EA9A8EE-8101-4679-832C-A912819891BC@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2725d1da-eae2-45ac-28ba-08d9783fb463
x-ms-traffictypediagnostic: AM0PR03MB5940:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5940D3BC8FC1911BBE94F126E7DB9@AM0PR03MB5940.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1fzv5gbNgOc2ZaV8tYOu+Bv5r/+W0vCUUtm26DXRKcSl7xZ0ajk791VAJnlYBMk/sUqtvclfptvaluu5BqZvvJDCmUSFC9Z5PkErkNX9u7YMlzu1NTKjtyfm7okWBowdt3C7NteC8KHicCV7kk6lBtqL5oeTv0pKwHcKXYbmDEFALD6g75umbWDb9T4B40YfLMRtkEt3Ko6XyURYZWJgbCaPoDDmUeExOtgVOJkMAdXeUpTPegCt5MFYSAoIRyVCu5Ek/BF/IG0TWjClQ/obq14DpG8/Cy92eIlgNvwCsh6h9ni5zo2YuJ7tfjRxarUvPbS0s6KWvsoL4BhMck+/y/11h6F/4s1gORW059YdZYxctf0QG88uF5YxvRfxM0wzAgiw44T6q5/qWkItQrnLJJelP9+3JUIWqtZfIvtN6ROBIWCfs/oRWkt4e1kkJEV/4+4rNR1OOWlbwcKjbiSO/2JvibnkehZ8xWXG4BUocnnEgaxV6mIUyMbXSnEalvIcRq/2ECMniphj62LTgcE3+gvPK5aBOaau/gtAGiQlNM/NQoLH1bcwCkQAswCY0RNyF3T5jRvSEzXtCrhupGJvydN3ax9qVBIDeF3ZNT9tYURnog0pmYhtNZDBlO0FgBl8nZ0KZPj8fY1yCfHBg7CAXiOqUDHAZA6kKxBcvs8y1wPzSQXZ0vZkRfoDEDNZOExiWU4aJKwlGJeqLzti890/MhRmbmihLwPDyT0iCDnXv/BWp9UTXzMK4XMG8XtO/uUFj/kDnrvl6uqyJAu7xoFC8CWFOhvHrQ9kKSrySlXlazHEdkTqU0qyEsOWhMrSCijX7xn2B29azOnu868hy+zqQw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(2616005)(186003)(966005)(76116006)(36756003)(66476007)(6506007)(64756008)(4326008)(2906002)(54906003)(26005)(6486002)(31696002)(31686004)(316002)(478600001)(8936002)(38100700002)(83380400001)(5660300002)(6512007)(53546011)(66946007)(66446008)(6916009)(8676002)(86362001)(55236004)(38070700005)(71200400001)(66556008)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V0xJdDNBTEpuTU5lV1JsdGZEQld5Sks1VTVnRlpaUENTemVWYTVuUWdESi96?=
 =?utf-8?B?MENTTVlmZXVpdFpkV1N2OW9BTXAvSmluTnI3OWNkNHQwUTJKOUxOaGFJNjJC?=
 =?utf-8?B?VHBRNmJKZFVuL0FDYUVhSkxUU2w1S2E4WkZOKy94c2V0ZDVYOFQ4Unp2MGlw?=
 =?utf-8?B?aEllWlhuMklZN3N6K3lqY0lCK2JPbjRHWUIwSDZkd3hMNDZ5blc2bDV2ZVRN?=
 =?utf-8?B?ZkdrNEJqK211YWhhU0REc3ZsR3hVdWRZN0FETzdZWUJWK24rdERvLy9VZ20z?=
 =?utf-8?B?OUo2VjV3bGxUMGxtUzBJTzFJSVpPaUZJRkVqQ1U4dlRDTGtmKytOTzNBN05k?=
 =?utf-8?B?cVlkNE0yWTlRc2RiRVN6N010LzlQSlRiODJtZlQ4VnBCeDY5ZEo1STBPUDBD?=
 =?utf-8?B?ZjlieHVBTGgrVitrTWlmdEJSYnd0YlJlalVjOGVid2FHSmp3RVRpUXlSa0dy?=
 =?utf-8?B?TXNjdFhkN05WUlRkTHNtcHJzTHVYU3dpQ2U5eTh1bXZsWHFySFU1bDlqdlEz?=
 =?utf-8?B?OUxMc0Jhcm92bTFMQjJ6SUxrTFE2UlJ5YnZaU1dzeGJaaldweDJZK1U4WVVn?=
 =?utf-8?B?cHZuSlRaeU1wdWZFWU1MU05nSU1UWUE4OFY2cWZTWGVJL0ljWjlhb04vbzJO?=
 =?utf-8?B?Nml0bHUybGRoemVENVVJclo4MzRsRURvVUR0UXVoNDR0N0VZdCsxcUtKN1do?=
 =?utf-8?B?MkNlZFhLbFViOFllNWFyNTlGMnVDM2xuMXNHMCs2aFVwQmdwc1lFTE11OHBT?=
 =?utf-8?B?SkJHWVNCLzRWcE54M0JnRDJKVXh5bXpGaVFzWUU0cWdhY1pZbTVLV2poK1lI?=
 =?utf-8?B?TTczeVFGbi9jRFlXVkwwTEs4NG1TUzdmUGU0L050d2c5Nzg4VDlRMHB0UGVP?=
 =?utf-8?B?U3ZFNDdmTVFobHNmVy9JQ1R2Z2pIY1ZEQnV6U2MwV2JSOTNlNURCVm9pWjlr?=
 =?utf-8?B?ZCtNMmdJZ1lhYVFGK1lzWDRHYXlDaDlWQWlIMzc3VThpNHp2R2hUUUIzbGNi?=
 =?utf-8?B?bFNzanBmaTd0MGk0a3VoVVV6ZG53dG1abzJ6Y0ZYdi9TWEQzc1ZpWU95Um8v?=
 =?utf-8?B?Q0tKRDFSdkN3ODh1am1pZ2JOYVFXSXp3dUFSV0pnYndKNzh0dlZmaXpUSkEz?=
 =?utf-8?B?a09SMnZPcEY0TUJ0d3hSZzRqTUlsY1lYQzZ3YWYvZ3lKb04zaGh5aUVCbEVZ?=
 =?utf-8?B?L2RyQjNQSU5WbVBhbmtlem9FNGdpVXh6STduMUxhcnA2REs1OTU2QmpqWk5h?=
 =?utf-8?B?WHR2alVjYVc2UEE1OE1kSVFVV255eENVMkxMWUZXTHdZM1Q4NkloaHNabEtw?=
 =?utf-8?B?bExkYm9yays3ejdwNk1Cb0pWU2o5dDlhR1pKbjVWSi9jLzRKallnQm43R2Zi?=
 =?utf-8?B?cklxa3Q5SmRsNE1aemZ6V3V6QXBFcmp2S3Z4RDJWOVo0Z3dGOWVEaTEveWlZ?=
 =?utf-8?B?N3NKUFVtcFM5NDFET2hxZSt3UlI5L0tRc1pZRlhwYUJzVkVEeEdEQk5ZenJ3?=
 =?utf-8?B?NXppZk5nalQ2QlNBN09mMWw0U2JucG9DTkNuTURjRktKYkRsSnptb0hGYzJV?=
 =?utf-8?B?MUFyY2dXZkgvbmR5bzIrdzhyeVlDK0xPZktvZGhpUTg4TGxZSWpCT0JiejBL?=
 =?utf-8?B?bVR6bFlPL1pLc21iVm5WTHc4SVRSVkgwS2ZROGZJVlBCaFM5N1RCRWNaTWZs?=
 =?utf-8?B?aVVNVmhkcjhUb1ZHSm55bFFtOTZnb0RvQ1ZqVmh0dTduUWQ3S0dtd3RubEV3?=
 =?utf-8?B?bDNoejNUU2NZTDF0UzVxc3VCMDhoaHBTcmZkSlIzMW45bk5iK1o1dUR3dEpm?=
 =?utf-8?B?Yk9JaHhiVmk2QUJKRHIyZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC16366D5AEEB942AC26FB36F80C5697@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2725d1da-eae2-45ac-28ba-08d9783fb463
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 11:55:25.3041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rUvuohleohhyv4KgK4ZjUDPb/kl0cXrIgqoAZTGB7Kl2aVPiHtOpgXE9pGH5Jvs2XZ+yIwEw9A9Y/8NhW4JGlc3BE/y/Zpf68zLZ4f0zoFqDCihkffzSExutwgtl535y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5940
X-Proofpoint-ORIG-GUID: cbZMibfbrbxj0G02uT6UJSaovG4nRGDI
X-Proofpoint-GUID: cbZMibfbrbxj0G02uT6UJSaovG4nRGDI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-15_03,2021-09-15_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150077

DQpPbiAxNS4wOS4yMSAxMzo0NSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+IEhpIE9sZWtzYW5kciwg
U3RlZmFubywNCj4NCj4+IE9uIDE1IFNlcCAyMDIxLCBhdCA2OjMwIGFtLCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyA8T2xla3NhbmRyX0FuZHJ1c2hjaGVua29AZXBhbS5jb20+IHdyb3RlOg0KPj4N
Cj4+IEhpLCBSYWh1bCENCj4+DQo+PiBPbiAxNC4wOS4yMSAxNzoyNCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6DQo+Pj4gfQ0KPj4+Pj4gICAgK3N0YXRpYyBpbnQgcGNpX2VjYW1fcmVn
aXN0ZXJfbW1pb19oYW5kbGVyKHN0cnVjdCBkb21haW4gKmQsDQo+Pj4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqYnJp
ZGdlLA0KPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IHN0cnVjdCBtbWlvX2hhbmRsZXJfb3BzICpvcHMpDQo+Pj4+PiArew0KPj4+Pj4gKyAgICBz
dHJ1Y3QgcGNpX2NvbmZpZ193aW5kb3cgKmNmZyA9IGJyaWRnZS0+c3lzZGF0YTsNCj4+Pj4+ICsN
Cj4+Pj4+ICsgICAgcmVnaXN0ZXJfbW1pb19oYW5kbGVyKGQsIG9wcywgY2ZnLT5waHlzX2FkZHIs
IGNmZy0+c2l6ZSwgTlVMTCk7DQo+Pj4+PiArICAgIHJldHVybiAwOw0KPj4+Pj4gK30NCj4+Pj4g
R2l2ZW4gdGhhdCBzdHJ1Y3QgcGNpX2NvbmZpZ193aW5kb3cgaXMgZ2VuZXJpYyAoaXQgaXMgbm90
IHNwZWNpZmljIHRvDQo+Pj4+IG9uZSBicmlkZ2UpLCBJIHdvbmRlciBpZiB3ZSBldmVuIG5lZWQg
dGhlIC5yZWdpc3Rlcl9tbWlvX2hhbmRsZXINCj4+Pj4gY2FsbGJhY2sgaGVyZS4NCj4+Pj4NCj4+
Pj4gSW4gZmFjdCxwY2lfaG9zdF9icmlkZ2UtPnN5c2RhdGEgZG9lc24ndCBldmVuIG5lZWQgdG8g
YmUgYSB2b2lkKiwgaXQNCj4+Pj4gY291bGQgYmUgYSBzdHJ1Y3QgcGNpX2NvbmZpZ193aW5kb3cq
LCByaWdodD8NCj4+PiBSYWh1bCwgdGhpcyBhY3R1YWxseSBtYXkgY2hhbmdlIHlvdXIgc2VyaWVz
Lg0KPj4+DQo+Pj4gRG8geW91IHRoaW5rIHdlIGNhbiBkbyB0aGF0Pw0KPj4+DQo+PiBUaGlzIGlz
IHRoZSBvbmx5IGNoYW5nZSByZXF1ZXN0ZWQgdGhhdCBsZWZ0IHVuYW5zd2VyZWQgYnkgbm93Lg0K
Pj4NCj4+IFdpbGwgaXQgYmUgcG9zc2libGUgdGhhdCB5b3UgY2hhbmdlIHRoZSBBUEkgYWNjb3Jk
aW5nbHksIHNvIEkgY2FuDQo+Pg0KPj4gaW1wbGVtZW50IGFzIFN0ZWZhbm8gc3VnZ2VzdHM/DQo+
IFdlIG5lZWQgcGNpX2hvc3RfYnJpZGdlLT5zeXNkYXRhIGFzIHZvaWQqIGluIGNhc2Ugd2UgbmVl
ZCB0byBpbXBsZW1lbnQgdGhlIG5ldyBub24tZWNhbSBQQ0kgY29udHJvbGxlciBpbiBYRU4uDQo+
IFBsZWFzZSBoYXZlIGEgbG9vayBvbmNlIGluIExpbnV4IGNvZGVbMV0gaG93IGJyaWRnZS0+c3lz
ZGF0YSB3aWxsIGJlIHVzZWQuIHN0cnVjdCBwY2lfY29uZmlnX3dpbmRvdyBpcyB1c2VkIG9ubHkg
Zm9yDQo+IGVjYW0gc3VwcG9ydGVkIGhvc3QgY29udHJvbGxlci4gRGlmZmVyZW50IFBDSSBob3N0
IGNvbnRyb2xsZXIgd2lsbCBoYXZlIGRpZmZlcmVudCBQQ0kgaW50ZXJmYWNlIHRvIGFjY2VzcyB0
aGUgUENJIGNvbnRyb2xsZXIuDQo+DQo+IFsxXSBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19f
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMv
bGludXguZ2l0L3RyZWUvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJjYXItaG9zdC5jKm4z
MDlfXztJdyEhR0ZfMjlkYmNRSVVCUEEhbWJJX2l1dS1sYVlRb1VuMzZrS2YzejJINEF5eFI0SjhD
NTlDY0tiMjFwTGxkeVZuRGFLYmdKU1FoWjRsaUVud25BZTJ1eks4T0EkIFtnaXRbLl1rZXJuZWxb
Ll1vcmddDQo+DQo+IEkgdGhpbmsgd2UgbmVlZCBicmlkZ2UtPnN5c2RhdGEgaW4gZnV0dXJlIHRv
IGltcGxlbWVudCB0aGUgbmV3IFBDSSBjb250cm9sbGVyLg0KPg0KPiBSZWdhcmRzLA0KPiBSYWh1
bA0KU3RlZmFubywgZG9lcyBpdCBzb3VuZCByZWFzb25hYmxlIHRoZW4gdG8ga2VlcCB0aGUgYWJv
dmUgY29kZSBhcyBpcz8NCj4gICANCj4+IFRoYW5rcywNCj4+DQo+PiBPbGVrc2FuZHI=

