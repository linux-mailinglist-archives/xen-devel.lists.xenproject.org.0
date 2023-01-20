Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9A367578C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 15:40:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481837.747002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIsZN-0003Sj-F9; Fri, 20 Jan 2023 14:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481837.747002; Fri, 20 Jan 2023 14:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIsZN-0003QE-Bz; Fri, 20 Jan 2023 14:40:41 +0000
Received: by outflank-mailman (input) for mailman id 481837;
 Fri, 20 Jan 2023 14:40:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUaQ=5R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pIsZL-0003Oo-Pq
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 14:40:39 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2083.outbound.protection.outlook.com [40.107.102.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6667a0b0-98d0-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 15:40:36 +0100 (CET)
Received: from BN9PR03CA0408.namprd03.prod.outlook.com (2603:10b6:408:111::23)
 by CY8PR12MB8313.namprd12.prod.outlook.com (2603:10b6:930:7d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 14:40:34 +0000
Received: from BN8NAM11FT092.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::7a) by BN9PR03CA0408.outlook.office365.com
 (2603:10b6:408:111::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27 via Frontend
 Transport; Fri, 20 Jan 2023 14:40:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT092.mail.protection.outlook.com (10.13.176.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Fri, 20 Jan 2023 14:40:33 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 08:40:32 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 06:40:32 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 20 Jan 2023 08:40:30 -0600
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
X-Inumbo-ID: 6667a0b0-98d0-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdmQSs4PigCpDhlEGurgvx0aPsunO8pYfJPbSlUmta+D2WxpHeHMvT7ELnrtQ04t2U8CE7hMR2d6gCdavYknpCjM8YpdHTARgEVpsoeOlwFdbEXwzURAIdY06MRTkf6Oh/jdrWpSb6fdCViZHRvjfqr2Oc8tMlBZU2hfL1xnPJOPjqNo0+Dfz2UXLY0C/p2w4WtgGWOcw+sUOO2HF2dXx0TwqKoSsuUNuga6LYGKUsqeUP/BB6H/23EZIEaeexunH0SaxfpawRbPc9kDhO1mF4pnr/pcITAchwFZkY7wP96k80CFSGeSGTJLoI+rTFv0RhA/IPeWwKmjYxx3MA2mCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSkRRpoOwtmAPbRvNaRj9rkrGYQoBV4WMN4Ek7MbAV8=;
 b=XqUgdQ2zXZvxJ9PYfpe6gyUgWT8QpsGLJDZ9CYGcDhOIPOZ0idlBHzrWfXNFu39Cx1kSe1Q/Yvp9bZmwhx6lc649PMyy6a8fLolK8/SlVNoWW17KiuWKVMyqcebs6s2Scrqhrp0egmpr99ZNWsrIpRtv8/ulFn6OGw/fCW8kgsS7+s+v95TedYALPXm0StRRk61WZ4np6fz9HnrTsfi0IQxniqftV2o/s3y4f+sq9ZEg7NBM/D0KXpaLP+nJPYEksOioMVg20KDn3IU3uNid6ig2cw4Vjf5rFynF5rKSKIWbDwS6w7Uki1JWByIpn84TOIj/sGB4kcbRiC+ed4jD0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSkRRpoOwtmAPbRvNaRj9rkrGYQoBV4WMN4Ek7MbAV8=;
 b=N78iP84cJEkXBBasgfjslKdB/LD54yhBugX6dHoaXmbNyJnVLRp9GpYddnXr1qPbYV026bT+7yGcw6T0ymBY+1kyuWyffVsPKG6rfW/r9uBsb8r8C3z/qjNA62lInAvTPSYzVai3OsBFdOKmk6tppX3f7vvRXjotdnK0SPDyzWc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ba37ee02-c07c-2803-0867-149c779890b6@amd.com>
Date: Fri, 20 Jan 2023 15:40:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN v2 02/11] xen/arm: Use the correct format specifier
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: <xen-devel@lists.xenproject.org>, <stefano.stabellini@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-3-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301191454080.731018@ubuntu-linux-20-04-desktop>
 <c7e5fbf3-9e90-7008-0299-f53b20566b9a@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <c7e5fbf3-9e90-7008-0299-f53b20566b9a@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT092:EE_|CY8PR12MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c3aca74-301d-4d15-32c3-08dafaf44939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hseYbAtqncXOoDhyEzqVnRi37Luh7shP+CMyCR/qcbpfi2BTU2HZTsPZGocoE5K8O+HJRRP4qu4jLAmXo2FkEntsRUTbtkqy0u87COlOuTWRXZnkkNEXxEE7lXhbebqqnkN5CHIx9j68MuaZxJZu3PysHzDXdEJUHQvoKKK4xHskCBd3i37wm1TcPHUwRD/PBzxdthn7FFuaLj8bc4L99zcSMjw57KRKAD7ikLNLzWO5CEZYo+RzwHlidZKA3KNHxFMbfVW0SBi8jZvQRtBJOjNp4kY9WNAqrWoFWdBO1Tu1thgR6FytVb/srmDBhR9dLgsD5UNfqXoCYaDp+PbSBvQ4TgkSu0OoGLABtE1u45EopYcbZ8wwUUc3Xb0crDxvAaaWVYhAbqhnHAWGSIidxp4uT+njlAOpmKahDe+IoDMyhOEX4uTt/NA4ImaxFK/5IHQ3sGS8qTx3QRmYFRWxMoboHEoyyGvSc2w9kApIeeGRQTIlKd490UBizDwSz5khsrLRTH9FMt9KVq+pfmFAphbvtnB0BawsDjCKfKpZD3Uvh3/k/sQFeR1hYVP2CDVcduAEwiSK3oggn+QEynTHJc7IorB3ghsXsYnBYpwIN2BN+Ff5N9XUFiHP3jWVyZDbSSPAigVzsQUjTR0X1s/06qdLnnQr7bAnuI/6KULh+5vOrFx+wjmHndgP1PT6ENOJ7TBH2m8aCh1LEhXqQ4ESpx5ze7Z6qDO/LfSnnu14E91Jp5/2QnIAde9ZYKUlkTdkWQX+tdpdzw35VIJiY56NiHgqU4/qwok8+p8NwsWEGZU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(40470700004)(36840700001)(46966006)(44832011)(5660300002)(8936002)(31686004)(4326008)(82310400005)(8676002)(70206006)(70586007)(36860700001)(31696002)(53546011)(6636002)(26005)(186003)(2906002)(110136005)(54906003)(966005)(36756003)(478600001)(316002)(16576012)(2616005)(41300700001)(356005)(40460700003)(82740400003)(40480700001)(81166007)(86362001)(336012)(47076005)(426003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 14:40:33.3327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3aca74-301d-4d15-32c3-08dafaf44939
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT092.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8313

Hello,

On 20/01/2023 10:32, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 19/01/2023 22:54, Stefano Stabellini wrote:
>> On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
>>> 1. One should use 'PRIpaddr' to display 'paddr_t' variables.
>>> 2. One should use 'PRIx64' to display 'u64' in hex format. The current
>>> use of 'PRIpaddr' for printing PTE is buggy as this is not a physical
>>> address.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
> I have committed the patch.
The CI test jobs (static-mem) failed on this patch:
https://gitlab.com/xen-project/xen/-/pipelines/752911309

I took a look at it and this is because in the test script we
try to find a node whose unit-address does not have leading zeroes.
However, after this patch, we switched to PRIpaddr which is defined as 016lx/016llx and
we end up creating nodes like:

memory@0000000050000000

instead of:

memory@60000000

We could modify the script, but do we really want to create nodes
with leading zeroes? The dt spec does not mention it, although [1]
specifies that the Linux convention is not to have leading zeroes.

[1] https://elinux.org/Device_Tree_Linux

> 
> Cheers,
> 
> --
> Julien Grall
> 

~Michal

