Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E707776E2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 13:26:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582071.911645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU3nz-0007bo-Kv; Thu, 10 Aug 2023 11:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582071.911645; Thu, 10 Aug 2023 11:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU3nz-0007ZV-HS; Thu, 10 Aug 2023 11:26:15 +0000
Received: by outflank-mailman (input) for mailman id 582071;
 Thu, 10 Aug 2023 11:26:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8LQy=D3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qU3nx-0007KG-NU
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 11:26:13 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20620.outbound.protection.outlook.com
 [2a01:111:f400:7eab::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4680bb3-3770-11ee-b283-6b7b168915f2;
 Thu, 10 Aug 2023 13:26:11 +0200 (CEST)
Received: from MW4PR04CA0054.namprd04.prod.outlook.com (2603:10b6:303:6a::29)
 by SJ0PR12MB6990.namprd12.prod.outlook.com (2603:10b6:a03:449::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 11:26:04 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:303:6a:cafe::95) by MW4PR04CA0054.outlook.office365.com
 (2603:10b6:303:6a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 11:26:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.20 via Frontend Transport; Thu, 10 Aug 2023 11:26:03 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 06:25:54 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 06:25:53 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Thu, 10 Aug 2023 06:25:52 -0500
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
X-Inumbo-ID: b4680bb3-3770-11ee-b283-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3VpmIGfTSy1rvYrj5CLIHSep8xFX9j9y4+ghrmDUI7YeLPLVi+x4JJoXYo6C4errcVakD38S2ATs9t2M2cQJyrOF7b8eElesLfCjTQ4HzBpVRvbiKe8EBgbj71l/gQcj0CtZds21uoJ7Ojj+sM+apjHm6wkdsfjeEVZOzxxZVEy0nygivIeFTgeV8uS967Dh//ts5vM0VtFUUFG1a6El9DDCX6fF/7xICTy8vKObpDXy0A81/jnR35ZWWbbptyerAYwVPUNuPjkWVpu+8T2rxMNK0nLDlNrWF6kLDqvklcxj7/k9faBVCQNcIT31AnyqAtYNpVBsWgM/Q4RJnqQrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVa18TZKbzHxsYXSBg931qTZMb32QSREUek5+T+Po5E=;
 b=C+FkhUBvWv4YFswIcwN7sLUPwkfhjIbbApQO1EwBCIVgL7yY290kUPY2hkEkjBWQPovJiDck4oKEa9PydKZCAiiu0FuHvShpOHfKQFB8Lq4o8cugZXTFveZ/lg9J+hHsrcHUyaBE0pWXBkDcY8qHaof5ZPnN0b4MnJgcUHMyRPRP5ipBgEBoUozK6ZohR1Gk6HcqF3zTyQryNkfmnU9yPb4ZrRGgoAFbDbjn5ulm9l3pYLuTZD8uiEWZ3z4ToD8+1ROVsqhpdVuUCgCxqMA50Qy64tnZxIi5Tup3wiRyMj0c8x3TUacm2pK5mqEtjrfYrrNh9p/z4vPfSC39/rVUOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVa18TZKbzHxsYXSBg931qTZMb32QSREUek5+T+Po5E=;
 b=Ytva1UujfSmgKij1ACBfgfGWrxyhLsb3EKNA2eghn6TgV1r4QGSFh7qya7i4nReiwio9TqGYEPk6AB57TvnBFwHEBBOmLjxTYI7kMCT58cSUNmP5RvOI6BP4d7MLsfSxtfn/Zqz0xo0oCmIRTRPB5eeXVt+Hfe0tslL/tMqUFGY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/2] xen/arm: fixes around device tree generation
Date: Thu, 10 Aug 2023 13:25:42 +0200
Message-ID: <20230810112544.17365-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|SJ0PR12MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: d421d8db-b058-4469-9735-08db999494f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xnx0Gul/z+H7njLBwJ98W3hSOS0+r/cNXGwS0jN4gy7CYywZJvpWsbcSTjgxZpvm3c8Ap6r6c3cUpNigMkDbwzc3HUvkpqYe3ZTLiMv1Ks4fqgIvSYvm1EXadcDP8tX1Oc+mRRXFjhhWYxC47RqcYAeiwVDJ4wUC4d9dCUJiW1hawDFshL0UvtksN64KpjlkGFzes9knu3YSTmoCGlwtpi8I3XlTQelDdmc7wFe1EmI4Z30NqxvibEQsbjHOq5JSqmIZJti/BqwekYNRXERA5qZ7m2uZ/TZCwZ13goRCyQaqfxAV/ojip2m18Ck6v8U5vtwTHn1rTL5ikNkrkVal+rCoXOEbaAXrIwoH3IhBxApfjKFNv4RbOEc7yudL1CS5EdXZqx+a1Guz/D5wUhgKdbR16ZSlTFnEWPw2uWN7Om0QVdwFkwrne/6FYcAQBVbE1rRe+MRc6egDJ2x2MlNVuYh/I/KBv7ulleeCTRTms8r/Aemiqee5goIG/506kcb/enp6bD5WgCVsV++ErN/PJF4uSFib5B3dMIVk/DsorQgTrzIWeEDzr/ePTJv2qUMJwdOWNDSKwEFlA0sZjs6oEvMLvHqaUzgF6aLb4YjZg/9CoDFe2G4aMPRbU0BLo09Fdnhj7mMJeYouXfxhSJMLyh3sO01142eRkYn7/ba1ssRiKV18+c1e+ZFLYQe+djEjI7PBmxDLlzwXPJhUvYyZjlhwcTZ6YeX10baDOaxLrE4r3TX3NdWdhiQg4Uuwz7mzMBCu3vthaEvzct7f5T1ehw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(82310400008)(1800799006)(451199021)(186006)(36840700001)(40470700004)(46966006)(26005)(1076003)(8676002)(8936002)(41300700001)(40460700003)(36860700001)(36756003)(558084003)(47076005)(2906002)(426003)(2616005)(83380400001)(356005)(81166007)(86362001)(82740400003)(336012)(40480700001)(44832011)(70206006)(6916009)(70586007)(4326008)(478600001)(6666004)(5660300002)(54906003)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 11:26:03.5180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d421d8db-b058-4469-9735-08db999494f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6990


Michal Orzel (2):
  xen/arm: Fix initrd placeholders generation in make_chosen_node()
  xen/arm: Skip inclusion of domU nodes into hwdom dt /chosen node

 xen/arch/arm/domain_build.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.25.1


