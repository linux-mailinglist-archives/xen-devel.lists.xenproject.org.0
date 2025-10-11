Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C79BCED0C
	for <lists+xen-devel@lfdr.de>; Sat, 11 Oct 2025 02:32:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141339.1475808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v7NVf-0006pX-TW; Sat, 11 Oct 2025 00:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141339.1475808; Sat, 11 Oct 2025 00:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v7NVf-0006mR-Pn; Sat, 11 Oct 2025 00:30:55 +0000
Received: by outflank-mailman (input) for mailman id 1141339;
 Sat, 11 Oct 2025 00:30:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWuz=4U=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v7NVe-0006mL-Pd
 for xen-devel@lists.xenproject.org; Sat, 11 Oct 2025 00:30:54 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a33a7fe-a639-11f0-9d15-b5c5bf9af7f9;
 Sat, 11 Oct 2025 02:30:52 +0200 (CEST)
Received: from SJ0PR05CA0063.namprd05.prod.outlook.com (2603:10b6:a03:332::8)
 by BL3PR12MB6425.namprd12.prod.outlook.com (2603:10b6:208:3b4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Sat, 11 Oct
 2025 00:30:44 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::3d) by SJ0PR05CA0063.outlook.office365.com
 (2603:10b6:a03:332::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.6 via Frontend Transport; Sat,
 11 Oct 2025 00:30:44 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Sat, 11 Oct 2025 00:30:43 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 10 Oct
 2025 17:30:43 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 10 Oct
 2025 17:30:42 -0700
Received: from [172.28.217.164] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 10 Oct 2025 17:30:42 -0700
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
X-Inumbo-ID: 8a33a7fe-a639-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ew0WLqiJdLAGZ2+urJojDChHEO/Ep3+1orDnJNJD74fmblnV+PiGeWtGOVLnLNzW+5pGEyc1tWqqMLLCABSbQ8vwk7Tz/5oaZP806Wkhdcj2K3SKe0ZinqaKOBXAyrQFphy2JoOMFF+OptbP/JQFdD1fam2TmwEtU3tb8SV+Zjpwm5eeo1C1/ro8+Svu8v/1clUIHWjooTWeLiE0TOjW+/YCsFJlY8xc4guRy5an4AnnNPCg29gKIFP1GHkprdzX3r5PZaQo30ILD04uFuZj2+4YK05LKzZvdcnSsnVtZ8utAXLcxMwLSFoSGpDViVp9aXgwSdSlwWAAjf0EQIEeUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHPTNJkGoogf4KZ3qDka5bjf+WbdE69cYaeQ2wBDJYY=;
 b=MmrXGvWpUW8RiHI4Y2W4Kh3AprtAtjroww07tWLF7bLQ///+kNxSB1G8AQ2Y3dCube4P+Np1tB7h1W5bejYYlyK2+QGIbQYSuYfyaQ6jR4El0iLCFiZgAs6BNBfboOiSSlQcGp7FH98Ucm3iOGAYlsDJq14W4uLKMxKU46971W0LU/mtOCqhDlF+JGi9LVFmttxZ61r2oBeTnqxG+Gyg+F4BDjuDoywCmXjMbB0z7aYvIUd90ug1X0W1R3RtTuSK0oGU/N7n05AF3pNPrFN89SqXpbGC8MaDHcqoWn8M5mKip239ZJ1+nx+samXpsyQKi7tyasawh30q+vdDtGeQJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHPTNJkGoogf4KZ3qDka5bjf+WbdE69cYaeQ2wBDJYY=;
 b=TWv2gFXkOXdg9BJKuRkQBjRXJ7DFQBZlAACYQ78r7IOZvNDcyYfprJlTJJCO8wgTBoBMsqKBfufbaMjAjguMYD6cIbW4E9Hh1DgGL6nSQ6fRZ4MKbQSJZNq/7i+feYrSEdBxNBgjt2Sq6M47bmNz/M3U2NoVAzyqtihRh2XvKxo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <6a546de3-0e1d-4de2-b25c-acab646bc270@amd.com>
Date: Fri, 10 Oct 2025 20:30:42 -0400
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
 <057c91eb-c6c3-4e00-bf2f-6611181ebfd7@amd.com>
 <b241871b-0b86-497b-afb5-86a0aa9813ce@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <b241871b-0b86-497b-afb5-86a0aa9813ce@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|BL3PR12MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ff2941-03b2-45c6-89ba-08de085d6a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjVtSlBia2ZnQm9uVkV2a3h1R3RtWnNJOThlVVFDc29ObzhYTzdaYWV1MTdm?=
 =?utf-8?B?c0xZNXc5d29aMC9Eek1KQlcxYzRkdjNJc2QvTnBGT21WeGIyVVF6UkVra1hY?=
 =?utf-8?B?WDFGbVBLeElzSnhrYnp1NlRRV3k1bHhFTGVYWERCeVR4K3oxUlZwT3VDcmt6?=
 =?utf-8?B?aTM2eDZTTjFOTnJTbzA5WnZaRE9mMmhnWmNKNUgrTmpqeEFOQUlIYzFIUncy?=
 =?utf-8?B?Umg2S2loTytKYktYbUFrdUtsdHhoOTc2WllxRExFN0Q5MHViQWpmREV5Uitk?=
 =?utf-8?B?cnRpTmd5NVIzQUoxeGRtd041ZjE5WDBPWjJPQlNtVlp5VUNkYmJjb2dtV2dk?=
 =?utf-8?B?SWd5eXV2U21BZWlBZFozdDk5MjI1eDYxd3B2ZU5hNU1jVTlrMTFLdFhSNmJ3?=
 =?utf-8?B?SzVuS2lZQnpwVHZqdjY5T1JHaTEzWWFJUXBKVG1zaTdYZ1R6Q21jVEtnSm1D?=
 =?utf-8?B?OEdsRmdSMk5UdENiUFRUOWZHb2xmODRiL1lkOHgrWGtPVVhnK2JlcDVraWVn?=
 =?utf-8?B?T0lDUXpRM3hFZUtzd1JmaDAwR0J0NFV2dXlKNWdmUzBFMWxaSlM0M01aSmk3?=
 =?utf-8?B?UzB6L2hZMktuRXFmTWZOZ2Z5NFo0RTdJWDlaYW5BbjZuQTVZNTdESjhNL0NC?=
 =?utf-8?B?N1JGUlVwRVJsdG11QXMzRDVmREErVUFVd1J6SUZRNkJldDZoaXc1YVVwQTVW?=
 =?utf-8?B?S0pQaGFWbE1QWHZLRHY1ZmhNbTFQcFlZMHZtWjcrTXVjMkVPaVBNSmg4bHdn?=
 =?utf-8?B?eWVaamtoc0tXTTdXRXE3d09peVdMbEFtYnRmZE9rMDU0OUNTMm5hdGwzWTc5?=
 =?utf-8?B?bk41ejlCRU1QKzIvS0habThYbUhlcTRJL2xuVzEwa3ZhMWRxbndGbk0yZlk2?=
 =?utf-8?B?ejk0enRWUkx0RUk1N2VVbVdQKzBmR3VTc2lrMVlwcFB3ZXV3NXNVMFgrUkdI?=
 =?utf-8?B?dFlMeDhVR3NZYjNFMStJdktaUEg5bzJZazBSVjB0ci9xQVU1bE9UeDJTYlJl?=
 =?utf-8?B?YU9iVGEzQlR5MDBpVEFORlozTCtSK2dLbVZDSVgzTTBuY1MyR2RMU1A5eUtk?=
 =?utf-8?B?bEVnTjdhN0R6VEZZTkw4UitUVExYVm4yNm9VQ3BHVHNrajAra2Rld1JvUnZh?=
 =?utf-8?B?NVlicUlyZlgyY2hLYjh4dHNabHdIY2hPa3EzQVF1NVVML051bCtoS2RpM2xU?=
 =?utf-8?B?TitoNlpsOHNRbWNRVWRFZ1hvRDJNUVNOWW5YVjFyM2FDN0g0SHBBRFREYUVr?=
 =?utf-8?B?bDR0cDhSRUQzcDFleE9CSEN5dXlEMUpZOFVuOXBjM2pqRlcrMFlLMzM3UHR3?=
 =?utf-8?B?SFBHTUVyOU0yRjJ1cis5bVN0UWgvNEg4UElqVnhIQ3JjbGlMZzhSVHNDVU5Y?=
 =?utf-8?B?VVoranZNSEc1bU9TeGJOZ3VkeFdvVEoxclZCNmdmaEdFaU42V1puajRSQldX?=
 =?utf-8?B?RG1tTnNyMnVXSTV5d3BjN2RKS1pvNEN6M1FlbS81QjMxT1BwZDRjZEFwNDVR?=
 =?utf-8?B?WFY4K2oyRHV5WVNvQ1MxVWYrMGpsVVdWNTdXbklUTzVtcGhqUGQrdW9YbE1h?=
 =?utf-8?B?QTdRSFpLaU0wc0JITEo5WjRUNHZvZFFWdWhrbkhlQVhMM0J4U1FjS3JCN0hI?=
 =?utf-8?B?T1dGOEkyTk9rM295ZVhtR1ZENjllaG03OVJnZmErU3M3SkQ5dytCcDBOamFS?=
 =?utf-8?B?ek9qai84OTh6V3VYSmZYRFlHc0kzSmM0QVlmbWkySDFsaU5RRlZEUWJzYlp0?=
 =?utf-8?B?VFlGVXNiZHloaDNoamg4VmxtUzZSMEhNUzAvendkMTNrcmg0WkNGa2dFNmxk?=
 =?utf-8?B?UGdvaVJUSEdOdi9tdkVSYnZlSTQzclJWQ283SEUzVTYwdTM2V05zOVk0YS9M?=
 =?utf-8?B?Zy9zTFR6dzcyZFplYmVIU0hpVWI4OGE5dmkvVHpqR2tuUUdacjM3T3hWR2lC?=
 =?utf-8?B?c2NxdkNtRHg1blBDZmM2TkxtSHVGVC9HMi85QnlKWFc5eTg2M1l4cjlrdFJE?=
 =?utf-8?B?OGRXemFRK3dYbDBMbE1IdFIrdXdLVE1qMGx3MERhN2ZlMjkvMWZBQjJUb2Rq?=
 =?utf-8?B?akh1YVJiS2dsdlcxVExDeVE4SVlLSGFKTXl1YU5vSS9Wc2tMeUNNOTRIQlNU?=
 =?utf-8?Q?jFck=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 00:30:43.8652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ff2941-03b2-45c6-89ba-08de085d6a34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6425

On 2025-10-08 01:56, Jan Beulich wrote:
> On 07.10.2025 21:38, Jason Andryuk wrote:
>> On 2025-10-07 08:22, Jan Beulich wrote:
>>> On 30.09.2025 01:36, Jason Andryuk wrote:
>>>> On 2025-09-25 06:48, Jan Beulich wrote:
>>>>> --- a/xen/arch/x86/include/asm/spec_ctrl.h
>>>>> +++ b/xen/arch/x86/include/asm/spec_ctrl.h
>>>>> @@ -73,7 +73,7 @@ static always_inline void spec_ctrl_new_
>>>>>     
>>>>>         /* (ab)use alternative_input() to specify clobbers. */
>>>>>         alternative_input("", "DO_OVERWRITE_RSB xu=%=", X86_BUG_IBPB_NO_RET,
>>>>> -                      : "rax", "rcx");
>>>>> +                      "i" (0) : "rax", "rcx");
>>>>
>>>> "i" (0) is to work around the trailing comma in alternative_input() and
>>>> does nothing?
>>>
>>> Yes. If more such "uses" appeared, we may want to introduce some kind of
>>> abstraction.
>>
>> Thanks for confirming.
>>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Thanks.
> 
>> Though I also wondered if just #define X86_BUG_MAX/X86_SYNTH_MAX
>> combined with a BUILD_BUG_ON might be good enough.  Your approach avoids
>> the extra define but is more complicated.  Anyway, just a thought.
> 
> How would that end up simplifying things? IOW what would the BUILD_BUG_ON()
> look like that you're thinking about? After all X86_{SYNTH,BUG}_MAX aren't
> meaningfully different from X86_NR_{SYNTH,BUG}.

Originally, I was thinking something like
  XEN_CPUFEATURE(PDX_COMPRESSION,   X86_SYNTH(31)) /* PDX compression */
+#define X86_SYNTH_MAX 31 /* Bump when adding flags */

and:
BUILD_BUG_ON( ((X86_SYNTH_MAX / 32) + 1) > X86_NR_SYNTH )

Not automated, but adding a new flag should make it obvious 
X86_SYNTH_MAX should increase.

But as you point out the redundancy of X86_{SYNTH,BUG}_MAX and 
X86_NR_{SYNTH,BUG}.  But we could re-arrange to make X86_NR_{SYNTH,BUG} 
calculated from X86_{SYNTH,BUG}_MAX like below.

Again, it's not automated, but it should make it harder to miss 
increasing the value.

Regards,
Jason

diff --git i/xen/arch/x86/include/asm/cpufeatures.h 
w/xen/arch/x86/include/asm/cpufeatures.h
index 0a98676c16..724eb1599f 100644
--- i/xen/arch/x86/include/asm/cpufeatures.h
+++ w/xen/arch/x86/include/asm/cpufeatures.h
@@ -7,7 +7,6 @@
  #define FSCAPINTS FEATURESET_NR_ENTRIES

  /* Synthetic words follow the featureset words. */
-#define X86_NR_SYNTH 1
  #define X86_SYNTH(x) (FSCAPINTS * 32 + (x))

  /* Synthetic features */
@@ -43,9 +42,10 @@ XEN_CPUFEATURE(IBPB_ENTRY_PV,     X86_SYNTH(28)) /* 
MSR_PRED_CMD used by Xen for
  XEN_CPUFEATURE(IBPB_ENTRY_HVM,    X86_SYNTH(29)) /* MSR_PRED_CMD used 
by Xen for HVM */
  XEN_CPUFEATURE(USE_VMCALL,        X86_SYNTH(30)) /* Use VMCALL instead 
of VMMCALL */
  XEN_CPUFEATURE(PDX_COMPRESSION,   X86_SYNTH(31)) /* PDX compression */
+#define X86_SYNTH_MAX             31 /* Bump when adding new flags. */
+#define X86_NR_SYNTH              ((X86_SYNTH_MAX / 32) + 1)

  /* Bug words follow the synthetic words. */
-#define X86_NR_BUG 1
  #define X86_BUG(x) ((FSCAPINTS + X86_NR_SYNTH) * 32 + (x))

  #define X86_BUG_FPU_PTRS          X86_BUG( 0) /* (F)X{SAVE,RSTOR} 
doesn't save/restore FOP/FIP/FDP. */
@@ -62,6 +62,8 @@ XEN_CPUFEATURE(PDX_COMPRESSION,   X86_SYNTH(31)) /* 
PDX compression */
  #define X86_SPEC_BHB_TSX          X86_BUG(19) /* Use clear_bhb_tsx for 
BHI mitigation. */
  #define X86_SPEC_BHB_LOOPS        X86_BUG(20) /* Use clear_bhb_loops 
for BHI mitigation.*/
  #define X86_SPEC_BHB_LOOPS_LONG   X86_BUG(21) /* Upgrade 
clear_bhb_loops to the "long" sequence. */
+#define X86_BUX_MAX               21 /* Bump when adding new flags. */
+#define X86_NR_BUG                ((X86_BUG_MAX / 32) + 1)

  /* Total number of capability words, inc synth and bug words. */
  #define NCAPINTS (FSCAPINTS + X86_NR_SYNTH + X86_NR_BUG) /* N 32-bit 
words worth of info */


