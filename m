Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDED737F09
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 11:34:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552594.862750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBuDm-0003An-Ci; Wed, 21 Jun 2023 09:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552594.862750; Wed, 21 Jun 2023 09:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBuDm-00038F-96; Wed, 21 Jun 2023 09:33:50 +0000
Received: by outflank-mailman (input) for mailman id 552594;
 Wed, 21 Jun 2023 09:33:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YYRl=CJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qBuDk-00037j-4S
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 09:33:48 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7025c26-1016-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 11:33:45 +0200 (CEST)
Received: from CYXPR02CA0075.namprd02.prod.outlook.com (2603:10b6:930:ce::28)
 by PH8PR12MB7205.namprd12.prod.outlook.com (2603:10b6:510:227::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Wed, 21 Jun
 2023 09:33:41 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:930:ce:cafe::b0) by CYXPR02CA0075.outlook.office365.com
 (2603:10b6:930:ce::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23 via Frontend
 Transport; Wed, 21 Jun 2023 09:33:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.17 via Frontend Transport; Wed, 21 Jun 2023 09:33:40 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 21 Jun
 2023 04:33:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 21 Jun
 2023 02:33:39 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Wed, 21 Jun 2023 04:33:38 -0500
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
X-Inumbo-ID: b7025c26-1016-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSLfdA8YYREg4AnChIYJrYXhk2Dc6dfbO+8rb5rBzBSUd+qucA3/uJRwT8TXO9BTzYb9IxPgu2iLM/FwbOGH4xG/r/wBQrigP4UuVwf/S/eBoaX+LKeYEEoopnZf1d8rrQi7nraIaKMef4lM+rJMyHIfA+CrshLULDhF33Vf873anvS4KTEfCQj4jeKHl+w95eF3cdDWYcQkSDtykhXSe6CEtjQKlxf4/csUsS1Kcpi7ZeCEjFTPxNB8tlFMw2Ypo7NTIPTgcCnbgWxeltxPrOwgF11gFvZQ5kSXSadyT2xLJNT+SvfwLOxm/gh5zSlkO3fC1WBJ9KgGMTr458gv7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56I0PA7VI7FRacKs1yQchkEW05z+Fh8rfKJevwzbOs8=;
 b=SO1gyIgA9WITTx2pIceOmEAqvPn60pp4L2LzpoDWPO2NrFOp4vwD2DP22ncX4XLj87eeq3IzcdP1EG+r6xmBlvnrn9K1DrlqjkGmspe+oM72Dl7vRqR311QJ2V3VPUxiUhesgXzANuvGX2rIO+ai+3qdL+qrxZOda09+Wfkfj+ep2j4Vz9A1xNfzevGMOSOurcq4UmfAEV0CPsY5UaIVuKbTQKAmn77C2sauWg+9xoihBwnY9XPIiQFDPMB05XlZPqpdfzzbjICqtJiG/HSSsmsnB0tbN3424VvnaGKdjrk3Bbn/Uq+SA9fayflGKzaV2Uvn7BTBySluOXCduIQ8JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56I0PA7VI7FRacKs1yQchkEW05z+Fh8rfKJevwzbOs8=;
 b=MKt8KJLyRK/qjRssOx/dQQ02iK9BTFCMsGHjpFmovimZNROjWNAfQu3DyrzwTajtjuQ3givsYIIiXYZan8vhV0GdBqXL8FFxgqI5UCRC1WKuUod4V+LKGHKbFOaDTnTw/AqNcRR/HvqkKSKEk03Yp5RiDstwVNhwGhRlEDsiexM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <eefec972-fbfe-5aeb-f2fa-c37d18c27e34@amd.com>
Date: Wed, 21 Jun 2023 11:33:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/7] xen/arm64: head: Add missing isb in setup_fixmap()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, <Henry.Wang@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230619170115.81398-1-julien@xen.org>
 <20230619170115.81398-4-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230619170115.81398-4-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|PH8PR12MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c3eb65-5b08-403d-9598-08db723a9949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LbW9VxKHhz64xgSngpr+nFbOdZsOPcbDuVjT0vTMQfXM5jSelPjKsxVhUfwh8oRTpbPjSQTr51drhZ/SqDW1QtpNFbxzjUYPkqnUCT2EccdquQDHhMx240WuMQtp4tuCzPzXFSmiJf3MvCB03ubVAdJ1fuUGDeTTU+RXfZi8dHbRC3bTMbJC0lGFhHB2rKtcfsRnjD0r9NZ0ok6RZeDTxXZooV1fkphF0Wh++rt3Mg5wuiVVz2gwudK0Mich0ox9IIz/6Xlgu1irm4wnB/I8UdmkVXZHEl6m56EwAI83OuKyGPa+GKTkry3nYbX5Hff+UaJYQqPhALaApFvL7Fv5KDeiCcuxWrtGwxfKbTK6o6E6uFZGgSwLSgMS+dYqKrSztSCA8n/Y79OtkVvWpNSETSdQYKYObuRq4vGgxHNxwrgb3mOxLO6XlGMCkaGSmJoDXhJA0BHbBdDR0dYYa2ZrFbRc/HZNryB57KRBKFrbq1D7POrAnar9W1dJNJsriB8J/kRyNY2xDXP2/eW1NOyGz68nPMMbS8lRUPN5hpK2Hqll0a0TYs27Mnq2opSSRHpB0ghIAi5E9uRVQSkUdyaYUV3zJzUn5LU8ixkvc2EDqwao3JFyS0KpZ++NNMkyuQBSkHk9P+Qth2+TdKdh+w81junetHOuVMY1mlVk6V7B1ecFjjo7b3KrpWlYtS54OpOjdXyoj0C/lTWk4zvAWIOPxM9XIEIi+aMRlRdttRJQCNlpGZuH0e6qx1CdS8jC+HQDFUPTkHCAisTuY099w29QWtgIu+uYvKdOtnZtLkSS1F5pWZ7w0Ii9XbhaSrfrQEdu
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(36840700001)(46966006)(40470700004)(82310400005)(336012)(426003)(83380400001)(41300700001)(8936002)(8676002)(4326008)(5660300002)(316002)(70206006)(70586007)(2616005)(31696002)(40460700003)(36756003)(86362001)(26005)(53546011)(186003)(31686004)(82740400003)(47076005)(36860700001)(478600001)(6666004)(2906002)(44832011)(81166007)(40480700001)(16576012)(110136005)(54906003)(356005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 09:33:40.7369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c3eb65-5b08-403d-9598-08db723a9949
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7205



On 19/06/2023 19:01, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> On older version of the Arm Arm (ARM DDI 0487E.a, B2-125) there were
> the following paragraph:
> 
> "DMB and DSB instructions affect reads and writes to the memory system
> generated by Load/Store instructions and data or unified cache
> maintenance instructions being executed by the PE. Instruction fetches
> or accesses caused by a hardware translation table access are not
> explicit accesses."
> 
> Newer revision (e.g. ARM DDI 0487J.a) doesn't have the second sentence
> (it might be somewhere else in the Arm Arm). But the interpretation is
> not much different.
> 
> In setup_fixmap(), we write the fixmap area and may be used soon after,
> for instance, to write to the UART. IOW, there could be hardware
> translation table access. So we need to ensure the 'dsb' has completed
> before continuing. Therefore add an 'isb'.
> 
> Fixes: 2b11c3646105 ("xen/arm64: head: Remove 1:1 mapping as soon as it is not used")
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

I'm happy with the whole series but I do not see a point in flooding each patch with my tag
since you already got two (from Henry and Luca).

When it comes to essential isb() after dsb() in arm64 head.S, I can see that we are missing one in enable_mmu()
after TLB invalidation. On HW without FEAT_ETS the TLB is "guaranteed to be complete after the execution of
DSB by that PE, followed by a Context synchronization event", so I view isb as necessary there. We could also
introduce (just like for arm32) flush_xen_tlb_local macro and use it there + remove opencoding it.

~Michal

