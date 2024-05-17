Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 998F28C7F9B
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 03:36:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723757.1128817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7mW8-0001Bz-Fg; Fri, 17 May 2024 01:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723757.1128817; Fri, 17 May 2024 01:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7mW8-0001An-Cy; Fri, 17 May 2024 01:36:16 +0000
Received: by outflank-mailman (input) for mailman id 723757;
 Fri, 17 May 2024 01:36:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6mIz=MU=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s7mW6-0001Ab-GJ
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 01:36:14 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2405::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7eb2712-13ed-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 03:36:13 +0200 (CEST)
Received: from MW4PR03CA0309.namprd03.prod.outlook.com (2603:10b6:303:dd::14)
 by LV8PR12MB9183.namprd12.prod.outlook.com (2603:10b6:408:193::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Fri, 17 May
 2024 01:36:10 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:303:dd:cafe::45) by MW4PR03CA0309.outlook.office365.com
 (2603:10b6:303:dd::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Fri, 17 May 2024 01:36:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 01:36:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 20:36:08 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 20:36:08 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 20:36:06 -0500
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
X-Inumbo-ID: d7eb2712-13ed-11ef-909e-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbaTTCM9d8O4r0uAjK8PDbO/zeR0kbf7AA1vioUO9b9Oxv9NmLHDQLimSxtKHhdQiJtcTK8VdCMzo6mXz6g9xKck4TGUnV9+Li431oEQ664c08SpArKdyx+854a55tIrPZ+Zqvqej2A9/T/1dVl92DELKhQ23RAbFGtpZjKMha5XYgry7DdGQM1Pn0F09gOkyTy6HMn8N+M6F/MtZD9Gs35iqmp1ETekouvLqbcdSDmRxdNaMWZYgrHEyt2rV7lJiNXGpyKu4DVJiMwKi7uKpjeJaKWiqZXr40sD1yRkr8sI5YHhGjU0vHEetNQVZojbicdsS20F+qE/TKYctcMHFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6J0+vyCm0AQ02DpB102APuTG9J+GZ8JwgNCnPIcxMs=;
 b=S4MoQnIHacoeimQc7yKTZEroqle/2bvopAQ3WO93SYvc5x3Jw6SxOhNRQScR02GlK/PO+KIK2O4fhvBFOvXriJdk+beZOAH0FBBWT+LZBF1ub84adS+wIFwVzsNOZqH3zd9elZMeQqejrW0ThZBF7WTDhq+yDOC/PzYpJ0zsxcju8PWqGRe/gIUdazj5xldJyygujCL2P0rgqpeBUBwJRlydFD80R14VXHR4LW2y2bbedC00k+5jy8blIYhizPRB3i4f2KuGdah1VJ880yRroMkXz4N+aQDCu3g6U4czS/w7z+xpZuOAAGZQHotQBqYQ4/xRYaAAo6e/e2FN0HQTQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6J0+vyCm0AQ02DpB102APuTG9J+GZ8JwgNCnPIcxMs=;
 b=BfaT4qj2I/TN2Y4P7aELLJnV8giO5l0WHVRIeXDYChimeC2fIZJPAIA07v3yqsHTlH0W3mTOy+A8TDhITzG13R4wdLk0dzIXKVOriQK2kbRjWNFXCbZyxEe/susa73KTlXcGWz8sShKDzCK6lHhvdvvjz+fhlhCl8kPRfyI0+Ug=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1f02615c-916c-4ab8-babc-17a117c56e87@amd.com>
Date: Fri, 17 May 2024 09:36:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] xen/arm: Add XEN_DOMCTL_dt_overlay DOMCTL and
 related operations
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
 <20240516100330.1433265-7-xin.wang2@amd.com>
 <28138e7d-26c7-4faa-86f1-a1c7b175114b@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <28138e7d-26c7-4faa-86f1-a1c7b175114b@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|LV8PR12MB9183:EE_
X-MS-Office365-Filtering-Correlation-Id: d572f72d-a3b1-4ffd-7d5e-08dc7611ba5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXJPQXk0OFZjdFBReHZOeWR3UktSa29UMXNYRnByZDFzbUF0V0VhKzN2YkFt?=
 =?utf-8?B?Zm9GUjBZb0lvckhxK1dxSlFWM0RuOHBPeUE2VEgxSUJpelVlOFIwY2VSMWNJ?=
 =?utf-8?B?N2RKNExkR2pFL1BNZFZSK0UyeGovRXRqUFAyQ3B0Q1JIM285YlpsbU1Nc3I3?=
 =?utf-8?B?alFuR0gvdkZEVktmRjRuUUY3SlNyUm1xUEN4eEEvRTBmWGNoSnJPSWlSQkw1?=
 =?utf-8?B?RThEdVNYbFRYZnlwMWJ4QytOczRzNWF3YnVkNWh1dEMxR0x6bmszbklnWjYy?=
 =?utf-8?B?M3YzckhXejc4ZHdPQUtOUnplWVcwRTByLzMvYjRwbXgrQW5MNjdiZ1V1Q2oy?=
 =?utf-8?B?YzJvTjVlNWRJYkZnYkl1RE56d2hpZHJVVncwdTRIb3g0VUZEZTJ2cmhxQ2Fr?=
 =?utf-8?B?R21hVTE2RnlXWFVqNUpsS0t3TVQvcTVwWUFLQTR4endFWUt6aHQvK0k3eDhC?=
 =?utf-8?B?M1ZEbUV5UUNnK2ZZZlR3amhrNXAyYWZBKy9IMExMZ0krS0dpS2s2YWVHdDZY?=
 =?utf-8?B?Zzk4TnNIUDQyOVQxV2dsYkJUNkxPemQ4ZXc0bTk2OFl4NGNmTXgvRmZEaEI0?=
 =?utf-8?B?OWN6WHFiYUcxcldkekxTL3k5Y2FEQlhBZVB3ZGU5NXZFWTJJdmRlTXROY0Z2?=
 =?utf-8?B?VHZ2aEYyU2tYNXhMZHkvdWtHejd0RmltV0p2Rjd1cXkvMWhjaXhsNUhBR1ZO?=
 =?utf-8?B?c0lrUEdsdTRrRkNCRHdXQmdtY0ZaLy9GTzlSS2I2VkkrZlBnYUt6NUhzTHJa?=
 =?utf-8?B?a2NLcFhRZkJKcXBlTUd2Zm9wQWFJMDR4bjVkakMyZHNBdkNLVzBNaGlVWmx2?=
 =?utf-8?B?NXpVNDYxdHJPQjM3R3FOc09mQWowTTc5QUR4RW1zdlUydTZPMUppcFgrWTNp?=
 =?utf-8?B?UWQ1RldLWHhSdWNnWEpGdmNxa2hLdU12TzZwbjJqWjBVdHBQVGtrRUFveWEx?=
 =?utf-8?B?ejVnR1FDaVhuQXRzSEZXYmt0TTNHcDZEeEpCamlSY2ZHZXIwZDJNb0lIWUN5?=
 =?utf-8?B?OVFFSisrUXNQZ2pDZHF5ODhxb1pBdFBRS0JQOTM5SzdNT3dWVThnd2lRSUt4?=
 =?utf-8?B?aFowelVEVWhtQXJET3gzQkpYaEFyMEoxV25lV3JRbXQvdzc4OUV4YnA5QXc2?=
 =?utf-8?B?TW15M2o1anFQYmVoekptbVBxcGtCV1AzRWlYTHBCYUZSbkt3K2NmejVBNWR5?=
 =?utf-8?B?cDR1VlZNeTlLeVJGMmlhOFM3aTQrMHM4ZTJRdlVkNUZBWHE5SFVjMUJuRHFL?=
 =?utf-8?B?a2xjbVA4NFFOakljTVBJaTFkaitobkVEUXJjOGFyWkRyTUNVQmh4VFBSbnFJ?=
 =?utf-8?B?SWFUYUNCcnFHYjMvY1hqMWRKbjNuR0dJcllKVk41QkRLaDFMZUZlMzBGWWRv?=
 =?utf-8?B?WW9udVd2QlBuOVFWNjdqS1dmUSsrZVFNMFhralNzdTVXcElXMkdSVTB1cVBF?=
 =?utf-8?B?WGdNZERrQjVVUUx4ZzR2VkJBR1pUYk9oc1MyTjdBTXNiWU5acXFmTkRPS1ZK?=
 =?utf-8?B?Z3hqY2tVc3VRNHU4QnVxYS9iWXJKeUUxNnhYOEYyMjBZOHpvTmJpdTlBSUlX?=
 =?utf-8?B?aGpYUmpLdjRaemJ1THNacUFab1UrSGhSN1ZldEUxRGc4WElqZHF3Z0l6NG1u?=
 =?utf-8?B?b2cxWEtzYWdyRzdsYlBNVkQxMkJNaXlDa1ZUZENsOVhwaU52MWFDMkl1K3pr?=
 =?utf-8?B?aFZhaWE1Qi9vaDZucEgySE9CWnVBZWp1ZzBTblJWNEdzMWJ2cnc0eWtkelZR?=
 =?utf-8?B?Wnc3REN1eFg2cHBHVkNqaGhTRC9XV1ZzY2VDam5xY2RYelZlTDVPNWpCUDV3?=
 =?utf-8?B?R205ampMSmwrWlpLN2F6MlArTlNPL29Da0p0NlB1cjlKUmtJYTJMOC91SkZq?=
 =?utf-8?Q?+Td5h77YPY4Vo?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 01:36:09.1703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d572f72d-a3b1-4ffd-7d5e-08dc7611ba5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9183

Hi Jan,

As usual, thanks for the review!

On 5/16/2024 8:31 PM, Jan Beulich wrote:
> On 16.05.2024 12:03, Henry Wang wrote:
>
> +    /*
> +     * First check if dtbo is correct i.e. it should one of the dtbo which was
> +     * used when dynamically adding the node.
> +     * Limitation: Cases with same node names but different property are not
> +     * supported currently. We are relying on user to provide the same dtbo
> +     * as it was used when adding the nodes.
> +     */
> +    list_for_each_entry_safe( entry, temp, &overlay_tracker, entry )
> +    {
> +        if ( memcmp(entry->overlay_fdt, overlay_fdt, overlay_fdt_size) == 0 )
> +        {
> +            track = entry;
> Random question (not doing a full review of the DT code): What use is
> this (and the track variable itself)? It's never used further down afaics.
> Same for attach.

I think you are correct, it is a copy paste of the existing code and the 
track variable is indeed useless. So in v3, I will simply drop it and 
mention this clean-up in commit message. Also I realized that the exact 
logic of finding the entry is duplicated third times, so I will also 
extract the logic to a function.

>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -1190,6 +1190,17 @@ struct xen_domctl_vmtrace_op {
>>   typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
>>   DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
>>   
>> +#if defined(__arm__) || defined (__aarch64__)
> Nit: Consistent use of blanks please (also again below).

Good catch. Will fix it.

>> +struct xen_domctl_dt_overlay {
>> +    XEN_GUEST_HANDLE_64(const_void) overlay_fdt;  /* IN: overlay fdt. */
>> +    uint32_t overlay_fdt_size;              /* IN: Overlay dtb size. */
>> +#define XEN_DOMCTL_DT_OVERLAY_ATTACH                3
>> +#define XEN_DOMCTL_DT_OVERLAY_DETACH                4
> While the numbers don't really matter much, picking 3 and 4 rather than,
> say, 1 and 2 still looks a little odd.

Well although I agree with you it is indeed a bit odd, the problem of 
this is that, in current implementation I reused the libxl_dt_overlay() 
(with proper backward compatible) to deliver the sysctl and domctl 
depend on the op, and we have:
#define LIBXL_DT_OVERLAY_ADD                   1
#define LIBXL_DT_OVERLAY_REMOVE                2
#define LIBXL_DT_OVERLAY_ATTACH                3
#define LIBXL_DT_OVERLAY_DETACH                4

Then the op-number is passed from the toolstack to Xen, and checked in 
dt_overlay_domctl(). So with this implementation the attach/detach op 
number should be 3 and 4 since 1 and 2 have different meanings.

But I realized that I can also implement a similar API, say 
libxl_dt_overlay_domain() and that way we can reuse 1 and 2 and there is 
not even need to provide backward compatible of libxl_dt_overlay(). So 
would you mind sharing your preference on which approach would you like 
more? Thanks!

>> --- a/xen/include/xen/dt-overlay.h
>> +++ b/xen/include/xen/dt-overlay.h
>> @@ -14,6 +14,7 @@
>>   #include <xen/device_tree.h>
>>   #include <xen/list.h>
>>   #include <xen/rangeset.h>
>> +#include <public/domctl.h>
> Why? All you need here ...
>
>> @@ -42,12 +43,18 @@ struct xen_sysctl_dt_overlay;
>>   
>>   #ifdef CONFIG_OVERLAY_DTB
>>   long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op);
>> +long dt_overlay_domctl(struct domain *d, struct xen_domctl_dt_overlay *op);
> ... is a forward declaration of struct xen_domctl_dt_overlay.

Oh indeed. Will fix this. Thanks!

Kind regards,
Henry

>
> Jan


