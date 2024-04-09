Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE85C89D2AB
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 08:47:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702154.1097013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru5GD-0006t5-T9; Tue, 09 Apr 2024 06:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702154.1097013; Tue, 09 Apr 2024 06:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru5GD-0006qL-QV; Tue, 09 Apr 2024 06:47:13 +0000
Received: by outflank-mailman (input) for mailman id 702154;
 Tue, 09 Apr 2024 06:47:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NvYF=LO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ru5GC-0006qB-24
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 06:47:12 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbda7ebb-f63c-11ee-843a-3f19d20e7db6;
 Tue, 09 Apr 2024 08:47:09 +0200 (CEST)
Received: from MW4PR03CA0166.namprd03.prod.outlook.com (2603:10b6:303:8d::21)
 by DM4PR12MB7765.namprd12.prod.outlook.com (2603:10b6:8:113::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 06:47:05 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:303:8d:cafe::44) by MW4PR03CA0166.outlook.office365.com
 (2603:10b6:303:8d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.35 via Frontend
 Transport; Tue, 9 Apr 2024 06:47:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 9 Apr 2024 06:47:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 9 Apr
 2024 01:47:03 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 9 Apr 2024 01:47:01 -0500
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
X-Inumbo-ID: fbda7ebb-f63c-11ee-843a-3f19d20e7db6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adFEz8oCYdX/gJFocmFFuCIIV+ztkbZP3R7YkJr/u9yWbv8G+5t0nOjihDUUiUW5FA7MfdP8yVYea8zWJL0ACN3djTfmFM/gknu0tw240ZJn0XYocxnEeMAu2YC/uarcZuCnZk1FIgzJ0/kTWGluT6OE2OW4BWBikLuRrBaeRHEUYEAjhkrj1egIDbmotjui98/zfaszk/WjNOQs6lP8IYXWktzl1RdHortTLvRe0HrDJb0YNw2NzJimpKFsFo6o+Yob17zM7LG87PitqhH/XBz40Jrx8Qi5J46jiEvyc9VDPUPGq0y5CmO3+aIIjByM4TeH4wxE1mw3bHGXbuCQIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/6V9brGLv+L902Oc5iArTSLIQFovT1+o6xN+dlJHww=;
 b=goxbVRgB3jtCBOQuJKsvZ46q7FEksyvGWGlXuMz/r1ddr2TFB5LX1LZIgGCKC8e1G9tW1AanNqaI3uiqlXGpy0qiiveVIOi0rBxhwuVhhg7DkEu+N+6mMAc/jdkPICEDxi3z6VtRkr91J+oONEsSQm4OjSXdPxP4Di4X8ZqoJtEPkgEKmVFiik+jENY9Jdf2mbbcjMVurjc2NA5nBIOFGHrkrckyy2C2SzdKGHMCF9tHr6pwcJqdStKHHYo366MgCJznPdYa+YALZonu79Z2KD3TMUmrdwrI2IBbzZ6ElhCAb2IOS3tqp4cFF154awJ3wyJ4oPNLhQjVeTXQvF0mkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=actia.se smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/6V9brGLv+L902Oc5iArTSLIQFovT1+o6xN+dlJHww=;
 b=XrBHChhvZBFO/EAhA5LndZ6plSgJzhPpDP/W5NKItXV1WiiiPKsqD4ACcOcXO1HHBH1IrJeK72MHJ6/tomLdxSmoQoHGXQ/fCzMDqGXDqEkZuBk45C+uZnKRR9g9QCajdKiPKLxZM4Yc3C86szlFvCGmSLJ2SHXtTNDjlMNV8MI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d02b7de4-41bf-4bf9-8b04-e21625449f27@amd.com>
Date: Tue, 9 Apr 2024 08:47:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] xen/arm: Add imx8q{m,x} platform glue
To: John Ernberg <john.ernberg@actia.se>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Peng Fan
	<peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>
References: <20240408161129.900347-1-john.ernberg@actia.se>
 <20240408161129.900347-2-john.ernberg@actia.se>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240408161129.900347-2-john.ernberg@actia.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|DM4PR12MB7765:EE_
X-MS-Office365-Filtering-Correlation-Id: 7114682e-86cb-416c-54d1-08dc5860dde4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z9yzBLsTyhTJkqQD52Bv5D61Fu+RKZlfDqAbCFULMC0Bfn61CLgQ4Eti0gI+xKkvR5hqZn8lIAVBi3ceIr+GknazeKGtmtaqoM0Gp0df+zyC15ve5gYxVAXbaBXnH7n7rxHP+iIEpKiPgAoAfbjz0dH94gp9bFVZeSn8aztCmhup30VxrZrmydwTEfss2W9CO4HsN64YnvWmScghV5pbwogWzxQFgUKAuQzNiM2znY8G6hEDtLMxIXIPmCPtoFtweDT61TGuKiiFLuDgBrbw+hVDgY4iCWg0R1jdtSgaOf9ePxXhv7n523IgZtfr4SlewP0Xji9HZA4NTCEerfwqLJvzpnksTUA221oY7z+0iOSeOBMjzRW3xn+SoJvcvzTWb/FTwqNlRFvDN9FAe8Z+pQ6Pe4QLnuxxIB+HOxuZjrUwh58zI9glqoFeHnZv2YnZMlDkR6AWW71KY2xLKtEGAMUrsazLs4GEPA6+fUW5hVfk0TmhjV2bAbuG/FFoiDJiT2YCP8ZmMoUkWCetBocgh9nKHBxdMdPFuqwcgo4u8lV24Srf9PnHK7uZfMN5wMuQjn2yWCGH09DoB/RyjHaomzlLBRCB8ZF3e9auPWJfEqOXsZEAUKQlG7ZWdfdwpSOTEtYEeqj4Z+T/byIq6Td8IQ7MlTkCG3ESoF3I3Pqz+p0yqhLkIo+gePRYOAWj+texjm4JChJrQJL+OoDChgSl9s5f9SSQ/ApTGRtYrC/cBVf1PtwBwXw6gG5BCELRHP3J
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(7416005)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 06:47:04.0882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7114682e-86cb-416c-54d1-08dc5860dde4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7765

Hi John,

On 08/04/2024 18:11, John Ernberg wrote:
> 
> 
> When using Linux for dom0 there are a bunch of drivers that need to do SMC
> SIP calls into the firmware to enable certain hardware bits like the
> watchdog.
> 
> Provide a basic platform glue that implements the needed SMC forwarding.
> 
> The format of these calls are as follows:
>  - reg 0: function ID
>  - reg 1: subfunction ID (when there's a subfunction)
>  remaining regs: args
> 
> For now we only allow Dom0 to make these calls as they are all managing
> hardware. There is no specification for these SIP calls, the IDs and names
> have been extracted from the upstream linux kernel and the vendor kernel.
> 
> Most of the SIP calls are only available for the iMX8M series of SoCs, so
> they are easy to reject and they need to be revisited when iMX8M series
> support is added.
Stale paragraph. Should be removed given that the driver targets only Q{M,XP}.

> 
> From the other calls we can reject CPUFREQ because Dom0 cannot make an
> informed decision regarding CPU frequency scaling, WAKEUP_SRC is to wake
> up from suspend, which Xen doesn't support at this time.
> 
> This leaves the TIME SIP, OTP SIPs, BUILDINFO SIP and TEMP ALARM SIP, which
> for now are allowed to Dom0.
BUILDINFO, TEMP ALARM are leftovers from previous revision.

> 
> NOTE: This code is based on code found in NXP Xen tree located here:
> https://github.com/nxp-imx/imx-xen/blob/lf-5.10.y_4.13/xen/arch/arm/platforms/imx8qm.c
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> [jernberg: Add SIP call filtering]
> Signed-off-by: John Ernberg <john.ernberg@actia.se>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

The commit msg can be fixed on commit.

~Michal

