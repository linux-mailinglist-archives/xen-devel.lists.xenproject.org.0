Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D472D743566
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 08:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557276.870479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF83q-0005CS-8o; Fri, 30 Jun 2023 06:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557276.870479; Fri, 30 Jun 2023 06:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF83q-0005Am-68; Fri, 30 Jun 2023 06:56:54 +0000
Received: by outflank-mailman (input) for mailman id 557276;
 Fri, 30 Jun 2023 06:56:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z+UV=CS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qF83p-0005Ag-Bh
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 06:56:53 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a4109cb-1713-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 08:56:52 +0200 (CEST)
Received: from DS7PR05CA0106.namprd05.prod.outlook.com (2603:10b6:8:56::24) by
 PH7PR12MB5595.namprd12.prod.outlook.com (2603:10b6:510:135::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 06:56:48 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:56:cafe::92) by DS7PR05CA0106.outlook.office365.com
 (2603:10b6:8:56::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.10 via Frontend
 Transport; Fri, 30 Jun 2023 06:56:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.49 via Frontend Transport; Fri, 30 Jun 2023 06:56:46 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 01:56:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 29 Jun
 2023 23:56:46 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Fri, 30 Jun 2023 01:56:45 -0500
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
X-Inumbo-ID: 4a4109cb-1713-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUiaaBu3lGaa7rn+TQr0z1ocQo1o1nDMLLLsUwvYBTgqjVnd4MxKNnWfVAb5CxPqXy7mUM2azaBnKUgWmU0C26Rv5ItRXwHOgb813goek6V3Vzd9GEjbCj19JlfCJZYNVPMXg46OP1tXg9byA2Zc7R63vP1G6ICjtDA5sR2kk9QEW8vyAThUJoTWEV8hyPOEX700/psJCczuD2wAuPMNNqP5LSobGKmM7+iwMWIHj/RVb1NLoRVWF8K1ySfscE9cIpedVhf4/JJWZ2u8bH9X9NuQ6OWfDSC1rALp9hRPaVt3xwB4AUu4DBJgJ0dmVw+DYanLPRhkiapcRg2fEV2azQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlxV8Lbaehrh+AV43bPj3QVxcxMU/w/pDD24b4RSVHY=;
 b=REi0xLXhQ9GDZGE4r1p9P7ZeTveKeaa58e+M27qKcwk6aR0ygbUFyMTAoqgNhYfAdyLU5sX0cQyWOtBmRnVL4eiZdImtd10xrA/OQLFk5jRTjwtl6tnh+q31MRsUMAC7WfL3nRTCVXQvidOs1W9d88v86NDeS6gPfmmk/pBH8tWzalro0xWOqRg5Kh2o+dOrmr/cLYip/n+g6ouaFLStLLWCYDdbwUq5cvrvsKcEJpjN7LQW33ji8xRk5t8ywUq5ghVB0kphV8YWYRsh4Wx2nQUUGAoR8MOOa7IkfNL1fHzi4LcZ4muZABe2uQcpykJvkdChvKUPVV52tw8LbsMnEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlxV8Lbaehrh+AV43bPj3QVxcxMU/w/pDD24b4RSVHY=;
 b=y4R3cB+9GIu9Ma/zs4RGu3k0/KLBwqh/E6IWAEWWlHXx3TS5jGOPvUcVjKGQoG/YMy0C0M3wyBh6bceH2r25apVCJvNHEXXzIDLLqFJJBpgLyuTDDAHxQywwoeHrL/P8BF07d8Ow6OTRhosMnlbLAeN+BEZhk5QbI0vKHTZauuo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c921be22-d272-5c15-24d8-5002f9773e16@amd.com>
Date: Fri, 30 Jun 2023 08:56:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [v2 3/4] xen/arm: Rework the code mapping Xen to avoid relying on
 the size of Xen
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, <Henry.Wang@arm.com>, Julien Grall
	<jgrall@amazon.com>
References: <20230629201129.12934-1-julien@xen.org>
 <20230629201129.12934-4-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230629201129.12934-4-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT029:EE_|PH7PR12MB5595:EE_
X-MS-Office365-Filtering-Correlation-Id: 247fbda6-1d89-4641-41a4-08db79372bf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rsb/dxhHaOswTLtOpMsKpS9OB8b1wcd+MqQkEA2vWcM0//SkPoHToEK2ZHU5BZKAzJBDR/i5PTdaA0zwyKXVMzPz1d1hBCeRIhgsQyb7DYXy9oKxx3SYWbfdsK4owZYWdOgexpv5406tytrinosg8UhGg5m6HL37z4RIONh1UBAbervQJLXmnyOhuzxOvAQ5I6HVh0qHNXLxhiFu2dxQxRzV6K4V74xlsD3M+EzfOvAVVlpwkO5G2NBS0l69pe2WFK/tKNrBCugbxB+JG+g4bWP5nSNF18nDvd/QWlmx5qHN7wxh5iATUbakqoA8IcftMOuN3UAz1IYeKDtHi0oKnDwpUT2N4vixcqj5LDH9+Nz29ixuh+0yd+ryM6AnrZzIWeVdpJB3rTDaiBZ40Aab4iaAs/whYHahgkP3TRQzXpa3d4nYcJVMUjPxFfn4gCf028fYCsbIcXAxv051p3pnlixE8k2i7LKagKsB2OwjFoDwKK6ElESd86r8Uv9ypGlRUSymbvtPL32BM8YPqlAv1zGbIfivvscRISzCs2VPnoOnLV80BWGLq+m9vVNdwUFOnTPweLqUoL896aczcGBcgQbi1R3R3djJaf78Deybvf9i+1fLxhnKn1ziu/NLKqSZ/JgWKAf9ejt6+KtN+YLuQb3ZaB3n5CkrYzSDL59igwZInQGtHlerWaQHMfZy7IzEegDbrXEx88bOYBqbKE5aMHVMPqKxatEl1iV8Sc6jlLfiRYvYAzXsX++DTx50fy3PK5bCdaGFa9ryptz45QxlPZWUe5krawiowCTG+kXENQo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(82310400005)(356005)(82740400003)(81166007)(6666004)(426003)(336012)(47076005)(2616005)(186003)(26005)(53546011)(40480700001)(36860700001)(31696002)(5660300002)(86362001)(40460700003)(8676002)(44832011)(36756003)(2906002)(4744005)(70206006)(70586007)(16576012)(478600001)(54906003)(110136005)(8936002)(316002)(4326008)(41300700001)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 06:56:46.9734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 247fbda6-1d89-4641-41a4-08db79372bf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5595



On 29/06/2023 22:11, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, the maximum size of Xen binary we can support is 2MB.
> This is what we reserved in the virtual address but also what all
> the code in Xen relies on as we only allocate one L3 page-table.
> 
> When feature like UBSAN (will be enabled in a follow-up patch) and GCOV
> are enabled, the binary will be way over 2MB.
> 
> The code is now reworked so it doesn't rely on a specific size but
> will instead look at the reversed size and compute the number of
> page-table to allocate/map.
> 
> While at it, replace any reference to 4KB mappings with a more
> generic word because the page-size may change in the future.
> 
> Also fix the typo s/tlb/tbl/ in code move in arm32/head.S
as well as in arm64 (can be done on commit)

> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

