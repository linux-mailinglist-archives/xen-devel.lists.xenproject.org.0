Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B207CA217
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 10:45:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617331.959838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsJDB-0007SA-Em; Mon, 16 Oct 2023 08:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617331.959838; Mon, 16 Oct 2023 08:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsJDB-0007Pi-Bo; Mon, 16 Oct 2023 08:44:29 +0000
Received: by outflank-mailman (input) for mailman id 617331;
 Mon, 16 Oct 2023 08:44:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LsVN=F6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qsJD9-0007OF-Hc
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 08:44:27 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 358b04dc-6c00-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 10:44:25 +0200 (CEST)
Received: from CH0PR04CA0011.namprd04.prod.outlook.com (2603:10b6:610:76::16)
 by CH3PR12MB8933.namprd12.prod.outlook.com (2603:10b6:610:17a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 08:44:22 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::3f) by CH0PR04CA0011.outlook.office365.com
 (2603:10b6:610:76::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35 via Frontend
 Transport; Mon, 16 Oct 2023 08:44:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Mon, 16 Oct 2023 08:44:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 16 Oct
 2023 03:44:21 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 16 Oct 2023 03:44:20 -0500
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
X-Inumbo-ID: 358b04dc-6c00-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9FkYzSEFC7zwMqYsvnUfCvBxVW98EI77/u9jlZ/CMU5bk6zXvkKKhh4wiRdfAQ0iPP0TCadwryGRl+GG/Ttu7LuqEAOggHzBYGKA8HIEKXkIUObUmwJBIFwxmSq/M8UOTM0/soToYEw5W+r9j2EBqXm1+Y/QYDkRqOMBQ8jr0IWTyzBBSEExS31DMAiK8x2DOv2oKaf73YFf2p5KBv3ISNgfiM4BXGV7/upYPcSoGmzuS7HrkowkFb8LKW+4zx9KEyk7ippPp1ahurcLShq2QnlO0B3MoXotzbcb9LpTFuKRP3ISSNfGgjsiRIR5/itbw3VChTZmCyUxQXNEEMx6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYcbKwUO7htz7Cu1Qpuikto4rkjlWi7xYiLx6TNI+9g=;
 b=bBz1ZoMeibs8xL35cFPRaxUFSistP8RPSoyeIejPyoPlWVgWvtkK/oyRWBYoHkslOmtSSSOxyyEfHkD0SyOFGIhCibGYaHBANO3tcoRde8eZ8RkIYJJWeZRAIbV1ztj/gILauwgnC0CfDVGGkhhNrrugd34koAB+iSx+E7TS2VKcpg+thN+BLK26l0CQSy4ud2F/evcVkZdXJwEek47qhu6UFHA0+QcciGwYZ000ZsHHaHX8mOa8NkDj6tvT4v7/sl0nKdNKuqlDW1zaEKQPABCJ8T9+cakEPW8o/51xalEp8WKv/wEsGxjXvLPbNcDHxPcE1TojRyifJHtiJhspGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYcbKwUO7htz7Cu1Qpuikto4rkjlWi7xYiLx6TNI+9g=;
 b=uaZuNYInLCUxlRRYBtWfiMwzGmwCEQJbuKYga4FniKq7P7+IfLXGbvkad+cGNsBJimMO8SDK8myf8DyuA3yOR6vdh1webWYxO4Qjhy9619vpgmhRv7K0QtGszVeUyRRG6rv2Ahn1zfkh+0/cQ2je7Mm0R7EVjLNkAm/eoGDNhME=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <169101f8-0475-45b1-b2c2-60dadd88d3f0@amd.com>
Date: Mon, 16 Oct 2023 10:44:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
To: Leo Yan <leo.yan@linaro.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Alexey Klimov
	<alexey.klimov@linaro.org>
References: <20231013122658.1270506-1-leo.yan@linaro.org>
 <20231013122658.1270506-3-leo.yan@linaro.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231013122658.1270506-3-leo.yan@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|CH3PR12MB8933:EE_
X-MS-Office365-Filtering-Correlation-Id: b071c4f2-d655-467d-97be-08dbce241851
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	16CQRt8Fc+krYYzRRoo/is4XrN0xSlRMFpxfJxaW36FbiodYgbVjPvMl1sgv0r2HaxXCFBRlgb1qZfX0LCYlgLSICk0PzLqFey5LBMyBduUeAkgFWNue6dj8b8SZG6QpvZ6b0l4TJBYXC2c9dwCwxwOS0PYhcWVjRB8BmZgBni9Lx193UxLI2p7iTHHW5+9dHJoiiKhWQHDsP8dxLzobTvhf0/ffFMllrWRwQcYbryUUOd3y4CRQ4RVES4iXJRoLE987CquV9a1h4kCkADC8bBGavzRBqgMfDvFz6OdEREZR938VXyQ+WUsb/9IVP/BrW1HY8bq0i0R04XrFOy0JXNYal4upwYaGUMGiX+o7/w3FJuNwELW/E71V6KNK0DZn1w+vaIw5VKnpKloe5P8rf0sRSeWOmdqUUEshrimROsBb7qtCdL25v43soZoAM6W82UJpOVsiVPXRq/2vqL++8gDcmbSoKDM8q7OjOoIoagCbLl7FhAPIpfTtbaLZXajmreDwY5bF6jZ6889s9YGNOiKUxWpJwVjRLWfVKl/+tU5B3pvrAgHeCCuFhVILC2tEz/8CcW2v6Dm4BbHY3ogaLshMeHRkPfs9wLmKRlzsX2zWm6RmCxvNf4sISf1gDrEq+iu6CwEFWdVa1cCqXXMMmlLya5r6QrN03qGfoO8TIK3hYnJRHfWmJ4Nc/LfbJqXHu6HewDVdIV/cdS36oekJdNvtU0cTDnn21PWAV4I9gFpuTKve+A6vgRWWZAa7y3tH6ZGv3INJxwxk4Lr9asGN+k+ZGxlr7g/ELlmoCrjCeJDXxAePwyKgdeoWOBeXWnK0Jjq7pF7S8q3L5oC0tDnsHQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799009)(36840700001)(40470700004)(46966006)(40460700003)(40480700001)(31686004)(478600001)(110136005)(70586007)(70206006)(54906003)(16576012)(6666004)(47076005)(83380400001)(36860700001)(86362001)(31696002)(356005)(82740400003)(316002)(2616005)(26005)(53546011)(426003)(336012)(41300700001)(5660300002)(44832011)(81166007)(36756003)(8936002)(8676002)(4326008)(2906002)(147533002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 08:44:22.4420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b071c4f2-d655-467d-97be-08dbce241851
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8933

Hi,

On 13/10/2023 14:26, Leo Yan wrote:
> 
> 
> On ADLink AVA platform (Ampere Altra SoC with 32 Arm Neoverse N1 cores),
> the physical memory regions are:
> 
>   DRAM memory regions:
>     Node[0] Region[0]: 0x000080000000 - 0x0000ffffffff
>     Node[0] Region[1]: 0x080000000000 - 0x08007fffffff
>     Node[0] Region[2]: 0x080100000000 - 0x0807ffffffff
> 
> The UEFI loads Xen hypervisor and DTB into the high memory, the kernel
> and ramdisk images are loaded into the low memory space:
> 
>   (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
>   (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
>   (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
>   (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel
> 
> In this case, the Xen binary is loaded above 8TB, which exceeds the
> maximum supported identity map space of 2TB in Xen. Consequently, the
> system fails to boot.
> 
> This patch enlarges identity map space to 10TB, allowing module loading
> within the range of [0x0 .. 0x000009ff_ffff_ffff].
> 
> Fixes: 1c78d76b67 ("xen/arm64: mm: Introduce helpers to prepare/enable/disable")
I don't think a fixes tag applies here given that 2TB was just a number we believed is enough
and all of this is platform dependent. This can be dropped on commit if committer agrees.

> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

