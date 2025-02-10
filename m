Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EA2A2E984
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:33:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884618.1294366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thR6j-0001HS-TA; Mon, 10 Feb 2025 10:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884618.1294366; Mon, 10 Feb 2025 10:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thR6j-0001E7-Pf; Mon, 10 Feb 2025 10:33:41 +0000
Received: by outflank-mailman (input) for mailman id 884618;
 Mon, 10 Feb 2025 10:33:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbBn=VB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1thR6i-0001E1-G8
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:33:40 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 737dc421-e79a-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 11:33:23 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SN7PR12MB6691.namprd12.prod.outlook.com (2603:10b6:806:271::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Mon, 10 Feb
 2025 10:33:19 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8422.010; Mon, 10 Feb 2025
 10:33:19 +0000
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
X-Inumbo-ID: 737dc421-e79a-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttXuo+YzVH4KqovduNm+rrGI4fKedLv+qwtaliAln0YSNlFp4D/lT5zXGTmK1OlofBqayx7moQkcu6Puo7XtS1IAA4T7uv+MnWwe0fbjFRLiKH9XEbadYp96QRpyFN1xiASFRsg3qzRxikPcw6BzGVXfcHNYtx7kd7bfBfNsiGowz2HO3L7mMsoBsOuOj0GqbjryBTqW+sELn0rvKOL1u+B6JQ++zo+y736MuAOMALRqoZ6U4HxABCNc/oMlRHivDBq5W1pFnWSMqEfbgCcQRt14Rp/rkV03WbF8fPVdPKyqsOhUHP6oc1qYy7YvxGqAdIU2GhiURWsoyiAFsBOFrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBi1x6k90vos6awpLqkjigd7lq6Q996Sj8RvchqyCms=;
 b=OqA6+RpcfYgjCAewM6W+9ZavO52B1220nqiVGSgeouUa/5ZbapJQmFYwoZ6l7yu2iFj8jDEQP9JxusarKzP6AG7vVw3+604z9uE20b7prNRj0UNNrUnIaUsw/A46zTaLRvrlG0ruGMBsKwumsAXMj610WTCYpQHfcXaATOkFH7pXo2ZBEB1xF6PV+lT0VDMsAA/DM4jmVtK3wr2WJDLK7SG/smf9wbF3KP3MvmnOyFxqiYKtQYyuGGeLygFLbvH87TjaMyRhw0W1oOkGXWX7aCZj7vL58V3LNiC7OwfK3PyaHsUQMme0wHucd1Uh7dEj8Myju9uzx2qfYuixDWczqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBi1x6k90vos6awpLqkjigd7lq6Q996Sj8RvchqyCms=;
 b=UaWrEI2OjkFPgTLJmAsbxgJn8QzbbxiRKxYMtK0fS6QwPKfWq5T9YQZravqCgn7oPY/YY5jEAwIaMiK+VtM4ntgiHx+1un08mLSELmPO4eV+Vg+rQmLyapI6kcirqWxuU6aosP0FzH9VfkmYjONBgpf4yrhYBMmFVigVEiP+jmA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8227d9de-6e84-4d3b-ac4b-30e74cb80245@amd.com>
Date: Mon, 10 Feb 2025 11:33:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ARM: Fix register constraints in
 run_in_exception_handler()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250208000256.431883-1-andrew.cooper3@citrix.com>
 <20250208000256.431883-3-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250208000256.431883-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::14) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SN7PR12MB6691:EE_
X-MS-Office365-Filtering-Correlation-Id: a51ac4ef-c417-4834-d26f-08dd49be55fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1lGc0UvVkNiSVo2TkN4NXUrdWxlbUs1WlIyS3JhRFdZdXJiZ1NibXY4d0VI?=
 =?utf-8?B?TlhXcUJOOVZOeFY0NWRraGlaeVdqUnhqazVBdHVxK01qTFZYN0xCWDVUQVNV?=
 =?utf-8?B?Y3ZIRGlQUTd3U2RlVFp1bUpIcXdjZHFEdW5URklDZkFSQVprVFp5bkpZejNq?=
 =?utf-8?B?azR1MldKeG5ZRFRVaXdXcW9QZEdHZ3JzNEtjOGZETW5LZHFGMnFieHBHZmJT?=
 =?utf-8?B?blRTaDNxcHhRM1dJUjlqcWJ2YVAxNmpUdkk3NHBJUzZJRVBZYVpUVWMrUDk0?=
 =?utf-8?B?Y0VKYXY2ZkJvLy9kbUlLTzNjSStleGJqdTFVa0lTRzRKaVV3TTN0ajNLays3?=
 =?utf-8?B?OUk0emovSjdKVWV0Mk43bjJvanZZYVFrTG5Pdi9pQXdKd09VME1DRGJTRVlv?=
 =?utf-8?B?M2JPRGJTdnZpWXdhTGcyMGgwQTV6VkdrZlkrSG5iK1NFdi9mbk15YlBVdzRw?=
 =?utf-8?B?WmJTdUg3SUdBOXl6cjlvcEx6SVFJbUt2K2tRZkNEUElNMUVVMHM0dkxVaml6?=
 =?utf-8?B?NGc2VlZLYWdXTGI3ajR1dVN6N3NlVk4xcWJTYUtVZW5XZmJzazdvU3pHU1VP?=
 =?utf-8?B?QmxENllIWklLdk9BRVV6dC81ZVdNbTdVODhNaUw3by9nRWphdFhpSHRaRUNi?=
 =?utf-8?B?QmFzMkEyU3ZsWTJqQmtVTEtOS0lzbU54ejhaOE40OEw3V0ZwaGc2U1hmTkNv?=
 =?utf-8?B?NHNDaENzT0JLbFF2RzFWQlhSWnRtVEg2RmVsRUNjQlN3aDJlSXhoMSszK0k4?=
 =?utf-8?B?WDNPNm52aDZUZ3pGdWFvVXhhQkdteERqN2JMODBJY01FbFo4eVo3bkJoU3Fq?=
 =?utf-8?B?UnF5YXZONGljSy96ZDdoOXh2Ukwvc0pLSVBuVmt3V0c2ZDFIVXlFY284WEtS?=
 =?utf-8?B?TFZSd1BWNHJ0RXNrVWZSanREODRFTkV6SmNQNTh4N28zT0lNekZIRHNGOHlD?=
 =?utf-8?B?SDIzYWI5N2RRbExoL2cwTklhWGlIOTZkMi9SWGw2cFVoNkk4emI0alpPQ0cz?=
 =?utf-8?B?bVBQVzdKTDBMMEViUmFuSUg4MVRpLzNKQTFiNjI2ZkplL3FMRHBjZ2VuMnRi?=
 =?utf-8?B?RFR2dk5XUUNtZmxsakEwSHhFN1dXQUE5SlA3UlB1N2xOTndrVUlORm1CYjRG?=
 =?utf-8?B?Y0QyaTdMTXljejVaQ2swRzJsREpFaC9penlpYURVYXoveHRsbmpweGRkdUxP?=
 =?utf-8?B?Y0pRcUIyUUFRU2Y5M2JaMEdERjJtUlNpQytXUEZqcWozYmZqSHhMY2dzSFRC?=
 =?utf-8?B?V0RtMzgvMG9qb2RrOUFZQXB1SFdHZUViVG9KazN6eUVkbENjcDBGSDJDcFBP?=
 =?utf-8?B?Ti9QWWFGUW5Mcjc0R1dPQ3dhaFpNRTNZNzhtbVN2T1g1eUlHRTNoKytIWFFr?=
 =?utf-8?B?RllhWkhlRDVLTVdiNWFHaDY4QXlBbmplN250Rzc1YXcyc0dCOXRsdDJ3Qy9R?=
 =?utf-8?B?OUVwVGQ1YUxIYjVLQ3FPOVFVeHBtajR1dW8yL0MwVG83d014MHozeC9mckhm?=
 =?utf-8?B?ZCtacjgyRXh0WkFFU1hKTjZYQkplR1lQcDg3MXhnU0VIVzVpMUROamxJTlI4?=
 =?utf-8?B?RVE4allUcGxTU2V1QXFRNVJneE9WaDlNa3F0b241azk1ZXo2SVBJeUVrOFpl?=
 =?utf-8?B?eERJZEQ4MW5UYWtLL1RuSFd4bFgyd1VvWDQxbmVNVTJRajJJbXdrN2FmRkRD?=
 =?utf-8?B?YTQ3QklQVGdUdmtjWVdXM2FRQjdrTWVYL2lBd2ZvcXo5ZFZwN1BTOFVjdHdo?=
 =?utf-8?B?OTM0dCsycWdKYmMweUJmeTZYSmczeGo5RlRzYlI5Z2Nia0FnNE15eDhRdXVv?=
 =?utf-8?B?L205SWJTY1ppeWlTeFVGTXhYOTVWWmpkZ2dwRHI4QXY3OXdrUy9PcExJVHl5?=
 =?utf-8?Q?sHAIpZBUlne1X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXBmNVVPYTJpOHJWeGFaSHFhKzNMNTdwcitkVEdOWHFQd2FMVi9YQno3bU11?=
 =?utf-8?B?RUtCeERrK1p6dmZyMWd5ZGtIc0kvZG42VVJaWWN5emV3OE4zRTR0SVlGTFFi?=
 =?utf-8?B?RGJwTG40a1kvVVlIM1V6UzlJaU96UHZQVGk2RFc0RmhvNllUcm45TjAwektn?=
 =?utf-8?B?eExWaEJ4MWt5MmNEOVFBUjA3NkUzNFZGNDZZblRoK2l2cUIvN2tJYnJwUDZj?=
 =?utf-8?B?WFlwTm05WjNodDV0RUdwRmlrYmdRdEtQSUhCemZnVU05SkpTSGdjRVJ0ZXlN?=
 =?utf-8?B?cXRzWGVRTnhSalUwYnZsVVhnWUJwWkI4aDBqYmMyaS9LN29EUTBZemhic1RR?=
 =?utf-8?B?R0VIR0VyQ21lY1VWbi9ZaHNmVjZza0o2ZUI4K1QxWUlwbThRUzNnTFI2T3di?=
 =?utf-8?B?NmR5aFYxcGkxRU93dVg0b2Q0Rko5cUsySXZhanZJSVpIYWhVZTRPWnJ5M3p4?=
 =?utf-8?B?dDYzZTdwWjBENXJaWUluNXlEWTF5a3RjVGtwS1pmYWkySVlPZVZNR0NiSUdy?=
 =?utf-8?B?MENGRWZxV08zdTlvMVlDbklpVzJsU2k4RGhvdXdzVGtCRnZqbTNndXFJQ0NJ?=
 =?utf-8?B?VkU2Z1RudjNpcnVYbmxyeFdRRVp2QmpRRG1Xdkcrb1VsSnVsRUQ0UTRkMnV1?=
 =?utf-8?B?d2ZxUDhIdXlieW9wbFhtQWNDcHFpMG1RZjVNRi9qTElSbld1cjI0dmZWSm5R?=
 =?utf-8?B?MjJGdVplUWN3TnBwRkxZcEJMYW9IOEhWc2g0aWRwLzN3Q2dQbTBGWndoUEh4?=
 =?utf-8?B?ZnNCYURhUWphSFVvNEZVaE95NUFtT2hRYkIwaHpGam1MaCtSM0VwT09QQTho?=
 =?utf-8?B?WHVWWmJnRDhSYmlEQ2wzaDE5MWJxRnNHN20zUkpRMExkM09qbHRpcDRJSHVL?=
 =?utf-8?B?dk44UmdCOXJmZ2JIb3hDb0VPMjNBbnU3VGJOOUxzY1RDbmRlTWtZb3lxVUVX?=
 =?utf-8?B?Z08vYktva1pqR1o5OGJtRmJYQzREOU4yck1ZTlNqMHdLTVU0OXY4S2xTNzBV?=
 =?utf-8?B?TlA1Sit1ZFdnNHN0RnhNNWVSSG1HK1RicVB1ZWFQUURTMEVJbEprNUtNNnE5?=
 =?utf-8?B?WEsrekdJSmZhL1dickhFY1J4TWNqNzVIMVNLU0VMVW5XQXBQQlVWR0Njd1BH?=
 =?utf-8?B?cjJ6REV3WVJETnpaaWpPTzV3RmVhSEpVWFVwdElEdmdPY095c21OdXhZalJY?=
 =?utf-8?B?bm1lcFZoSWxNY09GTHBxZlFRQ2hyZ3hyNHFneFJqTlRtYnhiZ01aa0hXU2ZF?=
 =?utf-8?B?S1B2M28yOTlreGgvOXJKYzFyM01CYmo2WHpDQ2pmb0MvOGw5YkowaG5mNmxS?=
 =?utf-8?B?OXYyRURxYzE2V2VRamh5V2MxSG9vcWhXako5dFd3VzhnbVl2TmVDWmNHY21H?=
 =?utf-8?B?MHE1Q0lPczJNMElaU1hjNGxPN2VuTDdqUjdFcFhHd2ptd3E0eUFwUkJLMGpx?=
 =?utf-8?B?WWVVQzVRMEp6VXlaMTlRUUp5K1pPSVhoS3pRSUxsYjFUcVlyT285WXJYMndF?=
 =?utf-8?B?SEpxeHErZkFWM2szQnVMeTRVTjFRN3diZGZxbHcvVEluN1UrY2pSVjBNTkF6?=
 =?utf-8?B?NXN1bktRWTVRWVo2S0J4YVJaSXFiTWpDcFJuK0piUGxIdEJvMEhDMWZsK3FF?=
 =?utf-8?B?bWRtQnZXbEJ3TnNkTUJFVXFtZ1E5TmVtbXF6MFVKSkkvMGkwSUEvUTc3VmdQ?=
 =?utf-8?B?NTRzTjlXaDAva0tJektYOHpOOUUzWFdjQnFML0NsUDZUdUNySTF2RFljR2RK?=
 =?utf-8?B?NVdRWTdhYXEwOGpjc0NoMHVXZUI4NVA2MzJJS3BRRE85cUZaTnVPdHN6YzhH?=
 =?utf-8?B?MXJCY1FnZW9nNS9FVStkMzUvZnFmTWJPMkZHbXFxbzVwOGc1R3FseTJGRFBF?=
 =?utf-8?B?RVRHNkRraUV3ZkdyamF5b2MvNmxxcU1tbFI2ZXlkOU15WXMxWUJRcjlvaDBX?=
 =?utf-8?B?VGg1Ym5zM0ZZQUNuMkNtQkx0T1BFM25CUExGRzRBQVI5SWFsbzMyYmFPQ1pt?=
 =?utf-8?B?cGdDRHRodnpqRzlEbHRBWFZtK01ZZXBualNqcGpoK0VpUVd0Y1c3Z28yN3lN?=
 =?utf-8?B?dEF4dWM5ZThDREtDME8zSTlhNHlGU0o3Sld6NThlVzI2bGdzUHZtSjVJWlB3?=
 =?utf-8?Q?4x/0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a51ac4ef-c417-4834-d26f-08dd49be55fd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 10:33:19.3539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ts8zE8BkXkxsgC5Zssx0QsbEVGkuoKuWTTj1I5F8GKL/sJp8gyDujumWdl7QFM/Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6691



On 08/02/2025 01:02, Andrew Cooper wrote:
> 
> 
> Right now, run_in_exception_handler() takes an input in an arbitrary register,
> and clobbers BUG_FN_REG.  This causes the compiler to calculate fn in the
> wrong regsiter.
> 
> Instead, use `register asm()` which is the normal way of tying register
> constraints to exact registers.
> 
> Bloat-o-meter reports:
> 
>   ARM64:
>     Function                                     old     new   delta
>     dump_registers                               356     348      -8
> 
>   ARM32:
>     ns16550_poll                                  52      48      -4
>     dump_registers                               432     428      -4
> 
> The other instruction dropped in ARM64's dump_registers() is an alignment nop.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


