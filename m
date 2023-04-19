Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA946E794B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 14:06:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523388.813387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp6ZR-0002q5-76; Wed, 19 Apr 2023 12:05:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523388.813387; Wed, 19 Apr 2023 12:05:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp6ZR-0002nQ-4Q; Wed, 19 Apr 2023 12:05:57 +0000
Received: by outflank-mailman (input) for mailman id 523388;
 Wed, 19 Apr 2023 12:05:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ifGd=AK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pp6ZP-0002nK-Cg
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 12:05:55 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe59::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86622ecc-deaa-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 14:05:51 +0200 (CEST)
Received: from BN0PR03CA0057.namprd03.prod.outlook.com (2603:10b6:408:e7::32)
 by BY5PR12MB4115.namprd12.prod.outlook.com (2603:10b6:a03:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 12:05:47 +0000
Received: from BN8NAM11FT100.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::72) by BN0PR03CA0057.outlook.office365.com
 (2603:10b6:408:e7::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22 via Frontend
 Transport; Wed, 19 Apr 2023 12:05:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT100.mail.protection.outlook.com (10.13.177.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.22 via Frontend Transport; Wed, 19 Apr 2023 12:05:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 19 Apr
 2023 07:05:46 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 19 Apr 2023 07:05:44 -0500
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
X-Inumbo-ID: 86622ecc-deaa-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIKC/Fds7A9GVj+UogZd7za14uuWKuuCeWA78S7PZlnDhAMNjOue0xLPYxZKcW/nNiixsDdBtBTwKUuNSGl05aljDBiAyIm9hoVevoJWHVLQQD/YmqgKO3DO9Xk24Ouomadl7xg7/0G4aFglmRyqEBaSUOJeLeaGgRNLLk8GYrDmOLaCsMYxrGO1ly0UAmQ0VMHfwjg4xLPcAz11/U/UwhqIe8qbbjI5vrUCpkMXscJk7BM7lNW3SV/Z0YE8dmxqqR48y3TmFHeJ6BRZFV22wA4BtbHUTplMaLPeWyCsW9oAtLGhUtEVM3RmdArAKQD/sqmtBtdiSUvMPnR9RaOVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koVgJq0CDskxBs3mtL1uJ4fcZrANCwjGhvanYDgGC4k=;
 b=VAd7Tft5Or48kERkDmej1FYJAKJPF57FlKj4lNkqOmyPflhD1DDHh49sUPDgr9yoftyx6AxAnEMQc9KdQvQl64mRnMxrdXemQJpaBvDbAAfPjXRpRX3DXhVP4rGHIHyXB+qBeQUKIrUC71Q6AiBNGG5h14hkzahN/5IcROLj2nZo/DFAhJq5g/zZ/xYGCK0N6+andI8eyKja4X3FkICExqGHPoYpdPiXh/+c5l3V8NJ2p1BMf4KuNKErBSvHYJajCmUe4eNRMfjIAxhuYModEl1D/V+8OVsTIIiyVlLEr2ctWpUxqc9RZeYdmE6GrDLcKB7aFNY+kuycIkETro/WPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koVgJq0CDskxBs3mtL1uJ4fcZrANCwjGhvanYDgGC4k=;
 b=ht9u83trJSHaw29RHdnIsLTVTkj+2Ye6zF1y1gVqpPKZifWAmTQ+qYq2bqadgMORdGnzG2WPO9qyf4/CyqL1u5oE7HEiyGkj+F7rhWDtwAIvAfv3USVscY0UhDO7yEzumm9MHDU4BIwLHp62ZbavC/YTnh94RbZWBMXvG/34Noc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <77b015b2-cc30-0534-4e0c-c392b5e8a7b3@amd.com>
Date: Wed, 19 Apr 2023 14:05:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN v5 01/10] xen/arm: domain_build: Track unallocated pages
 using the frame number
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-2-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230413173735.48387-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT100:EE_|BY5PR12MB4115:EE_
X-MS-Office365-Filtering-Correlation-Id: 529f73a3-e959-4a2c-cf77-08db40ce6918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6jmyByN+Dw65wwFS0yaI4CyCm3hukPn2YWijC86Vf7/7ioCw9DF9JSv0JOn2buPL/I7SytUDH09nimsyPkHj2Bj1Cnx+r3hYovtEPiZN6kAJ+1JWBrcqxXt+g08jYFcBSwmb7TR738SjZE2D4Fv4NT19j/q+KQPTSX2mbwsgFhNHNPQVdvTCWM63KfpYIbS0RcyIj+6S7nDN/QwlWhiTSYnmoVYnHUaRUZTlT6yifJ47fsPdMtpF7dgoOfvk7291UgmPxJsC1DIHFmoYHvDLSUw3IWBp6kgRiakrWOfM9eQ1Lsj/kYINkKTXbrsAzMZiOxFjYetsM9YMuUSj1xImFaUMGDt9akMQ1yySvijn+qmewLxlCRqC8mK27rFicZKlKa60mdH54ucwD1yIUgwqDJuau0SZIRrcmBqJx29iNcxqOs3v7RJzwXI0AQbHT8iiUurnWU8Wll1eD41MPsJTvgcF5/JyL6wt0LtxMg9TKEj7bjzcCw5hM2joyIGlXmY6GlvkRXCy0tzWm1YMFurWraMp/FDdW2zyWnivBJxURfRILYSpJkhj+5sM1hvYmz/y9l+MvMc54bBYo97eGu04NizJPQhUdkN3vjMB/F4s9i3NskeM1Sz5HCITi22iddrnJR6bgUCYZyoN2lqPI5ilh1B4egYW01vWcMZJgCzUhSIp1kF2+STzM+5dCtQAH9snhecSjmNo30+IqdKG9AW4u0XpEZS2VC70TSuSp7RjXJVFEgBwiRV/z1JQJv3Dbmj7X7zZgw8cAfOumhJ3xIeSi7swLMiazlGKV8LIL1qEWII=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199021)(36840700001)(46966006)(40470700004)(36756003)(186003)(70586007)(4326008)(16576012)(110136005)(54906003)(316002)(70206006)(478600001)(40480700001)(8936002)(82310400005)(41300700001)(8676002)(5660300002)(7416002)(44832011)(82740400003)(2906002)(86362001)(356005)(81166007)(336012)(426003)(2616005)(26005)(53546011)(40460700003)(36860700001)(47076005)(31696002)(31686004)(21314003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 12:05:47.3418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 529f73a3-e959-4a2c-cf77-08db40ce6918
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT100.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4115

Hi Ayan,

On 13/04/2023 19:37, Ayan Kumar Halder wrote:
> 
> 
> rangeset_{xxx}_range() functions are invoked with 'start' and 'size' as
> arguments which are either 'uint64_t' or 'paddr_t'. However, the function
> accepts 'unsigned long' for 'start' and 'size'. 'unsigned long' is 32 bits for
> Arm32. Thus, there is an implicit downcasting from 'uint64_t'/'paddr_t' to
> 'unsigned long' when invoking rangeset_{xxx}_range().
> 
> So, it may seem there is a possibility of lose of data due to truncation.
> 
> In reality, 'start' and 'size' are always page aligned. And Arm32 currently
> supports 40 bits as the width of physical address.
> So if the addresses are page aligned, the last 12 bits contain zeroes.
> Thus, we could instead pass page frame number which will contain 28 bits (40-12
> on Arm32) and this can be represented using 'unsigned long'.
> 
> On Arm64, this change will not induce any adverse side effect as the width of
> physical address is 48 bits. 
NIT: This reads as const, so it would be better to write: "as the max supported width of ..."

Thus, the width of 'gfn' (ie 48 - 12 = 36) can be
> represented using 'unsigned long' (which is 64 bits wide).
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

With or without (after all this is just a commit msg):
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

