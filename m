Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C83E71FAE8
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 09:24:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542974.847482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4z9B-0003gh-Qg; Fri, 02 Jun 2023 07:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542974.847482; Fri, 02 Jun 2023 07:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4z9B-0003e2-NA; Fri, 02 Jun 2023 07:24:29 +0000
Received: by outflank-mailman (input) for mailman id 542974;
 Fri, 02 Jun 2023 07:24:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0i3i=BW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q4z99-0003dw-VR
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 07:24:27 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f307c43-0116-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 09:24:25 +0200 (CEST)
Received: from MW4PR03CA0340.namprd03.prod.outlook.com (2603:10b6:303:dc::15)
 by IA0PR12MB8695.namprd12.prod.outlook.com (2603:10b6:208:485::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Fri, 2 Jun
 2023 07:24:19 +0000
Received: from CO1NAM11FT082.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::9d) by MW4PR03CA0340.outlook.office365.com
 (2603:10b6:303:dc::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.26 via Frontend
 Transport; Fri, 2 Jun 2023 07:24:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT082.mail.protection.outlook.com (10.13.175.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.23 via Frontend Transport; Fri, 2 Jun 2023 07:24:18 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 02:24:14 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 2 Jun 2023 02:24:13 -0500
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
X-Inumbo-ID: 7f307c43-0116-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOcnkr4Jxdh1RRrm7EKbqvxRFNqkvcL3aKMF5NeZJKD1rKK2C//F1X5NwLhfobxAFWGvVkIsIVqPJxBekQprqYXSb6KqjanoqoKRN80SR4gu15IrR+yB3Z1YNKbUHCB9MvD3Sf6oebpT7VAEhWb32Moa3YPDy+f6m/5o3LNmsabjfJqIAYeawUBUj9VcjAR3Gegfc+9ZROS7lw+Gug+wsS/rL2MNNU8icCc50kBSTQKW8wkF1zJiwnxRDkl6oQZ0O4hPlzgJ1fGjGnfdh5Sa1Hu1iEyZN4txT+ZVRX17YybBqNO4jmkC+Zi/0Fb5YCTAv1SW2y+KmvLVGOpl1LYd/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1dho4j3ITrGzunz0Tk5zT7Rk8cy9W8B6MfB411khX0=;
 b=Mkn6uHcg7d7D/5m95Ua5TXoZ55CScPBHxxbYCAnCrPIA7oh+mdhPoTZZ8TFdp2cHd+jut3GIusPoyX0sRAv6N8PvEAweDJCb220WZtfuKtoa5hPERC44IcQxG0PUGXWy9dUQsoqPYOD7Jhl+wAQrKRWohTXujGtwzGeo/xKnY3mtlqWrzKi8JxpmNdcH9h7iu9Nn55oMyX8ERNHGb7G9v+nl0C7ZQBZLQu8fM6Q9FY1QbAzUM/4IhIaEmkSG0iyvuDwOPdQQrQCvX/T6DVcdUzS1OzmhdVgYcXhPixzHeOTzHZOJHkKv+7pvERFonhOzOrvJmtI2SNrCaTc3/RBrpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1dho4j3ITrGzunz0Tk5zT7Rk8cy9W8B6MfB411khX0=;
 b=MuWj2d6dgDB3HMHhj/xSfxkSnaH4h1T1Acuwq/PfsF42Uyhr5F84K+f/yRO/TsHp0Dm7Tu2pK2FNuLcnkK9ZokmvE7ltLxTec9Ft3zTQHMxS9M1BrKO666Gnd/jvmutQD0C82TMwh8ORve3R3xE5Eqhi48ivP6fuAZ7D14Qa/Qo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6272380a-d0e1-ea91-6a5d-aa566727e46e@amd.com>
Date: Fri, 2 Jun 2023 09:24:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN][PATCH v7 08/19] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, Vikram Garhwal <vikram.garhwal@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, "jbeulich@suse.com"
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-9-vikram.garhwal@amd.com>
 <AS8PR08MB7991C49F7ABDC5DF8C41250F924EA@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <AS8PR08MB7991C49F7ABDC5DF8C41250F924EA@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT082:EE_|IA0PR12MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: 936bcca4-b31a-4b5e-0730-08db633a6092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hMDYEnuz/ZUjSNeISRFxTqHrRFpO+lu7uDIni4p2y4Gf6SsibnzlVaMBAHXPz4Ak9H+NebrQ2JMXT8TmgkiN1On9vnviCY88WRKmmN4JV4fExcaQc2lE4Qn40J9gJlaOem6Klgj4UC/pqBpMEMXskUVkqz8bGGUJFbUqzeagg9esly3gxm4raz0cJNU9DwR/e7dd93tqRMXbFljR01SYymUXGvGZAQWkIjPUe7ETwHzjuHtyqYgJJhgYxnpwiSn+B1CbOQ1vyJvsufrTJv+2EnmPwfCYD74fbM7KkTIXhLDLNYez1dPfDZg5pnirEi4eCZ0YYX7L4RUe1kHWd/rAbUipcRft5nq/+wJsEXja4UW4Jzks3LNvmLmO+WfP5lzP8BXubcdU4Yh38PItjlihTFZhTiHG5NdHlKTZmToVJvsT+9b/a+ID9776T2NGeXbrxzVKHQE952D6zqULLWcKmCNM/E/W+gNRtS91aedcrxQUYlqcWHfN6ctJ7Z4Cy1PP/daDxLr3/EfOMxqamTEDdzFpyDGl3FLVtF3iE5JZPMCXlrvs7BCqYsnvSYegToJ2rEyJvWwY7GVoPQag8ko458VawMNv9fQNF23CGx6iAsAar3Bf7WSG72NfyrxxBTpWDBjr/O/xlR7GSEypcJwVJzYCXc3DiKcZnvC5Xn8EMySYTQ0ZP9XRsiqLGSZwAzp9aS7UVV4X7OQP2nbIHeAE6QdkWDaNU2xYKjySB5Ru4aH63eH3R/g7xypREVEzRwzyG46HDkspNIwiK9OUXb57z3O8+Xo9/mfXC0swNG4c7RWwc8l106J05XRtfdmyujkSlKLbvmUCji1VfoAb+3/eOA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199021)(40470700004)(46966006)(36840700001)(16576012)(54906003)(86362001)(40480700001)(478600001)(110136005)(40460700003)(44832011)(8676002)(5660300002)(8936002)(36756003)(82310400005)(31696002)(2906002)(70206006)(356005)(4326008)(81166007)(82740400003)(70586007)(316002)(41300700001)(2616005)(186003)(53546011)(26005)(36860700001)(47076005)(426003)(31686004)(336012)(83380400001)(37363002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 07:24:18.1086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 936bcca4-b31a-4b5e-0730-08db633a6092
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT082.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8695


On 02/06/2023 03:52, Henry Wang wrote:
> 
> 
> Hi Vikram,
> 
>> -----Original Message-----
>> Subject: [XEN][PATCH v7 08/19] xen/device-tree: Add
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
>>
>> ---
>> Changes from v6:
>>     Rename "dt_node" to "from"
>> ---
>>  xen/common/device_tree.c      |  6 ++++--
>>  xen/include/xen/device_tree.h | 18 ++++++++++++++++--
>>  2 files changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>> index 16b4b4e946..c5250a1644 100644
>> --- a/xen/common/device_tree.c
>> +++ b/xen/common/device_tree.c
>> @@ -358,11 +358,13 @@ struct dt_device_node
>> *dt_find_node_by_type(struct dt_device_node *from,
>>      return np;
>>  }
>>
>> -struct dt_device_node *dt_find_node_by_path(const char *path)
>> +struct dt_device_node *
>> +                    device_tree_find_node_by_path(struct dt_device_node *from,
>> +                                                  const char *path)
> 
> NIT: I found that the indentation here is a bit strange to me. I personally would
> write like:
> struct dt_device_node *
> device_tree_find_node_by_path(struct dt_device_node *from, char *path)
+1

With the indentation fixed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


