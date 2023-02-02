Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AECD687C69
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 12:36:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488762.757001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXt8-0007Eh-64; Thu, 02 Feb 2023 11:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488762.757001; Thu, 02 Feb 2023 11:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXt8-0007CN-3O; Thu, 02 Feb 2023 11:36:22 +0000
Received: by outflank-mailman (input) for mailman id 488762;
 Thu, 02 Feb 2023 11:36:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8a/s=56=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pNXt6-0007CH-NG
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 11:36:20 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe59::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc4b33b6-a2ed-11ed-b63b-5f92e7d2e73a;
 Thu, 02 Feb 2023 12:36:14 +0100 (CET)
Received: from DM6PR04CA0021.namprd04.prod.outlook.com (2603:10b6:5:334::26)
 by DM6PR12MB4330.namprd12.prod.outlook.com (2603:10b6:5:21d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Thu, 2 Feb
 2023 11:36:11 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::3a) by DM6PR04CA0021.outlook.office365.com
 (2603:10b6:5:334::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25 via Frontend
 Transport; Thu, 2 Feb 2023 11:36:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.25 via Frontend Transport; Thu, 2 Feb 2023 11:36:11 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Feb
 2023 05:36:10 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Feb
 2023 03:36:10 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 2 Feb 2023 05:36:09 -0600
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
X-Inumbo-ID: cc4b33b6-a2ed-11ed-b63b-5f92e7d2e73a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IesUDQu8yBkMglXG9eGxZpQfTktYe7RsB45Zy4e5IvdXbikwCuMXvnxpiH9CBYwES8FGU+woFAsQou/AKsoTEOz0E7+byezZnPtKAiIMQTMSKARbqkOTy0NDP6UKl2K2FUvv/abRvrI+ZaRqzhhEBXrUMsrooTQ65akPCcHkbyzcS0cp9yAZudEd1/6oKvEdlHpCQNnamQf3mwtxtIYBBqwEIDuca3/6SaK1vN+D3Jnry4wPBeqjV2UlgMpLLqp2yX1ivf2tlhCAzqt1gDNQKEqKRG9CJ2/mz6t+fj5PqR63TYGe8pYRAbNdLhIlQNpC1vdt/6dtzW9nMGDUB6GeDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVmF857VLxY7+N9tbF7LRK02QVtYsE24P1F2f4HL7P4=;
 b=HcRM9IC6RYm9SChHtc7s2CtzMCJ61amNnfT2oa/GpaisPn0YfxV2r48piLk35fkzFDtKZyqFRbcXVZWOfLhjfTmK4B4dGkEFWsAGJ6BeVDb56AUBxW51/l29DREtOl2fLjLtb2Wv4EKlrT+C0WzBh/M7Q+IcgY8xlb3sW+Bf6abU2iSmxdUw3yMOVdJYXfPnO1AYsxnJ/pwDqg18vcIaIhyduSOkgxF88yHLfEpMcTAh62UWoxujm+5lDTv3bvfpxH97qADB4yJGTJ0Smmf9Rs8r5qYlPsLEqlTcfBQ2qCPdmeHe3EtB+YUm80f4RsP6KbizPesDgkoI/KVF0Pn3Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVmF857VLxY7+N9tbF7LRK02QVtYsE24P1F2f4HL7P4=;
 b=c4YH6Oz1sHP2wj5u8ReI3fxQ3htiqUMmIepXIRC1HKOYtSszbyT+4yzvD87M4Y4mPn0veNAUAIoa0byYGGNkXU69+EJK8/lPnGXd0sMs4cWsXf6gskNh/s2ApFoE6aMkh+E9WGWzg34tRyj9r4QRsgYVA3M9EoFOgjPOdEbQ6ys=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d5e79328-1072-d716-ed91-34d0276517fc@amd.com>
Date: Thu, 2 Feb 2023 12:36:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/2] xen/arm: Add support for booting gzip compressed
 uImages
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<ayankuma@amd.com>
References: <20230202084905.6950-1-michal.orzel@amd.com>
 <20230202084905.6950-3-michal.orzel@amd.com>
 <3ef695c9-9b5e-3323-a901-d6daf030e07d@xen.org>
 <f3312bfc-f02d-f8e1-3a88-3b0570b745c0@amd.com>
 <d51773ff-8aab-6512-a75c-e2590eabe6b4@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <d51773ff-8aab-6512-a75c-e2590eabe6b4@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT027:EE_|DM6PR12MB4330:EE_
X-MS-Office365-Filtering-Correlation-Id: c41bd84f-d210-4eee-415b-08db0511af34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NGDVNA50RuSi8alZD+cxsohB3wTg1p9puxgetTfNyVoFrCb2C1WMDqFMA7KwawD1KE6bW/6HM5O3K5akZCe8V/7Xx3QWNzgYippjut9eEMYBM2nGkwzquejxrrZ05cfF2dfYGanvkoKk787L0O1it/1oCKKZTnoq32mc//3sq7KUG3HQS5ZmcGAw1qpzDKTus+gyqZDbUXANdr6h7Loqk6i3BnKTGZqB+rCchsVxEOudxPCJOvoXr3Vh/JGZapDtL5SZBqmr7dpP7sRtopocrBFr9qCNAZSCmVaqiYhq/vJFLJE5OQoSvyCjPV0IWlFmNry4Qe+55SpS4F3SnHYSd/+EKxjPsnqWu/xYCzWRlaCMTxyUIj0L+tyFb95S7b/t6mrzvhuwiH/XW0gyqwwSMF5GrKVn7unHv9VxW4RTduImYwGeBv2uSVxaVVoJfvT08jJE+dOYCIVmdxgrn1Xzn95deGIMSUAEJKVh27cnQAAThlIwshKr5JYYHbyiDba3fnlq6cqpsCBNS9zhHTvPFhGcM89ok+3YpBz0Y/SQubjlegZM9TCMv+L/uUdLya2Pea21h//0ZrsPPWkzVl6p6k2mg0GwE6CF92R5sr6htVoT+95J9Lq9UNYF50GvyANzv7YQv3HBYvpZtiqDX/vRCxrVdONdruQdouZzIQFvuXdRU/VMNngW2vEqOnEpEhsphPnNMiI++uj9Y7AOZBC+5zoXr19tmWlShQHriSjh9fkRjnhQ2NritB+OlOWkDV/rB/OBKeZAU3o/1DtMS1If5A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(83380400001)(31686004)(82310400005)(426003)(2906002)(336012)(2616005)(81166007)(40460700003)(316002)(44832011)(36860700001)(8936002)(36756003)(26005)(186003)(53546011)(47076005)(5660300002)(82740400003)(31696002)(86362001)(16576012)(40480700001)(110136005)(41300700001)(478600001)(356005)(54906003)(70586007)(70206006)(8676002)(4326008)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 11:36:11.4296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c41bd84f-d210-4eee-415b-08db0511af34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4330

Hi Julien,

On 02/02/2023 12:23, Julien Grall wrote:
> 
> 
> On 02/02/2023 11:12, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>>
>> On 02/02/2023 12:01, Julien Grall wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>> On 02/02/2023 08:49, Michal Orzel wrote:
>>>> @@ -265,11 +284,14 @@ static __init int kernel_decompress(struct bootmodule *mod)
>>>>    #define IH_ARCH_ARM             2       /* ARM          */
>>>>    #define IH_ARCH_ARM64           22      /* ARM64        */
>>>>
>>>> +/* uImage Compression Types */
>>>> +#define IH_COMP_GZIP            1
>>>> +
>>>>    /*
>>>>     * Check if the image is a uImage and setup kernel_info
>>>>     */
>>>>    static int __init kernel_uimage_probe(struct kernel_info *info,
>>>> -                                      paddr_t addr, paddr_t size)
>>>> +                                      struct bootmodule *mod)
>>>>    {
>>>>        struct {
>>>>            __be32 magic;   /* Image Header Magic Number */
>>>> @@ -287,6 +309,8 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>>>>        } uimage;
>>>>
>>>>        uint32_t len;
>>>> +    paddr_t addr = mod->start;
>>>> +    paddr_t size = mod->size;
>>>>
>>>>        if ( size < sizeof(uimage) )
>>>>            return -EINVAL;
>>>
>>> Shouldn't we return -ENOENT here?
>> Frankly speaking, I do not want to fall through in such a case.
>> If a kernel size is less than 64B, something is wrong, isn't it?
> 
> I agree something is likely wrong but this should not be the job of
> kernel_uimage_probe() to enforce this for everyone.
> 
> To give a concrete example, let's imagine we decide to re-order the call
> so kernel_uimage_probe() happens *after* an new header A than would
> require 128 bytes (the number is made up).
> 
> It would be wrong for A to return -EINVAL because the other protocol may
> require a smaller size. The same goes here even at least for consistency.
> 
> So if you really want to enforce a minimum size, then such check should
> be in the caller. Then each probe could return -ENOENT if the size is
> too small.
> 
>> I am not sure if Xen would handle a kernel whose size is less than a page.
> 
> I don't see any reason why it would not be.
> 
>>
>> I do not like the whole falling through in kernel_probe even in case of obvious violations.
>> But this is something not related to this series so I added to my TODO to properly handle
>> the return types from kernel_probe path. If you really think, we should return -ENOENT here,
>> then ok (although I do not like it). Could this be done on commit if you insist on that?
> 
> See above for an alternative proposal. Depending on the version we
> settle on I can do it on commit (but this is not going to happen today
> as OSSTEst is still blocked).
Ok, lets stick to your original suggestion with s/-EINVAL/-ENOENT/
and I will come up with something for a future patch as this will require more changes
to make it generic. I also do not like at all the fact that we are not informing the user about the error code
when calling panic from construct_{dom0,domU}...

> 
> Cheers,
> 
> --
> Julien Grall

~Michal

