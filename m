Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D27A6428A4
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 13:40:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453584.711160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Al0-000430-Qy; Mon, 05 Dec 2022 12:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453584.711160; Mon, 05 Dec 2022 12:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Al0-00040L-Nj; Mon, 05 Dec 2022 12:39:38 +0000
Received: by outflank-mailman (input) for mailman id 453584;
 Mon, 05 Dec 2022 12:39:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2q+k=4D=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p2Akz-00040D-BZ
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 12:39:37 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df06ae0e-7499-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 13:39:35 +0100 (CET)
Received: from BN9PR03CA0783.namprd03.prod.outlook.com (2603:10b6:408:13f::8)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 12:39:30 +0000
Received: from BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::b4) by BN9PR03CA0783.outlook.office365.com
 (2603:10b6:408:13f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Mon, 5 Dec 2022 12:39:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT026.mail.protection.outlook.com (10.13.177.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.14 via Frontend Transport; Mon, 5 Dec 2022 12:39:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 06:39:29 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 06:39:26 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 5 Dec 2022 06:39:24 -0600
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
X-Inumbo-ID: df06ae0e-7499-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMiqqMrazj14vaf08cfCBNR3hvozS13htiwnx52PNOqLt9kmoxEaG357mn4NNnBH+YsjO9w6aLTG2J5KNdL2vZJuW2o1QASbhB3RysnIrx3yrjwI2U4859VxOAcBE/qFc5LRxYCCjDycu+2xtRGHuYcW76+mweXoLNBvzI69FDIg+Ct4KfJFo6FQHtCO3xGZ95ViiV4jm9qet8zQ6ijN/WnllxVwbWbV7YbK3XXora7BI/zrdKurMKmylolHGxPq+slSFvi9BHUnR2eld4pBTfbNoFgPUS2o4cdRK+yuymIuUDF8jkcVn/tR3TMBIz2Q53Z6KLht/k3UPt3quCuE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9qOP7PT/4Pf87Wgv6YgXPDZZq7+gLLDokToaLQohWA=;
 b=QIEErrVyGnbdMtQEvYiK9XEqioHwPAWQQI9K7feW8J8ML5phXkW6Z6940DUxGHBVYN0G+cx9FpHB5KnFdWpKVPfM+fFAoa0xwyVIka8wuCnjZ3gPMItAYQTCiNllfumM7boon72hhBBk7iXC7YV7cN9J/zpOA7dI34OD2kB23tWr5Z3u85MzHLdwmmL1XULMGrPPYGvyQ91qXJdsl+jCBoVUnAhSraiwOdapM0ljuuLi9N6zIQvE7Z3A8ZmY6q+PCpWr977yDb76pmydNOfrhoDLRHZWza4AK3WMmlfWFVtBrLGyPzrZ13F2FQNKp7IQUolQ0Phn/fRmpR/105Oa2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9qOP7PT/4Pf87Wgv6YgXPDZZq7+gLLDokToaLQohWA=;
 b=M3DMTzW4T7TeKHZvbdyezdvUB7XxpLKS1kVRkqJz9ydCt0CLcKZmJ/uXae3W8hv389xPjmJRjGUI7Px33qV5ogIpZJILt7NLSa+W8wC9gz8AtKuU46c9sB/adCAECCH0mJeH/uKTnT2eTwju2nPTEyFBhktque7LfBuKGS8i8d0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6ab96cd0-9b9a-6ad4-50b1-ed5e02812696@amd.com>
Date: Mon, 5 Dec 2022 13:39:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v5 1/2] xen/arm: vpl011: emulate non-SBSA registers as
 WI/RAZ
Content-Language: en-US
To: Jiamei Xie <jiamei.xie@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221205072640.2092473-1-jiamei.xie@arm.com>
 <20221205072640.2092473-2-jiamei.xie@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221205072640.2092473-2-jiamei.xie@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT026:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: ee790d15-8587-48ed-c05e-08dad6bdc0d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q838UnKGdhYVL6fpCtTi007n1H/z17ehCwJhlh0i54ftII4LJd3mF2vCgoi2tUOXi0N8O6EWHGJDeYM603cErNL2hbrZ0RPxQqyLMtUS5Aw0CWzMku2RHxZXvbeL98pvn6xDAAdJGql3DH05bBZGC2hruFVMk8RR5PiSNxwOcEhB5cO4J5HtIqX98rWvhOvLZwLJKZsfjKDh/V8rEnVqi7h7SsqW2gLlGLHfA3IKvhmUFn5+dvM/o1lCHSh2t59BSRo94MCyfj0VTRg1akUiRKtiG6JjHv/iOpRCEmJpA8KcKUWeWbxAGOumfG7SH87aQTFBbyx/qLvGquKTYv6cAUzOE0PFRuskLsNNZNo9lYcF+T+3CNFqpIESW6GHTgHCHXl42f8605gX3DmXQmiuZ2p6aZvnNM8w27tFsmT4891r314H+9e5tsNmDRcE+zzblHjHznfnikW8VpKGKXAicFGiKTIp9yEel0M2RaeyyDoeCk1HIG5hGUwOPNzUGPlVOCuLD1QownRh7JYLp3GvHTm4CTApsqtF4j2tRbEXj/rBH5gjunyVEbgYhK6/NSbCwcEVYOaFMP3OouHdKJ1sN+G/NCtrVnUM+AA87OHuWnoI8sKSk8x33G2OWYkxNeZwWK3CmlYif4nr0Ld9+ZYOXPD4GLupQfN8RDtGdxLjKJrixN79btYB1OpoxPsDYWiwkGBIHFCfyNdigcAhrZFdZJBzHGr/W136zmAjMpXL/CfO2bRa1tjscWsC1qdPIOgf/TmnmLv0keDE5kyCRa9lTI38qMRSfd2WsPCZTJxu2HDyTw6B6qeSAvtkNM4XXZbZdtGfo7xH3mtBcKk7jd0iHw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199015)(40470700004)(46966006)(36840700001)(36756003)(82740400003)(31696002)(86362001)(356005)(81166007)(2906002)(40460700003)(41300700001)(8936002)(4326008)(44832011)(5660300002)(36860700001)(83380400001)(70586007)(478600001)(966005)(70206006)(316002)(16576012)(54906003)(2616005)(110136005)(31686004)(40480700001)(8676002)(82310400005)(336012)(47076005)(426003)(53546011)(26005)(186003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 12:39:29.8536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee790d15-8587-48ed-c05e-08dad6bdc0d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081

Hi Jiamei,

On 05/12/2022 08:26, Jiamei Xie wrote:
> 
> 
> When the guest kernel enables DMA engine with "CONFIG_DMA_ENGINE=y",
> Linux SBSA PL011 driver will access PL011 DMACR register in some
> functions. As chapter "B Generic UART" in "ARM Server Base System
> Architecture"[1] documentation describes, SBSA UART doesn't support
> DMA. In current code, when the kernel tries to access DMACR register,
> Xen will inject a data abort:
> Unhandled fault at 0xffffffc00944d048
> Mem abort info:
>   ESR = 0x96000000
>   EC = 0x25: DABT (current EL), IL = 32 bits
>   SET = 0, FnV = 0
>   EA = 0, S1PTW = 0
>   FSC = 0x00: ttbr address size fault
> Data abort info:
>   ISV = 0, ISS = 0x00000000
>   CM = 0, WnR = 0
> swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000020e2e000
> [ffffffc00944d048] pgd=100000003ffff803, p4d=100000003ffff803, pud=100000003ffff803, pmd=100000003fffa803, pte=006800009c090f13
> Internal error: ttbr address size fault: 96000000 [#1] PREEMPT SMP
> ...
> Call trace:
>  pl011_stop_rx+0x70/0x80
>  tty_port_shutdown+0x7c/0xb4
>  tty_port_close+0x60/0xcc
>  uart_close+0x34/0x8c
>  tty_release+0x144/0x4c0
>  __fput+0x78/0x220
>  ____fput+0x1c/0x30
>  task_work_run+0x88/0xc0
>  do_notify_resume+0x8d0/0x123c
>  el0_svc+0xa8/0xc0
>  el0t_64_sync_handler+0xa4/0x130
>  el0t_64_sync+0x1a0/0x1a4
> Code: b9000083 b901f001 794038a0 8b000042 (b9000041)
> ---[ end trace 83dd93df15c3216f ]---
> note: bootlogd[132] exited with preempt_count 1
> /etc/rcS.d/S07bootlogd: line 47: 132 Segmentation fault start-stop-daemon
> 
> As discussed in [2], this commit makes the access to non-SBSA registers
> RAZ/WI as an improvement.
> 
> [1] https://developer.arm.com/documentation/den0094/c/?lang=en
> [2] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2211161552420.4020@ubuntu-linux-20-04-desktop/
> 
> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
As I wrote in v4:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

