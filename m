Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC568A085F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 08:21:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703765.1099637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1runno-0005jc-I7; Thu, 11 Apr 2024 06:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703765.1099637; Thu, 11 Apr 2024 06:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1runno-0005gR-Da; Thu, 11 Apr 2024 06:20:52 +0000
Received: by outflank-mailman (input) for mailman id 703765;
 Thu, 11 Apr 2024 06:20:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1M6P=LQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1runnn-0005gL-5b
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 06:20:51 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2d54a50-f7cb-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 08:20:49 +0200 (CEST)
Received: from DM6PR02CA0040.namprd02.prod.outlook.com (2603:10b6:5:177::17)
 by SJ2PR12MB8136.namprd12.prod.outlook.com (2603:10b6:a03:4f8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Thu, 11 Apr
 2024 06:20:41 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:5:177:cafe::7d) by DM6PR02CA0040.outlook.office365.com
 (2603:10b6:5:177::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.22 via Frontend
 Transport; Thu, 11 Apr 2024 06:20:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.206) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 11 Apr 2024 06:20:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 11 Apr
 2024 01:20:39 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 11 Apr 2024 01:20:37 -0500
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
X-Inumbo-ID: a2d54a50-f7cb-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccgh9R7ncAKScMZkREoy1fEg+odVb7jSmpUhWji/PLatIYgMWjVyEZsOSKbOT5OVOqn8Dpzni2D8913x/hXakwtLBWeS+XqZ3LZR8PV74asdcegRvnxjMcygc7LSlm1CZyEqsV3TxeTBmXRTDFb+ZWivzRdkAR/06NrAkaNwqZ2p4P3lsIGySRzNziSejMwt4/AeUowU+gAa12a1QdhhfWV7lrdqeA6GWArH8hjbeo/ZZKSY8ro+2oTxqpiENUkLwxRjDQ0RLX23T4dhQ8c8pGHpHA8RCKfzprc45uj+Y2IQ9g//XYru5HP8H92r8vrAR5Zrq65clV1J1pRb0Czp4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNQBc+WRHN83s8CDV6RHZ6lMWbh9DMwkNyvlj3ivSSw=;
 b=NkWPyJVkvf3ksvttNIdwcgmg6szidaKLp8rIcZ7qT3+1eZ97upgik/gNHqgM99do0zzEXS4dsMUU7aWz+t7+lGo+Vdt7chjN+kdhkIaqXJ66EP+2uLNQ85c2oDQHGNSvSwWmGPI8QEfUJyxu7yINUT95BVqL1PoKLMkFU8Gd8SlxTanV4HHOERmvaZtJZbfhEMXGHuowXqOYVYJGMChzeXcXDgZfIovjdA3vbV4H4hHYq8bTLiZifLf0u2n/t22slfA8VQXOWFDPHk0KRsoKLhvJeCFBuYYg91FXkUu8Cp5WlD9ByIbTK1/4cfd4mEFXreiBTmYZxakhXjQZq18q+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNQBc+WRHN83s8CDV6RHZ6lMWbh9DMwkNyvlj3ivSSw=;
 b=imCh3GtNN14f7UbZeEcS8nsQZ7NxzQjRqbwOzOLRKYbQ9VGK+Ljjk1w+HHa6OSSq+Bg83SRxZKB2U10GizY075z7hx7Ou4JjsnWKbkszxOWkVcvk62K3iAXMb770Lv7evT+r03jBLwQoBbTP9ZAAoW1uhu0m/r9l8RjZ0MnAB6o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ddc89f97-d71b-4175-a222-64c4c42bd8a1@amd.com>
Date: Thu, 11 Apr 2024 08:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen/virtual-region: Rework how bugframe linkage
 works
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>
References: <20240410184217.1482366-1-andrew.cooper3@citrix.com>
 <20240410184217.1482366-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240410184217.1482366-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|SJ2PR12MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f8c00f-20bd-4402-88c1-08dc59ef82b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n7I4dQiQA8sBO9FqQlpeVigK2FlTIOWHi7fpEFz5wNalTU+h5fZkP82xyGLgCi5nVTkIsOwGHQ4pjoZSE4hyH7+dgXDEd+LGV/ErtnMPwvwKUqRG1e6hLC+7fsK1a/JbzQqZjxUUNLr3MB+ooX6aOTSLsH8ERc+eAQZ1aHFCh5fUuSVPOBUVzGNkaAcCwClZmXKIrY+RjE1Nwjzmcv4uo0X8vM/WXZ+W+n5eVaX+5lf1Zu2ARTEzPpDeCb64hhik4e4HaqT/klvH03rMC/Qz599wYSFlUdrmVtyzjfOFxqfQrNHCBIFJva1Tgcdj/1c4eBpH6IGHeIAQro9padlvvKAnZKLm1ifEdgbnEUvGC9r5M9Hnc6pxnn8aPh5ofxgPnvy1mFR8M8KPsbpkbvhZaYDV2AqjOV7gx0Vn04dMcF6FJztiWVUXtSYfPs7nBpEcy19XFq8ocIrYsZbUYqQ+tRD/H7bKmsFFvd8orkugQIRvot8RT4/6AyG+OqcgcUECwhp1eLhxLJYiGiNiU43Xx8ptitoi3u+2FDyWGvY7sXglZNB6ZUk1rX+1mge3nP3NDitU2MgTlxOchspGLMAgBHcOsMZC/xOXYRLREGouyTISmaugNkLXb6wfP5Jx65aiEsD2lazddhPLbtdOjYVIBHcyHPNKRE+/3KIhqcKYOEggZ2NdkcK96XK/Xg72kR4tDWcegcanuzVZZDtippF+wLs+ZkTiwOXIzea6WhQJFhcPRWGEM7cunHyKs0NSfeDe
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 06:20:40.3952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f8c00f-20bd-4402-88c1-08dc59ef82b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8136

Hi Andrew,

On 10/04/2024 20:42, Andrew Cooper wrote:
> 
> 
> The start/stop1/etc linkage scheme predates struct virtual_region, and as
> setup_virtual_regions() shows, it's awkward to express in the new scheme.
> 
> Change the linker to provide explicit start/stop symbols for each bugframe
> type, and change virtual_region to have a stop pointer rather than a count.
> 
> This marginly simplifies both do_bug_frame()s and prepare_payload(), but it
NIT: s/marginly/marginally

> massively simplifies setup_virtual_regions() by allowing the compiler to
> initialise the .frame[] array at build time.
> 
> virtual_region.c is the only user of the linker symbols, and this is unlikely
> to change given the purpose of struct virtual_region, so move their externs
> out of bug.h
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
For Arm:
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal

