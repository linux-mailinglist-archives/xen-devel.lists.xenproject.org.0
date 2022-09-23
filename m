Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDE25E802F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 18:54:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410913.654089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oblwc-00006P-4K; Fri, 23 Sep 2022 16:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410913.654089; Fri, 23 Sep 2022 16:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oblwc-0008VO-0u; Fri, 23 Sep 2022 16:54:30 +0000
Received: by outflank-mailman (input) for mailman id 410913;
 Fri, 23 Sep 2022 16:54:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tkvz=Z2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oblwb-0008Tx-1v
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 16:54:29 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6189a1fc-3b60-11ed-9647-05401a9f4f97;
 Fri, 23 Sep 2022 18:54:26 +0200 (CEST)
Received: from DS7PR03CA0104.namprd03.prod.outlook.com (2603:10b6:5:3b7::19)
 by MW4PR12MB7381.namprd12.prod.outlook.com (2603:10b6:303:219::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 16:54:23 +0000
Received: from DM6NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::a3) by DS7PR03CA0104.outlook.office365.com
 (2603:10b6:5:3b7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20 via Frontend
 Transport; Fri, 23 Sep 2022 16:54:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT093.mail.protection.outlook.com (10.13.172.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Fri, 23 Sep 2022 16:54:23 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 23 Sep
 2022 11:54:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 23 Sep
 2022 09:54:22 -0700
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 23 Sep 2022 11:54:21 -0500
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
X-Inumbo-ID: 6189a1fc-3b60-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8v1/a5MQxb6ogjPBdle/gCsiDoviw+B9ZIQPcHNbovsfqtFT3vVk+Z9xISBwYjaSaglaRfvu0HF13WzV9GbzY6vTy1wCpmn/nIWDCCNnsuf5zLTsIF7IX7/NUcMpL12i/E/bNdZulk/glVDnUxYqfrq+ZRrUIVedopqmRTsovx2ctw2CR6iObvJS8znFE7q/YGL0PasAdC6IUZWCG/u86G0MaMjEURXoDbQDFQWv9vyLn+072xlv3NhdtY+yxuZYoysmi4y9b01sDVRdMivLxkHnjKFMatTJo0VJgNpNxIJ3cPp8wdip3oKstZbGzh89z+6iUpGPULEfE/EBcLDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/84mrTy8Gz/O+FbO4cOOrEwPyqAT29gEBaIaLH50kY0=;
 b=mGF65qb6CVrurOLlM9kdDYXd/PfiSnkqwTefNCrUWntRRsY+8amkS7Qqbz7ZNqBVKZscL5iCH+kjY/aD0x+fkgu/ypu5LC5dfWpXAn1DRFQPS0kjef9EFRduzeVxXYNM5TDSBtNWMhQ0N8gf5PemG0Cu9BE9PVeJt0KMQErDWlu0hHmWmr5FIoi/TOiT2+61r838EwHSvfL9oh1Xw3roo8zvjei+oEGWcbP1gR4AXFPdSmuTXNqqCjyjCEUBRk5oUr+eQzMJEerOhS2Ri3K+EbcSixaTDjdkJ6cZWBz8OkVG97+DRnPl0LP87zZUsvwKlPgd5zMiGlBeOGrJyWyKzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/84mrTy8Gz/O+FbO4cOOrEwPyqAT29gEBaIaLH50kY0=;
 b=q07jdqvGaoRDOhWs64s1TPZfcf927e9hn6KwZKJGDI95azg5N/JsCWIEYV4ZBIdSBmif9kKcHyVkVohA8uKTpHtK0/c3C9cjz/JqiK+tIAhm1wFj1tVr+JaOM0le6CEUzhzhn+gLMTqObyXheRvog9sQAYOv18ozSV/Lkv64dNw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <52a75038-7aa0-fb2e-6f4a-1cb749e886a6@amd.com>
Date: Fri, 23 Sep 2022 18:54:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 4/9] automation: Add Arm containers to containerize script
To: Anthony PERARD <anthony.perard@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
References: <20220922134058.1410-1-michal.orzel@amd.com>
 <20220922134058.1410-5-michal.orzel@amd.com>
 <Yy27D62mvY3nQENI@perard.uk.xensource.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <Yy27D62mvY3nQENI@perard.uk.xensource.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT093:EE_|MW4PR12MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: 910b77c2-0b91-4a27-eb39-08da9d844485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wshsVP7x0OXif4wyBxGZD1jAxT23gdhbnxqhBIA4sYC+DuUgU5zPKOWqFSsEsXrH+Xm+3vxh6wa8Dh/wAXdX89vbIcikmvXKOQEusGOB7D846Q37KoWTfUAsNrPHgTt2a0lO8L+jhUVJJG7jlmrnxueZLofXmTfjr+kZygVEbKqp20ZD9bi6TpXZLcxqPCHnsUJtEQSEnkdFgvS/mm2HQiJFN4JotG7wjPw/J2vF2N2QovWxOcAbD4iMPYHVCkitTRhbRg6TVciH0JQeRvgIKSeKyxnuWMiiAa826DCZSnLJGt5EUgVPZrfSywHvdNzOilZwG4PO5w1bRlDI59d+yDbn+SXeNGgJxSo7PN3H0c75xPiKVk02hcdmTf8MPVgaVcbUxvR5i4VqSidQYFKY9JOm4MgwrDvcoh7yIOOIgPEmjLAnErK4DWeUIZNgtSZ0j2otBZ8dIOcZUXIGD7KgkkLz9DEm/6e3XRPZzi62acE2970RQEUZ/2Z8lsHHfWbVNiOohtFFmqMr9iQqGcMc9YN/NIE+zuoyqL3FwLCNbxEwDvhD77l8Esd+FFTHWEO3NwxxpwKiQvfRisDUPuILhycSx/sCqxFamaA+kQU8Ctk6LQlCFs+p3KIvz2z1d1Dy5xl853BVybc4SRu8Lb+huZHmNWdoV534WGs3XgrrSPhMc3lt5JC7Z9sVTJS00wYwl/XMm/I0VOfU5ae4SwkTl1bOJN9CM4gak2Vmk4YCTCWYOsYKJ5/QJfQcrlaVryJzzR5kPhdXV/HiUcXN4mp9SgeUZkSF/uZp1CiP1G215P6v0+EsYGwDIaPM8xi322Hu761hYSTkwYonN9RXBR+GQ1aqfMWdb2fsoAJillYWoqM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(47076005)(5660300002)(81166007)(84970400001)(44832011)(86362001)(54906003)(316002)(31696002)(16576012)(41300700001)(6916009)(53546011)(82310400005)(966005)(4326008)(478600001)(36756003)(186003)(336012)(8936002)(82740400003)(426003)(70206006)(70586007)(8676002)(26005)(2616005)(40480700001)(40460700003)(36860700001)(31686004)(356005)(2906002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 16:54:23.6280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 910b77c2-0b91-4a27-eb39-08da9d844485
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7381

Hi Anthony,

On 23/09/2022 15:56, Anthony PERARD wrote:
> 
> 
> On Thu, Sep 22, 2022 at 03:40:53PM +0200, Michal Orzel wrote:
>> Script automation/scripts/containerize makes it easy to build Xen within
>> predefined containers from gitlab container registry. However, it is
>> currently not possible to use it with Arm containers because they are not
>> listed in the script. Populate the necessary entries.
> 
> FYI, those entry are just helper/shortcut/aliases, you can use any
> arbitrary container with the script, it just more annoying.
> 
> Your patch here allows to write:
>     CONTAINER=unstable-arm64v8 automation/scripts/containerize
> but you could write the following instead, for the same result:
>     CONTAINER=registry.gitlab.com/xen-project/xen/debian:unstable-arm64v8 automation/scripts/containerize
> 
> I wonder if the script could select the right container base on the
> architecture of the host, because "alpine" and "alpine-arm64v8" will not
> both work on the same machine. It might be nice to just choose "alpine"
> and the script would select the x86 or arm container automagically. Just
> an idea, no need to do anything about it.
I'm not in favor of adding the automatic selection based on the host.
The reason is that on x86 you can run both x86 and e.g. Arm containers.
You just need to use register qemu-user-static [1] to perform emulation.
This is something widely used and I use that to test Arm images/containers on x86 host.
So you can run both alpine and alpine-arm64v8 on the same machine.

> 
> (patch is fine otherwise, just the patch description is a bit
> misleading)
> 
> Cheers,
> 
> --
> Anthony PERARD

~Michal

[1] https://github.com/multiarch/qemu-user-static

