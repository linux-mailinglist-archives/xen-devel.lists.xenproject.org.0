Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 869FF505F53
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 23:23:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307603.522798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngYq0-0005hd-E1; Mon, 18 Apr 2022 21:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307603.522798; Mon, 18 Apr 2022 21:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngYq0-0005ey-B3; Mon, 18 Apr 2022 21:23:12 +0000
Received: by outflank-mailman (input) for mailman id 307603;
 Mon, 18 Apr 2022 21:23:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lLCB=U4=nvidia.com=chaitanyak@srs-se1.protection.inumbo.net>)
 id 1ngYpy-0004w0-A2
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 21:23:10 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdef2bdf-bf5d-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 23:23:08 +0200 (CEST)
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by BYAPR12MB5703.namprd12.prod.outlook.com (2603:10b6:a03:a5::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 18 Apr
 2022 21:23:05 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b%3]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 21:23:05 +0000
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
X-Inumbo-ID: bdef2bdf-bf5d-11ec-8fbe-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCTnzYl+A3W1QQ39xpG5158yMEOX1tX8kBsBFih687ArE4aExk9nDwadSZOJxtI8eSLpXx7MMVEFXK+vWQ6T5HRTB3E2c/PH17fWAv1mmQCW9KcWzKW56S6J4IxDY1NN94HBCdbrsihxpT0/hZWVtVXrq4m2PQBnpNcXYs5imYg4lrolYDCf4zf9ILKuJ588bnQ1+8I3rB9U6mHLGokShUOmwt5ZwlDSkL/jN2NyqjR+TMB+H5gOHFWaHJR7gR2HXTRfvqQ0oKZtCXkrQfVUEejwTJ5S+uVLAhBsjmYuEdRWRDI9HdoNiqyx9ZyCFfDPYf0Ueqqv1bzzDfVaWl0xGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylu+JR0gsLNhok9CksoK3rBzZXhje5IsRF+GG5APk2s=;
 b=NhyDGKEHIKHnZQ6i6J4WB9/rf2SbvqnX8fTvl5GbbeRZc+L+MDC9mt5j3Q6c4yVp+7gx4BkL2CQIHM9Mi1wgO7zatLHOyW80qXA93sWUBRWZWnINVY+QO6mee3wvwvl7CsUwmo4Zyk+52t3IcnCOLot5C1Wkgckzo6kq2FrX7N+5GaMYKp45W24MvOFsziVYqYvZBRT2xRaOZNN7Qt8mMWWvk3BMK6W0/c/uLGk7Km+ShDd3pKpHMPw5Hv+f9/J130cOmwQ4Yl8S5veSkYuwpP0E6RiSjORFAucri1YJvCS+0aRqtuWFVJSUl2IVnFMqLXbCpaVJw/zI2wujGo/kpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylu+JR0gsLNhok9CksoK3rBzZXhje5IsRF+GG5APk2s=;
 b=EDDoBtO40FqhH6APtRLewO5ws0a/ttWuuMyQgjdR6zAnxJcQBjPBp8l2RrEvyJCGQWhoE3LqjgDnHPwYnSIM/C6FlHB6+3cRU6nNeKQkRLP9aiRQmx9LCnQ7U2TOmSLMCE3JqEl0L8Bun3T5hSpiPH7HiK15E9QhLyc1HYWmqcUjJHUlPS3+EZ0upPIyg6nqkq2Ls9jwQ49VrVXTvkujKbtqvEZRzEiZDnwj5GpL07WdWaRyJKQdco8D8vVmsWYEnPkn9avBBQNgjwk2TZyD3BCpW2egHzWEULxJvhFWHaN/Gq0j6jo+QA7g3caOjiChtPDpLBXS7FmJ6CMTJiCf7w==
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
Subject: Re: [PATCH 09/11] nvme: remove a spurious clear of discard_alignment
Thread-Topic: [PATCH 09/11] nvme: remove a spurious clear of discard_alignment
Thread-Index: AQHYUuBcFEm/XfqSQ0uW2E3HX2krVaz2LzqA
Date: Mon, 18 Apr 2022 21:23:05 +0000
Message-ID: <66df636c-b98a-23f7-20f5-f124109b81c1@nvidia.com>
References: <20220418045314.360785-1-hch@lst.de>
 <20220418045314.360785-10-hch@lst.de>
In-Reply-To: <20220418045314.360785-10-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ea33572-46a0-4def-4816-08da2181a0a0
x-ms-traffictypediagnostic: BYAPR12MB5703:EE_
x-microsoft-antispam-prvs:
 <BYAPR12MB57034654840D806181EA4705A3F39@BYAPR12MB5703.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 wZRIafoMZ+RNEv0jR3059UeyDTFK32ryaMGSLWdws/jWK1ZLHE9hYQAuxaagMVs/LEd/tpZiQVJDQf1nmESaKq+E5Cog4yW9qJs+ajxMRBm0ihATE22BxMXT67QvxcLPHLKUxtogqLjr2S3bccK0HG8KLBQgdD7S4N1dtflpco/vndZ9fHtv8ZVS44KE+gAB7iIu1cFQeZX00WRBwVkiIPbxklRZ7reZXWoinrMqonA+BbWykmn9TA6hOVhJkz+a4LV2zrC2nBas3p2lgORI24Re5BSDJaXDU71ZPwsW/FJY3K58yAj/q3xPJWAvcAzpClVyBI/ieTTMTanbP75jut6qk8WNQb7/Vn0m7SA19hWgKnRK/K+ONQrHCQR5N78AMkwuS+Fsl48/Y0Om1/cP0nF7aWaKnJ6dhQvQgK1wY+Lnmvoy+BE6li5iHNeJW1nlfWQ/A3HXyZ2MKDaObYA841BmXGhg3Fy4GVlTz/bkvccGcD5D0u5ncn7CJd9BRyI9HT4voIcBXJZEfYvnhiMQWgI+awGaihUto+et5YyvXTdHpJX1lg0tU6U3DQPO1sdLiez5LvX+/BVai9Rkxh846t7jct1VZnTXRVGqZYkIamc4I66l6G1W2ypSWvc6XABmk2hgEj3iAZbAcCsedSHS6h5dAxJXHpYA9nR2zGUkWfm0HSdv/eRAd8LZ6qz4Zjq5pVf670aNRxbNeWA42OmJ1kRJ7dXwgG38AMo2qb1kid+PSZXlzehAFA+FXLA4LD+7+h3ile31o23bjx8fvRA7Nw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR12MB4667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(558084003)(71200400001)(86362001)(5660300002)(66946007)(76116006)(31696002)(186003)(316002)(38070700005)(6486002)(38100700002)(2616005)(122000001)(66446008)(110136005)(7416002)(54906003)(64756008)(91956017)(4326008)(8676002)(66476007)(66556008)(508600001)(8936002)(31686004)(6506007)(36756003)(2906002)(6512007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K3JyUHJGTk9VOGd4ejRtQ2k2SktOU0RoODU2STdRZ2Juc1lvMFFsRzdBUkRm?=
 =?utf-8?B?b0hxTGpHME5nWGs0bkxZRE5KUUpLZjg2U1NmY1VLUHNRVG56YXVEMnQwWHRL?=
 =?utf-8?B?YXNGQmNISmNxQjRxV2F5am1VZU5sV2hhb0ppSGtUT242b0U3OWVyUTE2eGt5?=
 =?utf-8?B?cnhLeHpNRC9uQ2hQNTFJNE9vWTkxUVRndmpnYmYwVjdqVDJnMldhVFhxVmhk?=
 =?utf-8?B?RTAvbm9yZVYxbDBDdlpWblJxRldKMVk1OVcwWi8xQWhxd1JVN0kzeHpsRkZC?=
 =?utf-8?B?M1YxMEoveUpVT2YxZFB2T2NmSkNBOGRlV0p5ZG43STJBMW1vVFJMdXNHUXVK?=
 =?utf-8?B?K1UrL21mcFk1Z3Nta3N2Y0xncE9tZnB0S1FKTzF3OHQ5VkNvYUtxUEgvYkVR?=
 =?utf-8?B?Y3hnWmY3ZGdQZEVuL2JaK1FndE9iaEJxbkJuSmFkZGFxckEyMTJkdEJ0VUFh?=
 =?utf-8?B?M2VlbUxXTVgwWUh5TGxqbkQyNUVTU05QcHRBcm1XQUNla0VKTzY0UUFYODAr?=
 =?utf-8?B?MjZucUQ3VDRpazRZRTFWeGt2QXZDWXhrdWowTjBUUHpwYUVvK0dYVnpiVE5l?=
 =?utf-8?B?Q2NKNEo5Z3ZuSlN4bXVvK3FvaHlUdHJTZVNLenBEQm53ekpiekxNeGYvOXZh?=
 =?utf-8?B?WUZLQjR6dWlXczl5VXFmVXg5TkplY1UzeWdVMGFzTmlaaGlBZjJETEhVbjhx?=
 =?utf-8?B?eFU0SXdBZ09zOEZtQU1rc2tIR1NlRTFzQXNzZnpWM3RCdE5rOXZKV1FwMksy?=
 =?utf-8?B?NFBralNBei9kOG1PWlhCZmFFa0szY1I5WHlZR3J2am5FMEUwRkp4Zk42VTc4?=
 =?utf-8?B?N3J6L1Z5YURoRVphVjMvdmxiR0NwMForU21QblVXUWN6Y2hOVTM4LzBqeUM4?=
 =?utf-8?B?NXV4aFlLUFFrdHpza1RtN3A2TkhDYnN5ZEZuRnlQVWRta0JiQTd1aEVQL2d0?=
 =?utf-8?B?ZlVXVVUwdllzTzFYN2dqQWVhNjYxVGZ5bUJEMXM0NGZHdnlsUUFSRFVVU1FF?=
 =?utf-8?B?TzhJQmhpZ0hZSG1oVjl0ODhsRXlYOC9lVVBETEZlaEZXWkhhNENnbytlYlJP?=
 =?utf-8?B?bnpyVXlMaE5XNzhUMFVYclF2aTFFQ2d4ZkUwTFhuUWxTRmpiSmYydnFYdHhh?=
 =?utf-8?B?bG9BWFp3TFcrVW1KN2xBWm84dnY1N3FoZ0NQcFhYRGtIeUM3ekxrVGFXL2Fk?=
 =?utf-8?B?NWRZQkVHZm1xb1I4RUt5Q0lKb2d4c3NSNkdlS1ZhTVptNjBQUUFhZHdXS09H?=
 =?utf-8?B?ZGxINlE1WDAzOUZNNlJObnVuaU93ckY1ZzJpMW9rYWN6c1RNdkZJdTBLTXZK?=
 =?utf-8?B?S1BJZnF1YXEyWmpiNVhNNXZ0d0FxZ0dDZHFOVm1URi9YUzMxc0VBMWFuSm94?=
 =?utf-8?B?L0xBWDhTUldOQjJZOG8xYnVzOHhWVzBvcDN4UmJmN0VadWd6OTZIVE16TTF1?=
 =?utf-8?B?OUxVbCtOOVRZR0oySW8raDhLalh6SDhwZXV4ZGI1aTVFWkh0ZTc3MUwvS1lC?=
 =?utf-8?B?UjVRdE9NWDJrRWdMKy9iaXRMMTV2c1VhLzBFVW4yU3JTblpicHQ4cDVPNC9n?=
 =?utf-8?B?b1VpTVN4b0VHalZVTzJrNFpTWHBreHU4L01IZE1VOU9LNHh4TWRBcXFtY1oz?=
 =?utf-8?B?RWVvVDYvYmRzUCszVE1adk4rNUp0Y3JSOHRNeVdOd3lvZCtEcTdWMFMxQTFM?=
 =?utf-8?B?bWNHVytkWXVjakNmKzgvV1RzZ01EWGFZdFRHYlVHSXNFSGxFODZqOTJJN2xI?=
 =?utf-8?B?RllFTHBybk1zeUxnU2FEbVBRa2tGWDNWcTRScTE4TWtvQ1R2bEQvQ25SWFd5?=
 =?utf-8?B?d0lWcWw2aURlYzR0VDZpay9SZy84VGVSU2tCSnlLOE9ZZ3ZseExMU2pUM1ha?=
 =?utf-8?B?bzg3SjJSc3I1V21Xc0FPOUVrci9LQmx5SkxpZThDRjdkTTEvdVk2ZWF4RXp4?=
 =?utf-8?B?NEhlK1NKdjBiU1gxT0k4UFA3U1l2cWRpNlprSnd2cVQ4SG5aWWIrdTRKVkto?=
 =?utf-8?B?QnFNU0hucTl1QWRwKzJaUFMzNTN2aVh2dGRJZEdkYUpKVCtPY21sVUtWbHor?=
 =?utf-8?B?L2ZRSkZBYjVQK1Jpd3dzcTNQRmltaDVXbVp2Zm4yVUE5azdFUTc5MEtWdVJ2?=
 =?utf-8?B?Wk1XQ0NmTEJHQnptT0tpNERWdXVzbk9xbG11VDBjMFpQNmhqK05tMkNKaTAw?=
 =?utf-8?B?T0tkbVhwSjZrMDEzR0lnMDgwak8zZVlXMXg5OVNlOWdBc0trSnpyellyWERK?=
 =?utf-8?B?L1dtT3FLaTYvUk9RdFU1NEFOSHFhOFNHcTJHQ3hBMkNDbSswUkd2K1JBMUNS?=
 =?utf-8?B?R0dUWEt1eTJXWExteGIrczUzWXMvVXE3eUIxejVJdVFneEQxZFR2SzBJVDc5?=
 =?utf-8?Q?3ThODCQ/tQz/cwX0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2261F5F6E0810744877DAE4E412E6B80@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea33572-46a0-4def-4816-08da2181a0a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2022 21:23:05.4140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bX94/9AH8QVpG+ra0QBfSC7XQkW0/5sNBc2d1BEGlO4VFk0lgNSO6gOFfRnduTdTtrVmVUtGs0aqwIqvFg029g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB5703

T24gNC8xNy8yMiAyMTo1MywgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6DQo+IFRoZSBudm1lIGRy
aXZlciBuZXZlciBzZXRzIGEgZGlzY2FyZF9hbGlnbm1lbnQsIHNvIGl0IGFsc28gZG9lbnMndCBu
ZWVkDQo+IHRvIGNsZWFyIGl0IHRvIHplcm8uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGxzdC5kZT4NCj4gLS0tDQoNClJldmlld2VkLWJ5OiBDaGFpdGFueWEg
S3Vsa2FybmkgPGtjaEBudmlkaWEuY29tPg0KDQotY2sNCg0KDQo=

