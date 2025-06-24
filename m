Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 668F8AE712C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 22:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024084.1400121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUAjU-0001uO-H2; Tue, 24 Jun 2025 20:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024084.1400121; Tue, 24 Jun 2025 20:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUAjU-0001ri-Dw; Tue, 24 Jun 2025 20:59:08 +0000
Received: by outflank-mailman (input) for mailman id 1024084;
 Tue, 24 Jun 2025 20:59:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EnmP=ZH=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uUAjT-0001rc-MB
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 20:59:07 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20619.outbound.protection.outlook.com
 [2a01:111:f403:2407::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1013d33c-513e-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 22:59:05 +0200 (CEST)
Received: from MW4PR03CA0089.namprd03.prod.outlook.com (2603:10b6:303:b6::34)
 by SA5PPFA403A61D8.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8da) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Tue, 24 Jun
 2025 20:58:59 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:303:b6:cafe::f7) by MW4PR03CA0089.outlook.office365.com
 (2603:10b6:303:b6::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Tue,
 24 Jun 2025 20:58:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 20:58:58 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 15:58:58 -0500
Received: from [172.29.43.193] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 24 Jun 2025 15:58:57 -0500
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
X-Inumbo-ID: 1013d33c-513e-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYezYZ5i7PGC+U98A5ZXgF6HR4uEFaYMrRhc5+E0t1vy5mccOFjj/7DiJiMYpmxMpcu53mbFOimtnSj2b8E/1b6Gr57WUfXWwZAPPzDuWOCU/BbtcWXf5K/jvPul5AyBuq1K//Lu+bRlptxtsv8a1LF3Q2VZ4BQapNfVa6Bdewc0Sh+ZSvpuj2R6i3/zq6l8ZZ9D6z2O0E0cONOta3B58ivF81FaVtfaFWpeazP9YFSc+erSrRfGVU16nVBE8kiPFHjY98nWWexXL3ZbDH+SiyLD4mOWqIF5V7NhWmOvNE8GL3ZMosfnpiAcPhhT6zmiIKNYjK3nXawOxquTuIS1eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RO44iSbQZHsEat2MA7ef/QCZoLfnm7fnQZeluYpsxw=;
 b=B8KxRWFZfdhWV3nWWm6k99WL4zgtTBsCqbthzXL8yE+ngvfgLty/yyI+Q9s+iEuBR1xJw8RpF9yGcCpma7ewiEl9Z6uNRB+bT4oGQKa41EHvfGZTOQ88Eqx4HcRKHFrliV7RJ40vh8NwOep9u8QNbOS7R+ndTKawb29ic0JlhjGND2/TLPagzmTaQLyHyPPtAc07WXv/DyKeac3i50cnznjLQaelbmI0jzdKAROry/hdUgZf6Ovgh/0Jmh/uNnvN4fNOZ0fpU3OSOteEt0WD37ZW8w4jEhVNWviSdz2CpQXeJBGMQSCZTScYrsPxXQ70N/NgUEYxrZsf4OIBPNdDxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RO44iSbQZHsEat2MA7ef/QCZoLfnm7fnQZeluYpsxw=;
 b=Mxvhc9/G2WF4VlmT6ZORuuLGpHEv+Np2f9Jw20GCdY7YDA9XX5eeww29x8FA2Q2CRbFi5PvFL9U4SaJXt+GfWg4POU5KdwcSPh1jgHtRgqjgjjD1L3lNMTBb4OkpPeLheBRb3e0CRbH1zP3Cr0077AGNvqsxxY2jXu7GTjCQDAM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1271f390-2697-4db2-b9a4-735e34bef521@amd.com>
Date: Tue, 24 Jun 2025 16:58:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] x86: re-work memcpy()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <c5e1e7e0-a295-4028-b003-152b861ee14f@suse.com>
 <991c9caf-c7b6-4e1f-9855-5b2930b7989c@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <991c9caf-c7b6-4e1f-9855-5b2930b7989c@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|SA5PPFA403A61D8:EE_
X-MS-Office365-Filtering-Correlation-Id: fece4e9d-720a-4aff-bae0-08ddb361f0d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTFKeGl1REJrSkp3QVROTmRrSC9jWk1NYjFWTzdPdW8wRjNjQ3dBcWxmT01P?=
 =?utf-8?B?bjc0UnpSSzNvcGJkTGxpR3FaZ1FHaGJCaW9GTy83ZGt1UnZrNVF0MUlIeHVI?=
 =?utf-8?B?RWhrU0tDWE03ZFdkTGRtdlVOOG81RWZFTEZVR3hJVlpQTk9sVkczbVRFZUho?=
 =?utf-8?B?dFhHZ210Yk5kSFR0ZWthYngxdzNGdml5d2VUdURhMldsV3gzZUljT0xlWlVx?=
 =?utf-8?B?MGRVVXAycTMzNmtwYitTME51OXJKYnJRUEdKSzZuODZJcWdVdnZLMVlEU09V?=
 =?utf-8?B?Y0dPQ0FGQVZmdnBhRXRGNldLYzhTMkJEUzdUVjBsYzhkbm5pSjV1Q0ZXWnJP?=
 =?utf-8?B?ZjFRRytXbVFjSnc0MERublVRcDNmbU1OYWVxMVBQTVhNUzJXMlI0YlNSb1pR?=
 =?utf-8?B?OWt6cmdrQWlBZUkzSUYza2pLeURaVjRnMktvckhIcEgyUm5vU3JZM29GRnJ6?=
 =?utf-8?B?RUw0TURVOHZ1YWt1eCtmVDhwQjc5VWt6cDlYWm55WGkyZlZHZ1N3RmgxcGtK?=
 =?utf-8?B?aWhBaStucmRwVWw0RXJ3UlRZdEt4cU5LYmgzSFlpRmRBWjlwbk9iNG4xczVm?=
 =?utf-8?B?Z1U5ODlPanJLRTFxdk1TRENWNWp5Mmd2MXQwcTI3eUZSdEFOUUJrcVFXbWNi?=
 =?utf-8?B?emdHdGJoMG5VbmZTUzZUSE5RblVyV0xzQmMxaWJVL25hSXd1NTRLYURpbnFE?=
 =?utf-8?B?bGc5RGFvMkVXczdJdVFoNnREdjJGa2l6S2duWGM2cVhjcDI0MjdBT2NLcDNv?=
 =?utf-8?B?amtvcjQvc2I5QnlPZkphREVnQmRPVWpTb1BabURmNGVvbzZQT0JxejFoQVM3?=
 =?utf-8?B?K2pvdy94QnpoRnp0SDVjdXNQMytMY095blM2UHlNa3VZc2tmOG9qM1k4ZU9M?=
 =?utf-8?B?KzBabGhxR2NrM3NZTjJyZndadXdkTWRPd2Z5Vml6UUxHcE1CRjgzQUNuZUlY?=
 =?utf-8?B?ZWpTVElBR0FiMHVxK1RSclhXWnU1R1RjNjJBeFVsRi9mL0VYN2lKSEV0dEhk?=
 =?utf-8?B?ckwvbkJzbTFBTEZsMStEamtXWTE0bndyeStuajZvRFBwdm5McGY5R1VaTVpL?=
 =?utf-8?B?bUtFSDdyNk1WbzVMd3dZeS9WamxPOFJNc0J2Mmd6d1J4djQxajJrM3pKb1NZ?=
 =?utf-8?B?WU4wdnN5eTZUNTBwUmZmczh1YXhhdXlFZkxXdWc5dkpSZ0Y3S0hVNVJrUUhB?=
 =?utf-8?B?L3JaL3phVmZ3dEt1VmF2RytxSDl3RDV5amt4NVp0UDA2WTRxTmF5b0RUTzMr?=
 =?utf-8?B?UStXYVlrak04R1JkbjVGWUZ3VUVHc2NtQ1FUWFdpbWs5SElJQjVhNXROSDJW?=
 =?utf-8?B?SVhsT2VmM2lZdWhaZklBRkhJcnNhQXhiWm5RNzdKU0NIRHdRZ3RsZGZUUHF4?=
 =?utf-8?B?ZFM3YkUrRGU4V0QxSUZnWlpSOTRQQkIwSXQ1WitrVVpCTlRtYUdFcmlTZmtL?=
 =?utf-8?B?SU5zZ2tWVnkwTm9ZczFiWGhVaUpZa3Nnb2loU0x2NGtkbWlEVGp4bnByQlY3?=
 =?utf-8?B?QUlTcTgxQjgxWldoN3FpMUw5VTRKQmRVQlFXZkdEa1V3Q1pqSi9mVldEZDFF?=
 =?utf-8?B?d2pGT002RW9pNkFJK2d1b3Q0VWdVS2RYWWpjeUIxL3hjUWhwWVBsN0Rnazhr?=
 =?utf-8?B?cXRJYzJub2NCWlVKUE54QmVzcXJkdHRnSWFnSWxLOUlYSmpJd0k5eCs2cDRW?=
 =?utf-8?B?eFhScnFXcWlTWUpkZHNoL2h5NVkvN1BaQ0VrZHFEL1VQUWsvS2R5c0c5SE5u?=
 =?utf-8?B?NTBwSFFCRGVyVFBGS2t2VjJNOWV6YWY3ZTBkcW9mSUJXQTM4VGhIZFZyVTJy?=
 =?utf-8?B?K2ljeGR1TlZzWm1BUGdrSlNkcDRZL09vNG9XYXFBZ1ovRjhVbUY4eG9aZFRy?=
 =?utf-8?B?Q0VYamh4UHdzSFFrQ3o5TThiQ1RCMk1ZeUQxMXVlUTRCalRZTHhHcnFDZWV2?=
 =?utf-8?B?YjljS2hvRnpxczZlelloQWJEVjlnSzV0dnFJNUVGN3NabE9JUW15OHhGNkRR?=
 =?utf-8?B?OFVtUEVjYW9JVDF3ZzhId1Qra3dsSXovVXJCakQ5OEU5ZnRtbldkSkZYbzdJ?=
 =?utf-8?Q?u9r1vL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 20:58:58.8932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fece4e9d-720a-4aff-bae0-08ddb361f0d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFA403A61D8

On 2025-06-16 09:00, Jan Beulich wrote:
> Move the function to its own assembly file. Having it in C just for the
> entire body to be an asm() isn't really helpful. Then have two flavors:
> A "basic" version using qword steps for the bulk of the operation, and an
> ERMS version for modern hardware, to be substituted in via alternatives
> patching.
> 
> Alternatives patching, however, requires an extra precaution: It uses
> memcpy() itself, and hence the function may patch itself. Luckily the
> patched-in code only replaces the prolog of the original function. Make
> sure this remains this way.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

> --- /dev/null
> +++ b/xen/arch/x86/memcpy.S
> @@ -0,0 +1,20 @@
> +#include <asm/asm_defns.h>
> +
> +FUNC(memcpy)
> +        mov     %rdx, %rcx
> +        mov     %rdi, %rax
> +        /*
> +         * We need to be careful here: memcpy() is involved in alternatives
> +         * patching, so the code doing the actual copying (i.e. past setting
> +         * up registers) may not be subject to patching (unless further
> +         * precautions were taken).
> +         */

I think this phrasing is a little clearer:

We need to be careful here: memcpy() is involved in alternatives 
patching.  Define the original code as only the register setup.  The 
code doing the actual copying (i.e. past setting up registers) is not 
subject to patching, which avoids it changing underneath the processor.

Your comment is okay if you prefer not to change it:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason

> +        ALTERNATIVE "and $7, %edx; shr $3, %rcx", \
> +                    STR(rep movsb; RET), X86_FEATURE_ERMS
> +        rep movsq
> +        or      %edx, %ecx
> +        jz      1f
> +        rep movsb
> +1:
> +        RET
> +END(memcpy)

