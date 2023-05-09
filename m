Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FE26FC502
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 13:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532119.828153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwLXW-0006eJ-SK; Tue, 09 May 2023 11:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532119.828153; Tue, 09 May 2023 11:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwLXW-0006bt-PJ; Tue, 09 May 2023 11:29:54 +0000
Received: by outflank-mailman (input) for mailman id 532119;
 Tue, 09 May 2023 11:29:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PO4B=A6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pwLXU-0006aG-O6
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 11:29:52 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cef9cece-ee5c-11ed-b227-6b7b168915f2;
 Tue, 09 May 2023 13:29:51 +0200 (CEST)
Received: from BN8PR07CA0016.namprd07.prod.outlook.com (2603:10b6:408:ac::29)
 by IA1PR12MB6627.namprd12.prod.outlook.com (2603:10b6:208:3a1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 11:29:47 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::56) by BN8PR07CA0016.outlook.office365.com
 (2603:10b6:408:ac::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18 via Frontend
 Transport; Tue, 9 May 2023 11:29:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.18 via Frontend Transport; Tue, 9 May 2023 11:29:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 9 May
 2023 06:29:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 9 May
 2023 06:29:42 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 9 May 2023 06:29:41 -0500
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
X-Inumbo-ID: cef9cece-ee5c-11ed-b227-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVm6F4awnu945CCXBOLTejpcGJ+uisdVhuwYrfleMqlgZ2OrdBwDU6vOwDNecuG0s2Iher9wqwoJYxoD2fOxQk8lQDpHB/h/1G10Cke3Tqhknr3ciUv9I1/Lsl/mSk4Fq7KUNA7+Vou8fgSG+Dph+0pq3V2FoCjHHSoiOmZUUZK0rnT590HfpuYPaW4n8R/67tG2sPSqtAdHKm/zc0fDn06wuOhvW/7urGDbOTN2XrmQewthtY00XaZdxh1Ct9v/kSScEnoe0/2qN1tWfN5w72PXgArRRUCAAaNFGhkL4rmzYDFzBXDojSClljg4NU7UUZ932vBoJMWltzKQXv5ysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lEcqQLcDaEF19Nz3REWbrermeWgjlYGyZZ8ZM+1zR4=;
 b=TJA0Ja8tFZ3poU/KCePZnAz8U9qyAklk/Hqs+UuiUYJFpxTEdIpgwUWVScHiXMzt+s2PZFpc1AnuZ7UzbtzJLRrBUa/BrFzbAcMJ+r/NizE2PjbXQ9JsfGsE5sJJMguuDTlcpxO8Y+jgFltkadzLMa2y0361P3QsdPog0Q/LP8u1BFDETpm8gRgP9EID9Rqgg60bhXyiDeFQt2Isu0tH3oL4fExPubgRcGzcOPZuFiGvptCPdLaSeLrF0kMG9jYE1U31EZXt9I0rn6adfpALKNVWTVMwYRDuwExZgqSdoUi/eaNO8dlcAyePWyimpGC4PTGNoZqU/3xJiQJMkmcyNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lEcqQLcDaEF19Nz3REWbrermeWgjlYGyZZ8ZM+1zR4=;
 b=da8nxxS7AaVmtCUSjtKXF89EKkUABJM7LpE6/gy32sWY+9Y0n//K0if6oWhmwiJLCWTt8jFx2dTkoADfVEJCM74NiFw3GdbIrwnt2NeGDyjRLGfn4Sn4rpHxRhZ9KKsrUL70fWxaAZMW377hazLxkByzL+FNaloVV0t9Cc8UsdA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <080bd1fe-a58c-5bdf-eef5-995420001ca4@amd.com>
Date: Tue, 9 May 2023 13:29:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [XEN][PATCH v6 08/19] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, Vikram Garhwal <vikram.garhwal@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-9-vikram.garhwal@amd.com>
 <AS8PR08MB79910CFF4439E503046660EF926D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <AS8PR08MB79910CFF4439E503046660EF926D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT030:EE_|IA1PR12MB6627:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c76b904-a6d3-44db-3e22-08db5080b1b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jh5wDg5ZFI5TKwcxmgdwLwkxnRqcc5WEiJKiD0EaKKnepk5VZf4ahfD+oKU5+NPCPvsmfaoS2AYOit89nbBAq5y2Ntvm8sgGPxQ+/BuHqMKCqLBytJ1e95A61hwmYRSNN+9leuSqDyqHcD8TwqtTkNAbeIFKpNlmQzlljBsON2pRbSR4lNFx+NHak+dgbflyxE4PAPuyoIZ40OlP6lIZNoS/W3G+ZcQgP8dg7Mf4ONS/l1EXf3JN66r9PbpgB70ugqgbfw+o9t3DOWopHwv0DaLukiyWVbTkXB32iLeJMR8MkpW1Ti2Zs2wX/tLiqLCHX1RzIO6VNO/nRSSWFhQdqrb984GiK4f9uNK5GiGXR/0XQIRcXpA7RhiTe929hJiA2s4I+UGd1HChhEZPHBEehOXr/Hs1KkH/UByTDc3t7OEhvuV9ehzwYpqxu1T2T2MamPHyQK/Wi7TsDpuJr5S3SIw1w1Nvah8t804h+cnMy55GZV1rkDse9Xp6q7YP5+pFgTvR8ZGU4fEZTo9OnIpe+tfVy8xbDaFGWSxV9K3sW+D3sBajUNCw7EeVemiliKdy9t6bYQmn8QlMqmW0o7Ed0d5WkZCNVgatqF/A3Ow34DsvV8ihHhsOQMwJqeUB7U7Oj7Cv6KajD8Pb2uVp+YfD5JPUW/wAH599Kua5MHJ+aZJ199IGbmyCpxbJ1c69eACjplOobQxdQJv8ARxo65yJabhskhavT5f5upCXqIcBv4+3vg434WKyzwoKo3NwNUQbCZBZVVQAPJVvVSk0Vg3qQmiV8/CUW7cqDtjjbWoKJ38=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(31686004)(40460700003)(478600001)(4326008)(70586007)(70206006)(110136005)(316002)(54906003)(16576012)(86362001)(36756003)(31696002)(47076005)(336012)(83380400001)(36860700001)(53546011)(26005)(2616005)(426003)(8936002)(41300700001)(2906002)(356005)(8676002)(82310400005)(40480700001)(5660300002)(82740400003)(186003)(81166007)(44832011)(37363002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 11:29:47.0200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c76b904-a6d3-44db-3e22-08db5080b1b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6627



On 04/05/2023 06:23, Henry Wang wrote:
> 
> 
> Hi Vikram,
> 
>> -----Original Message-----
>> Subject: [XEN][PATCH v6 08/19] xen/device-tree: Add
>> device_tree_find_node_by_path() to find nodes in device tree
>>
>> Add device_tree_find_node_by_path() to find a matching node with path for
>> a
>> dt_device_node.
>>
>> Reason behind this function:
>>     Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
>>     device_tree_flattened) is created and updated with overlay nodes. This
>>     updated fdt is further unflattened to a dt_host_new. Next, we need to find
>>     the overlay nodes in dt_host_new, find the overlay node's parent in dt_host
>>     and add the nodes as child under their parent in the dt_host. Thus we need
>>     this function to search for node in different unflattened device trees.
>>
>> Also, make dt_find_node_by_path() static inline.
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> ---
>>  xen/common/device_tree.c      |  5 +++--
>>  xen/include/xen/device_tree.h | 17 +++++++++++++++--
>>  2 files changed, 18 insertions(+), 4 deletions(-)
>>
> 
> [...]
> 
>>  /**
>> - * dt_find_node_by_path - Find a node matching a full DT path
>> + * device_tree_find_node_by_path - Generic function to find a node
>> matching the
>> + * full DT path for any given unflatten device tree
>> + * @dt_node: The device tree to search
> 
> I noticed that you missed Michal's comment here about renaming the
> "dt_node" here to "dt" to match below function prototype...
This is one thing. The other is that in v5 you said this is to be a generic function
where you can search from a middle of a device tree. This means that the parameter should be
named "node" or "from" and the description needs to say "The node to start searching from" +
seeing the lack of ->allnext you can mention that this is inclusive (i.e. the passed node will also be searched).

~Michal

