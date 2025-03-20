Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5C0A6A2D0
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 10:40:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921551.1325368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvCNf-0002EJ-RD; Thu, 20 Mar 2025 09:40:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921551.1325368; Thu, 20 Mar 2025 09:40:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvCNf-0002BD-Mu; Thu, 20 Mar 2025 09:40:03 +0000
Received: by outflank-mailman (input) for mailman id 921551;
 Thu, 20 Mar 2025 09:40:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tHGG=WH=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1tvCNd-0001qY-LZ
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 09:40:01 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2060a.outbound.protection.outlook.com
 [2a01:111:f403:260c::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4aaf16fc-056f-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 10:40:00 +0100 (CET)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by GV2PR03MB9521.eurprd03.prod.outlook.com (2603:10a6:150:d3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 09:39:56 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.8534.031; Thu, 20 Mar 2025
 09:39:56 +0000
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
X-Inumbo-ID: 4aaf16fc-056f-11f0-9ea0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3dWIeI9bU0wqDQFHQm7q9gG5XYFO3UCRuYvqSMXfY2/CM5Zu15SxOLcE88umFJ3CXtxwjKT+8NBEKJtHKkqkGQn8KkqDRYKJzepu7zHoVVCKfvJlOq3HEX/HMWdD3KsB4VPCDyMMnqJlhPPp/F/Khl52ND/SV61LmCOAV7Gwhmkb1NAQ76m79n5K3oKTVq9+jV7xxCbXXfFDC3uwTVfMSBFOuMWRtKN6dMCZ1w0JSKdYQkXBkgDog5DUiAYzbj3qntmIWbEwQiKHHF9NMHrvcUTGiOnQ7fRxjIg6Z3HFqlGNVofwA36+sebdC5vD7M1s03M4+PYb51nWmEz8OTEKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsMPvtpM3ETFU/HIoo6pamiLwx+41JgJET6xVqOUrVE=;
 b=y6sE5LX7DuOmRn+can99rAf6Slq0lJL8HreH8jizArwVm20/Bt8vu3t+0fOekgi3sJFzOL7QutSBMjiPTAi1M0cnoSGR8qKjEtA+Kg6fzg/3Xzo/0Dpzv8rsbkVIJ33ypHJh25tMle9xFpAyp9kV/yL9NxWKDWJ/VwFZidpW6Yb9SYd10OZDwRxm/nEETK/vCqKycjePkusEHA/qhDvqDuX3fvYSRZiDrHdzB4TaLWlakV/cmdjJVkfxJoT+tRonJGwRGjCeEYpZXbvHgB55Gxiu67Kw7j5d9JicyZJF2h0VYo3Nj0fnKd73LGcyULrqxMFqWH/IIF/pRHtOFW472Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsMPvtpM3ETFU/HIoo6pamiLwx+41JgJET6xVqOUrVE=;
 b=G86GW6BoNW21pAvGpWoZeCCM17g72+D59jfWZiba/t/xoPgevLvG2MRCDcmhLBmQMchFoW60Njeqr0m3DtLouQlKf5UdYGZdTxknPtF4Fk+0tazs2jsUqPrTVuHXWFQS2U+7B8GCGNApdFE36tFFvnXYHyEhw/Tngr3K2bJt/h60jpJls8FQfN/UDUBmjrq6ywZUGLcQlDFwo0PzOWwfhjd+MII2XMEM341lU99pv+NhB95ekVek7mcXEEtX9ua8PUKcXE9TX/mClqfLzTzxk/0kRCUmru6r4o2PH7yKXhOO5ow9C1CNKEhXa7Sdaw30Qwl7ovCbb8LqudTdmY3RqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <93e98ebb-4679-4c34-a5af-f105e89c7304@epam.com>
Date: Thu, 20 Mar 2025 11:39:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86: make Viridian support optional
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250317071919.3766976-1-Sergiy_Kibrik@epam.com>
 <CAFi36o263XOQbTpSGDcM3PmpY+MwodHi1tOXDp3W60N0n9b9YA@mail.gmail.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <CAFi36o263XOQbTpSGDcM3PmpY+MwodHi1tOXDp3W60N0n9b9YA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::26) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|GV2PR03MB9521:EE_
X-MS-Office365-Filtering-Correlation-Id: e6945761-0d4f-4c71-2adc-08dd67932c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0dtb2o3dkNKOVlYSC9IRnNaRHIrakFmUlBBV3MyNDY2NG9oRW0yM05Cbms4?=
 =?utf-8?B?QzhPSGFoTFJqMW1JL2RQbTduUmtmNyttRnQyc3JweERYa3grdGFPaWkwb1RX?=
 =?utf-8?B?RzI4TkJoaWNCZU5UbXRXS2FUVDJnd2R6aWpXUFlRLzZRcUZTbzk5UzFLckFz?=
 =?utf-8?B?WUpNN3dDVFMvK1E3VmtqQU9IMU9FSjJyTHQza05CcUNGbWFudmZnUUtyc2JO?=
 =?utf-8?B?NFNydkowbE9hSlZyZWRNNWlLWlNSbjRNSklPT2V3ZHU3elQ3TndzV3dFcW9V?=
 =?utf-8?B?Y21IR1c0WmNlcUloc1RxN2ZCZEVLNVZadm5DdzJOVDJqMkR5T1YybTlLUmhj?=
 =?utf-8?B?dWFuTzZOR1lBZjVINzM0cWpmOUNqbzVlZGY1K3dQcmxhb2pHZlBkWWlkSVVk?=
 =?utf-8?B?ald4Tmp6OHhUV2RVS0NzWTN4UlB3Ymo4WVl2TzhyMnZMeGJhTTRhM2xUS0Ux?=
 =?utf-8?B?NlJFd29Fa21NRWd6VS8yZGtqQUt4OTVtbEg4VE05TEpqaWtNK1VRNVRNekcw?=
 =?utf-8?B?cEdMRGhTMU4zN1Z3WTB4bHNkQ053bzRtVTBMSldkV0lVVTIyVDk0c2p3U3kx?=
 =?utf-8?B?azFPQkoxMEQ4eW5seGg5M1pjbnpDODN4K2UrdUd1OHpQVnhZT3VNVisvdFlL?=
 =?utf-8?B?V3RWSWN5R1J6V1dLWWc1VlRWbk44bWdVbFpHMERXcDJDZEZBeU10Q0hxY2hu?=
 =?utf-8?B?NXVGaUJQMmg3UzZOM2FRWVFRNzJPZGtzY3Jpc3ExWHNtTmlVRzN5cmVvMHV2?=
 =?utf-8?B?VCtPNVRrQTFVbHVVeTQ5TUJRWTZVZWFXNGJkaFU1NFJFRCsrbDV6SHpBQmEz?=
 =?utf-8?B?NG1kd3lpYUlTOXNjMUluZVJKcnVYM0plN2xHMWh0ZksxUFRwM3lrL1dVNGN5?=
 =?utf-8?B?YlJqZWZqUHpkM203WU5DbTA3bkR2V0diN3pqbVdwME00RC9QUWtFcVZEM1VM?=
 =?utf-8?B?MTFBYWZvbE9DMUlHdjdXMjZEUXQwMFNZOXRkS2wrbHJyamRaSFQyajFtdnNU?=
 =?utf-8?B?SXI1MjFQWW16bzVOS3B1aDZubFptQVhuaEo0dDg2dGxCQU15bFZ3YU1UUHE3?=
 =?utf-8?B?MHRJU2FZWFdNYy8rRVhweXhDTUV0NjNQUkwyQjQrRU5ycjNwSHBOUXM4ZXZs?=
 =?utf-8?B?aTdWVVJqVHhsZUZ3aFZvbkxiR2ZnQ1IvTXU5TjRudUptbVJpSDFIMVZaRjBw?=
 =?utf-8?B?cFhJdUJSdGFQdTZMcE1qYWhMUU5FUXE5WkVnWUJxcEZ1a1BmTkxEaHVMeE5k?=
 =?utf-8?B?YTYwOHdkRHgrWmhCZzRBdm5xdEsvekgxTThPa1pzQ3lJamZTWi9Jb1I0M0Zu?=
 =?utf-8?B?aTA0UzZ2Q0NCRklnV3NDbnJWY29JdkhRNlBBK3B2OG1xV1BKMWNzU3JvcDFi?=
 =?utf-8?B?N0hpZnE4cnVIVFY4cWJBRE5JUFFQdS9rY0JaNngwVjVpSW5td0RGb05iRSt5?=
 =?utf-8?B?K2pzaHo5N1Vsb29pVDhab3ZXKzA1KzYza0VjeVBOU0R2V1ZHVXdGakplVzFI?=
 =?utf-8?B?Z0hWVlB6VzNvSXNoRWZySEtMUUlKV09rcWVkV1hZeFMvdDRCWjQxcUJ5c0Vq?=
 =?utf-8?B?NDdJS055L1UzOVc5YkRqcmlkQUpGaUkyTUFCY08waEZIUEdJYXFERGg3djBL?=
 =?utf-8?B?bTJlZ0k4UzlmZWE2eURqakhOVjZ3VDM0NW5GZ1JDdUNXR3E0a0tER0w5Q3BW?=
 =?utf-8?B?bU1ORzlMaGhlWUNHeXc2Y21xc2tuL096bzR2N0E2VGRkQzZua0RxU0dRNlg2?=
 =?utf-8?B?SzRqWVRZeE1BOXkvN2ZKeTlMNERBZ1EvVUdyd0V5YWtNTWo5Wm9JUmRTNnVx?=
 =?utf-8?B?QU9sZURLMlJWTktnZkhNU3F2MlpTRThXTFRDNzkrcllHelVjL1F1ZGhEaHN6?=
 =?utf-8?Q?hdlwLanc4ZKNN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3daN2Q3TUlrMkxrdzBLYnVQZ29OQUJpdHZRcGFEZ3NaY0dSWkVPSnd0VFBX?=
 =?utf-8?B?V1BZOUNjL1c2VEpWZzJvWHgvdkViQjJCclpBZFVQZ1JsYjlCM3UyRFNFZFoy?=
 =?utf-8?B?bHdEdFJLdnoreG1rZEdTRkI3Um9XVTNnNnp5QkpJZ0lvTHAvMG9MaEd4R0ph?=
 =?utf-8?B?SXZFYVg3WnN1blVRd3VTOEJ1d1g4TmVySGNweXQ5bGN0NkVjZ1hiVEtQMS9H?=
 =?utf-8?B?cXVnMXhIS3NtK1dJZ2dUUG1MY2E3Z2NrRmdqT1dKcW9FWDNJZmhYcVJpTWNR?=
 =?utf-8?B?UlhjNHRXODZRak9nOVpXZjFuOThHTUlJNHZJdklSb21CTE5GZjVRWlc0QUJE?=
 =?utf-8?B?cm92akhIUllTcFYrZ3hrNlZrek9EUlpLcHBldTlVNmJPejcvM3d3UmxKd2xy?=
 =?utf-8?B?dmtiTkZ0dzhJcjRiWjV0dlVId3AvUHI1dExwd3FoK3puOWllOFpHQmRtZnRi?=
 =?utf-8?B?VkJJZENnVUROQjdQM1JJZ05lNFg4cjB6ek0rNEhGNjhuZ1BuQjlDTjJJOVln?=
 =?utf-8?B?R0xkdDFuWW5UTkVhMk1qQkpMbFFIaXlQRU84Z0MveExRZ0pCYkRsQUJpNnU4?=
 =?utf-8?B?MlBjVTJjN3o1S3pva2pqUzY1ajU2SWRBN2p6MHlZOTRUdlZnSm15T3YxOHRi?=
 =?utf-8?B?T1MweWdJWXFVbmViL3pQZ2Z0RklVYmFIREZFNldSc0ZtM3Ivd2lmaHpnUHFk?=
 =?utf-8?B?Ykxac0F3Tlh3aUFDbzhTS0dKQjlXbndyVVpqZVl6ZVNTdGZISXd0ZHJHTENt?=
 =?utf-8?B?TzU1OFB6SHJnY0dFNmxiWVdUSkFTVmhHL2NNbHkraU1sUGVtZDFnN0lPZC9z?=
 =?utf-8?B?VUlBeld6L3ZDeEJ5V3dxcGF5WHU0ajREZkdTLzM4K2Y0cXA0ME95Nm1qRVh2?=
 =?utf-8?B?ZlJjUzg3N2grR2FDQkpFSzZMVE9yOU80QUQraU03bUFNenhVQ0Y4dEFob3Jm?=
 =?utf-8?B?UCthbldmNWdNb2VZTkVDS2VUOU92NHA3ZTQwdmdpZ3o5ZHNzUVhxaS9QbWpm?=
 =?utf-8?B?UnVjWE1kMTg1Q2NyR3UrS0lVQVpISXFFOFVMVzNMRkxhaEtzRUhSZ2pxWEMz?=
 =?utf-8?B?NEROZXBldDNSRk95czZjTW4vNzNDLzFkaUVnQzcrTkZBcDhFSHA2T3JRYWJa?=
 =?utf-8?B?RlFHSTRCaTlpZVlHNjVjMmJXVWhsUFREN0JXTUZ6L0h2VXpuSjBIbnc3QnhH?=
 =?utf-8?B?SEd1bXlQMVVUU2x0WExkb1BPZVJJS1NYUnhnV0tJYXdEZFdRMmQ5aVpVeCs0?=
 =?utf-8?B?ZzVTeTJjQVhWRnZVLzkrWjFwS3RUYzJKcnd2ZnQ2bjFMK2tXQ3N3Z2VUTnN6?=
 =?utf-8?B?Z0I4WE93KzBtNk5YaXN5M3FxOVlqVkNJaGREa3hqcFJHUVpocEVzbGpYRThH?=
 =?utf-8?B?VWVMMlpZQjV3ZlZSelYxZnRsQ1FCdktvVExRQmUvQUJ2aGxxTVBVbllSZnRu?=
 =?utf-8?B?bExiaTVBQkdPdXBqZkZlNDYva0hwLzUxVE1GU2l3WU55U2k3MitMSUR4RHNN?=
 =?utf-8?B?R3plM3ZtaEVSSjV0TmhwcVZpVjVtZjJidHEvZ0pvSW4zUEd0MTdGZTBkYUR1?=
 =?utf-8?B?UU9pa3FqY0wwa1JkTlU5aTlHT1NFOE1FVWNpTDZXSEJURTIzYWc0eXE3QnV5?=
 =?utf-8?B?Vy9wSEFjSmtaQjNCKzZMbG53R3hyNU5Hdk11dU9wSnBpR09zVmJwRk9XdHpZ?=
 =?utf-8?B?RS9EMGtsaUpTRjNpcmk5aUgxalF6Z2JIN2RueG1FOE9XajVLa3FwQTJOcmVK?=
 =?utf-8?B?U3k2aFZLM2J5QWpZcGVHRjNmczZONzVqN2FoY2ZhR28yL0p1Wld4dlZjaUJ1?=
 =?utf-8?B?THU2V091NjVxSzRUbXU1THV6NUl3TWVQczN4V1E5MTlKZklZVkdENGNWWFNn?=
 =?utf-8?B?RUZudE9ydEN6RzVNTnRWMzkzMmF3QlM3U2VlV1ZEeUNDR3dHdlZQMUZCcTZT?=
 =?utf-8?B?WkJVcFp4ejFtem9pOUtYNitqQ0hXR2pPcjFSd202VEcxcUhxZTdmSjhXQUVo?=
 =?utf-8?B?MzVsSElmbmlrbGNsalhsbTBHam9PNVJ1MXNkQ2djM2o2TVF6aEpHSVM5S3dF?=
 =?utf-8?B?d1lDYmN1b1RrZnczNXVJSmxTZW9aZFE2eUpYOVEwRnAwNmNtZk9naE4vYUsw?=
 =?utf-8?Q?VTCVnXROKHGNDgMhLKFUZ5UUf?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6945761-0d4f-4c71-2adc-08dd67932c93
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 09:39:56.4457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPvUMrSLKIuPcS5lAsec9n4Uf/0V5dZW+mv2JuigVmiHKy/TDSeJj//VFNLN6D+di0/Gdl8DXOebxJFqj6JLvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9521

hi Alejandro,

17.03.25 11:19, Alejandro Vallejo:
[..]
>       endif
> 
>     +config HVM_VIRIDIAN
>     +       bool "Viridian enlightenments support" if EXPERT
>     +       depends on HVM
>     +       default y
>     +
> 
> 
> 
> I don't see why this should be gated by EXPERT, provided a
> suitable (now absent) help message was to exist explaining
> what it does in plain simple words.

The option is intended primarily for fine-tuned systems optimized for 
particular platform and mode of operation. As for generic systems (e.g. 
distributions) whey wouldn't want to disable it anyway.
> 
> For the title, I'd say it needs to properly state it refers to
> enlightenments for guests, rather than enlightenments for
> Xen itself when running under Hyper-V. As it is, it sounds
> ambiguous (Maybe "Hyper-V enlighnments for guests"?).
>

Agree, "Hyper-V enlighnments for guests" is better title.
As for help message, would the one below be sufficient?:

  help
    Support optimizations for Hyper-V guests such as faster hypercalls,
    efficient timer and interrupt handling, and enhanced paravirtualized
    I/O. This is to improve performance and compatibility of Windows VMs.

    If unsure, say Y.


> On a personal nitpicky preference note, I'd say HVM_VIRIDIAN sounds
> rather redundant, and I think just VIRIDIAN works just as well
> while being shorter.
>

this is rather to highlight the fact that the code is part of HVM 
support, a bit of self-documenting

[..]
>     diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h
>     b/xen/arch/x86/include/asm/hvm/vcpu.h
>     index 196fed6d5d..bac35ec47a 100644
>     --- a/xen/arch/x86/include/asm/hvm/vcpu.h
>     +++ b/xen/arch/x86/include/asm/hvm/vcpu.h
>     @@ -171,8 +171,9 @@ struct hvm_vcpu {
> 
>           /* Pending hw/sw interrupt (.vector = -1 means nothing
>     pending). */
>           struct x86_event     inject_event;
>     -
>     +#ifdef CONFIG_HVM_VIRIDIAN
>           struct viridian_vcpu *viridian;
>     +#endif
>       };
> 
>       #endif /* __ASM_X86_HVM_VCPU_H__ */
> 
> 
> nit: I suspect the code would be far less cluttered with "if 
> viridian..." if the
> init/deinit/etc functions had dummy versions of those functions when
> !HVM_VIRIDIAN in the header.
> 

as Jan explained some time ago [1] it's preferable to compile as much as 
possible in all build configuration. Besides most of calls to viridian 
code are already guarded by is_viridian_domain() & not actually require 
stubs.

  -Sergiy

[1] 
https://lore.kernel.org/xen-devel/36708a3f-2664-4b04-9f5d-f115d362d100@suse.com/

