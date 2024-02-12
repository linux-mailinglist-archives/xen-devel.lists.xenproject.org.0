Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65931850EAC
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 09:13:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679310.1056723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZRR4-0002Zr-QD; Mon, 12 Feb 2024 08:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679310.1056723; Mon, 12 Feb 2024 08:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZRR4-0002Y8-NO; Mon, 12 Feb 2024 08:13:06 +0000
Received: by outflank-mailman (input) for mailman id 679310;
 Mon, 12 Feb 2024 08:13:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvA+=JV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rZRR3-0002Y2-Pb
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 08:13:05 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2408::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a6c7cee-c97e-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 09:13:03 +0100 (CET)
Received: from CY5PR16CA0013.namprd16.prod.outlook.com (2603:10b6:930:10::32)
 by PH0PR12MB8176.namprd12.prod.outlook.com (2603:10b6:510:290::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.24; Mon, 12 Feb
 2024 08:12:57 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:930:10:cafe::52) by CY5PR16CA0013.outlook.office365.com
 (2603:10b6:930:10::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35 via Frontend
 Transport; Mon, 12 Feb 2024 08:12:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.76) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 08:12:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 12 Feb
 2024 02:12:55 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 12 Feb 2024 02:12:54 -0600
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
X-Inumbo-ID: 8a6c7cee-c97e-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYm53e209R3JrgrW1CTzsKrKZP1yEenUZjedMzKG6wYacBUPyWqwHEIMgB7AunkPa8nBt10T7VhGj9thQlGcw5ZtXkyrwbJJhkM3yHllNfS27B6W/VqzWEWfhsFrtTxLe/v1MRQoPlnemvEgA0MQ0r6/rpB6oWomQKeSEq3iZLKY1M+V7yfXWifZVu0ztiuF2w3tD/A9PTqUKNIzo0csOYy2p2oZY/cZ/WCLqgxIgu5v6VluQFBr3TL1fyzG8PZ+2s/SvKpbcQP4zKvR/RjHwQTy0PCayEuuvPtWZG38Yz8axTrb5+R2QTifmlUA5qVYxA8HyOOsh5KyYfstKtFbew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BCuVF2LjiJkAqCSItuhKHrn8l6x2R3Y3ZiE8ZP9DFY=;
 b=NKszdVUFHyyYOIz9LxtboZ6fvA+7rwWCn/VxGkDokGF/VYiKkWmVr/qD8HMs4Feed7u+tPnnsPLWzmSjGX5oOyRb3k9T7ECHGj2hzHAPkjbkRJ9NK+nuZN95lmrQzrcOp1kLSNCeXekOuz9rizEGQOCajeVsTdrf5AbeuEzChuF2l5owx9GJLSEIFtSffGZDJQbTXxfPG7+AhDLHHbiAdIo8iUeYw8nwd90FqKbjnS8QTmI96dxGpsBAJmV5esLOSHT0JxGxhCUVus20py7PVStmVR5D7+TAyAmnuvjWMcMe/YODIEqfvn8ais9C8Bj43nFHbAlwNg60+8LMl7C+2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BCuVF2LjiJkAqCSItuhKHrn8l6x2R3Y3ZiE8ZP9DFY=;
 b=RPXMFCOCZ3fUvD+3EmLcclcXUFgjJqPhdr7l+qtCD2MrLkWNMa/BSDaHVgXtVDY4jH8/EIt38LwRQBhJgTIj91ez/wKP2ODtzpUsgGmGsQ+LyGC2Y2dmVrr3KIsIejFOgaICSasoBuyHKrknJJ43tqqeUWJPGQ4f6GQlI9EFG60=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c516259d-46f1-4bef-b4d0-4cfe18a3cb8a@amd.com>
Date: Mon, 12 Feb 2024 09:12:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/7] automation: ensure values in
 EXTRA_FIXED_RANDCONFIG are separated by new line
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
 <8b6f208f0b4327392cfddbfa6809117cc7686750.1707499278.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <8b6f208f0b4327392cfddbfa6809117cc7686750.1707499278.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|PH0PR12MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: b4eb8e14-8a30-4254-86a1-08dc2ba26bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1DGtTL6MzxyVMhp9WpbPsVBO3lMxrB2ntAqCsMijAmr1ChWd6bBnXkBN6Ngul6DjLvpteBO4wvw6EDTRILRmh5wcF8u85UN2Rzc4k7w/NqhA8A9T8hoOpsC1bv9xiJjhbn7nwQ52caZp5t9WDr8Go4U0zsnqkbOQbGifXv10u17xVd4gGUC5+HEXc0q/cUdEcuR4k7tc/FN6vgTOH1S6Xv7gclprItibTu1r2z/P0Kn/wt4N1zo6HulwyCtZA9vLfZTUWVs9BSpFa0mseePQ9iUrBTMsUwIey0Z5aphwDYMCqHckni8J4uct4j6I7f+3HW4wzQAeTi6V+bcSSsBY8aaNiS7Sy1+wlZnl6u+aWlVS4q1+/lprLKRuH1OPl5osoNrCDJKdWazN2mkBhMMTVslxzqgqi8pb5Ivz8KZI4DQ41AUC5cT6JFmkuIbqB4cMsltv0nEQf/nKkmvMvVfkARFF7ge1VxIXUcSn5+njazzTvh1qD2lbgNww+/cr3MKXqBcxysFOFCsuxa/jcVsHxgcjrHwtMr/Nfkc64glpCL9I4gE5ZEYMOr/Jhb/UR9D1X+AzoGLFWcLRpyJEKQb5rK+b463HZa4SfhwAEp4xAOw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(186009)(82310400011)(1800799012)(64100799003)(451199024)(40470700004)(46966006)(36840700001)(81166007)(31686004)(82740400003)(356005)(41300700001)(86362001)(31696002)(4744005)(426003)(5660300002)(336012)(44832011)(8676002)(8936002)(70586007)(70206006)(4326008)(110136005)(54906003)(16576012)(316002)(2616005)(26005)(36756003)(478600001)(2906002)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 08:12:57.3337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4eb8e14-8a30-4254-86a1-08dc2ba26bdf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8176

Hi Oleksii,

On 09/02/2024 19:00, Oleksii Kurochko wrote:
> 
> 
> Kconfig tool expects each configuration to be on a new line.
> 
> The current version of the build script puts all of ${EXTRA_FIXED_RANDCONFIG}
> in a single line and configs are seperated by spaces.
> 
> As a result, only the first configuration in ${EXTRA_FIXED_RANDCONFIG} will
> be used.
There is no need for this patch. If you want the variables to be separated by new lines,
just use a '|' symbol after EXTRA_FIXED_RANDCONFIG (see all definitions of EXTRA_XEN_CONFIG).

~Michal


