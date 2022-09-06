Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5575AE70F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 14:00:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399808.641143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVXF3-0005k5-Gn; Tue, 06 Sep 2022 11:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399808.641143; Tue, 06 Sep 2022 11:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVXF3-0005gz-E1; Tue, 06 Sep 2022 11:59:45 +0000
Received: by outflank-mailman (input) for mailman id 399808;
 Tue, 06 Sep 2022 11:59:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BE3u=ZJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oVXF1-0005gt-M6
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 11:59:43 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 630abade-2ddb-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 13:59:41 +0200 (CEST)
Received: from DM6PR05CA0041.namprd05.prod.outlook.com (2603:10b6:5:335::10)
 by CH2PR12MB4296.namprd12.prod.outlook.com (2603:10b6:610:af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Tue, 6 Sep
 2022 11:59:38 +0000
Received: from DM6NAM11FT115.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::eb) by DM6PR05CA0041.outlook.office365.com
 (2603:10b6:5:335::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.5 via Frontend
 Transport; Tue, 6 Sep 2022 11:59:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT115.mail.protection.outlook.com (10.13.173.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 11:59:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 6 Sep
 2022 06:59:37 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Tue, 6 Sep 2022 06:59:35 -0500
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
X-Inumbo-ID: 630abade-2ddb-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1jEoCTRY20PTycPhQ3SHq20PP/33yopoR7zjhBZh/PWWCB4psTOkKyr8/zJFSAgSOFE2EkcPc7+jhAx5aX7hgeytZlZftvg5Q0pcx69dmFsl0FDlhzV7hpzbP8K4Wy3vb/oeXtsZF9wysl92JYBfWtGS+uOZngLUcp8ezkImWKl38bwKU1OW9oqLPIXvHOma6AZYbLeo8V/q1Dqc3DZt9oJPpDLF6CDf1n2133bMXSasnB0KSXy0dTbCA0K9o6Qopt2Cj3qf35wpqo9Fi3b5aLiEiMBxQudEfxt1AY3DVADCr4mzv8aS+ad7yQHoKMNUas8H6xASzHLml5qVlcpjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WU5COqqDjHHT+zMG0/zoFpjUpQbL8wEzU+p85v79Uw8=;
 b=bYbEPa+grUl0b4RaemJVraIvQzU8opbTXO5Pnb3+zfK8Rsc2bbL5n7pIvmFATvdiG02P/JdnLjvPmuUdtV9Zs1kvXLsn5fIuEuSZHttG6RvDbJlKwODYoTbBskob0W68+a+7oGocS8cn0u1CqXd/eQeuE+k9YIbIVgj5F7TqDQ/oRB+ByyJpwnN+Aaj4fRJipDkl+mFMAESavE3QeOKjc63XqsVZi1oSeA7TEZYFX7cFGT6eLz7HzaZO4DJl++5mwFdkBFKM9PMpzobSQrOf52vRTL0n6tNbE/g2Tg29sv0liu90CeTNtV90pulUtJFOrPVoNpZnXKDcEkleXoA9Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU5COqqDjHHT+zMG0/zoFpjUpQbL8wEzU+p85v79Uw8=;
 b=1sqwVFtGLr4uYlaNoo5E7LIbCYcz4AZbN8cz/Jfjh1be23QmvwqovTCNY6rqZj+ZcCntMMrpHvQFglrHvPZfOectDdZdLw/kCo+Xs10Befle14tO8lmmD48gLY3bRbT9PUzclM30OsoaV0DD7zwXCOoWhZnU1UjkCzl29NQtKLQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <55154517-40ac-691c-74ed-7ce2504f6c07@amd.com>
Date: Tue, 6 Sep 2022 13:59:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v7 9/9] xen: Add static memory sharing in SUPPORT.md
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <20220906085941.944592-1-Penny.Zheng@arm.com>
 <20220906085941.944592-10-Penny.Zheng@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20220906085941.944592-10-Penny.Zheng@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ea6146b-51de-4ce0-eb05-08da8fff45ed
X-MS-TrafficTypeDiagnostic: CH2PR12MB4296:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UKjjLL7yeodORFyn36HZeWs17vVbDf7KeieSFHGp4WAYpDB6YfPv3eFjkflclajrFOrBkCUSKnc8V18F0jqFz8pcWjWpdVPc239WPQcISfvd0PxIYqgrNvhmT+YyV63dsTAR2oDWuBQFe2HtdD0sVZxTu3vaxXlFYkvWigL/tIYLGjxALzIz0oz7lvHPRMicf1aLxvHc7ekbkOiQBUHeMAMcdprE/6L+7SSAx3gj4/dqhW27muu03coi6yC4YbSBNam3k4bPNOfOKVs0FlGHLnYodfGHHEIRFNm2dC0zU1rS6E5kOBs4f/eCSFrO+cBkGl7r1qEZ/JL9UUTke3WzziY/rmxVluc8yzGo6vKSz6O/vITTGMyU/OUBfvI4oL+0c7j11JLg2pNB5bYoIJeG8LSMnCU1A4WyqfvNzK5d8+KuUClhCgY5bORbbJFQAobctSEs2xPo1H2HCcyRxw/Ji2bs5Qn34dEKw7+tUow/52jauDcPRmGs6BLsXkPbUBSYZf93nSpDxUUC4Y3ewGQ/vnbPz1V293fcqaEmx9F4Ka3WqkBz1+H8bq7+M2ofugLG9xS0S+HEi27ztEauK/Ny8R9/zwdVa1aQPg2Pk0OPbiRbIBpW8cHmHxRZIxxYQ03YHTqNYQ05kWNnrgFYxiexW7wRcSgPVWApuRti/0rH24wnaDLe2QidnmZ93Ke8Slcy5ZynsIN4RkbOxNAJajfqzrENZHE+GofQq9SBVaVACSF3UBI4UNOKlyEwqEdO9VNkm+6OacYjtJteK/tiG1znBRr0mzlhUkWJFOwlP8TdEBNlyMCaa1uygCAuTnd/TcU7PFMXOHI6W2p6zhdK/MWpPg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966006)(36840700001)(40470700004)(316002)(5660300002)(16576012)(4326008)(36860700001)(8936002)(70586007)(44832011)(54906003)(2906002)(36756003)(70206006)(31686004)(110136005)(8676002)(478600001)(41300700001)(40480700001)(426003)(47076005)(558084003)(26005)(31696002)(2616005)(53546011)(186003)(82310400005)(336012)(86362001)(356005)(40460700003)(81166007)(82740400003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 11:59:37.8061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea6146b-51de-4ce0-eb05-08da8fff45ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT115.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4296

Hi Penny,

On 06/09/2022 10:59, Penny Zheng wrote:
> 
> on ARM, static memory sharing is tech preview, which shall be documented
> in SUPPORT.md
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

