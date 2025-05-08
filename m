Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0478FAAF431
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 08:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979014.1365756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCvBv-0007cU-4W; Thu, 08 May 2025 06:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979014.1365756; Thu, 08 May 2025 06:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCvBv-0007Zp-1K; Thu, 08 May 2025 06:57:11 +0000
Received: by outflank-mailman (input) for mailman id 979014;
 Thu, 08 May 2025 06:57:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiTB=XY=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uCvBt-0007Yw-Kk
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 06:57:09 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20627.outbound.protection.outlook.com
 [2a01:111:f403:2009::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7b5a440-2bd9-11f0-9eb4-5ba50f476ded;
 Thu, 08 May 2025 08:57:07 +0200 (CEST)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 BL4PR12MB9506.namprd12.prod.outlook.com (2603:10b6:208:590::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 8 May
 2025 06:57:03 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%3]) with mapi id 15.20.8699.026; Thu, 8 May 2025
 06:57:03 +0000
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
X-Inumbo-ID: a7b5a440-2bd9-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeespZwsHXly5dvdO5PYQLOKT6iVfQ5ua2XQ4NVOppXGSUEZK3CHdOF06zzDBAvA+rtOnvR9OfEecHA4YRejJqc8ieds9A1DY26lYpvN7F/0I1MO9cDFabJNP/xSpj57qX3ZQVjaD7Z1t0FRF80Cb4rURAzZjhQqnR94aDF8g+S0gbfwHW97ykPDaIT6SnixuL8XBEN538S0wTIgopHOrcGDpoCsth8hqdt6LxdXlyqVBC/Du3bxLhsU/np2eXDcvV6IVhDRL6+agKP22JLw0zV3qgp3bdUo/tYSGQOlJyAvDEbmczLbnbmjRXeW52PQz0aAZlqngn2Ox18TOY+hWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fkPwAMOp4RrlCimDfX482BQVD3/fdFEG27YxMCYuPc=;
 b=QBTtJbRh4+NyE5Bvu+GolnvS4KkHOcjp42X+7VKf9jX7MbO+npM+ylK1pNxJbXoA/8QuOx6vamWy4y54kC/nDB1Kqgp7LEl4TNqs3CZwzy9TzGi3d9UXKCHOSqbWPb6MBwCltrZS1JxBX9n1cdYk8dlKjy7Jr00RdL1aiOjk2xtqy9FRUTqyaOgUcSl1+Jxc6/gZEo4fhdqFNFw5nCnPyLdfT2dLqmIhGnJdJUNmfD3kQJhr/WXGqslAiOYCiHN0JBVWP3Hb/k/6fA7V6URLlPdupx0pN1PEWGBU7qdzvpQw1Gmuu2ns4/OGvjtT2Afv9NNR+xp9kd1ZYAW8xfcXFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fkPwAMOp4RrlCimDfX482BQVD3/fdFEG27YxMCYuPc=;
 b=qkPS3WCBjI1R3HgDSfpBfLy2cAfkEZECdlEp3xtZDg4xny5fvkfwiEaHEZB3fOs/02csePXBShAznPgYtCuYVeq0tIiAPPF6luxBHlTAR98EI1MymvYjfGrSwp3Dd7fu5dXXsdN3JCcclpNlZi9sw0DTKwZAQtkf1oL+hi/gnX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7ad1dde2-0af3-4a8c-a67e-3eafdea5822f@amd.com>
Date: Thu, 8 May 2025 08:56:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] xen/arm: fix math in add_hwdom_free_regions
From: "Orzel, Michal" <michal.orzel@amd.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250505025631.207529-1-stewart.hildebrand@amd.com>
 <20250505025631.207529-3-stewart.hildebrand@amd.com>
 <fa800ffa-eec3-4496-b157-f89d10b3650b@amd.com>
Content-Language: en-US
In-Reply-To: <fa800ffa-eec3-4496-b157-f89d10b3650b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::8) To DM4PR12MB5277.namprd12.prod.outlook.com
 (2603:10b6:5:390::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|BL4PR12MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: a419b740-61a2-4de6-d33a-08dd8dfd8988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RExqeG1GanFpL2x0cTZ4dW1ZekVkTzFablZlWjlQUjRmOG1LY0h0d1k4azM1?=
 =?utf-8?B?dFNZQm1vbVZMVk5mRStQWUNmTy9BdW8yNEFpOElBZEpPOXBUakNNbXZrcFVJ?=
 =?utf-8?B?Z3VCbTJvNUs5WktyUUc4QnF3QTVRYXd1YnJiWFRabGNwdkN4enpjNmFrTkFM?=
 =?utf-8?B?Ry9VQ1dpcXZRaEJudU9HcFN4S216OEhHSTJGOTVMOC9hY0N4MHpkVnVjR2cx?=
 =?utf-8?B?Nmg3b1hzb1hob0Ftbnk3RTFZYjNHK0RrcWJURk52czhVYjVGZ0VEK3VDU0I1?=
 =?utf-8?B?WkFjeDBXZms3L0VBZStNeCtCejM0bUIySWVjRkZFM3l1V3A2TjRXQ1RqdVhk?=
 =?utf-8?B?SkZMM3Roc3lUYTdSdUdvSzNFMUppcFpIRkFXYzRkUndxVytnSE1UcDNIWnhi?=
 =?utf-8?B?RXZjTmJMTnFwSzJCbndJVEdPSm93U04wUGYxbSttUDI1WTVCY1hRNkhUMW5X?=
 =?utf-8?B?NnpxMEpJTExFYllMN3Y3amdZMDc4bVJDcUVqMCtpVEZ0NTJwYU9Ma0E4SlpR?=
 =?utf-8?B?TWxaYzdWckNiRllkOXI0VDBhLzZrbGJrU3hlcnBxbmVRSkdJRmNBRTI1OHNQ?=
 =?utf-8?B?ZFl3N2cyYlhVc1NYNGs0bVBYNmFncUFiUVViRUF3c1pYK2RIRHhGZDk2ZUhW?=
 =?utf-8?B?UWRpU1ZyL2JjY0U2U3gvZlY4T1p4RkR6bDBJOWw2UTF0UVVNNnlsSThjajBN?=
 =?utf-8?B?Vk81Y3UzVnEwclM0b2s2Z3A3Vm5KTVBjcFF4R1dnaTJ6ZU9tVjRjaWl6WGl3?=
 =?utf-8?B?M3dJY0RLS1lMU2FiTCtoRFBib1U0SHcyRmF0dzR6U09LRmR6NmtRRnBYQTFl?=
 =?utf-8?B?UFRLbWpkSkNsUm5vbFcxdFh5UnM3cHhGNVZzY0NWRVRYZHRRcTlXQUU2cmxH?=
 =?utf-8?B?dHVtNWYzcXNmVU9rY0hncmxSeUtST21wNmN1ZDVlMk5Dd1ZGTjhBTlMyRm9t?=
 =?utf-8?B?VVIwTHQ2MFJtT1dpNGR5QmRROTNrbjhoZXI5dS9jbkcyK2U5MW5rUW1zby9l?=
 =?utf-8?B?eTZzZE9Mb3dsc0dwb3hoM3dQVWo0VXMwdHBndTFGT0NqTU5POFoyVXVtQ0Nm?=
 =?utf-8?B?ZVVZcU5NSlhjU2ZqRXI0VEdFaWFQa1JuUWwwazNWVkNTdVUvbTJvcUlRUlhn?=
 =?utf-8?B?ZjlSZzNuaGhicldqKzVYUVd1Q0hPTnAxWFl4YXgxSlllN0JsYmtjZ0JaNmFp?=
 =?utf-8?B?M010dHdpVEFQRjN2N3Jhc3YwTnZ4eFVKMGpKRjZaN0RkOC9YVjUyayt1NnFu?=
 =?utf-8?B?dTJoRG50NHd4c3R5S3oyaDJzQUNiYzZxY3RSaTcxV05PYXQ1M1Z5NXdLcEhV?=
 =?utf-8?B?dWFvaGtiM2pJb3hSM2tqUjJabjNwSjdPa2F1dXczTk5jTzgyZ3ovcWlJQUlY?=
 =?utf-8?B?ZTVQdkhZRi82end4amFBMzd2VlEzVGduSlZoQmZtYVZ3MExzQXJSTkJFUG1B?=
 =?utf-8?B?c3I5SlBON1lyMlIyTTNObUVsVEluR0NVMVNSSVJ6NDY1ZmNybUpVYjduVHNW?=
 =?utf-8?B?S05hMlNFeUxUVUgvT2kwT2dkcDlKMlBiMVRRZ2NNQVZtUFJ4cDVtTWpZZXBs?=
 =?utf-8?B?RkhER09xMGpFV3pyQUdqMlZRc3JWeWI5YlpBTFBvOTVaWlNGaXBhNlNVaTZV?=
 =?utf-8?B?d0dNdVE2SkZDalBPYkpKdUtzb2RHNDYzRVI5NnhHQkdLMVp4aFFnb081Qjdn?=
 =?utf-8?B?R0YwTXI0TXFYQUkwTzk3bm9GT2xlN0d6TFFSUHVLNis3UWF2OHBCek84dmxq?=
 =?utf-8?B?K3JhL0VTRDcydkFGeGVSa2FaRGt1VlY3SmlpNVVIR1FoRnZvdWJEdTZPYk01?=
 =?utf-8?B?NTZrMDJ0VGthVGJ4QTdCTlk1bjhqMUFidWhTSEFwYittMk1lcWpKQzI2dVg1?=
 =?utf-8?B?VVJweVB0aU5SM0U4VVJldkZqdlBKTHB5SHhYb0hEVFIzS0Mvb2NhTEdBdFRk?=
 =?utf-8?Q?xh7v+iqP84Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWlsemNrejFKRmRGdjVOZjR3dFFNa3czamRPem9MOEpIV2dGMEdSWTcwY3BQ?=
 =?utf-8?B?cXNOZWFRYndzV3VKaUtCM0JUdTAwOU5kbU4wcGR3cTZBaEVlUzlEYlRyaDk2?=
 =?utf-8?B?SmNkYlpIaXZoTTZ3c1RQUHNrU21WK21VMVBVVnd2OXc4TGI0NmJZcHVLNUVz?=
 =?utf-8?B?MHRHd1V5NDhsY25mZHNmVUhCU3JwYk9qRk04Vk1FVWNrZk5QaTZld3k5MlZM?=
 =?utf-8?B?NXpyN1ZVUU40V0J1ZWpFc011ZFNHOVlwNldKV1hHQ21IRHBSVTQ0bjVZZ0FO?=
 =?utf-8?B?aXBZUVhtWmlTc3d1Zlh6MlBMY1BPYy9CTmZJZmZXRzViSFNwK2VPTUhpMTRO?=
 =?utf-8?B?OS9HVW5iOWNQVDhmYkQxbnFqcVhPYnprRE5LRlc0WEh3eE84eE5xb05nbWd6?=
 =?utf-8?B?NWpmNjdKTnEyeUR3QkYwZkd3N0N2OUpadWVIWG9GRDVLaytJRld2eEV6NWQ3?=
 =?utf-8?B?ZisrbEp0SzV2TDl4bHA0bG14cHc0YXBEOFRURXBvUVFqcXd0RzE5YWJ1RjY3?=
 =?utf-8?B?aUJYY1pUK2phajY2MExDZER1S0g3U2JiSElzQ3pSS1gzYVhCM2xrcGFrZzV2?=
 =?utf-8?B?REphVG12c3NTNTdMZUFEMUsvMWhPZG90MTl1SE52a2t6VDY3cjJnMithaEZ0?=
 =?utf-8?B?ZEpqNFpwYUVhaWw4WTRpZyttWDJrM2V1dUJ3L0NoaW9rMk1ML21sNzlHRmZP?=
 =?utf-8?B?TnNZZkVaUlV5VCswUmRWNFFsWWhBcnV0MVo4YUhteVVQMlRkV1A0SkFnYlNz?=
 =?utf-8?B?alBYdzJqa3NTbGQvMHNtQjVneHhCSU9rbjFyNXJaMW9tTzRkdWhhWVpLd2p4?=
 =?utf-8?B?UU5Xcm8yZjdvYlB4ZElUNElzSlZnSEdoOExsL3pLYmpGTlVJSmlOZzVoSlIv?=
 =?utf-8?B?MEE2R0F4SlhSQ0VMbjhYajlud0ljeFpVZjNXT3ovSDJYWjBodmY2M016N2xV?=
 =?utf-8?B?RkN0eDRSaHZ2bmkrN0dPSVdSOXhKT20xYnI4YmlxaXg5YmtIbWdhc01aa3RP?=
 =?utf-8?B?cHlySS83NHkwSWVFTVU5azB0LytJV1Rob1BUQXNDYS9rMUlBWTE5Wnh4NkVw?=
 =?utf-8?B?N09OVzhlUkd2TFpuMzRZYzhKZkZCRDFqTVlIK0ViVXZ3M2JsempNZUZ3a0hI?=
 =?utf-8?B?OFYvK0xSejVtdnh5RTViWmUvc0NVbDM2eXJERDZsdXpLaW1zSU91NFo1WUNU?=
 =?utf-8?B?Y2FHcG5iTE55aTNUYjJONXM0MUpDNk10RURJK2pMdFpWZGU3cFJDbS92ZkJo?=
 =?utf-8?B?dXhudjhkUmxPT3pHdnh5UnFwOWJTZEd6Y1A4NFhseWtpWlB6dzVkMWVrWEl4?=
 =?utf-8?B?TTN5YjlPQmZZZSs1VFFRV0NLRUU4MVJVeFZMV1BZZ0t1MDgyWnZ1ZWhLTWRZ?=
 =?utf-8?B?ZFpoOG9Ed0h0WEhyU2hWa1N0Y091ZytmcXdXQkxva1luWkhYbE1kaXBienBq?=
 =?utf-8?B?SUsrR1hrSEdWMlZEWnZNNi8wVkVNTnF4eFQxU2FaYzhzLzl0YkRrNzFnV2NS?=
 =?utf-8?B?TXBpV3RWcXQxMEhNSjNteWl6b0hlNDZac21YQzNuVmhPL1piaC8zYkhjclhE?=
 =?utf-8?B?WUpySTN3TUVzY3ZVaWFHOFNaODJhVHZUMzRXbnA0RDBqN0pWTVlmdk9TMXg4?=
 =?utf-8?B?aEhtM1RKWlUxMDJaR011NUJPQ1paV3lnTDUxVVYzTXV3SWpQdFlCUGl1M3RP?=
 =?utf-8?B?QU5zOFFHUFRvTDFqWFVRVWt3dEd0K25xTys1MHdRemYybkEySS9FT3o5eTJi?=
 =?utf-8?B?L1VMeVFzbjVhRGtGWFczZ003Tk8zMzRGT2VUekZ0bE9GMWJZNVJBVDkzNVNZ?=
 =?utf-8?B?T2M3dFc0SEMzcVFIQ3VFcStUVTJHbVBtdlZLUmk5dldBakRZZ3dLbnVhdGYx?=
 =?utf-8?B?aVVSVHNya1lIN2wwbmo2L09uVzlkbERTTEFNQk5zT2VjemtwOXVXK0JmMTV1?=
 =?utf-8?B?eFcrRDBRYjNkcDBrdFcrMUc3WnRyN284OVI2cjV3WnpLdDJoejh5UWVTK1BC?=
 =?utf-8?B?Y0dMMFpvL29PczIrODl6eGs1M3dwMUVrUyt0UExjd1Iveit5bE16S2RuWlNa?=
 =?utf-8?B?b3ZDNDZVeDRyNGtYbGRRYnNyVjZIai9BT2lEYkZoc2I1MVdIK0lKQldkT0Rk?=
 =?utf-8?Q?h7aK+Va3lZxyilGCZ9UvRQ6oc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a419b740-61a2-4de6-d33a-08dd8dfd8988
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 06:57:03.2745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YCLiueqXu4YyleddC96eBD48cJwKYvTmPRnEwzaYt+4k6L8mjCKQdHcp/wu2IWI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9506



On 05/05/2025 09:52, Orzel, Michal wrote:
> 
> 
> On 05/05/2025 04:56, Stewart Hildebrand wrote:
>> Erroneous logic was duplicated from add_ext_regions() into
>> add_hwdom_free_regions(). Frame numbers are converted to addresses, but
>> the end address (e) is rounded down to page size alignment. The logic to
>> calculate the size assumes e points to the last address, not page,
>> effectively leading to the region size being erroneously calculated to
>> be 2M smaller than the actual size of the region.
>>
>> Fix by adding 1 to the frame number before converting back to address.
>>
>> Fixes: 02975cc38389 ("xen/arm: permit non direct-mapped Dom0 construction")
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Acked-by: Michal Orzel <michal.orzel@amd.com>

I wanted to commit your fixes but rebase is required after recent dom0less code
movement. Please do.

~Michal


