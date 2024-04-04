Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 579B98985E6
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 13:20:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700819.1094531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsL8F-00014B-7P; Thu, 04 Apr 2024 11:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700819.1094531; Thu, 04 Apr 2024 11:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsL8F-00011h-4S; Thu, 04 Apr 2024 11:19:47 +0000
Received: by outflank-mailman (input) for mailman id 700819;
 Thu, 04 Apr 2024 11:19:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OVy+=LJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rsL8D-00011X-AW
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 11:19:45 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c42523e-f275-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 13:19:44 +0200 (CEST)
Received: from CH5PR03CA0002.namprd03.prod.outlook.com (2603:10b6:610:1f1::14)
 by DM4PR12MB6615.namprd12.prod.outlook.com (2603:10b6:8:8d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Thu, 4 Apr 2024 11:19:39 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::2c) by CH5PR03CA0002.outlook.office365.com
 (2603:10b6:610:1f1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26 via Frontend
 Transport; Thu, 4 Apr 2024 11:19:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 4 Apr 2024 11:19:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 06:19:37 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 06:19:37 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 4 Apr 2024 06:19:36 -0500
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
X-Inumbo-ID: 3c42523e-f275-11ee-afe5-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5xtcoYGC2aPQ4DrmhwxEmz9U1APxUjITIGvt+1uDSocMJKlblpC1s7Wku/W59dAivwvl3lg0g5vfwZsH5eqValoa7cQbcAfnD5c9K1Osnx45e6IAgW+O8nzgp2nMRpBpJo1YK6+wIfGPT+uyrKbm8I/2wug4hbtHZlC6fZCY4GLJtw3vsAcIi/PcOK9ijcJ/cVUXJJC30nN0mojRR+GwtXO64u9T4qiF3S+0BBuvG+qzo41Pz2g+mhB6TgQq/2vJSdhU+JBrDx7ei5g6ySR3rCKo9ASNd9oPmTBf4BKK9SGK100u9nZv8WC6p5AuqcQCR7TkMh9vHznoIONeeTt8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K25hj4GfM6jTPrWZY6x4lXD4sMTp1ZFaW5X/biI5nzg=;
 b=BSCsgYnT900OT5X0CBqfU0gAMAGzjVBl1mQE1hRnj7NGy6TItll4zx7n5V3KFC6H6YjDiqev20aagj1WhQrfZ+28bXHDXxvHCXX0f6GBUYOdvLwPWBt5WFTN3oXhFGq7knCL9cm/gA9F6Q8Djz9oU3Ovjp7caxFZ5EFuE7lqXsb/YkMVbVZWcZC/NTz240xqKa5nSJLFjH3IwlADLVlDK90P4NQqUY2rYEU0/UIDVt5UTmqHoaeVGwWhmJwVg27g90sr0Ixk60/ZJtSbzTqLwXRmy6OGkNw3jQlbD+TlxRDS3VBNvQnTyZG1mSiliN+PchulsVpsFHm7hX8XBTulXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K25hj4GfM6jTPrWZY6x4lXD4sMTp1ZFaW5X/biI5nzg=;
 b=LdAVejUxhETlVNchtNnsmvWXW96pLlTytH50l6xbitZQr7nVAROoRl8HlXZCgBA8+b7ELmQx10nG0ta4+6DrwAzH0fDZ3fcNO7CpzZzvf9zyNFDFLIq7BO0UaUtJdpcjR1HjqumlrDQH4PmK08W1AT3yHTScq9yGmELdR6ZKenY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <304ce898-0138-41a4-bf7a-4edf12491bc7@amd.com>
Date: Thu, 4 Apr 2024 13:19:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] xen/arm: Reduce struct membank size on static
 shared memory
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
 <20240312130331.78418-9-luca.fancellu@arm.com>
 <1cfde34b-6d03-4a18-81af-2e2a0195190e@amd.com>
 <F2A93445-09E5-408B-8857-0CDB6ECCF360@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <F2A93445-09E5-408B-8857-0CDB6ECCF360@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|DM4PR12MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: b9e99560-b987-439d-fb78-08dc54991e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d/jfmHad7gGct18adRTKKtAvj8MjZsMV5pah3V9e0nbg39oMSseZNk3NetZ2sfhAwScZRjc8BP6j0D/37DhwHeGHi75W35hiivtKLq8x1s9tQVXfyCj3pilV/Wr6Mh2y9WAb2WS7k0P/750ck0YStk/5PM1vwbwpXkho9BKK5IiFcdE2utvdTzzyhChFQtwsTIfq9ic45kDErOHLTnNGHY6MYa6FL50T7YBH3h4wQ6Nm4Ws6Mw1jhUetQJaN8/ITlOxPPxY9+Ny6pC7wUyvhRdSe7mjaLiNr+r66q4SeuGC2FuEbioqJAzWu3CkeWwTDay9gPXYP5AlvYrObtkFY+Y2XGtNhUAt3DuW1+mnqusJD3vM772k2WFf5ASBLTW7NHcxMOvZC6E+5NxbPAEGzmm/SBPxBWQcZn5FFE7pbNv6lnD9QUW2S8VYH3RHAZemEp1coQFZKG0Os5Q9rMPd7/yZVg/VjE56lF9Enay+9f5GbofY9NPqJNJ5B1gigripTbtXWNMY2bo1LovB9kec1zMKYRKKQzLODydwDoXKy40jT935fIFELDOkIMVxS+K6T9+5ACjqnQAl+JzPFN1FvTKhDe8uowZsas846szfee7p/1k1JJWBiKu5bAcbc4ynXcfm7o89iAJY+OBpGtFuIgTi1ne2UyekS+nE3VOTWA/Q7E0Ziz8YQl0lkmKTnv6oW2e6eRz7/vlzT+gewMPmVPf+91OFuXAkEo+FbMLLfDZQK7+emaqrZGSf3fak08uoa
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 11:19:39.0196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e99560-b987-439d-fb78-08dc54991e2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6615

Hi Luca,

On 04/04/2024 11:33, Luca Fancellu wrote:
> 
> 
>> On 22 Mar 2024, at 10:30, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Luca,
>>
>> On 12/03/2024 14:03, Luca Fancellu wrote:
>>>
>>>
>>> Currently the memory footprint of the static shared memory feature
>>> is impacting all the struct meminfo instances with memory space
>>> that is not going to be used.
>>>
>>> To solve this issue, rework the static shared memory extra
>>> information linked to the memory bank to another structure,
>>> struct shmem_membank_extra, and exploit the struct membank
>>> padding to host a pointer to that structure in a union with the
>> NIT: AFAICT the padding will be reused on Arm64 but on Arm32 there will still be 4B padding.
> 
> Yes, my purpose was to make clear that no additional space was needed
> for that pointer, should I rephrase it or it’s ok?
Since you are modifying this patch anyway, you can take the opportunity to rephrase it.
> 
> 
>>>
>>>
>>> +struct shared_meminfo {
>>> +    struct membanks common;
>>> +    struct membank bank[NR_SHMEM_BANKS];
>>> +    struct shmem_membank_extra extra[NR_SHMEM_BANKS];
>>> +};
>> Same as with meminfo, please add a BUILD_BUG_ON for padding between common and bank.
> 
> Sure
> 
>>>
>>>
>>> -static int __init append_shm_bank_to_domain(struct membanks *shm_mem,
>>> -                                            paddr_t start, paddr_t size,
>>> -                                            const char *shm_id)
>>> +static int __init
>>> +append_shm_bank_to_domain(struct shared_meminfo *kinfo_shm_mem, paddr_t start,
>> Is there any particular reason to prepend the shm_mem name with kinfo?
> 
> I think because usually kinfo is used to point to ’struct kernel_info’, instead here we point to
> 'struct shared_meminfo'
> 
>>
>> ~Michal
> 

~Michal

