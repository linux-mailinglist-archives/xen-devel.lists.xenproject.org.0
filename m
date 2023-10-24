Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 511107D4DAC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 12:25:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621812.968627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvEa2-0002Zz-At; Tue, 24 Oct 2023 10:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621812.968627; Tue, 24 Oct 2023 10:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvEa2-0002YK-89; Tue, 24 Oct 2023 10:24:10 +0000
Received: by outflank-mailman (input) for mailman id 621812;
 Tue, 24 Oct 2023 10:24:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BZZr=GG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qvEa0-0002VD-8Q
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 10:24:08 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 758e01b4-7257-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 12:24:06 +0200 (CEST)
Received: from BL1P221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::33)
 by CY8PR12MB8267.namprd12.prod.outlook.com (2603:10b6:930:7c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Tue, 24 Oct
 2023 10:24:01 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:208:2c5:cafe::8a) by BL1P221CA0007.outlook.office365.com
 (2603:10b6:208:2c5::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33 via Frontend
 Transport; Tue, 24 Oct 2023 10:24:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Tue, 24 Oct 2023 10:24:01 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 24 Oct
 2023 05:24:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 24 Oct
 2023 03:24:00 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 24 Oct 2023 05:23:59 -0500
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
X-Inumbo-ID: 758e01b4-7257-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGy+InvvzzfRZoG1e5hUEMTYlYpIm7KHghBvvAX+lseLwUKueEkTM5lkDrsPTWjHvuH0dyGq8PP1yW8bb8o0wTG5bBEFNKKajZOisv4z52EJuLahyus+pw+ZTJqbdUYBQLtPu1eb3tajLG1tS3Q7VbEsl9z7W6os70VWCHsmsFPem86lnZ/Q+oMbla0YU3AW/JQH31hPKt953OyzAYPac0OZ6QgOknvrbD9ZHkvprrSRci35JJo6U93E4NEHJaffYv7lY0nzqzYfK9/ae2GL5wJ6WOE9c+cQ3OoMIWmMr+jMLPG39aTFokBFr4oC7taqJkO5atLVcoKT135itPa8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Te4XdlPGmzqRV6rt14vg9a7TeWsgj/GXSstr7YqHew=;
 b=kAlJUvKO02rqKdfGlA3+lSd9HGslQ1xHtqRd6/ZzOLSB9GLnSepST1WOieFXR1by643DM59NtCDYNRqhZyAW/QvhnH5tQ2BB3+KRBuPY8Wb0/jkWPcxNXMK6ujyRixnYMWu11oKM8cw1f1EU3eDzEfm5SSjWDGO51619YusJbvjBUhG4BgStPJMSJ/9694Fpca16FPbZHyw2mS2iDb9Y/aBeFmzFwsoXKWHBGWsVbIbhx+tYTqytLQYLLsu1/JvuHUgX9r0sTFZDE04R6v9N9B02dLt9AA9l09YtywtEebTkgXrD0mlEJnHvfnEeKsQggc6ZyxcvjBJNE1IcoMMzSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Te4XdlPGmzqRV6rt14vg9a7TeWsgj/GXSstr7YqHew=;
 b=Aer2k7tuALtINZDW21VRlZ5YL13ZOOSgo6+FIAYTsx286AB/wRhSz4cUmwRkwXyThVv7tQyiRQjHwFzuQtlf0L1ww5usLu9UYOngO4BywvTHKbDumDQ4yd1v3Lf23moBkMDt8FESsQzclI2/jFA0gH9peMZuGKCYjS4UkTZcznc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a490579a-776a-47ec-a10f-014fdafef2dd@amd.com>
Date: Tue, 24 Oct 2023 12:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] docs/arm: Document where Xen should be loaded in
 memory
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231024100923.12724-1-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231024100923.12724-1-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|CY8PR12MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: 827193a4-10c1-489b-8ac3-08dbd47b571e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xAiO67Oz/jzdj9H1BpGRgwNQtsagq+/alFdOs58YLsvSzKNK1aK4pmSncHanceKp7LmLS7kugarYZ/XLeQucIhZclsoqxES1PyVlfFrlJiwcwbzwpakDkLx3pN3stN+hnVb/oWw5vNhhFDAkwg3FFZsZzbD3Km2t92GN16q9lsfaRPkTnXbNj8LBDplLwZA5qAEqsr1jlyK5eF6QfdTlul83AwW3uSK2wfgyeFNS+7/HdFyANQogm13AtFdlvFG7Gtfh4QvlrBR/Z6ASTHhueHdvAB2c5yMke6nTVFl2zGDHANxu0iFlzRe5sTPHord3x9Zns8ETbWdh0YVfCBnfCPYIrV2FfoRu4tmfvB8L8LkP3y+EiRrY/j4wpCSTTajjy1Tx2K8w62XTZBhYToOfNsFbwkJYA3nHiM5Tp8Z7+FhTUBpXSnvDzkK3eTeMK0cPKljdUUMcHFEiyHetUThPnDLtgukTewJHAZqUVeLlgUAfmYkQ4sorHh4OJoSXx67Wio4BBxfeW4aBO3CQ8nnLFcfS7qmN15GuX4cZtX8pHdzMR9JjrnuUk3NBD19yJ2/9A/0lN5wt+fvcyuSywlq8KgvdPXGVWQxJwU42g0ExzQrWm10PV4fbP+B83Vw3zUj9JJ4rq1iZdv/UY7lW7/AMtTpsngiCPvAsVY6isRKZsTcIooSBC4QwnQVqkHIXATFdsPUtieqlEcK1VRrzOX360Dsq8PIOAOEYHTcOvOooBmRI2MhL3E0oG31GYiK6amBH7tMn8TMd0a/hbrnShit3mSRpfrd767I9loXtLJ7zPW1P2xlgqd9mZpYEgWM8/y+L
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(82310400011)(40470700004)(46966006)(36840700001)(2906002)(41300700001)(40460700003)(26005)(2616005)(336012)(36860700001)(426003)(47076005)(31696002)(356005)(81166007)(86362001)(36756003)(82740400003)(40480700001)(83380400001)(5660300002)(44832011)(53546011)(16576012)(316002)(478600001)(54906003)(70206006)(70586007)(110136005)(31686004)(8676002)(4326008)(8936002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 10:24:01.0273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 827193a4-10c1-489b-8ac3-08dbd47b571e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8267

Hi Julien,

On 24/10/2023 12:09, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> In commit 9d267c049d92 ("xen/arm64: Rework the memory layout"),
> we decided to require Xen to be loaded below 5 TiB to simplify
s/5/2

> the logic to enable the MMU. The limit was decided based on
> how known platform boot plus some slack.
> 
> We had a recent report that this is not sufficient on the AVA
> platform with a old firmware [1]. But the restriction is not
> going to change in Xen 4.18. So document the limit clearly
> in docs/misc/arm/booting.txt
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----
one less '-'

> 
> I couldn't find a nice way to document it in SUPPORT.md. So I decided
> to only document the restrict in docs/misc/arm/booting.txt for now.
> 
> I also couldn't find any way from GRUB/UEFI (I didn't look much) to
> specify the loading address.
> ---
>  docs/misc/arm/booting.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
> index 02f7bb65ec6d..c6bdeafe5e5b 100644
> --- a/docs/misc/arm/booting.txt
> +++ b/docs/misc/arm/booting.txt
> @@ -21,6 +21,10 @@ The exceptions to this on 32-bit ARM are as follows:
>   zImage protocol should still be used and not the stricter "raw
>   (non-zImage)" protocol described in arm/Booting.
> 
> +The exceptions to this on 64-bit ARM are as follows:
> +
> + Xen binary should be loaded in memory below 2 TiB.
> +
>  There are no exception on 64-bit ARM.
This sentence needs to be dropped then.

With that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

