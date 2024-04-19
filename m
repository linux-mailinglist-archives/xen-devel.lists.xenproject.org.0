Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D73A8AA6A0
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 03:47:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708614.1107630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxdKR-0000Ji-Vu; Fri, 19 Apr 2024 01:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708614.1107630; Fri, 19 Apr 2024 01:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxdKR-0000IA-SM; Fri, 19 Apr 2024 01:46:15 +0000
Received: by outflank-mailman (input) for mailman id 708614;
 Fri, 19 Apr 2024 01:46:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=52U1=LY=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rxdKQ-0000I3-FH
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 01:46:14 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2408::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9661c941-fdee-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 03:46:07 +0200 (CEST)
Received: from BYAPR05CA0087.namprd05.prod.outlook.com (2603:10b6:a03:e0::28)
 by CY8PR12MB7314.namprd12.prod.outlook.com (2603:10b6:930:52::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.41; Fri, 19 Apr
 2024 01:46:03 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a03:e0:cafe::1b) by BYAPR05CA0087.outlook.office365.com
 (2603:10b6:a03:e0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.11 via Frontend
 Transport; Fri, 19 Apr 2024 01:46:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 19 Apr 2024 01:46:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 20:46:02 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 18 Apr 2024 20:45:59 -0500
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
X-Inumbo-ID: 9661c941-fdee-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lD0tAXObu3h03zbTVWjw9zvykwUi/nyimlVaZDVwTxwut0PLjGWIBzLexv1jJ/4Aifm0lqfUFx/ByOtp+htEgoTZbHT/dmvFIg/WcVqMSTmiX/UYuDsccthmaGH78jxNQrRonaDI5XBAppZKbMyxOFcBaM+SSnyBhOJK1a5p07c+Qyohiq9teSOlrizi9+yhyysoRKI+8h9g/+31kZPhkpiPPaRvKlGAVhlLgDOPt/xFWoii2KkPL4uj2ye1zVr87uSAPcxCj9SFC9rTwZLAZTYUrmgJ98BMyQeiWi1c+bgnicOnVHpXe12JC23Mmbw3kgkUV7VLhfSeEPMrhtiJtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oo8USQeSLxengWlGMk0sPhLjL3ovSB4zRhIdGMoYv7Q=;
 b=ARze5Es99Nwg4GoFXCnTeHrsMsshWMQ5656IsLe5Hbp3RlqSurnaaFv4QRDqD6UNtVpo5/U3atBYTbuvKVKpVCNUdzlACxWQZWe4ciVFfHHKi9zTXk/M9vZXJ7Z3+WBZO64ka9w4Xmh45EEDna2bub6Kc0DZq4kM+XqysBj6cgn12e0my/eniSc1KFNLsatJLqPdYDfUvI3gzsv/S7M+AFyDxfs2/NR19RLwI7Ui+Ev3CcuCW3LqPCMFor/0HOOLtkbXG1H8N8CqFKWwSKpjwt8di/IPo7qxeTSx9BENluIszZ78LtqqqZNuAE+QXE6CrH0OLMM12x6mxIrnFz3OiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oo8USQeSLxengWlGMk0sPhLjL3ovSB4zRhIdGMoYv7Q=;
 b=Ixiy3HiNOM1NRo6MMSPzQnP1aYeeZxebcIk9XdDzk7ZJZWvAbrGjWNikNIWX3y4oBEKz5c6yh1C23/NqAvRrfR/DlG5/mJBnLoK9JMkx6LAHo7T7YAnOoZKSOnyNh6ALo8ZddMPPoyujEDi9NEVG8mu0d4xtXeIDGcICB1dqVXQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d879969f-8883-416f-bf9e-a358f53c593e@amd.com>
Date: Fri, 19 Apr 2024 09:45:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] DOMCTL-based guest magic region allocation for 11
 domUs
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240409045357.236802-1-xin.wang2@amd.com>
 <c7857223-eab8-409a-b618-6ec70f6165aa@apertussolutions.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <c7857223-eab8-409a-b618-6ec70f6165aa@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|CY8PR12MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: 825f10a7-6e41-43bd-a7c4-08dc601278a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iI9lXjvT+/z8U5nIXmP9S1NqSk+93S4K03PAC18/R5xKCXwcKbVwJJhFSOvZh2QyLBybV+6Bol32eF2zDnVabYt511R/FynmHEKuW1QsjTIaJRkwq3a5afVeXQ/HwH9ehlcovzmRSGHqg5EpAe4HuPqvEL59n7OYh99xY2t/8+dh++vbLQ1h1vS9QgUf5U624+JoKCetxeYwM3psuRI9NhDUXXZQEFPeN5OefXUtMsC+0LmBaHhBkHvABXUkcOfMBwrGM9JeZRBqN/QitBisBx70UqPrcAS2uPozBPnHf16Sxi/PDyAvRhFCKHrGUj5PdsID3dA3L2eTv/3N97JBB2tolKgERha21Uod9oG8Sm2ur4fCVLUD2jc6p7lWb+zXFgHRzMWw+hHQvTxkslILAT6sr+QdlmC/c7U/kg56nEdU0OEvOT0dcWXE0X5k2C6jkNaoIWulGCp/Qe7XkKmNbmMGmRWqovSrYj04B4KcDamTwx0LQwHUft8v1Zm60r6IhuN+Bt5VFi8+//6lGjfvrkCkePqrfRYBFEMZoqnoITIvcmAibRcFV1YihG7Cnxmy5QqLzGwiryUNuQfnGS2ZghnJ6jx7h+OQKjbEok9y2Op2aeuTN1mmXV7kKBzXOs29dTfckVPUmgjVgxeNk2nGoxxjv6UgxjlA9+bzA4vmnes5e5Ybl4WKbKBEZA7aLHW3Ay6XI9jM4lJXswcbGbP/+ezn7E2zt2mAinKXmsZ9doVY8r8p1T8k0bBvZiBn8CTi
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 01:46:02.7834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 825f10a7-6e41-43bd-a7c4-08dc601278a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7314

Hi Daniel,

On 4/18/2024 10:16 PM, Daniel P. Smith wrote:
> On 4/9/24 00:53, Henry Wang wrote:
>> An error message can seen from the init-dom0less application on
>> direct-mapped 1:1 domains:
>> ```
>> Allocating magic pages
>> memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
>> Error on alloc magic pages
>> ```
>>
>> This is because populate_physmap() automatically assumes gfn == mfn
>> for direct mapped domains. This cannot be true for the magic pages
>> that are allocated later for 1:1 Dom0less DomUs from the init-dom0less
>> helper application executed in Dom0. For domain using statically
>> allocated memory but not 1:1 direct-mapped, similar error "failed to
>> retrieve a reserved page" can be seen as the reserved memory list
>> is empty at that time.
>>
>> This series tries to fix this issue using a DOMCTL-based approach,
>> because for 1:1 direct-mapped domUs, we need to avoid the RAM regions
>> and inform the toolstack about the region found by hypervisor for
>> mapping the magic pages.
>
> Hey Henry,
>
> To help provide some perspective, these issues are not experienced 
> with hyperlaunch. This is because we understood early on that you 
> cannot move a lightweight version of the toolstack into hypervisor 
> init and not provide a mechanism to communicate what it did to the 
> runtime control plane. We evaluated the possible mechanism, to include 
> introducing a new hypercall op, and ultimately settled on using hypfs. 
> The primary reason is this information is static data that, while 
> informative later, is only necessary for the control plane to 
> understand the state of the system. As a result, hyperlaunch is able 
> to allocate any and all special pages required as part of domain 
> construction and communicate their addresses to the control plane. As 
> for XSM, hypfs is already protected and at this time we do not see any 
> domain builder information needing to be restricted separately from 
> the data already present in hypfs.
>
> I would like to make the suggestion that instead of continuing down 
> this path, perhaps you might consider adopting the hyperlaunch usage 
> of hypfs. Then adjust dom0less domain construction to allocate the 
> special pages at construction time. 

Thank you for the suggestion. I think your proposal makes sense. However 
I am not familiar with the hypfs so may I ask some questions first to 
confirm if I understand your proposal correctly: Do you mean I should 
firstly find, allocate and create mapping for these special pages at the 
dom0less domU's construction time, then store the GPA in hypfs and 
extract the GPA from init-dom0less app later on? Should I use existing 
interfaces such as xenhypfs_{open,cat,ls, etc} or I may probably need to 
add new hypercall ops?

> The original hyperlaunch series includes a patch that provides the 
> helper app for the xenstore announcement. And I can provide you with 
> updated versions if that would be helpful.

Thank you, yes a pointer to the corresponding series and patch would be 
definitely helpful.

Kind regards,
Henry

>
> V/r,
> Daniel P. Smith


