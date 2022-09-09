Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFB95B2BF5
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 04:11:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403763.645981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWTUA-0001Tv-WF; Fri, 09 Sep 2022 02:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403763.645981; Fri, 09 Sep 2022 02:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWTUA-0001RK-T0; Fri, 09 Sep 2022 02:11:14 +0000
Received: by outflank-mailman (input) for mailman id 403763;
 Fri, 09 Sep 2022 02:11:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mxBE=ZM=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1oWTU9-0001Jj-Mr
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 02:11:13 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac8acaf9-2fe4-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 04:11:12 +0200 (CEST)
Received: from BN0PR04CA0043.namprd04.prod.outlook.com (2603:10b6:408:e8::18)
 by PH8PR12MB7373.namprd12.prod.outlook.com (2603:10b6:510:217::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Fri, 9 Sep
 2022 02:11:08 +0000
Received: from BN8NAM11FT074.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::ad) by BN0PR04CA0043.outlook.office365.com
 (2603:10b6:408:e8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Fri, 9 Sep 2022 02:11:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT074.mail.protection.outlook.com (10.13.176.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 02:11:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 8 Sep
 2022 21:11:06 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 8 Sep 2022 21:11:05 -0500
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
X-Inumbo-ID: ac8acaf9-2fe4-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHISOrPh2xSOWja/+UnueSoTr09/tOvznd3UX2PkoEJQ/xRgmhE1HX8hNXkpmgE7p6NgCGdMEWm8nlsI74CMfIslx5nWRQT9+JkjPD+6NPHERx8Y6QWLSSvQSr+ujrAyQETvwaWbPIfcFsNHmlIILn1BzUfqRPx7bYdMEL6LLEMwEBJ63hmGvSfr0Ecg1kfNPIvCClfhNx0T29PtlGoySzm7c9AHXHZxk38YVqrxnlPX6kTwGGRkxpP0w69Jn1yqjs74pLyYdiR9v5QVhbcBKHAv3DWhw1qqu3GGk/sTUCC+Gi5Vtzv88/OKTNRzhA3cwusnFqDMq7Exmwv6IyD7WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6RoDuXfh3zKQAT52pkvRBxPVV82P0YYMDY+d6ouWTY=;
 b=cr0V4pRmj8Y9as9mBNJRcs1NiHDYEE8GFhzf1PUg6xI3HUvmAukRL12hacifc0nKCnjdxCHS4rZGmQ0Fl1qk+7KvS49wxL4+/lzcFA/c3tvq2BVJ+nb4aW2uZPpjE25A3co351b0p87oqxpB2uhNRAf6ULALaHcKs1ovMx+uMo/Fi225QsG8EVX99vnv4P9XzsM1RBTL9uK56QuCqIE7HBAi2sAUHJrqU1W+w+GnFdm68y/HokA9fg4eId4q1tOKqAqAZpgnP77jEBFjiNGg6+bD6/vhxa2NG/hXfgV5QHGYFEUvDMnG4OBMnJQUv9YXqAUPVCjplXpFUmGmN3immg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6RoDuXfh3zKQAT52pkvRBxPVV82P0YYMDY+d6ouWTY=;
 b=KC1g9a1dnQ2we2KznWFmflubajrhDmMx6Yq4viBcuv2lotkRSF9hoXZeoqSx1VbjpYsvfQWNAi/kupkg6TYKcufAXsSUU4U6d0yeZ5RkRmkQc/0AkLwzZP1I3JXBCCSP/zvjL2hOzbzPR6bSFp0nYeBNBs5BsgLk/74ToQ2oHL0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Thu, 8 Sep 2022 19:11:05 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <stefano.stabellini@amd.com>
CC: <jgross@suse.com>, <boris.ostrovsky@oracle.com>,
	<xen-devel@lists.xenproject.org>, <JESHWANTHKUMAR.NK@amd.com>,
	<Devaraj.Rangasamy@amd.com>, <Mythri.Pandeshwarakrishna@amd.com>,
	<SivaSangeetha.SK@amd.com>, <Rijo-john.Thomas@amd.com>
Subject: Re: Linux pin_user_pages_fast fails on Xen
In-Reply-To: <alpine.DEB.2.22.394.2209081905010.157835@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2209081910340.157835@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2209081905010.157835@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT074:EE_|PH8PR12MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: 952dfa46-45c8-42cd-7612-08da92088eed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yo0u0UcINC90Lp5yRF2YBhZEhGxDkrK6RpYSb96v8X3wSmXiN9J88Ilr9iMQigVWJ8j6i2vpkUSyStdRHzsL9To3B36R+/Cb/xWp6feYMtWyAO7Dp+LRiGFHa5g7U1yF1EWZ8mFjTDZH2tNj8ROTNjrpayK+aMILWamo1nNM1bxCHq/fq7+jpcNbOGcAZHhilPDZ7htKXGWpp0uwpVFHUIGC/kKop0CYxzKlgsBr76C65Ypm3+YG2ZnjHC7fpSS3ykKCfBoVO1tdjhombG3VyU90Md5Z8k7p3P5KuPOsaUe8c4jDd7ew4vOPpvztZ7UxzBIjiwWNocb0ATqt/7qr/4u8cuEnNyzuw1KygW7NMDhcOREtyaCJxJGFPlLhPUvwQY+YbsUqIDl9lcpI2WJYuAdnHLXFyM4HOUfKDRMm2v9Uf7+FysTSMitVJvnqjeet6+pV/4z0/D2f+1n1086+CbBRD7srbtqEVdA0lgeM1+SpcFCDWSku+574lARnZHbA+FVotBBwtY4By+/3wAwswdn7RfgWoYE99hxSMRoY6uhlia2cUkY8B1i2NBA0jnnwPg4S1QV4WjSaaOoVj35M24eFPYiR8nNK9bAWVrpOe9BmvygY2z1tUUIZ+fQAspkmP1bI3N8zUYjYhc9lag8vP8+Wzh7+znYsgFohFbawuKR41GTLK2khTQEO1Qr0MP1f9RAmTAInprzTrWclsbN9/66U9x6/pRcqa3ZXkMEd3JG5eiBXHfZWffyOtIsvrGc8Yis/A5z5t9jI2cq9WR5gaigLI8dIYS1z5K3MwQEoVomIuenLOoJy+2Bm9/SZuotN
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(7916004)(4636009)(396003)(39860400002)(376002)(346002)(136003)(40470700004)(46966006)(36840700001)(6200100001)(9686003)(82310400005)(33716001)(26005)(5660300002)(186003)(44832011)(336012)(426003)(81166007)(478600001)(356005)(41300700001)(36860700001)(40460700003)(6862004)(83380400001)(82740400003)(8936002)(316002)(47076005)(54906003)(40480700001)(2906002)(4744005)(70586007)(86362001)(8676002)(4326008)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 02:11:08.1042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 952dfa46-45c8-42cd-7612-08da92088eed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT074.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7373

Adding more people in CC

On Thu, 8 Sep 2022, Stefano Stabellini wrote:
> Hi Juergen,
> 
> A colleague is seeing a failure on x86 in Linux Dom0. The failure is
> pin_user_pages_fast with addresses that correspond to foreign memory
> pages:
> 
> - QEMU maps a domU address using dma_memory_map (xen_map_cache)
> - QEMU calls an IOCTL to the TEE subsystem with the Virtual Address
>   returned by dma_memory_map
> - Linux tee_shm_register->pin_user_pages_fast Returns -14 - drivers/tee/tee_shm.c
> 
> Once upon a time it used to be the case that get_user_pages_fast would
> fail on Xen because we didn't have a struct page corresponding to
> foreign memory mappings. But that hasn't been the case for years now.
> 
> Any other ideas why it would fail?
> 
> Cheers,
> 
> Stefano
> 

