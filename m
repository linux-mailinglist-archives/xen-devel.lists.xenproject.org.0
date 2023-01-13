Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF56669497
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 11:47:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477193.739787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGHaO-0001ba-R8; Fri, 13 Jan 2023 10:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477193.739787; Fri, 13 Jan 2023 10:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGHaO-0001Za-N7; Fri, 13 Jan 2023 10:47:00 +0000
Received: by outflank-mailman (input) for mailman id 477193;
 Fri, 13 Jan 2023 10:46:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFx8=5K=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pGHaN-0001ZS-FL
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 10:46:59 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99202e7b-932f-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 11:46:57 +0100 (CET)
Received: from DM6PR02CA0084.namprd02.prod.outlook.com (2603:10b6:5:1f4::25)
 by CY8PR12MB7415.namprd12.prod.outlook.com (2603:10b6:930:5d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 10:46:54 +0000
Received: from DM6NAM11FT110.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::69) by DM6PR02CA0084.outlook.office365.com
 (2603:10b6:5:1f4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.14 via Frontend
 Transport; Fri, 13 Jan 2023 10:46:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT110.mail.protection.outlook.com (10.13.173.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 10:46:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 04:46:53 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 04:46:53 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 04:46:52 -0600
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
X-Inumbo-ID: 99202e7b-932f-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OA00ajGrj3QoB53DYE/ipfMFJa2jdtFnwgd+QlFEwxxnUJ8Qq1t2S9Whyl8iG1FzFiMYol5XtvGlqbQd9ad4NkRLcKGaJb/qkL9pmAij4eTPZr2XWfZBAoCiRGsX3u34EUFmwAK0Gkt3F/oPsPFnBYLj/TCxVMS5v2ZcNVz07uvX049DhR7DqPlML2tBbHB4gq8nAnUL7Vp64xT4+KeWhVZorqsOaKm6RWzHiNhvTdjeYA8aV/kzhY8jwcAccOdjSvNr403c3fllvuNqLgSAxVv88o9U/vuXuR8y36Hrk5R8XS6fAe0bkjt5LmssJSSKlHP3KC12pFZC+o+mWGGPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzbfDr1VZnamU4LdrVFf8z88bEG70m4uommrJcHbGlw=;
 b=BwPtxvCFAChHM9V3va98qYla1TZoHzV75HQFSkTYmF7KMM74zUKtqWAvO5XrjNovs3GgCrPYEzBP9PHCalOAlRwMJV6s1nwsqX1CdNrkEFBBDoErVEeR4thVpgOKI1gSr3adXwipJH/1b+CPSGR8nFwvqzFpga+sWv2K4XUZ+Pn+R/U2XyyV0fepA8kRm9393KCcHWH18Mu8Ak8mvbkIzmRfqiRlGAST18zkDSxPYpDIzOiJZhW+O2bu8XGNdtwGihScrXB3g64t06Oa2DQZWsyNRHNI+pTHWCUblSUEra+k94aT4r4dK7UrXJgOIBww+WCJZYR/g58qF8cWgGicaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzbfDr1VZnamU4LdrVFf8z88bEG70m4uommrJcHbGlw=;
 b=wyK2nhqgcKAnrW1rGKEjgLfqZ5GoaAWPIeLUz95cv9IWyTuOFk427r+YoNIWdxoiWImwMpOmr8Sg8UXNNiNQEKTQ/EshEr+eizJ3tP8B5upkIOQt4orpeiJo3bKicmVP/Qh0CB5p0fnSqJHZbqaf/LF1F5p3hA/CYqXvNyuRDbg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <7c5a0c31-4793-58c1-dc6b-9c63acc37153@amd.com>
Date: Fri, 13 Jan 2023 11:46:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 08/14] xen/arm32: head: Introduce an helper to flush
 the TLBs
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-9-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230113101136.479-9-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT110:EE_|CY8PR12MB7415:EE_
X-MS-Office365-Filtering-Correlation-Id: c6aebba4-b1d6-4847-fa1d-08daf5537c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	itCWU5CNtzgmLjL4V/oZGFfLnjpEeW2HpkWjAmgUhs0RSzOLpMuKoCTSVYYfM17odz4fsTyD0hNNYSuxH9af3O7R2P9tAQKUMypAFhMUrkgRIzP+BuuhhGEtD0nhEC23njTiTFkgmwP3JkC1BtsKa0fI6UHzKrLsQN5pl0NmJ5QNQurbRb8igLjvDMn6KVxGc5WsC9YNJHo2t6S9YXvIX/X0NPoNbHCjoB2XmHmnM478pODxvO1M7IfLkj+LG986UigfOcQEyvpduX6Q7qQvM2XgFyhgpROU5AtkcvtM1Y59eCNtwLw2RsYMU/D9wUiQpCq1tamexLf8BHr+hILV93VIL6C8gho1ptDVrYifIKwiIp2r98NoWk6PpHbdd1DEr/8wvwuI9UyqecgelVg3CcP8va353oZ4AaAfr5f5vrZMFR/jXcFv5S3Gtu9oJ6bn+TYzksygNMnzWEzkbg5qRrMBwwJQ6FCifWiQSUFT4/+Gq0MhGAFtgT0vA0iRPLxARswM2UmUFHy/cxMflXbz/Xb2g06pTfjJvVx3lEgu3+RO5En5fdOJ/ExHF3b8IBRGpONBpIEPAwLj+xX1xSA+XwQdm1P6w5/JltSVpbJDnNZ/Ctk/K8i1Wuax8zej8UB812HR0tCEztUzKJ1Cn3rfpNGR7CIeTR3Aw4vcCp7E6hTEngm9+S/ZCn+cnZQlUGApatpfu9ZlxRlyVZ97bhqOHvXcrwkvFXaWWumS/dK1gYPCy2xUsQ9hp2H9lVcstyihEE4SGUxmyu79VXDZFirKvw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199015)(36840700001)(40470700004)(46966006)(82740400003)(478600001)(356005)(41300700001)(47076005)(81166007)(426003)(31696002)(40460700003)(316002)(110136005)(16576012)(2616005)(54906003)(86362001)(40480700001)(336012)(70586007)(26005)(186003)(82310400005)(36756003)(70206006)(5660300002)(53546011)(36860700001)(2906002)(8936002)(4326008)(44832011)(31686004)(8676002)(83380400001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 10:46:54.0306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6aebba4-b1d6-4847-fa1d-08daf5537c31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT110.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7415



On 13/01/2023 11:11, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> The sequence for flushing the TLBs is 4 instruction long and often
> requires an explanation how it works.
> 
> So create a helper and use it in the boot code (switch_ttbr() is left
> alone until we decide the semantic of the call).
> 
> Note that in secondary_switched, we were also flushing the instruction
> cache and branch predictor. Neither of them was necessary because:
>     * We are only supporting IVIPT cache on arm32, so the instruction
>       cache flush is only necessary when executable code is modified.
>       None of the boot code is doing that.
>     * The instruction cache is not invalidated and misprediction is not
>       a problem at boot.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----
>     Changes in v4:
>         - Expand the commit message to explain why switch_ttbr() is
>           not updated.
>         - Remove extra spaces in the comment
>         - Fix typo in the commit message

Thanks,
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal



