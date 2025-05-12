Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF83AB453D
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 21:56:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982138.1368693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEZFw-0006KS-RH; Mon, 12 May 2025 19:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982138.1368693; Mon, 12 May 2025 19:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEZFw-0006H9-Ms; Mon, 12 May 2025 19:56:08 +0000
Received: by outflank-mailman (input) for mailman id 982138;
 Mon, 12 May 2025 19:56:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lA66=X4=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uEZFu-0005qp-U1
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 19:56:07 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20611.outbound.protection.outlook.com
 [2a01:111:f403:2413::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20ae51c4-2f6b-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 21:56:02 +0200 (CEST)
Received: from CH3P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::14)
 by SA1PR12MB8698.namprd12.prod.outlook.com (2603:10b6:806:38b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Mon, 12 May
 2025 19:55:55 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::7f) by CH3P220CA0025.outlook.office365.com
 (2603:10b6:610:1e8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Mon,
 12 May 2025 19:55:55 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 12 May 2025 19:55:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 May
 2025 14:55:54 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 May
 2025 14:55:54 -0500
Received: from [172.31.225.170] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 May 2025 14:55:52 -0500
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
X-Inumbo-ID: 20ae51c4-2f6b-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqW8LoHQU+kdPA7n5YbKZk+Jfnf4qTDtwyuLxsAKDRT9E6ZyNXhqo7tXJTyPF5SFHoZj45DnON2/4nGp+XQRePgFNgOBYMYUp/7afNunJ326Sa7FuZtAZnbdOP1GiliRdMRqboO46iiPlexpXnI/bw5T2ea8Fni/pvKnIxZoqmfdhdsOOomBjPl/J71S51NEElQfglnn9yzIHXqXg0udemYEzg+2BQT6EcBVoplwdM+R96srbcqrP8Uw31DNXtwRMhiB0e8gBx8T4u4Di3UcRPMj1QxE3ubmZDo2C6t+uxkAguoMZK7xIMdwx/oiWsY9/pwCTgXVWTPm/3VqglnZeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYb0PTbwQxErNmiU8qGtircbIDEffozMNuruRuqBXE0=;
 b=pcyViN8p78Mkmu9W/fdZQZ16fb3BSR/wWnfkQXEjLZ2TONebi5N/RjSNaDFwo/tpYDBJsauOL1VNeZJj66hgo264IUVbmrjbCnPoUUvVVRLAh16mq/6NliXwYnuLom2+ydCCmJnGNMtV74DJvg3XSVhlXTcj6kxfkdYeAmpect+8qW3hVWz14L51FRrayxtcVLPAHT7WhcQ5YImDqBT+rDSfJfLLfMXo88nsK8f8M75WK6v6eU8nH6ST5bO9gGNBVoJJYZVGW1xLMkC9q6F4/h+zOW5Gyaz8B77cPO6ij4CypOqmuJ724LGzMTkOxdcTQDY2t9nYTS47dPXNz4DMRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYb0PTbwQxErNmiU8qGtircbIDEffozMNuruRuqBXE0=;
 b=25q/NIvZoUokxb8PfWJPD/KMitDU/4ZhYNHijhyVAvmDxH6x7AlyhbqLcKnWheZO0gAXPYjoPEsFxVh2cMwIJfeExCm6kpHqvwb83om0tp8sdbraA9XtqX7P0T7r5jntLhsLNi37JczKKehUge8H9Z2nHSnAMRjsyZ46x3CSfAM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <56975c31-a088-43bf-80a5-65da6cc00221@amd.com>
Date: Mon, 12 May 2025 15:55:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] xen/arm: exclude xen,reg from domU extended
 regions
To: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250508132040.532898-1-stewart.hildebrand@amd.com>
 <20250508132040.532898-6-stewart.hildebrand@amd.com>
 <3caa25d7-9faf-4099-a0a2-f7014c01e1ce@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <3caa25d7-9faf-4099-a0a2-f7014c01e1ce@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|SA1PR12MB8698:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e6bf63c-6e91-4a6e-01d3-08dd918f0190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUdicGgxY0lNeGp5MFVHQW9GdHVoeUhmNTVqNGZoa3RjMVBRRGMzOGNZdDRZ?=
 =?utf-8?B?U1VhbU5YNlErRWlWeUYrMVBmZkloVkUzaGNyR3QvK0FZa0Z5bU53TzkwVEZi?=
 =?utf-8?B?cWJxQVNlSkdrSnVTYjk0ZmhKQW8wQWYzVHZsRlQ0WWZHM00rcTU1LzM0YzJq?=
 =?utf-8?B?cGFSOTJsNC9EMVZGM0JJODRJSWNyaFdiOWZIalplVkJ2QVJkZ2ZhWHJvNFZz?=
 =?utf-8?B?N01sNktwUmZ3WTVIT3F6MTROTEdLWGtpV3Myc0tMNDNwNzBzdkxIUW0xQkNn?=
 =?utf-8?B?Y04yclVCcGZnNFJaOU05cGZjSmVTYXNmcmZDNjNQbUNNVjB6N2RtSGVMaCtT?=
 =?utf-8?B?SFowNTlvWGJ0L1BpcjVraXZkcUR6Y0h6ZlhUOXhBNTZrdXFtYkhaRTkrTVYr?=
 =?utf-8?B?cFBVOHgrWkNiQ0liUkI3OTM2K0pqNVhOSnhlQjdHcmZ2c00xOEE2azc1VWo5?=
 =?utf-8?B?QjBmZVdnQVc4bE1SSTdhVXBYUjFPVmdHUTNMUVhsOFZnMElUaGJuT2tNZUU0?=
 =?utf-8?B?dTg3b3JrNm91MDBSR3RmK01oVnFDd0p0bFVCQWQxU2dsVDd0VG41WUVrTHJo?=
 =?utf-8?B?UVpMUjlKaC9BYlNCckRUOTJyU3JXNFgwbzJkN29xUE9XektLL2VZTXVlRGhM?=
 =?utf-8?B?VGdSNUc5OVIyK29Danc2dkFzUEN4cWlzbzFVbG1pcm8zSzRPaUxXNDh4dnJS?=
 =?utf-8?B?WnhjZkc3d2ZEWUt1N2xwWUxWNlh1amJtZG1yUEVzYnh0QzJhWUJlcmdLMHpi?=
 =?utf-8?B?YWtWS0tDSkJpQ095Sjd5dmdCN0NNejJVRFhsTDlTVDgxTG55enFNdFI2VVJy?=
 =?utf-8?B?Rzk4UkJ4YldxRW5JcnArQ0wyR0oxWjlkQzhOdDFRNXJLd0FBZ0Nib1ExWXhG?=
 =?utf-8?B?dFEyMkZHUERJRlRIT3dYbnpudXZXcFc5UmtPbXp2MndkbHptWW5qbkY4WVF1?=
 =?utf-8?B?RWdNMUZIU3lwZmR5SVkrMFAvc1lqNWoreHdaMDFKek1VdTM0TktOUDNmaGpS?=
 =?utf-8?B?Z2xiS2RpQ3Urckd3cWhrblZONlBLSW05Z01zaUVPVkRqRk5zak9oNlhKZExZ?=
 =?utf-8?B?aElKU3pZd1FjaHVobEQ5SlkwYXl4eUVXS0gwSU02WmszSXdQSEJHMzZHeGdI?=
 =?utf-8?B?NE1TbHlXcnNPM1RjSjhUbTg5RjFPUE5ZMk9veEpkUDZBYkxrS05KbkdWZVpq?=
 =?utf-8?B?M3g4eW1Fdml3b2xIRzEveUZHNnREZW9LeUVDYVdxcE9mVlozVGNqc0ZESS9M?=
 =?utf-8?B?aDRmaktDYkNDUWJGVG1HT3NtN3doNzZZUFBUbU5ocVkyZGFwK0tTTFBNQUhR?=
 =?utf-8?B?U051RTdOM1JNa1NJTnZZMXRyOVpoeVNGd0p1SC9LS0Z5STV0N1VlM2JjTUhX?=
 =?utf-8?B?WXNuR2k5M3hDT1g0a1ZSVUVROGlRT1gyTUFwcXRpNDhtZ3BJd0tnMzY4MXVC?=
 =?utf-8?B?Ly9tSVNVV1F5dk0vME5vYmRBSlE3Zjc3SFVRdlRtUGVzWTdYYjZCalc0VjdJ?=
 =?utf-8?B?TFlEZ1IyYy8zZ291K1BqbUNtMHlZay9rS2NhVCtSZVFLcit0V2JSajJlYUQw?=
 =?utf-8?B?S0RycWN0dXBKU283cWxuOHcrSjQ0cm9kN0NTLzg4amRJUkdEbzdnbmJpNjhw?=
 =?utf-8?B?SDVjcWhzNWx5ZlV3ZmhEdW1zZGRocGNuUmxockVtRVBJRWY3Q3h3aTdkMlZF?=
 =?utf-8?B?TUxkY0dxalZiTy95ZnJ0eUsyRVV4QkRMNEJJZHpFRFF1VDdPeG4wdk1rclpG?=
 =?utf-8?B?VkFsUnhvWTJoNUQyODArN0MrU2l5UEpMTit0VmFTZnBnMHZzNHVSREZSeXI0?=
 =?utf-8?B?aS9BZVZnVmM0TVRCQ1pyUHp6Ync5UTk5VTVVNVBYanF4UFBEWVB4em5aREtK?=
 =?utf-8?B?MUcwM0Jpa2Q2WEF4bWRpcWkxRnMweVp2NHpVNzdFTGNhcElzbzVDQTcvemZX?=
 =?utf-8?B?UklTbzFVU1h4OGhJZjNuazVyS2lrN084RVQyK2FvRlhuSWNIeWNsQmdKWThO?=
 =?utf-8?B?M2g5YXdtMDZkdkFLYW1FcUN1dmJjY2ExMGVXbndTc29mNFBqNzl4Ty9HK0Zh?=
 =?utf-8?Q?wHlRHR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 19:55:54.8447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6bf63c-6e91-4a6e-01d3-08dd918f0190
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8698

On 5/9/25 02:54, Orzel, Michal wrote:
> On 08/05/2025 15:20, Stewart Hildebrand wrote:
>> diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
>> index 7a6cd67c22f1..1939c3ebf7dc 100644
>> --- a/xen/include/xen/fdt-kernel.h
>> +++ b/xen/include/xen/fdt-kernel.h
>> @@ -24,6 +24,7 @@ struct kernel_info {
>>  #ifdef CONFIG_STATIC_SHM
>>      struct shared_meminfo shm_mem;
>>  #endif
>> +    struct rangeset *xen_reg_assigned;
> The purpose of your newly introduced xen_reg_assigned is to keep track of these
> ranges so that we can remove them from extended regions. The concept of extended
> regions exists only for Arm today. Therefore I'm not sure why making all these
> common i.e. entry in struct, rangeset allocation, etc. The other aspect is that
> extended regions may be disabled by the user and you would still allocate
> rangeset and add xen,reg to it for no purpose - i.e. dead code.

How about an arch hook? E.g. see work-in-progress/untested patch at the
end.

> Also, what about direct-mapped domUs? We don't seem to take xen,reg into account
> there.

Right, we ought to take xen,reg into account for direct-map domUs too.
This is because, even though the domU is direct-mapped, xen,reg can
still set up a translated mapping (gfn != mfn). Also, xen,reg doesn't
need to correspond to a real device, it can be any arbitrary mapping.
I'll send a patch.

> P.S.
> After recent dom0less code movement there are some issues that I reported to
> Oleksii. Long story short, we shouldn't be making the code common (e.g. static
> mem, shmem, domain type) that is implemented for now only for one arch. If the
> need arises in the future, the feature code together with callers can be moved
> to common. At the moment, we have some features being in arch specific
> directories but callers in common code and #ifdef-ed (making the stubs
> unreachable). That's not great.
> 
> ~Michal



diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b189a7cfae9f..f099e27d846c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -929,6 +929,31 @@ out:
     return res;
 }
 
+int __init arch_add_xen_reg(struct kernel_info *kinfo, paddr_t gstart,
+                            paddr_t size)
+{
+    if ( !opt_ext_regions )
+        return 0;
+
+    if ( !kinfo->arch.xen_reg_assigned )
+    {
+        kinfo->arch.xen_reg_assigned = rangeset_new(NULL, NULL, 0);
+
+        if ( !kinfo->arch.xen_reg_assigned )
+            return -ENOMEM;
+    }
+
+    return rangeset_add_range(kinfo->arch.xen_reg_assigned, PFN_DOWN(gstart),
+                              PFN_DOWN(gstart + size - 1));
+}
+
+int __init arch_cleanup(struct kernel_info *kinfo)
+{
+    rangeset_destroy(kinfo->arch.xen_reg_assigned);
+
+    return 0;
+}
+
 static int __init find_domU_holes(const struct kernel_info *kinfo,
                                   struct membanks *ext_regions)
 {
@@ -973,9 +998,9 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
     if ( res )
         goto out;
 
-    if ( kinfo->xen_reg_assigned )
+    if ( kinfo->arch.xen_reg_assigned )
     {
-        res = rangeset_subtract(mem_holes, kinfo->xen_reg_assigned);
+        res = rangeset_subtract(mem_holes, kinfo->arch.xen_reg_assigned);
         if ( res )
             goto out;
     }
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 7c3b7fde5b64..8d6bd2dd77f9 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -16,6 +16,8 @@ struct arch_kernel_info
 
     /* Enable pl011 emulation */
     bool vpl011;
+
+    struct rangeset *xen_reg_assigned;
 };
 
 #endif /* #ifdef __ARCH_ARM_KERNEL_H__ */
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 2c56f13771ab..654575612744 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -146,14 +146,6 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
     int res;
     paddr_t mstart, size, gstart;
 
-    if ( !kinfo->xen_reg_assigned )
-    {
-        kinfo->xen_reg_assigned = rangeset_new(NULL, NULL, 0);
-
-        if ( !kinfo->xen_reg_assigned )
-            return -ENOMEM;
-    }
-
     /* xen,reg specifies where to map the MMIO region */
     cell = (const __be32 *)xen_reg->data;
     len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
@@ -196,8 +188,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
             return -EFAULT;
         }
 
-        res = rangeset_add_range(kinfo->xen_reg_assigned, PFN_DOWN(gstart),
-                                 PFN_DOWN(gstart + size - 1));
+        res = arch_add_xen_reg(kinfo, gstart, size);
         if ( res )
             return res;
     }
@@ -828,10 +819,10 @@ static int __init construct_domU(struct domain *d,
     domain_vcpu_affinity(d, node);
 
     rc = alloc_xenstore_params(&kinfo);
+    if ( rc < 0 )
+        return rc;
 
-    rangeset_destroy(kinfo.xen_reg_assigned);
-
-    return rc;
+    return arch_cleanup(&kinfo);
 }
 
 void __init create_domUs(void)
diff --git a/xen/include/asm-generic/dom0less-build.h b/xen/include/asm-generic/dom0less-build.h
index e0ad0429ec74..3e577e4dbe10 100644
--- a/xen/include/asm-generic/dom0less-build.h
+++ b/xen/include/asm-generic/dom0less-build.h
@@ -61,6 +61,10 @@ void set_domain_type(struct domain *d, struct kernel_info *kinfo);
 int init_intc_phandle(struct kernel_info *kinfo, const char *name,
                       const int node_next, const void *pfdt);
 
+int arch_add_xen_reg(struct kernel_info *kinfo, paddr_t gstart, paddr_t size);
+
+int arch_cleanup(struct kernel_info *kinfo);
+
 #else /* !CONFIG_DOM0LESS_BOOT */
 
 static inline void create_domUs(void) {}
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
index 1939c3ebf7dc..7a6cd67c22f1 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -24,7 +24,6 @@ struct kernel_info {
 #ifdef CONFIG_STATIC_SHM
     struct shared_meminfo shm_mem;
 #endif
-    struct rangeset *xen_reg_assigned;
 
     /* kernel entry point */
     paddr_t entry;

