Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A59F5857CEC
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 13:48:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682231.1061354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raxdr-0003l2-M3; Fri, 16 Feb 2024 12:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682231.1061354; Fri, 16 Feb 2024 12:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raxdr-0003ij-J6; Fri, 16 Feb 2024 12:48:35 +0000
Received: by outflank-mailman (input) for mailman id 682231;
 Fri, 16 Feb 2024 12:48:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AOVM=JZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1raxdq-0003id-Mn
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 12:48:34 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0abecee-ccc9-11ee-98f5-efadbce2ee36;
 Fri, 16 Feb 2024 13:48:32 +0100 (CET)
Received: from CH0PR03CA0397.namprd03.prod.outlook.com (2603:10b6:610:11b::30)
 by PH8PR12MB7349.namprd12.prod.outlook.com (2603:10b6:510:217::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Fri, 16 Feb
 2024 12:48:27 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::70) by CH0PR03CA0397.outlook.office365.com
 (2603:10b6:610:11b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Fri, 16 Feb 2024 12:48:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 12:48:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 06:48:26 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 16 Feb 2024 06:48:26 -0600
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
X-Inumbo-ID: b0abecee-ccc9-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaBPvpiTgTP8UZ7kxZSavi9pcxK3HqNVdhI36DuseF3XGDEUI+OJjReyJmStFsGXMfFjvnNS6qn1dQia7VGnUlWjWaRonptmim7LGSzwvs7d4pnqCL4q3hClFdyQHGZ5hBrCPUZDBcELb1O0/ehwgUlZTLOsqqfnrBpoo89hlPL3iRaXvOjLoz9jT62+B6nkSmNmHF85hcNm942zLQdY04UTfYb/bO0oY3jLINkNMS00ZPrx5NTk2Z3MqsRrqsjujKNJLxd3YfUQteH4Wh0BBAhCEJ07VOb2aNEhNqObO1jpzOEBwXK0xJ39XILCV7u1sZ+yEESCsLBRopTbg8kdFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAxFwtbfnmDfEgXkrnAnZHx5SMdcWKlyFBhUESUvpoM=;
 b=UXGUMW/UIDb2Dd6kXO52BHzJFJMhdFnKyTof3zx1g1sFHek8eyriJZ3d4q29fF7ebn7IWv+qMLfGUiWXIEIeoXRcLuhTHh8TUgYo5rnf/kFMl3T60efu8THEy/A1VrSrtvVDMhDZfr1dR3hoUK+GHvPFd+bZNOlp2WJUjpk6Zmv49PETJ5ihd9MxQi3uIGXhwdVsDz7HeD31//qtAow6DvdQJAnYgzqVrYMjEPPiYutLxZa5McLEzA95UNKR1jEjjrRxN2BQIJftlShRH2UoPUQNCA6GY1G7MBKJ2y0GTGm/IKTXiN0y4ZcC1sZlUx95m9+8G4lkTOPvX0TucIcd1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAxFwtbfnmDfEgXkrnAnZHx5SMdcWKlyFBhUESUvpoM=;
 b=tmuEggIr5VnNZJHwsOywUn2TkvFTvl7OZ17Sn/c8komau4Asq84zSqHECPw20+HSiQhebd+Cy1k4yZWvHk0jpokI6wUQEYnBneZRIsXPfHuIobP6OaDpHN5iisWfDbYI4JFeU4OIZsIPwoXeY6iqOCfNH9qLnR4Ovzx/FE5t7qs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6240bdb3-ab07-49d8-a0ee-30e01cb12554@amd.com>
Date: Fri, 16 Feb 2024 13:48:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/7] automation: introduce fixed randconfig for RISC-V
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
 <d8e330c26394d9415a0d76b2d951bf57b0b6dd4b.1708086092.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <d8e330c26394d9415a0d76b2d951bf57b0b6dd4b.1708086092.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|PH8PR12MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa84830-a267-4f6f-d3f0-08dc2eed9226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2TjH8dcOr4gbULPhPbmt4S0FEo4d6fPQcJcVdGLlrvi5vuv7jjtDFrQMrcHlMMsWuUvDY+D3+Z6ABzYX0NcLpdwHvQcV6odGZIv+IYhNBDV0yf1F+6l47Jo15wOPjrgFbfPDimbaUJY/NLHg1xM0ODya1EyS+4sN9yOucywSMrMfWCzqfCTDr10CQ0c7vfUrPb/qOA7oAlfC4ILJf+fc3dsObiX/lr61kSaCHBbmfBL0/F+sQXIYMCqMy/xIyugq48J7m/n/jof9EUIs3+hezF6Tz6TQtQvX81S/ug2ZF4YnTUaLYgOlqrtZnhlKnOVvh7v0ypvz9VHLNOlwpsVUxGhe7GBivq74DaRa31VVDGi+00xEbRcWae0IByeQVEWYWP/qxIswfsoxhnZfkQetYjJMOkGCfW0tvx/T2RGRLK9JdGu3epZfoe053TTav+Qo6VQYdH6nx3U2+jsC0hyq9IL5PHWNpZlIV761+Hqwxinlf3cFMyr8kOAWOk5d3kpGoR7B0eh7imreLANDsEoRp3Vuw6fxA4pWxTISL3dxTcQDxxXvoYNAagtDXbWcrmo4wuZojbeaR00Rj/Nveh+uR9wodg2CvuJF+msDLwvP6MbRZNcAmqGz2sd7NmKrW/3CLIlnvnpH7O0r7+0R7QNOFokNorLEmapOO9+BWOQ6C8M=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(451199024)(36860700004)(82310400011)(64100799003)(1800799012)(186009)(40470700004)(46966006)(31696002)(31686004)(86362001)(5660300002)(8676002)(8936002)(82740400003)(36756003)(2906002)(26005)(44832011)(4744005)(4326008)(2616005)(336012)(81166007)(426003)(356005)(478600001)(83380400001)(70206006)(70586007)(316002)(54906003)(41300700001)(16576012)(53546011)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 12:48:27.3287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa84830-a267-4f6f-d3f0-08dc2eed9226
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7349

Hi,

On 16/02/2024 13:39, Oleksii Kurochko wrote:
> 
> 
> This patch introduces the anchor riscv-fixed-randconfig,
> which includes all configurations that should be disabled for
> randconfig builds.
> 
> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


