Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E17BD6F6D6B
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 16:01:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529788.824572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puZVl-0000tk-Sj; Thu, 04 May 2023 14:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529788.824572; Thu, 04 May 2023 14:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puZVl-0000rA-Pn; Thu, 04 May 2023 14:00:45 +0000
Received: by outflank-mailman (input) for mailman id 529788;
 Thu, 04 May 2023 14:00:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=evI0=AZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1puZVk-0000qe-5c
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 14:00:44 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e351b29-ea84-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 16:00:42 +0200 (CEST)
Received: from MW4PR04CA0275.namprd04.prod.outlook.com (2603:10b6:303:89::10)
 by SN7PR12MB7881.namprd12.prod.outlook.com (2603:10b6:806:34a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 14:00:39 +0000
Received: from CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::9c) by MW4PR04CA0275.outlook.office365.com
 (2603:10b6:303:89::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26 via Frontend
 Transport; Thu, 4 May 2023 14:00:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT087.mail.protection.outlook.com (10.13.174.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.26 via Frontend Transport; Thu, 4 May 2023 14:00:37 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 4 May
 2023 09:00:33 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 4 May
 2023 07:00:16 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 4 May 2023 09:00:14 -0500
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
X-Inumbo-ID: 0e351b29-ea84-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ak0MoNIYap4A0M0CeK7zlTBhhTMgl1lWLzlB/vXKbhLFRULVAN9wdoGmKRwlc/v//0uAsPUE0YnmTi5Acklrqyf92wFi2IDaMk3gk9bOLqCQQSFL3YT/u2poem9NhVaQt/Y3j5sf1XIeiTeQgFpHuT6dh5vVc6FA0BlWVi1/zcQe3UkSAMZpgwJDZlFEBW1yY2lLy+crpzltlh6YTxKP0qIogQuj3RWBpa3BUo5cYnp93OP8xBMH21C/FiZ6emXQPIzffr1envQcUuXp3X7heBU4mfhQmTysO4qVB8MI+PhwPtwrKwOLeD+IH4g71JV0Bz1sIknYkH7V4fjHruPz6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/o1q/uGkkgP51iWgzuz8DL/hnCZg7fL5E1OxJ1E/Cg=;
 b=JYi5wBt2HfiFLLEcFGjdC5YM/7sabVMHyJsg2nQ1JljkBWRvSvLlCuZr6/m36S4H/LYsjh2EaZDg/++b9W4jHupE3P4MMydb7yZxg/CoyEHOvqgC5m2+KvPbdQMJANfQKfCAdTKzd0LJxKSBWj21MZP6ekFa1HCQt2TANSaeb+SOPKh4J8WooulI7CsFtVBDHkPGkDz/U4WvNtPxfrWf9zb5zQv2Z/1i7wqVWjxJDBny9GVbOzh1uoiW59DrT7JT6h2/eNyZclzOZOuFyo6NSxJvlxXeAcdSKuUmRutV9si2BVCU1p/5LbtkkaCnnZRuSG0HpWSZ0gYiyjJVLU+5mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/o1q/uGkkgP51iWgzuz8DL/hnCZg7fL5E1OxJ1E/Cg=;
 b=rrFKZbTlY58VKyxx99YsZFV1dUWLye9Nv3b5grPIPNOa2rThvOYhK3AQDlUBWtGnPwDM/fw6AkUnRvkwYql6x1n4C2/netTX/TydmJO1eoeUdzM4QeVYojC74ux+K6iHYClzNIRreFG0iY14IRy0xH18PqY0Bc+M+DN/pMDHbC4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <90c14bae-5071-fa19-7e94-307e939e8b9f@amd.com>
Date: Thu, 4 May 2023 16:00:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [XEN v6 08/12] xen: dt: Replace u64 with uint64_t as the callback
 function parameters for dt_for_each_range()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
 <20230428175543.11902-9-ayan.kumar.halder@amd.com>
 <d515c3a5-9473-3cde-2838-a20875aa1181@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <d515c3a5-9473-3cde-2838-a20875aa1181@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT087:EE_|SN7PR12MB7881:EE_
X-MS-Office365-Filtering-Correlation-Id: f93005e2-296d-45ce-4c16-08db4ca7f020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1/RkK+FkGSRePVTC3mYXXZMAUEkfoh16ILTKrVXx3dheHWT1oLzCgcJldFHRei1npPvbpRJ5oN8SpKyG19gNLUAh40EmaazBiBy+BRCx/GY3OugtSahryhCIjSqeObzVChcuLVAoaIyKdhV/6Q6v3mdjXULxzjJzPYa5lB1SJrpvNMfwo/yZpK0KGLdsGay2I0Ko3LFk71dXsweUra+dRD5pk1+po2UphxgsCXkweyNQwMv3472ehlXWRcCcVf+AmfHYKNIxpr7MpElQ7TriPwX5vbkgaCqPoVXNd62HRQtchnYm1d/KWQXid/GuQV4z1SdQho288cpOm5DaFIArBWpC4tdfqUOQs61GiLgg+r9cwNiptC9T93oSOILriqZRyE1kxKltVCEwk4X7J+z2qM/1g+cuoyxgY4FB4n4j2922F2LCyRCLXW6ryCV8uGQIwS/FTXSN4O4mJ82j1WAVT4Y/yL0tXbAbXgTvCPP/SR2tD2zEj44Z4G+JZrswXBvQUw3e4MX1Py6Y1agCGAA6kGsjDy6fFDBZr3sJ8q1zPasSVj6huUoXtT6WwYFY+BUkL/6+cXPuFo3su7TDteNn711P0gHxigS3IRDo921KPBbzQp0PhWwhO7BC4By50h0AniSHaW7oT8GjU7Uzo0j5Ra8yOZfsQOUv0v8rSWuNNHYZ80AsMvFQ8KN0m3uuPGRyRc5TMEb/vFs6GcS9kGHlskvgshRWpFC3aV61cBBTcFTUziUrgWCah3ahDWz1n91TO6AuACEzWdNZJC7fskLiZw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199021)(40470700004)(36840700001)(46966006)(36756003)(7416002)(40460700003)(44832011)(478600001)(356005)(81166007)(40480700001)(8676002)(5660300002)(8936002)(82740400003)(110136005)(86362001)(54906003)(16576012)(82310400005)(26005)(31696002)(70206006)(70586007)(47076005)(426003)(4326008)(336012)(186003)(53546011)(41300700001)(2906002)(31686004)(4744005)(316002)(2616005)(36860700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 14:00:37.2767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f93005e2-296d-45ce-4c16-08db4ca7f020
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7881


On 03/05/2023 14:08, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 28/04/2023 18:55, Ayan Kumar Halder wrote:
>> In the callback functions invoked by dt_for_each_range() ie handle_pci_range(),
>> map_range_to_domain(), 'u64' should be replaced with 'uint64_t' as the data type
>> for the parameters.
> 
> Please explain why this needs to be replaced. I.e. Xen coding style
> mention that u32 should be avoided.
> 
>> Also dt_for_each_range() invokes the callback functions with
>> 'uint64_t' arguments.
>>
>> There is another callback function ie is_bar_valid() which uses 'paddr_t'
>> instead of 'u64' or 'uint64_t'. We will change it in the subsequent commit.
> 
> I would rather prefer if this is folded in this patch.
> 
With the Julien's comments fixed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


