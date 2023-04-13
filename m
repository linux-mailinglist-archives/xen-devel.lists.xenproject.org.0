Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E71286E0F02
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 15:40:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520761.808729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxBW-0001r8-Eh; Thu, 13 Apr 2023 13:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520761.808729; Thu, 13 Apr 2023 13:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxBW-0001p3-Bo; Thu, 13 Apr 2023 13:40:22 +0000
Received: by outflank-mailman (input) for mailman id 520761;
 Thu, 13 Apr 2023 13:40:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=czPd=AE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pmxBV-0001ox-70
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 13:40:21 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9800453-da00-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 15:40:18 +0200 (CEST)
Received: from BN9PR03CA0553.namprd03.prod.outlook.com (2603:10b6:408:138::18)
 by CYYPR12MB8855.namprd12.prod.outlook.com (2603:10b6:930:bb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 13:40:14 +0000
Received: from BN8NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::71) by BN9PR03CA0553.outlook.office365.com
 (2603:10b6:408:138::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 13:40:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT079.mail.protection.outlook.com (10.13.177.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 13:40:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 08:40:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 08:40:13 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 13 Apr 2023 08:40:11 -0500
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
X-Inumbo-ID: b9800453-da00-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/EHzSU1RUuhpswNi2nUztmMWzsk7GkxZti2iDB5ceo7Hde6lFstFgo7+E1XTGYUzyl4JVUYRdWXxhiXKl//GenrkP5lG+5+V3gDBwSArRvSnSoujq386dheAdU8O5PwCAG8K2T3juapCk/gYVeniZuRKEBURX87B+0OVtKXfjnz2YhQ31b0RnMFf3T3p5q4khYvj46sdn/+/tjuyex+ddG3i1EHKbOSZiF6szz9ZwL3nGt4Gn9vB+QiMsJy3Ni9iX86Wqd0lDXfZ6bH66HPmvlRSqj/YYeAycgCe0oNXCGHfRKBZUJTxVswX2wSQMXmiUAaMa2fB6BOZMsGznio9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2N7a2FPedQrW8HRhTsmPLwKB/iTYWUt1peWJYN7LVg=;
 b=B03Hk7CL/S0nMpEyH9roLfVJfLliktGvhM0AcuQX5eSTQ3nHGUK7iKUa2JrGhJnmTZMhsgcMEsWgUfc9Sll3tUS9uRKC4gNyTF9mybz2ENVM2TSIhQ3gQJy6ioe0n7enXsdZB9xKqvLbMVDPzgOz/ZAbPyw2ORMRaU085tPIlk+dVEJ44jeWAToKkS8nevyNcUDFwNOIBikl8wmiiPTItk/9fhj3cxbUjs3b2vVpaUN+AJ+chU4JNeRBu/qkx7v76Ei++Gn+lna0pluzselizkC5jx0W96e4rWAYDxzJFpG19p6xTO1KIqDtj2dnwnzDK7LCAkrJA0/Y76dlT1Tk7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2N7a2FPedQrW8HRhTsmPLwKB/iTYWUt1peWJYN7LVg=;
 b=GhCBKVrpHfqQyeaZzRRwEPe3kdl04bAACax8W/IVJ6bh6o/+yqckjvZniXxI7PGh5bhjF9UGPwM51p6YnCeNjZLsQelwkApDfeaOSjhPE7Xx1h8B4oyBpl0fAfAt5JqkoueEqmQv95IZ6fqOUAYBcG/9f13Vcuak+JRje/Cdrp4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9211242e-102c-4468-c35b-c88f8e31b274@amd.com>
Date: Thu, 13 Apr 2023 15:40:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [XEN][PATCH v5 06/17] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-7-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230411191636.26926-7-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT079:EE_|CYYPR12MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a2ce5e-2806-4659-2df5-08db3c249c0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8r4mmPuq33zQyJJgXBtiZXWvzmiXFbdfXLQ7WDm4ddQFpwREnYpBLn+ik8ls7KW5JMI2mN3Xph5oTutNawf6wveW1jnxUOxIrkHZtjLbkk3dqf+T6p2OU1ov6LBZ7p5jMJ0kyYfo2XrE/GfbfWixN+SoLiZ1y4Kcu6aF3GtA2ScQ413P+nvB29rBxsDgEsslLs/clWa3BcF0M3GI0602ojKSQ2V6sq/kReBdK2FWL9JbEjbkpyDMrDbc1q9oQVh81P+qndMTJmCfz8/Vjombrv3IV4jS6tcR+zYIDR2Tsk3MX1q5c2I2a2UzWKbZf6HyV6GZX93LUGOUwFHMao5v9NU6cysYLKt/YiovBKLA5WKYY3e0asM4+FVT2upxJrC2LX6tOKrcfQxA754n/hCYiMjda0KDzG3Y9y+56NlD5W46bPXzVO+hjlunXb6lFGH73oaBB3XaqLB0fEe6HzVxUGZ4PUkbhh9G6m7MvqgFtrUEqFpIxeWHKWT5PAIRerjDeuR7Pt6bOM4+T0iERsM/H7bd8pGVWDspxOc4BY/ikPYQxGPbqYTXNs3HTs8S1ZAc7U0ZD4TYezrdyGsh5J3xNk16fdVhbejNQMBUA/XDnsnjcRASru0TRuSiWmzWbqtTpf0IUqbawxNpTZcsyzjZpYLSnFJPZ/ZsMdoGbnFJrbUwqZZDyxbmL+q+Cr72CUsS2pNXhjpFVova7eTlXZk7AEqGUXoqJWUFrliQnf7dk1EVjic7Om3RVfT/kCcwz3TBBU9CgWnRzk3mHiCjBjwu6dNTZEh549myEeqHwoC+fFQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(2906002)(31686004)(8676002)(70586007)(70206006)(8936002)(5660300002)(44832011)(478600001)(41300700001)(40460700003)(316002)(40480700001)(83380400001)(82740400003)(426003)(336012)(36756003)(16576012)(54906003)(110136005)(4326008)(186003)(86362001)(6666004)(26005)(81166007)(53546011)(2616005)(36860700001)(82310400005)(356005)(47076005)(31696002)(37363002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 13:40:13.7055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a2ce5e-2806-4659-2df5-08db3c249c0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8855

Hi Vikram,

On 11/04/2023 21:16, Vikram Garhwal wrote:
> 
> 
> Add device_tree_find_node_by_path() to find a matching node with path for a
> dt_device_node.
> 
> Reason behind this function:
>     Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
>     device_tree_flattened) is created and updated with overlay nodes. This
>     updated fdt is further unflattened to a dt_host_new. Next, we need to find
>     the overlay nodes in dt_host_new, find the overlay node's parent in dt_host
>     and add the nodes as child under their parent in the dt_host. Thus we need
>     this function to search for node in different unflattened device trees.
You do not mention making dt_find_node_by_path() static inline.

> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  xen/common/device_tree.c      |  5 +++--
>  xen/include/xen/device_tree.h | 17 +++++++++++++++--
>  2 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index bf847b2584..507b4ac5b6 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -358,11 +358,12 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
>      return np;
>  }
> 
> -struct dt_device_node *dt_find_node_by_path(const char *path)
> +struct dt_device_node *device_tree_find_node_by_path(struct dt_device_node *dt,
> +                                                     const char *path)
>  {
>      struct dt_device_node *np;
> 
> -    dt_for_each_device_node(dt_host, np)
> +    dt_for_each_device_node(dt, np)
>          if ( np->full_name && (dt_node_cmp(np->full_name, path) == 0) )
>              break;
> 
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 58ac12abe3..998f972ebc 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -534,13 +534,26 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
>  struct dt_device_node *dt_find_node_by_alias(const char *alias);
> 
>  /**
> - * dt_find_node_by_path - Find a node matching a full DT path
> + * device_tree_find_node_by_path - Generic function to find a node matching the
> + * full DT path for any given unflatten device tree
> + * @dt_node: The device tree to search
This should be @dt to match the parameter. Also, shouldn't the description say:
"the node to start searching from"
or
"device tree root node"

FWICS, you expect to pass a root node as dt node. However, in device_tree_find_node_by_path()
you do not check if a provided node is a root node or not (e.g. no parent). Is this intended?

~Michal

