Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE1E5A21A8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 09:22:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393669.632750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRTeu-0006mA-1G; Fri, 26 Aug 2022 07:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393669.632750; Fri, 26 Aug 2022 07:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRTet-0006jA-Ui; Fri, 26 Aug 2022 07:21:39 +0000
Received: by outflank-mailman (input) for mailman id 393669;
 Fri, 26 Aug 2022 07:21:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=99fA=Y6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oRTes-0006j4-NB
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 07:21:38 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b78995ed-250f-11ed-bd2e-47488cf2e6aa;
 Fri, 26 Aug 2022 09:21:36 +0200 (CEST)
Received: from DS7PR03CA0195.namprd03.prod.outlook.com (2603:10b6:5:3b6::20)
 by DM6PR12MB4202.namprd12.prod.outlook.com (2603:10b6:5:219::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Fri, 26 Aug
 2022 07:21:30 +0000
Received: from DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::be) by DS7PR03CA0195.outlook.office365.com
 (2603:10b6:5:3b6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Fri, 26 Aug 2022 07:21:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT059.mail.protection.outlook.com (10.13.172.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Fri, 26 Aug 2022 07:21:30 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 26 Aug
 2022 02:21:28 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 26 Aug
 2022 02:21:05 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 26 Aug 2022 02:21:03 -0500
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
X-Inumbo-ID: b78995ed-250f-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGbyH7muvHEoipQEAtq3d/hIBfCxRF0hXs4oPo1qwvfZ46QdbE/lFuCMXkBSUJ+X9nqH8p/ToPkAA1JJTVlT2NV4TMVrTioUhrLGuCQbk+zGhQIRmYvHaJLeefx5ngbpA2LeievgEP5LTklLbFqJetgwH8CamKgsaabVaehh8ZKgXKbhV4Y6HfEOw3GrAgYTXBP/95+iWfyMRPFrFImeaoIqVv4Gkdd7SJlaDRxmfbGxJmcZ6wnAO4mFUkSOyNosz4FlXhVupYl4E25nGXK77OGBxFNiAbyVoDTgdd0wJRdPAQG6tpa1nYMtb/D+Qi5yvF6Mip9o273cHeuNfuWOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KrnwC0SCNLFnWNsAStGDcCTg/7K8NzqtDx8qy8n6uQ=;
 b=C61+Dpg4Z5IbViH83PNCrykR6f/L/XeQpHt1WbDWgLlq4SkWq3cGr4QrXpLzPMUQ+g72PzAR7KxzlJk0OkoxbfF67WW598+6ScvM0ysCoR1oQHgUSZ0Vx4GeQDGw5kZyAFjCQ903ISG6qURHO+W087IHLjZaJ43YdO5zVfWv/RUd6HyjcIqoKYgSyDPWDGkAxoCPZYonY2ERygnWwOYi5BZRnYsO0DSJam+a3rPEFFJot5xm3e9ekIfu3D9z6EdhDgg1xOxnCa6661AbBlQb1y0GorhqLtoP16/q2eQpfCuvW74u8DWgbZz2zaAcw+/G8IlZZ9BjE0QFhg6IpwCpVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KrnwC0SCNLFnWNsAStGDcCTg/7K8NzqtDx8qy8n6uQ=;
 b=m0rShWp6xKQsMgjIF1oNxmQd1sIPGxQlkcbmyNMUYbt1eSF0guBjFEDiOaQVMQLDa/ilHaCNTOzSHB+iiTY40WDUcWiCTgwofICq4TbRede9G25wg3jJP4gF9iGiRGxJmbr4kJhxDzEmWIWXHRWEpKqnjCVEBh3aqRUoqscsgAo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <aeaa3649-33f6-e934-822a-47a982978a37@amd.com>
Date: Fri, 26 Aug 2022 09:21:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v6 9/9] xen: Add static memory sharing in SUPPORT.md
To: Penny Zheng <Penny.Zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <20220721132115.3015761-1-Penny.Zheng@arm.com>
 <20220721132115.3015761-10-Penny.Zheng@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20220721132115.3015761-10-Penny.Zheng@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39a711da-562a-4216-91ec-08da873398d8
X-MS-TrafficTypeDiagnostic: DM6PR12MB4202:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s1uesiAnZJdTYZADCkjrpsRgALNKHS+wWbkLxL0yeMe5jhDG175RcGZmQJQfTKM0+pYjsniE5CKOgugjpV1mxvGwMXJL9iieLntF5qbK8woSaLIuHwIEiCznjUlFp0dIDx80+ZcoPG5H8ziRMiK1QO+5rvhNPP0E2TP02f8kwj/g+BSFSYw/GER5dDmjutTWolNhSm1oODWBEdt/eBchBZeeIE02E7Bvpn7DuZwchDYJ7dFkdF5M5RTV+7tfJyUzP++oXy9AP1X1Zn/Man11WLUM18PoYRcIf+caFrpEtRDmA+7NGrHllfDvnYt7sidpCbGbbtomBzdo3NBpiIajJKJLMrnXmjVis4MXpSCp7acm1W688Glm/am1YykVb4bJGtiiUM08qn6qJrGsX5kw7Wez1uiQzP/NqWGJMLIPDIi1zPd6csV5C+XQD2RvJyQnDvy0Ga1MyAxM8kqakH/jUkQQ5tfCOXd22wTPlKJ0K9Rw2pHkoN13cmMG8MbbAkrmiawbGtEYHXUEOlikDvkOGiHUUHSlrJQ8uwmGi7BJZ3PnZm8MthGrSHlZuzujdiuZW68vb0XmHfx6MuUULtj8XHxrdvYvNfCEsmxYwwMJQLrZi28vaNlLOgCXBL+r+MXcdFi1GeuC2gojgrQCXXooowx813Q6/R3NNBppc5WNnU+wHdh3F1hcCbnBksLirgXt0SUktDNZu2QTjm2esyHHlujP2tex2Ghe0gjAiRzkwF/Ay+nP2bLpwR0iI//djM/U8ifrzDtqFRDKOFV0tmVjDHpk1rs3I03HtVPC/1BwphJGQz4/02CpiV639XwM/8MgmJKtio+X/UVOE3CG19GHXQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966006)(40470700004)(36840700001)(36860700001)(81166007)(40460700003)(356005)(86362001)(31696002)(82740400003)(16576012)(316002)(54906003)(110136005)(70586007)(2906002)(44832011)(4326008)(5660300002)(8936002)(70206006)(8676002)(82310400005)(47076005)(426003)(2616005)(336012)(186003)(478600001)(53546011)(26005)(41300700001)(40480700001)(31686004)(36756003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 07:21:30.2664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a711da-562a-4216-91ec-08da873398d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4202

Hi Penny,

On 21/07/2022 15:21, Penny Zheng wrote:
> on ARM, static memory sharing is tech preview, which shall be documented
NIT: missing 'a' before 'tech preview'.

> in SUPPORT.md
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v6 change:
> - new commit
> ---
>  SUPPORT.md | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 8e040d1c1e..3dfe6d2fbe 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -299,6 +299,12 @@ Allow sharing of identical pages between guests
>  
>      Status, x86 HVM: Experimental
>  
> +### Static Memory Sharing
> +
> +Allow memory pre-shared among multiple domains at boot time through device tree configuration
This does not explicitly state that this feature is for dom0less only.
How about taking what you wrote in booting.txt:
"Allow to statically set up shared memory on dom0less system, enabling domains to do shm-based communication".

> +
> +    Status, ARM: Tech Preview
> +
>  ### Memory Paging
>  
>  Allow pages belonging to guests to be paged to disk

~Michal

