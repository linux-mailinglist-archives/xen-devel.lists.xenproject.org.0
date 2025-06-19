Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2775DADFDC4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 08:40:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019710.1396233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uS8wL-0007Gr-3x; Thu, 19 Jun 2025 06:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019710.1396233; Thu, 19 Jun 2025 06:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uS8wL-0007FQ-15; Thu, 19 Jun 2025 06:40:01 +0000
Received: by outflank-mailman (input) for mailman id 1019710;
 Thu, 19 Jun 2025 06:39:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L+aO=ZC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uS8wJ-0007FK-Ay
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 06:39:59 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20611.outbound.protection.outlook.com
 [2a01:111:f403:2009::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 366f21e7-4cd8-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 08:39:57 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CYXPR12MB9339.namprd12.prod.outlook.com (2603:10b6:930:d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Thu, 19 Jun
 2025 06:39:53 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 06:39:53 +0000
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
X-Inumbo-ID: 366f21e7-4cd8-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjslNtHXAnNdn5RnbfBjRgQ/Zw0MgRrhgOsRMazmbdrXg20uH3Vnag9vQ1vBIrxRNZYiGVncHYrk2osIDt3DjdpDoEuhvE3Cy0mULHiG520CbrQurTYi3Lv5I45qL0o/fiaDEZqcx4bxPbWDHFftOig7qsW33LJ/OeiSpjIy2iMTOTsNig0pY6C8NVMihTLbTDzoUbbTPsYs8X8mf2ZObm5w/aAoA+wn3oZNsA215HNgjzS6JqNMK5UTAW1ohDTNA397T67fKPjUqQLpISRkcNOa4Uwh+nCI/X09XeuHKVNlCsqLQw7j1ziRvwPsirZuLpnCe2L7MAQmdjCUYOy2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TinCgyJgQx2LIAq3YZrsGtujcBeI9O5N0bzvleJjHpY=;
 b=Q04krQCZzMvJbPVWNXJJ8tKFmWy2bDq9x/u8fM+QuaJv9jsV7GXCnTUpieKy5xp/yZ8JVa92H6WpYmGWAMPBoZtl1RttmmH3I2mxX/MBBcPrwXff0jyeN71MVl/Z/Np5AgDpjz+W9ecvb4bi8wDiyzCQ4v5MRuhK9Mai/+Czskz3DyIrSiw1aYW8kF5HsZtYnWcEWDsoFOcGhb+vnHgS0FjnkO/acWVXwTNLErTGs0W+Pt/P1qY/k/UVFsNSu4+JcFtTX5Gyp52BeGof8R4nDy6edDWYxIxTzGqtjMMZNsDPJa/b7GojMwpbBUQIo+QmBQs6IPKtE68v0nS292TzVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TinCgyJgQx2LIAq3YZrsGtujcBeI9O5N0bzvleJjHpY=;
 b=fVuJBzSxtWePsjFAkcZM+IamqxaS39sMhkEZnA3QYU92OugCH1Slf27ZJLyVjS2RauVgh0RgY1PHsiWn7o9YLrxsq/PM/zj9vRUhC2GEVW9vo7/5b25q7Ecm0REwOBmP+/3ZeM0V0JlZYeUy2rQ98lbx/MeGkrjXgNaDC78udxM=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index: AQHb23yakGdVC9XxvEWnYcnp8zrTt7QI/QAAgAGa9QA=
Date: Thu, 19 Jun 2025 06:39:53 +0000
Message-ID:
 <BL1PR12MB5849F696814E17D20012BAC2E77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
 <516a3adc-320d-46ce-b235-8ef91469abcf@suse.com>
In-Reply-To: <516a3adc-320d-46ce-b235-8ef91469abcf@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8835.025)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CYXPR12MB9339:EE_
x-ms-office365-filtering-correlation-id: 0a6c2497-4b88-4ac4-9e2d-08ddaefc1910
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UE5EOVJ3VnFIUkR1TldGWXltOTlDbWROaEtvSW5sb05EMVJaeWJrUWwvSDl3?=
 =?utf-8?B?NGt3YzJzam1leDRlVElKOU1iZWVUREZLb3BVS29VMnZUdHg4dWhBbTJ5Y3pQ?=
 =?utf-8?B?Vjhxb282SkNlSFRTdVU3RXhhckcwR2FkNTJjcm81Y0R4M0FwK1Roa1N3Yjhh?=
 =?utf-8?B?WlN0aW1ZM1ZyVHdmOWRpN0x1ZHZWTUlGV3hodDlaMTE1Y0trby84ajdJNzdF?=
 =?utf-8?B?WmJnWkVPNkZIUyswanN0V3RXbEdxT1hCdVdua0wwSGtVQzJtVGprZzgvOTh2?=
 =?utf-8?B?ZlJpRFFDS21LVzVKMFE0RnNla1JDZXQwYk96TG9pRzZJTmZLVHV0RWRkcXpr?=
 =?utf-8?B?bEZzZnhsZmQ3K3NZQ0dGVER5RmdaZHBFSzBpMzY3cDRBcnZ4eDdPT25BdWpJ?=
 =?utf-8?B?WjVLS2ZFNjBiYjg5Q01qSWN2WnZJcVNVZVhqczY5T1ZVVkZER05TelVaT1h0?=
 =?utf-8?B?WXZla2p3ZWVhVklvckNwbHlKMXpzSWsyM0YrR09EdytRZkpwY3laUVRPM0FT?=
 =?utf-8?B?aXBCVDUvNjZURTc0dWJ0WVUyd2liUTU5Q2ZnclBtZkpqRUdkeGR6amFIanlr?=
 =?utf-8?B?RXcxMFJEQWJLd1dxQkZCazlJMDFraEZiTXZMd2drc01QN0dSdHNmTTNLZjNh?=
 =?utf-8?B?RzdBTjJmMk5raFlKUExUN2UxYmtoKytvd1RCa2VYTW5acXNyeEd4OWh2YkR4?=
 =?utf-8?B?YVc2Q2JoWDNSR3RZZnhaOEpHUzJxVWVoVXRmTXVzamdDNnMrMkhOeGpsY2g1?=
 =?utf-8?B?NW5UM3J5N0dVSEU2SGlBZ1N5Y2JYaHNRU2pqak93bVc5NDhGWlZYK29FRU9o?=
 =?utf-8?B?emJGbUV2S3dqVStSZExEbzBHWGFhNCtFUlhrVUtMNDlEZ1FDczdVaU9zWXAw?=
 =?utf-8?B?aWJTNEd5QmJmZVA1MHR0N1pZN2U0QmVkQmFMQ25JeDhzWG1UN09hMmsyUHdi?=
 =?utf-8?B?VCtMdW5yTW9mcnlSN3JQZEU0eEVpdnZYeDJsSWF2QmZ6d291U2VRdTBHR0th?=
 =?utf-8?B?ZkVyTHM3ejRVNnk3SEdBQ0o3YlBZNURTTDNCSW82bkdLWFF1RklhWmhRQ0lZ?=
 =?utf-8?B?YjUwRWEzbWZobVc3WHpGSE1BZVlYSUlkWFJkZlF0aS9vTGZEay9Uc1haU1RO?=
 =?utf-8?B?TzhrUWgrRTZVdklEV3k0eEdsS25lMG8zcGVMZ1ljZktOak9BN0Q5bjI0aVJ1?=
 =?utf-8?B?OUhTTG9FZVhIMW91TzJRYzhheVNmRksyTHdubHFiNG1KUmxvUWJSRzI2eVMy?=
 =?utf-8?B?YUlVTEtsUG93U1l0aGJxZW1tbUtqRTRFaThZVjdnRkJvRVRhT3RqN2xSY0Ri?=
 =?utf-8?B?dHFYQi9CaTJ0TzVtZEt6ZzVwVFhYa3ErNFpVbFFvOG9kRlNZOFRyWkRoaDN4?=
 =?utf-8?B?Slc4ZHV5N1FuaFJxc0ltZUsrLzdLY2hSNHlQUldSdU5CS0o4ZERYQTZ2ckhF?=
 =?utf-8?B?SmdKeFNybE00dHRSUTNxNEtBSmEwNUcyT05RZDlaQklXMlRWSmZDVDRkNkd6?=
 =?utf-8?B?RUtvUEFqUk0zMkJOY2NwOCtheEZFOWxUVkdNZ0JFR1ZjbnpoSkpFbndTVElt?=
 =?utf-8?B?UHBwdW52M2dVc1NndkVlSSs5OEt3TGRJL3Q2eW1FdGRRT0wvVDZPZ1JjSUl1?=
 =?utf-8?B?L3dudmpBTWRUN09wbjVJSTE4NFZ2Ulhxdy9BRlBFWkFJTUsrR0ZBcWIyMFRu?=
 =?utf-8?B?Lzl2bXMwSjgvc2FGQjRNQ3J3MjlrTjRrZlg1aEZDSU9Ya2MwMXArSE9NZy9K?=
 =?utf-8?B?WlBoVGJkN3lYUTZxTVZ5SXdvd1NNbG45akIyMkxSTUtxQmd3TURVMDFIdFZW?=
 =?utf-8?B?bFBDbjluYUhvSnJKZU1CeXFsTG04VDJjNUdXTjVTV2xJRngzK1UrUVB1TFJ0?=
 =?utf-8?B?dlIrYVdUMU9aSkpZRlZCUWlZRzdpYklZZ0xsUUZlNGhlZ2orakRSQ1FFTGpE?=
 =?utf-8?B?TmNBY3FtY0xlS0RFaFFaWndHL0RmT2pJQzBKVzVMTHFXRnFob3RMdmNkTGhG?=
 =?utf-8?Q?SPw1TvacLVVEhuH+oDBEYwF3hx8SOA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a1JNWVdOSHo2a200UVI2N3NTU0lHK2JubVkzcFUyUTdDc3llWWU2OFl6V1M3?=
 =?utf-8?B?WE83UTBLaHNJK1dncjVOZHZ5b2FEcERiQzRkRkVFTXJ0M1Y4T2dVNldGMkF0?=
 =?utf-8?B?ODJSRkltdndySHZoWUhnTGFmUUR1NFF3TjFUZkZ1R25qdG8rU2ZYTFVGaUpO?=
 =?utf-8?B?SGVxK3VMK2JpbjBFek9PeXc2cjljRjg3cDdDVzY0bE95Q09LZWQyTnBiT0c4?=
 =?utf-8?B?YkI1bno3Ukg1YzdaVDlJdGtJaG52UWZKcnpQeFBZSVh2ZEdXb05NTXFSWThu?=
 =?utf-8?B?Q25wWWpURE5XcTNmc2FBRCtOeGE2Y3lCS3c4M2owcndLWlhhU1VrMy9rYzhu?=
 =?utf-8?B?TW1zY1Vmam16RENadmdlZjVJVitIdEUrQ2VlMTBadXNEREZHUDF4SDJSVVo1?=
 =?utf-8?B?Y1l6eWFPaHZhM3J3YUNxSnJ0ckRPTFh3R2IvY3Z6eWRaUGZHZWx0L2lMaUF6?=
 =?utf-8?B?d3pQMHJKVDNFQ3lCc3NQeEFLcXpBS0JRaFpXRElJTUEwT0JpZVBORDFtWXhy?=
 =?utf-8?B?UGRsY0xqWW0wQnBJUWdIeFY1QmdIcHZ5bG0zOXVqL0tMc2ovVlg2aENZRU1y?=
 =?utf-8?B?UUhMWUZ5ZGN5Y01TdVZkblFpd1E0MGk5ajFtVHJTTUcrb09iT0JsWENrNUJT?=
 =?utf-8?B?OW1GNnZUTzBocmFzS3NZa0RPaFN2Nk13ZVg0WXRuL0tCM08xUTYxeFA2MnVN?=
 =?utf-8?B?d3o3NUVOZkJqMTVZczBJdXZwR3QxVlJuc0RIQTJLQ2tWYXVmVHE1QTZPNkFT?=
 =?utf-8?B?b0hiOVA3dXlmWVdFaWtmUkNESnIwdk55c1lLUTRKM2g2NEt6eVhSUjBLMzBP?=
 =?utf-8?B?QmFIbUZzZHNTMndkTnVERVlsQm9BWjlTVzhaUjg3Ym8xZ3hYdXRjVG9jMXR6?=
 =?utf-8?B?dytNNzVURGpUdFdRNVNveDRvUUlub1JqSDNmYm9YNHdXeWg0ckxhNkNnS29v?=
 =?utf-8?B?ZEx6OHltZTB3SXl3d3Q3a3U3TlZOWlpQK29SWEtrdzBNQ0FtcUFmN3NqbVM2?=
 =?utf-8?B?YjFpUW9HQ2phY3pFa0tUT0tNbDJGME1kTHV1SG8wY1MxREdtZU5SbUk2Smtw?=
 =?utf-8?B?cEl6ZUNzcFZPVG5RdlZBSXJaaWozdHJjVURWSEV6Z1hWWUR1MTU4cUw4L0hD?=
 =?utf-8?B?VXlRUUtHQWZYY2pNc0tScFBzUDU0L0ozb3Z4TEE5ZFpXRGVIMStWMDhqQ0pT?=
 =?utf-8?B?T25SMTZkSW8vMXJpa1NTdjhQT3gySDZMNkhvR096am1KQnFiU28wMDRaWHpR?=
 =?utf-8?B?UGhITU5xRHB5UHF6bDhsbW9hZnhPbkhLNGJkdmJTVmJMTFUwbEl2Q3lGZnhX?=
 =?utf-8?B?SHZYSDNXY0txamVGRGtqRmJKSWpRUFJGM2RmRWsvTTJSOEdVSkIyMEVqalBW?=
 =?utf-8?B?em9PWVBSdlZ0QmtQS1N4OVRuRE80bVdRTkpjWmZBYkdXalV0Vkp3RTFIaFgw?=
 =?utf-8?B?eUVtRndYSm55SFIwcVdGZzhKRUs3RHo0NEczSTl6YWFmK0ZjbzVxS0xVZEEx?=
 =?utf-8?B?UnpsSnFnVVJyck81NWZ2UlBod2JkRGl2bjQ0eWZHVVpHVmVEdGxjV0lsN3B5?=
 =?utf-8?B?Ym5EU05lemR3L1VtR2c5dGZzWmlKR1RUMkh5UFNYWjVydG55cTJJSGI5Q0dW?=
 =?utf-8?B?RjU3bHg2SVZ6NmpUdzkxaklUanFIdlpwMVZWUkF5dVV1QWoxc1A4ZE9WUmN6?=
 =?utf-8?B?MmhGVzRtQWtXSmFmMEtRbG9YNy9aa2krK3BrUnJ5TG8wOW5SS01Sa2w0Y2Rx?=
 =?utf-8?B?R2p0UlN6c25ndStxOGZjK0cwL2d3TjdXNHBiZmhuZnVYaThab3NCdjRvUFRP?=
 =?utf-8?B?QTd6UmdqYzVEY2lJR0xPMXh4R1dmUXNxaGpPbFl5K3NJNDZMaGRPUDNsMm8r?=
 =?utf-8?B?WEN2OUFiUVFMdXVIV2pFcWJVZWNzZS9zWmFVUEdHN2YzVmJCeUxHNWYxZVVy?=
 =?utf-8?B?TmZUMWI3cURmWHhjVUp0aHZYNlZ0eG1HdzUyTk1tZHdvS1hpQ3RabVh5WUFJ?=
 =?utf-8?B?QlFqK3B2SGpFdE9welNOTlBFVENoNjBJUTNrTUs1NzAyTExvbGpVRzBUNnNV?=
 =?utf-8?B?NFVaYmo5V1djWW4zMm5OQjZDTkdBZzBNcEVwL2tmYURHZkhTSzhXLzF5V09Y?=
 =?utf-8?Q?yIPM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C875BA41F799743ADDD353D7EC85EDF@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6c2497-4b88-4ac4-9e2d-08ddaefc1910
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 06:39:53.1953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: swJfTocPid5U66/5XHJARHhw3QQhbg6Bd/baL93F8bm/WvOcMTQgXAsDo2Ekan64p41/sgKb3qgIpbuDEW8c+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9339

T24gMjAyNS82LzE4IDIyOjA1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTIuMDYuMjAyNSAx
MToyOSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL21zaXgu
Yw0KPj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMNCj4+IEBAIC03MDMsOSArNzAzLDEz
IEBAIHN0YXRpYyBpbnQgY2ZfY2hlY2sgaW5pdF9tc2l4KHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0K
Pj4gICAgICBwZGV2LT52cGNpLT5tc2l4ID0gbXNpeDsNCj4+ICAgICAgbGlzdF9hZGQoJm1zaXgt
Pm5leHQsICZkLT5hcmNoLmh2bS5tc2l4X3RhYmxlcyk7DQo+PiAgDQo+PiAtICAgIHJldHVybiAw
Ow0KPj4gKyAgICBzcGluX2xvY2soJnBkZXYtPnZwY2ktPmxvY2spOw0KPj4gKyAgICByYyA9IHZw
Y2lfbWFrZV9tc2l4X2hvbGUocGRldik7DQo+PiArICAgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNp
LT5sb2NrKTsNCj4gDQo+IElmIHlvdSBhZGQgYSBjYWxsIHRvIHZwY2lfbWFrZV9tc2l4X2hvbGUo
KSBoZXJlLCBkb2Vzbid0IGl0IG5lZWQgKG9yIGF0DQo+IGxlYXN0IHdhbnQpIHJlbW92aW5nIHNv
bWV3aGVyZSBlbHNlPyBPdGhlcndpc2UgbWF5YmUgYSBjb2RlIGNvbW1lbnQgaXMNCj4gd2FycmFu
dGVkIG5leHQgdG8gdGhlIG5ldyBjYWxsIHNpdGU/DQpUaGUgcmVtb3Zpbmcgb3BlcmF0aW9uIGlu
IG1vZGlmeV9iYXJzKCkgYW5kIHZwY2lfZGVhc3NpZ25fZGV2aWNlKCkgaXMgbm90IGVub3VnaD8N
Cg0KPiANCj4+IEBAIC0yOSw5ICszMCwyMiBAQCB0eXBlZGVmIGludCB2cGNpX3JlZ2lzdGVyX2lu
aXRfdChzdHJ1Y3QgcGNpX2RldiAqZGV2KTsNCj4+ICAgKi8NCj4+ICAjZGVmaW5lIFZQQ0lfTUFY
X1ZJUlRfREVWICAgICAgIChQQ0lfU0xPVCh+MCkgKyAxKQ0KPj4gIA0KPj4gLSNkZWZpbmUgUkVH
SVNURVJfVlBDSV9JTklUKHgsIHApICAgICAgICAgICAgICAgIFwNCj4+IC0gIHN0YXRpYyB2cGNp
X3JlZ2lzdGVyX2luaXRfdCAqY29uc3QgeCMjX2VudHJ5ICBcDQo+PiAtICAgICAgICAgICAgICAg
X191c2VkX3NlY3Rpb24oIi5kYXRhLnZwY2kuIiBwKSA9ICh4KQ0KPj4gKyNkZWZpbmUgUkVHSVNU
RVJfVlBDSV9DQVBBQklMSVRZKGNhcCwgZmluaXQsIGZjbGVhbiwgZXh0KSBcDQo+PiArICAgIHN0
YXRpYyBjb25zdCB2cGNpX2NhcGFiaWxpdHlfdCBmaW5pdCMjX3QgPSB7IFwNCj4+ICsgICAgICAg
IC5pZCA9IChjYXApLCBcDQo+PiArICAgICAgICAuaW5pdCA9IChmaW5pdCksIFwNCj4+ICsgICAg
ICAgIC5jbGVhbnVwID0gKGZjbGVhbiksIFwNCj4+ICsgICAgICAgIC5pc19leHQgPSAoZXh0KSwg
XA0KPj4gKyAgICB9OyBcDQo+PiArICAgIHN0YXRpYyBjb25zdCB2cGNpX2NhcGFiaWxpdHlfdCAq
Y29uc3QgZmluaXQjI19lbnRyeSAgXA0KPj4gKyAgICAgICAgX191c2VkX3NlY3Rpb24oIi5kYXRh
LnJlbC5yby52cGNpIikgPSAmZmluaXQjI190DQo+IA0KPiBDb3VsZCB5b3UgcmVtaW5kIG1lIHdo
eSB0aGUgZXh0cmEgbGV2ZWwgb2YgaW5kaXJlY3Rpb24gaXMgbmVjZXNzYXJ5IGhlcmU/DQo+IFRo
YXQgaXMsIHdoeSBjYW4ndCAuZGF0YS5yZWwucm8udnBjaSBiZSBhbiBhcnJheSBvZiB2cGNpX2Nh
cGFiaWxpdHlfdD8NCllvdSBtZWFuIEkgc2hvdWxkIGNoYW5nZSB0byBiZToNCiNkZWZpbmUgUkVH
SVNURVJfVlBDSV9DQVBBQklMSVRZKGNhcCwgZmluaXQsIGZjbGVhbiwgZXh0KSBcDQogICAgc3Rh
dGljIGNvbnN0IHZwY2lfY2FwYWJpbGl0eV90IGZpbml0IyNfdCBcDQogICAgICAgIF9fdXNlZF9z
ZWN0aW9uKCIuZGF0YS5yZWwucm8udnBjaSIpID0geyBcDQogICAgICAgIC5pZCA9IChjYXApLCBc
DQogICAgICAgIC5pbml0ID0gKGZpbml0KSwgXA0KICAgICAgICAuY2xlYW51cCA9IChmY2xlYW4p
LCBcDQogICAgICAgIC5pc19leHQgPSAoZXh0KSwgXA0KICAgIH0NCg0KUmlnaHQ/DQoNCj4gDQo+
IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

