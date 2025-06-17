Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2847AADD601
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 18:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018361.1395269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRZBL-0004Iz-Vx; Tue, 17 Jun 2025 16:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018361.1395269; Tue, 17 Jun 2025 16:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRZBL-0004HY-Sl; Tue, 17 Jun 2025 16:29:07 +0000
Received: by outflank-mailman (input) for mailman id 1018361;
 Tue, 17 Jun 2025 16:29:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DcaV=ZA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uRZBJ-0004HS-Ki
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 16:29:05 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2408::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2db3631c-4b98-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 18:29:03 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DM4PR12MB6205.namprd12.prod.outlook.com (2603:10b6:8:a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 16:28:59 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 16:28:59 +0000
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
X-Inumbo-ID: 2db3631c-4b98-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7cVa8Z33I7KqRzvPjBx6HkfptkHAAc90JcvF/5FXL2+6TBZuOqccye4hzlSfB2eLWpXP7fQOGLhJlLYG1a5GdOEGVRbxjORWO5cBHAbnCfvB25evJf/P6dD9RUlrIwzlZhrzX/VCBE7k1odr/PHNnMKEF0RBxEgtSMN0/6bVi0E6KyJlu7vvrEJz2XVDXFnIsIIDNfYU+OKis20ZbKEwcbq/qK3UJQ+iGjkjnrysgL+IZJGVOixw4I+lnFlqizFFR4Ea1Nzwf03wo76TnKgmrd2rwRSzwUhtg5wqzd8pLxL9wE2GvwYWPF1BHj1j1IA/oadzlCWHgxVtPpaeTd7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rz+fx19Fsuiha2f8OkeysdgWFIsl4ZRR/PssR75h0cM=;
 b=YG4xkcBVZRLe5+hFvO0aDIhxlLWcCvWkTeN2GvneeOyMayH4JoTf5JgUSwPZo9xf0+3BrSqSeTJ66+a4y5lw6yRL2L04Hsv4h4TW+RD9OOEY5McGVuSslqYj5vflsHroblp+kxyRCHprsApDySic7WdYlJAtulaC6iBTEZ0XnTvFtyRAg2GZ4YiQhZSFpFA8Xa4D/RIZKaNYPiRD6okbpAgGc5OTRIVonHQf7j8pF505ZQUwDDmRTL1UckjqYY5qbfy2FTpl3p0V7COrWmUMv0VwdQ+R345sWGc5sA/xiFgn/VKC1MkOk45EbjOaJPN6vp1jErdJ1NKg1I0wwoSHlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rz+fx19Fsuiha2f8OkeysdgWFIsl4ZRR/PssR75h0cM=;
 b=r2AUC+VWXt9ksoUe3wYmfgzku1+17CXvVcbbt+5U/B/6cEwozrYmdB1LBg1nPpHI0pHtP70T1TmnMYsN55YE2x6wxUh02KK9o6ZAwC3pTawf3Uwyql60/4/th1rgc4Z9CxplfZkaRhK1zRn3+VouG7aORnpSvQhNcVYWfa5+3vc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <cf8ef00d-e0e3-4187-87ce-8de743de8d03@amd.com>
Date: Tue, 17 Jun 2025 17:28:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm/mpu: Enable read/write to protection regions
 for arm32
Content-Language: en-GB
To: Hari Limaye <hari.limaye@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20250617111251.1711553-1-ayan.kumar.halder@amd.com>
 <20250617111251.1711553-4-ayan.kumar.halder@amd.com>
 <ooreogquosdrshq6zw552mwqewoaxjhlwnaqqfx4aoips7cat4@qrhqnnknuejt>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <ooreogquosdrshq6zw552mwqewoaxjhlwnaqqfx4aoips7cat4@qrhqnnknuejt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO0P265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::14) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DM4PR12MB6205:EE_
X-MS-Office365-Filtering-Correlation-Id: 25becd48-f54c-4e55-41b6-08ddadbc0ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmNVMklxV0VoVkFNcWxRSmhQNFRybStvclJwdDFRWmNibWZsZVRvMkcvWW9j?=
 =?utf-8?B?NVZDVU93SnVJakNwWFU1MzJqL3NSOXM1SGhFeTkzTnlRMmEyT1hxOUwxdFBI?=
 =?utf-8?B?U3B5TnNYczJsd3NlaU9qLzBrQ1dWZi9mRi92NUx5RmVKdy84UVB0cHA2OVAw?=
 =?utf-8?B?WVZ6cW1iMkZPOVp4cGVKSUJOSjVVaWFyekY1c0h4Ylpia1RVVWxEREZueEN1?=
 =?utf-8?B?YldHcm9YRkk1anVRMGxkdnlsRmx0YWtCNzNwcVJwQ2JsbFVoVFh0THo5N25m?=
 =?utf-8?B?NlFMNmhLd0xLSFpoUnBnUGt1NmNrWnV5VXdxUjFGZlhNUFE3RkY0SUxicXRU?=
 =?utf-8?B?azNmZzVmb2pmcUNHSnNWNkJFbUpITHVpZmY4N1lWdktLMHQ3dU5VZ0FTMmQ5?=
 =?utf-8?B?MHBJQU9rNEh6QTlSdW1qc0JjeUU0U0FOZnpiOUVMb1BTbDJORVd0aTZ1RzlZ?=
 =?utf-8?B?cENPSjZwbDFhS0RXTFo2c1NPaHB3YnhTdjlNMzZad25udWp3amdqVUpyRktS?=
 =?utf-8?B?cWtIMkdaRk5COEM4TjRlNGFlVFdZUHBGK3NjcFJ2TGVMWUpCMjB1bjROMUJv?=
 =?utf-8?B?TGtKaUFLVHY0VEhaWW5wQklzbERlSk82SHBzVDJxd2RiVUhhMHVCOUhLUHlV?=
 =?utf-8?B?S2dCWlM3RVhiYzZmZ1ZuaGJUcWlKRHR3c3h0MmlzOGZiTUlQQkVvUFF6aGZo?=
 =?utf-8?B?MmNXQk1NK1cyT1haMlZSck9PSkZ3M2lKMEF2ZlBlbUVUb3pLRjYrSmUxOWMr?=
 =?utf-8?B?MU1Rd2lNOXEzVVg2aGh2SnRTaEZhNVN2bTBwbGF0Z3c1S2dIRDZTei9yWkVq?=
 =?utf-8?B?bzB0SjhXYi9uSjdIRU1Uc1NDMjU5QVJ1TmFOaEx0TmZsa1crS3hVdHNrWlQ5?=
 =?utf-8?B?SG1vREpmZER0UkRlK1laT2w2c2FDdmFucTNVblV6QW5wNWJkcXlMYnlzSXlr?=
 =?utf-8?B?TWhPbDU4Qk02VTUwV2FOanA4bXNDZ2YvVXRqT3F1T0JzWEJ1Vmw3N0s5Slh4?=
 =?utf-8?B?MkpKL1J5bHNUUVZFVXgzcDNNRnA4a1dwY29ENDdqZm85UlExTUZwMWZQTEdI?=
 =?utf-8?B?TW5jeFVVdU5IdlpiR1ZnalN6WEFCelJpSlI0VS9CVDZpMEl3VGRrd2lvOXc5?=
 =?utf-8?B?b1FZTENTWDBwWTVYTm1CdUoyQllPTVFldE9MbEx5aG1WRTJBQlo1RW1wWTd2?=
 =?utf-8?B?WE1CQjMvOGl6R0IwbldHbTYrY0JJL0p6UXBKdTRGWkhYR2g5WEIvYUFKbzlU?=
 =?utf-8?B?VTdXazcxSUcvVlplaUZNUlFmU05CanZReUdtY1FDUE80UkZTbnAzUEw2aVlE?=
 =?utf-8?B?aUE4T1Q1eGkzMnRaaEs3aXlPbFc1d0NvWXJIMWpLVEE4a0hGL2xnMkp6MXpk?=
 =?utf-8?B?cG55UlMvcE1EdGp6T0wvWXlQbnlKQUdlZ2pzZDhxRm0yOUtCZXl1N21qbGd1?=
 =?utf-8?B?SGZOS2tQNk9jS2taNCtwb1M1ZjMyQm1QQVcwRGlvSGkwR1N4Sy9wVnloSXdU?=
 =?utf-8?B?NEFVekJaUWJ2d2RQVnlabS8yWWxITTBrcU9SeG5KeUJ0SDhmNU5MY2dPME9a?=
 =?utf-8?B?VGYyaWcxOUk3OHlmRGQ3UW5uQVlFMkNDVUhkNDcvOFo2QndRdEV5V1BkeVdh?=
 =?utf-8?B?NlRmeVlLN2psNFR0Z21GTEttQkVDSkRUN3RQZDN0RVZvRnlzbERTaThsVDFZ?=
 =?utf-8?B?ZWpGSStrVVhNSlBWcFBRUlRhTXBGaEpGdHBiMFhZcWFVbWxPVno3TzF3L1RR?=
 =?utf-8?B?ekp6MDVmNENKelhTanBvcjlLSW1qMHRRRERBdGxLdG1yeTR0VW4yb0w0L1Bo?=
 =?utf-8?B?ZzFrQnplTlZjV3l4cmZFdTBFUW1va2V1ZDMxck1HUHhvZW9EZ3Njb1JOdndC?=
 =?utf-8?B?MDdtRlcwTE1MU2draE1jaWtYbHNCVTg0RjkvZnFIdVQwMWhvbXF2MzB2Mzhp?=
 =?utf-8?Q?bLwn4PhHqgE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czNHNnNFWE91QUlXKzcrcFhsUEVFa2RHNlJia094MFdmTmkwT3drbHJsTlJo?=
 =?utf-8?B?YVUvc2RvaUlQWFZZQnUyek1pdHRqaTJXMzNhSG5jb1pmZEtTQ2RoblQ5ZGRI?=
 =?utf-8?B?eG0vK2dBU2JFN2VKc3o1U2g0aUt1b2pFL3VYWHpoSDVMNG5uVTBycWVsY0Zk?=
 =?utf-8?B?L1RCTjZLUUtMeEFaT3ZTRm9xUFpjbFNIbnVqWG9mS1VKa0Yyc0w1ZTlMemFy?=
 =?utf-8?B?RktYOTdjd0MvNENLR1M4QWpuNXFJQlllLzZFaGVSdEduTU95RXFGcTJPMzRU?=
 =?utf-8?B?b0kyZjRBL1Y3QWhrS0Uwb2tiTXE5d1R6MmdwYVE3NlRpQlI3b3o4QU1UTXZV?=
 =?utf-8?B?eUxNLzFONjJjWlJrWTl3U1QySUJ0aExWL1cxMXZZSnhPczJ4OWxObDA5OTBK?=
 =?utf-8?B?bGdQTVpMZm8yMVZoNndEdWVveld1WUtzMXF0RmpXUDJKTytUZlQxTW9MQ3l3?=
 =?utf-8?B?dzBlc2RtTTZjZHMyNDRmWnlsN2dLcEsxZ3RiUS9XaHM0ZWFGOVVkcEtkN1RG?=
 =?utf-8?B?cHliREFUMjFuaTdPeFo0eERjQ0NCc3g4YjJuMXZ2QzZ2UnNkN0FQc0hNeXFK?=
 =?utf-8?B?RUFDTHVoTldRamlxMzhYRVFkbHUramVHaERjcDM1SmdnQjFiblNPSGZOcXI2?=
 =?utf-8?B?M0dkcTRvSGdtQUVuTElOVU1kK2dNcndRZUtUTjRTUW1HSkY0Q3Q2WThhbHZn?=
 =?utf-8?B?R1dXbVpYLzNLOU9VR3l5MnF6RkxtN0lQeVhVVTRGV2ROcHdRdUVEREhXeFpE?=
 =?utf-8?B?N20waEU0VnZrQ0l5UXFMQ0ZoMWhib1I3VkFVQnhCWWIyYkZPNlFESzNsS0tw?=
 =?utf-8?B?UmNXWkU3TDY3VkZ0UlVSUE5XL21aWWlEdlpnWmZnMDNxblR3amNZSUF0eDBD?=
 =?utf-8?B?OUttQS9jWlN2cFQvOVFEN1QvSkNIaHc4L1dBVCtPSEsyb3UvQU5jclNMVVlt?=
 =?utf-8?B?UzZ2L2ZZQTg3S283emZaMlBXeXFha0ZiMXZCcHZBUndkWDRFL1V1b2czaitQ?=
 =?utf-8?B?dldGLy9tZ1pvYXpDSWJiQmJyZUpvdnZiZGpGQTJtczBpdys1cHd0SFlYdkhW?=
 =?utf-8?B?Wk5GbWNZRzBNODUxbjg0NklBQjFoMUQyQXA5L3k0WnlVWmE5cDhyaHJaSU1I?=
 =?utf-8?B?UlZiVXk4YllkdnRrTy9WOWgzRmVQOWo2emhpdDBmMWxnNGYvMFRDeWd4N1U1?=
 =?utf-8?B?c0M3cm05OGQ0WjFGUFMzZEVZYllBUVdSY1ByWnB0V1BJN3c5TnovK0U1RGhK?=
 =?utf-8?B?YTdOUjJWSmV0YWY1aTZhTWowQ1Z6SVB1Q2FSZWtVWFY5N3duV0ZhbjZvQkQ2?=
 =?utf-8?B?YWVlc2dUc2dXTE5VcFAzbjAxQ0dOeUFtNDlaa2dibGUvTXF0UTlSTmMza3Fj?=
 =?utf-8?B?VmU0MFpXSkduT0w4eWZwVFN6NEtEQmhNSmM2cHlhVGlqQlRaZGhaOU1yK1dF?=
 =?utf-8?B?V0FMWFlwZWsvb2Z4Rmp4bVAyUVI3T1g5Qjg3YWxJUjRvSE92cU9MZmVCUHhm?=
 =?utf-8?B?K0hvOTJ4NEJDOWhNRE5OOFVZSlVvQnFtTFdNbUcvZXlXYXo0UG9EWHR5SFl2?=
 =?utf-8?B?UkhoU1Q4cUhvQ09uNXJTQ0dISXBMYTlDVzdNLzQya1ZNYVVTRTQwdFkycEwv?=
 =?utf-8?B?UmNFNFpYYWNuKzRuTE5EVWIxY0FwUnRFd3BaM1FNTTRKckdRRHNHaDhhYVBn?=
 =?utf-8?B?WnZxajNSdUJtb1J2WHF0MFA2THhVU0J4Y3hCWFBVS3ZFMzl3NUZhS0E1bklW?=
 =?utf-8?B?d0pUT1dxOGJ0ZVNoU05Id29XZk9NTml6RWh4TGdVVFhKNmVuVTZHWmJCTS9h?=
 =?utf-8?B?RnB2dTNoMWtrUFA0dXByRXF2TWVlaTlJOEFtRXlIMEtvV0VwOS9keVpYSElm?=
 =?utf-8?B?R1liTTNJcWlQOE5Fa1V0c0txNFhiOTEzTDV5MXAra003M2IwbXZWc3U1Y2V4?=
 =?utf-8?B?bCswbGw5ZkxnY0FHMlZhbDFZMGJRQzUyL2lDMkVnV3JyRkcwRkRHQWpnWWFL?=
 =?utf-8?B?SWFteU1TVy9EajNTL0Y4ZU9FeGxDVFMwSHlJaE1RZW4xQmwwMEhHRUdlQjJS?=
 =?utf-8?B?aEwwYWpNOW9KWFB1eHVrK1NYS2g4QW8xTUhPWTFGaU5OVkdZa1BBUU44NzR0?=
 =?utf-8?Q?if9o2+XhTDSd8E3XgX2jY6009?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25becd48-f54c-4e55-41b6-08ddadbc0ff6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 16:28:59.2143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2iwHI5dC2A8uScRQkI1Df9bMwIjIO1Eg5wvt4NQJ/1JWxgIHtq4vd0J/oh3OEdpoPcuN55JfE34HikcI3vxeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6205


On 17/06/2025 16:31, Hari Limaye wrote:
> Hi Ayan,
Hi Hari,
>
>> +/*
>> + * Armv8-R supports direct access and indirect access to the MPU regions through
>> + * registers:
>> + *  - indirect access involves changing the MPU region selector, issuing an isb
>> + *    barrier and accessing the selected region through specific registers
>> + *  - direct access involves accessing specific registers that point to
>> + *    specific MPU regions, without changing the selector, avoiding the use of
>> + *    a barrier.
>> + * For Arm32 the HPR{B,L}AR<n> (for n=0..31) are used for direct access to the
>> + * first 32 MPU regions.
>> + * For MPU region numbered 32..254, one need to set the region number in HPRSELR,
>> + * followed by configuring HPR{B,L}AR.
>> + */
>> +static void prepare_selector(uint8_t *sel)
> NIT: s/one need/one needs/
> NIT: s/MPU region numbered/MPU regions numbered/
Ack.
>
> Also - it's not clear to me what is meant by "followed by configuring HPR{B,L}AR";
> if I understand correctly, once we have set the region number in HPRSELR
> and issued an isb we can simply read/write HPR{B,L}AR as indicated in
> the bullet point above?
yes, this is correct.
>
>> On Tue, Jun 17, 2025 at 12:12:51PM +0000, Ayan Kumar Halder wrote:
>> Define prepare_selector(), read_protection_region() and
>> write_protection_region() for arm32. Also, define
>> GENERATE_{READ/WRITE}_PR_REG_OTHERS to access MPU regions from 32 to 254.
>>
>> Enable pr_{get/set}_{base/limit}(), region_is_valid() for arm32.
>> Enable pr_of_addr() for arm32.
>>
>> The maximum number of regions supported is 255 (which corresponds to the
>> maximum value in HMPUIR).
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
> Apart from the above, all LGTM! I've tested compilation for both 64-bit
> and 32-bit and all is building successfully.
>
> Reviewed-by: Hari Limaye <hari.limaye@arm.com>
> Tested-by: Hari Limaye <hari.limaye@arm.com>

- Ayan


