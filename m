Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A650C76C57C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 08:45:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574713.900241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR5bn-0006ap-QS; Wed, 02 Aug 2023 06:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574713.900241; Wed, 02 Aug 2023 06:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR5bn-0006Yg-N8; Wed, 02 Aug 2023 06:45:23 +0000
Received: by outflank-mailman (input) for mailman id 574713;
 Wed, 02 Aug 2023 06:45:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXK3=DT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qR5bm-0006Ya-JK
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 06:45:22 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20630.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25ae4399-3100-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 08:45:19 +0200 (CEST)
Received: from CY5PR14CA0011.namprd14.prod.outlook.com (2603:10b6:930:2::20)
 by CY8PR12MB8267.namprd12.prod.outlook.com (2603:10b6:930:7c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 06:45:16 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:930:2:cafe::c9) by CY5PR14CA0011.outlook.office365.com
 (2603:10b6:930:2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44 via Frontend
 Transport; Wed, 2 Aug 2023 06:45:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.79) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.24 via Frontend Transport; Wed, 2 Aug 2023 06:45:16 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 2 Aug
 2023 01:45:16 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 1 Aug
 2023 23:45:15 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 2 Aug 2023 01:45:14 -0500
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
X-Inumbo-ID: 25ae4399-3100-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DaYqJA3aOBpO647RufGyZbp1dCMaGMOg/2Ovh07jw5pYqtPEPh98tnrIJ3YQPXUCvtbn+xWs+14JvIIp9AGTo0TaNbzPexj89NcYJNZ1M07DUOy0W79PzR8ed4UU3HSrpqW9Z6/XW4bKG5yRz8H88ecu5GlZFZclUMrz+JhKFGB0RdvtxV0OuRAeB7gVwfjBnkZN6FsC/1amaGy/SknsjEuL86Hwb51PcinYhKKgCqmpbytGvpYPUctUEfd11vOs66KscjX5OIXVc6ROC3HmKqOKAegcL7ufvirt5Zzd7/TuFMEaKPdHlEYT19rmzqfxmHscicIqvRL0n1dmmj5iCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8182KY+n3aHnqyfWZHGhA1CwEz6eV9ppeOvRRMd53U=;
 b=bQuxqHWbtWpgUImvOgV/gQhPVEXuqAeX/hmQoxygsmOi3R0HBzw5z7vu9+IQGaMMJ7CBvUgBhRh9K0d7a0dN2d+2UxhIEuevF/CMKpQsrVrRjVD5dqfKOwFnW+YPaxVS86aICHn/5EMHp/iK73PrTOzfoba/OXviADGyCgrdrA/VixYJiyk1ccfE4ZxDmqF/XEx9O6yflTBrGxTcSb/srCqpfkUf3F7nhVD1U3mDWV3aroz9l3diYaGr/kiB/ApSaa0axfVicVsrADDsF3s18G7V1UfeA+VURovKqCraZJdsVK8SgEjUtcyCKHreQdi6rH/tHbRefv5G4WeY/3Yp1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8182KY+n3aHnqyfWZHGhA1CwEz6eV9ppeOvRRMd53U=;
 b=4OlZD8oNF07VJ+3f95HYqNLoMKj14FIuFYx+caasRjPMPR1BF0yEyrxy8CdUTXERhZ9uwmJfxrVYni7EHBgE2BPvGbB/eZHHdOD0LuecU6nywk4xz4dhgSz1STom/xcWrbOfHGXudMtOoQOa4m6POkaQN2cwotkgazGUNRQmi0k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <321cb38e-7622-5e3c-cec7-77321ac9a4c3@amd.com>
Date: Wed, 2 Aug 2023 08:45:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] arm32: Avoid using solaris syntax for .section
 directive
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>
References: <20230801174930.2995947-1-raj.khem@gmail.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230801174930.2995947-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|CY8PR12MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d2ac82-917e-4115-ba7b-08db9324082b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5dydmuWGIlKOItuFdFJBqEJax/5DuUCPCXVEn33kkLUfls5SBPQFFTzHeDRF89gA8Z2QoUI7zVDhCzwHOlVCSYmO/xgzt+H5/kyXuITkMS0hxvwLblGgufYLvsZ6uqCxH6Y03WqMzCl/i5UAgN2vuD9SvIwaAgCpn84MR0X0t8JM/d8hWeAmoReQRWVX0eYKQw0tNM0BGl8WZiRGK6ZhwJXnp4g5z2XAqKZIQfLf4QmIXuOBahdgDvKnIOk4Xli+cIug+/cTlYoEKpN9/udcybPxVfuoIa72Y8SAFZY6I+9E7xdH04k0b4/GKjdWryjCY2FWUuayllYMt2kuu+8BnSbiCL6Sivs8iGGKi487yvj4pblFp77jvST9oKuxnC6gz2UIS/FAgKQK/Mv5dkBvdj3oXuqIp6gGp7vLy2y5kFLXtr/CrvaMLmv4HohUDqu+G37lm50LkZ3BK65bux7LeBtpZcqOHf/yVqHCpVPW8WBLXizMHYI6Cx7dZBjmdmKGYHJv/eXyN3/Vi944TQhjvU8QboSLibxrk6GXuP/6yIzryf8sjoMv/0U8JI7FwwF/P5vrTEh6PmVRIPT+EWl3UnQlS8p7GgVC77aB8Lj2OI6OhYUJJKbxNcQ/nAuxUmFlHXqjlbaSA1hh2xMMVwp65mbIl6jPkyVBayNSxBLvbi9TrhZAJKkMoEiZNVs8PITILLrrYdcQioY79sR6kN0MO0pN9ZQmMEG/j2rN/OQRlyHOiv4u0l3Gp/lZIXaA6eWri1ru56SS2l49vW93o3MUe/yDLE8r3IID3ZyERy83AYeSqmrs71WLXjTtk46f4uDj6MNkTrnI9eC3auB59M9a3fAu9PJfwj2pqlBRtpeTggA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(82310400008)(451199021)(36840700001)(40470700004)(46966006)(70206006)(70586007)(86362001)(31696002)(966005)(2906002)(31686004)(4326008)(54906003)(110136005)(44832011)(40480700001)(36756003)(40460700003)(478600001)(83380400001)(82740400003)(426003)(47076005)(41300700001)(2616005)(356005)(81166007)(5660300002)(36860700001)(8676002)(8936002)(26005)(53546011)(316002)(336012)(186003)(16576012)(4744005)(142923001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 06:45:16.6996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d2ac82-917e-4115-ba7b-08db9324082b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8267

Hi,

On 01/08/2023 19:49, Khem Raj wrote:
> 
> 
> Assembler from binutils 2.41 rejects [1] this syntax
> 
> .section "name"[, flags...]
> 
> where flags could be #alloc, #write, #execinstr, #exclude, and #tls [2]
> 
> It is almost like a regression compared to 2.40 or older release,
> It likely went unnoticed so far because Linux kernel changed
> to GNU syntax already in 5.5, to allow building with Clang's
> integrated assembler.
> 
> Switch to using GNU syntax
> 
> .section name[, "flags"[, @type]]
> 
> [1] https://sourceware.org/bugzilla/show_bug.cgi?id=11601
> [2] https://sourceware.org/binutils/docs-2.41/as.html#Section
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
With the changes suggested by Julien:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


