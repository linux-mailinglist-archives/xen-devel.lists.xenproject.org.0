Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EACB80C34A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 09:32:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651505.1017174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCbhM-0004lN-R6; Mon, 11 Dec 2023 08:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651505.1017174; Mon, 11 Dec 2023 08:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCbhM-0004jY-OM; Mon, 11 Dec 2023 08:31:32 +0000
Received: by outflank-mailman (input) for mailman id 651505;
 Mon, 11 Dec 2023 08:31:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KCUY=HW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rCbhL-0004jS-NJ
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 08:31:31 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab6eef28-97ff-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 09:31:28 +0100 (CET)
Received: from SA9PR13CA0037.namprd13.prod.outlook.com (2603:10b6:806:22::12)
 by SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 08:31:21 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:806:22:cafe::da) by SA9PR13CA0037.outlook.office365.com
 (2603:10b6:806:22::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.23 via Frontend
 Transport; Mon, 11 Dec 2023 08:31:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023 08:31:21 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 11 Dec
 2023 02:31:20 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 11 Dec
 2023 02:31:20 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 11 Dec 2023 02:31:19 -0600
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
X-Inumbo-ID: ab6eef28-97ff-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwPjYw0VcT500mvqG53xfcszdHW79Hjm72mm/4BUkZ5ZfhkUUfmDOeE/28BJMGoXPfa5OOFx9o4cbqIv5wuWu7eP+rtpGP1GNDvNcnOX0eWQHS8sZhyPmeFwzckgBVCeVSbuLLbVOf2RwghkUKhYkQxlwyV5mRZREctKduxbvTwW6GbFFX8QXNaLq9gumjmVOxQzSumAkAkJoC9rSNA0Tro9DG+YEz2T+w+DGgRwQdSKoANStPGsSFJO6ZRPiXNQ/s/iZyd+SpjVMzxDjLgUq0KBXHtOy6eFqxri9DwUkPh/uIHZcftsuABrXzsvpvQ7MEBLv0gyoY0tkNOE70G7Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nc4atuQRDf18BRl0hsptpo1e0vwUx9fKw/Ehn4nEZxA=;
 b=DnoeVmhWdSpeakhGpGs2KRkZtXozAA4z+X/yMuroJO6tqPRSitFV/8f3+qFIINku7wo480wYf1O0Lq15rnziw5qAuzAKNYIBQSx+OcFNu/j9ybTrHbq5I6gBEtmcck9um2d8Egfj+Y1dWuBdX3L6eedEesfNuXgDYSzpfSkjF8pBNnZFclZo3ZyWu7IrJC3LnSTIg8JBj8XVgII4R2pOJ0FJX3AdV7Xf5Aih53XBDfdZdY6YACWtd7RnAlv4gvzo7f18E0KPMyLmGBG4Z/k7DWy8sXJLEP5E7oq2ymOKlKgz8s6Tw9RKcMerhqS9mVWCiPJJQZ88gZYDSt2Vun5KpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nc4atuQRDf18BRl0hsptpo1e0vwUx9fKw/Ehn4nEZxA=;
 b=GwnqHDOb0MnG26Q6Ny77df0W6m5EoggbrFPjzNQlGz99oAmxwCav2k6URgIyWiqTztWuiCrTJsfp1Cw7R4HJiRbdOkvaxLhhSChhZn0cMQtbWB7ILeQIq8rs3I6M71rdy80lw4aD+5FsOBAOXDDpgM6jgHdszH50Fia8qjf34hs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <236a2cc6-53ae-4f4b-b1e8-cb270ee37f9f@amd.com>
Date: Mon, 11 Dec 2023 09:31:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/11] xen/arm: introduce allocate_domheap_memory and
 guest_physmap_memory
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20231206090623.1932275-1-Penny.Zheng@arm.com>
 <20231206090623.1932275-5-Penny.Zheng@arm.com>
 <992ba724-8dfa-4285-8e92-16dfb870e4ed@amd.com>
 <b9892005-ab12-454a-9788-02571e868e67@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <b9892005-ab12-454a-9788-02571e868e67@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: c42082f1-d471-42ed-5a91-08dbfa238dbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nFddnNOiiGGtA/U7wF2CXq06p+6XAlSL6qtxm1HFqUyTqxNYYgsL0mstknh6/+EbLJb6r/stntlSMDIaJ8A+syhqc8SyCafjzM0LU4X9DmhtHd5tKVEQkdpn0eobQUvhXCefA+H1Ci8N7jazL5gzlFi4muCCPUAiNnjQAa+VoeTpYmMAz6aJobhjFC8Zi6ZVVsbm5K9pXegYq4W53k0TRGZCMrNN38EBG8m3m2FkOuXMQSNmViAgKDieWJBJxRX0K4sCAHWHBqSVyUeqIw0BqEefBOaPHROsRs34RMY+HOhvMbLsLwvLKZoy1e+AmrRvkJgLnFZdHanh9Js0jiz1ydDg1Hliim80M8fkay5Gn6UiTrBt0ardnLmkuhBa6WqQ1N8wXmTDR+E2KsZicGkUs1C9x50EeQoG/u+gY3iuC/34skWYUbNgbkqbKBMq42BhGv3BT+8hTchgJoL2FoynTHIBAkNJmuVHl8LE0dsgziRo8g4S9IiSfDOZKUj3EPqN9/ZFsxB5BbaIMYIAdAgdB1SwRCzgEyK30clMbDmVwFFqcCE7l5G9t6nIkLD5EzqaIjql+Yss7+1zgXUKOt9/pS8BtSQecqZ5qH7Bh023MU0lBhku2VDsg9ayZk0M0gqis5y32f/xUpyH54iX1wTOvTr0Q1COdZlXVE+TJO8jP3il/5ltu5GKbCTHofD6mah76pCkFDfqUlX2f5p+ZQpw//7k6G70802eSXVRykZ6MEtZgRfqxeWHDhLJ0f9jPuSVBt9gNRbcqQVoRvKx2Nh6i4awGitMUEw6pQ9TEU9nHik=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(83380400001)(2906002)(81166007)(478600001)(356005)(41300700001)(31686004)(82740400003)(70586007)(54906003)(70206006)(426003)(40480700001)(16576012)(110136005)(316002)(86362001)(31696002)(4326008)(8936002)(8676002)(53546011)(40460700003)(44832011)(36756003)(47076005)(5660300002)(36860700001)(26005)(336012)(2616005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 08:31:21.1162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c42082f1-d471-42ed-5a91-08dbfa238dbc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6885

Hi Julien,

On 08/12/2023 16:09, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 07/12/2023 09:38, Michal Orzel wrote:
>> Hi Penny,
>>
>> On 06/12/2023 10:06, Penny Zheng wrote:
>>>
>>>
>>> We split the code of allocate_bank_memory into two parts,
>>> allocate_domheap_memory and guest_physmap_memory.
>>>
>>> One is about allocating guest RAM from heap, which could be re-used later for
>>> allocating static shared memory from heap when host address is not provided.
>>> The other is building up guest P2M mapping.
>>>
>>> We also define a set of MACRO helpers to access common fields in data
>>> structure of "meminfo" type, e.g. "struct meminfo" is one of them, and
>>> later new "struct shm_meminfo" is also one of them.
>>> This kind of structures must have the following characteristics:
>>> - an array of "struct membank"
>>> - a member called "nr_banks" indicating current array size
>>> - a field indicating the maximum array size
>>> When introducing a new data structure, according callbacks with function type
>>> "retrieve_fn" shall be defined for using MACRO helpers.
>>> This commit defines callback "retrieve_meminfo" for data structure
>>> "struct meminfo".
>> This patch introduces quite a bit of complexity with all these helpers, so adding a rationale is crucial.
>> AFAIU, all of this is because we don't want to reuse struct meminfo where NR_MEM_BANKS is defined as 256,
>> which is a lot more than we need for shmem. Am I right?
> 
> +1.
> 
>>
>> I would like others to share the opinion here as well.
> 
> If possible, I'd like to reduce the footprint of the shared memory. But
> this should be balanced with the complexity of the code.
> 
> Briefly looking at the patch series, we have two structures:
> 
> struct meminfo {
>      unsigned int nr_banks;
>      struct membank bank[NR_MEM_BANKS];
> };
> 
> struct shm_meminfo {
>      unsigned int nr_banks;
>      struct membank bank[NR_SHM_BANKS];
>      paddr_t tot_size;
> };
> 
> IIUC, the logic is mostly to be able to know the maximum size of the
> array and also the number of slots already used.
> 
> So we could have the following common structure:
> 
> struct membanks {
>     unsigned int nr_banks;
>     unsigned int max_banks;
>     struct membank *banks;
> }
> 
> Then the definition for the two other structures could be:
> 
> struct meminfo {
>      struct membank holders[NR_MEM_BANKS];
> 
>      struct membanks banks;
> }
> 
> struct shm_meminfo {
>      struct membank holders[NR_SHM_BANKS];
> 
>      struct membanks banks;
> 
>      paddr_t tot_size;
> }
> 
> And then 'banks.banks' would point to the 'holders'. And 'max_banks'
> would be set to the maximum.
> 
> There might be other way to make the structure more nicer. Like (untested):
> 
> struct membanks {
>      unsigned int nr_banks;
>      unsigned int max_banks;
>      struct membank[];
> }
> 
> struct meminfo {
>      struct membanks common;
>      // We should ensure there are no padding
>      struct membank[NR_MEM_BANKS];
> }
> 
> We would then pass &meminfo.common to allocate_domainheap_memory().
> 
> With that there should be no need for extra helpers.
> 
> What do you think?
I would go for flexible array member solution which looks much nicer and as far as I can tell
would solve the issue with extra helpers.

The only problem is that there are quite a lot of places where we reference nr_banks of meminfo e.g. mem.nr_banks
which we would need to modify to mem.common.nr_banks. Maybe we could have *nr_banks in membanks that would point
to nr_banks in meminfo/shm_meminfo? At some point we still need to set common.max_banks to e.g. NR_MEM_BANKS.

~Michal

