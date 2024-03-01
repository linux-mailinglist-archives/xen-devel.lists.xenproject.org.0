Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8576C86D9EC
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 04:04:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687493.1071047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rftBa-0001gY-Q4; Fri, 01 Mar 2024 03:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687493.1071047; Fri, 01 Mar 2024 03:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rftBa-0001ek-NI; Fri, 01 Mar 2024 03:03:46 +0000
Received: by outflank-mailman (input) for mailman id 687493;
 Fri, 01 Mar 2024 03:03:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jPtK=KH=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rftBZ-0001ea-Bi
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 03:03:45 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fb5345b-d778-11ee-afd8-a90da7624cb6;
 Fri, 01 Mar 2024 04:03:44 +0100 (CET)
Received: from DS7PR06CA0040.namprd06.prod.outlook.com (2603:10b6:8:54::28) by
 SJ0PR12MB6783.namprd12.prod.outlook.com (2603:10b6:a03:44e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Fri, 1 Mar
 2024 03:03:35 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:8:54:cafe::c8) by DS7PR06CA0040.outlook.office365.com
 (2603:10b6:8:54::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32 via Frontend
 Transport; Fri, 1 Mar 2024 03:03:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.140) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 1 Mar 2024 03:03:34 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 21:03:32 -0600
Received: from [10.65.148.173] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 29 Feb 2024 21:03:29 -0600
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
X-Inumbo-ID: 4fb5345b-d778-11ee-afd8-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3+/Uh3/C+XXmed4L7itoOmcVsETRkDVPpSLOayMA5ZYTX6OQGQBlhSk7zvSLHFMGT9O45CDGqG8MLLtZGJsW9+26z8lwS/LdQeuKaTwRvsqJ0Rfrn3iWvaCnONqlFeei27/1ovb84P7pVaF0AixpSjhFes49Rk4ZB6vhdirblJKdHm9y3koCmjvavCO1QnAO8TySGid7RcWMA2EJqcA5EuUbNn59to3x93f2E1Cxk2BH1ENQHuCSXy9OOLg3SvgAazvVhHrwX2M91aVcSjHJgKbqAwXmOlbykZSnvOkebqR3bQ0Rm7YRCOsd+K8479H7p4v/VLapkIlARcTQ6pHJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fl7c7ZbvEY3wLxBTxbEFibIk1rfU3lpPxk7kipL++hk=;
 b=XcmotvbzHy1dktR7JrXZcIfOoEFXjNuYO0eeb6qu80zne5fxZtbU1PVXR/0uaAy6GqeeL1euJ4VjGffbRKrmAM5TrRxZq5Ij3RlPqbCvQRGHM+4/trZFjM7y+ARPwMWYAmRNLn1lwy/MZApBF/9g9zgfPUNfMN9DSHftalF9v5a2e3hXA4qNXgZVe+qs9R3FXPGNchL/pwWZiMuP2N3oqAxhsW3VVYJrnGdWN9fxZlD/V3+11OmayP92HigecBZqJps3WsSOfwIvOOwgk3AnL+aY0x38ImIqjvXeKLhdl98okifNrm9ckFoB5nAeEkFf/eWn+J3sY2JSxeYB5sooyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fl7c7ZbvEY3wLxBTxbEFibIk1rfU3lpPxk7kipL++hk=;
 b=JVTXgrutKS7KP8AwukrnJkf+tict8fH4/HJ9viS0SPdVEguhZWXBCoto88zBXshbS6orPRlUiKMbRCn1nDr0UmSXnJ22fmtPJ1EYSIyARznMM34APyyQ2hKzdDOB1Myj1Okazf9M7ah8aD+7Bm3wnbnMDo9iMlkFVIIkIHxUyag=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a8499d69-0300-490d-98a7-dcceb83781a3@amd.com>
Date: Fri, 1 Mar 2024 11:03:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/common: Do not allocate magic pages 1:1 for direct
 mapped domains
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Alec Kwapis <alec.kwapis@medtronic.com>
References: <20240226011935.169462-1-xin.wang2@amd.com>
 <d1518124-483c-4409-9b36-6a3392378911@xen.org>
 <a84aeb87-17e8-4195-90cb-7b0123064106@amd.com>
 <3982ba47-6709-47e3-a9c2-e2d3b4a2d8e3@xen.org>
 <8e56b75d-10a2-4764-8244-3e596f9fc695@amd.com>
 <98739f8d-dc00-4db8-a0b2-07f054107acf@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <98739f8d-dc00-4db8-a0b2-07f054107acf@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|SJ0PR12MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: a4c4084c-6835-431f-79f9-08dc399c2efb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qH+L37WvuPqoNgYM5DLG8uEcSsSshrRcOTQwTsveMnaj32j9KGkjT04toHzGNhKV2owFK8gPuyHAaMYzGMzIv8WeNDIrj0+VKZ9Rr+TKCfpemT+YhZfq37t/rdko9qdprHclnP72U22BqNqSdqN8uFfFa/QZi552YddUhPs/49XvprrSu36kPQiWjZNoFlhnrfzklmMQaqbrD58nWoI65hQHZFsVZRGzSyhknsApu5AP9diCEbADDCvK99oO4PjUWxAdhNYgq4mTSPCYKZ4iPJA9U0a6xcgV2peGYObf9/53gcCGLpJmMIyq3bnsbE19gBEv451uTF4oGUxMdJBFJrUpDXo08/Drj57gvutl2Dc0PYHMrSnHIsSyV3Zujr7dfrjH7ShKpHfjKMO3oFn8HnGmWJB28vW16outWGsmllaJATRG2C8EsAvDhHzJBFPQaz4+lpS3mIERxeSqJ6OY2/lCMuV2APoaeTsINZbx705M2vJ4RArMJJng/Y5+AI/6+cf5/A+LRxVTXA9+9dq5sd6x5tIrqQY2nyq0gWKlQcuZ+uP7V/Y/RXjQajSAs5uCJBhxeZ7n9wu0iMI72nFXSzXRgbuOHewuk8PNSqWIgEpF2RnzPnnOrLyjn3My0T+2xlxnc9oRjtMY4eptOemjabQsZAJsrb2B7mFruldObMHWdfdg3Xl3G4Vz/Pcfa4HO7Qe+3l26UnkMm9hsoRLLy0pxxPO4P1+JjdsEKc6LOrW0Fvib1OLuFvqPA9aCmRKn
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 03:03:34.4588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c4084c-6835-431f-79f9-08dc399c2efb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6783

Hi Julien,

On 2/28/2024 8:27 PM, Julien Grall wrote:
> Hi Henry,
>> ...here basically means we want to do the finding of the unused 
>> region in toolstack. Since currently what we care about is only a 
>> couple of pages instead of the whole memory map, could it be possible 
>> that we do the opposite: in alloc_xs_page(), we issue a domctl 
>> hypercall to Xen and do the finding work in Xen and return with the 
>> found gfn? Then the page can be mapped by populate_physmap() from 
>> alloc_xs_page() and used for XenStore.
>
> I know that DOMCTL hypercalls are not stable. But I am not overly 
> happy with creating an hypercall which is just "fetch the magic 
> regions". I think it need to be a more general one that would expose 
> all the regions.
>
> Also, you can't really find the magic regions when the hypercall is 
> done as we don't have the guest memory layout. This will need to be 
> done in advance.
>
> Overall, I think it would be better if we provide an hypercall listing 
> the regions currently occupied (similar to e820). One will have the 
> type "magic pages".

Would below design make sense to you:

(1) Similarly as the e820, we can firstly introduce some data structures 
in struct arch_domain:

#define MEM_REGIONS_MAX 4

// For now we only care the magic regions, but in the future this can be 
easily extended with other types such as RAM, MMIO etc.
enum mem_region_type {
     MEM_REGION_MAGIC,
};

struct mem_region {
     paddr_t start;
     paddr_t size;
     enum mem_region_type type;
};

struct domain_mem_map {
     unsigned int nr_mem_regions;
     struct mem_region region[MEM_REGIONS_MAX];
};

struct arch_domain {
...
     struct domain_mem_map mem_map;
};

(2) Then in domain creation time, for normal and static non-directmapped 
Dom0less DomU, set d->arch.mem_map.region[0].start = GUEST_MAGIC_BASE 
and the size to 4 pages. For static and directmapped Dom0less DomU, find 
a free region of 4 pages for magic pages. The finding of a free region 
can reuse the approach for extended region and be called before 
make_hypervisor_node(), and when make_hypervisor_node() is called. We 
carve the magic pages out from the actual extended region.

(3) Add a new hypercall XENMEM_memory_map_domid (or a domctl). Input 
will be domid and output will be the memory map of the domain recorded 
in struct arch_domain.

(4) In alloc_xs_page() and alloc_magic_pages, replace the hardcoded base 
address with the new address found by the hypercall.

Kind regards,
Henry



