Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C80D7B08FC0
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 16:43:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046983.1417354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucPpI-0005t6-9T; Thu, 17 Jul 2025 14:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046983.1417354; Thu, 17 Jul 2025 14:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucPpI-0005qz-6n; Thu, 17 Jul 2025 14:43:12 +0000
Received: by outflank-mailman (input) for mailman id 1046983;
 Thu, 17 Jul 2025 14:43:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjFy=Z6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ucPpH-0005oK-Cz
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 14:43:11 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20611.outbound.protection.outlook.com
 [2a01:111:f403:2009::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aeb52d8-631c-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 16:43:09 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY3PR12MB9655.namprd12.prod.outlook.com (2603:10b6:930:100::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 14:43:05 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Thu, 17 Jul 2025
 14:43:05 +0000
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
X-Inumbo-ID: 5aeb52d8-631c-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVvGtt+lDXTIFgW69yIqm8XKfkD1/ZxzlVYIlKHtaD3watJxDRD78uQpGtU+talt5UqU9CoZeFmrzxLu3/3vbFNtxdu2Fzr1sEUW0af6m8691U3E00WQT43K6RDaed5vp7SbJpQDdJjyjQIl3Kxx/RkQlYWyXXWsPqvjZ0TCUw5fkTsX801TORGSwQyGo0UuOaqN2e97ibwNVc+2xfRI/GtSVCKQp02u6OUIPatcs+9mvcjAl7U92FYECKnQgUO0KTa0ODqT/Nwl3umJhscHnkIOSq9nx6y4fDGA9samXDJo0MoeZygx0CUoVioWMyOp4gNbD42YgVzUsM3GXdKOrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgkJrzkysvRMJhzRaV70WMi5VNcoa8yE/QbkrB709HQ=;
 b=qrObSBJTuBwRlJyr0QaBFD+gPQdXL3a1yNh6Cj7+ZYW9UzcCpFMu4fmdu7U+GGPR1PyoYRZl6Lv4cC2HIWXuk5JWVzQ6GGpg5tzY7v9TPz09Zt4QNwc+sIH/WsF76FbrxV5FtM5qu9E9ugff/HUeTLvy7fYs2lLd7Yk69EBhKmLTDGkSpYWwZiD4sVzybvHqlbYmkQpocffQMLFqJIoT+hdFA4PWLJ0R+qdrgMLYf4OuxwrXThFFuxt7gUKAjRN8wg1JxXpOsAirMZFuEN9MuJbQjOSKfjM9RtQ4A4FeMV/zG1YN+QPM4ukqqCLU/SWo0gOJ84EJZ9WdDouxgFShBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgkJrzkysvRMJhzRaV70WMi5VNcoa8yE/QbkrB709HQ=;
 b=s0i7IYe7rAAAjJc4ia72jJidgvJBFkYHGRHSRSLRcpATG5dKM/1WvU/AKueHLwz3tfFGQU4wQGUiJYhcu9hn6BTiU5IFUVI36zARY3FPqQTLJ7LFbnaQyMOtrgrIoAlnjldK+jx6i4RGMQfy1+ZQRKW7KvjpP+sXR5Nx7HcRLyw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <06418a16-cd22-4e44-a311-610e0b788951@amd.com>
Date: Thu, 17 Jul 2025 16:43:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] xen/dt: Rename bootfdt.c -> bootinfo-fdt.c
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20250715161108.141126-1-alejandro.garciavallejo@amd.com>
 <20250715161108.141126-7-alejandro.garciavallejo@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250715161108.141126-7-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0384.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::18) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY3PR12MB9655:EE_
X-MS-Office365-Filtering-Correlation-Id: cfaea681-7863-4e3f-2cc3-08ddc5403cf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K3B0NE1qc1E0RGFtWWtvNHlabzA5RXh4ZkVnR3B0V3ZHb2lrR3A0MHU2T3JY?=
 =?utf-8?B?WE5WUi9YbG5ramw3dkJRTkR2TzZFNWNCOHlldVI4Wm1pYTIvVHNGSzZaNktn?=
 =?utf-8?B?Y1ZqcWdSZXByWjRGV1FBVVV5MjFvc0FSSlB0VHdiVk5DaElNZ2lXV0tnSTE2?=
 =?utf-8?B?YnM4MGp3RjNRMXBxMHJjM1ZTbHU4N2JvNjYwRE9STU0xblF5MmREeHlqMzI0?=
 =?utf-8?B?VTl5ZEI3MVZOa0V1eUs0c2crS0VjUUZOS3FBcWpGc3VXNlg0TWZwanA2ZzNO?=
 =?utf-8?B?OFNyNE5zTkJ1VFpBYlZ2T1RENkhIZFVjVFJqcS9PSnhJRkpEa2E4MlA1ZENi?=
 =?utf-8?B?emdVRFVOWnVwbFRZdVB6ZVc2WVBQOEd3NysyL1N1bWU1SWZwRFpHRnVuZzZ3?=
 =?utf-8?B?TXloaU5HdHAyVnF0L0hkV09FdU5KZ3lJKy84ZFA5c1lDYnFDcW95amEzM1ph?=
 =?utf-8?B?enJFdW4wN0loZmZXY28waDRLNFJHRGJaMmJWb2llcWp5MmFzVUJpamoxWEFk?=
 =?utf-8?B?WUtiYzZkdEttYWh1UXU5ankzOVVBcDFCU1dhQ2NUZktCVEovS3dITllVcFRq?=
 =?utf-8?B?RU14cnRmNnJFSjM2by90TnFMZllUNWlhZHZaNGJxZ2ViUWhlcjNIZzVHaTk4?=
 =?utf-8?B?NlVkNjRtZnhwM21vdWUrNGxSVnd6N0hYeUJlQnNkVkpMb09BTnpxQzBRMjMz?=
 =?utf-8?B?Zy9Jc3dDOFNPM3B4UEltbExZcE5wYUNWVDVuK2VVRjl2ZG9wTFc2dVFYa3h3?=
 =?utf-8?B?OU5EejVGaXhrdUlvRDRGNFpZZ3VOeGYyUjdiNWR1NEtnMUhzS3lxdGtnc1da?=
 =?utf-8?B?NmFRK0o4T043bnBZWWtIUjZrY2tKWS9uNUZoSm9yb3FKMUIxcjJmU1c3eUNv?=
 =?utf-8?B?Ris4UVg5eXFrYmJxT0JFNGJERGdJWk1PbUdYNFFZNjFkeDl5bkltNnp5MTA0?=
 =?utf-8?B?Y0YveFdWMlFiQmZONG9hejM1SWpKTXZlZEp6eFNSSk02SEhVR2h2UE1Zdllu?=
 =?utf-8?B?aVNjLytCOG9xMmZCSmxXZmNiMXh1K2t5bDY0WFZxVzQrU1NWRkpBUkQ2akMw?=
 =?utf-8?B?cU1VVUtDSTRWL0RHZ2hTKzdYZzlaOGtRZ2I0RjkzR2QzQThRK0puK202US9m?=
 =?utf-8?B?eWxldm9qZW5WR1plWnVOVkRpd0NZS0U1ZnhWeUllWm1sK0wyeUx3VG15N2Nx?=
 =?utf-8?B?b2RUemxjZGc4dnBLUVZwZnEzY0FacHZ3aFFIbDBwbEhRMWdBY0htUG5hYWN0?=
 =?utf-8?B?a1NiTGdMeHNtT1VuaUpxamRZbUhGVkdwTGlJWkY5MTdRaDhYazJFOHRXNmFm?=
 =?utf-8?B?bGNNT0s1VzZ5R3JXcjdYd0FLODcyc1hOOU1RZUQzOWtzZDhyeGFtbFNNM29a?=
 =?utf-8?B?TlFjT1NhVmh1M0cvQmMrTXo0aUxJbTMyZk9xVW5ENW5BL1FNS04yK2tmYUNu?=
 =?utf-8?B?WjRjYW80WmFKV0ZicElVcERiVUJEMUFrUXhUUWtTWWJVOWFBblBPT29oTFFZ?=
 =?utf-8?B?a3hqQytoYXVybHcwdVFURnREeHFFVU9ZSFo1R0s5UHpyeWpybEl3QlFGZnF2?=
 =?utf-8?B?SXU2aXlQWVhkb2hUSzllSmFtaG5RREo4TSsvTUFFWmhPZjV0eENUM3ZNV1Y4?=
 =?utf-8?B?bWZaVjVqU1lwQ1FzakNFRmJpMHhNR2MvS0FCdzdITi93ZHozdFI4bzhqSzM5?=
 =?utf-8?B?aXlhVXErVDhJNzRpMVlwUEFLcFFCM0pSaGhpSFBXcmgzZ0xZRVlrSHFvSmM3?=
 =?utf-8?B?T0MxWG5OMkI0WGpoRHE0ajM4RFdlMCtQYktvakpiWDdjTFJtQVkxaTJnUUo1?=
 =?utf-8?B?a21zd3dIb3FCaXI2dTZHSWszL3l6UFo4Q3ZxWGtyMmV4MnFJbEdCQ2tFQ1ll?=
 =?utf-8?B?bmxEanRxWHJ5VUo3aGRLWjhzeVFPdHVnTUZCQTcwV0VPTmJSQ2hWV0NBQTI0?=
 =?utf-8?Q?l8OJytYF0pw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkFlWk14MDN1RlpvSndDVDU0S1pQcnZTMUJjZWJYQjZWWUpqNnpoN1B3dnoy?=
 =?utf-8?B?YVV4bGMxUXdPNzFhTDkwWG90bG5Ca2I3WlRUa3laQlZyOGV6Y0liZkpwa21C?=
 =?utf-8?B?Q25QaG1SakJkRzNHTjdJSHQzaHNxSy9PbWp4ZEFEOStjaDZYMVVHcHltaU9l?=
 =?utf-8?B?WTM2K0xhamQxY0VjTnZsOVMySXRwUER4MnEzb2hJVmowTzhMaWw3ZkduSTV4?=
 =?utf-8?B?VnBUajVZcTc4M1A0cENtQkd6QWN5ZVBwVmNDeC9kWFhRazk0NlIwOVV4dXVi?=
 =?utf-8?B?T0F3bU5EODEvd05VOTBrOHZrb001Z2JpUGtuZlFpRzFYSWVXalU0K3NoeUpC?=
 =?utf-8?B?eEFoQlVTSUFxOGdTcUlQaWNVaWE0TExObVpEQncrZlU0TmxQVERrdU5vRE55?=
 =?utf-8?B?QlZNQVE0OUpYUEY1VzRDb3FWRWxhVUlHVy9rc1BGeHFGSnhxS2lJNjZ6WUsy?=
 =?utf-8?B?RGptZHlWWEN4VkI0dXVKMXpjZy95SmlEVk84YmRXTkRIYVBlUmFKakhtNytG?=
 =?utf-8?B?K2NkOE9vMkJyWkc4b3krV1FhSXF6UHpMUEtmOFExY1UxdDJMRUU0cDAwMG84?=
 =?utf-8?B?U2RhTTY4ZzV3cFkvem80VUR5bDU4cU5UWlNpS1p6MktNSm5qQTRxSVZ3UFNH?=
 =?utf-8?B?VzJtU3d2TklEWXRhTExFNXBSM1cvdzVydHF1b1BoRkxUKzRhckJ3ZnF1dEd0?=
 =?utf-8?B?US82WjFWdXRPc2V4SnhCTDg3U214d3NyVVhRcU9yQWZXR0RqNUdiaGc4alB1?=
 =?utf-8?B?M2FrWjE3cmg2WDVaKzN2WUpQV0kwNGtTWnFVK2taTzJ3dlI2VW95bk4yZGtp?=
 =?utf-8?B?MkhQYVBETW93d3dWOGpxS1dMdjVXdUlJdkJHT3JBZE0wbWpXaS9LWWZxeXFx?=
 =?utf-8?B?a2Q5OHZqM09SYkJ2VEpJQ1B1TEtZL2hoR0tRZ1RiT0ZrRVg3a2JlYVYycmwx?=
 =?utf-8?B?bkVWdXFXaTdUVVprYldNT3pRb2g1b0lETFZKYlRpUXpVaWpvcTlYNnFibkpt?=
 =?utf-8?B?UGR0TTl3QllLcTlRdG9YWTl0SGZCZTliN0FheTVDdERaUllkczRvbjc5UE55?=
 =?utf-8?B?cU9FN1Vwb0gxWGlCMUJHR1ZvcTdPS2hzb0hiYkhHK2crZVRxZ1krZC9iTE0v?=
 =?utf-8?B?bVBEcnFkU2llVTJidnBCVStxWXBQSEY3ZXRlZkF3ZE1NS1dpb3pVVUlKdEFD?=
 =?utf-8?B?YkNnZ0Y5TFY4ZFl3c2YwdUE0amx2L015bjFDbGJYRWs0eGJyekp0ZDRkaTFC?=
 =?utf-8?B?cEtRL1BUdVF2TWZ6Mm9ybDllK1l4dFZkK1Iwb0tIeVl2ZWJiT09yM25QUlZh?=
 =?utf-8?B?VE81OXVKOE5qRWVqWXFGb1cxNlVreURLSDliTXJVNjJkWmwwZG55R0xRcjlN?=
 =?utf-8?B?Q1ByY0F5bHpFNjgrZVZzZFowRVM3K016N29GeStJNnJsbHNtQ25BdmMxaTBS?=
 =?utf-8?B?RnIzR2hrK1plMzgxVGJ2RzZ0VnNqaHJUU25tVThISExST0FFcGdnNXpSeFFR?=
 =?utf-8?B?QjYrZDQ5bldFYXh6VVBCOVRENEhQR0daOGI0cXluRTEzTnRBQmVaeXpmYlg4?=
 =?utf-8?B?KzFrc1VORTFQdUlUbDFyYWYzTk92d2tYVjEyeGUxdzJIQlRIeTFnR0t1Y3dt?=
 =?utf-8?B?UVBVV1BVMW01M0VUampPZ1RqZ2g4QWR2bnM5djdXSG9mOVZuRjk2L21nUDlX?=
 =?utf-8?B?TW12a3RMK3hvZEpTOEFJRUhiOVlhVkRWQ3dXMUZGYTVCWHZGc3BlR3pKbUtX?=
 =?utf-8?B?UnZCSG52ZHdUMGhBMzNOM0U3cmZyZ0tsb3pwdGRFTTMwL0JQY2c1bzhXWGN0?=
 =?utf-8?B?TFhiWHNZT0drajNIbEdJbXhRd1BTR1EvOTNkVkZLS2daY1N1Q25BTXdZeTZ2?=
 =?utf-8?B?RGhzbUFWa0ZsTDN2aEZ4S1VTa2poenFrYzhGaE1xK2RScHN2VUdUNk4xNVVT?=
 =?utf-8?B?MWRYTGdXN3ZKTWp4eUZBajU5cXVVVm8wMGlvelhkZkVKRVZJM09xWU0rdWxD?=
 =?utf-8?B?RGQzQi9kWmdRUXlXc2dPS2ZiVFB3aVMzalFENzNLSEFMR0tXOURqL0pVOEcy?=
 =?utf-8?B?QXpCTkRMUEI0V01OeDFTOWNmS1d4L0xWV0Yzc0dkVGlISWNYelNETDRUUjNT?=
 =?utf-8?Q?dH+lDRzizEUVSWLIkK/VrWW2i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfaea681-7863-4e3f-2cc3-08ddc5403cf1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 14:43:05.1305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fDr3YUd5QRp4zz4OvMuJhQbHCFbO8GXE/AYD1NGwDg4BZfsd4Eyc5WN/j8NqgZXx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9655



On 15/07/2025 18:11, Alejandro Vallejo wrote:
> bootinfo-fdt.c will eventually contain bootfdt helpers that make heavy
> use of bootinfo. To simplify git history do the rename here explicitly.
> A later patch extracts bootinfo-independent helpers into bootfdt.c.
> 
> Doing so here would needlessly pollute the diffs.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


