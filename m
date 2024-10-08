Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 039AA9958EB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 23:08:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813591.1226593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syHRC-0004HO-9V; Tue, 08 Oct 2024 21:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813591.1226593; Tue, 08 Oct 2024 21:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syHRC-0004C2-60; Tue, 08 Oct 2024 21:08:10 +0000
Received: by outflank-mailman (input) for mailman id 813591;
 Tue, 08 Oct 2024 21:08:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syHRB-0003sw-3D
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 21:08:09 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20618.outbound.protection.outlook.com
 [2a01:111:f403:2417::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a0f1a64-85b9-11ef-a0bd-8be0dac302b0;
 Tue, 08 Oct 2024 23:08:07 +0200 (CEST)
Received: from BL1PR13CA0096.namprd13.prod.outlook.com (2603:10b6:208:2b9::11)
 by CY8PR12MB7754.namprd12.prod.outlook.com (2603:10b6:930:86::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 21:08:02 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:2b9::4) by BL1PR13CA0096.outlook.office365.com
 (2603:10b6:208:2b9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Tue, 8 Oct 2024 21:08:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 21:08:02 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 16:08:01 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 16:08:01 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 16:08:01 -0500
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
X-Inumbo-ID: 6a0f1a64-85b9-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZkRU3xAnDiky3Cm/109Dw74ME1astqkDuBvsG8chZ4484kQoQ0HLlaOdUudOXiCcHI65kkSRTw9z0PQIxgcicZcRV2AJJCUELf/uVGra1Dq2DPJS4VDtz4ChybBRRRtVS4FEPOf50JGpdLahaQhkF4iH4s8A9ZZRw5CBbjbSCQnLp51fGrTzrBCWV2WFSGPeOMfqlnRVBssLi2jzYD/NxOEye3n2n7ptnjNvwX/V6Z7QG0yk2njzxnLE+nqvMZy0GlpTQyjPGbqXOfOGQszI1var69kacKrDqTFH5qMZYyPg4zt+qQSZw1ai2RjMWLJPqClyTLlKu23L/0bZGQfqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJnNbXUqgnvDHOeVPbx6Ki6reQT/IHVy4rJaQTjB93I=;
 b=kVEf/y5FBfYLl34vg5pQk/53BwF71kog5rmD4PzxJ4q0Vr8TG8nneVREZynsxl+3IATKzhJXx04vvV689HuMcEdzTcSuZGN0kDrX6xeZxuL/A9Yfgp/SZ9wjWnvZK/D6R1c6W92eDP2J05cWIuW7M61TZ3fxgi6rjYrSwS9S9CgKNGaIL1Iysn9QlYp67bfR8uT2KssJ9ITKmP+1g3YbQmGDvriawTheBOoelwKQKYEo66f3wzMN+E3lzVQqwQWNb8iMgSgR+E7yd2h2SRULOszpCnW3Ae022TFC9Eu65ADC43oYFJK8HOC/XW8mljECygoIw+D1HflCI+Gx0A909w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJnNbXUqgnvDHOeVPbx6Ki6reQT/IHVy4rJaQTjB93I=;
 b=2YIZmjzcd7D/Sm3J4Kg6LsLyG+dGLsxuv/BVqPwjYlnPXa4J42dCcbTrzz8hc7k3CnwBQ3uBKokmSNZ2nd2Skytz53zcbzwmPo5xnjng6IjKdZdY0cHWv1vcWym5Aqi7OQxJrXrxtH7FjluCOHjE/HL220roBIYeDTkAJMPgKaQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <11c20a80-65a6-4b77-b890-775ac2d72af1@amd.com>
Date: Tue, 8 Oct 2024 16:07:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v5 00/44] Boot modules for Hyperlaunch
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
Content-Language: en-US
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|CY8PR12MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: 78daf58d-5137-4546-a9e1-08dce7dd4bbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlcvZVowY3dta2Zqb3JUbkRobmw5RC9MQUc4QlQwK0w4SE1wU1A1YkFPdzRn?=
 =?utf-8?B?YnQwUzRkUmtMakgxVkoxbHJvREhPdFY2NjMzVWFFMG5wamdMSlpML3B0QUpo?=
 =?utf-8?B?UFRqTmEzREdiZ1lDNW0rRTRSTjJVVHNlWVM0K295eUlvdTVYdlF1NEY3Y2pZ?=
 =?utf-8?B?eWJONnN0Uk9JcUtPejd3N2FZWlN4aFlCWGRUWjFwd3piaEgzcFQ0RHBzaTJD?=
 =?utf-8?B?amlyUzVyQzY4SkJqeVcrR2NpSDN2VkxtUG1Rc1FLK3VVK1ZucFcxdUo3c2Rw?=
 =?utf-8?B?ZTBZeFVrdTl0V1NrNklseG53NDdGM25NRjlxOWJyWElNUmllZVdiODN6YU5Q?=
 =?utf-8?B?eWkrVUJIZFJRMWxSblNRS0prQU53N3ZMbytqd2ZNOHhyVzRXV3VxZVVvY1VO?=
 =?utf-8?B?YngrV2Q1bWNUUGh3eHZSVFJ5bU9RTXFGV2ZtR1RPUTNZTE1aaWlFRk4wcUk2?=
 =?utf-8?B?aWZoL2JwanF6VU9UbjN0WHNqdTMrY0V1WkY3ZStzQ0RSRnJPMCt5YWRNV3kv?=
 =?utf-8?B?cmFxZUNqOW01YXlrcndTRGd6M2Z5Wmt6Y3NMeUZNb1JITU50YTNMUFViMU5a?=
 =?utf-8?B?b0lIZUFxd2FQYnNvNlI2dUdlVmdMRmEyZXgweHdqTHZVR3VkNFpNVDc0K0tE?=
 =?utf-8?B?Q0wvWlZoMXNOMW9QYmc1QUFMWWkrR1dVVllXL2p4c2lhSzdMU0JVWFl0N3ly?=
 =?utf-8?B?TTI3REJjYXZnNEJxa0hyZ1poTlF3bWI4dE95cHp1TmRwem1JbVFuYTlLbVhy?=
 =?utf-8?B?emtBcEZlcnUxZ2NJYjhCWm5nWGQ1a005OHI4NUZTaGJRcDA5ZlpWTHNlYzFB?=
 =?utf-8?B?S2NxaG1KNXIwMHdMclFDVmpMdldHanlGcWlQWWJ0N2VRdzNBc3FxUGRWVFlP?=
 =?utf-8?B?OThWZ0VkREFhV1dhcVhjRldzUnJXaVdiajJUekxYSUkycmhlSVhlL3NBaWw4?=
 =?utf-8?B?cWt2cTlVazlMTllvTENET2w5bURLVTdwS2p5R3o2QW5qZzhRdXJuMWVDUGJw?=
 =?utf-8?B?UXhTMkU5OXg2QjA5dEZBSk1Ec0V6aS91RW5QL2MyeDNZWjViT0xqdDFlbGUr?=
 =?utf-8?B?ZmZPWDhUeCt5Y1hZUWlPaUJ1THFHZHIxaS9JV25yWkxNRnRtYjF0NGhpQTZu?=
 =?utf-8?B?dTlZOWEwWWpWZi9XN1lUN3R6enFrREFKSHpjcnFiRXVRQ2ZGYktSY3U1QjU3?=
 =?utf-8?B?NGlubFFKY3M2M2RqelcrTXA3ZDZCT2REY0l1L1FiekJzTUgyaHNJWXVRaHE5?=
 =?utf-8?B?NGlZS3IwZ1pOdjR6bVBHVzdhbUE1NllhQ3cxTWxnZGRhbmR0Q1RLNWUrL25w?=
 =?utf-8?B?TGNBL3J6RFhKUmt1YkdadlVwVWZoVjZ5UHd3ZWtqcjcwM0c0ck9nWmVvRUlE?=
 =?utf-8?B?MlZSL2dONEdYMHZIb2IvYmRVNlI5NEQ3WnNNSklLdlhDUEF6ZGVaNTRjb242?=
 =?utf-8?B?NHlaMUorQ3p1OVoyN0FpUXFDMkRIaXRaVXZ4NG9sZWg2UUtDL3VzTFB5d0Er?=
 =?utf-8?B?eXMwWkNJN3RBUm52S0ZyanZRc251eDkzdCtRLzIzYVNOU2F0NUl4UlZqUUs4?=
 =?utf-8?B?cWZOWW0xZ1VrazZLS21BVU4zWFRZL3o2SVpmeGtvSlN2NTQxZHZVSmh6ZjRn?=
 =?utf-8?B?M3NVWjQ2aFo5aDAwd3VhUDJwK2ZzUGZIMWVwZ2RRRW5mWFVaM3hHbzRqQWxP?=
 =?utf-8?B?ZitsdzZES3ZlQUxZcFZWVGRLU2JuU3hGTUx0L01VVHViaXkybmFaWTBHU1FX?=
 =?utf-8?Q?Ywn13qMojDUoqQ8lSeqjdd9V7k5yOCar4uZMZNj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 21:08:02.3652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78daf58d-5137-4546-a9e1-08dce7dd4bbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7754

On 2024-10-06 17:49, Daniel P. Smith wrote:
> The Boot Modules for Hyperlaunch series is an effort to split out preliminary
> changes necessary for the introduction of the Hyperlaunch domain builder
> logic. These preliminary changes revolve around introducing the struct
> boot_module and struct boot_domain structures. This includes converting the
> dom0 construction path to use these structures. These abstractions lay the
> groundwork to transform and extend the dom0 construction logic into a limited,
> but general domain builder.
> 
> The splitting of Hyperlaunch into a set of series are twofold, to reduce the
> effort in reviewing a much larger series, and to reduce the effort in handling
> the knock-on effects to the construction logic from requested review changes.
> 
> Much thanks to AMD for supporting this work.
> 
> Documentation on Hyperlaunch:
> https://wiki.xenproject.org/wiki/Hyperlaunch
> 
> Original Hyperlaunch v1 patch series:
> https://lists.xenproject.org/archives/html/xen-devel/2022-07/msg00345.html

There is a lot of re-formatting of function arguments like:

-static int __init pvh_load_kernel(struct domain *d, const module_t *image,
-                                  unsigned long image_headroom,
-                                  module_t *initrd, void *image_base,
-                                  const char *cmdline, paddr_t *entry,
-                                  paddr_t *start_info_addr)
+static int __init pvh_load_kernel(
+    struct domain *d, const struct boot_module *image,
+    struct boot_module *initrd, void *image_base,
+    const char *cmdline, paddr_t *entry, paddr_t *start_info_addr)

I feel like the old style is more common and I prefer it.  But I also 
don't see it specified in CODING_STYLE.  As I am not a maintainer, I'd 
like them to weigh in.

Also, it is nicer to include a per-patch change log instead of just a 
cover-letter one.  That will be useful in subsequent review rounds to 
clearly identified changed patches.

Thanks,
Jason

