Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F575ADFDA
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 08:34:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399383.640538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSAR-0007Gl-L9; Tue, 06 Sep 2022 06:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399383.640538; Tue, 06 Sep 2022 06:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSAR-0007Ei-G9; Tue, 06 Sep 2022 06:34:39 +0000
Received: by outflank-mailman (input) for mailman id 399383;
 Tue, 06 Sep 2022 06:34:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BE3u=ZJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oVSAP-0007EQ-O9
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 06:34:37 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7bc928b-2dad-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 08:34:34 +0200 (CEST)
Received: from DM6PR03CA0085.namprd03.prod.outlook.com (2603:10b6:5:333::18)
 by CH0PR12MB5090.namprd12.prod.outlook.com (2603:10b6:610:bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 06:34:32 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::74) by DM6PR03CA0085.outlook.office365.com
 (2603:10b6:5:333::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Tue, 6 Sep 2022 06:34:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 06:34:32 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 6 Sep
 2022 01:34:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 6 Sep
 2022 01:34:18 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Tue, 6 Sep 2022 01:34:16 -0500
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
X-Inumbo-ID: f7bc928b-2dad-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNsOOFWAMO/U4JTKxIUlr314C8rdCmA24BwwQr1tqbqvolXqD4U+NHBl+5Oh0tJJiR1xyU4ro4kVQTHKEyYAfhIDnLF0HtkILTdesaROR34hwdSXusuCHj7hGDRO1pvHoWhBbNSZIKjWLyxkxH+wiZvHkBkzsx6vGNUL6mp42pBDXO1Brz8raOj9jaj+HXQCW1xdq216ZriDaNygWClWusVCaKzhOdGb9ixt0n6izUX9ZCE3AiYDPihBoSwkWb9qdOJKyXuaJZTZa0IUmLNNVlsN9TwOX3TDa6ISopaisr0BWlUAOnItHhLh/1stn6bD7Pz3s7DpP07ahoitnnbmVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cV2/+PYa5+t3tkC0QaGXJzpjfNp0WjGvwv4ZDJmXiM=;
 b=IBcfEomIdiTYV9Elt9nJZwWB/P+7CtguwZ1AMFSj6U8FJElDLvSoJY2AwFqZs/RDcm9FcLwZ205nh9IApLjKgFCCbA9kdEp5yQ0TuyAgQiVnKEmjBhYQPYpIWQFj9GOSff74HAsFrO9yodpZHrmRed2WEnzmxZdAvjfK23KfQAcc9E/n5OoeDWMa6YC70VGeqaVeA5kUXkiLD5H8yhqR1EoS6jBYZNlO6NMVp8gu5MUbkl6f/jfx1DUwT7nkGbhoTskUFVNctp3a17jSf+DS7aieRhTwaIvD9fV2mlDzIqgXj5Plg+8OLeF3fRtgpMEtXK/ybV2qTdcijShz+gmMDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cV2/+PYa5+t3tkC0QaGXJzpjfNp0WjGvwv4ZDJmXiM=;
 b=Am9bSCNfMkGy0sUec+I1cZp2OXjS7OuBNnANnt7nURVZfgFM2aPOJREhwn2wfMNOev2afFSjt1saXt8b5eG+CrQWrKNbcmn/L5QkoIcl/7W1tby8tsDm7E4+E+4EBWn+RoOPG6ioJz6p7yvEBGgkZBwcTe9a4s7R2UzovrHZtrg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4030d661-7b25-4957-e2dc-069fb4030ea0@amd.com>
Date: Tue, 6 Sep 2022 08:34:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 1/4] docs, xen/arm: Introduce reserved heap memory
To: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Penny Zheng <penny.zheng@arm.com>
References: <20220905072635.16294-1-Henry.Wang@arm.com>
 <20220905072635.16294-2-Henry.Wang@arm.com>
 <d62add1a-3e05-7aaf-f44e-f2b3c8c0cfca@amd.com>
 <8325d0ce-1fd3-d754-9eaf-d73b19f8d53e@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <8325d0ce-1fd3-d754-9eaf-d73b19f8d53e@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df552572-8b63-42a2-5f47-08da8fd1dbb8
X-MS-TrafficTypeDiagnostic: CH0PR12MB5090:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TzMj8/bGQvmVz8hGTdDBXDLiTSZxSranQ1Ueg9eogIPExptyCcSD1KdEjvxNqw1MnAQ9eSXYqAq43+8mLR2bAz5iG7t2L2rRucYsEJuRPAzBm4jy3ltqizAXltXDnUQd/WSvs6naI1Dx6AD7HNwrHsBZh4p/UZuHSJTxjfKDU+OH7Q2jiNCiTI/CCrStGCAxanVh1cwdVCh8XfZth7UfJyyrcwQdCXOaeH3Sc5MWt/apjh6UVJ3JtJfSEdzG7/XAXwBgWMura4Bo+HDqfRtkvlBRXJ1A0aRx6AmCE1xQnYgH917eVvZKGq2SjRunRKI61YF5JyRtAdxwRvGRzpOE4QKVukPmBQDYd+qAFNF6dIvqKWmI54ezbTexVvvLwVFEmHraXzh0dr60J/YxWYhMy/3RTL7Sis5mcie7LkYXVUduKD8boTRqU19gxtrdYaUPcqaL0R7gCkhT/SH0C8Lf62IbroYcSm0hMXA0PfpuiEk+VDjyZX0PKU/+dP4tn4M7gDKla7WN4ug9FQO5tJ322xgEBvQjBJ8Uq5+qsB41cOaTNFnSANfDnd2NK93w+9VzB6iQhRzLftZh6ANi6sdPKdU8L/KzmJTOkKskIY1LJe5to4+NbxbmGt8iMmhdDIkzcKRtEuQ2LpSOFTv4mc6eLxOUv5HKLizkKcqNWyiCpasPeuafR3isz371UFgOFv89wnh8Z904tF1vZ+FxbpUa2cMp4N7RlG8xHcdxDFvEeHjXhFosqvmcQSy71a7lrs4i26G4QqZg52udd+fQecfK98Y8mJfNSSjM+8d1Z+ByXO4cseIy4to6qgZokjMCCUnpWVIHkXZv27n8ZAh2omoVaQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(376002)(136003)(46966006)(36840700001)(40470700004)(82740400003)(54906003)(47076005)(186003)(336012)(110136005)(426003)(356005)(36860700001)(82310400005)(40480700001)(2616005)(83380400001)(16576012)(31686004)(316002)(8936002)(40460700003)(26005)(2906002)(36756003)(41300700001)(53546011)(4326008)(8676002)(5660300002)(31696002)(81166007)(44832011)(478600001)(70586007)(86362001)(70206006)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 06:34:32.2482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df552572-8b63-42a2-5f47-08da8fd1dbb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5090

Hi Julien,

On 05/09/2022 19:24, Julien Grall wrote:
> 
> Hi Michal,
> 
> On 05/09/2022 13:04, Michal Orzel wrote:
>> On 05/09/2022 09:26, Henry Wang wrote:
>>>
>>> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
>>> index 5815ccf8c5..d0cc556833 100644
>>> --- a/xen/arch/arm/include/asm/setup.h
>>> +++ b/xen/arch/arm/include/asm/setup.h
>>> @@ -22,11 +22,16 @@ typedef enum {
>>>       BOOTMOD_UNKNOWN
>>>   }  bootmodule_kind;
>>>
>>> +typedef enum {
>>> +    MEMBANK_MEMORY,
>>> +    MEMBANK_XEN_DOMAIN, /* whether the memory bank is bound to a Xen domain. */
>>> +    MEMBANK_RSVD_HEAP, /* whether the memory bank is reserved as heap. */
>>> +} membank_type;
>> Whereas the patch itself looks ok (it must be modified anyway given the comments for patch #2),
>> MEMBANK_XEN_DOMAIN name is quite ambiguous to me, now when it is part of membank_type enum.
>> Something like MEMBANK_STATIC or MEMBANK_STATICMEM would be much cleaner in my opinion
>> as it would directly indicate what type of memory we are talking about.
> 
> I am not sure. Technically the reserved heap is static memory that has
> been allocated for the heap. In fact, I think thn name "staticmem" is
> now becoming quite confusing because we are referring to a very specific
> use case (i.e. memory that has been reserved for domain use).
> 
> So I would prefer if we keep "domain" in the name. Maybe
> MEMBANK_STATIC_DOMAIN or MEMBANK_RESERVED_DOMAIN.
> 
Personally I would drop completely using the "reserved heap" naming in favor
of "static heap" because "staticmem" is also something we reserve at boot time for a domain use.
This would also directly correlate to the device tree property "static-heap" and "static-mem".
Then such enum would be created as follows and for me this is the cleanest solution:
MEMBANK_DEFAULT
MEMBANK_STATIC_DOMAIN
MEMBANK_STATIC_HEAP

But I think we are already too late in this series to request such changes, so
with the current naming we can go for:
MEMBANK_DEFAULT
MEMBANK_RSVD_DOMAIN /* memory reserved for a domain use */
MEMBANK_RSVD_HEAP   /* memory reserved for a heap use */

> Cheers,
> 
> --
> Julien Grall

~Michal

