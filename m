Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26530B054A8
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:21:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043742.1413767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubauM-00025e-JQ; Tue, 15 Jul 2025 08:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043742.1413767; Tue, 15 Jul 2025 08:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubauM-00023g-GB; Tue, 15 Jul 2025 08:21:02 +0000
Received: by outflank-mailman (input) for mailman id 1043742;
 Tue, 15 Jul 2025 08:21:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Lhd=Z4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ubauK-00023a-DM
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 08:21:00 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20624.outbound.protection.outlook.com
 [2a01:111:f403:2414::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1c5cd61-6154-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 10:20:58 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DM4PR12MB7528.namprd12.prod.outlook.com (2603:10b6:8:110::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 15 Jul
 2025 08:20:54 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 08:20:54 +0000
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
X-Inumbo-ID: a1c5cd61-6154-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKJg3Xs6ltjXWO9k0CWcQBhMYCwJLwaZbzUwP7QAcQK4HWGKsCA9MMDMz+CgDH+G31UKwrlDhMMiO7eh2KOqclmo/j8647ICXqlXfFSJlPHJYN9qToo/jjNmFd0bakOUrkjyr0iaic+Vx43FzLnZnHJ7NREKBpPTdstKp2Bew+aTze1fdUH312cOFBYuH05rHTDcKgXQ5sjWYxzmhkKmro1IwFVAKU8n+jbVeLvpba/LAyQs3GsfAcvs3BR6OXKgv0/ZdeJKXeuNzOWT5gcrrFs2+6WTWdX0yH8r3bsWreU4jSB/Z/+FDO7FCccl2Q4mqzP4pM7BrZqyBiXAepexWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDZii7biVj3J1IviJz4GOZQYAlZE4PcuFJcJ9zdwGT4=;
 b=zGbAqdMF/NbBvMa+iJZ+KT59Hoe12N/QF0RgkgUiC14lyTUxh44ZOarLpNg8WdUM2l/DPHItF+4+8jj84JVySuk4nlJPWeIpWnwJvdIQ4YuiQo282aN0QVlJqsTYljGjsZy7kWZ3NME27osCAaDgWK/62jBuFwGQd0rLbiltBnUE/O/A+3S/2l+M/oPSIaxBPjMsdX95OVo1IWkUCWzQJ6Cb/EuiA39dM0PSgkGtQ1fwzPm2AShNISA4UBekyKupSjwWgbLaD++fzeSucCb5ol2UphtgTw4AOhM14BjLZJ/dvs1p9uZPiMCBNeeVdtGKSZRgAkUoVVmPyblfYZje/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDZii7biVj3J1IviJz4GOZQYAlZE4PcuFJcJ9zdwGT4=;
 b=YozBB8F6DSxwcCL9gSajjlDYN55pvDLyA9Oc50flOSNS1Ps8rnS+MtpziXLMrN/gMfiFvDha6gcQAjjdadx4Qu+I2CBfu8F36C9id5X+5cIcj9AyvbrMl/2+TkpQq2R8v07RwzImo7LNgazzSyVQuMf4leLkoTgl60kaU6XmaAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3986f8e9-224f-42d1-84c3-8c171501dd62@amd.com>
Date: Tue, 15 Jul 2025 10:20:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm/mpu: Populate a new region in Xen MPU mapping
 table
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <cover.1752565274.git.hari.limaye@arm.com>
 <fad3dbb1cfcb33b5b1fecae92f57a5883ad1c19f.1752565274.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <fad3dbb1cfcb33b5b1fecae92f57a5883ad1c19f.1752565274.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0365.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::8) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DM4PR12MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: ee4aeaed-2e6d-4b96-7486-08ddc378845b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ckFtWnhlcUxFaC9PdkkwYmd5Z3l2YWUzWFROeTN6b09QRHQ3ZzRoZHBwWWVt?=
 =?utf-8?B?czhGZERGcGNmMEozbjJYVG5QbDdqRnlFVzdIVzI0RHBQZHpLNW1zdXM3eDR3?=
 =?utf-8?B?MEhDazNlT3F1azBwS3FoUmloV3U1RUpzaGtSVTZ4YU9ySWh2dkV6U2dKSDRN?=
 =?utf-8?B?K0lkRzkzOVFhRmVhQ3ZueFZEMW94WlhZQ2lCVXpmanF1elBvaXZoMkdFMHNX?=
 =?utf-8?B?TWRQRXJZb0tzVloxTFhQaWY3dm8zWk5GUkJvREFTclVNaDRYYWplMlJxSVhW?=
 =?utf-8?B?MjRZN3krM3RSKzNwa2RlVGdXZC92MEZyZEdxQkFWbWpTRjNXdDNza0hyQUs3?=
 =?utf-8?B?Z3hiYmJTODdJbktQKzQ0VEYxVUlsTmNSTGw3L0FEQ3V1dnlMQWxYUXUyYUxr?=
 =?utf-8?B?VyttUVkxUzBCcWRNeTJES1dKV1FJT2FzQXZVYVVxNFRKb0J6Yk1EWVdvMG1n?=
 =?utf-8?B?OEVNK085N0NWaE1DTmVCMGJiNlZvUXlDQ2JSeHJsbWRvcExXRVNza3NhbVNO?=
 =?utf-8?B?dk4zbkpOSllUUjFhcUVGZU9Jc1kvSW1Bek10cmcvOUlNSDZZY2JKLytJK1FP?=
 =?utf-8?B?VHU2VlRlcm9mUmdKWXh0d2ZPWXZXQzZIbWRDdTZ1MTJBYVVqVFFJaURFMEdP?=
 =?utf-8?B?RS9YRCtMUHdEUWMzNXljR0hXTEE5a0pNekxhdGlic3RlVHRCTW8zNERYSmlG?=
 =?utf-8?B?M0l4NHRCZ3RVQjBoUWVCRy9zelNXenprQVN2ZnRoRTlMUENoRmNCMUwyNnV2?=
 =?utf-8?B?dlNpbWdzL3FrdUE5TUR4dFVhTHgyeDRxVEQvRlVNRlJWdTlEMkxMY21LYVAx?=
 =?utf-8?B?YUgrVmZPUW11eHhCUkhQaUZzQStTZzFOb3ZFTytlb04rQjZBbVVLTk1iZzMv?=
 =?utf-8?B?eXhOWlB6R3B2Y3M3QmQ1Um80NkNYUjBPVVI4NUJCTnNrVjN4clJlQUJMeEVW?=
 =?utf-8?B?TlRqM3h0NStPb210VUowM2hubkJnMHd0ZmJ3clo2WXRZNzV2YTVoV0k2Wkkz?=
 =?utf-8?B?c3IzL3gxQkhYWkV2Z2dDZ2xUSFNHRUFKUTVvU1dVdXlrYktKOVQyUzUzVjBq?=
 =?utf-8?B?NEI0YnNSK05UQ3BBWVV1QWJ5NXhYU2tPaHY2eTJmV2c1RXUveHNzSUprKzZn?=
 =?utf-8?B?SjY5aXpMT3RwNnJrQmxRNUJXWko1VnVvNzdtN1BiVFJabUZ1eUdvUEg4d0J4?=
 =?utf-8?B?WUZhWmtjNjRGOFpVYW9EUzNqbWNmbTN0eGZwWE95a3dhdk15ZVFuOVR5NzdQ?=
 =?utf-8?B?cUdhNktDNEpoTkczeDJBemhKbEMzcEJ0Y3Z3elBkTUFpV2Y4SjcxN2FVTTNs?=
 =?utf-8?B?eW15Y0k5bkhYb1dUbk8rc0J5NUdGSDlETEMxSndLSXBYcndEMmlWcDBrUUw5?=
 =?utf-8?B?ekU3RTU3MC9KY3g4bCtUWlNxZzFWVHpncFFlUHgwaWZLMFpRYnBiTmVObHBM?=
 =?utf-8?B?czA0aFp5MHJvdnphRnhWMlpLR1ZFcTY5eW9XTXpGV1JUdWtCRFRNZW9aRTVL?=
 =?utf-8?B?WlkzYXpGaVIwbEJWbkQ4US94YTRWSzMvQi92U1grMEpLZWRxV3VwT3Fsb1A0?=
 =?utf-8?B?TW5IZm1nVzNHaTdDK3RsWmE5bkZRVUsyR1ZyYm9XdTd3alBBMnZFVk50QUtZ?=
 =?utf-8?B?ZGp4bkRmY2JmR3pIOWZWNitFbzlDNWswRnVBam94ZHdyTjMvZGpiWm1OTXpK?=
 =?utf-8?B?WTRUQUVNSC9rRjB2TXBtb3pUZkNJRnhQSzQyWWloak5HNlVITUNZTTF1aXN2?=
 =?utf-8?B?RUYvc0UxbFpYMGJkOURjaTdBT3VNSzMrZ0lJdTI0aFNraktyRW1KRHpENnF5?=
 =?utf-8?B?U1VKK2Z1MnMwZyt4ZDBnLzB5SWh5UlFkb3gxREtBMTNHdFd6QnFleTV6U0Rk?=
 =?utf-8?B?aUxES1Fmc0VkNFZUeXJjSTBjWHVlb1dyT1ZTTmxuaDUzQWhwR1pydzI2NEpL?=
 =?utf-8?Q?m7VpKYNiwZc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2hBUmdnWWNONjI1ZmRZOCtudE95RVBCdTV2aUpTaFRNYnZhSGJlUFFMMjM2?=
 =?utf-8?B?WEh3S3QvUlIra0VQSDRJWElKTDRabUV6WmdHdFBqRHUrdjFLRnl2WGsrbVQy?=
 =?utf-8?B?azlpeldicnU4TWtBR0FiV2hUT3c2S3hnekYxOHdrUFIzTTdqM3gxZkdRRlBM?=
 =?utf-8?B?R2NURVlWa0hVelZOcWd0SjRSalRlSUhnZDlYVXZQYkl3bC9EYjM5NFlkYjZT?=
 =?utf-8?B?MCtuelNnVFNkeHE4Y2JTV3dubTNDSXBudmFiZDhZa0JYWFlNUWhydm81ejhG?=
 =?utf-8?B?VDd3bUN3WFBvb3JFRkFSOVNkWWFzVEdCMElKaXdjMGxWYkxTSTE5QnFDTUN1?=
 =?utf-8?B?Tit4M0Z1MkNKcytGcHFJcERYNjRKNkk2bVNaMlN2ckgvV3RFaktja0xPU0N0?=
 =?utf-8?B?SnZLaTdpRE1ZaDZSaFZVUWFTbzM0WWNJNk80SUNuTCt6R20vVGo5VEJkM3ZH?=
 =?utf-8?B?eDlTOTZoQkRscVVZNytqVzNRWHpmWjBUR21pbnBreHgwMjNTa3BtcnJuYXpU?=
 =?utf-8?B?TzFtMnZmK0hjSklmMUpwei9MTEdhSUp2T1NxMU1scmFqQW96UjVlbjBoaTF2?=
 =?utf-8?B?T3ZOc0dZYUxkbmMrekY5cDJ4cUQzN3F3M3JXTkVFQmM1b1NOS3pnTzBmZG9Q?=
 =?utf-8?B?STZVS3BZcXFDWVIyNzBJMm0xWkNqakFJT0ovdExmeG1VQzVzTVdaUlM0ZGpW?=
 =?utf-8?B?MmZKbGNNTVltSlJSWU1temlyM1J0TzZudW5wN21SdllkalpkeHRUYVFiWnJm?=
 =?utf-8?B?bUJoZ0tpN2hNQnB4ZlVlL1g4SmNJTHdBcVMrNmEvQ0VBK1BVVFBmTVRKOVBr?=
 =?utf-8?B?M1NYV0VxeHhNaXA4Z2RBWmthQnNmbXcwWXRGWFltOGVzYkdPd3h1aGd5dmpX?=
 =?utf-8?B?dXZDZ2lEblMzYjJzbXY2T3pXMWFGT3h3RmZvVUk5Mm9wME1xM3Z4WkpjMnZx?=
 =?utf-8?B?VUNERXB4VGZ4dHRmNDlQV2VmY3BjT2MxVlN4NlZKelVlazRBeFVFdFozR2oz?=
 =?utf-8?B?U2lBTGJhWlZ3VUtRZHdYV1NTa2o0dng2K09IUlk2bTBGcUJHajVKdk95MEY4?=
 =?utf-8?B?Wi9mUEZJT3ZJVWZuNkU1V1VUVDZHSllDYkRLRGJHNTdVSy9YbUNMUkhOM245?=
 =?utf-8?B?ZlZ4dXU0SUR6OEZ3UjBBNUswOGNzb1QybW8xdHpKa2VJeW94YU0xUTNBZ3dw?=
 =?utf-8?B?Z1d5N3FraHdaZURIMW5CUnJhOG85Rm9aNm5nQUxvRmR6eUpuaVdzRUhuQTFp?=
 =?utf-8?B?d2ZIODA4THluMFVoU0JvTEdUeTNqYk05YzhlSk12SDJPSzgwOTdISUMvVHdS?=
 =?utf-8?B?clJYeFVvSS9wT1NZL3JVQWx3UElMdGx0UVY1SUg5cTNsMWpmdE5rNWZqS29o?=
 =?utf-8?B?SzcxMTVjSEo5bkFXN1lpRkw1aWJFektZNmN6c284T2JJV1BOUlIyVFRjLzFI?=
 =?utf-8?B?WTdsMkVQdmhYbFFQY2xsRk9Rb3BLR2pXalZqbUNUek82NE42S1pXUHZFd3NN?=
 =?utf-8?B?Y3NVSW42YWMveDJSZmhnL0UvZlZ4MExwSWw4M2M5d2J5YXlqNGY5RUtGNjdE?=
 =?utf-8?B?cXNLUGZ4SWJidnlpNTBTYTl2SFRjcjdseVRoMVRlSXY4eXl2cHRFeDdKeFdo?=
 =?utf-8?B?Zk1WR25XQWM5R3NhTy9EY3lHdzJJYUNHSlMzZ1MwMWNvS0pxdWJSOW5lY3RK?=
 =?utf-8?B?SDBVUVFmZHQxVWhtMVpXOVowZGo0V3p4aDQyMnpGYUdEM1pLT2hOZ1dGWHQ4?=
 =?utf-8?B?dmkrWWtUYVIxUmpxZVROR1BiZm1jRzZyZE1SWThLZjUzVy9aYm9vdzllVWdn?=
 =?utf-8?B?U1JYeHVNN0w3dUNoRW9qSzFYUG9LMzNoSTU3Znp4bnVja2psajlGNFhJdytM?=
 =?utf-8?B?cmdzYjRFUzBvRUpneUc0MkM1VFlkTGNYODZ2NmRBS1I5OEpJeTkySTFnRmd6?=
 =?utf-8?B?STV3U0lPc0dXYzBkckpLSmZ5OHowMm13UlRuRklvZHlGL0E4akIwL0ZNMkUw?=
 =?utf-8?B?RjBCUk0rUWR1ZDV2M2cyRzBZQ0hjdmRNVS9xZWI3QXExNzMyTXlDcmQxYndZ?=
 =?utf-8?B?YUhldEZYYWM2ZWJOWU11YzhzRnBqQTlHWHVGVEI0RUdBOFZTUG9aUVBVY0E3?=
 =?utf-8?Q?FMPZFdE5CR8S6H/gK38/UZsXv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4aeaed-2e6d-4b96-7486-08ddc378845b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 08:20:54.3927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDxVrkh3t5ZJvGkzpP87ZXJHFY8vHelYSkQWgR5Ky2vL3sbSbk9+LzEdrByxHUWQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7528



On 15/07/2025 09:45, Hari Limaye wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> Introduce map_pages_to_xen() that is implemented using a new helper,
> xen_mpumap_update(), which is responsible for updating Xen MPU memory
> mapping table(xen_mpumap), including creating a new entry, updating
> or destroying an existing one, it is equivalent to xen_pt_update in MMU.
> 
> This commit only implements populating a new entry in Xen MPU memory mapping
> table(xen_mpumap).
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> ---
> Changes from v1:
> - Simplify if condition
> - Use normal printk
> - Use %# over 0x%
> - Add same asserts as in Patch 4
> 
> Changes from v2:
> - Improve clarity in xen_mpumap_alloc_entry comment
> - Simplify if condition
> - Remove redundant ASSERT statements
> - Add check for `base >= limit`
> - Pass virt directly in map_pages_to_xen
> - Move call to `context_sync_mpu` inside locked section of `xen_mpumap_update`
> - Move _PAGE_PRESENT check before calling `mpumap_contains_region`
> ---
>  xen/arch/arm/include/asm/mpu/mm.h |  12 ++++
>  xen/arch/arm/mpu/mm.c             | 103 ++++++++++++++++++++++++++++++
>  2 files changed, 115 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index 5a2b9b498b..c32fac8905 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -64,6 +64,7 @@ static inline void context_sync_mpu(void)
>   * The following API requires context_sync_mpu() after being used to modify MPU
>   * regions:
>   *  - write_protection_region
> + *  - xen_mpumap_update
>   */
>  
>  /* Reads the MPU region (into @pr_read) with index @sel from the HW */
> @@ -72,6 +73,17 @@ void read_protection_region(pr_t *pr_read, uint8_t sel);
>  /* Writes the MPU region (from @pr_write) with index @sel to the HW */
>  void write_protection_region(const pr_t *pr_write, uint8_t sel);
>  
> +/*
> + * Maps an address range into the MPU data structure and updates the HW.
> + * Equivalent to xen_pt_update in an MMU system.
> + *
> + * @param base      Base address of the range to map (inclusive).
> + * @param limit     Limit address of the range to map (exclusive).
> + * @param flags     Flags for the memory range to map.
> + * @return          0 on success, negative on error.
> + */
> +int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags);
> +
>  /*
>   * Creates a pr_t structure describing a protection region.
>   *
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 407264a88c..d5426525af 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -6,6 +6,7 @@
>  #include <xen/lib.h>
>  #include <xen/mm.h>
>  #include <xen/sizes.h>
> +#include <xen/spinlock.h>
>  #include <xen/types.h>
>  #include <asm/mpu.h>
>  #include <asm/mpu/mm.h>
> @@ -29,6 +30,8 @@ DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGION_NR) \
>  /* EL2 Xen MPU memory region mapping table. */
>  pr_t __cacheline_aligned __section(".data") xen_mpumap[MAX_MPU_REGION_NR];
>  
> +static DEFINE_SPINLOCK(xen_mpumap_lock);
> +
>  static void __init __maybe_unused build_assertions(void)
>  {
>      /*
> @@ -165,6 +168,106 @@ int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
>      return MPUMAP_REGION_NOTFOUND;
>  }
>  
> +/*
> + * Allocate an entry for a new EL2 MPU region in the bitmap xen_mpumap_mask.
> + * @param idx   Set to the index of the allocated EL2 MPU region on success.
> + * @return      0 on success, otherwise -ENOENT on failure.
> + */
> +static int xen_mpumap_alloc_entry(uint8_t *idx)
> +{
> +    ASSERT(spin_is_locked(&xen_mpumap_lock));
> +
> +    *idx = find_first_zero_bit(xen_mpumap_mask, max_mpu_regions);
> +    if ( *idx == max_mpu_regions )
> +    {
> +        printk(XENLOG_ERR "mpu: EL2 MPU memory region mapping pool exhausted\n");
> +        return -ENOENT;
> +    }
> +
> +    set_bit(*idx, xen_mpumap_mask);
> +
> +    return 0;
> +}
> +
> +/*
> + * Update the entry in the MPU memory region mapping table (xen_mpumap) for the
> + * given memory range and flags, creating one if none exists.
> + *
> + * @param base  Base address (inclusive).
> + * @param limit Limit address (exclusive).
> + * @param flags Region attributes (a combination of PAGE_HYPERVISOR_XXX)
> + * @return      0 on success, otherwise negative on error.
> + */
> +static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
> +                                   unsigned int flags)
> +{
> +    uint8_t idx;
> +    int rc;
> +
> +    ASSERT(spin_is_locked(&xen_mpumap_lock));
> +
> +    /* Currently only region creation is supported. */
> +    if ( !(flags & _PAGE_PRESENT) )
> +        return -EINVAL;
> +
> +    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions, base, limit, &idx);
> +    if ( rc != MPUMAP_REGION_NOTFOUND )
> +        return -EINVAL;
> +
> +    /* We are inserting a mapping => Create new region. */
> +    rc = xen_mpumap_alloc_entry(&idx);
> +    if ( rc )
> +        return -ENOENT;
> +
> +    xen_mpumap[idx] = pr_of_addr(base, limit, flags);
> +
> +    write_protection_region(&xen_mpumap[idx], idx);
> +
> +    return 0;
> +}
> +
> +int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags)
> +{
> +    int rc;
> +
> +    if ( flags_has_rwx(flags) )
> +    {
> +        printk("Mappings should not be both Writeable and Executable\n");
> +        return -EINVAL;
> +    }
> +
> +    if ( base >= limit )
Given that limit is exclusive, to prevent empty regions, you would need to check
for base >= (limit - 1), even though it's not really possible because today we
require page aligned addresses (limit must be at least bigger or equal than base
+ PAGE_SIZE). That said, it can change one day, so I would suggest to modify the
check. With that:

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


