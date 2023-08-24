Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EAA786B5D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 11:17:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589855.921906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ6Sx-0004AV-PE; Thu, 24 Aug 2023 09:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589855.921906; Thu, 24 Aug 2023 09:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ6Sx-00047L-MH; Thu, 24 Aug 2023 09:17:23 +0000
Received: by outflank-mailman (input) for mailman id 589855;
 Thu, 24 Aug 2023 09:17:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6NC+=EJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qZ6Sw-00047F-OH
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 09:17:22 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 071e6ca9-425f-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 11:17:21 +0200 (CEST)
Received: from PH7PR13CA0002.namprd13.prod.outlook.com (2603:10b6:510:174::6)
 by DS7PR12MB5717.namprd12.prod.outlook.com (2603:10b6:8:70::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 09:17:17 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:510:174:cafe::78) by PH7PR13CA0002.outlook.office365.com
 (2603:10b6:510:174::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6723.16 via Frontend
 Transport; Thu, 24 Aug 2023 09:17:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 24 Aug 2023 09:17:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 24 Aug
 2023 04:17:15 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 24 Aug 2023 04:17:14 -0500
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
X-Inumbo-ID: 071e6ca9-425f-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2XFmTBmzsOAlwZpg1C2Goa6dowNYe16IOMU81KgMZSPu69LVd2NYU/jSngYL3Wc3S7Kz/J6cBaGw9Gbp6ZJVJ4DFkivVQ2TLM+5JEqSNirb93B83Wk6YShliOJhGs6Pq6vf165ClG4IWfvUudiZ++ziLlyiuG7L0eYUJIMlS7qzqKvjB4WQwD8tWJGjfYk6rJltcuy0liDDbnKQ1B6tm/0I9FMc+fU8ZEoL1WC1IiQKalShD2tfZrR6X6ITyRgKPuaSOA823FUyLTLkyHSUMkqgXXu+oqskfUxc8u56TLo9GcGL9hfGM7Pg+HGct5ywqIlZa04V3H+MWc7YZBHqSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLLpsbOQFVd/b2l1oWdWwqVCSvZFu0aftlLTVCXcmOo=;
 b=oftdzyIO7QoILhMJucvjT1260S4dMfLJxQvGn8XrPMnxRNzrZYsTrrjcn5KCKQ2NlCm8g/J4aPyAiELkJsR7NJhFPNvdJvVMVwOV/rZE7sNdOGiKFxNeqMm/4W+Ui7jhV0O7CFN046Qa7EbIR8xp4f5HnsbWiT3+Yjtt/KkJMgOarImDYo3OIwL3smUfnbD/JJX2LtL4Uxu62+JXyQvkd6bNWL0/D66GGD+5BZZEpKwOwcE5SHrPRLVqOYFfTzmLLQj/jNPgpwFhrWOlNYj27NID1STwVbNYv0SsVtqlXhRAFWti4Tg6KLB2Al6rV3bUCLAGV5GfMeqkMIliyb37MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLLpsbOQFVd/b2l1oWdWwqVCSvZFu0aftlLTVCXcmOo=;
 b=ZFvAvlenJKzJKWHh/9hw5bESl3IbPHuIrIJS7qXx5SOGf4HVZi0PmmYbQLTkFKxwne9zSD5Xnp3Iw1MSQWE7kuZ94Vmavs7FZ5LfKbH/y+fivvbXO4kGPSdYHOs3UD13o0r1FSH/Z/mGkXQ7JvNUfdgFEqLDANQ5+Z6HTTuS4Nw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d029d806-33a2-6774-4aa2-ae8f1303288b@amd.com>
Date: Thu, 24 Aug 2023 11:17:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] xen/arm: Handle empty grant table region in
 find_unallocated_memory()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230824090640.25338-1-michal.orzel@amd.com>
 <7d216ef6-398c-4086-8a7a-33e80dcacda7@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <7d216ef6-398c-4086-8a7a-33e80dcacda7@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|DS7PR12MB5717:EE_
X-MS-Office365-Filtering-Correlation-Id: c3860b85-0641-4b40-b6c0-08dba482e94f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TnwWJAU9MbpV2yEhUtMMnsn1bWlDgL3AcmHGV0YJfoDITPWaTXSrEFpm/O32OuaBjnKYiyXW3lW8pzIqlVOqfbp3d+z8/+NcdzmwniFAbcpPqcqKyUBZ5q1T/1XmndrD8xRm75RhkniXb4fgSMqGO1p79M/jQvBaXqG95jrAlzeILDUuFjnxSmRHwPajHqrf5RY6nyIWzZD1ZeA6Lrh4/q1ZJgZzv9APDcrUapAfAYlARo0hmgpMTOsmufSPk4jrL61tnZ/HE0YCV7iC67CJb6BITY7aBP+3h+7wpkmoDiC5nBltaE4HItujHTGNcpGGPHeMhhkYdviRvXJnwR4ywAp149qxkPHt1E1joUDZROmE48e4BqgVNDXB0IB0abI3w8/e1J7wKNuhnCczzAFqGcpY2bFeS9Qrg8M+J+VoMbB61/xvUKbqtXnAjpd9pwpkBXlp7dBt4FBHg7dC6QCc2L9QvNdP21eyJYTZv8X2RWY1Xr7smIVJ85Em0z+VPJURa6uA6TVLkK44cm8XgYl+7Y5hRkaKuETRU/h0Ih1/YpdDywydpmQrZo9/2dPhDxiQKGJMGGVuGWHZpL9rSqCP0ST5cIAak9+QhTlMCD5Ax/hblZ13VSa6FnUU9FmehAv+jAjS/9kv1FPIHYRCMv/zuZ0QoBNDkt4jn/MyDoOl2GUkJ0kpVRR1gYB54xso5LolWsuVRJqh9Bja6nm40F6GD7dn98vhxUtb7pU27i3bZLCq+7eAZF2pGHQTNyPNFlErIlTxjgRunL3PtlgmPa9su7KHVCAxoG+YTc4uDWDtABgXDEED9cAqMTNyy2Zo4yNc
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199024)(186009)(82310400011)(1800799009)(46966006)(40470700004)(36840700001)(54906003)(70206006)(70586007)(316002)(81166007)(16576012)(478600001)(110136005)(26005)(44832011)(36860700001)(356005)(82740400003)(40480700001)(41300700001)(53546011)(86362001)(31696002)(2906002)(31686004)(4326008)(8676002)(8936002)(40460700003)(2616005)(5660300002)(83380400001)(4744005)(36756003)(336012)(47076005)(426003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 09:17:16.9451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3860b85-0641-4b40-b6c0-08dba482e94f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5717

Hi Julien,

On 24/08/2023 11:10, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 24/08/2023 10:06, Michal Orzel wrote:
>> When creating dom0 with grant table support disabled in Xen and no IOMMU,
>> the following assert is triggered (debug build):
>> "Assertion 's <= e' failed at common/rangeset.c:189"
> 
> A partial stack trace would have been handy. This help the reader to
> understand how you came to the conclusion that the issue was in
> find_unallocated_memory().
Here you go:
(XEN) Xen call trace:
(XEN)    [<0000020000218568>] rangeset_remove_range+0xbc/0x2cc (PC)
(XEN)    [<00000200002c76bc>] domain_build.c#make_hypervisor_node+0x294/0x7c4 (LR)
(XEN)    [<00000200002ca240>] domain_build.c#handle_node+0x7ec/0x924
(XEN)    [<00000200002ca7ac>] domain_build.c#construct_dom0+0x434/0x4d8

Can you append this to the commit msg while committing or do you want a respin?

~Michal

