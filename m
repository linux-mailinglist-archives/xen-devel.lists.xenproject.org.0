Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C587562DC44
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 14:06:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445196.700238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oveap-00066v-SE; Thu, 17 Nov 2022 13:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445196.700238; Thu, 17 Nov 2022 13:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oveap-00063w-Od; Thu, 17 Nov 2022 13:06:11 +0000
Received: by outflank-mailman (input) for mailman id 445196;
 Thu, 17 Nov 2022 13:06:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N1RQ=3R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oveao-00063q-8S
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 13:06:10 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99624f45-6678-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 14:06:08 +0100 (CET)
Received: from BN1PR13CA0021.namprd13.prod.outlook.com (2603:10b6:408:e2::26)
 by CH0PR12MB5187.namprd12.prod.outlook.com (2603:10b6:610:ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Thu, 17 Nov
 2022 13:06:04 +0000
Received: from BN8NAM11FT106.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::98) by BN1PR13CA0021.outlook.office365.com
 (2603:10b6:408:e2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Thu, 17 Nov 2022 13:06:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT106.mail.protection.outlook.com (10.13.177.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Thu, 17 Nov 2022 13:06:04 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 07:06:03 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 05:05:40 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 17 Nov 2022 07:05:39 -0600
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
X-Inumbo-ID: 99624f45-6678-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXzks3lMZ4BYKyxSYfT1foBNzIrqKzPIvY0pEaTIfro4mW4G49gAyk46SGiAPruU04BX9eXWweQxIpF4J3Jy8H4YXHZDkmk+NE0mX/NSBblpmn/prGcVjXiUFfFFrfbEX0opq9X9NCQK6Oie7/+b4Y5DJ6hf3R8TLIqI92WjzDfV1MUS7+9FK4AbyB4WYVBFyjVr/gClaJOXsnzG2BtWRKPEsxeWIeZxjGByldkfMUIMoqy2Et5hLf1bu7cg9vDEmCiuhOWgd+ZwMlZytNxGqowUsdiJrm/6dKF1HTO+NccaMqIb91DlxpNaTtcbqSBz9s8hfzVaR648o38VIskfBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96I7PSRm2B+Z95pqijb32Ianubegkj8KGU9ZttwGcyY=;
 b=RPeOZC0gSCtkDV9Sfn1aMGSR5R+SMC4dcFLmmQDAf6YQDlPjy1PJK7KrT+hve8sQMNtY5oRThpWy539JeloqntnDqfUEpwxLWVnIkgpCG/Tp1yeOjPLrSsob+GKX9Yu6RkUE0unA3I5bOwg8nBolnEGqvkkcs6wyXo9DZMuASCTxdEFr4rjFkB6sDPXUUMyDCIu9mGKFd5J2F43+idkIDW+FDbpok/VTDpD7FZfKBmgeD8Om8+8mYeHsSdcHH90eix+bXHq9LV/E+muflYTCnYfTm3Gj95QaY90AoCSuHZleB3cGJ68SHaIXYRwVDguLZNSlODGkBhYCDoiyMavxuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96I7PSRm2B+Z95pqijb32Ianubegkj8KGU9ZttwGcyY=;
 b=Mip9bQL369iQqQT2JQ2EoeEktYwZkV9+sZkBHvSL0dQhfKl+D1Xt5T8YS3GVwEZG168v6HkkIbCDJ07xlk6S1eBfcpUqfbZNPlpsltJSu4e3iSTCizKlSCQZW3cM71HvoH3Fe+BimrwErQLYJQF35hpMxx3oOAtJgNzZGqpx//c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c402e773-b8fe-ae40-4a5f-b8f1326baed1@amd.com>
Date: Thu, 17 Nov 2022 14:05:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [XEN v3 01/12] xen/Arm: vGICv3: Sysreg emulation is applicable
 for AArch64 only
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<jgrall@amazon.com>, <burzalodowa@gmail.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-2-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221111141739.2872-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT106:EE_|CH0PR12MB5187:EE_
X-MS-Office365-Filtering-Correlation-Id: 143f803e-21b2-4969-09cd-08dac89c7be8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hGULb64sqSxL0hPyiDyeX/puRIgP+8jmFjnulV5EaQeeumSSDEJibWJaY0lAhv3dWK7jT+2IjQUwmaeIJYFTWXXmcInM9AVNbFxteyH3rraEI6vQUE9S43CjMMKNP5kyHrUaGB6t8VZj3K/Hor2J8zk9FlMjqKqNZd/g9uouzpxTvGw1YE7XKP5uZtHKVDmlZSMHGYbRY2N/llSFEqcHiP5Sb/ZyCOlfDeH4Evcnl71kMHZZlG6bZ0S5Pw3RO3jkpUWvNiba9797zxEdqaSKXZ6QN0xsIpFU6Xp1cqfOm4+hM6FjR0mNvzju+So5/G2mnlwOkAoa7W9psyAuvxjotB0yW+02joCyKLLBA/bY9fIyGSrx2D4QC3lmtgYKytPZA+ZCxkfILruyMhrJKD0eD6ytdSXNsSrZerGV05y48M6+Q/B3ZwWd56J1rpdBDo1iPRMoJPrkjKPk4WhycT/r02HZSFvmKF9B2zJ1bY1tymFUeOrK/s4LZ3nReTjpUfQbzBhkHhzTiqFS7mGP5g1cvKwtnYmxff3zh/CE4TXJ5Q4nhK1fsuytVRhf/b2S9+1LlBALLDGssxWBoXCJHfpOwkx416usahBNByRd9qn83ugPegeKtYrc/2vjsE/xANlYIevM2YL0qDAjC2Pm0EvsoO/Vd93oQIGnh5A/Ty5bc8gwJYqnuzljewhqNCwXxrjSPqWHNjmy58zptg5MUdFhbENK1uha/8jZ+nyD3F03omSAzMAUaqeBNpQvL6UDNloXoml0oT33f129BBLU02Qq/A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(36840700001)(46966006)(40470700004)(31696002)(16576012)(26005)(316002)(82740400003)(36756003)(356005)(86362001)(47076005)(44832011)(4744005)(336012)(40480700001)(426003)(36860700001)(2906002)(40460700003)(186003)(70206006)(2616005)(70586007)(41300700001)(4326008)(8936002)(5660300002)(8676002)(478600001)(31686004)(82310400005)(54906003)(110136005)(81166007)(53546011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 13:06:04.5135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 143f803e-21b2-4969-09cd-08dac89c7be8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT106.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5187

Hi Ayan,

On 11/11/2022 15:17, Ayan Kumar Halder wrote:
> Sysreg emulation is 64-bit specific, so guard the calls to
> vgic_v3_emulate_sysreg() as well as the function itself with
> "#ifdef CONFIG_ARM_64".
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

