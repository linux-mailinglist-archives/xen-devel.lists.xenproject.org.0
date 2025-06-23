Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F51AE4431
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:40:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022349.1398137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThPi-0002tL-3K; Mon, 23 Jun 2025 13:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022349.1398137; Mon, 23 Jun 2025 13:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThPh-0002rh-Us; Mon, 23 Jun 2025 13:40:45 +0000
Received: by outflank-mailman (input) for mailman id 1022349;
 Mon, 23 Jun 2025 13:40:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqlE=ZG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uThPf-0002rb-Pe
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:40:43 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2414::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7ac38db-5037-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 15:40:42 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS0PR12MB9345.namprd12.prod.outlook.com (2603:10b6:8:1a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Mon, 23 Jun
 2025 13:40:38 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 13:40:38 +0000
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
X-Inumbo-ID: a7ac38db-5037-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTPCB+nYaFTGcrx2s5uYEVOnZ5sbp1/IWB8NzHdLNRV0b4EFS1Uf4EC7hitB17e0ftZbmQyzQXHmSOCljQSwPLugx+goDw+eAPdhCMGUalrzABKw/m/9UPzyRko3f+ldnJlqFgRlLELNSXSu88DU3Tq5LJN9cJCVH2SaHfJ8D5rqARyfBR6jzB9F+Vpo+pDEk9RCLgUHYTu1uC/tQenC1Fi+AHzf8htP0yafzmYx83ul3qQJELF753hJCpom5dp0WW5ER5/kDBw4QrEwizRBq7ltSlJ03CuQl3FKiFo6avTzshBkUrL0v4mATlKRWPno7+FvEp3bFhWFB19y2wBQpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ac2p6PoWZHUM3Ak080aYAAP/+ZaNy8jHvKiAwMtGhe0=;
 b=vY694uFDeoZgaQHC09EP4960GDtT2ttDN4RRQ/9hnVCDnnImrjW6F71A1J9ldmUSd2XmRAKMgJlDFOjJrPwJNnagNYHxA+o9M8WMgjWEKFRVC61KE3a5s3StlSOQ1TZuWQXbWA9ItbKl4ZOyAuwX6EueAr+lCziOK1iqento/CL3/YAi1wLonwhElLdKazaRRKcUWc2l+duPpVyb5U/E4UKzhGIJpoRAPt54agNSpuuPHc4UGs1TkZxgadZFUTYGdTZCaQiHtTeJr7YLsEKuLhHrVyvKEZ0MbGmphB0HSfkXdezk9/Tp7qrCnPX8Cpj9ZCvGUW9KR2V4MiCOGrD6lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ac2p6PoWZHUM3Ak080aYAAP/+ZaNy8jHvKiAwMtGhe0=;
 b=r1KsahY/rZYIuc0wwciKyDYwQ7yVL1QRjtW1PWckpM+VwfpymemUDdawDkMFaVemctKUx8PM8QBCRnGZd6+ob4GJcUQxsJUzAwME6DRMMJYry9/PmYAp3Iv8YSPnSpo13yvuNZ74Fbb7d4l8aWw0P3AKyu0Mbo2uJ2PkeIWFK0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8e6ed078-9ab9-4f6d-91f4-cbeb74f2c5fd@amd.com>
Date: Mon, 23 Jun 2025 15:40:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] xen/arm: Move make_hypervisor_node()
To: Koichiro Den <den@valinux.co.jp>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250621151201.896719-1-den@valinux.co.jp>
 <20250621151201.896719-3-den@valinux.co.jp>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250621151201.896719-3-den@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR17CA0059.namprd17.prod.outlook.com
 (2603:10b6:930:12::23) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS0PR12MB9345:EE_
X-MS-Office365-Filtering-Correlation-Id: 097bfeda-a6bd-4c83-b901-08ddb25b8a2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qk4yNzdQd2dRT1R2a3hFUnBlQlRrT1BoTzBOWGpmVFJuQW1CeUROQWxCbnVH?=
 =?utf-8?B?S1AyNEVXWFhWNnRQMWZXa0hxU2NYWWJDQzB6NHZaOXFJWmM0bDVhbWQ3Q1l0?=
 =?utf-8?B?V2xNVFlVNC9tWmJCRUJWb0JseHkrSnZSdEtDYnlFeXFPaFlXWm0rcFJmbVlH?=
 =?utf-8?B?Z2JiUDdocUdmRzd2UDFxT1habTZhbkdrdnU3U1h5MVg5SUhtdDRWcmZhUU5l?=
 =?utf-8?B?eG9nYmdIZTVYMmlEcFRHcys3UDhrdnN1VG9QMzhuUmdMUEhyWVdWRFczR1U4?=
 =?utf-8?B?ajNVMU8xNFhValFteUR2NFpOdWRDczlPaEx3S0dOSXJrdjl1c01oWnMySnU2?=
 =?utf-8?B?SGVBUFMwTFdZQnRaczZJMHk1YXVtTVBrT1ZRSE80eUJEQUNFNFp3dDBRVllu?=
 =?utf-8?B?Sis1ZzNKMmhNeVU4N2FkK0VjTkdybjl5SHNZaXpzUFVxcTBKcU5ybXU3aFhB?=
 =?utf-8?B?Vi9yZVVXUjVxWkNwL2tCM0lwZFpjQ2ZLQysvOVdqaFNwT3pxVFdQODA1SFky?=
 =?utf-8?B?bWcxUHlPejBaVE1CUVlDTEVoNjMzVm1rVlpHRXBiWXp3NC96ZVg1T0J6ZEpk?=
 =?utf-8?B?NHdVT1lZNEtkM0d5dE9iRjJ0c2lTaHZiL3RYSEpWN1ZraE1OV25sdGZRREpj?=
 =?utf-8?B?c1BNUGRISW1MSDV6YUVTZ2hTN2MvQ2dnM3hYRDBGSW80VGFEaTRxejNvb0Ju?=
 =?utf-8?B?ZFM1bUZKMjlpbk5NVWlUdVhvbzZlSDRoWEVzT2pFTEpLNHQzYU9FeXVUbGg2?=
 =?utf-8?B?bEZlVFRsU2o2S1c0ajlrUU9ROWNBS2xPakVKZHg5K1NkU2VoOU1MemQ2bk1i?=
 =?utf-8?B?NUg0aER4em5KNkc4L214Ni84YnovTS9WVEh4d2JPWUgySkhsSmFGQzVuMGE5?=
 =?utf-8?B?ZThpc0txMXZkUCtxdUlQaXUzMFlzL3ZkUHZ4WFBxUy9tK2Y0Q0xtWmhkV0E5?=
 =?utf-8?B?V3YrdmtpTmpONEN5V0xyaE1CcU05Zzdpbm1qSm9ESHBTT1ZVWGs4ZTdZemVk?=
 =?utf-8?B?K3BVcnlYYTJPdEl1elpvQmVhc1BRU2lEM1ZCN0Vaak9VZXFOUHpCOEgrc2pu?=
 =?utf-8?B?S2tHdEtFSWZxK3Rld0ZIdmdiOW9odnRtSnJTSHljUllhM09hcEJ0Q2VYdUF2?=
 =?utf-8?B?dE05TUxNeUJXSURSa1Fpc3E1L2JMbXpMeFhEc3FPdmx0OFpWRVg0RTY3dzRa?=
 =?utf-8?B?QkdVbnREL3lFdTFqYWIwRkY3bzlIL3UybGhFeTdXNmU0WXd5SDRpaTVqWjVI?=
 =?utf-8?B?dzZ5SG44eThqRHJTR2NoVmVUeTU0aW1sU3l2aGFHV2VGb3ZJdnlyVEhFMHpH?=
 =?utf-8?B?WjZ6WmZZQm9HZ0NwS0FGTDNLUmRzUExoTjgrNktpdDZlcjkrZER3djA1aEpC?=
 =?utf-8?B?M0pKVXdYM3VEelFlU0tmQTB1MXhIUmJDL1BuRElvTUpPOGl5T25YcjZkNXM3?=
 =?utf-8?B?L2lOSUluQWpJUEJrNDN3Y0dWVUpMdnNydzF1eXZBQWRTMmhPNlhjMnR4YTdO?=
 =?utf-8?B?QzU5OHQrTnNQNzh2TTFkclZlUktNelRKRjR6MldTdVhzajR1MENRQ3hOY29z?=
 =?utf-8?B?V0VodURPTGE4U2IzbkFJcHRpY0owblBIOXRtU1ZMZjV4Sk5EQ2UyWXFtZkhm?=
 =?utf-8?B?SVhXekdGcXFMTUhTRjBWVnJKSmQ3c2NUMHdXRFZ1LzZCWEpSUFZ6bXR0RERo?=
 =?utf-8?B?alliaG15TUhwNmFzYVhTTFdJL1FHVGk2ZGZTRnlRa0NNZ0dac2NRYVBzVXBI?=
 =?utf-8?B?c24xN2hlOGNhc3d6Y3VBdWRBWFdDaWdtM2xrWGFJYTJKVCt0ZjBEWi94VGN5?=
 =?utf-8?B?WlFwdVVGV2F0cjQ0bHRIZmpPcS80K0w4OWwzWlFZaDQrN0tuMUxqK0pYVzZj?=
 =?utf-8?B?cXJzSXlBLzN3Zm9vMHlOTU5vdGVPTTdpaTlYWjJ2bGhVVHlGbjEwSmtRd1hn?=
 =?utf-8?Q?WnDk7C6KBjw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUhiMjg5TlBVaHpXNEhWcG8rV0hYL2ovME56VFlHMU1GbjViV05YRHJKYzN0?=
 =?utf-8?B?WVFxUC94VXlKM3B5ZG43MG1qaE01S2l5bmJMdEhmMk9NUUxvcmFmMDNSdEVj?=
 =?utf-8?B?RTV6WU1LMUJzQzhVWE96c1BpZEhGUTFZejNjRU5YM0xyclE4NmJHTkU5ZlBJ?=
 =?utf-8?B?a29wanhxY3pkRTF6V3N5QXUrUExYek9WOERKVGoyb25lOC8zRmlLZEZtZkFa?=
 =?utf-8?B?UTduYUI1M2ZHQkQvQnZXRkV3KzhqekZMTTM4ME0yaHhkV0hCcXZ3WWloVk1P?=
 =?utf-8?B?K2xJeFdRdVMvZWxwa3dqb3phU1pxZWpEbW05SEdsSkE5elRxdHBBZVRhZGJQ?=
 =?utf-8?B?VXJ6UTBlU2RtVTREYzEwOTUwWUs2UHJJTk1JblcyNFRkU293cWgyWnVQQmU5?=
 =?utf-8?B?WlVnWDUxeFNkKzJCMGlYWlBBQmFIUkpxMUk2S0IyU3oxZnN0TStJamt2Y2da?=
 =?utf-8?B?Tk5McVd2T2JQemp0VnhUTkU4cFZXeFVnTE1aUG0yRlhBblFudGtVUk5GeE8y?=
 =?utf-8?B?N3pNdEJqT3BqQ0RiZ3MxZXpuaEZpL0NCS05KREdLUjhndXlsWE5TMlpkcERp?=
 =?utf-8?B?eWVrWEw4VGt0a0tNWVh5cHE4WEQ0OFVHaDBmRyt2bXlkbmRuZ3phSWh5RTRU?=
 =?utf-8?B?b3owYU5pUUtmbUliNE9Da1hHMncrZWVQUWJTVWdEcW1WdlNaQ2trMm4wTkZC?=
 =?utf-8?B?Sk02V1RiWmJxWjBkWEw1MGova0F5NGdGWWNYaUl6dE9RbE4wOVJqQVV2RVd5?=
 =?utf-8?B?dlE1dy9OZ0c4OHdyNmxrcUJ6bHZ4MEUzbE9jeWErRzM2OGYyUHJ3cFNzV05S?=
 =?utf-8?B?RUxiaGkzYWpUSUpCV29XaEpLZ1l3enF1bTJGTTdmNDVQVHNicGx2T0l0RUNP?=
 =?utf-8?B?L3k0MEN3bVN6WC9XR2c1UmIxVE9ucEFVekFNd3JoM1BQem1OUXhsMXdlRTd4?=
 =?utf-8?B?VHBaRmp1MUhoWGNQR2p1SS9kaU1rZ1NEUVhVaCt1amVhWTl2ZHVzL1RJWVUv?=
 =?utf-8?B?TW4rN0VVbXZUcm0yVDZ0MGd0TkJTM011Q0o5a1prNTN5OHRIQnhwRXltcE81?=
 =?utf-8?B?WURMbFMyajNXZU9GMzViRERndlFJdkNNTEd1RGs2dTBqVis1bEdEN29zZGh3?=
 =?utf-8?B?cml3aE1DL2lJbWNrVEFZVC9XYXRXd2hMbTFEaXNEZm1OS0hOdVZ2ZDJXRWo5?=
 =?utf-8?B?NDBlTXZ3YktJdjJDa2g4Y2RXNmsxWWp5M2l0TGRsT0JqNXJNK2NGcldPTGpn?=
 =?utf-8?B?VDdXQm5ScGdYQ2RsN3BlNXhqUEw0dnJnK09IaS94UlFsSFM2NnhiZGhQUG5K?=
 =?utf-8?B?aGlMb1BwWk1yRk5PVFNFZDZ0SFVocHIwWDB4OUFqOE53R0daR0hzdzFXazdK?=
 =?utf-8?B?ZGlBNGhqZWhhRmdRSFhjLzNhZVcxK1dmcktqenY4Y1p4VHFCU3hXNzN0Z2dP?=
 =?utf-8?B?bm1NUUp2YzNKd1J2KzdSYlNQYXFhWnVDbmdQcytyTWdHYVM2WXp1cGlJT2pr?=
 =?utf-8?B?MkN5NDFPWVdKZ2w4M3pOekZnT1FwTTBvaDM1L0xqQWJrcGUxYzVZOStQaVF2?=
 =?utf-8?B?bFBrMjIvOWxTWTdsVWQreEk0dWtuUk9LZldLa215L05tbXMxR2VtaktHQkRR?=
 =?utf-8?B?Tyt4R0FiNjA4b2lNeWFBWmZqeXk0TDE4RFNMUGhzQWFXT0RMbE9OS2NoUk5V?=
 =?utf-8?B?YW5hNlJ1d1RaUGRwT3NZVGVaRWtITzY3Y1Y5bVFVRHAvS09xS3FwQzBDMyti?=
 =?utf-8?B?b2NvRFZ3a05HWW9MUklGSGk1R3BnWnhiZFd4bVNRcDBEMmVtSDdnQnJDdFdD?=
 =?utf-8?B?WHpVbHZhN28xOHVSbVdBdHNwQnA1U2RZNUY2blloc3BHVGlCcDJIM0R6cFZ2?=
 =?utf-8?B?aEJiMTQ5Rkw2VUJtbGk0bTEyTWJNMkhzQjdZRWxLOVloNTBsSjdCQXR6VzY4?=
 =?utf-8?B?anA2TEdjSWlWdWVaUXUrY25ubTRJUmFmQW9ockNGSWFuL0ppQmtUQ0p6a09k?=
 =?utf-8?B?QTZCWE15alFFRXpYQ1dqMHF4S0dQZHUvOERNQ1ZuUnh1cFZlM09HVWd5Y3BK?=
 =?utf-8?B?T0hqdmY3dDRpOFVONVo4eTJyT2RMSWFUbyt4a2VYK24vdDhlVk5zMUZkbDRH?=
 =?utf-8?Q?wUcc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 097bfeda-a6bd-4c83-b901-08ddb25b8a2f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 13:40:38.8291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /1InwAzCE9b2HrJyyzhtXQMH4xUQ4lof6RkMtvmYBSwTiDV7/UciYySkmsGCAnC0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9345



On 21/06/2025 17:11, Koichiro Den wrote:
> Even though make_hypervisor_node() does not rely on the /reserved-memory
> instantiation when calling find_unused_regions() (the wrapper introduced
> in the previous commit), the next but one commit will use it for PV time
Unless for specific reasons, you should not rely on which commit gets committed
first. Hypothetically there could be a different patch committed between this
and the next one in your series. That's why it's not a good practice to mention
order of commits in the commit message.

> shared regions, in addition to the existing extended regions.
> 
> Move it as a prerequisite for the commit after next.
This one is particularly not useful.

> 
> No functional changes intended.
> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

Other than that, LGTM.

~Michal


