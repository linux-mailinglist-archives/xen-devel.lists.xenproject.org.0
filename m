Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31786BC287D
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 21:39:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139185.1474689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6DWJ-0000lT-Va; Tue, 07 Oct 2025 19:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139185.1474689; Tue, 07 Oct 2025 19:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6DWJ-0000k2-Se; Tue, 07 Oct 2025 19:38:47 +0000
Received: by outflank-mailman (input) for mailman id 1139185;
 Tue, 07 Oct 2025 19:38:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JAy5=4Q=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v6DWH-0000jw-Vi
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 19:38:46 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b59672a-a3b5-11f0-9d15-b5c5bf9af7f9;
 Tue, 07 Oct 2025 21:38:44 +0200 (CEST)
Received: from BYAPR01CA0054.prod.exchangelabs.com (2603:10b6:a03:94::31) by
 LV8PR12MB9262.namprd12.prod.outlook.com (2603:10b6:408:1e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 19:38:38 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::d3) by BYAPR01CA0054.outlook.office365.com
 (2603:10b6:a03:94::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Tue,
 7 Oct 2025 19:37:56 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Tue, 7 Oct 2025 19:38:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 7 Oct
 2025 12:38:36 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Oct
 2025 14:38:35 -0500
Received: from [192.168.178.136] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 7 Oct 2025 12:38:35 -0700
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
X-Inumbo-ID: 3b59672a-a3b5-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/8Gq1h9dAecgf7HbCVwhRWGUtE6cwSxRFhruk7Qb+FbHYtnlcnivg3ao7uHSwvLeIyc+vOR/2SsGX9i2Ewm3Hk4HE9110YAb6oW/guHgSfcxJiAaJxHx9sAx+1Kgq2yos1UlYjDW8///Tefo3VP5XOu8m3xRC0SaMtwZahD2gPZ/Pnhj1IHa8kyPo25P/PaIfO6fmzOn4plNkw0QNh4lKM00hBUA62ZkT4XbxIWH0fVmrpJJhorcNNUOOu1YS/Mgo1nPx5qfOeyy4JYSI0O59i1UyzeLHmm84KkqXjHz3qTzpnzfCOj4xUw7ygGiKLFHAdOSrwGf5lKdF1/u3ZcbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjGkiM4NQhhkGV0pfxkfc085tHkjLE2xfA+8syp0u7E=;
 b=ZaC/MmOz0JCkBcML2BrGGYsa0LKCI4znM7V55vOOB0Q+weI66iXf8dfBrNrmSwxn1bsgiZoGe9Z3l+Qy+UmGaR3WXEdMLWd8ZOawzlFxHGFzeyGDuUErTKHKJOvAfTQOaMKiuUBKMMoqzWjRHCaaaKipz1d/2f4mRIBXk/kAxG3pnEzE5CzdB//K8A+q0j5WlJ5Iw4ccbiIg6uH4Ety54yLYFGLEDgyEUwSObzGdm286qbmlKqNCsoApEYgMLR/SAUeAoQEzD2aBPvlFUBLgRyHxzdVE71gvQ9m7dB0xbOJXTV35tY4uHLxZNkZj+tP2pRv80HAlIFyr3mN8XhAtPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjGkiM4NQhhkGV0pfxkfc085tHkjLE2xfA+8syp0u7E=;
 b=qhwhSKnSZpU5eGLkJvcbWi7FkQO4Ttu8jL6xrpaaEgMz+035Ahcp9y0QYsT8TzE+I4m9NhXj2T8H9dMDKAydOahqzCmYg80fn+Um3lZVmqH3u9xpT56HtP02ZnfcWYHQAqMcQ4eF+WPaEm1bRul2tQ3pCi1QHQWCKKt1+qroIVY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <057c91eb-c6c3-4e00-bf2f-6611181ebfd7@amd.com>
Date: Tue, 7 Oct 2025 15:38:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86: guard synthetic feature and bug enumerators
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
 <48dcc0e0-2772-49b9-9383-5bf69f922053@suse.com>
 <1439ec29-4319-43d0-b4ff-0eb5bfe9405b@amd.com>
 <c9d04edf-4801-46c7-ae6d-8479ef985972@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <c9d04edf-4801-46c7-ae6d-8479ef985972@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|LV8PR12MB9262:EE_
X-MS-Office365-Filtering-Correlation-Id: 0354197d-ea10-4f9e-6862-08de05d91ca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlZOdkhqcnRDTCtxMXU5UDFhbG5MallBWFlqQ0JHdDY0aFBnM2kyd0hueUI5?=
 =?utf-8?B?K1RObUcvTnBYWFJvU0FNYzgvQ01hVldIUnFiRmwrUjhhRkxCYWdQZldtSGdZ?=
 =?utf-8?B?THUxMmc3UjN2bFlURUZqdTljYmE4VW1TTElieXU5cFFqd2NIQS9odHo2YXhJ?=
 =?utf-8?B?WkhpTE0rYlBjaDlHRW1tNzhQQ2ZDV2g4MkpwbFBDd05nQWMra3hadkNnSDhK?=
 =?utf-8?B?SG9TNWd1QzVYOWxMK2JuZVNjOHhMOGs3WWJRSjZJUmx1SXNXQkhwM2V5MENq?=
 =?utf-8?B?REVFMlZYMWVDZ0pEQTdqUk01bzAwTm5TOENlRDc2a3RoNUw3enZEekdiTEdy?=
 =?utf-8?B?RU9tT2dSaGdkTjdrUjJnSzBLQi9DNnJ3U2JKSWZYak1mclUyeVNiTGl1UTZq?=
 =?utf-8?B?QWV0dHRYN2tQaFl1U0hNeFdTdnRveWgvQ3FtWlgybHJKT09PWWxvNE9NVVRp?=
 =?utf-8?B?TFFuSkRJTjBnTlErc1htcTNoTjU0OUVIZVlkZ3RpNU5SY0EvNlRWa0dodlZY?=
 =?utf-8?B?VVM5TVJuNmhqNTZrNWg4N1htVTRDZUpia2cyU1pvSkl2aW1MWXYrNWFnc2Fj?=
 =?utf-8?B?YS9EYkxieE14RGxxeGtzUkhYY01TUWczSUdkMEpocnhKd3FrK0wxdDd4aWFa?=
 =?utf-8?B?d3RieGtTRkJGUktGRkp5T3NJaXNud2RKS1YrYko2UDZZZzd1WVVvN0hXMmxR?=
 =?utf-8?B?cGxKTjVkTk9ia2tQM3l3dFRvTGMwaWw4VmxoUWVWY1N0bkJCb3JLeUNaM3p5?=
 =?utf-8?B?VE0zdlRwNzlRQjBOTzlzcmhhSUxYM2JPUUxmbE0vbE1uS2pDZGRialhTNUZa?=
 =?utf-8?B?WG1sRTdzcVdaaGtPVG1UTFpSWGk2eXpiWFIyT1BnU0EzRS9MRTUrUE9BZHAw?=
 =?utf-8?B?bG9lOEdRc1ZvRkF3cWVtZ0VoM0o4TVVjdCs0ekFxWVlDV04yQnh1bndwVHR5?=
 =?utf-8?B?QUZCTE5WQzJZbUFNR21TVVhUYnRIbS9kM2ZSdFV5TU1oRGtwUXJ0VUtic1BQ?=
 =?utf-8?B?VnljNWdrLyt4dFpTVER3dUYzRTJabzRlN2RNNWVnL0Q5a3orTEN2aWFwZ0R6?=
 =?utf-8?B?aTBqdS9YY3JSSnVpMUdTR0h0Z3o2d3hhR2pCdFhKK01yNjlOQURGb0tRNWZ1?=
 =?utf-8?B?Y1gzTUxmbHpXNGFzZE5zZ21ld0pHeDJTZUtoamJMZWtlSmlHMzF2ZzBycENB?=
 =?utf-8?B?WTd2M2haR2NucWcrN2hZVjUwZ1Z0dW9UTkRlSFJYMW9hUkpFR0dpL2d4ZEdr?=
 =?utf-8?B?UHVkeFlCSG1pOWVscWdmNGQ5UGNnNTNheW5hUzJCSUk1VkloU2xYWWtqNmdr?=
 =?utf-8?B?Q1lrcnlmakRDb3ZxTHJCTEJLTkUvQ3p2Z0hzNGpDMjZLS1hwV284K2diK3V0?=
 =?utf-8?B?NTMrKzgxYjFyWkNFeEN4MGdqdDlRZWRaQ1VjLzB2QjRFTGJLVkNTcVFCRWEx?=
 =?utf-8?B?L3kyenN0VXlmeEo3NzZIc2E4RzlkbUNVdmJzbTc3dldoc3ljWVU5bzNXRE9N?=
 =?utf-8?B?ZU1nTVBLY1dIa0E2MUtLZk5EZ0JwRHVRUU44OHUxWVp4SVdsaStYZHg4bC83?=
 =?utf-8?B?NDd0RVROWkN3eHB6K1FzcjZ2V3BncytQd1FKemN5VXhyYURiMlBpVklIZDBV?=
 =?utf-8?B?NXc5R2c3WjJrR1NaV2NLTGRaWm9YN085blhGUmcwNDZxWHdvditXTnZYa2tN?=
 =?utf-8?B?ME9VcFJlSmFXaXVjcWw5aEc3ZHFkSThObWxnY3IvTERzVjlEMG5OKzYxQ0ll?=
 =?utf-8?B?K21sY0tKL0txTlBuR0dyd3Z3ODFIS3AwQ3FkbEgyRGFVeS9DQVNiY3duQkRP?=
 =?utf-8?B?b1oxeUcyNldKdlo3S2o3M3lYZzBEUG5OanVVemc0UUduRkEwd241VHRMVHUr?=
 =?utf-8?B?QW00TG9VeFdHejIxVWQ1Ymh2bEZLMmtWaTNxRzRCYlZQUTVVZlRpdkVWWmJr?=
 =?utf-8?B?bzBvL2ZYVE1aVU9LUGtjYUJaNW9nSGV1Q3FwUDdTN0JIS2VEb3k0eEZBazFQ?=
 =?utf-8?B?dnZ5Ky8wRHR4RFdtSnErR0Jzdkhta1ZUY1NJUDhnRXp0c0dtbHRLWTl2bEtU?=
 =?utf-8?B?cVppanhYaVU1NlNzYUR6a3hlZ0g2eUJpcjJ2R2NLakJ5dy9seXhJbVVKekhF?=
 =?utf-8?Q?URtA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 19:38:37.8556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0354197d-ea10-4f9e-6862-08de05d91ca6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9262

On 2025-10-07 08:22, Jan Beulich wrote:
> On 30.09.2025 01:36, Jason Andryuk wrote:
>> On 2025-09-25 06:48, Jan Beulich wrote:
>>> --- a/xen/arch/x86/include/asm/spec_ctrl.h
>>> +++ b/xen/arch/x86/include/asm/spec_ctrl.h
>>> @@ -73,7 +73,7 @@ static always_inline void spec_ctrl_new_
>>>    
>>>        /* (ab)use alternative_input() to specify clobbers. */
>>>        alternative_input("", "DO_OVERWRITE_RSB xu=%=", X86_BUG_IBPB_NO_RET,
>>> -                      : "rax", "rcx");
>>> +                      "i" (0) : "rax", "rcx");
>>
>> "i" (0) is to work around the trailing comma in alternative_input() and
>> does nothing?
> 
> Yes. If more such "uses" appeared, we may want to introduce some kind of
> abstraction.

Thanks for confirming.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Though I also wondered if just #define X86_BUG_MAX/X86_SYNTH_MAX 
combined with a BUILD_BUG_ON might be good enough.  Your approach avoids 
the extra define but is more complicated.  Anyway, just a thought.

Regards,
Jason

