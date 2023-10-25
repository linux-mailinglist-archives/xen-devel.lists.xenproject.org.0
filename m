Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D567D72C3
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 19:59:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623145.970676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qviA4-0004e7-Fr; Wed, 25 Oct 2023 17:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623145.970676; Wed, 25 Oct 2023 17:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qviA4-0004ba-Cs; Wed, 25 Oct 2023 17:59:20 +0000
Received: by outflank-mailman (input) for mailman id 623145;
 Wed, 25 Oct 2023 17:59:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XAhw=GH=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qviA2-0004bU-QR
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 17:59:18 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e83::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35a3d8be-7360-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 19:59:16 +0200 (CEST)
Received: from CY5PR10CA0013.namprd10.prod.outlook.com (2603:10b6:930:1c::16)
 by PH7PR12MB9223.namprd12.prod.outlook.com (2603:10b6:510:2f2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Wed, 25 Oct
 2023 17:59:12 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:930:1c:cafe::48) by CY5PR10CA0013.outlook.office365.com
 (2603:10b6:930:1c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.34 via Frontend
 Transport; Wed, 25 Oct 2023 17:59:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Wed, 25 Oct 2023 17:59:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 25 Oct
 2023 12:59:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 25 Oct
 2023 12:59:11 -0500
Received: from [10.71.193.58] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 25 Oct 2023 12:59:10 -0500
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
X-Inumbo-ID: 35a3d8be-7360-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0kBuw4X1K9vD4qC6RekqvSHAdUQZUrH9FFez1p+dNAbQPjZFLyqZ8kWzizUfajYLD7LSp3WjOPIoIfrzsHEKZIQrkub5kj0GcKfc3l1CdiCTjzSl1fiTZcJFej9PfIM+ogZT/y2rybCwG/Kw22yvBKWkBT2+PV8iGVGxT+fQ4J5dYveKd9yG+byPkGH4SSGpgBGC04jgV8Qi7IeouhSTXV03Gb4ET3UVvBXtiGtTWRT8gNmNwlTqy1R0by5lsG/hxOmn1u1mfzJxlkX2/Rm+yfx84AQY60bsyxGsiFrkDWmCTiRzKvAC5rsxdYaq/71m9cyrGM9YwCy6RP21Hsh9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUJAaqaEQoITOwXoOnoWyu97lWfwQAB2uYghglTAPMo=;
 b=UXd72RJ5jBh+lK2umohEhpgQ2rtboOhRQkJniceRgKRoRRfRGRRFw0N6gLskVlxWPWUh0zH73S4aovu/svyR7Ronn28xZw4gcdwzVtSu1zzh7qcy3/O5X9xG5bbT554UbqFCkyE+cNfIuJIO1LU1FlHtiEc5K/nWPwAmPjanWTckwr/mDHl1/nIBIOVYeghOdYvac6kd39QzOL16VJIMiTIFbkMaqRLAcCRRpN1ZYHXYY/OgHGNWFmsIpJEpVOeKZlfWLmC8USXjjGYU99WOTti0WRZYI024KivH1wtUifLQPNQisN2kskYi8vXVuRVeX+AE+Tq+DDys4NeOMjMAqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUJAaqaEQoITOwXoOnoWyu97lWfwQAB2uYghglTAPMo=;
 b=Mz0y5/qvwrDhn3SLCED1XgiGpqGRaE4YzJhBSU/3+I/6r6xhwyBbJa6MOF16eKUh7uIU8fWdAvXuLpqhm7jANFPbcY/WDSbk6+OreKW4HMjTyp1IysAVb3wcbn8dNPKcvYIdpDInqSKCZGhmKxCZZydtdxNomRwPgCQwaV95/L8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6c4c8023-1d6b-426d-9c9d-c45f01c9c5d2@amd.com>
Date: Wed, 25 Oct 2023 19:59:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN] xen/arm: arm32: Use adr_l instead of load_paddr for getting
 address of symbols
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>
References: <20231025170304.2331922-1-ayan.kumar.halder@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231025170304.2331922-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|PH7PR12MB9223:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc49e22-6b46-4ca1-3c3a-08dbd5841810
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JrkB5LvESRWxXkXYrzCy62oYGHna6i2sQRJYKkLa4W+gKAODCbvZgbKcw4ui6H63VIWvYG++3M42JlJEydTNx9EfuyfhMp/EFgDm1a9poq1AVvVebbupJvjfJrQ5YNWp3yyM6OojJ4wmq7nBG+B8kN9m5kA4qGtsPw4wvMg32FbqZjwUBuBaLdYYKrScgexi3sb19WY4SXWLDSBBwBFmnoRZrBs6c+RYYe5iB6UqhUIFOEzsTcObO2U27dVJKILITKGJHh11XEAmpNvx2vF1OOdIquoeV2+U6hRDXOpwLvQxby39llW6/KfzJ/t7fq60sYSpcb7i0GToBCRasT3UcV3Ia5XWj7+Ew8bSlmgBTG+TzOxvGHlJeTqUXwJIPoPquQ4Vx7+RtdaRwTCdpwZ9HipYwL96fUlk9h92muO1xA73MaoWKKafmAeIVJwaFI3/kVgf2DIPzM6kb6xdVhvEMANRjJxZ341A5Pqk8gUGLdMVvLsl4/63I76A27++0If9YSX2M5V5TQ2X9JNEqOPOSkNdWG2w+4+B+MoFCN+aieycxXNdGLNjfriLaAbWWfhIiU9c3WriuGSLMzhoFw7M9+07UupWgfi4L+0zDfR2O/3cfp+EcKOZtvvzpIvOXuJsPFdrxMRAfwIY3YM6glS5qhX25Evj8yh6OK1WeqPNz69I06BfVN4cbMt4VxKtiV2wJG+o2u3VBRgLZwZFKdaQOe0MxMZdkpGl/gCO3/dhY4zi30PMlyKT1Qvkhvkc8fQ8WyIU5iEL9jt9gBf43XmqzbUztFDs36cz7QOrHralIMCOr7gNt5EgRrYJ5+GKC/7J
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(451199024)(1800799009)(186009)(82310400011)(64100799003)(36840700001)(40470700004)(46966006)(426003)(40480700001)(31686004)(40460700003)(31696002)(81166007)(36756003)(316002)(47076005)(356005)(36860700001)(2616005)(8936002)(336012)(70586007)(86362001)(478600001)(26005)(70206006)(2906002)(54906003)(16576012)(5660300002)(53546011)(44832011)(4744005)(4326008)(82740400003)(41300700001)(8676002)(110136005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 17:59:11.8236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc49e22-6b46-4ca1-3c3a-08dbd5841810
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9223

Hi Ayan,

On 25/10/2023 19:03, Ayan Kumar Halder wrote:
> Before the MMU is turned on, the address returned for any symbol will always be
> physical address. Thus, one can use adr_l instead of load_paddr.
> 
> create_table_entry() now takes an extra argument to denote if it is called after
> the mmu is turned on or not.  If it is called with mmu on, then it uses
> load_paddr to get the physical address of the page table symbol.
I wonder if we need this extra complexity.
Can we just remove load_paddr macro completely (I have a plan to do this for arm64 mmu head.S)
and open code it in create_table_entry? I don't think there is any benefit in
having the if/else there to use either load_paddr or adr_l. This function will also go
into arm32 mmu head.S.

~Michal

