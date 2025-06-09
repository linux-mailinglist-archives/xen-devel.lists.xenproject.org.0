Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7621EAD18FE
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 09:32:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010106.1388226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOWyU-0006uQ-0C; Mon, 09 Jun 2025 07:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010106.1388226; Mon, 09 Jun 2025 07:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOWyT-0006sx-TP; Mon, 09 Jun 2025 07:31:17 +0000
Received: by outflank-mailman (input) for mailman id 1010106;
 Mon, 09 Jun 2025 07:31:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1N5q=YY=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uOWyR-0006sV-Sc
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 07:31:16 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2417::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4cb051f-4503-11f0-b894-0df219b8e170;
 Mon, 09 Jun 2025 09:31:08 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS0PR12MB8813.namprd12.prod.outlook.com (2603:10b6:8:14e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 07:31:04 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Mon, 9 Jun 2025
 07:31:04 +0000
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
X-Inumbo-ID: b4cb051f-4503-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfuBlFgzuRytQ3Vecw8Uqz4axHrebsHyNSCTeZbwCJrsAvBVJtSmhuucntIkppqYJTxy+kIaCr6QfnDLqioe4BG9M0CZRER6qZN4AhHCM7BqReamFAjIj184yCVo3jaxyQJl+NbKph3710nv4hPIV5xKl/qL2ufGVxhqQqO/JV03JNwET2+VK90rKI5DZh02iwL7IGqj0i2lf6M62++j5aJJfV2W1OROvVCKjHlClz6W8wOhYHQ3hS0mcek0YFl6KbXcQR8I+OqAX3MfIwE0PKDEINOQRzdlFqH/KJid216mA7Le5ojgqP7bYzzoryeANLtKxbmiYC0uTWL16latsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/TamHO6pSL2Whnqo7Fx/IHd2dhXDBll+2sO2VIYHQg=;
 b=EdLuN2QVRJPfChk8E248+TzpsWrYvAem6m8+oehAG4lJaTo58L/5bTZHdbTFcp/y+kIWqnZaiSkEeqp6q5CQTAQgyndLq+lwducVU1AcrQTKeP8LZY/v/J0eMAiqbvHzG7QNtlOY1uG4jWb9QhYe2WyhgZ58Zcg4zJv4hejEk0ru/yHzATNynO3tVBG5u3qQyllJcdLMctqvt65SjQw70llWUbtKvM8w1jwSdcUfPAhupm7d83fxSk55Lgc7czzQ8CbUPcHuQvkl9wdKsy14UdxcgqnKnYLC2ixNem7E17lWdrtUonmXLujVAPjNTeDez72uJ/IEvsBztPjKpdKMmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/TamHO6pSL2Whnqo7Fx/IHd2dhXDBll+2sO2VIYHQg=;
 b=zYxtQrIJ46bEqmPaSAaUlX67auF9WngewmklUGa6/06Jj5Yr3u+F5utpaE7815lxuus3Px/MktcqurxArqV1ZnIPV8NPW1ngmG2gz+kQ90+8PCeV/Bhw/g10wE8eGZSvKECS4qPCUVq4jZsFxi1LLlOOSNXEg4QMGX/K9YQ8oTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e2249b3e-4e81-48de-9e15-e5dffb385dbb@amd.com>
Date: Mon, 9 Jun 2025 09:31:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm/mpu: Introduce MPU memory region map structure
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250606164854.1551148-1-ayan.kumar.halder@amd.com>
 <20250606164854.1551148-2-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250606164854.1551148-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SV0P279CA0030.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:f10:12::17) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS0PR12MB8813:EE_
X-MS-Office365-Filtering-Correlation-Id: 727300fb-0f18-4f46-986c-08dda727972e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkhGMENNL25Va0tJdzlBSExDVVpnRklDRHh5elhlU0gybERUWEFGUy9qeXF4?=
 =?utf-8?B?RGRSUndsL2dnK1kxbVBla2M0TVcrWUlYY3FpNUFrVnY0bENDaGgydUhhUktT?=
 =?utf-8?B?ZDhxWUc1STd2NU1WTVJiQTY2Nm1LTS8vY0R3alQzeXNzUTV4MnYydU42M2Jx?=
 =?utf-8?B?V2UyLzNKSkNJZ0JIMXJMUEVCaC80cGN5ZUxMbGVEQTFQbEdTRDZjdG5xK3Fo?=
 =?utf-8?B?aVRjY3JCVFh4L2tlU0tROUM2SVZ5c1Vpa1B6bVBLdjh0ZmFVb29OK3NndDcx?=
 =?utf-8?B?VEk0QWQ1SUVuV080ZzBDVnVQTVVhNmVhbWpzcHQ0MDB6MjdaOExlY0xEQXNw?=
 =?utf-8?B?NGRETS9ZTkwxU0p1cnlXVHV1cGhWOWJTanFwa1JYUWFsditPNEhBLzVmR1Fz?=
 =?utf-8?B?T0JsSXc4VnpwMjV0Nm5mTkRLVHAyRGprSWloeG5haFhOWXNJeEwrSkQxVlZn?=
 =?utf-8?B?U2hDWnNLY0ZvVXY3Tmo0Z3hUWEV2UVhZM1l0ZjJ6OWNtVGpxTjV6eFppb05V?=
 =?utf-8?B?SGE1OGpCbHdyWXJ2eE1mY2FncDFmWkFvUlFvcjNsOGRtUURGQnNIZXFJcTFw?=
 =?utf-8?B?WU9FaEZRY21WcnNxem15dWxWcVMrUzlFT1lXUkZ1b0JIZ3RrdW96eGoyeEdm?=
 =?utf-8?B?VFRUY2Z4dERXOFZQaysyZENRZmtRa2tPUG5vamw2Umt3T1hrSHppdWxuK3Vv?=
 =?utf-8?B?ZkVnUzMrckY4WjJJeVdkaUtmQ1hhdEJLbUtDdi9WT21iU2Z5bUdUdVFpdUxH?=
 =?utf-8?B?OWRTS1JvdmcvbWFHRG1UelpkMFNPaC9XNjRkWkZRRis4a2JoTzEvY08reE42?=
 =?utf-8?B?eGVsYTQ1UDJSaG53dkh1RktRRHZtSkpZTmVvUE1xUGZIUlhDT0xRL3VUemdx?=
 =?utf-8?B?REwwQTlkK2d1a28vWWVJVkIreEdkRVdpSXNLYjhJSGFtZjBjOFpEWmFvelNu?=
 =?utf-8?B?T0svU3ZqVERnQ1RWMThGSElucFhtZllMMFQ1RFhWRGR2SndVSlJ0bW9WOTBt?=
 =?utf-8?B?SERpbWRtaVJRdkZGNnB2c25la1UzOFFMbk5PZ0JnbGl2VFJnMHJ0WkVLd1FN?=
 =?utf-8?B?L3NPUGppS254TlkyVmNKZTg4WExLWWZ5Y1dZMjBxWGFaQU5CMXArbkRBOC9D?=
 =?utf-8?B?WktFdWozdWlJa2JkTG5jbzJ1cmxHbnh1a0Zoam94K0ZtMU9ORHpZR1FLb0FG?=
 =?utf-8?B?NktOUzlnc2FMYURWL1BvM3hJbUdmOU5CYVMzV3VRNitLVURWendVMEczQ0Ja?=
 =?utf-8?B?OCtyRFZNUEdUUTFFaHFneGNjazh3MTdSa2pVRmpwUEtHM21VZG1HRHphMXJQ?=
 =?utf-8?B?V1l5Q1dFb1FHWUNRWWVpTS9UcjlpN2NHcm5UYTc2WlN2SWlHRFRhaGJJRkJD?=
 =?utf-8?B?VDliYWRTTmk2RnFrVG5hV245blh4akhFN0JiMmxrdm11dXRaSyt2ZnVXMUs2?=
 =?utf-8?B?a3JXaVVUQzFaZzBkVUIvMVoyOXhOcmxvUGdvTWtuZ2lUalVibFVabHZEV1Jz?=
 =?utf-8?B?V1FrcHRidnUxU1drSWt4OXhCUXhWQS9WOG9BaU9wRjBsN2hRbjZ4eTB4ZTJq?=
 =?utf-8?B?cjQxbkk0ZUd0SHFQYTVXTVpmaTJ3OTAzRjBuci95OGhKQ0ovRG5LUmx0UzEx?=
 =?utf-8?B?V2FGYjZVc1R0dUZaOVFDMCtHZlM0VEtKNTRRWXNKS2dyOEVKZjhGK0RmYStp?=
 =?utf-8?B?SndQOVFGRkJkNWM0WlVQUExKU0FzZEF4T1lCWUNoZ25KNE81OGtlYkRFcGsw?=
 =?utf-8?B?YndDejFza2UxcGpWdG1tS3pUTXA5L0lLc2d2TWN5VEhnUDVHVWQzYyszd2FT?=
 =?utf-8?B?K2xRcVk3OUpVTVBCeWFUVUoyblRrYlo3SEowSDNybXhObWlUVUFwSHdEeURO?=
 =?utf-8?B?ckNEd3Fxc1NqR3NUM0RraGlwclFjMnN1eEFjRDNPbnZ3VGdZUnJKR0E1ZWZo?=
 =?utf-8?Q?3PwwIpqQl2g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDNDVm1DQUlzMVFQL1hrMHlLZkU2ZHhDTng5Y3VqbE9LYzVDOWpJdU5jbGor?=
 =?utf-8?B?QnArNU01ZWdxZnhva3E0NU5lOUc3WEJsNk9Bbyt1Z1ROT1pTOHg2OXo1TUFi?=
 =?utf-8?B?Uzl3NGc0eStTVlRxL2JHbWZab3dnM3VpeW1CeXYzMWpiOXNpNFRweDd3WE1Y?=
 =?utf-8?B?WnVPT25NOENiYzA4TGlGbFJ1TmpUZ2MrNlYrWjJyTmszM1lDbjJFNGRKMjJo?=
 =?utf-8?B?S214cDFlUTQ0ZnJiRlNnRUpmVGp0aXlHZEZTdkh0Vi9XcWVtN0lSbnJReEdW?=
 =?utf-8?B?RWRrVXArVzFZcFJvRFFOd1dYclNmVktiZWtjYVA0aVpxMUY1US9wMGVSLzNZ?=
 =?utf-8?B?S2FvMzJPUHJTbHpJMEZOeVE3MlNqRnJvbm4xRmtuUHd0cUxrWk1pMmJsUEt6?=
 =?utf-8?B?NVNSRjdMY21VQTV4dWhkM1pzdmp6VmI0cERSdzJlTWpYdmV4bmI0a1YzYTBM?=
 =?utf-8?B?eW82RHZIZVZwTjB5bTczM1poZVlXdzBUTEpZa0x3NzlTeTJnU09xa3o0WTFK?=
 =?utf-8?B?RGMxdktXZEZhQ09qOU9rTXU4Qmk2dE1ZNDIwcmN1YXM0MVl5K2toazRUV1FT?=
 =?utf-8?B?TXN2d01FMnluaEwwYzFPMmdvN1pmcGZpNGcxaE9BaGkrTzRwZ090QWhIU0hv?=
 =?utf-8?B?dXd1ckkwLzRueE0yL2tCbHgrZ2dlMjdLUUVEZjFNd0liamM4ZnlsZlI2V3d4?=
 =?utf-8?B?cTFFTEtDbU5wcGUzZ0FYeHhWbjh5RDZpOXVDNUxnWmJ5KzFHOCtUQ2FZSGx2?=
 =?utf-8?B?VW53SEV0elZyMTlNYktlZ2IvU3pCMWllMmZObWRtYjNDWFZkaXhreEVKUnhq?=
 =?utf-8?B?QmNNTkllMjdiTVZrb0dlZ2czUlIrK2s1eS93dGtFcGp2b2FVWDRxTGF2VVVy?=
 =?utf-8?B?VmdtTFhOcThwZHJyOHRqTndmSlAvUiswTXh6NDdpWVd1TEV2TVk1UnFhSG5K?=
 =?utf-8?B?VGNoU3FUZUc0S1pyQTF0d3FLanpqa3BFMUdmWWFEUkNwRndsZkxneEZ3TUlk?=
 =?utf-8?B?aVZJSDIrYnlhK01qSkMwVFVublZyT21hdk5mK0dsaEJERklVb1ZrZ3llZXQ3?=
 =?utf-8?B?dEc0QVV3bWJIVFFmY29XSzdxWlFDTmdqbkYxaXloenppU0dqU2JSYTFPbmNs?=
 =?utf-8?B?c3hLNHZMRGhnYVhjOHRhZHNmaEpEc3JDREhKa09uQTh2Z0hOeHBmRWNyc0pC?=
 =?utf-8?B?RElCMWhtYlVHUmY3RWpOUUZ0bi9tRktuU0t4S1lKZm9wbnJ3QjQyQnJSeHFK?=
 =?utf-8?B?UkNUMjJ4TlQzN1hWTzdUSkp3cTF4QWx0ajlpTlNLSkxiMStEUWJUaHVHVnd1?=
 =?utf-8?B?MWU4TEl2UE10dHB3WE4wMEozSHlhZjJwaTdzZ2hpendDRU9aZW5YNm41THFn?=
 =?utf-8?B?elhwNmNVS3Fpa3lLVXl4QmtuTFQvRm5hM1pOeWludU5uQ2k1S2tua3E0Sm1j?=
 =?utf-8?B?VGM1V0lPSWtiVFlTa3REb0U5V1dqWmFETXNPZ3NvbTZXTVRtM2E2VzZpYzRN?=
 =?utf-8?B?UzM5R2k3NWdRMkVHUzFXQnA2Mk9vRzV1WnBvOVdXVHJUaDQ0dmFvbUZFQXhY?=
 =?utf-8?B?Y1Uyd3pMcXdscFUxeEFxOXhLbCtOQUpiVWs2RC9OMm1MV0g2L2FVSkxITEgy?=
 =?utf-8?B?RzJXZ0xZLzJCeTd6TGpOQ2wvWWV6QUU3M0UvMTBrU1gvR2dXMGdQSTV6Q0k4?=
 =?utf-8?B?SGR4eGtUTUlVdHUvQnpFT3NmYUlmWW1SWVM0MENSY3c4bThLSUlwcUVWSWsy?=
 =?utf-8?B?VGpWWkZZU005VVhYRnNWb0wrcnBqVENYNG04MGlCK0p1TGlhOElaSjFIZ3cz?=
 =?utf-8?B?alM2VFdyU2lKNnNWd3oxTm4zdERWWVdudzh4RUdVTVE3eFdaVzdJcytOUXZh?=
 =?utf-8?B?ZVlZNkVGMUo5K3QrR1RreU1jWlBEekZZMjdMVkVVeGxLUlp4c1V1YXhTTjBR?=
 =?utf-8?B?Y0piS3UvUlNSNjlNVlpDWnBiVEplanQ2N3hUcm5VZXk0clFaTHZJY0R3SkpH?=
 =?utf-8?B?dmdWZ2daZzlIMlVuckRST09JR0dqMW93b2pIblhZK29ad1ZqZFhXR2d2OFdG?=
 =?utf-8?B?K2N1c2tuNDVrbmpEcVd6Zy9zSE5HZFJDZ2s4TkxVYUZ4b25rb3BkSm15UC9u?=
 =?utf-8?Q?/6CW9oAxlXaEYbyBZjLdGv+He?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 727300fb-0f18-4f46-986c-08dda727972e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 07:31:04.0970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3ckc4mxbRuDGFG7iYVGbtLtohPkEp1SLtof2qYe1Ml6ayUoPhfhXv8iWZkiv8MV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8813



On 06/06/2025 18:48, Ayan Kumar Halder wrote:
> Introduce pr_t typedef which is a structure having the prbar and prlar members,
> each being structured as the registers of the AArch32 Armv8-R architecture.
> 
> Also, define MPU_REGION_RES0 to 0 as there are no reserved 0 bits beyond the
> BASE or LIMIT bitfields in prbar or prlar respectively.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from v1 :-
> 
> 1. Preserve pr_t typedef in arch specific files.
> 
> 2. Fix typo.
> 
>  xen/arch/arm/include/asm/arm32/mpu.h | 34 ++++++++++++++++++++++++++--
>  xen/arch/arm/mpu/mm.c                |  2 ++
>  2 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
> index f0d4d4055c..fe139a2abe 100644
> --- a/xen/arch/arm/include/asm/arm32/mpu.h
> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
> @@ -5,10 +5,40 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +/*
> + * Unlike arm64, there are no reserved 0 bits beyond base and limit bitfield in
> + * prbar and prlar registers respectively.
> + */
> +#define MPU_REGION_RES0       0x0
> +
> +/* Hypervisor Protection Region Base Address Register */
> +typedef union {
> +    struct {
> +        unsigned int xn:1;       /* Execute-Never */
> +        unsigned int ap_0:1;     /* Access Permission AP[0] */
> +        unsigned long ro:1;      /* Access Permission AP[1] */
It should be unsigned int, not long.

With that fixed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


