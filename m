Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441C98760A9
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 10:06:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690164.1075947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riWBI-0005ER-TV; Fri, 08 Mar 2024 09:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690164.1075947; Fri, 08 Mar 2024 09:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riWBI-0005Bx-Qv; Fri, 08 Mar 2024 09:06:20 +0000
Received: by outflank-mailman (input) for mailman id 690164;
 Fri, 08 Mar 2024 09:06:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfa=KO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1riWBH-0005Br-Mq
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 09:06:19 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fe36de4-dd2b-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 10:06:18 +0100 (CET)
Received: from DM5PR07CA0093.namprd07.prod.outlook.com (2603:10b6:4:ae::22) by
 SJ2PR12MB7823.namprd12.prod.outlook.com (2603:10b6:a03:4c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Fri, 8 Mar
 2024 09:06:15 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::6d) by DM5PR07CA0093.outlook.office365.com
 (2603:10b6:4:ae::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.29 via Frontend
 Transport; Fri, 8 Mar 2024 09:06:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Fri, 8 Mar 2024 09:06:13 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 8 Mar
 2024 03:06:13 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 8 Mar
 2024 01:06:12 -0800
Received: from [10.65.148.173] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 8 Mar 2024 03:06:08 -0600
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
X-Inumbo-ID: 1fe36de4-dd2b-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRbmHyY/UMvfD830aBYngbjFodrxaDZ0Fus5xrxE8lxW+/av+s4hk8VtPJx1fboywYMxqQZkYHA0Pp+TtheirSv/ZLJ/cIXhBY+sMaEZ16JZvk0ThxAtnEMCV6dWg7SiOCjKsVb9+igV2SAM3X8jMsjHAfsa9ocqC13e+G8IwjDirf8FtK9gItD+yj8yLSVp2Up8PMdbmswFZW7AkK//TSQcb7RUVjHa1qwacvEaaOsP4k4AKFXrDvxkA8uQBF9eu4obCu1gvl3/LpDT6n/5y/z5h0/vPU9ydWRIpCWdDd6GG7PfihRI9m6czkgHXxq/lMFrWqqxwEnAAvn+oUPmtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCIa36OT7Ie20s1OkNd4ALvetqu5pbW3dNmXe+yj5Jw=;
 b=BJWqSoqOMO3hOxB8BJDM+azkMKqa+XXmYKKTNmiegEtLKT4gZogbi6AFivRXTvr9cEbspnQ2C8lwj150w1NhL3TLZLPOSO4MvPOGWRLS525It5dSiiLReCjsp/dYVq6lfV4obfj0d9AF8e0ccdPqBFWNTyv9RDFsAK1Ta1y0DCy3hw4He8hU9XInHgpckRsLwWqbCkaCJnn+eVpez9Jkh5POaZtUIvzZNaU2D+DRccxe9RjdPIC742jY7Z8geQS6CuPIe5j4tlFSMAtf8Dp9QEwtmmhJpm15lCR4r+GQeixsPqVKFF4veBtPuASHlvS2O1MWW6p9+o0lJzve7fUI5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCIa36OT7Ie20s1OkNd4ALvetqu5pbW3dNmXe+yj5Jw=;
 b=yMi7STFY7RlzUhPw8RYGL2CGjCfz0c6HU3pbxU4wu8KJi+Z/ORfz3WC22FAArGCUHj9vVexEeiKVOWzC0Df1AXWEZWbjd/4r0Wnkoh9opXN21A7R4IDikbpFmbBaWShAwZfaHxLhLK0eKJ8ffoz7mzgopW0SYiBbKb5XrXP8Tzc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4cd6aec3-aa5e-47fd-9d33-c03848e3f563@amd.com>
Date: Fri, 8 Mar 2024 17:06:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] xen/domain.h: Centrialize
 is_domain_direct_mapped()
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-3-xin.wang2@amd.com>
 <9b55829a-3248-4bd4-b36b-a709debf46f3@amd.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <9b55829a-3248-4bd4-b36b-a709debf46f3@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|SJ2PR12MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aa53bbe-2618-4ecc-afc0-08dc3f4f0173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t9SnWTCZdKkTV5Y8rdQ1R3N2cNawRUnJsZxCg3RtJXnplUAL43zPgogurPU2MfObugG8SMLBj5r7ZNEncbILGxqv1WfQj2Rk8k8zlai+RkYi64t34f8EYkf7vzmp45VP6kyFHNJlczXj7doVGbXLKy6mgzp6fqzaav5k8I/6zqlclSILTbBn+eik1rW32fLaecI6jzsI2/2krCsAz58Ub+3Wk1OxjAfHVYFNlgH6pdH2mCTC0nZAiVwwpsQeAk1zMd4QwwKysktHRhvB4u3tt7QVoRzHKFK6pm/Qu4mE4BmyXnLHdpHEeKkKDvSaqtWOIuO+qQX1g73DLK5eMQfgOYhvZKYVnehzq2vo3KY9K3kWfJfnav9BwNDjTz6vAX4ulMB3eMX7gSPtsz+/Y0Tqgbw8Ti7sSy0ye0WpfTydxSpvat1D4lj4JijVDV2XO8r6H90MYtJEXCdBmzaI6N7xKeP7cDBPAoPlTwiEGxJskxPOVk4JMziWWFGp++4m15sQN59WUnLo1b3/VDIOmZhy/+cDSWBWlDHGxZekqCWDWF1NeiCxiDDXGBUhfmpZq2tre0FlrzSDLmjiuUpZ7Zx0AnaMcj1tM+tXZgyAfeyakZ/Upkh/Suf7p2rRzHsBI5/n2g57fifibGLBd8IFQmNKR6MYXl6Utkc5qB4EoAz2A+8wfscYCIZhl/Tap9qzxKGkBWpR+UxFbX1YW2oI4T9+kRgfeNraayisp5d5REh1MMxX3xXmo5gLFk0zPEcJpzw9
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 09:06:13.7999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa53bbe-2618-4ecc-afc0-08dc3f4f0173
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7823

Hi Michal,

On 3/8/2024 4:59 PM, Michal Orzel wrote:
> Hi Henry,
>
> On 08/03/2024 02:54, Henry Wang wrote:
>> Currently direct mapped domain is only supported by the Arm
>> architecture at the domain creation time by setting the CDF_directmap
>> flag. There is not a need for every non-Arm architecture, i.e. x86,
>> RISC-V and PPC, to define a stub is_domain_direct_mapped() in arch
>> header.
>>
>> Move is_domain_direct_mapped() to a centralized place at xen/domain.h
>> and evaluate CDF_directmap for non-Arm architecture to 0.
>>
>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> Shouldn't you add Suggested-by: Jan?

Yeah indeed I should have added it. I always have a hard time to 
determine if I should add "Suggested-by"/"Reported-by" tags, sorry for 
missing it this time.

I will add it in the next version.

> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks!

> Another alternative would be to let the arch header define it if needed and use a centralized stub in xen/domain.h:
>
> #ifndef is_domain_direct_mapped
> #define is_domain_direct_mapped(d) ((void)(d), 0)
> #endif
>
> I'm not sure which solution is better.

Thanks for the suggestion. I am fine with either way, so let's see what 
the others would say and I will do the update of this patch accordingly.

Kind regards,
Henry

> ~Michal


