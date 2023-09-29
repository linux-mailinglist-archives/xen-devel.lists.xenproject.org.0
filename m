Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655ED7B2D8F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 10:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610312.949680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm8aw-0002AP-5X; Fri, 29 Sep 2023 08:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610312.949680; Fri, 29 Sep 2023 08:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm8aw-00027i-1B; Fri, 29 Sep 2023 08:11:30 +0000
Received: by outflank-mailman (input) for mailman id 610312;
 Fri, 29 Sep 2023 08:11:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VcG0=FN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qm8au-00027Z-QD
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 08:11:28 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c83344b8-5e9f-11ee-878b-cb3800f73035;
 Fri, 29 Sep 2023 10:11:25 +0200 (CEST)
Received: from PH8PR20CA0014.namprd20.prod.outlook.com (2603:10b6:510:23c::24)
 by MW4PR12MB6753.namprd12.prod.outlook.com (2603:10b6:303:1ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.39; Fri, 29 Sep
 2023 08:11:22 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::13) by PH8PR20CA0014.outlook.office365.com
 (2603:10b6:510:23c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Fri, 29 Sep 2023 08:11:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Fri, 29 Sep 2023 08:11:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 29 Sep
 2023 03:11:21 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 29 Sep 2023 03:11:20 -0500
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
X-Inumbo-ID: c83344b8-5e9f-11ee-878b-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRXXebcavbAIu3x/ou5DlaA9GciEF5ZsBRic6/2NqXfdLQHgBAOs5FThbVf/lhFwyiaL1faDzu2ScqsydDE0et6fc75fqyeUrIQ4j18Vp892aiK14MV0ccgI6MZUUd4+OGUbGyTuPBvNINQnHd85NAb7hH3x1f22R6LRfgC8zOctihCV/S4+lGzmXWJUD8RTnSLVAMSZ+SGBDCDKW4k1TM0yW5ee7kGztx4I+LNDEWa44yMmP3o0GT1hsT5HJz9q/DH/+r7X/TuAi7k5Is1FZ/f/p/JTYuPUCD/6mof7W3vcqTMPTPpOINc37rnyo3w498MQxFpWorpGeh34l/xtxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1D+PNNW93vlI/3WCk1GgWBTwXO4O/elQhxDG0g/BZU=;
 b=mPwUfET+U1I2ILXfIefrkIQp16P+eAG+53iDsOt1OzYsk1B1oEonm05XT8TPze8CkHJ1+z8TJ4rgPCG6+vhgRKxx6XGCeW+qftGuDiFxxxv1FCespKXswn0rwsY17ZDLe+Q50jiob89CRocPiRZ4Bx1jvmm+4Nnx0VA9Wrp3VW7QkzlgBsgCkj1KjjuXZqZhaOgi8V/m/3/SP2MbyfkpIho+gjR/PN7324RZk4BNDn0q4dgxqCIcwQ6k+7YjTwpnUn+7eOZmS55HBtKWwAziW16PBltHLcV9QbJ7DE2MPkCjbNt50Vr2m5RUgcBP/cb7BJyqVWjMUJx5R6PJ73SEmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1D+PNNW93vlI/3WCk1GgWBTwXO4O/elQhxDG0g/BZU=;
 b=t85RRYp7H6/Z15K6YoQ+pCKIWBl6DSq8y4ODkaidSYcxn3+wmVWMuhVNApLwXxcpdR9dA7XeazX84ctyn2jLEsf9OGLQsuSsWfP5BWHH9e1fDQgaqTDSeriwWpS6es9bosim0WXMmnh7dFmCOWXvW7s/GqPCwk+fCHaJISCRy1g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a8d87efe-908b-8eed-dc42-550037051492@amd.com>
Date: Fri, 29 Sep 2023 10:11:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] xen/arm: Skip memory nodes if not enabled
Content-Language: en-US
To: Leo Yan <leo.yan@linaro.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230928143110.248221-1-leo.yan@linaro.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230928143110.248221-1-leo.yan@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|MW4PR12MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b416b5b-4c47-4825-cc13-08dbc0c3aab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6RimbXb+Ph2SyU4HWQ8wSKn0tSoMQomyN5/PegrpwI6POBzvoUoxzWVtS+3t+CXGdZrzqLeWa3iACCiRkWPN1NxRLEnWrSzyAHAYggaxmnJ5pLV4DucvxU5GERLgJrMXi4Sh6qDHRcRwMhEan9NGuueg08lqSh2wh2LxMG0ZDhJj0lzQXD0IP8PgcBfe7lFZ7umSip7MbXMR67uoy9TtfW+0oiuD/TYYKjo8WC1Kp54p45ylj6BS4zuWgzmqj76HR28+Fu08qiCPGI7X0kByn0GovWychJmnGOyazyB/Q5ROfroILtywJSLU8TmtVXNBO6xGcJemT3BdZG8lvYT5ehqnS124v5L4cczQKi+MzBRivpPZAD/iRCiRyDlwPKcoFxy1Bw9egG/YimOkzAqMIGsTUOoAINn2M9beJ/tzaY0heG3FFmLl8onlORgctvTZo/u1Fpgc9z9EsTw+kbLM34a1ZLAaCylzDopgxLwyFj1o9UaJarLokb7Aug84uqcvc0IgTYFjg2ayIuORUoRcrnkXVmlnid5tdE3f46fUPw0Cs/bvX8S/A3PCjyLrRuR5WFN7VAoiF96FGmtvowF42XvBwvZCg8dK+HntBf6sKkMda5FfvOUmyvSRYqQ0VjE5GeTTR4JQoLA+fDey8ChTauUtiwAqhuWP9ShwKdY/wjq2xDK71FHN3GZisAhEEVX9I2FtbG3RPJQJmzeRrzHokbFF39/xCJgGuv9h0332Wnt0oGYVP05JrL8W7b6xKTqCygG8NK9RrHN6jtHYINODKYXATUHVk7gP9aXjiTtmBWWD+ojfa2vMHn+mJMnoUeZq
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(136003)(396003)(230922051799003)(451199024)(82310400011)(1800799009)(186009)(64100799003)(40470700004)(36840700001)(46966006)(40480700001)(86362001)(54906003)(16576012)(110136005)(70206006)(70586007)(2906002)(36756003)(478600001)(40460700003)(5660300002)(44832011)(31696002)(316002)(41300700001)(4326008)(8676002)(8936002)(2616005)(47076005)(336012)(426003)(26005)(83380400001)(53546011)(36860700001)(356005)(82740400003)(31686004)(81166007)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 08:11:21.7301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b416b5b-4c47-4825-cc13-08dbc0c3aab0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6753

Hi Leo,

On 28/09/2023 16:31, Leo Yan wrote:
> 
> 
> Currently, the Xen hypervisor doesn't handle the status, the issue can
> be described from two perspectives: the memory nodes and the reserved
> memory nodes.
> 
> - If a memory node has a status "disabled" it implies that it should
>   not be used. Xen does not handle the status property for the memory
>   node and ends up using it.
> 
> - If a reserved memory node has a status "disabled", it means that this
>   region is no longer reserved and can be used, but the "disabled"
>   status is not handled by Xen.
> 
>   Xen passes the intact device tree binding of the reserved memory nodes
>   to Dom0 and creates a memory node to cover reserved regions. Disabled
>   reserved memory nodes are ignored by the Dom0 Linux kernel, thus the
>   Dom0 Linux kernel will continue to allocate pages from such a region.
> 
>   On the other hand, since the disabled status is not handled by Xen,
>   the disabled reserved memory regions are excluded from the page
>   management in Xen which results in Xen being unable to obtain the
>   corresponding MFN, in the end, Xen reports error like:
> 
>   (XEN) arch/arm/p2m.c:2202: d0v0: Failing to acquire the MFN 0x1a02dc
> 
> This patch introduces a function device_tree_node_is_available(). If it
> detects a memory node is not enabled, Xen will not add the memory region
> into the memory lists. In the end, this avoids to generate the memory
> node for the disabled memory regions sent to the kernel and the kernel
> cannot use the disabled memory nodes any longer.
> 
> Since this patch adds checking device node's status in the
> device_tree_get_meminfo() function, except it checks for memory nodes
> and reserved memory nodes, it also supports status for static memory
> and static heap.
> 
> Suggested-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
> 
> Changes from v1:
> - Renamed function to device_tree_node_is_available() (Michal Orzel);
> - Polished coding style (Michal Orzel);
> - Refined commit log (Michal Orzel, Julien Grall).
> 
>  xen/arch/arm/bootfdt.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 2673ad17a1..1b80d2d622 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -16,6 +16,19 @@
>  #include <xsm/xsm.h>
>  #include <asm/setup.h>
> 
> +static bool __init device_tree_node_is_available(const void *fdt, int node)
> +{
> +    const char *status = fdt_getprop(fdt, node, "status", NULL);
Please see Julien's comment for v1. To save some jumps,instructions
we should also check for length of the property to be > 0, just like we do in dt_device_is_available().

Apart from that the patch looks good.

~Michal

