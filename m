Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE1FA42D03
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 20:50:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895382.1303980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmeSJ-000716-KS; Mon, 24 Feb 2025 19:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895382.1303980; Mon, 24 Feb 2025 19:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmeSJ-0006y2-HI; Mon, 24 Feb 2025 19:49:31 +0000
Received: by outflank-mailman (input) for mailman id 895382;
 Mon, 24 Feb 2025 19:49:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NyWY=VP=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1tmeSI-0006xs-2R
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 19:49:30 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2415::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72c3e3e7-f2e8-11ef-9897-31a8f345e629;
 Mon, 24 Feb 2025 20:49:25 +0100 (CET)
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com (2603:10b6:a03:539::18)
 by SA5PPFCAFD069B8.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Mon, 24 Feb
 2025 19:49:18 +0000
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a]) by SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 19:49:18 +0000
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
X-Inumbo-ID: 72c3e3e7-f2e8-11ef-9897-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmPCh+UpoS0kmlNI5FfFUX7W7apYhj8qzx41PTIHQDxc6GiJ71VL4P1lKrDcZhYG1UH/xz1ajNsE9xFWyb8aRYVlcpbs78IIt4nr6/Iz8dnwfvNiDGmNML4JoaSJ2SzphSJcG7Uj64nitNPX8oItyXItBQFI14mTjbFxYfUk+j4oraDqDcr/WaKGVZqvnWyP9JzCh6PXldql4uD311iRabVkSC70BeJhFpt/xwJESbBYTdMMdUwGwLnluQOZWDEVfDQaS85cg8wT1u/fh+23juHiuFzofZ9lV+9Y98R4Lyz44Adk6ZcoKIq8uZm5LwdL5g4Bmk8rGR72ptQyaneelA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbpxeeqCzwAg5VLaA8nMB9EsCS4CWgHS6OuWBuWHlOI=;
 b=FtoBSuYS4GBgiMOQcF3JpwgNhrD501h13Meg1wGXBSQirBowb03uwNN1K2F2gu+JwqtnwOVNuDz0QvAqks5UH6X1pG89L3yM2NSUPD5LUIQtOFSPxLK4q0YhD+jFCa5m2HYfXEWZW/qBwpQu8uo3/xlNCx0vxDNafcwYO0dTwiWxYDKI+RKlwrE2oo8RFxEFzQN+sy0hR/LmfYlTkF8LgeaP/+4jOS5hEgToXIdlEJQmbaXl6SZ12fwu/4IFscg0sZiMEBN66uOW9HnzltZILZI5jYFywGF3eNqjCkfxkF1m5dESv18CR3+BaRuteFEDxfJy42RP5b9r4LuyqtLtwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbpxeeqCzwAg5VLaA8nMB9EsCS4CWgHS6OuWBuWHlOI=;
 b=snKtyyEaNr7WvxRkXkxzIeFfWbTkF9o0diILDCm9Uihq1DLGYOYniSmDGx+JKC/u/ZTnY/Joru3gz4ZkVtWK+4FtllqBDWuyAYIDpyqAwXcmOpOMUUpKUhnp4Noa9hJVc5hzJh4LagtXGTKLH7CDEX3CccBb8wCnE+ier+wLfe4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e93f215e-06c0-4a65-8e74-e849659541cc@amd.com>
Date: Mon, 24 Feb 2025 11:49:17 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, anthony@xenproject.org
From: "Lira, Victor M" <VictorM.Lira@amd.com>
Subject: [RFC] CI: GitLab automatic pipeline deletion
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0207.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::32) To SJ2PR12MB8876.namprd12.prod.outlook.com
 (2603:10b6:a03:539::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8876:EE_|SA5PPFCAFD069B8:EE_
X-MS-Office365-Filtering-Correlation-Id: f796da0b-ea07-4a9e-4c4a-08dd550c533f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzhZVkhVdW5ML3dXMVA2UGFnakN5a0RocGhkNGl4eS9SMmVWY1pDd3JFZnBG?=
 =?utf-8?B?WlYwSjRZN0JyV0J1dVVoSHJhSmdraUlGRmVXc0trbWZVamZpMHlaeHg5ck1G?=
 =?utf-8?B?V2p6czl0aUR5T2xuNHNCWG93QWJHUmNvS3lpVVJ6cmlGcGdLUkRqcHdUcUhs?=
 =?utf-8?B?cFUyZHRSTmJ2aEVKVjdEMnFNRXR2ZEx5Qkx3OWs3bGpXV0ZpMU01QThZNmVp?=
 =?utf-8?B?U1p0Um0vb2l0aHE2b2FPL2R2cHpuSm0yUmp2RFZZUWpPZXZ0RG92U1IrSE5P?=
 =?utf-8?B?QmUrbEFaT1FXbzZMZmQ4KytUWXN1NGJnd0lta1FSQzNXdUNZcVZHWFhab3Bj?=
 =?utf-8?B?QnNySnowRjZWM29QRXk2TXN1S2lLMGo1Wm9GWlRISjhZY2ZGZjhxeDZlSkl0?=
 =?utf-8?B?VEdFTnlaUkFlUGRZQkpHUHc3VGFaUmpBVEZjb2VFZlRZanIwbTFoSWVnNFFq?=
 =?utf-8?B?WGRPWlJBRXBRY1VlQ041TndsOU1BS3MrY2lhOWxEQmRjNE8ySWdrUUlYdlRk?=
 =?utf-8?B?OTkzQnJsdHNOejBZbWdvSHRFYWJ1bmtPSUVUUDh2THZsVlp0THdzUXNaYVhG?=
 =?utf-8?B?d1dHeHlZS2cwWGZLZnhRNlpkOTNiWkMrbkwyVFo3SXd2dDZZU25MTEsweWp6?=
 =?utf-8?B?MEVhMkhiVnJaVnhIemNiNURWaGVpZXlmTWowLzh5OUV3TVFteDhDeVJuM3Rn?=
 =?utf-8?B?NEl3SlFBYk40dWQ5UFJCSjRJeGI0V3FmSU9TTWtCdTI1Y2huVmhNem5oSGVq?=
 =?utf-8?B?cDV2bXV4dFJOSGRYWmpIczloakZaNUg2M2hkK0c2Sjd2ZEg2R2NFbmVjU1VZ?=
 =?utf-8?B?UzFzTEJuTXdsY3pKR3hFM1JOeVNCNE9pdTZpTVhjY2dhayszYWd1Q1NyS3Q0?=
 =?utf-8?B?MEp3L0pmMXl5S2JVbWZhRk81UW9sMnJiZG5Ga2c3VERMd1FtaTM0ekJ2VWE3?=
 =?utf-8?B?RzFOU3IxSkJ1NGlwem9oZ2laU3A2T0F3Y01XVUJqZnVkK1Q4dkJpQzFlYzR4?=
 =?utf-8?B?dFNVd3g3L24vZ3RqS2ZtM0dweU5HeWgvamdzRUgxN25USms0Q1Eyckl4S1Zh?=
 =?utf-8?B?L21XNnJLcmpGeW5UdWVEUVFqby9UblVHeUVFSGlNV0hpa29xSytNWnh0MHdI?=
 =?utf-8?B?ZjVzcnBzQnIyREtRWmlWamh4T29RaGxmV1NSTkhrWjFDYlJLWmU3QWc2ZTZw?=
 =?utf-8?B?MUV3L2NRQnhrTDdkNkZJUDBNY0pmUGJSSWpKOGdQeHVCbVlBODdOM1EyM1RG?=
 =?utf-8?B?aUt1ZWExcUtpTnJuZXJYZTF3TndtVE5ZbklUU0wzWGh6dmk0WldpTC9mbzRM?=
 =?utf-8?B?ZUdZV2RTdTltWGptV29VVGlVTDc0TFd5VjdlMzZ3TEpVQlk4VURmT2dBZ2RD?=
 =?utf-8?B?cGlwSi9iNUNrcHNvOFlEaWNvVm1MWlUxbktFQmhFU1BBQjcrRldzcy9UMzhu?=
 =?utf-8?B?YUN0TEJMakRxMGhqY0dCQ3RHZHNuOFN5eHZieURhd1BaQTJwRElsOERHaUx0?=
 =?utf-8?B?Uk9ZUit4Qk5URVMyOENvbkF0UzlNYkF0S1pBNlJSdm5rdTRoZEZwYmVYSnlD?=
 =?utf-8?B?ZVZ6djZiQ1p5bXBCT2p3ZHdRbDczMkRSWmZHSnJjK1VTcTFxT2wvMU1KZ0Zl?=
 =?utf-8?B?dGNFTy9xRFNuTVBIaVFEN0RUcnJGQVdOZ2ZpWEJ2eHRKaWNzZ2RRR3NnMUJn?=
 =?utf-8?B?WEtMSkZvU2t2U3cvMURhekE0cVhCdWkrSmJhTENFc1p2Y0xoYUhTWm0wR29a?=
 =?utf-8?B?MDhXUFZ6REN6cjAyNk5Jbk5xai92RGJSWERqeS9PVnl0Q09OZVdOa251S0wv?=
 =?utf-8?B?RFp0cEJBamZmUXlQV0R6Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8876.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzhkU3RFZHlqNkpMZTZxRUZ0c3B4akxmY2FpMWNiNFZJbU5UcDgwdXRjSVdw?=
 =?utf-8?B?QVRGVlcrdjVDSGVsUjVmQ2UyOTRDZlJFWkZLZDJCdUk5cCtoRk94RVVaM2x6?=
 =?utf-8?B?Um5pcEdHT29CN1V1cXpFWERnR0NKaTV2NmxSTHRDL0dHbjJwdEM2a2cvZzBE?=
 =?utf-8?B?YWl1dkd4S2t6eGlIdFlQNmlRWnB3WmV3QnllZ2JrbGJTd0Jzc3g1WHl4UUVG?=
 =?utf-8?B?aDBmZkV6ZlY0eHVScGdMcWhHdkxFVUJnck9IUDFWSjk2WlNZeDhCMjcyYlo2?=
 =?utf-8?B?UVlpR3lYYit4OThaODRNb0VidzBBbEZTS3Y0UXZVd29oRWdsMFQ1Wkw2Wm8v?=
 =?utf-8?B?akJzS0ZIUHNTVzZxVFFJS2NxZ1o5RFJISjRVUm1sZUp4NXZwdVFmQzJ3bVpy?=
 =?utf-8?B?d3p5YnlaRXUrSWNsOXNUUVVQYktNbTByUE5HZiswWXZ2c3dZSi9HcWdSemEz?=
 =?utf-8?B?NzlKUGt2bEpJOXpnV1lpL3FxUmtSNGVHMUZ6TXZTeTVQMmVpYTZtcXlrMmZJ?=
 =?utf-8?B?eUR0UE1LNzgvdm1pcHJTeUhBY0NpamJTb2h6N2M2NGgwNlUybnYwcHRWODRD?=
 =?utf-8?B?bXRZQkFMRHR4Uy9QajZXRG9jN2htTWxLSTlCeFlvbXJleWNNSzV4eFhBTHlo?=
 =?utf-8?B?bUM3WER0WU9qNWJxVWQ1U2JoOXQwbmVEY3lkM1JBTHo1UFFJV0w5bldLOExT?=
 =?utf-8?B?Zm9IdkdZREx0R1FxaUwvT0IveGtGNWJkakg4VXpoOWtHWHh4RXZ2UnBzVy9W?=
 =?utf-8?B?QXhWdDB1MTh1cTVaR3E3cW9IVjlGUDhhU0tEN0xqOERMc1RQdFdCa2hsUTI4?=
 =?utf-8?B?OWp0bFdLV1BNQ3ZXZ3ZyQ1NCWnlEREMwQzY1VGNwNXIxWTZPZjJWVDM0ZEor?=
 =?utf-8?B?UTUrcDg0MzFMQkMyMXJTaUZyTzlJcGxyQXZGaU1HOVBjT0YrbExxWnoxWmdk?=
 =?utf-8?B?c0R1bkpvaDRCVkVqdEd2MXQyem5MUFdRZ2tRMXRmMEJ3ZkNNc241UFJCMDdU?=
 =?utf-8?B?N2RWbEE0N084KzQ1TDZEdVpmNXZtSDNHODFTK25BREZCVzlyV05lbGVxZ3Zy?=
 =?utf-8?B?SmZPTWFObTV6dVdsRHJ3eExzZmNxc3hNMDNtdmdEdHY0eExEeTVsdFBaOExj?=
 =?utf-8?B?NzFTVktNb3BOOGhESTBrdG16aTZBUlFIRUM5dklpcmVoSWhLaXMwb2k0NW0v?=
 =?utf-8?B?d09OZkJLa3FjNXliWFV6Rkl3ZHpoUU5qSTZFT2VUeUxKV2tsSkFrb3oxYncy?=
 =?utf-8?B?bHkvcEFYUkprS3V4UVhVYXRCTmVMRU9JaGdjdDZXYWVhWmlXcUlhUHczbXRz?=
 =?utf-8?B?NEdXVkhlbE9pQjgrOVk1ektoU0M1ZTB0SGtUSmNoS1lrajNVYllnRUc4ZURK?=
 =?utf-8?B?allSaHFSS0pCd256bjkvRDExYkNkRWhmR3BLZC85clI3MHo5L1JSTnIycndp?=
 =?utf-8?B?SS83R0JlTTJnU3NEVmpoK3RBL2VKbWNOZGFEalBSVDJRR29DbkduQmpjZXhT?=
 =?utf-8?B?WVlDVk5jR2tiRitSVHBDRzZpSlJDMWxpZXBwUWZUQ3JUOGozWlovbGVGcE9Z?=
 =?utf-8?B?b2xnWnk3UU9MdEVZZkhwSGFPaHZGNFBnNzFCM28vc2MvdVRvby81czg1NDdR?=
 =?utf-8?B?RUlTZXk2WWo5ZHB3a2I2Y1RXbmJUN0g5VS9CQkNQYnFzY3hrcTAzRHNpZHRT?=
 =?utf-8?B?ZlBBMFVNZjlWZWRKLzduTDdkN0ZQcjdhd2ZYeDBocFZmTU1qVERtbnA0Umxw?=
 =?utf-8?B?aXRITUNSYm9YWitGdHN6R2VzYVp1R0RRUm5hQzd4NGNvazBSNmRBVTNIQ2Rw?=
 =?utf-8?B?S3NycllOY1JYR0JLNFI1QU8wc3J0ZmRuOGp3bkp0ajRDRlBOQ1NwUnpHV3VE?=
 =?utf-8?B?WG8wUDYzWGJWd29jWFFDMEFMelNXWFlNdm9WdXB4bmlxcnVjWTEzTlJUQmZh?=
 =?utf-8?B?RDVwOGhiTWhOd3dhaDNOaFl6Y0JKdVNyc01Zb0twWlNJWVY1S2lwblJSRVc0?=
 =?utf-8?B?SWxvWmVudytYUndsMnFjellwM0hxK3JNRXNId0lZUHlHTU41WkE5N1l1UldD?=
 =?utf-8?B?SjRCN1BzUmtOVXhrVnB4N0JIcFRGNGQ1akhYdjlFcnVQd0Zobk1Ucml0Q0tp?=
 =?utf-8?Q?tUMp5rND2eA/CP+Ac1KSRJ9GY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f796da0b-ea07-4a9e-4c4a-08dd550c533f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8876.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 19:49:18.2667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7I7cjK6O4U83A28zxaAtJG/jsOSi/4YTxIGIdkdIowG3VmQ7EPD6oyzFNg39IAdUwbijTIUPrYwHeHHqfLfBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFCAFD069B8

Hello all,

We have discussed before the issue of Xen Project GitLab storage. The recent
update to GitLab has the option to delete pipelines after a specified 
time from
1 day up to 1 year. By default it is disabled, meaning never deleted. I 
think
we should consider enabling because it could help reduce the amount of 
storage
being used, for example, by the job logs in xen-project/hardware/xen.

Here is an example of the data which could be freed in pipelines older 
than one
year:
https://gitlab.com/xen-project/hardware/xen/-/pipelines/951185943

https://docs.gitlab.com/ci/pipelines/settings/#automatic-pipeline-cleanup

Victor


