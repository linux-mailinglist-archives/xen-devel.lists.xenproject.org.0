Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D48AC06B7
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 10:12:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993164.1376614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI12c-0005MW-F4; Thu, 22 May 2025 08:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993164.1376614; Thu, 22 May 2025 08:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI12c-0005Iy-Bf; Thu, 22 May 2025 08:12:38 +0000
Received: by outflank-mailman (input) for mailman id 993164;
 Thu, 22 May 2025 08:12:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ayyk=YG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uI12b-0005Io-AM
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 08:12:37 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20627.outbound.protection.outlook.com
 [2a01:111:f403:2414::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8427a83e-36e4-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 10:12:35 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by MN0PR12MB6295.namprd12.prod.outlook.com (2603:10b6:208:3c0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 08:12:31 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 08:12:31 +0000
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
X-Inumbo-ID: 8427a83e-36e4-11f0-a2fb-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7A2K7ssKzJvLe/tJfjs5qUvcb/FS3DfRJXPnNLbJyvuwqK3H4ahEo/yOJpx+y5oqw0vaXLNoRSlJxQL8ee00wNYSDcZZG0x7HM4ElGkuVS+dj6w6Cf4upkuEtmU+WUbzj/h0/7cjZKpvGXXdwmirZL21ZQsXyPouQZchVL3HpT7eeyTqlV8pzacaOt/iyk6WPryFDB6cNHE7RdZ1I+UFWqleLtVLGTZ69SGS1TuSzEBfYkrjmxMkQk0hB8eg7KE6aS17vEzVyVuAIM/VdMZA5gZvTedLfcRuRrK39Mxw3G001gPeaiU4JfAKkAOHCZOCb97FxlENkLkwlSA8MB19Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5BnwMZWJ5rCtGRJQphXq/CaIfE5mry3HMFkIt1E0K0=;
 b=itnU7YYn2A2QiPTl17H01+0IBBVTkEkf9o3GQY9HNouVpCh6E6NtcKpafZ5jL/AH+DBavs07HpW8kiGfsD0xN4Z50jLoCCmWUaiOBILmIjPcNg/TcJbHHc6/chh5VAARHhi3J8bOGmtk2byZGAXFnVJiczWQpVUXKM1E+rG8tiECtjfmbtiD7SWlT8HGmUPg6o0/gU8/qGjiO02qoYEdvgbHX9OoB+9LF6kaUl5/sF0U+8wSf/oYBcYe4mkqvDzonYVgrX85rkMb9S3v5lt95jU5CVrrfU3kqVf7ZEwUzM/dpn5TEXtWJn4j1Cl70GYiVYImxrZzSeUoSDcBP+FZyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5BnwMZWJ5rCtGRJQphXq/CaIfE5mry3HMFkIt1E0K0=;
 b=xOzWKTIKkcVE956ABYU+FX8Jj9qBMAcXK1/YnCRICHJ3i+nB5syzy+AFczjknnjmeCC3XVgFBS6vbl6JV4O/rZ/lLfZnot/xiOD1VlUavW6yZ3GLVBxaA54OdJN9OPtjHh+qqrFXpDTvoy2XO47PmRpvEskA23wlTs6PriFGCRM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d712300c-7c70-4459-bbf3-9c3447753ada@amd.com>
Date: Thu, 22 May 2025 10:12:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] arm/mpu: Introduce MPU memory region map structure
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20250513084532.4059388-1-luca.fancellu@arm.com>
 <20250513084532.4059388-3-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250513084532.4059388-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::13) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|MN0PR12MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b199551-e119-4f44-41ac-08dd9908661c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akRSZEpXWGl3aHR0NnJwZWs1OGJlajROYXJZYUhNRFBCakk1VXF1MVlEWUwv?=
 =?utf-8?B?SXZxZW9aRU1nWHphVWpRZ2dtMENDbFlUdW5MOEw4bHJxN0pETXBkSHorTGto?=
 =?utf-8?B?THRFajRVelJPV1dCSlo4Vis1VEovQ2hjNHlVemsyaWVWWUVRb2V1M1o3VXd2?=
 =?utf-8?B?QTJyK0xJZ0hiMWhQZ3AxcUt3aWVCb25ocnhaS1BGdWVmT212dTIzeFpYWi84?=
 =?utf-8?B?VG1wWkpFTDE4MFg3VW56RTdnckNmQm5jNFpHbFBvQlFyNXd3cXUxbG5YeExD?=
 =?utf-8?B?dHhndHpJK3VQaFhNK3VsS2NtVk8vM2hxd2cra0NkUGVxMmlDbVlXS1U2MWMr?=
 =?utf-8?B?OWlnWXR5ME1yWWJFZmZjUlNhZ1BhS3BvS216TU51bVI5T2ordTFGQkM0WkxW?=
 =?utf-8?B?YXJSTHg1NlJOWWp6b3ZiMGZ4OUFWakdINjZwRlNuc295MXNVdDdSMms4bk5Z?=
 =?utf-8?B?eTFETFpIMThrTU43T20vaStINzk1cm55aGk3NS9sRW1SS3laZmhrZ1NqeVNU?=
 =?utf-8?B?dGU3MVBZYUxJQ095YURlT0I0Y2lySTBvWTZOZ3J5Z2ZwK0ZlREFoUS9mN29P?=
 =?utf-8?B?a1doQkxrRWY2OVhyTlQxYWlsTEFxNTdGMkprb2JNcm1xVHdCOG16b09pNmhk?=
 =?utf-8?B?V0ora2N5RlRDMitUWXJOU2RUVGhRMFdQQXY2dW9maVhqaW5CZEwyMGdYVWdX?=
 =?utf-8?B?dlh2aEQ5UTZ2UmdRb3l3TTBGMnEwLzUvOTMvQnNoWjNFWDRGL0hXelRuK2dp?=
 =?utf-8?B?YVBOSkdpTEF4ZmFIZGxBdmxHYWJETnRLV3BNYWRncEZBWmZvUGJ1b0lwZDR3?=
 =?utf-8?B?WWJDczJaNnpEclYxMG9ZOFN0aSs2cTZEVmNRYnVmRk1GSGxaZDAwdllZSGxa?=
 =?utf-8?B?Q252QWh1dWFUZU5vL2lsdG1WTlN0ZGRDR0NnbVYyWTc4VU1sN2RDN0hJRVJh?=
 =?utf-8?B?WGk2Q1NxVFk1RFhqQi9sU2drdWRIZzQxd0tTdTVtWDhTbldvdUdoL05xTTQ4?=
 =?utf-8?B?NGtMaVAybHVXbGRDR1V6dFlOcW5jK3NlMWpNbzVzRTdPWEJkVy9wNnJxRmlY?=
 =?utf-8?B?MXlzV0pCM3V6SXlHaGU3VG9rNW03bE5SdlkyWVJYMytsNHJjaFhFd2ZNRWhp?=
 =?utf-8?B?QzMyc2dBaGVpTFR3SWMwQk9SYnVyVEhyajJFamhuWVdYYjZ3Rk5DOUkvNzVH?=
 =?utf-8?B?Um14ZkhPU3g2V2pNY0ZGcjVZOTVFeGxRVlJ3MG4xN29sVGxqQW0zVWtmVmQ2?=
 =?utf-8?B?ZnlaNno2dUJjdjRmQkFBd0U5RXNYaHhOQkR1VElJT05icGZMV3pRbkNmQjJj?=
 =?utf-8?B?bWo2UkhlSVpaeXBqbVdSTHdpQTE2aUNPTVV4VGM3dFhBQUMrNERQSGxxNm42?=
 =?utf-8?B?dDVncGM4K29BbjRId2pxUHZib1hTcEVUUkMyYkNidWFEQU85YmVYNEVnZVJR?=
 =?utf-8?B?ZGhKQlZPUlFrcmw2MEZaNTRwTFYvQjF6eXo4ZVVoNlhzZ3VXSi8xU0hhWlpn?=
 =?utf-8?B?NjExa3RmaHpwSWsrQTlmWmlHTHQ4dWV2aENrMGUvbndIcW1Hc2tBNDdQbVBL?=
 =?utf-8?B?SFUwZjh1aWFVT2wvQVNCc2xhR05hb1JsUHdnTWxMOW5HbDVkcDkwbVMwRGJU?=
 =?utf-8?B?ZjY2aDYya1ozSFFNZjIrNFB5NVZGbWJMRUI3cExtRFpyempOQ0gxRER3MHp1?=
 =?utf-8?B?Zi9XSlU2ampBM1IzT1FVSlRHeHR3UVdYTTNHZXJ5SzRndW42aGMwMzg5NHFr?=
 =?utf-8?B?d0RQNlAzRUY3K3gwUUx6S3NHSzV5OXYwdTFkN0o4Z2IvdDlXc3l4UFVQT3dt?=
 =?utf-8?B?Q2FuMHFXTWJYMlJkMmE5ZTNDQm5ocGdYRzQ0eTVLaUN1dExKY0tPRHBCcCsr?=
 =?utf-8?B?emtoNHlDeFBqelArV0h3TWxhM3NXVDM1bmFzRlpEcXRXalJkSk1WYmxWbjlZ?=
 =?utf-8?Q?+j9SSdNKavQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVQ5Wkl2UVpZNXI5STFMZkxYODNROTZwOXNsWU9LQStkdFRVTkdQdkRobHNX?=
 =?utf-8?B?MXNpWjZ3Y0RkSGZ6ZHdNenR3b09nQmxLcmEwSkh5TkdJYzh4ZUJydzR5ZkhW?=
 =?utf-8?B?Rjc5NnRsajhOWUJBak9rL1dPcE5UY201Nm52ZTVRa2N1NUhXaUxpT1lMaW9X?=
 =?utf-8?B?ck9sMFIrcjdFdHJ4M3JKaXh1cWxxNWxYZm1XRmt1RlEwTXdGYTlOaFgxT1VZ?=
 =?utf-8?B?ODkzZjVyNTh0UDQyOGljY1pJbW5pbDdrcU5hUG5pZzJqOVM4YmJKd0Q4TmJG?=
 =?utf-8?B?MWJ1dXdaUDQ5ZC82RTAyQ1Z3aGd0QXFZZTQ1M0NKNzE1d1FzQWlFTmdyUHlm?=
 =?utf-8?B?cEF1SVk1ZGtudmhFcUpLdVlwT0hpSno1NlhwU3dzbVRtaXE4cDRLSWNCaFpa?=
 =?utf-8?B?TURYMDdLaHhlYzhqSnFBQjgrNGsxeklzMDVJYlVTMEZNMWdDMUZaWVQ1cVMw?=
 =?utf-8?B?UEx5T1NjL1EvQzVrODJtY3dITWtIdkRxUytqbzY0WkpNbjJmcGkwOGRpM2d1?=
 =?utf-8?B?Z3ErZ2w1bFYrS3BqejNPa0ZUbmd1ZnZmVWNBYnVXWDdVM0ZVUC94UXkvVzlQ?=
 =?utf-8?B?YkFLblA4TkwvN05TZ3o0dFpkRUxLWEpxeHNTN2E5Y08xZTh0aFlmN01MQW94?=
 =?utf-8?B?MnZwSjAybE1sbDRTLzBMeS95UnFZeUJLeWd2RjJ1U0ZIRFRRcUw5dHRTWk1k?=
 =?utf-8?B?bXpwMFRhaEpjbmZaOTR3ZnZlWnlzMWwwWDZXdlZSczVVb3hZOWVsNWx1TUpC?=
 =?utf-8?B?OVYzeWZjaExpeWNDMExoVXF5MmplMG93NzVCNGxvS250VEVvdEp3RUdUMkVC?=
 =?utf-8?B?SUlJVUc3QWk1NjlSYTV6MjZ2ejErUjRXR1Vua2tlUFg2aDJkdHZjWkNud1Y1?=
 =?utf-8?B?eEFCL2xoMUdaOW8wSWU1TG53ajE1bys2NnR4WFo3bEs2TmRIbHRmN0VjZnY2?=
 =?utf-8?B?cDFlcWxaK1poWm5VL0Yya0k4THNVSkJQYUQwWnJldG5MaWgzWk1HWUI2WWph?=
 =?utf-8?B?ajR5alRzdmtXekdQTUo0bU9aRTZpT3BsWUQ1VllQNFozekRhckNsZ3c4NG4w?=
 =?utf-8?B?VnZHdmQyQ1ZLSDZCOGxUNWlMTjgzVy9Vc1dSb0M3U1Vqakh6NHBFYWtLUk95?=
 =?utf-8?B?TmhzOEExeVJXSWhzcjdUL3VjQUJtN1RmZzhTdjU3MTNuS1FIMVo4dmtyT2t2?=
 =?utf-8?B?aU0waDdpWW16cGFEY2g1Wnl0WnFpN2JCeWN1MGQxS3g2NUVWNjU5TDVjditV?=
 =?utf-8?B?b3ZCZnRmUm5xTzBYL2dPNllJeWVPOVdKQ1U1ZGkvL3d2SjNhRDVWTWJoUm1K?=
 =?utf-8?B?UEpCcSt5MjVQQ0lsczk2YzZPM2JGSVZYbmRpZzFOYTZkU1FON3U2UFpjek1U?=
 =?utf-8?B?cUhIMkhhNnAzZ2RJWjJCOWxGaWY0VU5abTc4ZEhsL2t6TlpRV1BMWThrRlVu?=
 =?utf-8?B?NzA0YkVWOE5BT0NQNERoUEV1YWlVc2JRWVo2ZXBCeHpQVm5ZbmFKVkpUYm03?=
 =?utf-8?B?L1g5T2J4NlBTT3JjSnFST05MVjFScTFEUitKdStBZzhJU2NCQ1FoRysxdC83?=
 =?utf-8?B?c0Qvdzdpbm1KU1NKa0cwYlhQaVBHdlNmQU81YWhjM1dQclcvcmpPaGZMcmcw?=
 =?utf-8?B?MHNvQjN6NDhmQzUzdlh0eG92RkhobVQrMlE5blFsM3lTdTRSTUUwZ2FIL3RQ?=
 =?utf-8?B?aXBxZDg0QVB0bk5nVE1WcjNoWkd0VzF3SVFKS0xKSWU4WEJuMmhxdDZzU1Jz?=
 =?utf-8?B?TTAvWjdGekRNZ0NONW5NSUs4TFhYQS92M1pJVlZKRmdKZElSRUs0azgvY3VH?=
 =?utf-8?B?OW9oQ0ZiRFBQYWc0bjhBZnUyb1RTdVNnRzlTdjZFdmI0WTlsanFNQ2tPWjlk?=
 =?utf-8?B?U2ZCaFgxbmVUMlFMREF5OTZhOWQycnExSW5rVGUzYzA1bExjaEJ5NXo1YXlN?=
 =?utf-8?B?RmQ5WmRONU9LZHhGVGl4MXMzUEd2KzBLc0U3amROVHdOMnUxY3gzTFl5SGNy?=
 =?utf-8?B?QlFyWnBWU3A1cGdUTVNZMzZRdlNNUjl6RWhkcU8xcTZDVVM4NmdkdS9ic1Ji?=
 =?utf-8?B?NHRhWTdhNU1BazdoK0xBbzhDT29meUZZTXZESitvL1FBU1hKQVB3cmZBdlJ0?=
 =?utf-8?Q?/LoDvGcc4HWyR9IAHRLwUf870?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b199551-e119-4f44-41ac-08dd9908661c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 08:12:31.3745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVJi/tGNSmKbMvlPV/HAKauiZSWLhhaAToyYN4pEa/cvajJJB3a1f30J3c6ne6CB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6295



On 13/05/2025 10:45, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> Introduce pr_t typedef which is a structure having the prbar
> and prlar members, each being structured as the registers of
> the AArch64 Armv8-R architecture.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes in v5:
>  - Given some comments on the page.h flags, I had to rework some
>    fields here to better match the flags usage and avoid duplication
> Changes in v4:
>  - Fixed typos, changed name for reserved bitfields, add emacs bits
>    to arm64/mpu.h.
>    Now base and limit are 42 bits as we consider FEAT_LPA disabled,
>    since we support max 1TB of memory.
>    Moved data structure in commit that uses it
> ---
>  xen/arch/arm/include/asm/arm64/mpu.h | 52 ++++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/mpu.h       |  4 +++
>  2 files changed, 56 insertions(+)
>  create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h
> 
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> new file mode 100644
> index 000000000000..d3c055a2e53b
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ARM_ARM64_MPU_H__
> +#define __ARM_ARM64_MPU_H__
Given that Andrew's CODING_STYLE update \wrt headers went it, I think we should
adhere to it in new files. Other than that:

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


