Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24071783C5B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 10:58:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588293.919816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYND9-00060D-4q; Tue, 22 Aug 2023 08:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588293.919816; Tue, 22 Aug 2023 08:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYND9-0005xF-1o; Tue, 22 Aug 2023 08:58:03 +0000
Received: by outflank-mailman (input) for mailman id 588293;
 Tue, 22 Aug 2023 08:58:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gYve=EH=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qYND7-0005x9-7Y
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 08:58:01 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e89::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd97bc6c-40c9-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 10:57:59 +0200 (CEST)
Received: from MW4PR03CA0284.namprd03.prod.outlook.com (2603:10b6:303:b5::19)
 by PH0PR12MB8030.namprd12.prod.outlook.com (2603:10b6:510:28d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:57:55 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:303:b5:cafe::10) by MW4PR03CA0284.outlook.office365.com
 (2603:10b6:303:b5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 08:57:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 08:57:55 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 22 Aug
 2023 03:57:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 22 Aug
 2023 01:57:53 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 22 Aug 2023 03:57:52 -0500
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
X-Inumbo-ID: fd97bc6c-40c9-11ee-8782-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPGSt5fHqz96ha+WACImhWpsTxe0v2dLHr6iNfEz+eaht7JXzJ2xj3IHz6Ho4tLP/kQkeziiPH20/GD9aZiy4A9kuCLnN2P7xaK16UV6Em2ElVBwvWN0iVLkSdcDcWIIGz/8VKm7uy5M2JouLd4HvciNhg9aEgMI4ma6Q0SzhEa/w31OH99bRmXV3Ip23dx3wSnXkDvU3PhWeqM5kkmcNOjWHzxVEn7PDqXsei+06zICli92bSGoPLKOasBu7kpH8BizQ8EROZ7aLjHiV4O0Z0sD8QxZV0uamVBS0tGpeRSg+grS32CVlQuOn1zDqtdVATqZ96p7Fh3bcnF1UBPmQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnVzyT1WPT4U0usZ1u/xD0TWAPwoR3r4QSUfbYF69eY=;
 b=c04yLtJbwr8Zo/BgJeOo+iUBH+gFJihlZYGeDU10faXp5z1gj98lVLGkFIzj6cjrhl7Ce7F6bklYMAB5v6UNF0aQX1yvSDVv5z1cjQydLD+s/TAcEmyfg5dgJFlvL8qp8EYNEl6DOPoIJivJVn77zP4xduuK0BaSVXFUZFJl7erQgSw850bq0tftmZoe/e5wqtPCz6uyT5WiDv7FS+4Ml4vxBXjuQlJlxWLqVYUqt9z9u2cKW3ak/xwgDXo+y80y6OAFyKbQGzknoIgxoeRl6X+j730z/A9bQe0IQADlaZs1HTR1R5reaX8TjAS0OoevmZmOihiGsCTNKfWORYaaLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnVzyT1WPT4U0usZ1u/xD0TWAPwoR3r4QSUfbYF69eY=;
 b=wGgXsyudGqyFn1gHmVnIS8DQiJcbm7r8G+YKWiLQuTnWqBk5j1LZ5t11BgVNBmFRTbhn43F/WwwA9ncTRE/fPs53oICanmMefGyVM9I15k164MsAy1qn6jvR/fBl4XK0eS03wCRzgRRUF1gEUZba1TNSjwAtQJDQe3lDOxX4trI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c26aeffa-9d41-ad7d-b006-bd4ea8ab7f40@amd.com>
Date: Tue, 22 Aug 2023 10:57:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 0/8] Follow-up static shared memory PART I
To: Penny Zheng <penny.zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230821040046.2965665-1-Penny.Zheng@arm.com>
 <6fcbab6a-7126-21ee-e1bc-aa7ba2b07fc0@amd.com>
 <1fae4dde-f1b5-fa13-d021-3bdde7184fbe@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <1fae4dde-f1b5-fa13-d021-3bdde7184fbe@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|PH0PR12MB8030:EE_
X-MS-Office365-Filtering-Correlation-Id: fa01415e-173e-4ef6-21e3-08dba2eddff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7Ko5VkNJRIC0aLAmoSXtnTY2773+Byap6v82OzySs0JRJHLHI1RyXGJXJZa3I0VQdr4/IKrwuFipoTj5mO7Eip69YdoGZSQO3mnhx5fkVIf37Pfio/l/wrfe9usXCMyDd/4xy2PJnD0V/uAJxpbYlFfLgiLA6y6KFx2J+xByJH5ZmriGxcq3bsgLIlzCFSPWhX06a6VEtb2vUJB/i+3YAdBRMwsdLHSKVuxu1uyIYYTI69CsK3Xb0HL9tdIquY+/7Pa1pans4h1tC8LO6z9FOfbjOKoLLHV0m8jZHswrh6UlRL2FbveFP/TnCcQUvm7FsAtjwFgYNVQQGCgii3Y3nRW0FoEN2Lf/FNhJdGbWaOUmz2quVsGnA419ApS13DtQixAMJ8vJ3hwWRuGWWGk0bohTQD/pqr4Zjh2OrCmepVFhu9/hOwkwcO5dXTLB9b0SIxDUi8kJ7VTyCc2rK37MhkWHhtHMfKzzx7UFHzL5+v7oGUEyQm3jMz08/sIA/908/We/zTtOdeMMRaU1Xu+Gm5fB7I3ffVXwdCRb8YEUCj4bPP0i9DT5BrOt4hTfairR1AcaXII+LG/kQ2C4hB8ql93B5JalzyNLSbE50v9v/b1lN9RWIFt/KuKS0RyE9WX3T0Ve3RE9rzR7eJPKNdPP7b80NVptwhfWPAnOd7YskVVzLD9cD0DiZ8lMl9ZKCIBNciwbx3eu6p3DGyTItRZgX6hyUjMgxm2dM1d4xqgp5qXwvJiWCMdcqN8yu9yFFm1OEFEesE5ZOoLxrF2AdzKJlqZnUJisEC9KuhnP5u5Gwn3LUgkUDg2bFMK2teBZG6sHV+Dn1X3MfpDeEUEhON/1MA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(346002)(376002)(1800799009)(186009)(451199024)(82310400011)(46966006)(36840700001)(40470700004)(54906003)(70206006)(16576012)(70586007)(316002)(110136005)(8676002)(8936002)(2616005)(4326008)(40460700003)(36756003)(41300700001)(82740400003)(356005)(81166007)(966005)(478600001)(6666004)(53546011)(40480700001)(83380400001)(2906002)(86362001)(31686004)(47076005)(36860700001)(31696002)(336012)(44832011)(426003)(5660300002)(26005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:57:55.0089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa01415e-173e-4ef6-21e3-08dba2eddff9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8030

Hi Penny,

On 22/08/2023 07:32, Penny Zheng wrote:
> 
> 
> Hi, michal
> 
> On 2023/8/21 18:49, Michal Orzel wrote:
>> Hi Penny,
>>
>> On 21/08/2023 06:00, Penny Zheng wrote:
>>>
>>>
>>> There are some unsolving issues on current 4.17 static shared memory
>>> feature[1], including:
>>> - In order to avoid keeping growing 'membank', having the shared memory
>>> info in separate structures is preferred.
>>> - Missing implementation on having the host address optional in
>>> "xen,shared-mem" property
>>> - Removing static shared memory from extended regions
>>> - Missing reference release on foreign superpage
>>> - Missing "xen,offset" feature, which is introduced in Linux DOC[2]
>>>
>>> All above objects have been divided into two parts to complete. And this
>>> patch serie is PART I.
>>>
>>> [1] https://lore.kernel.org/all/20220908135513.1800511-1-Penny.Zheng@arm.com/
>>> [2] https://www.kernel.org/doc/Documentation/devicetree/bindings/reserved-memory/xen%2Cshared-memory.txt
>>
>> It looks like there is a problem with the changes introduced in this series.
>> The gitlab static shared memory tests failed:
>> https://gitlab.com/xen-project/patchew/xen/-/pipelines/973985190
>> No Xen logs meaning the failure occurred before serial console initialization.
>>
>> Now, I would like to share some observations after playing around with the current static shared mem code today.
>> 1) Static shared memory region is advertised to a domain by creating a child node under reserved-memory.
>> /reserved-memory is nothing but a way to carve out a region from the normal memory specified in /memory node.
>> For me, such regions should be described in domain's /memory node as well. This is not the case at the moment
>> for static shm unlike to other sub-nodes of /reserved-memory (present in host dtb) for which Xen creates separate
>> /memory nodes.
>>
> 
> Hmm, correct me if I'm wrong,
> If we describe twice in domain's /memory node too, it will be treated as
> normal memory, then any application could use it. The reason why we put
> static shm under /reserved-memory is that we only hope special driver,
> like static shm linux driver, could access it.
> 
> If you track down in make_memory_node(), only memory range that is
> reserved for device (or firmware) will be described twice as normal
> memory in Dom0. Memory like static shm, will get passed.

Reserved memory is a region of RAM (not MMIO) carved out for a special purpose which can be used by a driver for e.g. shared dma pool.
Therefore, such region shall be described both under /memory (used to present the total RAM and reserved memory is in RAM)
and under /reserved-memory. The OS parses /memory and then parses /reserved-memory to exclude the regions from normal usage
(there is also no-map property to tell OS not to create virtual mapping). So you do not need to worry about OS making use of something we marked as reserved.
This is exactly what Xen does if there are regions described as reserved in the host dtb:
1. Xen parses host dtb, adds reserved regions into bootinfo.reserved_mem so that it will not be used e.g. for allocator
2. While copying nodes from host dtb, Xen copies reserved memory nodes to dom0 dtb and only maps the regions in p2m without permitting iomem access
3. Xen creates another /memory node to contain the reserved memory ranges

I guess static shm is not exception to this flow. It is part of RAM suited for memory sharing.

> 
>> 2) Domain dtb parsing issue with two /reserved-memory nodes present.
>> In case there is a /reserved-memory node already present in the host dtb, Xen would create yet another /reserved-memory
>> node for the static shm (to be observed in case of dom0). This is a bug as there can be only one /reserved-memory node.
>> This leads to an error when dumping with dtc and leads to a shm node not being visible to a domain (guest OS relies on
>> a presence of a single /reserved-memory node). The issue is because in make_resv_memory_node(), you are not checking if
>> such node already exists.
> 
> Yes, you're true.
> In Dom0, we could see two /reserved-memory nodes. I think, if there is a
> /reserved-memory node already present in the host dtb, we shall reserve
> it in kinfo for make_resv_memory_node().
This way you will only take the reference of a region but what about all the properties, node names, etc. that you need to copy?
This is why Xen first copies the reserved memory nodes from host dtb and then adds ranges to /memory.
In our shm case, we would need to insert the shm node into existing reserved memory node. This is a bit tricky as you can no longer
make use of fdt_{begin,end}_node and instead use the helpers operating on offsets.

~Michal


