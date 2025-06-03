Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 787A4ACCB06
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 18:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004665.1384381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMUEm-0007Py-4s; Tue, 03 Jun 2025 16:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004665.1384381; Tue, 03 Jun 2025 16:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMUEm-0007OX-1l; Tue, 03 Jun 2025 16:11:40 +0000
Received: by outflank-mailman (input) for mailman id 1004665;
 Tue, 03 Jun 2025 16:11:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=idzp=YS=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uMUEk-0007OR-DT
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 16:11:38 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [2a01:111:f403:2412::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b14c43a-4095-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 18:11:35 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by PH7PR12MB6836.namprd12.prod.outlook.com (2603:10b6:510:1b6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 3 Jun
 2025 16:11:30 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8769.031; Tue, 3 Jun 2025
 16:11:30 +0000
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
X-Inumbo-ID: 6b14c43a-4095-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/EDlJB8P0ShBNtR6yt+ec6W5K4ymOQDfl1t3ROr0t0b2QNG+RUk+AswlRWRSwih8uXMCrdLh8zoP5Qw1Lvjt2wHfJhE0gpmfQqZfgztzu73QnMATeAUxX31Dp07VKlFljKO4PuVDLNzFj384/OnROfb2D6qbkxCYh6WYEHyJCTMD0Aexnyd4jINTrenAtFl3MOm9gEUYbKXNZ9NY8VQHgWbxetbKQEG5h4BkVy7Gpx2jzSkLHmi7RO+MRWddH6x/SlXAMx4j1dHaIbCTE0beQHYPC5oQEOD6PI7/gk5GcRXEWuk9G6IqnL1AHieOYjKSjVNRauLUA1WJgbq7x3BHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjxxjXuEmRkNz6IqfMUzFoKrRWLUe7OdTNH04naV+70=;
 b=ZfTg9LRWp5jV2crwlP+LG3ZAQ35smmstEOuH1+KfylZvYQ84/tLMIV91noF1SQxR/xxBKyL5xwl0yj1OSpw09sVesEFhkzXpcoURUbToKRsIBIJyyLvVFnnwG7FcOvTCvuAM/as7Kgvw6wulm4m0b41i2Fk+/8DdwuT1uxavTRfeiQw7EJi+d1kEJgJLdZ2Y4CwlZeaMSZNQg4fQI695AbCeq15ehatFXCjd46t4d63Kc72cwXJcJOSaqEy57o+X3frUp3tFdSoJkBT3geD354oRt8jNw08O8YO3phgt81ms16DmKYpeDPGjEV3PUeVP2g0DS8RJ+VTXMbgRs6pBng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjxxjXuEmRkNz6IqfMUzFoKrRWLUe7OdTNH04naV+70=;
 b=rFvtzUik8TnS/5BC2cp5icC3bikyw09jBkLTNqtfPqGaF7MGBkMM1MVaynHcK50BJrHLpBEbNO9mafHs+P/bPiLKi0p6zroKkQod2dd0srnkWutw6DhgyaBA8bINAu7+6xjxQbf5uL1CKxTlrd6UDjiK0w5124ml8LSIDfsUDLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d99b0d90-d792-438d-911d-bcabbf9444c2@amd.com>
Date: Tue, 3 Jun 2025 17:11:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] docs: fusa: Add the requirements for few commands
 of XEN_VERSION
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>
References: <20250509112447.2931909-1-ayan.kumar.halder@amd.com>
 <20250509112447.2931909-2-ayan.kumar.halder@amd.com>
 <F4CC8423-AC3F-4F7D-AC99-047D4F8C7BF3@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <F4CC8423-AC3F-4F7D-AC99-047D4F8C7BF3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF00006634.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3d6) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|PH7PR12MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: dccdee45-11dc-4584-99eb-08dda2b94cf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGJJWTBWU0VqdTRHZ3ljRkdja2IyRSsyRUxxRkxvT1VIMkNLN0VqeXdMcVR5?=
 =?utf-8?B?R2hMTjI0NzBMUlhXTW8zd0doMGhLMWFkS3VNaktrMElNa21GejVaVm9jNVFk?=
 =?utf-8?B?cmJBMnBKekFyS0ZpcnRmVlNjbzFXT0xlT3ByQzVwNmRvTmRXaU4xOCt1NXR4?=
 =?utf-8?B?d2taSzJvMzZiWVpVdFN5U0Q5UVR5b1JubFhQbnpMb215Y2xRK0IrRHU4dEJG?=
 =?utf-8?B?UjFYdXJ3MUZwRGU0YUdIRXY3YUhaNVJ1ZitlVmcxRXFWWXpWM1pqTlVaNVdw?=
 =?utf-8?B?MGIrajc5QUJLYWNPNndDL2phRHg1SzhDSk53cEFVYjRjSEd4MC9yR2g4VldI?=
 =?utf-8?B?bCtHRXR6azIxQmU4aFBYQVd0czBYa245NGd3VFZNaWJyZC9RenduOGVNVFNE?=
 =?utf-8?B?WFNwMnR5cW5paVRyb2NpTEVUekdZaHZJUjlINS96SlNxcmVxUGpmZVZoTHFT?=
 =?utf-8?B?QkdTRklxRGNvRWJVeCtYeW0rUk15bEZnd3JublZQajlQb0pINTYvSGtQQ2w3?=
 =?utf-8?B?NiswVGYzdzg1eXo3ckplWC9WNzhUZHR6ZFYzV2xZREthN0RxT0JldEw2VlRO?=
 =?utf-8?B?MWNRYVhXMHRzcXZDQXpOOE1OQVFhMmp0VWp2bzA4N2tmdUt2OGdkdzA2UVlY?=
 =?utf-8?B?ZTYzWmxQeDZnMkoxNXM2V0pQdFlVeGw4czlXbnd2azY1ZEc2K1ptU1FUaThI?=
 =?utf-8?B?QnZJdldva3J0U2FScWMzQlZWWWxjZUwwc2F3M2U4TE9IVE9jWm12WDFCUmhr?=
 =?utf-8?B?NnMyZmJSVzNMdGpCV0dvZkI5Sk9RSUFjbkRJTldVS09YaEZpSDUxMzl4anlS?=
 =?utf-8?B?aXl1SGwxNlZ0UkVXNmJPeWhRWUMvdWVWRERmWnZGWW4yQVFKSzFHZFNHeFhH?=
 =?utf-8?B?R2htOEhSd0NBUGtWVnYzVEVZSURITjF1NzZ3Z2EwdGphdFhKbGhSemxRT2Nq?=
 =?utf-8?B?Y3R2V3gwbWt3Lzg0N1pMWGU0VWpUSDN4S3ZsWTVyNTFJbFlLUnU5amlySkRr?=
 =?utf-8?B?ang1c0VDRVpEb05lcUFrNThvSGVNU1lUQ3RTTCsvTHFTSGtaWUNaWmQycW8z?=
 =?utf-8?B?b1d2ZUZQN3RIZzlVTFhRbk5NZDBaMUNzUG9vMWR1M1ZLKzF6eFZQaFZ0L0lL?=
 =?utf-8?B?cERhRDRIUCtQcDl6dzlWMFNkNXFHL2lyQk44Smx4YVdzUGFyN1VlQStvRDNI?=
 =?utf-8?B?R0VsNWVNOFBETzBuYjQ0eTNSeTlsMXZHTEdja21xdStHbVVKaEo1dU90UlVt?=
 =?utf-8?B?enF1VnFwNDQ1OEFPTHBwWG4xL21La093K1F2ZzRXYjdUVGdPbi9xU0FwQ2xR?=
 =?utf-8?B?NW1uckd0UW1PeCtGb0VDQVBMbkFCbDNNM1ZpdjdwSTZaamsyZThYZUFKcEF2?=
 =?utf-8?B?ckRhNURtZGdOc1FRV3RkbExqamNERnZxMU5LZDA0OUZ0UFIwaUN4M0k3aE90?=
 =?utf-8?B?azFiZ0VocGRJOGZNQVYzSE1RcFBDaXNlZzdyRFJnUkVDQ3JvQU4ya05SN2Fx?=
 =?utf-8?B?WEx0bWt4ZkFXWklXM1hzWFdnRTh2MWM5WVZpNGJKSlZKMFdvbXphSHFxSzVq?=
 =?utf-8?B?OXFma3U3S2NsRGtJSjYyV1ZFSHUyTmd2YVZGNWFlME1hYXF2czZPMjRSdG83?=
 =?utf-8?B?K3FYOGgwVGttcmVIRlNVbDVINUQ3WVNYbmlKejA5VzBiamZnWi8vV25Fa1RR?=
 =?utf-8?B?c05UR2IxZHZNUHlZWEpVZlhKSmJXQ0kwYnovWTU0REY1aDYvT2hqSjhlYXZM?=
 =?utf-8?B?ZEVDUXc1RS9LSEhXVlhxOExKT3ZRVXNmdVRNUDgydWhzTmlaamlxMXpDcm9h?=
 =?utf-8?B?Q0Q0K3ZnZ0ZnUi83ZGh5WHBwL3cwYnZGSzdoOHhQaVY0aWcrRVZwUjA2SFd5?=
 =?utf-8?Q?iwyapETfnriHt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmdyais0dVRRZEZNV29VdjNZdGpwRmVsbEx4bndLOVpHUjZ5WjhrdDRrZmty?=
 =?utf-8?B?VjNIdXBOZlFveTQvR28zNFVFWU9UQWt6dER6ODVXTE5vMjBoSVZ5Z1NSRnli?=
 =?utf-8?B?TjNRU2g3TW1xNnZQSmRWT1FRTkFpYlV3WGcrcjFoa0M1L1pWN3NBRnNBYVRM?=
 =?utf-8?B?NFBhOVBzZ1J3Q09DVi9sKzhUSSt2anZRRXlHSkFzL3ZqWDN2eGlMQU5Tdkhj?=
 =?utf-8?B?azlWTzFVb0xGOGtpWnlXOGpvN29tTmpHdFp6UU02dWIyVnJrNVdLb04waHNt?=
 =?utf-8?B?NXUzMlV6Tmx0WTdCQ1U2djVCSkxtUEpZZmhDSGQ3dXJjQzdualFGcWkydTk1?=
 =?utf-8?B?Q0VHZ3BCV1F0dVhFaUZqRmFZQjN1VXpQNjc1blhWZHQxUFU1WVphQnlyaUNX?=
 =?utf-8?B?ZXgrdVlscVliRFhISEMzSWJsUzdqbjBaT0pMQzZHZWY3eUpiQzFhLzZteW1O?=
 =?utf-8?B?Zkc1OTc1MTZmeDA0M2d0c3NIZmtMSi9zZTNaaUdreTdrTWp2V096aFYydmhh?=
 =?utf-8?B?YWFSNWRNNGkvUXhWZjZPc1FJelhhbUplaU5aeC83b2Zwc1VHR0YxclRjMDVI?=
 =?utf-8?B?RFNzSXFxL0t3VUR2OHBRd2hOeTFwcmlCUkUyR0xNbkNFeUZZWGR1emYzYjdx?=
 =?utf-8?B?WnVWQmgzdTZBY2tyRGJWeXc1N3VNM3BuV3dHZnpodklpNXpTdHdvbjA5UlhQ?=
 =?utf-8?B?ejdNbG1mdURCYmlSNHlxeGJrcHdWNXMxbUxOaDgyRE4xNmNaYmFoaHdUN1pL?=
 =?utf-8?B?OWpRS25admZZTHh6TzhlY1hFMmRZVy9lTWVsZHBoeDBWeCtXaEVrVzVMRmpU?=
 =?utf-8?B?WGFSTHBCZ3gvUVBIY0pqZHlpeUxZdEprYjJab2ZZdnNxbXdJbE91dUI1YnVM?=
 =?utf-8?B?R1Bwazcwc2VhZ0M3MXdCSEhqNXdoMHZWUFlVTy9XM0NiQWhQbFQydnhVMWhy?=
 =?utf-8?B?eEN6bUVvUmQzZWY5WVI1VXlReTRnZnBTQXMrTEtFaXVya2VGV1lxZWxoZ0N6?=
 =?utf-8?B?OHZ5ejRWTEZLUEM4cENOUWorTDZKR2U3dnJWdUZFYTRDb1J1VjVSaVFzSHox?=
 =?utf-8?B?MkxmbmF3NTUwWk5YRjBvd0xjbmxTOUJjNjQxL0lFaG1Beis1UFdoVS9BYSt0?=
 =?utf-8?B?ZWJkM1NIb0ZaUmhsUWVWUm1ZcjYvQWhsOUZSWGUxQU0zMTNETDBRV0hoM1lZ?=
 =?utf-8?B?QVJDRUQ2WjQ5a2tlMjdsYVc5bVBNdERlbWNTVE9MV0hXREliN2FRU3I2SkIw?=
 =?utf-8?B?K0VOYXA2N0VkZW9zamlwcDNkSUs5NFA5MUQvM2FKbThwdmxRSmJDZW1sekZv?=
 =?utf-8?B?UXRVMForYTZTT2tWWVE5UGZYdktrd0ZDMXR2NnpqQWNMbmpKem5KZXlrQjhQ?=
 =?utf-8?B?RktJK2VNbnFIdmszV1FsL3VRVCs5U051QXliV2JrenFBdys0eE81amtGSktu?=
 =?utf-8?B?WFl0MFErSnJPYzM3dlBrRGs2WkRYWWM5L1NnQysyMmNEYllxYllJWmppNnFj?=
 =?utf-8?B?Rk12ME9NV3hTYnNEUzlBaTVJempBTWRRaUtWN1Fkc2xoZWtReVQ3K0s5eGJo?=
 =?utf-8?B?d3Y1aHJxYVZXVk00MjJ2OUlKdHd0WU5PU1h1dmE0Y01zeFQwTmFxeGUvN2Rw?=
 =?utf-8?B?USsvVmNkRVVLVkdxYmtPWms2UjJnUzlVWnQwa0paWlB2N05FVHRYRUNjeGJX?=
 =?utf-8?B?ZlAvb2theER0WGFMaGZjY0RUSUp4dWhnVVVtNGRSM3Vrb1ZuZkRtQ2ptUW5u?=
 =?utf-8?B?bnhaL2VjRVdmSFAyNTZDblVydmlVeklWOWQ5dVlIL3pBNk9JVU1Tb0pDLzVr?=
 =?utf-8?B?L3V3bHR1dEhCanhOK1FabDVnYkN1ZmFqT3JHVlVKc29HTTAyUU5pQ3d1Tzky?=
 =?utf-8?B?UWRPVUhnS3JzOTNLc1NWRXZtcjd2dnN4cmNQb256WXVqYSs2eEs0dFBhM3dy?=
 =?utf-8?B?cGhxK3M1Y3NjOVFuY2c0NFQ3UmJXTUlZYnlaK3Vua2ZiaW45RXd0bEkxL2Ri?=
 =?utf-8?B?MTdRSi84UmdwS0FzYlZ3NHVYKzluaUsvLzUwaXFHRjIzOFpjc2FQQ1l4dkxs?=
 =?utf-8?B?RkZoZHJWdzM5aHdOSnowcDJkNUdreGc1blBHWXZuc2JuaHJid29Xc29mY3N0?=
 =?utf-8?Q?QGS5jkEza07iUx2cAIr5w1Hcw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dccdee45-11dc-4584-99eb-08dda2b94cf9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 16:11:30.3339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8yNnVVIADP2qrFnoubKM9U9Mr9oaGprPc3ggvrRLv/Tg3MnsKzSgyJkSR3T1UYerwC04A1N2Ku3je+jlFDPNgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6836


On 21/05/2025 13:10, Bertrand Marquis wrote:
> Hi Ayan,
Hi Bertrand,
>
>> On 9 May 2025, at 13:24, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> Define requirements for specific commands.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from -
>>
>> v1 - 1. Reworded the requirement so as to avoid mentioining variable names
>> or hardcoded strings. Otherwise, one would need to change the requirement
>> each time the code changes.
>>
>> v2 - 1. Moved few changes to previous patch.
>>
>> .../fusa/reqs/design-reqs/arm64/hypercall.rst | 15 ++++
>> .../design-reqs/arm64/version_hypercall.rst   | 34 ++++++++
>> .../reqs/design-reqs/version_hypercall.rst    | 82 ++++++++++++++++++
>> docs/fusa/reqs/index.rst                      |  3 +
>> docs/fusa/reqs/product-reqs/hypercall.rst     | 20 +++++
>> .../reqs/product-reqs/version_hypercall.rst   | 83 +++++++++++++++++++
>> 6 files changed, 237 insertions(+)
>> create mode 100644 docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
>> create mode 100644 docs/fusa/reqs/design-reqs/version_hypercall.rst
>> create mode 100644 docs/fusa/reqs/product-reqs/hypercall.rst
>>
>> diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>> index f00b0b00f9..f58a9d50aa 100644
>> --- a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>> +++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>> @@ -56,3 +56,18 @@ Comments:
>> Covers:
>>   - `XenProd~version_hyp_first_param~1`
>>   - `XenProd~version_hyp_second_param~1`
>> +
>> +Return value
>> +------------
>> +
>> +`XenSwdgn~arm64_ret_val~1`
>> +
>> +Description:
>> +Xen shall store the return value in first cpu core register.
> use x0 instead.
Ack
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~hyp_err_ret_val~1`
>> diff --git a/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
>> new file mode 100644
>> index 0000000000..3aa12ea2c2
>> --- /dev/null
>> +++ b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
>> @@ -0,0 +1,34 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Capabilities
>> +------------
>> +
>> +`XenSwdgn~arm64_capabilities~1`
>> +
>> +Description:
>> +Xen shall have an internal constant string to denote that the cpu is running
>> +in arm64 mode.
> This is untestable if this is purely internal so this cannot be a requirement
> I am not quite sure why you need this, can you explain ?

We had agreed on this wording in "[PATCH v1 2/2] docs: fusa: Add the 
requirements for some of the commands of XEN_VERSION". You had mentioned 
this

```

All in all, the design just need to say that it must be stored somewhere "bounded" to the source code so that a tester can check it.

```

So, I infer that needs to be validated by code inspection. The string is 
set in init_xen_cap_info().

>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~version_hyp_capabilities_cmd~1`
>> +
>> +Capabilities AArch32
>> +--------------------
>> +
>> +`XenSwdgn~arm64_capabilities_aarch32~1`
>> +
>> +Description:
>> +Xen shall have a internal constant string to denote that the cpu is running in
>> +arm32 mode.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~version_hyp_capabilities_cmd~1`
>> +
>> diff --git a/docs/fusa/reqs/design-reqs/version_hypercall.rst b/docs/fusa/reqs/design-reqs/version_hypercall.rst
>> new file mode 100644
>> index 0000000000..aac5896965
>> --- /dev/null
>> +++ b/docs/fusa/reqs/design-reqs/version_hypercall.rst
>> @@ -0,0 +1,82 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Version
>> +-------
>> +
>> +`XenSwdgn~version~1`
>> +
>> +Description:
>> +Xen shall have a internal constant (XEN_VERSION) storing the version number
>> +coming from the Makefile.
> I really have doubts about this and the following one.
>
> If this only goal is to say what should be returned in the XEN_VERSION hypcall you might
> just need something saying it and mention this as a comment because you will have a very
> hard time to test such a requirement.

Should I say

Description:

Xen shall return its version when XENVER_version command is invoked.

If so , then ...

>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~version_hyp_version_cmd~1`
>> +
>> +Subversion
>> +----------
>> +
>> +`XenSwdgn~subversion~1`
>> +
>> +Description:
>> +Xen shall have a internal constant (XEN_SUBVERSION) storing the sub version
>> +number coming from the Makefile.
Xen shall return its extra version when XENVER_extraversion command is 
invoked.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~version_hyp_version_cmd~1`
>> +
>> +Error copying buffer
>> +--------------------
>> +
>> +`XenSwdgn~error_copy_buffer~1`
>> +
>> +Description:
>> +Xen shall return -EFAULT if it is not able to copy data to domain's buffer.
>> +
>> +Rationale:
>> +-EFAULT is one of the error code defined in
>> +http://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/errno.h.
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~hyp_err_ret_val~1`
>> +
>> +Extraversion
>> +------------
>> +
>> +`XenSwdgn~extraversion~1`
>> +
>> +Description:
>> +Xen shall have a internal constant (XEN_EXTRAVERSION) storing the extraversion
>> +coming from the build environment.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~version_hyp_extraversion_cmd~1`
>> +
>> +Changeset
>> +---------
>> +
>> +`XenSwdgn~changeset~1`
>> +
>> +Description:
>> +Xen shall have a internal constant string (XEN_CHANGESET) storing the date,
>> +time and git hash of the last change made to Xen's codebase.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~version_hyp_changeset_cmd~1`
>> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
>> index d8683edce7..de19b0cda2 100644
>> --- a/docs/fusa/reqs/index.rst
>> +++ b/docs/fusa/reqs/index.rst
>> @@ -11,6 +11,9 @@ Requirements documentation
>>     product-reqs/reqs
>>     product-reqs/arm64/reqs
>>     product-reqs/version_hypercall
>> +   product-reqs/hypercall
>>     design-reqs/arm64/generic-timer
>>     design-reqs/arm64/sbsa-uart
>>     design-reqs/arm64/hypercall
>> +   design-reqs/arm64/version_hypercall
>> +   design-reqs/version_hypercall
>> diff --git a/docs/fusa/reqs/product-reqs/hypercall.rst b/docs/fusa/reqs/product-reqs/hypercall.rst
>> new file mode 100644
>> index 0000000000..b57b9acde8
>> --- /dev/null
>> +++ b/docs/fusa/reqs/product-reqs/hypercall.rst
>> @@ -0,0 +1,20 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Error Return Value
>> +------------------
>> +
>> +`XenProd~hyp_err_ret_val~1`
>> +
>> +Description:
>> +In case the hypercall fails, Xen shall return one of the error codes defined
>> +in http://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/errno.h.
> s/the/an/ hypercall otherwise it is not quite clear which hypercall you mean.
Ack
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~version_hypercall~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>> index 400d51bbeb..2ef1c4f9ca 100644
>> --- a/docs/fusa/reqs/product-reqs/version_hypercall.rst
>> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>> @@ -41,3 +41,86 @@ Covers:
>>
>> Needs:
>>   - XenSwdgn
>> +
>> +Version command
>> +---------------
>> +
>> +`XenProd~version_hyp_version_cmd~1`
>> +
>> +Description:
>> +Xen shall provide a command (num 0) for  hypercall (num 17) to retrieve Xen's
>> +version in the domain's register 0.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Xen version is composed of major and minor number.
> How Xen version is encoded should be a requirement, you can add this directly into
> the definition of this one in fact i think.

Do you mean the description should be :-

Description:

Xen shall provide a command (num 0) for  hypercall (num 17) to retrieve Xen's
version (composed of major and minor number) in the domain's register 0.

>
>> +
>> +Covers:
>> + - `XenMkt~version_hypercall~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Extraversion command
>> +--------------------
>> +
>> +`XenProd~version_hyp_extraversion_cmd~1`
>> +
>> +Description:
>> +Xen shall provide a command (num 1) for hypercall (num 17) to copy its
>> +extraversion in the domain's buffer.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Xen's extra version consists of a string passed with 'XEN_VENDORVERSION' command
>> +line parameter while building Xen.
>> +
>> +Covers:
>> + - `XenMkt~version_hypercall~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Capabilities command
>> +--------------------
>> +
>> +`XenProd~version_hyp_capabilities_cmd~1`
>> +
>> +Description:
>> +Xen shall provide a command (num 3) for hypercall (num 17) to copy its
>> +capabilities to the domain's buffer.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Capabilities related information is represented by char[1024].
>> +For Arm64, the capabilities should contain "xen-3.0-aarch64" string.
> Isn't it mandatory for xen to return aarch64 for arm64 ?
> This could be turned into a requirement (easily testable).

So should I change the following design requirement

"Xen shall have an internal constant string to denote that the cpu is 
running in arm64 mode."

to

"Xen shall return xen-3.0-aarch64 to denote that the cpu is running in 
arm64 mode."

>
>> +
>> +Covers:
>> + - `XenMkt~version_hypercall~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Changeset command
>> +-----------------
>> +
>> +`XenProd~version_hyp_changeset_cmd~1`
>> +
>> +Description:
>> +Xen shall provide a command (num 4) for hypercall (num 17) to copy changeset
>> +to the domain's buffer.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Changeset is string denoting the date, time and git hash of the last change
>> +made to Xen's codebase.
> Does this has a standard format ? if so it should be explained.

This is a implementation level detail. The format is autogenerated in 
compile.h

"Mon Dec 30 22:00:31 2024 +0100 git:0d729221ab"

How do you want me explain this ?

- Ayan

>
>> +
>> +Covers:
>> + - `XenMkt~version_hypercall~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> -- 
>> 2.25.1
>>
> Cheers
> Bertrand
>
>

