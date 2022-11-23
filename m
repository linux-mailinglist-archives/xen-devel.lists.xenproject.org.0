Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9C063581E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 10:51:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447482.703744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxmPq-0004bB-Jg; Wed, 23 Nov 2022 09:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447482.703744; Wed, 23 Nov 2022 09:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxmPq-0004ZO-G8; Wed, 23 Nov 2022 09:51:38 +0000
Received: by outflank-mailman (input) for mailman id 447482;
 Wed, 23 Nov 2022 09:51:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P5PS=3X=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oxmPo-0004ZI-Vf
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 09:51:36 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69d9a9fd-6b14-11ed-8fd2-01056ac49cbb;
 Wed, 23 Nov 2022 10:51:35 +0100 (CET)
Received: from CY5PR15CA0076.namprd15.prod.outlook.com (2603:10b6:930:18::27)
 by CH2PR12MB4921.namprd12.prod.outlook.com (2603:10b6:610:62::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 09:51:31 +0000
Received: from CY4PEPF0000B8EA.namprd05.prod.outlook.com
 (2603:10b6:930:18:cafe::6c) by CY5PR15CA0076.outlook.office365.com
 (2603:10b6:930:18::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Wed, 23 Nov 2022 09:51:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000B8EA.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.11 via Frontend Transport; Wed, 23 Nov 2022 09:51:30 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 03:51:28 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 01:51:27 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 23 Nov 2022 03:51:25 -0600
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
X-Inumbo-ID: 69d9a9fd-6b14-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qvi/Ce245i4V2ubyHOvypLPl5xdmskz3vw8anI4c8Ewo7A2IVxxxEaULOQvzllBzQQ0i6EC9swInl7ft6t1nAXxjrqXRDqwUckwlNoFbfz0z19AU1d9kV0IFqcRix003OL6yQ0LY4tXk9xdFVtgxDR0tdqnBAkxK0jmptn696PAMXSPka091vdBg+DozJH+iEOo+r8YubDpAulEaTxXilws8IiCq6MXMTmZ7NMSgBFWcZCEWe/JT5kclRL1Lqb94d3lOfXLSeDrav/tKMerf0Iti9YtBhI1ostO5hyAw+zEreJHnLTD4bwBT4q/iBS8zm4uM0BFxbN9gRYegYtLaqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3AFr8Lf68vB9ret9F/CZH0Sq9Bs6pdxsluAiTqFWBI=;
 b=H9jzBoqP1b+VG8djYhpt4k1vRusCFlElVHcHwOe+gY0C5HNKt+AYimJ+8Pwh29jHRY4igcEqzvK2K61yPKOt/hnhhvq8oUvD3Qm6adzoVdCduxTyzkXI/+F8Cdt7E76PG0H3AkY1QjGcyzbNrueuyZkdR7kgxV7ZPNwOVMuYvobm8ahhCzGhiiC6dPCohJMMcAPewuZoWrEfJUK/MC7V+hC8asqS56CKaiGiHlyXhIu9KGj+ZxeHuRSpekcZf1LZEG6qa/pD2U4yJYMI0QaeNQQ77ZA5TRQQFX/4ZBirwSvjO6Gz+CK7srlNoICT0BvMgveef2lVeeCOgLXI6YdN6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3AFr8Lf68vB9ret9F/CZH0Sq9Bs6pdxsluAiTqFWBI=;
 b=v5+WEbXyoZOpqK6c6jJq/+DQBToh5mfswc8nzjeJ2CrWuyfNI+omVfJ8igUka6OJ8g5jRGQ4Q7nItXxCOb07VAG98wx6zWdNjChxElpcvRVAs9J4yYLscGxxzvziAr8588BkEBqdGOKS705B6eL4PD9o6XkzzFOwiNoRjTpIXm4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e2345a5b-451c-15f9-46b0-270aeddd5d5f@amd.com>
Date: Wed, 23 Nov 2022 10:51:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [XEN v3 12/12] xen/Arm: GICv3: Enable GICv3 for AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<jgrall@amazon.com>, <burzalodowa@gmail.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-13-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221111141739.2872-13-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EA:EE_|CH2PR12MB4921:EE_
X-MS-Office365-Filtering-Correlation-Id: 756163dc-0db6-485e-2cac-08dacd384c62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kq5URaEP1VD5puEP0LBHlyC40py7iyr6ZueXK1nYRDapJ6bKfi0buQUWE4nwTPgBS0NGx0WRmQzgsjRnPyxdESDy9HDSlFYzX1/gPzNFozPiqLCycam/O9MWrDRNdT3+y2iZzctgZIsmkxWciw7Dv7za8XTm2VlFGXpGe7H3e6mg3Tyae7u/qEbWeSUMr+cnWfPOv7Vg6uPjXUMQeSxhOFfzsXsjgwBdU9NAGkPoLzWuAbwZyUmWtYN67QuzmWQYayrF7H4MzLuWLr7UE/Iq5uIbq/vSZpPejdCLpDDQTD8a3iacLSNhjfZHDI2d2v0E6aAThi05lJZVjI5g/jK+6ERinv7oTr9b9TMM+/5UZ3zgYM9w/rhAezo0iBuklfz0wINgB6Tww5/nDfaMycPRTdgOyjGBGmoiEA+kge1lQzAzppPYqzG4cQTk7rlOxFPpOKsVD7XWNKQdeXnWrZ2OF+eIM9lfcRtvDvZ3XRQ7upCGlS7NI8YOWI8OlEkj/2eHk9BxO5ImZDZREGXjyx9OlWaM6JqGx2rW9fhmXSq/JV+9HHhahcnAOrwVXOZg+NZU59qHi7qKEalYszXcv6Tfns6KrtC1CWzGRd9QKyA6SqY+NZfivYCCdXuKh8ukFyxBwkx4OLwLLMiOuYKZ1aYBSyepMJWrQwwxMakYP4m7IfDJyCUetBtMVTs/DRtCG7DI8ftcVn4iigQRBp03XkomsOJRj5V3SOGWzIa0sNy16bySO1hPptk0TqdmDL+FLVX0Iz52IiQX4H9wbbxuEiRWeA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199015)(46966006)(36840700001)(40470700004)(2906002)(36860700001)(31686004)(2616005)(70586007)(70206006)(53546011)(41300700001)(36756003)(82310400005)(31696002)(86362001)(40480700001)(110136005)(83380400001)(356005)(54906003)(4326008)(426003)(82740400003)(81166007)(47076005)(8936002)(8676002)(6666004)(5660300002)(186003)(44832011)(16576012)(26005)(336012)(316002)(40460700003)(478600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 09:51:30.8617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 756163dc-0db6-485e-2cac-08dacd384c62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000B8EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4921

Hi Ayan,

On 11/11/2022 15:17, Ayan Kumar Halder wrote:
> One can now use GICv3 on AArch32 systems. However, ITS is not supported.
> The reason being currently we are trying to validate GICv3 on an AArch32_v8R
> system. Refer ARM DDI 0568A.c ID110520, B1.3.1,
> "A Generic Interrupt Controller (GIC) implemented with an Armv8-R PE must not
> implement LPI support."
> 
> By default GICv3 is disabled on AArch32 and enabled on AArch64.
> 
> Updated SUPPORT.md to state that GICv3 on Arm32 is not security supported.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

with one remark...

> ---
> 
> Changed from :-
> v1 - 1. Remove "ARM_64 || ARM_32" as it is always true.
> 2. Updated SUPPORT.md.
> 
> v2 - 1. GICv3 is enabled by default only on ARM_64.
> 2. Updated SUPPORT.md.
> 
>  SUPPORT.md                            | 7 +++++++
>  xen/arch/arm/Kconfig                  | 9 +++++----
>  xen/arch/arm/include/asm/cpufeature.h | 1 +
>  3 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index ab71464cf6..3f16d83191 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -82,6 +82,13 @@ Extension to the GICv3 interrupt controller to support MSI.
>  
>      Status: Experimental
>  
> +### ARM/GICv3
... For me this section should go before the section ARM/GICv3 ITS.
The reason being ITS is an extension and your section being generic
should be listed before listing extension.

~Michal

