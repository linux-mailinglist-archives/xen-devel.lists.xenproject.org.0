Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3239D811281
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 14:06:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654000.1020628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDOwW-0006ef-Bt; Wed, 13 Dec 2023 13:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654000.1020628; Wed, 13 Dec 2023 13:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDOwW-0006bl-8u; Wed, 13 Dec 2023 13:06:28 +0000
Received: by outflank-mailman (input) for mailman id 654000;
 Wed, 13 Dec 2023 13:06:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y/PY=HY=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rDOwU-0006bf-0q
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 13:06:26 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68278693-99b8-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 14:06:20 +0100 (CET)
Received: from DM6PR02CA0084.namprd02.prod.outlook.com (2603:10b6:5:1f4::25)
 by BY5PR12MB4871.namprd12.prod.outlook.com (2603:10b6:a03:1d1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 13:06:16 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:5:1f4:cafe::99) by DM6PR02CA0084.outlook.office365.com
 (2603:10b6:5:1f4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Wed, 13 Dec 2023 13:06:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.26 via Frontend Transport; Wed, 13 Dec 2023 13:06:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 13 Dec
 2023 07:06:12 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 13 Dec 2023 07:06:11 -0600
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
X-Inumbo-ID: 68278693-99b8-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mk0JkhQEeLSO2IAADrw98R0MSkJxuhOBXpB65Ey1sdNNo0ztKCeZKHSG+iVVvc4GEyqlLoprOrRom1n+DGgjmbhuQtd6ybs3UroVLcvlgEwV6DEP39xcpsBZzPmRgUAYAxjZGO3zBcmsseWeif+zwGPw8uGdFMaiBWCVl+v89qdEVBME67XsxDdz1xejoCU20sXOCAFwwvbQsz4oca3CFmLNzr/XRfqD9luIindbsBE8T9PxWPyA3AZo6fz4bgaYmrv2nrPeOsvgLpX2GzOOh5FjORjne3TnJmbVmU+fpiGU2XWbgLe2difwAnaiqoBNbUcsKHzAZYjm8pBx6ULEWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJ8xRrHr9x3n9TjjgIiNwbuD/ioa+Thq+NJC8Urfb0c=;
 b=EYTVc1NmceQNXhs7iQ2Zx8umBV3Ze9I/F4tZ2PutU75QBufqvNy/uHD4P2YIdPfSzP9IOgOwUeHVqKVN5Y415JPDs1ZTc7wKPdxKQOiY6OmPhCXhCgC30cJgFR1ao1d6GkDHI6KpqX7nyP2BEbQ0DTFrOUC63Be8ph6iUEkuFdZROn4KqDbXiIenEKl5NwhxiDtLkAiYtuQTRTIw0Z6xg9Hqiysk226xD4mvKf8UsvEco4J4o8KgPRR7g/AevjpxzS3c9MKLJhJESgvCXSPIOgJeB+xkJZ3Y1KK9CZyKOASos/2NvTJNpS7vUXHWizz75Ho7tF2PMeeRNI8bimoKcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJ8xRrHr9x3n9TjjgIiNwbuD/ioa+Thq+NJC8Urfb0c=;
 b=egIAq3ppCyJ4ixN/j9v2EV965c3XqeNV3lZy5VZXdA8L3ZTcShBU53jwuzzf10YL/Un2fP84F2Jot1mfQB7gh6fJ/yWZPnnqvwbxI82v+TghNHRJeyi6h0q3GQFBXygJT9qMnXhgV4aKwQalxQdNP9xFr2d4Be3TZiX8T4BwxPc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <0b7a0a09-ac54-4ef0-b4bc-c86f744089ed@amd.com>
Date: Wed, 13 Dec 2023 14:06:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/arm: ffa: return FFA_RET_NOT_SUPPORTED on
 unhandled calls
Content-Language: en-US
To: Jens Wiklander <jens.wiklander@linaro.org>,
	<xen-devel@lists.xenproject.org>
CC: <patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
References: <20231213103241.2346813-1-jens.wiklander@linaro.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231213103241.2346813-1-jens.wiklander@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|BY5PR12MB4871:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f9c1cf5-ed9a-4111-07da-08dbfbdc4a61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QdpOGJ6n2OBvLtDExOUBSSDNhyWKHNFvET4eEPzCMQnQJu+sYl8G3ElbLekiv4hXQwZQDIKp2NpQLJzuOqZTnQEz3o3pJz8UmnCjP26jR8izt+V3jyHXdZmwsubJA4Z07Hh7AEZbryHj2WbNLz+g19k/veuPszdn0SWtLO32sezUsmWhoBgulAqLKIfX1I7rxLCLvYlruLVDxWRDzbTsIel1+yP0QXWrrz+bV57Fy7IWu1iWXWVNwxu/M68CUv9Jlw/md/HcjqiuQV2hTeGQhq0lSB+0ycMBvpl76Jjs0FlU+KRJX5vNKfyAS5kA1gNqMADcZ58Sqv5XHVJTkfk0kYQfzHNCz6zXB/z9lBwmrGy4uGlioRJxLIeN8rn6XRwWPKtaNMszURm3Vj7L2S1+3aoevvZCCraV1wo5g2T9DakrOSPuUIfFSs1he2mvY/AmwQ9zkPbq3frkp2hTsT67fMHIWgo+7cClLY/8JYmKOV+9d/USnqtXf1MYqiUV+fN0Izoge7YpH9rn3XlBowUDD0R6zEgtKxdQ416faHuhdhYnplduwBzwNtq7as+AfXx68pUd7SAYRGOgn8euJw06kswCyygj794y3/7N3cQ0aR9lYqvJaITaJz/0HbDF4i6H/793T9iJTAXmJYZEHGCyzNsT/xS4Mx7lKxQR1xsiakJOzBeNmY2kQ/VsE9Kif5Lc5GLqGKq87E+IIvjCu/JeHcqvHRYm0uQpDuxdSoNQx/HLggGdgQl7ne9v5YQODH+qnhdgLOnUCdsi+IvHa9okIVFAN54qgWV/CYRV8rF7nQPqP4kXCqVNtoxnUmmY+dGZ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(82310400011)(64100799003)(186009)(46966006)(36840700001)(40470700004)(40460700003)(426003)(83380400001)(53546011)(26005)(336012)(2616005)(47076005)(36860700001)(44832011)(5660300002)(4326008)(8936002)(8676002)(41300700001)(2906002)(110136005)(478600001)(16576012)(316002)(4744005)(86362001)(54906003)(70206006)(70586007)(31696002)(36756003)(356005)(81166007)(82740400003)(40480700001)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 13:06:16.0431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9c1cf5-ed9a-4111-07da-08dbfbdc4a61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4871

Hi,

On 13/12/2023 11:32, Jens Wiklander wrote:
> 
> 
> Until now has an unsupported FF-A request been reported back with
NIT: I think 'has' is in the wrong place

> ARM_SMCCC_ERR_UNKNOWN_FUNCTION in register x0. A FF-A caller would
> rather expect FFA_ERROR in x0 and FFA_RET_NOT_SUPPORTED in x2 so update
> ffa_handle_call() to return true and with the cpu_user_regs updated.
> 
> Fixes: 38846de2176b ("xen/arm: tee: add a primitive FF-A mediator")
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Looking at Linux and TFA, this is indeed expected behavior, so:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

