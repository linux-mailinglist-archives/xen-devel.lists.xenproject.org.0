Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3EA8C9DF2
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 15:14:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726107.1130369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s92pp-0006Ey-JL; Mon, 20 May 2024 13:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726107.1130369; Mon, 20 May 2024 13:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s92pp-0006CN-Gb; Mon, 20 May 2024 13:13:49 +0000
Received: by outflank-mailman (input) for mailman id 726107;
 Mon, 20 May 2024 13:13:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nMKL=MX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s92pn-0006CH-Nq
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 13:13:47 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8e5dbf7-16aa-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 15:13:45 +0200 (CEST)
Received: from CH2PR04CA0008.namprd04.prod.outlook.com (2603:10b6:610:52::18)
 by DS7PR12MB8346.namprd12.prod.outlook.com (2603:10b6:8:e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 13:13:42 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::9f) by CH2PR04CA0008.outlook.office365.com
 (2603:10b6:610:52::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Mon, 20 May 2024 13:13:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 13:13:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 08:13:35 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 08:13:34 -0500
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
X-Inumbo-ID: c8e5dbf7-16aa-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSkZakAmVIB7plj/gRBeK3tDwRmKL5x6ww7/DsPLJWKV0bH8yUcEfxCq/4yKdVgtCglzzElbA8KIIG6L4mBKoyvGsdL0vqfudkUhb12ItmvNzb8xemxT7FvO2P/h8Wz1Ul8zCdNXygSXfx7hYMMpqqzOeeN1XH/2OPEJoq12KougqTgdYUZjrNhpvTDy8c5eKGpLB3ohx4Yrs5UgnngZZ7JDfRBqwKhAsRSJid3VXwCfTLw7s9C80PFaLzDPmFuTf2uu0PQrL6R+9s1RZEQwjaC052eYX95jFLR+mzYw7AwHSR4FbLx/9fahi05xwZZYYhALMJImSmqmMNXykiapkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bjj6UaZejEdBGuyqu/WcFnlnU49Zl3j4wbcK49I1K68=;
 b=Bv7a3ZgruAwnsK1fp73UQHGRV3wHckRtsw99DTJCOdKmfHDDTKvGZOKhx1yXpvpdxBOktMgEm72JolWm+JCPqVqZn0UadG61mNFoTasMcX257poCBRl+5wuNTUHbOd3weKuo7Zqgk+sdaWvqTPKb6el5pm6e9UfmaK+lfUL9nxNF8PDm9Ya5PFOjLHW3b9/QwsJQ5mgkIfQaS2yGQg81bC/VL9Rg1rWQ3P6sItYmvDPbGzvvkT42zjGJF/82VycjdxLd3qHyBcKaIpBfbgbHYLEr2ZHrxW0MmIyGsiI5pBRudTt1NxwHMYtpPV5EMpMFz+ON6hacMm6qKntwLAs/dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bjj6UaZejEdBGuyqu/WcFnlnU49Zl3j4wbcK49I1K68=;
 b=PEkg8wtr0xk18wNbVxdQNI7bMde5okGQEhAOpv1rsA+Po9CffkeMF21d/76H128YcNo77B0J1tpskerHLStMeuA7IsvWnQiY1aLt22SEajWlP09YRT3jr8OeXVvsLYeyBYA9+UGAZJSbi0Hy6BuDXYH/vROE8iKdjGeyMQrYGHs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <07db0c52-5063-4f2d-82e9-26ca8167524c@amd.com>
Date: Mon, 20 May 2024 15:13:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] xen/arm: Implement the logic for static shared
 memory from Xen heap
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240515142626.3480640-1-luca.fancellu@arm.com>
 <20240515142626.3480640-7-luca.fancellu@arm.com>
 <cbe1fb4a-9c2b-48eb-acb0-6726aecdfe85@amd.com>
 <03C2DB73-2B91-4E74-9CBE-ACA21CDA0783@arm.com>
 <e9fe1ee4-15ea-402f-8418-0c308afbf1db@amd.com>
 <6AC54D50-7277-44ED-8C69-9E4984C3531C@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <6AC54D50-7277-44ED-8C69-9E4984C3531C@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|DS7PR12MB8346:EE_
X-MS-Office365-Filtering-Correlation-Id: 3baf3c13-52a5-4c38-797d-08dc78ceab63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1VMUTRLZml0a0NyRnNkeWhiN2hHREpRazZURFVGVDdqUWEydC9IdEVjRmdT?=
 =?utf-8?B?T3M4enZrTVc5Z09rbDVFVjY4YVU0QlV6Yk54QmFEYmFtUjQ0djlIODJFVTN1?=
 =?utf-8?B?TzQvNzNaWE1KZEo4Q0E4M0FqSWxORGFxZFVyU1IvVjM1NTd6Q3NvS3REc3ls?=
 =?utf-8?B?UnZzUzZVbEVIMGJTaDF4eHQ0TUxYZG52YzIzaE5yS0hSdWRTL1RsRnZJOTB4?=
 =?utf-8?B?ZXcvdXV3dktGQUEvREZKekpiWmVSczFJNjZOakFrVkkrdEpSYUhBN1Fwb05p?=
 =?utf-8?B?NGlZM0M0VTVpTklsM2praEU4bC9IZjR1Kys5OXhqb2pmLy9oQkVaSVJjcGth?=
 =?utf-8?B?ODhLRDlmZERyUk4rVzF4ZEp3YldKUzY3N2NCQS9VU2dQU3IxektXcmZFU1du?=
 =?utf-8?B?aklwM25ONXR5RXJQOHN6bEpTaGpkdHh3eVdGa0NJQXFJWVB3UjUweGdsYWYr?=
 =?utf-8?B?V0ZFcUFsaisrcmE4aGJ5cUV4dDlQenhHeG5OY1RkcGNOTFRqSkFxNDFYYTNV?=
 =?utf-8?B?aEIvdDdVcko5VTgvRkROdWNuS3NFQ1BuUXptanVDWWlFSHlxd3BHTDVBMlZ2?=
 =?utf-8?B?d0RmYTh6MVpzS2k4bnd0YmhsYzIzdVllcDNjVGhtZUYvaGk4RnZNWUlYM2RI?=
 =?utf-8?B?WGNVTVE2eEtET3BZVENEMVMrS2hpMEh5T283d2dpQW5WOG9MZTZPRzZMTmJk?=
 =?utf-8?B?RVp1bk5NaHJtSVQ4OU9NM0NOU3hGUmtVbEFCQnVJbnVhdEZQU0ZIR2dKS3Ns?=
 =?utf-8?B?Z3BkSUJHbVFaRWZHUjB3VEtHUjE4TnBZMEtLeWdGRXQzR3FXL2E1aWw0NEdo?=
 =?utf-8?B?Z1JSWkhLbXBkUjhGbjhYRSt6dzErVlJzNmdLZFNyOGpkQ2lGS3RiVnRacmV3?=
 =?utf-8?B?ZFE1N0ZEWXdIMHVYRUhRVi9FZVUvb0o3cFhYLzh3eG9BVE1SSjBtTjBKSjYz?=
 =?utf-8?B?K0Nsd3RiTExDcmU0M0c5Z0tlbThpdkV3MndQZWMvMGhFOW9HdjhhUW5VQW9H?=
 =?utf-8?B?ZDVnUTYzQk9aSkNVS1dqQmRhUXFpVzMxSlAyUHF1ZGVMamFFS3YyRE5EYXNU?=
 =?utf-8?B?VEtFVjFvQUJmTFFqQk1pbmFlTEg0RlRQQldWWFNRbit5czNmL040UnVGWlQ0?=
 =?utf-8?B?NG9SRytya096UythU0k4SGRobU1rUnhmMi9FN2VBK0EwQ0lQRy9rZTNhZzdQ?=
 =?utf-8?B?dFNHbkI5a2NId2drV0E3VlltLzA0czF3NzNGNEJ1aWtSdmY5QkVsMkJtZDQr?=
 =?utf-8?B?dStXQ3lYWVlkZUt6TG15UDJycFpTOC9JWEQ1U21wbVp4cVNiMEpTcXU2cnlR?=
 =?utf-8?B?QXNkT2N1aCtqU3dxRjdrc0ZWajgrOW1MOEF5bS9GL3JNalFkeDNJVGtESEl4?=
 =?utf-8?B?cWtqby9FZ3RVZzQ2SlROb1RBN08wTm1sTmNTMjY1VjN2aEsvVXlJS2tiaGFu?=
 =?utf-8?B?alk4WkZhZityeUtlbXlLbStUWlpYc2JIZjZsMk9rZEpRQnQyOHFjMU54ODBL?=
 =?utf-8?B?NE9Yam1WTGJUWkJRbllreWR1YkdCUU5TVFpMVG02M0NTVnp6RHNRaFVmNDdY?=
 =?utf-8?B?dHNqdTFMaGw2d3lFSStwam1TV3AxaTViaEhyL1ZXTW9EM3lSbHNXQ0s5ejRY?=
 =?utf-8?B?Q3YySjFsdk1wU2VZK0RBM0pnblordU4yNFRMVExPUHRWNnAxRFFrTjFKRFlN?=
 =?utf-8?B?QWxGRmRxMmh2djFXUkFlUzREL3Vhb3Y3Q0VkM0JGMzVXMmlxcC9mVFBTdnQz?=
 =?utf-8?B?bWJlVVJUUjZuSkNiTmZLZUhaVy9ldmRERFY2UGQyU3ZUandNTEszY09yOVRh?=
 =?utf-8?B?QmQ4WUF3MjkwNlJTK2djZCtvSUFEeHp5QXErdXg1b0xYZlVaQmZGRkxRRHR0?=
 =?utf-8?Q?jqEOm30t0z0O9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 13:13:39.2224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3baf3c13-52a5-4c38-797d-08dc78ceab63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8346



On 20/05/2024 15:11, Luca Fancellu wrote:
> 
> 
>>>
>>>>
>>>>> +    struct shmem_membank_extra *bank_extra_info;
>>>>> +} alloc_heap_pages_cb_extra;
>>>>> +
>>>>> +static struct meminfo __initdata shm_heap_banks = {
>>>>> +    .common.max_banks = NR_MEM_BANKS
>>>> Do we expect that many banks?
>>>
>>> Not really, but I was trying to don’t introduce another type, do you think it’s better instead to
>>> introduce a new type only here, with a lower amount of banks?
>> I'd be ok with meminfo provided you add a reasoning behind this being meminfo and not shared_meminfo.
>>
>>>
>>> Because if we take struct shared_meminfo, we would waste mem for its ‘extra’ member.
>> Would it result in a smaller footprint overall?
> 
> Well overall yes, meminfo now is 255 banks, shared_meminfo is 64 in total, even if we use 32 of them and
> 32 are wasted.
> 
> Otherwise, as I said, I could do something like this in this module:
> 
> static struct shared_heap_meminfo {
>     struct membanks_hdr common;
>     struct membank bank[NR_SHMEM_BANKS];
> } __initdata shm_heap_banks = {
>     .common.max_banks = NR_SHMEM_BANKS
> };
If that's all it takes to avoid defining unnecessarily big variable, then I'd be ok with it.

~Michal

