Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AFE8671A9
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 11:43:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685429.1066116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYSF-00029j-6q; Mon, 26 Feb 2024 10:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685429.1066116; Mon, 26 Feb 2024 10:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYSF-000271-2r; Mon, 26 Feb 2024 10:43:27 +0000
Received: by outflank-mailman (input) for mailman id 685429;
 Mon, 26 Feb 2024 10:43:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5KjY=KD=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1reYSE-00026v-A6
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 10:43:26 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd56e116-d493-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 11:43:24 +0100 (CET)
Received: from CY5PR18CA0059.namprd18.prod.outlook.com (2603:10b6:930:13::22)
 by SA1PR12MB9245.namprd12.prod.outlook.com (2603:10b6:806:3a7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 10:43:21 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:930:13:cafe::fd) by CY5PR18CA0059.outlook.office365.com
 (2603:10b6:930:13::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 10:43:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.78) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 10:43:20 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 04:43:18 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 04:43:18 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 04:43:17 -0600
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
X-Inumbo-ID: dd56e116-d493-11ee-8a58-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KO3fNJYsXRFS8x329BGiiw3AUUFQ3RiCeQLDRHoODMv4f3Df8GfuV7eLIZXY1C6LsOpwyo8k0Eed3ZKTZBu+u0M2Vqcg4yEHcoocvj7mVGWB5qzEbSi37dyKau8LV47ovhqzdU2vW4kW1ls8HII9EeMw2FNSDOeoDo69temux9Z7NqPxqazovTR9qQj1hUe51PylDuEr3fx7Lq/Tewf1VUZ9K3+qpj5dB96KL4iHVt7eu5y0nIluz3Cv/HDLfVNrx79/H4lnhR7dUo/EjOD6rYsrozhO0T94r3srt8Mdy6zaZd1ODl0OzldI45huMydOIGH2klGHP/v572UVpwWf0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22VHKlc203k+dAjDW5lk4FTjC3jvnaX7PtHMAahlusc=;
 b=Vnm2NpUU/60YRcrtym9UFojaDwEHElmoEmBKEd3qHjcLh9VSlJtvLQLWlOuj/CxgXaY5vWTC9AJ+zs7DWmkUwmpxDa2EngrVKsaM6betzh+WjH9cxziCyKF42M0qwRcUMlcdHVYGjpzXjTZ56nlxOxEvAm41PmYTiWi72Sr5Yt4L/FrWO6i98UTXi9vcGT3rGmfhYLpGotWIiXND4cLIV7lMAQwu0fLZD39fp8txAXYYPiElxLxUGfkKfPnpkU+i2FbdJA3Q5l2zHUMNsCJPHJn50FMeLOWc0sPF6b+8T6DUiJwqaojVa/PnQz+QBgt5VOGpWEmF0gjnTgLYlojmHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22VHKlc203k+dAjDW5lk4FTjC3jvnaX7PtHMAahlusc=;
 b=rTMT/w/dRSsVz806O1wMgTKILrMCVkZXPG/NUqMTZfSZtNVWg7RwjzSdQMwLD8zkCqP4ki1glJTz4U0AwnP580KXZXHG/OvajtrV+KiXMGgyc014FRI+e7/uqWrMxKBq/I3bj17JFoHR4qdCvmPcsedqxBrofU9yzFzA9YhYI5E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e5cad59d-9c3f-4e4c-8b97-5e0fbd4eeda2@amd.com>
Date: Mon, 26 Feb 2024 11:43:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Set correct per-cpu cpu_core_mask
Content-Language: en-US
To: "Wang, Henry" <Xin.Wang2@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240226030146.179465-1-xin.wang2@amd.com>
 <de4c6988-7051-4d44-9b44-e850ad4b4cc1@amd.com>
 <DS0PR12MB9448472A793F33228BE6A185A15A2@DS0PR12MB9448.namprd12.prod.outlook.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <DS0PR12MB9448472A793F33228BE6A185A15A2@DS0PR12MB9448.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|SA1PR12MB9245:EE_
X-MS-Office365-Filtering-Correlation-Id: c490cd9f-2d75-48ea-ce85-08dc36b7bfde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ssm7runJnLBYC2+svwPJH9RWno3NX661adpBIf4Q9+M21g+YaeD0sGi6DbpKkW+uaVWpDMvIAbxM37IAQVTfK67Q3M6SqylZ2v6IiRLWMMTRvBzHfpm/1/jESmaTWoOsaykFvFMhymZK2QYCIzJd0R9Bvv8SBnhYRG9dmE3M4NzE2Qj9LG9Z+KqjaTWKPF9jP+szuu/g7Blo1/2f/JD6I2ZlW+er1vIQ/yVsAQGCw5KOSA54nzQce0C+jjlRwEzCekIw/sYXT2r1U+DBt+uGdzsXfREDeLiM6i8WrE1SaJjmPZRat1rWUDxRoyOibblCmSGChrGiPBlL6O2txkjVGkJbarzATg59D9LQO3n2/ig2nILX32/aMiZiuO49NuTPJfKWdfgXiswegNn8btW5Q33effPnKq0soA0BRqlT/a1qC5afa3ZD7QMsSoPxfGQ8RNawrVY7+ipYpZRm+xZq+zsu4XkzxZ65upihar8k6g7C6DwZfCfVL+vbKZo5vAaSTQZ+3KEw6Ucmqld/ciuBHnOP+eICvnxqZwQygMeTfGbiThTC3w8qhTDhPm3Qyr3vwhBF2H7jpIJnSQgXmvk9yuR6jVWxjwlvK9KN8adg5iB30iras2pAAl7YWmhGhU1lFSCTSKnSJU2guZhSjeH1aYTjhXD8bVXVkzu6f5Sa9oPm2btXu20cY3aiDzEr81d9I+TJO8ttBWKyLEbF1/WBf0jEwT/mIyjby6O2H2htZKWgk5Gtt0FpT5fm6xTDDxcw
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 10:43:20.4639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c490cd9f-2d75-48ea-ce85-08dc36b7bfde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9245



On 26/02/2024 10:54, Wang, Henry wrote:
> [AMD Official Use Only - General]
> 
> Hi Michal,
> 
>> -----Original Message-----
>> Subject: Re: [PATCH] xen/arm: Set correct per-cpu cpu_core_mask
>>
>> Hi Henry,
>>
>> On 26/02/2024 04:01, Henry Wang wrote:
>>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>> NIT: You first sent this patch as part of NUMA series:
>> https://lore.kernel.org/xen-devel/20231120025431.14845-16-
>> Henry.Wang@arm.com/
>> Shouldn't you retain the Arm's authorship?
> 
> Ah good point, in fact I don't really know, since I basically rewrote
> the patch I thought it is not really needed. I will add it back in v2 since
> you mentioned this.
> 
>>> ---
>>>  xen/arch/arm/smpboot.c | 6 +++++-
>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> +    /* PE not implemented using a multithreading type approach. */
>>> +    if ( system_cpuinfo.mpidr.mt == 0 )
>> Do we need this check? It mt was true, cpu_sibling_mask would be incorrect
>> anyway (it would still be 1).
> 
> I added this check for playing safe, because I only want to do the correct thing
> in this patch and avoid make things worse for MT case. With this patch, non-MT
> case can be improved and the MT case is remain unchanged.
> 
> But I agree with you, and I would be more than happy if I can run a MT setup and
> finish the "else" part with this patch or follow-ups. Do you know maybe qemu can
> allow me to emulate a MT setup so that I can fix it properly in v2? Thanks!
A65 is the only Arm CPU with SMT and I'm not aware of Qemu being able to emulate it.
AFAICT, in Xen on Arm we assume no SMT, hence my question about your check. With or without it,
some parts would still be incorrect (like cpu_sibling_mask), so what's the point in having a partial check.
I would keep your solution without the check. Others may have a different opinion though.

~Michal

