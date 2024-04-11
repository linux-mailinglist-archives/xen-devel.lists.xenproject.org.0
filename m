Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1838A1576
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 15:25:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703936.1099946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruuQ8-0002fc-E1; Thu, 11 Apr 2024 13:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703936.1099946; Thu, 11 Apr 2024 13:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruuQ8-0002de-BP; Thu, 11 Apr 2024 13:24:52 +0000
Received: by outflank-mailman (input) for mailman id 703936;
 Thu, 11 Apr 2024 13:24:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JjjB=LQ=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1ruuQ7-0002dQ-AQ
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 13:24:51 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2408::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df29061b-f806-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 15:24:49 +0200 (CEST)
Received: from MN2PR20CA0031.namprd20.prod.outlook.com (2603:10b6:208:e8::44)
 by BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Thu, 11 Apr
 2024 13:24:45 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:e8:cafe::1c) by MN2PR20CA0031.outlook.office365.com
 (2603:10b6:208:e8::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.35 via Frontend
 Transport; Thu, 11 Apr 2024 13:24:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 11 Apr 2024 13:24:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 11 Apr
 2024 08:24:45 -0500
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 11 Apr 2024 08:24:42 -0500
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
X-Inumbo-ID: df29061b-f806-11ee-b908-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxJIY3K4xNV0Q3U81C+14ernD/Y2OpLDVmRIM3G8SUp3K2/BOrvAbgJZx126KioqQR3xgtUHBPISxzplheiW/Od+3yAMT6g63s3OqHRtfU1ngCdxfUvg3T+unmfpH7YdILmNSOjlpJMxluU7laJr/8WHffoJ/3JDJt9CDAFSsask0V6XCBfKb7WdjPOmBsRjv6lrw29XOvusrXTMTQMfE0sHL8rr+o4/KBWHzh+8EAO9sglh9v1mv0ArgXCqrzfZKdPK+Ux+GAYToz+lc4GBVDS4qXCkDBFGN8pyyc8aGpvtvjXkZEfgs6AfsNF7bALoy40CItzkhCieZn1wT5EVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oe/YMjvQ6OizNvAhPx/8hv5SIrFUnv/3b1wpfD2O0Ww=;
 b=E35zGzM8NZm7NFwFnw6f/fJxTTDjJmnn8jTb1cBB9iJgj74s/mksFrT2j7USbmN2vA1fqp0AkCYjs9vxs4EsSo9NmmJJFA7k8/1lbKLudkQ+lglItTGUVb0OUNXBJNp5YWpcml7JxL1/psExzL44ljIW9TQKCDJSXgUYL0sdtOl/20yZV2TRddpN3283iqDKY3yizF2Xe+l68IIbmfeOBoAJfLWnI1+0D8++UUDbRH/qFZF+OaHIPsfuC5R408QRYAmIyXocmurN7CfsqCIoH+SbZR2yUDPEsvkbGJm4svU+XXc2fCGNf1Ncx+134y0ixhrAT9LCl3CxGEgi8+IROA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oe/YMjvQ6OizNvAhPx/8hv5SIrFUnv/3b1wpfD2O0Ww=;
 b=21zAGq1n2J1ypSiODNYa/inefiXgTDPQopF8+gplueqKWTNhSPl3laGu2INKi3vyT8RJex35b/fx+t0RUHa3ixEZo/Aeyf4jqPNj6iBg9sc4tGR22803FpA2Y6hebDPCTkf4LRK8aJRG6onSxVrGgCXxDniG4tC3Y4H52jF8b2g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <7a694885-5934-4ecd-9e48-25077b336c36@amd.com>
Date: Thu, 11 Apr 2024 21:24:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/acpi: Allow xen/acpi.h to be included on non-ACPI
 archs
To: Andrew Cooper <andrew.cooper3@citrix.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, <xen-devel@lists.xenproject.org>
CC: <tpearson@raptorengineering.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Juergen Gross
	<jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20240405182031.396528-1-sanastasio@raptorengineering.com>
 <0d31894c-2541-4187-94f2-0ca88bace67c@citrix.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <0d31894c-2541-4187-94f2-0ca88bace67c@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|BY5PR12MB4258:EE_
X-MS-Office365-Filtering-Correlation-Id: ea903b69-7435-483f-ae50-08dc5a2ac10e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+d44WONNxittaEOW/g8wm9JsywpvojMhylswkjgoKCRDQyYMlnsB4nig3GaWhslSb1xYvhxmAbcsSKjLgbdLa7VEaxsmko0CL+UNp4co4reML3M6CSXgIcpPsUknaZciCebEuqdpbbuCOmCcaE1nKG5ATv4H0WC+Ugy2UFiOLVUlq+Ij3Js+pRgf8zh5WJaT1ZV7zk+tNhQL3Upy7T7MD31nhaJfcQvL0InEuLMGePWox6BA9D5IFRV0FwlNkpm21b99inC8S3R2rsq8TJglLvp64L7tPeTdFcm03084zSnHKEfJpG2XC6DWH+61d4eC7yDg0xiQ041fOai60qj05GuSEzzyfHset8eR423FJ7SEmV/xgiLmPqmsEWHsL+Zm+ZAne9XF5HBxsVyKtTCX4FYED+QbqApL3NvS69z62oPX4Dh09GYD4YewC9OioaF3hwZMuVeOV32iGJmNofIHAO0HRmSl7TQriHyJM7lc0B23WxC1ZmcjH8FKLFkEAHy4o+06UUIPyPAgOkz+nM2ShdueK0wymjqdAQ1ZWGZApi0rx9LhQYvUYHX4hvwh0nY0ZFWKC0W9vcshbHd8IJt8zqdpNj+woYxmaT1zKMg5bjYpLU2WwjKKhngb1Of4vDcP1Lx4NlDyVjOJEXxtM4zOWdsW46JchGnmlsUBDva9gEvNcZxJgEfb6LL/Q3Nu6mYLdd0sVXKKmww1jiRbQYg0fBei5ICbVDMZabIwzUkdQf6UzTbZOAla25ibBsRY1s9y
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(82310400014)(7416005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 13:24:45.3390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea903b69-7435-483f-ae50-08dc5a2ac10e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4258

Hi Andrew,

On 4/11/2024 9:15 PM, Andrew Cooper wrote:
> On 05/04/2024 7:20 pm, Shawn Anastasio wrote:
>> Conditionalize xen/acpi.h's inclusion of acpi/acpi.h and asm/acpi.h on
>> CONFIG_ACPI and import ARM's !CONFIG_ACPI stub for acpi_disabled() so
>> that the header can be included on architectures without ACPI support,
>> like ppc.
>>
>> This change revealed some missing #includes across the ARM tree, so fix
>> those as well.
>>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> ---
>>   xen/arch/arm/arm32/mmu/mm.c     | 1 +
>>   xen/arch/arm/arm64/smpboot.c    | 3 ++-
>>   xen/arch/arm/domain_build.c     | 1 -
>>   xen/arch/arm/gic-v2.c           | 1 -
>>   xen/arch/arm/gic-v3.c           | 2 --
>>   xen/arch/arm/include/asm/acpi.h | 1 -
>>   xen/arch/arm/mmu/setup.c        | 1 +
>>   xen/arch/arm/psci.c             | 1 +
>>   xen/arch/arm/smpboot.c          | 1 +
>>   xen/arch/arm/traps.c            | 3 ++-
>>   xen/common/sched/boot-cpupool.c | 2 +-
>>   xen/include/xen/acpi.h          | 8 ++++++--
>>   12 files changed, 15 insertions(+), 10 deletions(-)
>
> Pre-push testing found a randconfig error caused by this:
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/6602857882
>
> Henry diagnosed this as "arm asm/acpi.h includes the arm asm/setup.h
> then asm/p2m.h then finally asm/current.h".
>
> pt.c uses smp_processor_id() explicitly, so should include
> asm/current.h.  I've folded the following delta in to fix the issue,

I tried to build with below diff locally and confirm below diff will fix 
the build error reported by the randconfig job of gitlab-ci.

Kind regards,
Henry

> diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
> index a7755728aeda..da28d669e796 100644
> --- a/xen/arch/arm/mmu/pt.c
> +++ b/xen/arch/arm/mmu/pt.c
> @@ -11,6 +11,7 @@
>   #include <xen/sizes.h>
>   #include <xen/vmap.h>
>   
> +#include <asm/current.h>
>   #include <asm/fixmap.h>
>   
>   #ifdef NDEBUG
>
>
> But I suspect this may not be the only instance.
>
> ~Andrew
>


