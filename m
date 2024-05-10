Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC298C20FA
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 11:33:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719629.1122461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5McW-0003Tu-8n; Fri, 10 May 2024 09:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719629.1122461; Fri, 10 May 2024 09:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5McW-0003Rd-5p; Fri, 10 May 2024 09:32:52 +0000
Received: by outflank-mailman (input) for mailman id 719629;
 Fri, 10 May 2024 09:32:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rhO=MN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s5McV-0003RX-82
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 09:32:51 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:240a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4202ca60-0eb0-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 11:32:49 +0200 (CEST)
Received: from SJ0PR05CA0123.namprd05.prod.outlook.com (2603:10b6:a03:33d::8)
 by CY5PR12MB6227.namprd12.prod.outlook.com (2603:10b6:930:21::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Fri, 10 May
 2024 09:32:43 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::40) by SJ0PR05CA0123.outlook.office365.com
 (2603:10b6:a03:33d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43 via Frontend
 Transport; Fri, 10 May 2024 09:32:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Fri, 10 May 2024 09:32:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 04:32:42 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 10 May 2024 04:32:41 -0500
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
X-Inumbo-ID: 4202ca60-0eb0-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XD3ZOpXdOtqvfHbVGCn/e94EmWIgNx76MxFtbgv7HNDvCuQwzid46w5PgOb1f0sKiST9JxFZBiaRmWe0HeO8bLsx49EdN+/OqPjz8lx1nf1qglE6cNXFtGotzt0vJ6r5uQ1/220U433ycOKlADvlH8eZRhVwOqfiHN7UhWorkd0jLw7TVJjpLT8/5PZ9710ZFm2ySwe8z40ciCPazhgv03BjtaoFppOZQYggoyPe6GTMTLf8SNYrXQNFWNHNqTXFTd/6uuiE2QlN4yWFfC2hu1XuHrkzfwDkx5GAabCOgoEIU1uuoT1wLZ0c35eOnwI+tjTEsLMyQ8M57WFpNNchIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7G/nZPMHErP/m19JHaKGEtBUlctLBSZKr2vW07IE5A=;
 b=Q6GuujIQX0MFPoPfAFs+DY5hGb8yLrfrZAQSA3CdVnWkROVIM6QxSNQwumN5vC4upC4ffDiNmPR9yT7Q9/J+66y9cHO+D1QgSZwPRC3PRfUpePsVDyd+ito70mKrNe8p8UaFhP8DeFE3eSMEMTPIsuaodb3J9SyHYQLX5V7tkOH+H7Shr52wPJpX2wrlKmzlDWxf7gnSPwPLkYTMGHyzU0MHxTG4ULD5JCbfnsiux4FAtbDto1n+De9ICYXT17yDaNVIuasWgN1dxTb3RhNPMHPcmf/sCFe0uc7icMJncPGQj4MYJeBVZhyIkZxjqaB75+/wM1QCIp5oesXli8VNww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7G/nZPMHErP/m19JHaKGEtBUlctLBSZKr2vW07IE5A=;
 b=5GYGbcHMlc3ZYiLDoDg8oq+hXdxk87P6I2gOyAs50WD2rTjxD2U8dH+fiq34lRi2ms+cF0HVy/D5qE/b4DmnvwOsLL0mi4wBio9ZYk/nvk632Y5bV5sR1FDILnr3A/AmfzMJKJ7xICWE9GzAuJSzt0gBXPCtQjNStqrI11vn2us=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e025553b-4b3f-4591-b996-2e31eb081bba@amd.com>
Date: Fri, 10 May 2024 11:32:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] xen/arm: Implement the logic for static shared memory
 from Xen heap
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-7-luca.fancellu@arm.com>
 <cb496741-dd76-4536-818a-cbfdbd496b0d@amd.com>
 <10212FF3-3CCD-4634-9890-4CDCA11A5F88@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <10212FF3-3CCD-4634-9890-4CDCA11A5F88@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|CY5PR12MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea9ea1a-4f40-4b64-f882-08dc70d424b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|82310400017|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWVUT2pqQlZxNldZNFY2S2RYR1dWY0VRQ2dnWGM3STV4OWY1Mk5HY3hiMzBE?=
 =?utf-8?B?L1FYVjd1NUcyZDBMUDBKSjF2aFh4Q1NWZE94Mk02aldSQmNpR3lrdW5icFhD?=
 =?utf-8?B?QkxSWXNlSS9LU3IzT09ldFlyWDhoUTF5Q1EzTTk1NVBlOVNVSno0aDNYZ1lY?=
 =?utf-8?B?emRJY2REd0ZKbXRsR3dJTnpZUDlxSEFlazBCT2t4SlZ4dEk4QkJrYUloYjF2?=
 =?utf-8?B?MkQ0dTNBdmc3Szc1TkhGcjJFb2trUjczOTROb1Noby9IOHpNTEtrNDZobURw?=
 =?utf-8?B?QWd0OStWNVY5VXFTdjJQaGJZenZxK2E0blk4TFY2ZlZ2dlpPL1ZscDh5Um52?=
 =?utf-8?B?QjExeWg4OEhMa3RpekJ2azRtdDZkWmtaMU9ZTjFWZ0RLUHdtaXB1U21sRnQr?=
 =?utf-8?B?THpQaUZKZHFzRWtJL0E1R1FTWldCM1ZGRUdtZVJHdFZUamFPOFFFM1hTMm1I?=
 =?utf-8?B?YlVBWVpEdGFTT2FiTnRmMTRONXJDd0NFbktZUk9nODRpTkhHODhZajJGQUls?=
 =?utf-8?B?MWVaUmJnUytrL3R1bVpGZ3VJY0NrMy9ISXNqN2l5NmNUZ3N5MFlBT3dXTmZT?=
 =?utf-8?B?NmhxMkN1WFlFc1hROGRGcjNvQ0NzR2h2dWkwcWZvWGNBVkNRVkVSMTNMNTd6?=
 =?utf-8?B?Z3BQNDRFM0Jld0dqRkNKZ0dNQSt2ODJiaTJHcU9uZmNoU2hMV0tLd3ExRlB2?=
 =?utf-8?B?QmFqMVZYdUljVFJtM3p5R1ZDTENMRFNNSVVnc3NBTGZSekZoaUFKSFZ2S1NM?=
 =?utf-8?B?WC9iWWxtKzN2bUhLK2tkb3lWNERpVmd2M2hMNEp2SHRUUXJBUjRmS0l1c3hJ?=
 =?utf-8?B?bzV3Y0cvQlB0S0dqdjAyU2dXMHc4VzI5QlA1d0FMUWtSd1BpelVSWXpqbm5S?=
 =?utf-8?B?Y2FVbFUyUk1GTklMSTlXTEY4ZHFXREFvZEYzbXFuQnVsK3dsaEY4d2N1RWU1?=
 =?utf-8?B?dWRWMTBES1dOTUJUODM5KzNjeWx0MWRkTlZjc05TUmo4Q1FVMXJhWFZvc3Rs?=
 =?utf-8?B?VjZndWcyZktMWGQ3Nk9UVXE1VGQ2eExVQjhaMldLSStLMDhiUXJHbHY3ZTdM?=
 =?utf-8?B?L3hzSGdWYXhXa1psb1I4dWJMS1FTZHIrNWpOcWVaV3ZtMmxkSGphLzcvNzRa?=
 =?utf-8?B?SnhZVHVjMGh4NHBkaGdINmpIeW51eEpBeHJXZXRjelpUQ3liSGQrbDROdGlZ?=
 =?utf-8?B?ejNpaGxZb3Z1UDVFM08wTDdCczJiWFpwN25uZWxldmF5WFZqUTRkbjhEU0cw?=
 =?utf-8?B?NlF1bFVucVRaWDVsblB4OVZqcDFOMXRnaEY1bFZheWJkZUtRbG84cmlBNTVJ?=
 =?utf-8?B?NVVwQW1leWRDQzNaUFpDVnQ3emVNVjk4MUwvVllIL3ZZcDdQOEk1ekJjRzRy?=
 =?utf-8?B?U2l0TlFUbDg4cU9JMERxNlBCL3VUeHBKQ1JyU0FWSGMrRmM1bTB5R0xkNHo5?=
 =?utf-8?B?TFpqbHJjditjNU9wVUsxTEVVS0k5cnZhcWkvSytKUys5ZFBKZU9vdDI0OHYy?=
 =?utf-8?B?bWd5U3NLOVFYZXQrdzJ5SC9kQ3kza25pa00vTnF5bkxCZlFUN0RVWUpPSkpj?=
 =?utf-8?B?M3hzaE4vRGVWUHdTelJWd1RDb0JDZVMzQzdTUGtNU3BYUTFaeTVQemsrS012?=
 =?utf-8?B?WDJkbWhISUtVL3lMYmpJMlBockY1eU5SVlpEdEsrMThpVEFQeFlCR2xnNU5n?=
 =?utf-8?B?S2M2d3NUQXRxRTdxaFRMYzJyK0VIYlZweTFhNEdlVUZnWkxhVUVwSWt5OHFL?=
 =?utf-8?B?NmpndjVtYS9ZZWl4aHBHWGV3cjJSV2d3VzFEOTZxdzRiYWZ3YUczcFpGS2t3?=
 =?utf-8?B?azRzRTIvd0pnRnQrM3NoRSs0R0FKQ2JscTJXSVYxd3dFQTMyYkxWTmZ2MnVD?=
 =?utf-8?Q?7xt6UujoIBHpP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400017)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 09:32:42.9735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea9ea1a-4f40-4b64-f882-08dc70d424b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6227

Hi Luca,

On 10/05/2024 11:25, Luca Fancellu wrote:
> 
> 
>> On 10 May 2024, at 10:17, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Luca,
>>
>> On 23/04/2024 10:25, Luca Fancellu wrote:
>>>
>>>
>>> This commit implements the logic to have the static shared memory banks
>>> from the Xen heap instead of having the host physical address passed from
>>> the user.
>>>
>>> When the host physical address is not supplied, the physical memory is
>>> taken from the Xen heap using allocate_domheap_memory, the allocation
>>> needs to occur at the first handled DT node and the allocated banks
>>> need to be saved somewhere, so introduce the 'shm_heap_banks' static
>>> global variable of type 'struct meminfo' that will hold the banks
>>> allocated from the heap, its field .shmem_extra will be used to point
>>> to the bootinfo shared memory banks .shmem_extra space, so that there
>>> is not further allocation of memory and every bank in shm_heap_banks
>>> can be safely identified by the shm_id to reconstruct its traceability
>>> and if it was allocated or not.
>>>
>>> A search into 'shm_heap_banks' will reveal if the banks were allocated
>>> or not, in case the host address is not passed, and the callback given
>>> to allocate_domheap_memory will store the banks in the structure and
>>> map them to the current domain, to do that, some changes to
>>> acquire_shared_memory_bank are made to let it differentiate if the bank
>>> is from the heap and if it is, then assign_pages is called for every
>>> bank.
>>>
>>> When the bank is already allocated, for every bank allocated with the
>>> corresponding shm_id, handle_shared_mem_bank is called and the mapping
>>> are done.
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>
>> I tested this patch and it resulted in assertion:
>> Assertion 's <= e' failed at common/rangeset.c:189
>>
>> I checked and in find_unallocated_memory(), given that start is ~0UL (host address not provided),
>> start + size would overflow. Did you test this patch?
> 
> Hi Michal,
> 
> Mmm I’m testing with a dom0less setup, without dom0, I think I missed that part because my guests doesn’t have
> the hypervisor node (enhanced), sorry about that, I’ll test using your setup, can you confirm what are you using?
I have these Qemu tests (with and without SMMU):
 - shmem between domU1 and domU2 with/without host address provided (owner domIO or domU1)
 - shmem between dom0 and domU1 with/without host address provided (owner domIO or dom0)

BTW. What was the conclusion about the issue if shmem region clashes with RAM allocated for 1:1 domU e.g. dom0.
Accidentally, I end up with a configuration where Xen allocated for dom0 a region of RAM clashing with my shmem region.

~Michal

