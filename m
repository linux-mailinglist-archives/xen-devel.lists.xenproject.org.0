Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D24A73DE25
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 13:50:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555463.867254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDkjY-0003mb-8f; Mon, 26 Jun 2023 11:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555463.867254; Mon, 26 Jun 2023 11:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDkjY-0003ke-4t; Mon, 26 Jun 2023 11:50:16 +0000
Received: by outflank-mailman (input) for mailman id 555463;
 Mon, 26 Jun 2023 11:50:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tM71=CO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qDkjW-0003kY-FO
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 11:50:14 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b118f01-1417-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 13:50:12 +0200 (CEST)
Received: from MW4PR03CA0250.namprd03.prod.outlook.com (2603:10b6:303:b4::15)
 by MN2PR12MB4550.namprd12.prod.outlook.com (2603:10b6:208:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 11:50:07 +0000
Received: from CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::a7) by MW4PR03CA0250.outlook.office365.com
 (2603:10b6:303:b4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 11:50:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT049.mail.protection.outlook.com (10.13.175.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.47 via Frontend Transport; Mon, 26 Jun 2023 11:50:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 26 Jun
 2023 06:50:05 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Mon, 26 Jun 2023 06:50:03 -0500
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
X-Inumbo-ID: 9b118f01-1417-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ad/KZ5ps0ePKC4ZeBKzl6m8XoX3H73+L2tDXmvRzrO4q3x8GdQkeRBYpbK3gTZDJx9GSPK6TCOa3LySO+tjJbP9WMbFO2TER+3kbkzBdzFn2jgOzLymN4FgEz4kOyrA9aoBoiwwk3QVzFEjp/bjKeuuTvYKJUcZZPc2n803yMm9GFKkGLr4dUFUweVcD0mKko6Z5zg7X0dQBOlw+3AlEfqvT1nXLbIyndLf636vmWm8CMhxeSCwCM4XokYzdCKpsewLBcFqO4wGSQtH/XN1d7SSf2fqqEMhhTx8X+0wYBo5iCgOePYX5G37XYByW7rBNEQyOVG++eL4AKN3UyxpySA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZY1EpuHSSSRsOWezBO/ldLf2F3jscxHI4/L3u/0T8w=;
 b=gpXLS1BLhrMhVRT152DvxQGlql1X9MzsXxKT5/6ew/COoNyI+JmfTEpTVeNX5QfCQOol2KrMN/X3nqraaUoXB3TRVVHem7VWNovqS8mtyqfa/rFvutgGdAq+ivvIVyiKDZqBb9UHYk1sfRQZL+KlPNFcViU83YuatTQoG3f8pI9KCOmCbDFiPtBup7nE6ppoAtpAloOsEJd/pSKzIilvpUDeJm4CeKEUJD6lI4PvvyAvbBPv7TYu0M/6256zgF47dddK64su/DTSdUGeADQMDb6m/JDzMjh6sOhahWAG0fnGpOPbhocrYKRUg0xW4/al8RhdBqgv1RnW1ieYy18xQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZY1EpuHSSSRsOWezBO/ldLf2F3jscxHI4/L3u/0T8w=;
 b=SoGzFZyAfVd4VVVj2p1gfYajfJsMK6KsJ4d3XqpGfbsWlI8+IPbAqWc+cHqskSHdtgMRk5mUDnvMuqfTIxA32D140lUzNLvmsozHn7UEOTT69rB1Uu/C8rynMl4D7Eln+dFC7QeUQCqXP/718X6/j1+ITal4Dq/0exzUjy1pPDc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d042c31e-811e-44e1-85dd-d3e2d3edcecf@amd.com>
Date: Mon, 26 Jun 2023 13:50:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 7/9] xen/arm64: head: Rework PRINT() to work when the
 string is not withing +/- 1MB
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, <Henry.Wang@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-8-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230625204907.57291-8-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT049:EE_|MN2PR12MB4550:EE_
X-MS-Office365-Filtering-Correlation-Id: cc4f8c9c-a594-4e30-9d70-08db763b7c3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c1voGW1aVxrJIiImAEiNkj8iLJ867Cil+oQX0Z9y12vrHNr/V31VLtkSO9gWemNdsDsq/CIFa3l+WgRfBInZuLoqxMNZulroM0oZmIcJWIsM7j6qD4X0KhvAe7T27tGx0Z6vpCKeIguTfJEvZqvjCrn724ggGxuLCl9Wa6UCl269eGoYheMH07thDX9JXGCSYRb/6Pki8QD0ZiP0mFGgXEUn9iEnYCkpCa2CmMU95JRNTojGWls4lJ+Vex9RGh329eC8PrgMZ5Rx8zgM8I8q8jMjzqLk7KJhi1YzlxD4uj52kTueMKnCnH/pS4+J91Eh0kpNQlcgy4/C9dGAQDj3CWzpnpFEj/c3fnOTiZX6Ner6LpBgTN4vlib1Y1WFRvjP8g42qOxxuf5cZSGfhKoofaR2QNjTvg3GdJKjARCiiahzSmuuPg2hZz3O8NIcl0VY/UwHS/x/IsvPVh3pq92nrz0zgBW6yXEu/R1gm1rhbekPvkGAuS498sRHAaVa67a1BJUiTi38z3X+94klDHoGgAAtqObzFESjLUqpWDO7/CSfSKauQEuzq8sLncbeGOBc7T1FPHbA94n731+UKloAU49oSYwRhKginWonW9GIv4RsM+tFGE0ftvJZ3KEkcDqHxd/T/zquMwchp3yjipTqFwtXZDSXqDLZu2apOtD8MICMoUCC7EUo9vdPQXyq0gOjXiOmMIlnQOmaUkqA0EpJ1ZegFg7wbMxccRbLduliGA0k5a5DeBEuH4O+NUDjiRMWSil4BmDDVIIATVfQP79jkRiDxsYshzoVPtZmFdLgHbb09ux4LeXlYEaqNowx4r/6
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(31686004)(82310400005)(36860700001)(36756003)(40460700003)(70206006)(5660300002)(44832011)(356005)(8936002)(8676002)(41300700001)(86362001)(81166007)(40480700001)(4326008)(316002)(70586007)(31696002)(82740400003)(47076005)(26005)(53546011)(2906002)(4744005)(478600001)(186003)(2616005)(16576012)(426003)(54906003)(110136005)(336012)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 11:50:06.0990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4f8c9c-a594-4e30-9d70-08db763b7c3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4550



On 25/06/2023 22:49, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> The instruction ADR is able to load an address of a symbol that is
> within the range +/- 1 MB of the instruction.
> 
> While today Xen is quite small (~1MB), it could grow up to 2MB in the
> current setup. So there is no guarantee that the instruction can
> load the string address (stored in rodata).
> 
> So replace the instruction ADR with the pseudo-instruction ADR_L
> which is able to handle symbol within the range +/- 4GB.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


