Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A73B80C626
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 11:13:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651589.1017304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCdHG-0001Rw-Su; Mon, 11 Dec 2023 10:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651589.1017304; Mon, 11 Dec 2023 10:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCdHG-0001Pl-QI; Mon, 11 Dec 2023 10:12:42 +0000
Received: by outflank-mailman (input) for mailman id 651589;
 Mon, 11 Dec 2023 10:12:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KCUY=HW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rCdHE-0001Pf-T9
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 10:12:41 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe59::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf892276-980d-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 11:12:39 +0100 (CET)
Received: from MW4PR04CA0202.namprd04.prod.outlook.com (2603:10b6:303:86::27)
 by BL0PR12MB4914.namprd12.prod.outlook.com (2603:10b6:208:1c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Mon, 11 Dec
 2023 10:12:34 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:303:86:cafe::21) by MW4PR04CA0202.outlook.office365.com
 (2603:10b6:303:86::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Mon, 11 Dec 2023 10:12:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023 10:12:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 11 Dec
 2023 04:12:33 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 11 Dec
 2023 04:12:32 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 11 Dec 2023 04:12:30 -0600
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
X-Inumbo-ID: cf892276-980d-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mEYtM8X1+q8T1ILOKw1gS4E6Jxq6ZluMZO0A7eEh1K/pr1UozUtIrr8edyEKVjr7y/KBwO5Lpuosa2YMFkeMtIqihs52kkJno2ZulgbNSSEDZ/HrNHzPELDBLF9XHHzPZZ+vv+kS2pvLHO5W6yTUvqpIGmkSrkGhcelzCwRvDICzGl993zzWPfsksgq8GoLzLFtonbC1B0X1/JzBYnfJQcw+5zusvlmbV8miCm3HdBpf9PYwqpcEiSjFek9NuxR/dz4ZMCayw/uBqem1uPBdGkQAyNCfzVbkAEcKpTuh/c3mo9/BcJvxHABSo47Na54gXh72TkKdPnfmxPjai8eCMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Au7wQlt730Wqd0eMPM5g1A42KhGIkWWma489cS77DUk=;
 b=XahkgHFSiYXrDIU4vvrCONv/1h9jf0ot1IA21kOrNEhluqOjV6y4i4wIWkocuuTB+mYU4Sp8TNzb52skLqXJmOj/vdzaVkh2ul2XEva4KiW06w5BesKix7QLR4fdiWxGicn9A+5RtR/ge+mUVzc/084ZDoq8Vz1iumJyCu1qRCMuzzBpTve1l1ld5kxiwqHEZlP+TAMVMmOPIG+iZdF4zp5J6EBQX8h98Qymnt0mSTxS5mXX1+pgfX4iDPBR0TfH5JlvCnovxOLIRqUORlNulOweDE6caP/n4xtTGFCyMdMEiEh9PCi9NnajCzKo94Rwuo2jUhF2dXimBVcxRAOLCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Au7wQlt730Wqd0eMPM5g1A42KhGIkWWma489cS77DUk=;
 b=PxYuE4K2CZ8YH/O8Vc4rt++AttYfegBysMZDq6iHIf02SAIilaqCUahF87rzcX0ZXL2RFozQ/Dx/GRL/rUKEfn9huNooMc7PX3sWf3qCZ2OnmjTvt5ktg/jv8aAWnUao59rvk0FIHWIptLQC4RPiLg82ljgbMOSzS2OPvBSUJ8I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d709ac4f-8f47-4ed0-9bef-6865a14f22bc@amd.com>
Date: Mon, 11 Dec 2023 11:12:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/11] xen/arm: introduce allocate_domheap_memory and
 guest_physmap_memory
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20231206090623.1932275-1-Penny.Zheng@arm.com>
 <20231206090623.1932275-5-Penny.Zheng@arm.com>
 <992ba724-8dfa-4285-8e92-16dfb870e4ed@amd.com>
 <b9892005-ab12-454a-9788-02571e868e67@xen.org>
 <236a2cc6-53ae-4f4b-b1e8-cb270ee37f9f@amd.com>
 <311a1ced-4c53-4d35-ab41-90212b4a48d3@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <311a1ced-4c53-4d35-ab41-90212b4a48d3@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|BL0PR12MB4914:EE_
X-MS-Office365-Filtering-Correlation-Id: 99822a24-f89c-44d7-680b-08dbfa31b168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wMl9rjXdOdOB9hA/eEyotnNwlhEuXgZTkpUk9vMHBMSmoINgyvl22LCjHBfpUVgX/L8lywBSPHDDPG3zcEKDJCm1huG+1bnwjwZ82aRIUTvdqDvp1KFp6lCULn/UBMDJAoFs1KyvYX5A1FR+RE9NJR5giUw07XLOjqgAcz+hLx5n3gKsByNHNOKk/CZNPYsR+Avhr+zgej1nq00GeHUtN61brJM0BRFp1k+WI2+InNXFKxj1YHF5KDm4HvQcAs8UGBVRSM9R57PCxYSkYz7wH/GgKSfYoF+yNgiLqFD5GT6qDlB4ygon1Z6g5iNopiV1x+6SnlLJ+ZrwS6ZGWv4HNQal5dwn4a0+sXi4JqfpNuXlfamgHzLkMDjKfy2hF8CUeFJGCfiJHxMeFOLVQeoyPT2Ht3zjwNh4jJnFCpywyA4CEOdKZxV48CfjbLOKElSKorDQftxhq0dlV33OBv1Rc22HgGtUzT5wDBL2O+0lnNAT8QmfEchcQWb6IszgtgiGWMIwticn/xnH4KOTOxzU8XRIE8htb5rvh9n5OSYXMfrOGLiKAokrMD+7hGORpxJNd37eFdTPD5ZSXUTAylknJGMnzKsIN7CuM9NMfigKDCQqfl4Ll3Ap9TmXbCln4Jw8lmjJWlalGP8ZTQL47yaKU2U/Pb8fv9xMCSGlRtGjeDutlz9vDeiK9roTeqi4Fvbc/HUWFoXHkjc6glee0hdfslGGf2cFpZFCkiVTnpL2NEaUOx23KKW9jSzKtPIWLJUSV3ds8/hiBpIupw/wMvDpQ/VaDysMWPliNKM+1ZA33KaaMSLVcImVXPySScDjIoJT
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(346002)(136003)(396003)(376002)(230922051799003)(451199024)(82310400011)(186009)(1800799012)(64100799003)(40470700004)(36840700001)(46966006)(36756003)(53546011)(478600001)(2906002)(426003)(83380400001)(26005)(336012)(2616005)(4326008)(8936002)(8676002)(5660300002)(44832011)(110136005)(54906003)(70206006)(70586007)(16576012)(316002)(82740400003)(81166007)(40480700001)(356005)(31696002)(31686004)(86362001)(41300700001)(47076005)(40460700003)(36860700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 10:12:33.8402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99822a24-f89c-44d7-680b-08dbfa31b168
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4914



On 11/12/2023 11:01, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 11/12/2023 08:31, Michal Orzel wrote:
>> On 08/12/2023 16:09, Julien Grall wrote:
>>>
>>>
>>> Hi,
>>>
>>> On 07/12/2023 09:38, Michal Orzel wrote:
>>>> Hi Penny,
>>>>
>>>> On 06/12/2023 10:06, Penny Zheng wrote:
>>>>>
>>>>>
>>>>> We split the code of allocate_bank_memory into two parts,
>>>>> allocate_domheap_memory and guest_physmap_memory.
>>>>>
>>>>> One is about allocating guest RAM from heap, which could be re-used later for
>>>>> allocating static shared memory from heap when host address is not provided.
>>>>> The other is building up guest P2M mapping.
>>>>>
>>>>> We also define a set of MACRO helpers to access common fields in data
>>>>> structure of "meminfo" type, e.g. "struct meminfo" is one of them, and
>>>>> later new "struct shm_meminfo" is also one of them.
>>>>> This kind of structures must have the following characteristics:
>>>>> - an array of "struct membank"
>>>>> - a member called "nr_banks" indicating current array size
>>>>> - a field indicating the maximum array size
>>>>> When introducing a new data structure, according callbacks with function type
>>>>> "retrieve_fn" shall be defined for using MACRO helpers.
>>>>> This commit defines callback "retrieve_meminfo" for data structure
>>>>> "struct meminfo".
>>>> This patch introduces quite a bit of complexity with all these helpers, so adding a rationale is crucial.
>>>> AFAIU, all of this is because we don't want to reuse struct meminfo where NR_MEM_BANKS is defined as 256,
>>>> which is a lot more than we need for shmem. Am I right?
>>>
>>> +1.
>>>
>>>>
>>>> I would like others to share the opinion here as well.
>>>
>>> If possible, I'd like to reduce the footprint of the shared memory. But
>>> this should be balanced with the complexity of the code.
>>>
>>> Briefly looking at the patch series, we have two structures:
>>>
>>> struct meminfo {
>>>       unsigned int nr_banks;
>>>       struct membank bank[NR_MEM_BANKS];
>>> };
>>>
>>> struct shm_meminfo {
>>>       unsigned int nr_banks;
>>>       struct membank bank[NR_SHM_BANKS];
>>>       paddr_t tot_size;
>>> };
>>>
>>> IIUC, the logic is mostly to be able to know the maximum size of the
>>> array and also the number of slots already used.
>>>
>>> So we could have the following common structure:
>>>
>>> struct membanks {
>>>      unsigned int nr_banks;
>>>      unsigned int max_banks;
>>>      struct membank *banks;
>>> }
>>>
>>> Then the definition for the two other structures could be:
>>>
>>> struct meminfo {
>>>       struct membank holders[NR_MEM_BANKS];
>>>
>>>       struct membanks banks;
>>> }
>>>
>>> struct shm_meminfo {
>>>       struct membank holders[NR_SHM_BANKS];
>>>
>>>       struct membanks banks;
>>>
>>>       paddr_t tot_size;
>>> }
>>>
>>> And then 'banks.banks' would point to the 'holders'. And 'max_banks'
>>> would be set to the maximum.
>>>
>>> There might be other way to make the structure more nicer. Like (untested):
>>>
>>> struct membanks {
>>>       unsigned int nr_banks;
>>>       unsigned int max_banks;
>>>       struct membank[];
>>> }
>>>
>>> struct meminfo {
>>>       struct membanks common;
>>>       // We should ensure there are no padding
>>>       struct membank[NR_MEM_BANKS];
>>> }
>>>
>>> We would then pass &meminfo.common to allocate_domainheap_memory().
>>>
>>> With that there should be no need for extra helpers.
>>>
>>> What do you think?
>> I would go for flexible array member solution which looks much nicer and as far as I can tell
>> would solve the issue with extra helpers.
>>
>> The only problem is that there are quite a lot of places where we reference nr_banks of meminfo e.g. mem.nr_banks
>> which we would need to modify to mem.common.nr_banks.
> 
> Possibly yes. But it is not clear what's the problem here. Are you
> concerned about the churn? Or is it just a long name?
I am concerned about the churn. I did a grep and we have almost 100 instances of e.g. mem{.,->}nr_banks,
which in our solution would need to be replaced with mem{.,->}common.nr_banks. That said ...

> 
> At least in the case of meminfo. We could possibly replace all the use
> with a pointer to "struct membank common". This would reduce the amount
> of churn and the expression length.
this could help to limit the overall churn.

~Michal

