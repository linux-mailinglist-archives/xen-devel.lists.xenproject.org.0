Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6B8750935
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 15:05:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562495.879200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJZWV-00020U-Bc; Wed, 12 Jul 2023 13:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562495.879200; Wed, 12 Jul 2023 13:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJZWV-0001xk-6j; Wed, 12 Jul 2023 13:04:51 +0000
Received: by outflank-mailman (input) for mailman id 562495;
 Wed, 12 Jul 2023 13:04:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gKGC=C6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qJZWT-0001xO-BW
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 13:04:49 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe59::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac9a3f6e-20b4-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 15:04:46 +0200 (CEST)
Received: from MW4PR03CA0235.namprd03.prod.outlook.com (2603:10b6:303:b9::30)
 by BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 13:04:43 +0000
Received: from CO1NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::a0) by MW4PR03CA0235.outlook.office365.com
 (2603:10b6:303:b9::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20 via Frontend
 Transport; Wed, 12 Jul 2023 13:04:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT108.mail.protection.outlook.com (10.13.175.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.20 via Frontend Transport; Wed, 12 Jul 2023 13:04:42 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 12 Jul
 2023 08:04:39 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 12 Jul
 2023 06:04:39 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Wed, 12 Jul 2023 08:04:38 -0500
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
X-Inumbo-ID: ac9a3f6e-20b4-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R14ZO9TxBNzGEE7k/Bbden8qknE55k2/BCifNKxos94ofR3cDRa4PIKRL2U8+HNJkey+IdkMe+c0tZtHZxIkDJgmS8XtENJ6mig7fdh7hj7Oawg7tfp1d3p+h8GEW9lTwYh/vkSPmcVDO2J4thdqw+jfVguOsg27vQLwP3zPhE15BtaX1O+UlLe1nfls/Jg42eZyIP/UHmGTTXlycooABqQkL785axWSKXW/AvBAq/SGjE4OMfq0qpKBZJU38GIeYUBqw/oSmxbBLY+I4Hs5j0UYs3Xvv4/KadlGi8nJ6HMf2z+au+Xm0Aq/Mddk5G3lVcyYZl9PYCxtTS82JzTn3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALYRmK7dezL+NL0wl6TMquTYMr5k607QGgE4XcfIm1E=;
 b=iM6Xb/EWMMBQm9D80sbvKWEc7jIwD9vq/a7ipXcLf3TDFp3Yt00QLK2BpKngKbro+qCocN8wqCk8FNvCIOuOC9CQ3A1P0d/NrjVRR49wn6a4E+bBxjdee9btbzBJThpiw53KXoHrokev0uH4mL7/SxVYewJhBtjgvoaz5wByF6oVR5Es/4BhZe5XalpEqJhvaB2YtHlxx2/NfqyV+QruP205HoMbb94WRJpmR1lp1zJ+ORRLIaB9TkTat7SkOXbpipIxOlWREUL0FXHv38tb/0yUsh7nJR3O0rnnYekqo32hy3j/DYCSSqGNjm3L+W8q9KI9iihScguwa3Fgd1Ogzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALYRmK7dezL+NL0wl6TMquTYMr5k607QGgE4XcfIm1E=;
 b=3cSESfdVQCvOBqhxdvySy9n986L4c6j/oOIOTNgYvlAW9TjO3c6ImyxduI9cCxuknZqGCk/j3bRsvC80DuVjU/SW3uNdrYVPk0flb7Ed168dWV+a0ulX+7MCMiJs93feOdoMg39VKwJzvyUKtGOPVZI5XhYPmNwktBmH+K7NfMQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c139abd7-bd27-f8cf-b561-5c795bb663a7@amd.com>
Date: Wed, 12 Jul 2023 15:04:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] docs: Fix style in misc/arm/silicon-errata.txt table
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: <bertrand.marquis@arm.com>, <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230712120440.1815240-1-luca.fancellu@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230712120440.1815240-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT108:EE_|BL3PR12MB6473:EE_
X-MS-Office365-Filtering-Correlation-Id: 22a24488-845b-417e-b30a-08db82d88f08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O1DKNGk9DGMV8Ya8Ymfq1w57Nh2WOBtxe23w4BDrIE86zEMKxRnuDvQVdJdqrlixECDv7qcTApaXpefCHde7R34q9DyhC4HsLQdZsL/wHIY1XOFTwenL+dsKQ8CAWNhIq5yuc7XXymBV3XAsjYukU4fo3Yf6A7wC6mKaAnmPPyC36Jqjb8AdERLymfbpGdx3TPVu/2sZWTtlxKQNRL1QpT1XkeHugkX/jso+5l/7RfSJKZxgrUERYHny7o2XgTuXnTED5DIDiHO/TPpan3NQSMquktaANdPDG51hq1idDKdqftl54xsSeEXbkPrMLZjH44NP6sDzbn1T8S2moMR+zcrNHOqRSFB1bptPvClnjR/xuWufDfwMv3h91rOX3n6aSnj2cCCS8wfhQOyq9b0RVY5PkhA+vlDcJ9EZkOOK1T9nJMIa/beFRjWftbJp5QlY4dZD219gM28H7HQ+7iAGtbS8X1JNNI6TeLyNrOEs0R85ICoO8f2pWpyAiLkaI/WRBigWFM9vcugwkPnhoh4HcSu2w7znIfJ14D6zEL68dOP6IoWbcwz8/CjNTsVWrl9+2uxWZGlnFN9F+dfsfymnNbF5hD/hhyjoAAMtRKkwSy4u5AbFX1IPCAQx+Dt8myqriCjNo3LpQYirjKCn60K9lgLu0xlmvssc392tFYUGTBRUVXtBf7OxdhIiYAlp8Joy3SQ8sbaEuXcnDk5V6ZSa+ERdgg9MkKCVQmfIG1TvdQp+39b6gSa5PjuiacIm3Sq+5uR5HvWuIpRPfBvUeNbwGw0uJtFsvcORkONcIFxxwF3MLNgiXtuiQPtP8SngUL4q
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199021)(40470700004)(36840700001)(46966006)(356005)(31696002)(86362001)(81166007)(82740400003)(83380400001)(54906003)(82310400005)(110136005)(31686004)(36860700001)(4744005)(2906002)(426003)(2616005)(36756003)(47076005)(4326008)(316002)(70206006)(70586007)(16576012)(8676002)(8936002)(40460700003)(53546011)(478600001)(336012)(186003)(26005)(41300700001)(5660300002)(44832011)(40480700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 13:04:42.5753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a24488-845b-417e-b30a-08db82d88f08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6473

Hi Luca,

On 12/07/2023 14:04, Luca Fancellu wrote:
> 
> 
> Fix the right border of the silicon-errata.txt table
> 
> Fixes: 1814a626fb58 ("xen/arm: Update silicon-errata.txt with the Neovers AT erratum")
Fixes tag is for bugs and this one is clearly not.
With that removed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


