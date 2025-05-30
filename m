Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F56AC89D5
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 10:18:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000566.1380789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKuwS-0008SU-L7; Fri, 30 May 2025 08:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000566.1380789; Fri, 30 May 2025 08:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKuwS-0008R3-ID; Fri, 30 May 2025 08:18:16 +0000
Received: by outflank-mailman (input) for mailman id 1000566;
 Fri, 30 May 2025 08:18:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lvem=YO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uKuwR-0008Qx-GL
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 08:18:15 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20619.outbound.protection.outlook.com
 [2a01:111:f403:2009::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ebe99da-3d2e-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 10:18:10 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY1PR12MB9584.namprd12.prod.outlook.com (2603:10b6:930:fe::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 08:18:05 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 08:18:05 +0000
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
X-Inumbo-ID: 9ebe99da-3d2e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHDplm62WNdoN4Z9A9cLq7T70xwhcx6Usf/YuALWaUE2bYgJzjDQg5zAHkRHExTStrg/XK4z1KPwo3j6BInzKf+jVLA6C6dmxFEGec53NQqf6cCk6BpSFj5ivo3g3CEMbcQt81AadElUy+iFQBifSwl/gPJwi8AAnbV5AYN7FSeYnG9l8go85IHFiqFSMb8JouzmxMXUZjfJ5taa9w1rMoAQe04tpIZeRuIBks1aeSIRADuQmpHbo6nm1HsR/Cs4Vo/DUpi0hqVtRMzBXrT2dBMAtoe/jXMuflhT7RCrb4NFrDeL2NjfB78Cs6tGYK3Gig7W93r/BKKdzzhYQzCPsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhPx/AGVqxZhCRAMMu42SXVL5byD/L6962a20PXDjy8=;
 b=bpkWJR13BaJSoUX9E738LplMN0WyHIUsyEE+ShaG40NVGCbYhzABVWIo4+fLTc73OtIW7RkQ690ZkxdJGBFCVVxy41uNWQXQghvCuGvylm1q+2yyM99F9JRSen+PoNdmcBxzq2eH0lGnjHCCX0p0Ewfs+oGm4Bezat4H6OxkndoJwSSB7pnKeYqcHCWwOa2i9W5nXJiMbb5LN/xgFMdhDVpbeunmIDLTqhi8VNRpjcuja2oRkxFUSbElnTUjdpMpnCmL6ZXZ9BeleTKaM2rtN8K8jsBXXSxDzcp5lMTq1UNR81BLZTwhKT1FbzKAsmV8ftNXUEXF/MYyNTXHUlWF4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhPx/AGVqxZhCRAMMu42SXVL5byD/L6962a20PXDjy8=;
 b=i8ZC+KfJsK5i+1B0SKc1flmZJG6mq22QH5WW5dTXGfArs5iaEjZxizGhzN3vZcsxiVnEwUTUxZs+BDnO8pyYMduV6cBQGO990yDU2yOzPXsrx7vhDUrDa0X83jkcF937drxviYROQDOdNWlXPZcwb+an4IqDLRGDIg2OI7NBFEE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <01bb344a-6ff4-4a1b-8251-0451773dc275@amd.com>
Date: Fri, 30 May 2025 10:18:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: vpsci: Fix typo in comment (SCCC changed to
 SSSC)
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <3881310bb93e20fd7d28d067e11ec9d19b68c60c.1748547428.git.mykola_kvach@epam.com>
 <83cc8e35-b670-4a56-ab5d-5356a44394c2@amd.com>
 <CAGeoDV9dMtbEGXm-gL+93jn7_8fGZwz4a_RHdwgpZ0kFyGXWRA@mail.gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <CAGeoDV9dMtbEGXm-gL+93jn7_8fGZwz4a_RHdwgpZ0kFyGXWRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0323.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::11) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY1PR12MB9584:EE_
X-MS-Office365-Filtering-Correlation-Id: f3724e6f-11d3-4199-7d24-08dd9f5280b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0NrTEhxVnBKcXdhT2UxcktMeHdSakxaUHN5aHRyWW9qZzFnaDkyR09DK0xo?=
 =?utf-8?B?bC9lVmJvRGgxeXlvNzg2aUJIVTkyS3Y4dGpNTmM2d09lUTZiNlEwWlFYbm9l?=
 =?utf-8?B?R3B1MXBVdGxLTE1MaDlpRitjK1NWYjBQY3NUbWNvcmMyN0ovaGU4NWxvTmZa?=
 =?utf-8?B?Mm1Xb1JUblF3d20vVTl6K01zWHAwNUtHRDgwczJVUkFYcDZhVC9RcUt2L1dn?=
 =?utf-8?B?bWhkRzJUKy8raGhBZ3hBQmF1WlI5ZE9UelFpb1dNSE1sNHNtOFhSNnpxVDVZ?=
 =?utf-8?B?cFFjbDMraGFFWGQ4R1VEbnBydGZLcFphSGhrK3pIWU9HYnl1dXNrZFpOYzJE?=
 =?utf-8?B?UTZIOHc3Y09Xak1sUkxzOXlzSS9jdit0VnRSRDY4dnc0dUFFNStVMlhHTnZ4?=
 =?utf-8?B?MFRkb0UvUkFDY1dSTE1oaHJjK21vMURSblVpYytWYStDYUpQejBST09nZWNR?=
 =?utf-8?B?eTBnYU5jeVFaVWdlZ0NPNWtTbUE3VTY3K3RyOHVrc2ZSd3dqUkVBZThCRGgx?=
 =?utf-8?B?TWxRUmV0VWk5dkF6dXFEMDNSTmZQc3dBS0VCVXZ3MlJLYUhJS2NWZWhTV1l1?=
 =?utf-8?B?ZGtvWXp5UG11YTZNSnFiM0QwUlgzNWkwNEYxeml5NExYMVZ2Wnh6TXZiRWtu?=
 =?utf-8?B?QnZ1elYrbEZzTnE3empEUktOTCsydDJTUlo3Z2FNWkpzcE90M0t1YytONEJN?=
 =?utf-8?B?UkVWLzdLMERyR0xueEZwaTIzMTlZUEhtREZ1VXJKblA4SWlxby9lN3BEL1NQ?=
 =?utf-8?B?YU5GVWxzaWVpcWVCSWFqSjU4UC9PbWxSbW4vT0psTHpmMzNzYVVGYndjZkNy?=
 =?utf-8?B?YXd2bzN1S0d2SnFCNVVCQVQzekVzM0VZanRYSU9DOXdWZVVmQkkzS1dLMDVR?=
 =?utf-8?B?TmJGSDB4dVFOV0M3MWlDb2tlbit6RUJqT0NTeWpRWm1MSmQ5QU5lUEMwaWhF?=
 =?utf-8?B?b0ZQRmJ0NTFtRGgydlFKQXhQQVZ1cE9iZ1JZLzJVREppa20xTHlrTjNodDJ0?=
 =?utf-8?B?cThNVFFTN1JCOUxPS0dQNm9VZmFKbHQ0MlBmN2F0dkY1UnlnOVluWGdJZ1lj?=
 =?utf-8?B?cTRCU1diT0wrd1JuaGZ6MGFLV2txRndueC9saVNTMlRzM2tzbk9IdTh4dGRC?=
 =?utf-8?B?RlEzQWZaNUM0SnFoeU5QRzJnc3I4eHppMHMwRTlKdVJ0R1l3Z09lQVhaL2lo?=
 =?utf-8?B?UjQ1M2UvUlUwY1RrdUJEdmlJV0Q1dmF0ajJJNmtKY2oraTBKR1BnUGlKTTdD?=
 =?utf-8?B?UDNMSFZmblhWM3RGMk01YnFOUkJsKy90K1dUeHVhS00xMFBoaDl5b28yZXJB?=
 =?utf-8?B?QjZBc3U2Y0lMaDFNSS9pOTJXRzA2OC9TY3lBeE9EenVxWGNJT0pYRkRJS3I2?=
 =?utf-8?B?SXkvRWk0WXAvVWdIUnZiYjV4Ym80Q0hiUENRUUExajNWZzRyc1o4YktvYXJ5?=
 =?utf-8?B?MElKS3JFaENCR0Mydlh4bmhLLzcwTnhielJKcjBTdFNtcDBxWTFIYW5xSVF4?=
 =?utf-8?B?cW02OHVxbUN0TUxCMWFSV3Era0p3cngrYTlTMWZQM2NkalpMNXZpRkhrTTdk?=
 =?utf-8?B?Z2p6Vy9lSTd2Szd4M0p5WmR4SlNFeUIzTjRrMXJ2bkw4UnpVR1NYVFBrR3Zx?=
 =?utf-8?B?Q1RRbUZkMVpKYkgrM1ZMSThxb1dlamJURzJndEhBaTJIUzA2ZzRXYTJWdC81?=
 =?utf-8?B?ZmdkU3JrM09NMGpCM2dpNEcvYm82ZzM4WkoveDNIUlhOK3VaQjA1SXdhRUhr?=
 =?utf-8?B?QlpHKzRTTjJYdWRLY1VmUzN1bm1vODQvNkJ0Zm5aeTgyTzYvN0VYUm5PTHVC?=
 =?utf-8?B?TmlvV1pBdWhMMU0rdGJxSnJtclpGcVpqTkxCbTJ1SS9rSExoSVJHQ1N4Qjd5?=
 =?utf-8?B?cGdIOXBINFpmM3ZZUzdHRjN1Q1pLR1RXVUY5UVI2QkhSR0NZMGIyS2UwaHht?=
 =?utf-8?Q?maQzzos+0jI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHRzZTIzUktKdG4rYmxwOU5OcG5CNDU4SXh4SnBaN21IRGVqNmtaSEJCU3d5?=
 =?utf-8?B?WjEvVEFrbWlwdlhhVXY5ZEZpL1g4WGFoeWZrOGRXaktTZlNBTzU4Y0tWYndL?=
 =?utf-8?B?Y2xTaXFpdWhYay9oNmY2OEZHb3N3U3lNbjhnaFhHdFZkZkZTMnJ4cDIwdThm?=
 =?utf-8?B?dU5IVXI0RVovRGZrajlxTVBmd1g0SzlZbnEvckhQUUI1blJlVmg5SjJJbmJn?=
 =?utf-8?B?YUxKSVpjblRyY1FDMTlqT3BNYWl1ZStmYjZ2SGNRNzNsTDBjUCtpMzA5QVk4?=
 =?utf-8?B?QnRva3BURTFIc0ZqNDNoOVZsWm02TDdQczlRVVJxZVdxdzJwM2M1a042Y3RT?=
 =?utf-8?B?ZVh6cDJHMkpOR2ZBTDRVZDY5MkRWUERITzVOcjhvTkhBMjN3ODVDVmc0VlJF?=
 =?utf-8?B?Ui9wQWNOMFdRdDFZMkY4VTBiT3JEVmw4RVJia2o2bGlGd0h0eTZYUmRNVFMr?=
 =?utf-8?B?akNKcmRlbUp3bFZkVWRlQzNzc3ovakQ1MFo5L0lSdk9TUFRseVpSR3VibWZ2?=
 =?utf-8?B?RThFZEwrTUxoaXg1V2IvZmRsd3VNY01INVRic1Zra0xNZjZ3eG9zdGNzWW9L?=
 =?utf-8?B?dWRxSFNpYksvOGNSK3FBSWt4S3Y3RHVkUFI3dm1xdHRCcy9TZUh3c0w4QS94?=
 =?utf-8?B?ay9ZS09tOUlWVUJHOFlzZ0wzeUp5dU96RU5RdDJ1U3JJVlo0aVpGK0dqWWZI?=
 =?utf-8?B?aGM0TDJOdThkQVpUNnJ6cEIrZkhwZTNpZFJlcGZVUGxXa1RzQjkvaFpnL1Av?=
 =?utf-8?B?Qzk5TlJDK0pvZGJnVjFxMjZzMFdVUEFoS3llYlY1cXBOZGlNZ3l0Mkg1dGNa?=
 =?utf-8?B?Q09BU1ZjUVJ0a1hzZEQxaFlCa25TamNHSXZVUW8yWnJqV3d6aVhWVjMzZk9B?=
 =?utf-8?B?RU5xTUhlcUxYWUkybm1WeTUwamxpRWNueFR1cjNoS2c4Z1hDajBRSExqYVB0?=
 =?utf-8?B?aUhkT0hjbDlEbG84eVBaalJ1OTcrTkc0eHYzOTBXY3FUMllXajI0cUt0OFB6?=
 =?utf-8?B?eUs3Tmkyb1BHak1UN1VqVFNaQ0Fkcnk5MS9LN29YREtDTGtiN2JVU1BsVzBm?=
 =?utf-8?B?MUJrQW1ndmZDSlFqU0Nad0lrU2szUDdGbTJ3WDZReGNoNFA5NkEzakhmODBO?=
 =?utf-8?B?c0plbmk2Z1VqbW5RTXZoNUNKMkU3Nm5sdHdzOXFWeDFSSGVHUlEyUzFXdnR2?=
 =?utf-8?B?eFRlS1UxQ1Zjc0pxaGRzMXI1U0VhOGlCS3pIMXdTVkZGaVZhdkIzWFByUjBp?=
 =?utf-8?B?dVVmV29hSElUMDJWUjI5L0ZPNDdsenM1UmFBRFZWd0I2YUk1RzJ6WGVwNXBv?=
 =?utf-8?B?L2p5QWJzMzF1UUZYZWNXWWJra0h0ektuM0g0WlRxQUo5ZEM3WDNmRys3QUp0?=
 =?utf-8?B?cDZCQ0NzYzNtS3MyZy9LOGhYb0tPNVdDUFRVRHMvWVVkWmlXL0gwdng3QnlC?=
 =?utf-8?B?OEllUzFoRXNiSDA5VGdqakpCZ1hsVzJqSHhhQjdkRGRnOUk0TmxiRmxZaHRy?=
 =?utf-8?B?VFZDV0R0UlA5NHdldkRYMzhiSjNtVWxSUWljTGZYRzJIdG5YV0lhYjlwNzNC?=
 =?utf-8?B?cFVpVE1CUXFKR1JwYlY1dEVZclI4OXR4ZnRZcWtmMi9GZVE5bnpWbGlySmlU?=
 =?utf-8?B?VjBvZjFxeG9EdTh6Uzl1MlFuL3Vsd1lidTVGTnVoTldNcEhVRWw5czNqQ2Zu?=
 =?utf-8?B?NGJ3S0xKQmIxdVJaeGNNcXN6YnJ1K3VQUmlmT1dUaUpKOVlOZ0ZicncraUtk?=
 =?utf-8?B?dVI4ZU9Gc2ZoYlltSm94RjJXN08wd0JUbFMyWStuZUFlZkYwWWlNcHdtamVT?=
 =?utf-8?B?WGpEN2NIbjRZTU4reXhrbHA3c0FnYW0xZGk0dXgyNVVwZHpkYnQ3UGlua2hx?=
 =?utf-8?B?SGpEaHl6TGNaditCcTVsOENZb3cvRnJvTE0yaUhqUmZzSlluV1NCTnREQWZZ?=
 =?utf-8?B?ODU0MGx1Vms0SjAvWE83RVZSaWZjWXAyOFJUZ05RYytFb2c4S2JqN0hqV01r?=
 =?utf-8?B?NEhkcTdLN08yUG5HUExoYkdKMWFTdkNGc2psbE5jTUNHK3g3Tk5lbllERE5l?=
 =?utf-8?B?TGJPN01FckNYbzc3SGRmeW5nVzNiUk9PenYxMmxLZTVxVkFaVm5jRmtER2NP?=
 =?utf-8?Q?39Xc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3724e6f-11d3-4199-7d24-08dd9f5280b9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 08:18:05.4245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/M2WYC78arD3P8z3u9xycEMBiQVPCYwnovpzrVHnGOlFnC4c7zd7ldGpPxwBl5M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9584



On 30/05/2025 09:43, Mykola Kvach wrote:
> Hi, @Michal Orzel
> 
> On Fri, May 30, 2025 at 9:43 AM Orzel, Michal <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 29/05/2025 21:40, Mykola Kvach wrote:
>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>>
>>> Corrected a typo in a comment within vpsci.c:
>> NIT: use imperative mood in commit msg
> Thank you for pointing that out. I’ll correct it.
No need. The patch is already committed. This was a NIT for the future.

~Michal


