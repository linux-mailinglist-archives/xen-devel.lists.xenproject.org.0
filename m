Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6F0640570
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 12:04:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451831.709637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p13pj-0000N0-6I; Fri, 02 Dec 2022 11:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451831.709637; Fri, 02 Dec 2022 11:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p13pj-0000Kc-3D; Fri, 02 Dec 2022 11:03:55 +0000
Received: by outflank-mailman (input) for mailman id 451831;
 Fri, 02 Dec 2022 11:03:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NC9X=4A=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p13ph-0000JL-C4
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 11:03:53 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00c165fd-7231-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 12:03:52 +0100 (CET)
Received: from BL1PR13CA0296.namprd13.prod.outlook.com (2603:10b6:208:2bc::31)
 by BY5PR12MB4115.namprd12.prod.outlook.com (2603:10b6:a03:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 11:03:48 +0000
Received: from BL02EPF0000EE3D.namprd05.prod.outlook.com
 (2603:10b6:208:2bc:cafe::8d) by BL1PR13CA0296.outlook.office365.com
 (2603:10b6:208:2bc::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5901.8 via Frontend
 Transport; Fri, 2 Dec 2022 11:03:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0000EE3D.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Fri, 2 Dec 2022 11:03:47 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Dec
 2022 05:03:47 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 2 Dec 2022 05:03:45 -0600
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
X-Inumbo-ID: 00c165fd-7231-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/fEQ9IGaTQkY/W0BK9vdLNGAlv44M3Mjh8CDEBHHMR1YwimBfjXefWRvJq73WkgsJKrKu4xsvJDeKGGVpTMoOACQ5rtyKefOBuLyKyBbtyAUoMK+PI3HSUQ9t8BcXV1ChVFIwnHV3mqvqDRjLICJCdab3rs5KG0gxYRW3xmEJ7i3pMAABgvIPdK0BKmUJgG+wLZ88VVXhHDkxb+votyfYwkn0dqKPSlqUQoqGAtRhZTqjGYL9Uog2rS59tIMvOZ8Fai0OehlEGhbxUwCZQoVAB/mAF8IvCvrjtVI4C9AQr8MbbRsbgw7X2H4PK9BmC9JmyE12kuMY1O40juvd2c3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3rwpC60yXd+KjTYseXS+RJ42sWBtno2bESEvm93a5M=;
 b=RAoU8Usk13OG2eixXar6FL5ONPa20pbpzpZDLwxEiiRTPgOZFWvpBKzdGZ5AkYsEyex5X5DmIGPNibmr/fulVHbxCQVwds/J4yiZwPrqiSN3z2F3NBYCVQRWtusm9BkzSuzU6CqbItp9TfsQiYn2S1lcH63FOvksp8NHvPVLKxqylGegr6Bl7KKgqEpNeJ7NWJgT8F4asY5VDFOgQvZVZ9xqAYLm/aENs+9C0xeJpP0gtnEth3NyafG/qL5zm4s2t3O/Kp6sYu/AcNsBkKqTBawEdi/ZikF/aS9ZbRULKr6bSbgsH3D5dgBs6KG5BNHOjG8v5wzwzT2dCS+mpOijAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3rwpC60yXd+KjTYseXS+RJ42sWBtno2bESEvm93a5M=;
 b=UaZrWva575MpEJy0HAgvmafd3s94mgozzfTcsRWClasrGhWfQG6KhmdjHCbDa/Mbv1c2aEGB5T7e535qft0Udj1VHwGSwJY0kddHMTvnGePqfPe6dgH1VTtQv1yjSC/VS7tPonQ6fcGoDkPkiwClirfg7GTrvSR5WTM3uGtouk8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <62c25fce-bcdd-f178-1d0b-6e1a524ce6e0@amd.com>
Date: Fri, 2 Dec 2022 12:03:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v6 1/3] automation: Create Yocto docker images
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Doug Goldstein <cardoe@cardoe.com>
References: <cover.1669904508.git.bertrand.marquis@arm.com>
 <43aa7a440ee7af24c829dc6a70064e2f5fce2302.1669904508.git.bertrand.marquis@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <43aa7a440ee7af24c829dc6a70064e2f5fce2302.1669904508.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3D:EE_|BY5PR12MB4115:EE_
X-MS-Office365-Filtering-Correlation-Id: af663b88-1bdd-4450-2ce6-08dad454e31c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PRg3prX8g3ZfjvrMPFIOyDfyPzK/DizAZeOi0nglaGGwAmlnszhZ/hHSWwYfu+lZ9M6xUbfFbzJ7LF+FlTpzHEi3zl6K9dLl8UQb8Aae/xTq3XgTRwhi3mImICSp0IWkK9SKbx4SM5IloGXH+7aHmBuGDX07J9IZL85siPefluQWW8ZO7LQGguY/RpAcr1XQ688CLDKgioAWgKk8ngUFI6Pckuah1oftcIF1zieQ1K9wHJv6/GEdCORIbzC2xCJttA68papYCP/0u0qSUpCMqbb/tDV/tSHA3dTOfl5gy/mwSAOGNfeVWr7C7l64x2IrWt+fL5U+dVnR8Vbzqj5DQHGEc7wm9rFTSP06XlnVrYJ+9yEZ9KYD1WuMeEbe7tQwKDW/BMqnPLV1WmdRV998yunQx3iLDojwtKHBcs3tcA18ZyPjEWjFuRp01ORe8CgGfqaJcFMNsimzpq3iu3ERRrRqK20G5OT2SgbzyeIW6VnrPukLNnmfV4KwSHLcWcplCFMIuBwGhlROKZYh351ooVMnuET8zsJsGe+YpliyQF2c86/wQcJNjL2P1YLv9eqpH2OQx4cVNfAYg1lp0HNqp0jWy2h/oFIJhZHtGXPindmaO51LG/bgCj2e2A+NtVvibWh1xrsV7hZtWQqbqkkBowU3I8I3wTBcorsE56gnO4GxX5BOmD7lkmgAO7+JEgibuAXnc9ugCPIgLb9Tf4bEJi/JLmWM4jsB/ehpYNG/W0sy9ceJJOKgCQm64hOZORJ/o31eox9t13Z0h+cCL1PSNA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199015)(46966006)(36840700001)(40470700004)(40480700001)(36756003)(40460700003)(86362001)(36860700001)(31696002)(478600001)(44832011)(26005)(53546011)(186003)(5660300002)(4326008)(41300700001)(8936002)(316002)(16576012)(54906003)(110136005)(8676002)(70586007)(70206006)(2906002)(82310400005)(82740400003)(81166007)(356005)(2616005)(47076005)(426003)(336012)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 11:03:47.8493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af663b88-1bdd-4450-2ce6-08dad454e31c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000EE3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4115

Hi Bertrand,

On 01/12/2022 15:25, Bertrand Marquis wrote:
> 
> 
> Add containers suitable to run yocto kirkstone build based on ubuntu
> 22.04. It contains all packages required by Yocto and a checkout of the
> layers required to build Xen with Yocto.
> 
> Add a generic docker image template to be used to automatically generate
> docker files for different configurations:
> - specific yocto version
> - different targets (qemu arm, arm64 and x86)
> - different host platforms (x86 or arm64)
> 
> During a call to 'make all', only the images for the host platform we
> run it on in the CI is generated.
> If needed, images for an other host platform can be generated manually
> by calling the right make target (see make help).
> 
> Add a build script to build and run xen on qemu using Yocto.
> The script supports arm32, arm64 and x86_64 and checks that dom0 is
> properly booting. At this stage this does not run any guest on top of
> dom0. The script is to be executed in one of the docker images to build
> and run a system using a Xen source tree.
> 
> Add automation/build/yocto/*.dockerfile to gitignore as those files are
> generated.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

I know that Stefano tested the build/run on arm64. I did the same locally
on x86 successfully.

~Michal


