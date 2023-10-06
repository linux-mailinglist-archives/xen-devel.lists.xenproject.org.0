Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034767BB2B3
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 09:52:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613260.953692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qofct-0002sv-0z; Fri, 06 Oct 2023 07:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613260.953692; Fri, 06 Oct 2023 07:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qofcs-0002r1-Ss; Fri, 06 Oct 2023 07:51:58 +0000
Received: by outflank-mailman (input) for mailman id 613260;
 Fri, 06 Oct 2023 07:51:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5b7L=FU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qofcr-0002bN-Ie
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 07:51:57 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e88::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 386d356f-641d-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 09:51:57 +0200 (CEST)
Received: from CYXPR03CA0094.namprd03.prod.outlook.com (2603:10b6:930:d3::16)
 by SN7PR12MB7420.namprd12.prod.outlook.com (2603:10b6:806:2a7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 6 Oct
 2023 07:51:53 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:930:d3:cafe::49) by CYXPR03CA0094.outlook.office365.com
 (2603:10b6:930:d3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.30 via Frontend
 Transport; Fri, 6 Oct 2023 07:51:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.204) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Fri, 6 Oct 2023 07:51:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 6 Oct
 2023 02:51:52 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Fri, 6 Oct 2023 02:51:50 -0500
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
X-Inumbo-ID: 386d356f-641d-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Llk9SzO0XwCXTK6cqBS55uRGK0LiMSxC3p5GRWVJ3O+W6q6ohhpkWvWVmEZNx6bsDS887cOK6NRuVfqo3ztSSKsJ+HHY3R3ULlbvStgCeOuB71Mx0jyL7mBlPe525sQ1wB91IcmSZFisn8jJ7HhS0qM7fR3kDjvixXDe0PB9an7QkHx5+kGgzVEL3UcWTpP6hKf8rkt9oDnSjHcOUyJG6YReRw6rtqmhV8Ja9OosCxO8mc2mdyCNlJzVoHZC3DRw4r7lx4hxbpJhOUb9rTnPWy8NdWgHeQnJ+6qmm1fpedUCKz/gDooBu8UrE1j40ZG8F6AjEI/TyGJnrTkeOWIcFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCXO3srcStmJZe5aaJuEmz2CbDFTzcWkI+YFC4zfWlo=;
 b=GoVp+sYo6ddyxjQR1VlaiUnVXMfss7jEF0cmBj+8uhjJdLHJvB0fOmqjx0ZV0Gim+FK4dZzUFoB7FHPeJXF6rqdiXWqq7Dx23Xcc95KXLYPBOsVTzlHyJvAXBoLBB+6s6CL6kHOR8r3nn1xxzKRlxT1JQeljZxbUhmwPuFv32kEPTSLAcdOjsHCSYNjK7xBLdCzLAbv8kt0eBLPdp+LMS+xvts7oGpVCgKxC0ut8N5vxAuU9+Tnr+e428V8Pztb7Q/klup3CXjocFG2WVdeXzBOwlQ5AU/V5Q0f/kUZzyr18L4vlJPlRgG9CPMr7I+NYOPIcSjeLTLA37y5gjXaEQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCXO3srcStmJZe5aaJuEmz2CbDFTzcWkI+YFC4zfWlo=;
 b=mq5GL108tCWslbOvvQloF/PEj04gbg7CNGJwe1X5ZsTqqDejKcQgm/Ot+RBVLS61w51RkXeBm1hIkcxIiDB7gzwQAOheq/QkkxaZ962qnpVSVSV2sKBsVQcLyOWUL/xr17dqBpUc/dl3xWAKnzXruqRZyPQ65RcfEe6sbwcTPws=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, <Henry.Wang@arm.com>
Subject: [for-4.18][PATCH 2/2] xen/public: arch-arm: Update list of supported hypercalls
Date: Fri, 6 Oct 2023 09:51:42 +0200
Message-ID: <20231006075142.9803-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231006075142.9803-1-michal.orzel@amd.com>
References: <20231006075142.9803-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|SN7PR12MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: ff2a62c6-82d8-427e-b3d0-08dbc6411b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sNzkJsWZ0a1tXCBc0pLolHwMxx0SvvyNKrZsketteFcwOQuHU/oEVhJd+wvKd9+wSG6dkj7ztre77Hgg7E8jOEsobZ/bp5ntzPoIrO/6Mejup9H8vIYHv4iCYn72QUcsP5dQ4dQIIqwi/3KGS/FEAzmDVMfLQtumhk21Q4Al8T+x/OcQR5+ufAS4i+i6MjnEBq7sxvSnW3JifnIQ2LtRdUbDStwzrFsWkxUtUryp8EHBi1gITqtpu3Ye95kzLFPi9JHIANmZTJM+k/MFCgm12sluqYG+AE7D496yzA5RlFlnLo3YEv1B3f12nKQkPJX1esX67QFBevtN0xLoDIsrG/cEidOTEvISXbDcHxNzwgGeOqTgBz4GjduO27wXsPozAKNjr/MEQ6d7Bdnm8H8rOZk6B3YF24y/RrMnnV9eBtJgBPnXFfN3aO7AHqDY9zukRGGggOsvEA1dYR/gSsnhx+twwC1d3+e/0Syd+1sO6tyna7K4MRVALxSNw7mH/zsKwmQpLELxb7YMZ04ZPYZ8aLau2BRmnzQ7GRYvg1pIoCwaDotkapLQmIYxPuTaMftnr65h9N3bhy7TYUXeCfnjDUAyIXl1KFfcoOT7o0nY5MEo+UT6B+5pC7l4H/tucg347jlwgedoc/n7Lwzi+5yaYffJ46J7dHMjsgPxrQF583f4EOcvj9XbM/t5ExSqf2YB/Y1NVxLJ76Hzw6IOJB1zu+qQ3L68H2oCca8U0lGFmGQnqpEuU8EQOd3idMRbKxYZ+5OnRB+LoAkYHJQ/fqXVlA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799009)(36840700001)(46966006)(40470700004)(40460700003)(40480700001)(478600001)(6666004)(36860700001)(47076005)(86362001)(356005)(81166007)(82740400003)(2906002)(15650500001)(426003)(83380400001)(336012)(26005)(1076003)(2616005)(36756003)(70206006)(70586007)(5660300002)(6916009)(44832011)(8936002)(41300700001)(54906003)(4326008)(316002)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 07:51:53.1740
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2a62c6-82d8-427e-b3d0-08dbc6411b18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7420

The list is out of date and does not specify all the hypercalls/sub-ops
we support, so update it.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/include/public/arch-arm.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 6a4467e8f5d1..263b1e182eb3 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -104,6 +104,7 @@
  *   Exactly these sub-operations are supported:
  *    * HVMOP_set_param
  *    * HVMOP_get_param
+ *    * HVMOP_guest_request_vm_event
  *
  *  HYPERVISOR_grant_table_op
  *   All generic sub-operations
@@ -116,6 +117,26 @@
  *  HYPERVISOR_argo_op
  *   All generic sub-operations
  *
+ *  HYPERVISOR_hypfs_op
+ *   All generic sub-operations
+ *
+ *  HYPERVISOR_platform_op
+ *   Exactly these sub-operations are supported:
+ *    * XENPF_settime64
+ *
+ *  HYPERVISOR_vm_assist
+ *   All generic sub-operations
+ *
+ *  HYPERVISOR_dm_op
+ *   All ioreq server sub-operations are supported as well as:
+ *    * XEN_DMOP_set_irq_level
+ *    * XEN_DMOP_nr_vcpus
+ *
+ *  HYPERVISOR_xsm_op
+ *   All generic sub-operations
+ *
+ *  HYPERVISOR_multicall
+ *
  * Other notes on the ARM ABI:
  *
  * - struct start_info is not exported to ARM guests.
-- 
2.25.1


