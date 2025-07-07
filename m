Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2F4AFB378
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 14:44:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035556.1407873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYlC8-0000RC-Hd; Mon, 07 Jul 2025 12:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035556.1407873; Mon, 07 Jul 2025 12:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYlC8-0000PV-F3; Mon, 07 Jul 2025 12:43:40 +0000
Received: by outflank-mailman (input) for mailman id 1035556;
 Mon, 07 Jul 2025 12:43:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C52b=ZU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uYlC6-0000PO-77
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 12:43:38 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20604.outbound.protection.outlook.com
 [2a01:111:f403:2414::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff764898-5b2f-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 14:43:36 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SA1PR12MB6847.namprd12.prod.outlook.com (2603:10b6:806:25e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 12:43:31 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 12:43:31 +0000
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
X-Inumbo-ID: ff764898-5b2f-11f0-a316-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGsKvuZhVrlemsOlqJ0mne+xfTklKr2/MOMHHHWwUhzNGE9FASjIPgExa5FrK9mh0dhhFwKh5+dJc0y3b6UIUER5PSRuvTiKC3kBX/qaRVlvky3M32tAXaCW7/QH5xlRPur8uZM79Y4BChlHpbD0WPYyHq1350XpadOBdQzCf/O96fkkupiw37cRFnIYjDCug+lIySstJnBl7DlWL5BRvG2CCfO9h+r0H9zrU0puh+VNt8Eq60cPq3TQ1zH0yVR38rt2Iy27KpZunzhGs4ieFBXWzq5i8k5siC1Ap886L95Xv0FLKoDlvo6ESW5mCvVXd4XXOB3j9M8JKT8Ob+DZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KD2f056gXRadcWzFz9GJOps42ORGEMCOE9WA+P36POE=;
 b=VunzDKzxeiUpxqNxbCcg4yQd6tvnpE6nJuRoctywTSGasfqsix+RtH/zNLb4I84kQjBI49SIAHgZEpGZX3s12GsrFzdKSKLYvCqpCiTUOgtjJFBFJb/zvZQwlcbozxScCnxXZdcxdACRzGDRpdMY/pMsIjg0CttF9E7aGPRloWD1FOxf/oYg4ejWKenlU9vCKYPhiUZNERJB/F8IgpOSE+4PyU6+vvy5zVLZ3AfDfnF/KzTZjkAjPMBfWExTziJVG3Y3R8Lk8vDdET+NhCnBdhqaE316D9yN5AUi1uukeqkegsxXYHp9mtWOMKHuVZcni4cgwYnxGPTHTBt+X/q/pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KD2f056gXRadcWzFz9GJOps42ORGEMCOE9WA+P36POE=;
 b=LTXairknKDBfB1vmtR/kGkc8TrpdyKyslIJPOESLGrU8r7DOtEVu0XuhvplT6Xa/O9Dcu5Yl9TGFnik+4IkJvIp7D0vwp3RVO54n/Lc+F+ihYgJNAxj1gQ/iHPmvom1SSlpeVEBGQoEOvNN9bZwzfYY8d0j6iT8U+WAjOtmD598=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7a84c241-279c-422e-bf5b-c455a5b9da0c@amd.com>
Date: Mon, 7 Jul 2025 14:43:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/arm: Skip loops in init_pdx() when no PDX
 compression is used
To: Hari Limaye <hari.limaye@arm.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250704075428.33485-1-michal.orzel@amd.com>
 <20250704075428.33485-3-michal.orzel@amd.com>
 <ugfgau3ucts3ltdxe5tkxu5lmuqhv5ncyvzqdgogxt7vjoffag@sklw54xnec35>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <ugfgau3ucts3ltdxe5tkxu5lmuqhv5ncyvzqdgogxt7vjoffag@sklw54xnec35>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::20) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SA1PR12MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: c214f727-a999-4bbe-29ae-08ddbd53e10f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YS9HYWZoRmFwUy9tNzJzUTBiclppSmZoVFRDbUNxZ1l5bjVXd0FPWDNzVXdX?=
 =?utf-8?B?b0d5TWtoTE9XcThhUmRRbW1pTDNaN29MUDRwVkZZQ0xRNWJmWWZRTi9NOXZj?=
 =?utf-8?B?T2laZTdvNCs5Z0tnZHlYTmgvWmxZNGRsV2tXOWVvdHo4Nm5mZHdkeHpZckVv?=
 =?utf-8?B?QU4zMjA2ZW44eGdRN1IzWnA4VkpoNDJQL0haVnh4TGkvdDAzRmtzV21nNVhz?=
 =?utf-8?B?TStBNnhKbXlKWnExeWdJVVBXNWhGZzRic0JFcXJjemhIVGFMMzh5RXFOU2gx?=
 =?utf-8?B?Mk1ITHNPcXk4SmFTWWpyTTZ4cjFmWkswV3lrU1NyeDZGVXpMamh6VzAzVVAy?=
 =?utf-8?B?UjRQNkhLRm5MenlrMW1FWHZGNEFpai9PbG5tejVscm5jUlE1QjlPNjBuTC9y?=
 =?utf-8?B?VnplOERHb1I2NHlSaGVpUFRJYkJUQlFZVW5qOWgrdFFnVjFyM0R5Y0FwTmYr?=
 =?utf-8?B?NXA3c25YVk0zMmk3bkJWdExmVnpjK29Ya1NrMXA1cm5zMDJqS08xVTZrTGJG?=
 =?utf-8?B?SFYyaXM5S01OdmZpY1VTd0N3SE90OUpMdGZCUDNwRXNMM2lPRmxyNTNaYkNo?=
 =?utf-8?B?NTZrRWs4dTh5TjFJbjU1T0wrUWwwTWRmOWZNL1lUWHpEdmJXbDJWanJFS0M5?=
 =?utf-8?B?Uy9NZ09NbHAyZXBVWEMyc1JtSFduMWdVbmIwcmh1R1lNMFR4UC9zLzZyYnd1?=
 =?utf-8?B?Vkl4UGNMeVBTT0FuU2w0U2ZCL0loMVNCTFcyaUhUV1Y4OXZzT0kyaU1IVjZH?=
 =?utf-8?B?SnJXczFTZm12T2JHV2tkYnZacUlzc21zNndiY2NBSmJlTFgwWHRmNTRYOUNK?=
 =?utf-8?B?OFZaUW9UMktRSDNoMTRMc3JObnYzald0T3p4UHpOcFBmSVg3bFFVQVROOTRy?=
 =?utf-8?B?cjV1MXNZcFJjaUVXVlBySTVtazV5N1ZVYWtCLzllYjRkYUNmQ2tTZGJ0a1cz?=
 =?utf-8?B?UFVteFBwcWVQdHo1Nzl6NC9ud3JadDE4OUUvN3BxU0VzRkUwRVU5SVp3a3Bu?=
 =?utf-8?B?VEJxZEVzREliRW0wOFJGMW95bVFWWnpBVXgveThwZUt4THdYS1dxaUNlYndw?=
 =?utf-8?B?dTVLZGdyNkxzc1RqT1JlTGUzL1NyNjVGZnBORzh0ZXZheXdLV1lkMFhDa1Zv?=
 =?utf-8?B?eFVMWUJVdkNIN0QycFFSOFpTdjcyRnNMbmNwSWk0aDdBd041M01kQlVhOE9x?=
 =?utf-8?B?dlZNVlhXd3VKV3hzbE9COXVYTlF6QWNWTCtNMXQ1RDIyN1hVeFd4SGZtSGRy?=
 =?utf-8?B?NmJTV1dIOG1Wb25RYjNRdWQ1c1hUaHIrUFppVWRFM2xFZ29vd0RVSFpld0Qz?=
 =?utf-8?B?ZXRtQ0Z4aHdFVjUrUUZaNU80d3kxNjM5SDFGZC8rK1k3ZU1ZbWszclNVaGxX?=
 =?utf-8?B?SzNGMlZwREl5SmRxK21PQjRDL0tkZCttQWJVWmRudzFTUDJYcXFFSzBRVFJD?=
 =?utf-8?B?Y09RSjVORUxUSHNyZVJCTTNKaFlLSHNWOC95MTlGcTBuZFlKb1htY3dicGZs?=
 =?utf-8?B?VXBjU2p2QTN5UUo2WXlhcDBCZUQ4N0dQRUVkNFpzbmxSTTNGR3NSV1d6dHZZ?=
 =?utf-8?B?UzVqVUpOd0pJUHlSdmRaRy9BZXhjdktmeUhPdGM3bkExVDJpUlNYeWhHNjdF?=
 =?utf-8?B?VlZHVE1HSFEzdy9FQzc2K3hRVXlKVDhLM2V3VWhBY2taWkJRSDZmNU1pdklv?=
 =?utf-8?B?NFdrVWN1Z3Uvd0p1Nmlmc3E3Ris1SVpkZmdMOGk4VGwzWmhhZ1AybDVQQ25K?=
 =?utf-8?B?R1p2WktId0pUcG1WbkxLNmp1OHV1cU9DNjdUbmdPcHVLQmRTbHNYTEZ0NWVi?=
 =?utf-8?B?cVFyNGdNaC80TFl0SzlZbGs1YTFtdk1oUC8xN1FibkdVajMwWlZlcjAwMVBz?=
 =?utf-8?B?RFBjQjRmTE9meU84UlRobjhqaFNFK1R6MkRDaWNJVlBjbEtCcW1ucm9kN1B0?=
 =?utf-8?Q?2zIdO0Sw1q8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWU4SkhMdEdUWXlGYVFnKy9kMjdXWUhxT1NCNC9uT2Z2UU80M3hYQ2tEM2Np?=
 =?utf-8?B?OUdZWTlyci85TnQzN0FsS1pGcHZ4ZDhFMlhNZGEyR2xjSEFxQVRwTUZJMS93?=
 =?utf-8?B?K3oydTFxYnFjWXIvNFdxM0xCZUdJZHZqWjh0dDZoemFTTGRTbEc3NWluK21D?=
 =?utf-8?B?ZEhWcVVCMmEzV0tUQnNVaDIyTG1vNUFjRmV4UVZDdzg1UVhXcFp5TmF2SkFy?=
 =?utf-8?B?bXc0MmRsZ0c2SjgzMHpTRVk3VlMwTHB2dWg1UzRUNGVUKzdja0ZqWHlOR1R1?=
 =?utf-8?B?dkZTUmtFelRkRFRnYmRVNFlXTWpCQ1VCTmRLUzRxS3ROb3I5ZFFOcXl5dWpN?=
 =?utf-8?B?QkdnajdyL1YvTHdjS0lEVVo1VmVJWXFuc2FLSU9pRVd2Zy9xM1lEV2NNdG03?=
 =?utf-8?B?dWZmL0ZsV0tKZXQrUmVIZ01oS3JXM1VCMGtjSHhpb3BjL2Vydk5uUUhwVDFY?=
 =?utf-8?B?SFV1bkNOazlUYVhlMUJtTThqdVdUN2x2M21qWWorRnJsZ3lwVlVkdndUdFNO?=
 =?utf-8?B?M0FXUmp2OS8ycSs3cXBPTC9HRU1kcHNMY1pLaVphTDNrKzBxRmk4Y0wxMnFn?=
 =?utf-8?B?dGltbTc2UWk5aU1QMjVKOUxnVHJ6LzYxNVRuWkJoTjQ1WTBQZVNsclZMemxR?=
 =?utf-8?B?UDh0ejlPdS80TlQ1TXBlWGdLK0NDcjVqUno3SWx4aW1paUlJZUI5L08vZ2Qr?=
 =?utf-8?B?S1dxZGZNTlJOVWhZWjJ5VUZTcUF5NmV4S2RoSCtoUUU0QmpWNjY3QmFQVGw0?=
 =?utf-8?B?dUdBMVNUenRqWFRJbitMc1JCWW41UTd3Y3czUVREd0wyY3dMeUdQOTdCRTV4?=
 =?utf-8?B?U3c1QjVCNkpRNmVDM3VpWkhoOFR2eThDZVdPYlRXTFBQNk1iMGJUUTlhQkp6?=
 =?utf-8?B?bTdhOTIrZG5neW1oV0FwYXNKQW8xVmNxZEx4c1lrQ29BQXZMSmJxV1VrNFpR?=
 =?utf-8?B?RU1tVnVRcWNUSWk0ZEJKR3AzZE5EcVRYTE43NmRYdHc3WS9LWlFrWTBMaFVU?=
 =?utf-8?B?QVBHMnhCb2JiSXNkV3I5U2RmNng4ZllSbzBvSFhDdGI1TFpUSTdzdGQ1aXpz?=
 =?utf-8?B?eVo5U0tMOTBXQTIxWkNkUnNBUFJzVVJqQ1lmd0liQlJUdEEydTFiT1VweWJs?=
 =?utf-8?B?ejljeEo4RWlFaEE3aTliZm16NlNHMXZVRGl1Rnoya29jOCtTTmQ3RXJSSkk4?=
 =?utf-8?B?U1BwOUJkcjZBWkZjdFVmWFU2MC9YY050QnpsR204Skpza3p0d2VqNVNBRUxh?=
 =?utf-8?B?NmVUZWt4UWEvUnRUQlk0ZDV1WTFJaDJuMGZmZGs5MENzSWxXZnhWS0VFcWtY?=
 =?utf-8?B?c2ZqQnlTc1h4ZC85Z0QzTHZQSU5lNlJMM1hMSU5YbzN1NWZkVk9aMmczVi9F?=
 =?utf-8?B?ZUhpUmZpNUorZi9nbldJUkprZTZ5bmJvYi9QWHBpVHc5UUxhSnpBYW1wZTJH?=
 =?utf-8?B?S3E1bGRENWxJc1ppcGtUejVPUkxoQXlDekROZnVTczlzODYxUlR5RjhlU25s?=
 =?utf-8?B?RWwxcjRyQWdlRlJaRHRmcUZNdXdDY01PcVk5VHdhNE1sYUxjT0s0TWRhdnpB?=
 =?utf-8?B?amZuNEM5dkwrNG9XQ2JiM2pnYVFIdDRrQSs5b2NXK3JwbWphaWVNVmJiOVpM?=
 =?utf-8?B?c2Q4ektoWUhDbkVWQ0l6cGFmVjB1U3llRnl0UDlSWkhIQ1ZDNWxYa0xwaXRJ?=
 =?utf-8?B?dnJVTVZ0RXl2NWhSb1ZFMnRqVHV3dy80V0xHTWhMS2VxcERjNC9jdEtlb29a?=
 =?utf-8?B?cy84WEJLcXdiQm1UMmJYbk5jL0RqbDNDY05uQ01yS1oyeURlelVyU1RqVTVi?=
 =?utf-8?B?Y2xPdEdkVVZvS2ZoWm1Eem83VjNPbmNZNUsvYzFoeUpqNWxmdnJEQktFZlhm?=
 =?utf-8?B?T0ppdFhwTGFMMmlJeGtZc1VqZGZacWVEdHZsY1ZCWG14cXUrMVJQSmVoSkgr?=
 =?utf-8?B?K1ZuMTNSeFZpSCtaaUhYalIvT1VJZFYxS0NWblNKQ0pURllnTE5Hblg2VUhh?=
 =?utf-8?B?dlJlV3k0YnpLaHJDUkZJMGRVcGZVVytoMEdOYXZ4Y05nWlZPbHc4VEhjUWZ3?=
 =?utf-8?B?SVo4UFhYbVFQR0luelNMUEtQUnEvL1VxcFV5WWs2V25rY2JLRjNCamxva2dC?=
 =?utf-8?Q?j7+I=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c214f727-a999-4bbe-29ae-08ddbd53e10f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:43:31.5444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /1fiQLYp8xoeaIqSEqO3XXN0M+/9JpogkL6mRpNwmvp7NxSq6RwTSFWXcAXUwEkt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6847



On 07/07/2025 13:56, Hari Limaye wrote:
> Hi Michal,
> 
>> On Fri, Jul 04, 2025 at 09:54:28AM +0000, Michal Orzel wrote:
>> When CONFIG_PDX_COMPRESSION=n, pdx_init_mask(), pdx_region_mask() and
>> pfn_pdx_hole_setup() are just stubs doing nothing. It does not make
>> sense to keep the two loops iterating over all the memory banks.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  xen/arch/arm/setup.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 93b730ffb5fb..12b76a0a9837 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -255,7 +255,9 @@ void __init init_pdx(void)
>>  {
>>      const struct membanks *mem = bootinfo_get_mem();
>>      paddr_t bank_start, bank_size, bank_end, ram_end = 0;
>> +    int bank;
> 
> Minor/question: Would we potentially prefer to move the declaration of
> the loop counter `bank` variables to each for loop? As the variable is
> not used outside of the loops and is always initialized to 0, this seems
> perhaps better from a variable scope perspective?
Maybe it does but it was too minor for me to be willing to incorporate it in
this patch whose goal was not to reduce the variable scope (I think adding such
change would not fit the purpose of the patch).

> 
>>  
>> +#ifdef CONFIG_PDX_COMPRESSION
>>      /*
>>       * Arm does not have any restrictions on the bits to compress. Pass 0 to
>>       * let the common code further restrict the mask.
>> @@ -264,7 +266,6 @@ void __init init_pdx(void)
>>       * update this function too.
>>       */
>>      uint64_t mask = pdx_init_mask(0x0);
>> -    int bank;
>>  
>>      for ( bank = 0 ; bank < mem->nr_banks; bank++ )
>>      {
>> @@ -284,6 +285,7 @@ void __init init_pdx(void)
>>      }
>>  
>>      pfn_pdx_hole_setup(mask >> PAGE_SHIFT);
>> +#endif
>>  
>>      for ( bank = 0 ; bank < mem->nr_banks; bank++ )
>>      {
> 
> Otherwise, LGTM! Tested (compilation) via both Arm AArch32 and AArch64 builds.
> 
> Many thanks,
> Hari

Thanks.

~Michal


