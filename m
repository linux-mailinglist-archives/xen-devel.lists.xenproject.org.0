Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9799489D3B5
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 10:01:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702180.1097054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru6Q7-0002aY-Aw; Tue, 09 Apr 2024 08:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702180.1097054; Tue, 09 Apr 2024 08:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru6Q7-0002YL-88; Tue, 09 Apr 2024 08:01:31 +0000
Received: by outflank-mailman (input) for mailman id 702180;
 Tue, 09 Apr 2024 08:01:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NvYF=LO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ru6Q5-0002Xy-8d
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 08:01:29 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2409::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ddec39e-f647-11ee-9150-f14010f3f246;
 Tue, 09 Apr 2024 10:01:27 +0200 (CEST)
Received: from BN8PR15CA0072.namprd15.prod.outlook.com (2603:10b6:408:80::49)
 by SN7PR12MB7420.namprd12.prod.outlook.com (2603:10b6:806:2a7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Tue, 9 Apr
 2024 08:01:24 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:80:cafe::ca) by BN8PR15CA0072.outlook.office365.com
 (2603:10b6:408:80::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.36 via Frontend
 Transport; Tue, 9 Apr 2024 08:01:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 9 Apr 2024 08:01:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 9 Apr
 2024 03:01:22 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 9 Apr
 2024 03:01:22 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 9 Apr 2024 03:01:20 -0500
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
X-Inumbo-ID: 5ddec39e-f647-11ee-9150-f14010f3f246
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oREajX1Qr8T9ijFxSMEgI16dtDuYfiy2BtkyRwj2t517BCuNiftyAoyacogrvbT4BahSSRqLFk/MXKfrary2mqEpIIwzgybKv7wSgizFSTRJcxqeM3HU41FLjqlnc++f/Q1IPX6woXgyjDCzyezX/AmXmIfWxaYs+TDCxwR49yORfhHkbct9CQgbSFxV222FFfqwW/kelvJs+gep+iHbxGnF/TI//3OwdlDuN3myGqQFilld8kAUMNHRMAC8AdvzPnrBTzydvB11dXEJ7TCcymx6zPdXAHq9m1yYjojktDVHc9YgoYnvQbxVUhXOQLnT9KQLMxOiefG7VeZi7vEnOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAz1LGrm6t5c6MPdKc7N6v6w4mxqmGreCpwekeCY7MA=;
 b=f0AjEwrDwJXGoXFSHfpXMflEyABsFuG6JME0KybVpBuvo9TT7Ct8NhgsyfefUKSy15wkaDykX7bSq2cZ9SXeVS41YKeN43/RJsl74g1x8UauHG34xl3lCl8eLpUZbMvhONjchKod8lZZZC4BOaCgPpjjvVX2GVLpPoqLcWx1eIEYiYfd8vgqRm03YOH1hKINzBQ6/WCFgnLprmGzq5o/bNDIl/JYpslesfaMnNHK/3Lrog6Hcvyp8JWv9s6+YbsXcZJmTi9CwRqeHLRZHnyo2KaszRGEOXcgVfMCbIgfa+brJ73GdoggcMr63vTigTFOuEHvCHQbffzHmsHynoxTRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=raptorengineering.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAz1LGrm6t5c6MPdKc7N6v6w4mxqmGreCpwekeCY7MA=;
 b=nmnuncmDTuqepXUyZyRB1cjKt89CV7oV+zhxD9rOWGjSPLELzo6yA6CMn+xmOOmXqkXd3YyWOIMhSp/v0AWnYoWhiScY6Fm92B1We9CDPMi1PUYXVz4iCF3vru/cu4OEWAXCdFr9Bk3yAYV44gCyj8zlpWlES5qyMDAj//pPh3o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e20ac3f1-0f86-41e3-891c-b3ea97b702ec@amd.com>
Date: Tue, 9 Apr 2024 10:01:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/acpi: Allow xen/acpi.h to be included on non-ACPI
 archs
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
	<xen-devel@lists.xenproject.org>
CC: <tpearson@raptorengineering.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Juergen Gross
	<jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20240405182031.396528-1-sanastasio@raptorengineering.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240405182031.396528-1-sanastasio@raptorengineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|SN7PR12MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b3a39e-1c1b-45f8-c65e-08dc586b3fa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d5xv+ITLPiK3VS28frFqzRE5KU1AFgw9ZPYO8f3snsrFi5TlupdaiRSwU3CoSKfnl4RqLQwiyoh9QWBgjSf1sCbrHQ1XydjRhqtzUgm+/A1Rva4pxROnYL4LGQpxorJNhkHvEM06AHk/O384JNCnSvh5adwYgv7gg4msFdZZrHlxsGypBip4WEmwvyYOrOL7bVCuU52JlUoZ16pwrSsTMjASHIuk7kKGlIBwpGeeO9ZcGlQ2h/FjIFYKRmB1eqNRY67cS2BnC6LIJM3SZIFismvUAV6QDCJEwrWJ/igwweeAXQvnLzdPYW3937nLQDtElb/PUIXHK3RA7XHAnHVqbYAjYGuvDfcRfHq0qO1QrQvpmg8g0eQkAlMHhrix81kCaD1mlFo0kBBjv1PhQOifTKr7p5COcgWKJRYIM0aYhDNrzOX8VzcbKYHjWrbtCXFFwOwIPyqM5TBushcNqV7VrmhzCAoaw+hKXSb2Gvf/Bxh84D/ueeCStyssLaJgROiJPvGedpe6T8m8hsCt6qxL35sm396WomIZKfiAFg5XU5GNPEx1m/SSJVadyzzvH7VpWSRjt4HarFRRlPMKDNXXuYTXDH3P5cALSLAyt57i7PyHewZiBXKXJCbfcxhU839weWoIX5675ICStNaPg/xfN8kwyGMILWudOA0PlVAZs9sjAJbmHA3HA24pbJ+TBdUf3TmZh5MxFX0+teUs0zpxM+kYmrCzgdGnAFJ+GqkK0VOcf+pYIeUb76NX5mXazrXC
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(1800799015)(7416005)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 08:01:23.2160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b3a39e-1c1b-45f8-c65e-08dc586b3fa7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7420

Hi Shawn,

On 05/04/2024 20:20, Shawn Anastasio wrote:
> 
> 
> Conditionalize xen/acpi.h's inclusion of acpi/acpi.h and asm/acpi.h on
> CONFIG_ACPI and import ARM's !CONFIG_ACPI stub for acpi_disabled() so
> that the header can be included on architectures without ACPI support,
> like ppc.
> 
> This change revealed some missing #includes across the ARM tree, so fix
> those as well.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

