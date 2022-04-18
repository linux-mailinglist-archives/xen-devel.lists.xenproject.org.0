Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B80505F4B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 23:22:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307594.522777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngYoh-0004aT-Lz; Mon, 18 Apr 2022 21:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307594.522777; Mon, 18 Apr 2022 21:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngYoh-0004XG-IR; Mon, 18 Apr 2022 21:21:51 +0000
Received: by outflank-mailman (input) for mailman id 307594;
 Mon, 18 Apr 2022 21:21:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lLCB=U4=nvidia.com=chaitanyak@srs-se1.protection.inumbo.net>)
 id 1ngYog-0004XA-AN
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 21:21:50 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7eae::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d6a749a-bf5d-11ec-a405-831a346695d4;
 Mon, 18 Apr 2022 23:21:47 +0200 (CEST)
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by DM4PR12MB5101.namprd12.prod.outlook.com (2603:10b6:5:390::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 21:21:45 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b%3]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 21:21:44 +0000
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
X-Inumbo-ID: 8d6a749a-bf5d-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBprRuHTAqjyrdZLgXpxN/jbKb4hf93g0yBGpvMRX64f1U0ECDUBe3wx0loJyLBBBlpOghO4/sW9lj3TpZc3teLjLCeNbUlt8kEKOxH3g3Y9lw+myjikITpmFCZHcTbGTcgpfgq+NvlV1IJsmyIteahFKuMkCnhfFw9QnbmDB+Pkj2dQpu0trz8AGiMEIEZHS5MlwejXn/MWd/V85kzr0hnJhv7/iubLz/KUgOQLnBneogSrzfOkGhW8yF4/NNmfG3XrKvwi3V9l0CeBPMW5v1iK2/JE8jcaHbitsczbmp8C12H6C34YJzswPQJ+HoTl+jylxPVHISMrBs+aRmiXMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SN+jaZlItyVekpsnL569YkoOgGJzVlcO1URdevBm70E=;
 b=hGU44lA9Ofv4clDlJ5I70vAUjnri5bZR86K3cCyV+h7pV98MTZ3HBygl7th/lxWYbzxpvTL2NI/4biUyVDPXmaqzGvSVaf8dZGpJK28fcgtAB/47rx6/mowE1DWgLvqiL1AcZCZK457o9Jro/yJPZUf0FqGAqGUCQJUKykDO6n4YcdUSPFh7wZOfTmWT1sv80+RZjRglYhPWbQv3YXGEaSR1ksygUaI45cLmcarqK9s1VynX1UU4+80yVy6vd6rC+7tZ+PW2ZAeOPTbC5Fdam/8hYwIesM4kpr/OKc+afc5J+CO4pAEW8le/ZUN/cP64XntfjTH9HhiyTP0AMJ5sWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SN+jaZlItyVekpsnL569YkoOgGJzVlcO1URdevBm70E=;
 b=scWDnKzXDPtOpqYqxi3SWbaPYejy8UIXqSPZunbjaMaM/VkrPRjQ/lzDGbHwub3nN+5snni5oRsFu74qokJ2VyF0k72CKsGQlAEvilW0LPTbxkPD8nMCtS/PepH4feOVJURogNFLWj2Q1wN5b84T7tSHG40nN5yfF0fhq4kmybHyG5kl1vW0FhX2LmIHxWWuw6pJz834z+E8DnlMa8HcllohH3IMfCqOq+X4F6fCXblq3wyQqLcNIUuvxszQRhGbhFdSC16WW090jwncJM3krX0N6ZzlYPcjXKrXNTtNeJLJbANYOIVPTrPV0OnD37ywMoTkmtZIr3nVQTkhscH4AQ==
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
CC: Richard Weinberger <richard@nod.at>, Johannes Berg
	<johannes@sipsolutions.net>, Josef Bacik <josef@toxicpanda.com>, "Md. Haris
 Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Mike Snitzer
	<snitzer@kernel.org>, Song Liu <song@kernel.org>, Stefan Haberland
	<sth@linux.ibm.com>, Jan Hoeppner <hoeppner@linux.ibm.com>, "Martin K.
 Petersen" <martin.petersen@oracle.com>, "linux-um@lists.infradead.org"
	<linux-um@lists.infradead.org>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, "nbd@other.debian.org" <nbd@other.debian.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "linux-raid@vger.kernel.org"
	<linux-raid@vger.kernel.org>, "linux-nvme@lists.infradead.org"
	<linux-nvme@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [PATCH 08/11] loop: remove a spurious clear of discard_alignment
Thread-Topic: [PATCH 08/11] loop: remove a spurious clear of discard_alignment
Thread-Index: AQHYUuBa8QWBZz9aDUOa5Tmj7psG5qz2LtoA
Date: Mon, 18 Apr 2022 21:21:44 +0000
Message-ID: <a60f5fc2-fad3-3e82-00b2-46126c7844ed@nvidia.com>
References: <20220418045314.360785-1-hch@lst.de>
 <20220418045314.360785-9-hch@lst.de>
In-Reply-To: <20220418045314.360785-9-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29c292e8-3de4-4b82-65bd-08da21817097
x-ms-traffictypediagnostic: DM4PR12MB5101:EE_
x-microsoft-antispam-prvs:
 <DM4PR12MB5101905494492F3B3B1789BBA3F39@DM4PR12MB5101.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VTdOHMLOgj5nGlVqc9NJF8HcI54YZvuZgAg95udf3adOomd+wnZvnFAnda6i9vsfcSdwvXzHOCeeqxWt9aMlrMjRWF7Xv9ySzuXME4VPhTN6b7ns2yrqA075agaZdGinqKpCILKu86+pqIbpUNB7ihfkTGMgUI44TM4j8mL5K+wRdRnDOux1aCIyo85Wi24KeN8TisGUyr2oIbkV7/Lg+6ZyC/+btl7c36JMnsxIoHus4s5Yj3TIe51AJhZxWcFEv5Wj+I7IkVe2aWIIFQ6gssIKIt46n0J0ldMlDfh6Y+MFdRUEZ8tppl2ALPOjxZvB99il+VWZ5X4bLWTWl6JwR0Gty6B5Bfm/6c2/uDwv7PD3USn3AXdA2X8HK5mb5ibCpFELSYp1vTg5bBr8XnpgAClHXDU66lJrPlW1e84y4+nf0j3eHfsO3i7DYZT7tulSMSyiTJSBPkV9mCKI2W93bwqfY5s7gNZ2RdO2/4Qg7mNhPkiqdJdFo7Yeotx1Yz7emda/qftdc6e8vNGM5VUFW43ZFvdL3NsiG6P8Uwra5wmEkVFYZz4Bc6PRf568LaAMP3B23aCWHIB7AxBI2Nmm90JPG3Pv94gJxiMzjH+o+oECMD0A/cdho5FbbDmKZz1VGs1WIQuwUCqcIk1syuc8uQj9uZ0XiZoXSS7IH3MsjfaGsnWX4U/Njp053kRrHzoG7aKMPQ9OClMuvLfpWMh0gLOw9Z04aQgHxVy9ekz0n+4gnIxtkwrlMl0Xl7Ap0YqtO9luyWBM5+K1Ke+FJuKVBA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR12MB4667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(122000001)(38100700002)(5660300002)(4326008)(6486002)(186003)(2616005)(54906003)(110136005)(508600001)(6512007)(71200400001)(6506007)(7416002)(66556008)(66476007)(64756008)(8676002)(76116006)(8936002)(66446008)(53546011)(66946007)(316002)(91956017)(31686004)(558084003)(86362001)(2906002)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UE45SDBjVlIraVRQaFkxSXBFV3dQaGFhdzNpYXhoeFp5Q2QyZzBTR2dEUm5E?=
 =?utf-8?B?WEs4NXVhT1orNTZheFBQcytBanZXTjN4ZS9Tdk5oNERRbnNXQlNuV1BjSHNU?=
 =?utf-8?B?NC9jTmZKalpaRVRMN0MreC9qVFRLY0JCMytKTzNhVzRoeVRGMjF1c1Q5VTVJ?=
 =?utf-8?B?UURCZWZMQ1Y2eXc4WGJPczFLRW1zWHlGdlU5WU1UK1pwdzcwMjQrOENTM1E2?=
 =?utf-8?B?bU11TnVVakFOc0pvRHBqQ2JTb3FBK1B6Q2FWaGVIRlkwVmRKNGIwY1V1N2ph?=
 =?utf-8?B?RXFjR2N6YW9UbUdYTkNSNm5tYVBwdWR6MWNPWlBDVVdPQ3UvdmdsSVFHOXl5?=
 =?utf-8?B?TGl3VktDNFdWRG9SU2xUKzV2Rm9KWUFBdzdZbldDOGlncFhzbnRYdWNJQmow?=
 =?utf-8?B?aFdFTGQ1cjhvUS92NmN1RmlDSE1kdWV0YktBZ2dkS2J5U1dteW5GTW9PSzNO?=
 =?utf-8?B?UW5JZlFqSjVPREtQTWdScHZKaytXckxnejFHNUYxOXozUWdqNW9ibkFBUS9u?=
 =?utf-8?B?TXFORU1kUDkyVWpZNElQUnoxSi9XTEFQNnJEellVSXcybnNCT2FWWVNMeHJU?=
 =?utf-8?B?MXcvZXlTT0krUmlhVVFkQ2Q4OGVrYjk4cjhsVm9Ibm1xTjdMdGdoVWcwbTJE?=
 =?utf-8?B?bHFtYXVXeHp0cW41eWI2VTVBQkFjcmJWZGJQbGZKeDdQRnNyRjVaVlB2NWk2?=
 =?utf-8?B?MnVFSm03V1dnUXNsTm5ubWEvUjRnb0F2cDhXemFkaEtnYzJibHh0d3RFSHV1?=
 =?utf-8?B?RmlqdnRRWWpFVEVBNUZNWjFmODFLNkVmWE01akFmUklpTzNhMjBIWXVIZDF1?=
 =?utf-8?B?Q2pGTjlibERiNkpkeTNQYW14RVVGaWJISU5CdUNWTW5icXU0cG0xQVJ3TkN1?=
 =?utf-8?B?cGQ5VWhzTnNZSmtIblFyVVJuaEp5cGRpeXlTNU5oMmRRdVNBdVQrVlFWNEdY?=
 =?utf-8?B?ZlF2ZUtYTUVwRjRuN3RPVkxCY0ZIUURkdlJGRUkzdnByMGJoRDcveGcxbUFL?=
 =?utf-8?B?T05ZY3M4bktoNXlIdGkxZXk5VVM1STJrZHMyTDF4VnQ1UXE1bVc2V1Z6djcr?=
 =?utf-8?B?VFp6cW94RmhFZzRUdXNGdDkyVWlRRUhPR1JZUnNJSEdndHpHSk1lZ2ErVHl1?=
 =?utf-8?B?SS9LbzRjVlJCQm9IMk4rWXZkbFIzUnlZVUVWdXFHUFdLekUxeHg3aUVJcE5p?=
 =?utf-8?B?ejJKdDhVOTU3S20rNy9FOG14N2pCc3FDNDQvVk5YamhkMmt3RkYxMlJQaWRL?=
 =?utf-8?B?NWJnRHJKYStzam1OTTBxUFErdjdyTkl2QjF3Nk1sL3FFVFJRS2RVeGVLL1hy?=
 =?utf-8?B?NWtMcEVPUURwMk5aeHJCZ0d1U0xOQWFxRWYzL1VDZ0p1enAraGwyeG9LOUo3?=
 =?utf-8?B?Vm5senFER2FTUmttTGdXOEhqL2pwK0RvTS90UVpOK09xMzFGcHhtODhHYUtz?=
 =?utf-8?B?aEhCcXBqVUxMWmZmNEcrYzI0emJLN1hjbmlyL2pDOUtBSldyMDFWNVh2elpi?=
 =?utf-8?B?NHJqTE5vRmYzVmswQVYvNFI2QkxyRUw3V3ZzN2Z0QjRHRkZnSGJ4UG45SlpB?=
 =?utf-8?B?TmNiNnpYVVkzczlQWGE4bkF0UzNnZHFtMFkzTjg3d1grVWdBb1pweHZ1TWpl?=
 =?utf-8?B?WEljWGlNUHFFZ2paUmR0WFY2RVRFKzZOTTRkblltL04xNVZ5b1R4NmVMN2t5?=
 =?utf-8?B?ZDJQYk9iQ0tGOHFnUXdNWXNxTlRZTEtzOVN0MktwUTBUd01oREFlSURkQWVK?=
 =?utf-8?B?R3h1SUYvNmN6U2tadGU0U1dKRiszczhLYnhhSXNXcXFHL29HcVRpRGVBczNH?=
 =?utf-8?B?Rko5aVBIblhEdlB4TGJRay9PbkkwWVNXNi9vdnYzWkkwY0lKQWk2bjd6N0JO?=
 =?utf-8?B?VGR0NkxSUjJHeHo0ZU5lRkt2N0dHVVdocXgwaytlVlo0Qmp4dlB4Ym0waGhL?=
 =?utf-8?B?MWtVQTlyWDd5SkUyR0E1c0d4QnIxMWxYbUUvOUVFWjk4Sy9hTlJIbkJ5a3FC?=
 =?utf-8?B?N3hvYzRUMlJ5M2oyRzRnYVcvTzc2a0dqRnhKUXVTY2FDL3NMcnZ6Q1BkWlpU?=
 =?utf-8?B?VEE0OGpEdDlBN3RKMEFWR3JiUFJQMnAySTMvbHBSbFBRcXU3aTVXdXlleHhI?=
 =?utf-8?B?Vm80bmE2RGsyN0d1WnZ3VThXRlVoVG9vS0lLbWJjK08vRE1JUHhvbklUcU1C?=
 =?utf-8?B?TnlBMXJBSzlBeGtoTjdwUnVmaXlQMFZIMDIvR2ZzN3ZXRVhIT0hpZkk3L21n?=
 =?utf-8?B?bnZzZWlTUUtvVVFTSUg2d1BYTjVXM0s5R3JkQXMrcDA5bllLS3FpdWlYdmNX?=
 =?utf-8?B?cFFLRmdGSkxHd0ZRY2tPdHdKdk1aVEs4TDE5S2x3L25EMzZrUnFKOGR6ZTRi?=
 =?utf-8?Q?PQoUgCYR9P1+D+Oo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41D9387E299FEA4DBE85A4EDA24D0FFB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c292e8-3de4-4b82-65bd-08da21817097
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2022 21:21:44.8408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XFN+DIrHwXW4dMMfM+xmFlg+tyVkcF7I1h6/S9n/Q2biCyaj6At7SnFy02ZzrCvM3Xc6fVux9dDTKsDMn+vhYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5101

T24gNC8xNy8yMiAyMTo1MywgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6DQo+IFRoZSBsb29wIGRy
aXZlciBuZXZlciBzZXRzIGEgZGlzY2FyZF9hbGlnbm1lbnQsIHNvIGl0IGFsc28gZG9lbnMndCBu
ZWVkDQoNCnMvZG9lbnMndC9kb2Vzbid0Lw0KDQo+IHRvIGNsZWFyIGl0IHRvIHplcm8uDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4NCg0KUmV2aWV3
ZWQtYnk6IENoYWl0YW55YSBLdWxrYXJuaSA8a2NoQG52aWRpYS5jb20+DQoNCi1jaw0KDQoNCg==

