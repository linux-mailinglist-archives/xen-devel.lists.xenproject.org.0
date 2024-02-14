Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BD48543F6
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 09:20:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680233.1058180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raAVS-0006in-Ng; Wed, 14 Feb 2024 08:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680233.1058180; Wed, 14 Feb 2024 08:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raAVS-0006gs-Ko; Wed, 14 Feb 2024 08:20:38 +0000
Received: by outflank-mailman (input) for mailman id 680233;
 Wed, 14 Feb 2024 08:20:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kQr2=JX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1raAVR-0006gk-AX
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 08:20:37 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec7eabbf-cb11-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 09:20:34 +0100 (CET)
Received: from CH2PR07CA0058.namprd07.prod.outlook.com (2603:10b6:610:5b::32)
 by SJ0PR12MB5423.namprd12.prod.outlook.com (2603:10b6:a03:301::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Wed, 14 Feb
 2024 08:20:26 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::ba) by CH2PR07CA0058.outlook.office365.com
 (2603:10b6:610:5b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Wed, 14 Feb 2024 08:20:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 08:20:26 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 02:20:25 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 00:20:25 -0800
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 14 Feb 2024 02:20:23 -0600
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
X-Inumbo-ID: ec7eabbf-cb11-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9fzC9shUIwRFu4dwtkY5S/bFQIK6B6BGBcw5lECcKj08plEcchBlWysUgcfutGssmkDuXgHesV2XmakHdl8HIrVkOKQiYFM+fWro5LJ77SOK/9+s/O4e63dh3UcS32gjq348oz4EXmOeQnTQNUtWTVb185hBZJg7pc4mdlsQ6EDX6oRxmNCFRbYMzsrkMPNogO3ql//uc81bY3gfXtiWMwhYANk9QFZk1WoZ3izxH9BqDrTCLlb5yRSWtsspBNdV9jI5SXeWSpr+PfdqiDRDlpVL10S96HROiS15ciBJN1/DmUdRss43mXxb4bgBkCVROj0FDW0qoNJGpjaK+E1qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxyRVjkHNGh7/pGUHjKlkb4va6U54AzjGMRoKXWMtj8=;
 b=ONTmn4J3fukbNwdjCmxyfHZBktC/rmTznKaHey6rUn3pkNag0622+5Q7VR4C35uizKWTzvjV1O4BstvXGJF8UEcKqO2w0NnovbOXgQyyxvuU/pcIEfeuWYglcwp/7RT1GwY85YzzDyByHmkm7sG2QvyjlIKpwuF3mnph50R4H0udUPo8tZ9Dzv1REu0fLQM/0vfci9Zap+FhCFS8HrmlW/INZnsmAmQyl4AZMgnjerq/yT0EN/wvBorwGInvQQ2s/O4DZXU6Gt3yP/UgYNaMYvFg/2MDM2xWDeYJ83dvXlupgWp48P39N0KAS906FdZaTU3DDdcyuaDk28VxCw/w8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxyRVjkHNGh7/pGUHjKlkb4va6U54AzjGMRoKXWMtj8=;
 b=IzVKHgzOptxEg2GJO/814yf83wIvrG0wNuNakBX2LxBrzdkvszO6hfFl9HjljjFdArGPebpVPTjHS9QmvBCzu4rPdXKzMVxxijFLbSk4onPnTTNwSuKKJbwfgBJkFKdqOjhNfhDHBVX08EXvwlPC4g57r8FZuvRcyq4q2KPb5FQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <902d75e7-7717-4af1-93f0-e4115aecaa54@amd.com>
Date: Wed, 14 Feb 2024 09:20:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] xen: introduce Kconfig function alignment option
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>
References: <20240207145547.89689-1-roger.pau@citrix.com>
 <20240207145547.89689-2-roger.pau@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240207145547.89689-2-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|SJ0PR12MB5423:EE_
X-MS-Office365-Filtering-Correlation-Id: 43549c80-f66a-4e84-6853-08dc2d35cc46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V0D+QWGgvZzjwZXPEALKVctmzljIHJYHqL3++2mVi2O1XufBkhXirjZXX2wK03dUzJ2TC0opndZdubSnUzOP4LHZzYUnYzzdntUAjDQKSi0jh5aWCy21zgQI5L0N6u02F9pwznpeJ4uOcmSKabWqc903X4Tn0IBeJi24uKNpkoXwB0+AX9kfieJI2myEN37gBdo4WaDgjjvtMwORz8RUXpHnA7TTU1HtSqFjwFHZnX0/RVz9YQFrDdMyWOG44mlfqDR4kAq69Q3L5wEdRwlQKqxQhj51Hfs5lvolPKcAJo2G6Piak7TwE15E/IPJYLuiH7jklAlzu04iHC7kLNz2Uo5r1q/LStSIUkLrxGgZWg1Xf4FbPkol9QABXXL9JZE4LpmnNDzUQ1N5prrk2/gT4qIBy5kgHuxlambkVvmYdVH6PVdvz5u3hK5xF+7+/BRibJaxcTPahhvOOZ2rb8XGum4pU5V0qdHE0Bs8Y+JrHEsMO0yvlyUt73wQSNRHUt6LK7XJWihJWcI3NZ3TK+EBQr3Y+/bnQSx029ZHX7M+XVA54Y0C7u+edQhKwfuErfBaSBLI+3wP8tBf2J4HdQw5EYKlepseSWK/zfzVd+lMI9g=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(346002)(136003)(230922051799003)(64100799003)(82310400011)(186009)(451199024)(1800799012)(40470700004)(36840700001)(46966006)(31686004)(2906002)(44832011)(4744005)(7416002)(5660300002)(336012)(26005)(426003)(2616005)(41300700001)(4326008)(53546011)(8676002)(70586007)(70206006)(8936002)(31696002)(478600001)(110136005)(16576012)(316002)(54906003)(81166007)(82740400003)(356005)(36756003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 08:20:26.2825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43549c80-f66a-4e84-6853-08dc2d35cc46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5423

Hi,

On 07/02/2024 15:55, Roger Pau Monne wrote:
> 
> 
> And use it to replace CODE_ALIGN in assembly.  This allows to generalize the
> way the code alignment gets set across all architectures.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
In xen/linkage.h, there is still a comment at the top mentioning that CODE_ALIGN needs to
be specified by each arch. I think this wants to be removed now. With that and Jan's remark
addressed, for Arm:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

