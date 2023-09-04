Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D78DF79148E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 11:15:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595023.928497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd5fH-0004cU-L2; Mon, 04 Sep 2023 09:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595023.928497; Mon, 04 Sep 2023 09:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd5fH-0004VN-Ge; Mon, 04 Sep 2023 09:14:35 +0000
Received: by outflank-mailman (input) for mailman id 595023;
 Mon, 04 Sep 2023 09:14:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ceyR=EU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qd5fF-0004Sj-Ad
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 09:14:33 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e89::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73ede4e1-4b03-11ee-8783-cb3800f73035;
 Mon, 04 Sep 2023 11:14:31 +0200 (CEST)
Received: from DM6PR21CA0018.namprd21.prod.outlook.com (2603:10b6:5:174::28)
 by BY5PR12MB4098.namprd12.prod.outlook.com (2603:10b6:a03:205::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 09:14:27 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:5:174:cafe::87) by DM6PR21CA0018.outlook.office365.com
 (2603:10b6:5:174::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.5 via Frontend
 Transport; Mon, 4 Sep 2023 09:14:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Mon, 4 Sep 2023 09:14:25 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 04:14:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 02:14:21 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Mon, 4 Sep 2023 04:14:20 -0500
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
X-Inumbo-ID: 73ede4e1-4b03-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSYFUR2g+6UrsbsS2mVbOGZ7jGCEPohaVyjcDcfgDbb01Ka/G2yLlQbcuWaSMM8VlYVp69Q3skaWqXKojtQZpE5WZdyJrZ6hc46gdbUqE/aPu1rg6Fc3PBM+r25hucIIdg4vHnIy7d4AWEc2zpeyrCWL/4+5+yu87kGKyElRdYpLDfh3ehAjcp2HSXhmUKy+hy5qfYD1XQEHJuJm2dQxNHqE9hfuavdDzGirA109esUm7Ky4tUduOKz8SPtRr8xSClpISIZsHp3hlVyB5l4KJ3F1ZdZOw8VcGDV3d7Z2eg22BGru6CGUlFI/a8yEyRy4J1ysI/xuGfyf6xh02tpYcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0uRhGXuIgZxSQy/zEQcePI+/liKzQjmWhxoOnLxvTI=;
 b=KstMVevoXrc3vSoQIWTQRLYblYoWGthwjbwU1AO5+xWQO+JEYChL1JfeOpAts90GkG7zSjHw+oIVLlN1LyDx6wpFue+jxf2ZWirAN95mU2+XXcPxN8xIVwGu/VuZph5Chrfc4xCv4QYuojx56Tl27mbILJh1+rRzGOaVIt1jUn/l9Ao/B9Eow6YSD5jH+rmiyT0xNBvHGOmfGiidbsJkYbnnoSjVJSYaKEy8bOBX1o9ty7FWWOU4fFGHHIVzV18qv+rJn5+/TZ/OAvquP7+d/oE14ZS9q96GFaiYqLjZLTeMxB2iWy/9vCcFkfAW5d21tiknS0gC43X6oeULSBMVpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0uRhGXuIgZxSQy/zEQcePI+/liKzQjmWhxoOnLxvTI=;
 b=5pDpjHJVaEtODoT1NNPR6SeKhR6QLo7W3S9CyuuQELMk+8cQtPNNlQGMgkzdDrc+grOONQLejAwf0BcbKmFxDwF5DZkU3dxL8E8N7UGFYTXrOIbuGLiBbE3JvAlql07GkXRD5aOBqclp1XS4rKRL+vDH6Ab6Jh+UgLCcsRqKAeA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 0/2] xen: fixes for UBSAN findings with SMMUv3 enabled
Date: Mon, 4 Sep 2023 11:14:04 +0200
Message-ID: <20230904091406.942-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|BY5PR12MB4098:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b49431e-ab82-489d-a5c0-08dbad2755f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	chVx5QRoHwFZQc/08Mkp9q7NPFLLBey85CjfHkJcubbbqkJUGBJknO0Zc1pG9Z9JCXjVD+BP9e1pQQTL3v+1lGBgJpn4epI2//3t5DWbppptEoClA5pOP4wHM62Vy872h4159Jl5etZHW/IdfOzTll7NvcAhNyefEwHSjOur4hMRW3WlhkoODQ8uHmyMeTtcXhN2MYmFUMOZ8LCzOll6su+ZCL5xvARagSgJHgyYOWtr4yCfbLiuyeQ8XbYU6/4ARNc7Ur45kuF83MkHQlAIXOt9slXatVivFT+rQt9H7+DTvsAZS27A0V4O2QcmDSWiZcKGboFGxYrXNoHO4tPFVAUReMqLQRTtNYLZFBdOvjkf3WkI5nApqzWUYN0T/n0OsNWwBDHA8eRWI5GTKSubMjzp5fa30s/UzB29I3SgFewDW01/QilKDqwPOC5+TNpzIvwJLF5IYwxZcHLkRCAa2rjrxa0/dEVhXRCE207UWI0Li0jBh7JQm4ePz2SphiXxN1nnnazNy/cH1dYtcCIITIap7bblAzTDWsNXasXDx6wvcityFiDDTJmn5wpEU8yhVQFXdzlJsNuJu4MEtweGfLa50aMGuse/XsRXHrJxC3mQharpxe3o1yHSej5LwsDtwbWtD2XsepT6LeUEOKq+8hvGCS1pRO5op3Y7tB8309+Z3kn5r8fF19ZNS0FIgM+PlpSo+F/yR38OeR0vWwMOxEEqe3j4pl7Jf37DyhBz2GZAUBiAo9GVOMlIqKc/I6a6WLP46GDNg2ogpbLe5Z5onw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199024)(186009)(1800799009)(82310400011)(40470700004)(36840700001)(46966006)(316002)(70586007)(36756003)(2906002)(6916009)(70206006)(86362001)(54906003)(40480700001)(8936002)(5660300002)(44832011)(8676002)(4326008)(41300700001)(40460700003)(1076003)(36860700001)(2616005)(83380400001)(426003)(26005)(336012)(47076005)(4744005)(356005)(81166007)(478600001)(82740400003)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 09:14:25.9727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b49431e-ab82-489d-a5c0-08dbad2755f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4098

This series contains fixes for UBSAN findings reported when running
with SMMUv3 enabled.

Michal Orzel (2):
  xen/arm: smmuv3: Add missing U for shifted constant
  xen: Change parameter of generic_fls() to unsigned int

 xen/drivers/passthrough/arm/smmu-v3.h | 4 ++--
 xen/include/xen/bitops.h              | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.25.1


