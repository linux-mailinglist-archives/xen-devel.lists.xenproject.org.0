Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 896DD80455D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 03:56:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647383.1010453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rALbS-0003xD-1D; Tue, 05 Dec 2023 02:56:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647383.1010453; Tue, 05 Dec 2023 02:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rALbR-0003uq-Tz; Tue, 05 Dec 2023 02:56:05 +0000
Received: by outflank-mailman (input) for mailman id 647383;
 Tue, 05 Dec 2023 02:56:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3q/=HQ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rALbQ-0003uk-4n
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 02:56:04 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e88::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1c6cd3c-9319-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 03:56:00 +0100 (CET)
Received: from MW4PR04CA0081.namprd04.prod.outlook.com (2603:10b6:303:6b::26)
 by CH2PR12MB4200.namprd12.prod.outlook.com (2603:10b6:610:ac::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 02:55:57 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:303:6b:cafe::91) by MW4PR04CA0081.outlook.office365.com
 (2603:10b6:303:6b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Tue, 5 Dec 2023 02:55:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.2 via Frontend Transport; Tue, 5 Dec 2023 02:55:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 20:55:55 -0600
Received: from [172.27.137.28] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 4 Dec 2023 20:55:53 -0600
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
X-Inumbo-ID: d1c6cd3c-9319-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnFnorVmNgynXBXf6jK84fSRSpmuYgC9dojA79iNdJdOo3cdEzmNYBDvry95/3t23LnH1/3rpJE53KFFzSHSp0BQMIfiX0wXAVaz+qShmcDa4PwOFoF3gtyfJ5p+XeD/EtSh65EC4Yj2piMv4IvBW0Tmmb3Y09kMgN/X53acdheS1YPXC2Si8xEXyDUlyEBRCbbuAjl77gV78J8a/QlY26NamQmRKrHjSfMJTUo6meAg+xmne1QtqWYgEL0kB6DhP6xHPI8QMZVXEDcjZ7nZeWjCHbuH4AYYLTfKAk6nwitzMxVO5fn6va7AbDEPVwnm94YxYiq/WeVDFBGuPYOMOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjRfouQkKU4RpguekyvqFKOrZx10k+GkbjMSwaIfngc=;
 b=BYF64IqjEY9zhkUXSYFm35Tz0O3CiNnjq4+CCGEZDxBKoACT5fPuVusK6E5bfJ0mLjOKALs/ek4HK7nOIfi90PU7aJnLl8Gw5SAGRBixUED4q5+lmoVjJcGhg1RttuWyL0OI5mEa50Zb+IwK4HZZbF7/DVvcQLruzSbmVYF2LU2okH1IBX/Q8qFiOwZfOyi6PmgMiCGqAM1yQSYm3WFm9FTvNp7svwl4sBJS/bg1xKL2fB5uNAmTPGHkqP7zu6LjSwumYQ1G5gTmOKHJFMrAu98kKTXMUQfphmkbnr8BwTPLenWtUCnGUiT+LPSmivZyiM4lu8QKQwvvjiadGbkHxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjRfouQkKU4RpguekyvqFKOrZx10k+GkbjMSwaIfngc=;
 b=0P/uof9oCPeoMzLF+xPCMA+n1usssD0tj8jcVEo+gF2me4Kj6r7AzyKD8QPEBOXFRJZfGvNXOMhq8HVl+1xm/q+7DPkk5OhjUOtjfTGbfpAg+yUoujd6neKfhtR0r9uz2K2IAL0pJZVc5M7sHJWgzRfn/Fq99mH9QnhmmUUQrv8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <61591bd9-60bf-405f-a4f1-152193972823@amd.com>
Date: Mon, 4 Dec 2023 21:55:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11.1 16/17] xen/arm: vpci: permit access to guest vpci
 space
Content-Language: en-US
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-17-volodymyr_babchuk@epam.com>
 <5bb1afc3-6de4-4b78-85a4-2610f5f1d001@suse.com>
 <4920dfd5-38b2-4122-8108-508aa643ddf6@amd.com>
 <20231204161802.3537573-1-stewart.hildebrand@amd.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20231204161802.3537573-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|CH2PR12MB4200:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f81f1f3-56e9-4bca-db80-08dbf53db3f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qlAcba08c2sD8h3JcA8Ybb+VEyZDUaOszy4+A32IIo02vFwmwROEpzpzVTj1y4q3rcvfUkp//j08gMUIwwFK03A1n+CzLsrdnEkX3u88lAKLYHQ4FR/Cko/sB+ntsd5ump/aCttqywlLdRumUqKsKkZqnhzLgpOL6rFUIZ7nyXxdSFFuCkjCgLQVGzHMw94cndtqpOwaUDsqPL6JU3RZMKUHr3DeRmANp+iV0Mlni65zQ1RH4p/FMaUQq+PhGpEiW+49Ob2sSgqTULa9uL6csXeptNuWRCVI6PjarW09nHIx07ugcsshcJUgB7kVJEgilcQWA6WyxtUnWShOnUNMLy91hpsc2HvyB+IHSjTGwc7ZkpTWFNd9x1yTc/BMSkigqhrChXAkApcVH5vYIEc3AHGQXmQ+SOu0ko/uXvPLOV1yfDYTINhUiwi3t1Y+50ZNoLS4k3qG+QKElCcKZviHEhmoviIwO8y8lE1uJCxiKH0VijO2ghnKvkVGmMTKB+elrvZUWNp4i4n85+nSYhCg+tInsyDHFIjdPIlPzMM0vWPem8U0OyMVafwfWftC7cXP4ZhW9PbRInoKQQGUnGpql/apYdQ05B22mBA9Mev5fzBQKVmgrHotFKLA/gqtNg/6xskHO7bOYrxnOTbN7o6wNxibAqskygn+ly4rffZHLD6G0vy5JffYcGroi85EFk0wqyFGNnjb4MC++pvLU13zvwfwaK+bSU8gMr2lKhkZsggAt6VPgwLrh2MKFLBJ+QSF6wpZavPI9KvAHfD/MCIs9rwFvtrapJ7+gxFyQK3vxfEkXPTyOScPiDv8e5LS9g/2
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(82310400011)(1800799012)(186009)(40470700004)(36840700001)(46966006)(40460700003)(6916009)(54906003)(8936002)(86362001)(316002)(8676002)(44832011)(4326008)(31696002)(16576012)(70206006)(478600001)(70586007)(36756003)(41300700001)(2906002)(5660300002)(4744005)(36860700001)(81166007)(47076005)(356005)(26005)(2616005)(426003)(53546011)(82740400003)(336012)(31686004)(40480700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 02:55:56.2317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f81f1f3-56e9-4bca-db80-08dbf53db3f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4200

On 12/4/23 11:18, Stewart Hildebrand wrote:
> Move iomem_caps initialization earlier (before arch_domain_create()).
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

So sorry, I cherry-picked the wrong one, this one didn't apply. Let me try again.

