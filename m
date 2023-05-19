Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9303709264
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 11:02:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536791.835490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzw03-0005KI-0c; Fri, 19 May 2023 09:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536791.835490; Fri, 19 May 2023 09:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzw02-0005I1-U9; Fri, 19 May 2023 09:02:10 +0000
Received: by outflank-mailman (input) for mailman id 536791;
 Fri, 19 May 2023 09:02:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9j/4=BI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pzw01-0005Hv-6M
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 09:02:09 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3dcc792-f623-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 11:02:05 +0200 (CEST)
Received: from BN9PR03CA0361.namprd03.prod.outlook.com (2603:10b6:408:f7::6)
 by CH3PR12MB8331.namprd12.prod.outlook.com (2603:10b6:610:12f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 09:02:02 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::23) by BN9PR03CA0361.outlook.office365.com
 (2603:10b6:408:f7::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21 via Frontend
 Transport; Fri, 19 May 2023 09:02:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.21 via Frontend Transport; Fri, 19 May 2023 09:02:02 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 19 May
 2023 04:02:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 19 May
 2023 04:02:01 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 19 May 2023 04:01:59 -0500
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
X-Inumbo-ID: d3dcc792-f623-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/sOPuPCfqeA5d5eK0IYYiJC0huvLBoKzwOcvWRJ0QDZswhqwx9HQNS4BfwSNbLA5zH6DM4pNMba5z3BhkABhmrVDo5z5cwRdOhRh3YasGNjI3kLySET6pmVKx0KicUIxA+60HPopeYXONyn80X5XeplEWEa4PYLcG1VPvEZQBIYu/d4mwW+7Pa7CCiA5GfIT9Hkhbm0ugiR7FlUdxfWSlNSadHOBRw6mHipu8DN3o5R4QD0n2cAQXemgquGX/P6ckZ1R0nzGGOLwY9gBU0AQ3SRu8Ib8QJooVMAITUQW2UURIl3EMoGKIhpT7X4y5NXra5OvNIWI7J21w8fn7D7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOUjcdEH9fDlsrAVmFsfUK4vNJ6hQlSxplVv/eOZy/8=;
 b=i0xsMhWguTf6qqUVmWLc6Q5y3ehY7XgHa5TVN7teFofhRQMtBYB5L9fHjEKhjYOVnvLGrzV0iZkdmal9mv5UmJ5W5SwrXJ3vnNBOyLkn8MR9hwg8zz4oZ1mdScwN2dUK0VG8BoGFJCxavcpKocSTjMmzZKn9uxTbjZ51kLNEyA15W8KWq5o2S1qp8a4Ek2ZmwJQS4ciceM6c/DARmtieUilIRVrZDFqdYsfNrrv4nw/Jhnt8Sd2AP40wOWL9FOL2ImxofrB65vNC85EDJx2LYBS+sSgJxnxPP5lep8OkO0a5mwi3MtDGI9iYIBfm3+SWJbqNsE5/KIqUc8XRED+dwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOUjcdEH9fDlsrAVmFsfUK4vNJ6hQlSxplVv/eOZy/8=;
 b=Hm/6YsIYYGN1wTlNDjjIi2aPDfTelrVrutbd3X3N1UCCFwDPoA+UfSVW2orF4nkOOxpBt9iTExZdv/ow8iQG/b9H6/lyunp/ccoA3/Hymt8namqttDqx0xLKnZ9PdMl8NNnXyghn6fJBUEGfJmNC3o4ToeE6b/GElJusIZVh6i8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a75e3528-8583-d8d3-6946-91f171b62511@amd.com>
Date: Fri, 19 May 2023 11:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN v7 08/11] xen/arm: Introduce choice to enable 64/32 bit
 physical addressing
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
 <20230518143920.43186-9-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230518143920.43186-9-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT025:EE_|CH3PR12MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: 509c234e-daa7-4e86-b9a3-08db5847b629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XNsvovRhny4OfMLllAbCpyw28m87JpBmvsw6eW92xNqJx3yBb/der0Xdth7QImnxLo5Z6hThSrEn3QFkMdiM4WuvTjJa0tG3mvEhiMa9YiLtC5rFEFjD0TeMiuRPVaJEYXx/2guNWOI63q3jgSw72lBS4UqMsUrkD2rV/K5SsjHyOc57iuc+HFiGXHy/GBo5+zjZQ2+Z0/JEGiIdGtfoHx3vhMglxwdA8SbDk5wvQ7Zlbkso0WkTYBP7bT4dkG8RLVxMqVcBMh0WVGqg0bfjJ7ZE5c/H5rUizD9j7X/tOeJv1VFMfqNjrg6W/tSMYVedhqBO969UBg+upfVDs25N0iTy3jT9svOVfDn25+YLHSEgtFxEqDMEKqJmUcF1rSOgFzUX/JtH7fqUn5BcQtz5BO5BOSYcTQtdBux1oS7WaRSyzXWBFnztfa3kIkeEXVoyasrDEBJeqxSnC8RcW4v/8k+A2MOWDLcHr4dqA64c8YlRcUusFsBPUeJmVhYpupQP+x0LJX5yw6QVrzxz25lKMlGimvLHg7DuM/gGDqudn7rx4Gc0C3w1JBUaTmcmBe/bftV5zug/8BP6h49UNTNg9rReIgGekG+PvmupJOJwHAs+UyWsWaylwdvKx/aCb3catiBUj49xaqPv4gomzZ8/h7+TC9/Rtw/GBTYlftphLguAJ7najg02cdZPcuqK07cJpCBg8DPjVvHIhy3ICgZZPHGHraEGDkE+GA9WSXe5np63UOf3gmboT4nKc7N5lN/qc87gNF39NnfgFr/cBfZv/mFwA9TOb/aILls4wFcf95XGF0leu6R7SkHB3ZmqRXB5
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199021)(36840700001)(46966006)(40470700004)(5660300002)(478600001)(70586007)(70206006)(31686004)(2906002)(8676002)(8936002)(316002)(110136005)(54906003)(16576012)(7416002)(41300700001)(4326008)(44832011)(53546011)(26005)(40460700003)(186003)(82740400003)(356005)(40480700001)(426003)(336012)(36860700001)(36756003)(83380400001)(47076005)(2616005)(82310400005)(86362001)(31696002)(81166007)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 09:02:02.4698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 509c234e-daa7-4e86-b9a3-08db5847b629
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8331

Hi Ayan,

On 18/05/2023 16:39, Ayan Kumar Halder wrote:
> Some Arm based hardware platforms which does not support LPAE
> (eg Cortex-R52), uses 32 bit physical addresses.
> Also, users may choose to use 32 bits to represent physical addresses
> for optimization.
> 
> To support the above use cases, we have introduced arch independent
> config to choose if the physical address can be represented using
> 32 bits (PHYS_ADDR_T_32) or 64 bits (!PHYS_ADDR_T_32).
> For now only ARM_32 provides support to enable 32 bit physical
> addressing.
> 
> When PHYS_ADDR_T_32 is defined, PADDR_BITS is set to 32. Note that we
> use "unsigned long" (not "uint32_t") to denote the datatype of physical
> address. This is done to avoid using a cast each time PAGE_* macros are
> used on paddr_t. On 32-bit architecture, "unsigned long" is 32-bit
> wide. Thus, it can be used to denote physical address.
I think the only issue is when printing but you do not mention it as the root cause.
Also, FWIR it all comes down to PAGE_SIZE being defined as L.

I leave it up to you to decide if this is sufficient explanation.

Small notice:
Generally each commit in a series should build successfully. This is not the case starting from this patch
if user (or randconfig) selects 32-bit PA. But I know that other patches depend on PHYS_ADDR_T_32 so
I guess it would be difficult.

> 
> When PHYS_ADDR_T_32 is not defined for ARM_32, PADDR_BITS is set to 40.
> For ARM_64, PADDR_BITS is set to 48.
> The last two are same as the current configuration used today on Xen.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

