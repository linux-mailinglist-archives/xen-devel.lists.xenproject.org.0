Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FD96BCA83
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 10:15:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510418.788048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjhX-0000LB-Md; Thu, 16 Mar 2023 09:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510418.788048; Thu, 16 Mar 2023 09:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjhX-0000If-Jl; Thu, 16 Mar 2023 09:15:11 +0000
Received: by outflank-mailman (input) for mailman id 510418;
 Thu, 16 Mar 2023 09:15:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zev1=7I=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pcjhW-0000IX-J5
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 09:15:10 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0af84de2-c3db-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 10:15:08 +0100 (CET)
Received: from DM6PR07CA0047.namprd07.prod.outlook.com (2603:10b6:5:74::24) by
 IA1PR12MB8311.namprd12.prod.outlook.com (2603:10b6:208:3fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 09:15:05 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::14) by DM6PR07CA0047.outlook.office365.com
 (2603:10b6:5:74::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29 via Frontend
 Transport; Thu, 16 Mar 2023 09:15:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6199.17 via Frontend Transport; Thu, 16 Mar 2023 09:15:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 16 Mar
 2023 04:15:02 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 16 Mar 2023 04:15:01 -0500
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
X-Inumbo-ID: 0af84de2-c3db-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSVgBYeBTJ3YBHfm5KP2PiILqPs6psWjc4JbREFK/HezxaEdaSMj0cCQSEpUAnxZ+h4Zjbt7ISEMeCTk7dlmpNkbHyCiN/uvj3EdubmDMwYIpG7yDRgcZ8SkNziv+ROLrCe/8WWhuUzOrq/lBlkO6XPxN/1V+w8ww0JBy1GXuvxyeVnWOqj+FmQ1ZQohQQZnbSZkzqzpVshUPPKePJ74a4dWTt/uQnhlrPwjXoTHFh74hX7uKzejAqDse32hYjCO/P3SMQV2V2BmSs7o8w+pY8/zll51CquyOvkcnwq1cY2AKEAmA8VCo1ek+Kvh73iLgM0tFYmweJJPhVKTLzMG6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VS3sjAu9aAN0xii+G8rwUPWq0f4wbQqIZ5fTGjYmEGM=;
 b=b8xRjs6tm7fbn28QDFz4SwPKpIexh0wyt18k0+TloqaZDRAVbwasQm6DtlWbGI62FmZbMHKTETTv+U4nrs6fD2stUWgGpYHfJPR2rkVIIYNyfM9aRdVdoARDbRzeempnLvpkcUXeLtrjyCpYdERyYTafxnCd/ZsBCX8F04kPr/elr2iMJ9eI6OSVKuMJ1VycTzE8YjHuZ/BAkr0fplCV9UkXYejLpsFDu47tWrg0b6/J1wYy3SQ2KMaZLDdxxBezqq23XKKJa+KWG6fAap/Bl63Bbp5rrDJBZKCxavLg+Mn/vhKPeDFPH1Ui/sasvVGSU/afD8+wiehz7WwEt/LVfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VS3sjAu9aAN0xii+G8rwUPWq0f4wbQqIZ5fTGjYmEGM=;
 b=ToHC3PWNjIOQ/W9MV3CFPUrX8jo6jy6jzJy09zrnoOfYB8ASiVk7VEbcF1BkXkolFMePhPe6VMDPLx6CHEZU3di88oIwvJKdagMTHtU3Lts7xCVEqR/PE8ufKp9KI0ndASKmrogZLby9454Uaj6o6ohEKoa03OcTUpOQsaHrdT4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <63acdfc4-74a3-7db5-ddfe-04e7e20ea464@amd.com>
Date: Thu, 16 Mar 2023 10:15:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [ImageBuilder][PATCH v2 1/2] uboot-script-gen: Add
 XEN_STATIC_HEAP
Content-Language: en-US
To: jiamei.xie <jiamei.xie@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, <sstabellini@kernel.org>
References: <20230316090921.338472-1-jiamei.xie@arm.com>
 <20230316090921.338472-2-jiamei.xie@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230316090921.338472-2-jiamei.xie@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT039:EE_|IA1PR12MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d34b78e-8d83-434b-afeb-08db25feee1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CLeeiUog2ls8iCYgYVAltIxmbpmJ4VgzXBXnMUGA4lvjBRi1m6NQKqguq72IbpmtczXOSLHpllLhysasG2DQNL75G3lXclsKzhF8lALJ3SCL4TtuE87ArMp9ooHwvcIWpbWsEu7YoiqObZCajr3cSfjqBBMWUjsbl3XZtwMk90R3k3NLRO1UyrfzUilZI4DRTeUZdHmeSfU2xI5gnEh+7B0e8LDK+sDeqh5rFwAAMb8kvAqH90CsVhTL5rBjFVVswBtLVZ2wRWIbk1jjEBAbCsfP6LxsAsJGoVzGOokrUNINqjXoNpuyfhZX9GJxzzjgpGZYG8YwQDE4LPX3oUcvjfL0GkKfwLuZfJT72cfe4lo1dvWJidZKPeVViP+b9JNWPW6iyWhUQum+QJGg6trJS2LIXAbEspVc/1Gi4oGkfUC5F2cqHemg8jvRstghbKGmXGiZe/HHFrwRq+Gp5Ol2NkO+SRW5NfLeYMsZyoDNem9mUo4oNWcyUcsnQ+53Txj3pr+bc8Ha8RqArl4OLKQ5v8E0OzF3HeFR1sevKTdVSlPfd5xBj938I5mRKTVNgekGme0++TPjA3ee4gQchWX81DG3/fE5r9BxqeFGMCCIO+fC2SuCllFzdkc7cuNLBdAUzC273NTVGKv7VOvSeKse/0ZI5DJce5mw019NQuEupO87hGi2CWxATiJH0wU2Y5Zl7TElc+q/kEYpnsrs4Fx0nDFECjVOIkMsJvLshEGBlc301EyyoaxdpyhEiYp0iDqOHYGnxHve/J5ks4A3JzWWSQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(336012)(31686004)(426003)(47076005)(110136005)(16576012)(86362001)(40460700003)(36756003)(316002)(54906003)(2616005)(356005)(31696002)(81166007)(36860700001)(53546011)(82310400005)(186003)(82740400003)(26005)(5660300002)(44832011)(478600001)(41300700001)(4744005)(40480700001)(4326008)(70586007)(2906002)(70206006)(8936002)(8676002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 09:15:04.9210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d34b78e-8d83-434b-afeb-08db25feee1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8311



On 16/03/2023 10:09, jiamei.xie wrote:
> 
> 
> From: jiamei Xie <jiamei.xie@arm.com>
> 
> Add a new config parameter to configure Xen static heap.
> XEN_STATIC_HEAP="baseaddr1 size1 ... baseaddrN sizeN"
> if specified, indicates the host physical address regions
> [baseaddr, baseaddr + size) to be reserved as Xen static heap.
> 
> For instance, XEN_STATIC_HEAP="0x50000000 0x30000000", if specified,
> indicates the host memory region starting from paddr 0x50000000
> with a size of 0x30000000 to be reserved as static heap.
> 
> Signed-off-by: jiamei Xie <jiamei.xie@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


