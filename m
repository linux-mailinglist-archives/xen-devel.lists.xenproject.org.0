Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C93E2960B2F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 14:58:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783962.1193299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sivlU-0008IS-ND; Tue, 27 Aug 2024 12:57:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783962.1193299; Tue, 27 Aug 2024 12:57:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sivlU-0008GZ-JE; Tue, 27 Aug 2024 12:57:40 +0000
Received: by outflank-mailman (input) for mailman id 783962;
 Tue, 27 Aug 2024 12:57:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQW3=P2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sivlT-0008GS-AI
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 12:57:39 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2416::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edfbf22a-6473-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 14:57:36 +0200 (CEST)
Received: from DS7PR03CA0202.namprd03.prod.outlook.com (2603:10b6:5:3b6::27)
 by SJ2PR12MB9006.namprd12.prod.outlook.com (2603:10b6:a03:540::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Tue, 27 Aug
 2024 12:57:27 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:5:3b6:cafe::28) by DS7PR03CA0202.outlook.office365.com
 (2603:10b6:5:3b6::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25 via Frontend
 Transport; Tue, 27 Aug 2024 12:57:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Tue, 27 Aug 2024 12:57:27 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 Aug
 2024 07:57:26 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 27 Aug 2024 07:57:24 -0500
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
X-Inumbo-ID: edfbf22a-6473-11ef-99a0-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FmTIgfarZmbGwD/jYQRyg533hdAg0rKn7gejPFU71k01fZ7Es92Pjr2o21HRmYXsjMBKMpbxcg3Ux5DF30HSp9aapU6TeBr9A7Zs2Tfxa0kzgqjo/BZB7/0w3B9OyM7Gxv2bCH9Zpo0acU8YayhtfCMM/FImBMBzyJw6z1hMaFbmzja7WxWBeQVCEo6HUs06U1SbGwyWc6DN0RajzQgYZqiLeI894m55QQAq4hwEZaeWEEk2ZKqwf2+QCwu85z+pdQUSCXK3tWR2A9ZWSl5f6/O+o20sRUG2mhfM2UvBs4ftwCxhivGU14hqQJW+zb9d1WNVzc0KCBpI907r5QAtuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuxYWRIwAEFWuqr//NuVQZLc/Pq2XWitwRavP23NVtI=;
 b=MJtOrPz0DHbcA/kYcoN57300JhpfJ0yv9j0CH3mMNxYxF0KRjDlokPPqIE/RH/k7ceUnJ1QtwkXoIywHv2MGW4aP+Kw53JuIv5VshA0yC79I98GNpTUjf5lJ5HqWZtO3gaQgp2uyImvfL3nam8y6OVZP7ORDS9R1NkGsDSYtcdC8Ie8lCReRbvSFJ2b+YYmxk2o3eAWSComgCWj9fEa/v6D2YyEGE5kRhTVRwpuYAkzxiL2ahDZTKN08GUuys7q02RZ83KLYFfUF1xDOG2yzMlHDWqcO965Empl73/uWAeDa12Z58BMVz8zw35P1at3+wnl+eqLMU8NaHvfIc3aqvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuxYWRIwAEFWuqr//NuVQZLc/Pq2XWitwRavP23NVtI=;
 b=jo0V5/4gmTFDRAeJYF2lOYo1ZWq89E65CDgd9Hq8kI1kUOyqgJmZNrK3fIjHYhbDor45lXgYRuWOHeimbs3YrzFCuRP7qhoFJ3WYzAbuQMUBCCFZu6PERGOHSOoteLgsWQ5kf+JVB8lBiCmNB8i0wOnFAp1XNcI6zclEiQlFIBo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f3ef9244-9d16-47ab-bca3-d5bb4c34fcc2@amd.com>
Date: Tue, 27 Aug 2024 14:57:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM/vgic: Use for_each_set_bit() in vgic_to_sgi()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Jan Beulich <JBeulich@suse.com>
References: <20240823230100.1581448-1-andrew.cooper3@citrix.com>
 <6513e2ea-0471-41ca-b328-ce1bc1deddaf@amd.com>
 <a4c0b1d3-ff7a-4ea5-bffb-756125a434af@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <a4c0b1d3-ff7a-4ea5-bffb-756125a434af@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|SJ2PR12MB9006:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e44186c-b3dd-4b46-fc7b-08dcc697ce00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHV5YzN5YmtPbXdTdEw3TVRicDZwUUF1RStRMElhdTdDRGNKcm5Tb3BTR0k5?=
 =?utf-8?B?aGtza0lZTGVsVkxkWFhBVTdPNGNPNUpYMXgxUjZVMkg2Z25TS1A1NTExU2ts?=
 =?utf-8?B?cEJYMFNVSUd2UFR0emNDY3JnRzI4NForRWExRHlHcEI0T0diMEpyVHd5enl2?=
 =?utf-8?B?MkRlTm9GOWF1WVp6anhxWmE5VWtNZ3BtRjZpUTJqN3dwaEJUZi9mNFBidWMw?=
 =?utf-8?B?K1BHeTBtUG14S1NneitxUG9xQUp1M1hRMm5oRzl3YnN3SUt6TWdhMHg2NENO?=
 =?utf-8?B?MTR2MW1ya1cyTlpEelZBUVFXSVV4THhtQWxBT3JHaUVHZDF3d20zbkR2bkhS?=
 =?utf-8?B?ZUhZRDFDU3Bwa2xvL3RmUEdjS1p5MDJDd3Azbi9lM1JUbGxMNm4zakQwdDNC?=
 =?utf-8?B?UjYrNjcxN1FrTFBIa3I3K1VKQ3JlWGgvbGsyVEFxNmZYYnBmL3NFTnMxaWJV?=
 =?utf-8?B?K0hrVUJobE01UnVlRUtINjVPRWVkK3E0bDNqRkpCRkM3cXVwU2FGWnl5bTlh?=
 =?utf-8?B?MTFiRCtEaEsvU0dRN0hrbFl3MzhQZkRoeGxTWVNvMGRJUVkycGc3WWEwR1FZ?=
 =?utf-8?B?TlZtZmpheEVDdUlQeGptZTI5S2luZGtHOG9aZUJLN2FFa3lOam9jYmpMaWkv?=
 =?utf-8?B?SWlRcDdlRjNHS1NvS0tkR2lHanZFTG5FbFkzTk5scGlKdGh0aURaMXo2U3Jt?=
 =?utf-8?B?MW95MmtvZlBZVzFMelErSmNudCt2bm80UWtJT3pwSWdHR0ViT1VVMXZHVkIr?=
 =?utf-8?B?YkhQQlNJTmgrQ0IzZ3RRaUErczBKaFpkcysyZ3F5VGxHb0YzRXkrNkhIY0tT?=
 =?utf-8?B?QkhJZjVrcUlJeEwvVXJFT2VGblhpNjR1d2YzYnk1anBtcTFMV2IyaHFlWU1p?=
 =?utf-8?B?cXI0YlltZkhSK29CeWZsUmlyQVdjMTd2WnZQdS9iL1Fla3ExZld2d05TcDR6?=
 =?utf-8?B?SzJMZncwQVYvVXo1WDNkMVRsdVBQWGJoc0trNVdSNUtXUEg5VmxwK0k3bEtk?=
 =?utf-8?B?dEp5aUdQUlJvMDVETjh0Q1JhUjVZT3IvYXB2ejlDWmwrMlhoWW9FOGEveTRX?=
 =?utf-8?B?cm9VVlJpU2c0aGRaM0k1N2hYd3FVUW5DSUJkY3ErUHpKQW14akJzTHpwRXpU?=
 =?utf-8?B?LzFtTVh1Tnhlc0hQQVA5bnArZWYvdWJpRURNZ2liR3dLZFBSQy9ZbXBlWnFX?=
 =?utf-8?B?N01JWC9heXl4NGpxcUVvWUY5Y1BTY2U1aENINUNkNGc4VXQvRkdCVi90aXJ1?=
 =?utf-8?B?QzlCalRQSXBHODdsWU1qbVRZSDY5VGRXZnNMMUJaRTVLc3dGSUZHY3VZQmdx?=
 =?utf-8?B?YWhWN04zYmhJdHlVcU1vZlRhekozMC9nakN2a3NNVlRUUHhTa1owR3dMSlJW?=
 =?utf-8?B?Ky9JZDJDRFVCU25DT2NmOTIyVi8vay9qVWgrWFpzMWgzWEI5ZmJMdGdncEw5?=
 =?utf-8?B?TlVneHZURlhxempSRTRDM2h5b0xlbUk4VWZnNGo5M2xoNDVRRkxMN1pPc21M?=
 =?utf-8?B?aVZqV1IrV29wdjNvdjhjOUpuYmJFZXZMcVlQYjZHckxyWktFQnFwU2hXYklT?=
 =?utf-8?B?ejJnRTFIR080WDJvUU9hb1ZrNmhEV0xaUVF0ZFBGMFg2WnVXSVh1VzlMSTBT?=
 =?utf-8?B?UndXRUkzU3owaUNMUkZFN2ZTd2RKRWhwVXkvc2FNYzdTSTdPY0xlUDkybUJs?=
 =?utf-8?B?cGhYbXhLWEoxajg2N2pZVkV2bG4zR3hpbjdvV1BJdVF1bFA1cjJ3c1FMbGdv?=
 =?utf-8?B?ajVVZCs0cFFqTVRzR2lnaTlOeXZHRTZCSWc4eW1LaWZzWkdHUGhHbTZVUHBG?=
 =?utf-8?B?cTB1QnBURlFpeFNwRFg5U1lTTnJRVGJEVVNvbFBHbTNmNDNIaEI4UEpqY2E2?=
 =?utf-8?B?R3RwaGJpakdxcDV2d2tJQlNhWFdRMGpjZWlhTUVsT3ZYNFh0UllDMnZvTzlK?=
 =?utf-8?Q?Lwx1jvxbBs2yVjdSbG1O11/NhWpr8iRt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 12:57:27.6737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e44186c-b3dd-4b46-fc7b-08dcc697ce00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9006



On 27/08/2024 14:20, Andrew Cooper wrote:
> 
> 
> On 27/08/2024 1:13 pm, Michal Orzel wrote:
>>
>> On 24/08/2024 01:01, Andrew Cooper wrote:
>>>
>>> The existing expression is just a very complicated way of expressing a loop
>>> over all bits of target->list.  Simplify the expression.
>>>
>>> While here, fix the two gprintk()'s.  Because of a quotes vs line continuation
>>> issue, there's a long string of spaces in the middle of the format string.
>>>
>>>   $ strings xen-syms-arm32 | grep -e VGIC -e GICD_SGIR
>>>   <G><1>%pv VGIC: write r=%08x                         target->list=%hx, wrong CPUTargetList
>>>   <G><1>%pv vGICD:unhandled GICD_SGIR write %08x                  with wrong mode
>>>
>>> not to mention trailing whitespace too.
>>>
>>> Rewrite them to be more consise and more useful.  Use 0x prefixes for hex,
>> s/consise/concise
>>
>>> rather than ambigous, and identify the problem target vCPU / mode, rather than
>> s/ambigous/ambiguous
>>
>>> simply saying somethign was wrong.
>> s/somethign/something/
>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>>> CC: Michal Orzel <michal.orzel@amd.com>
>>> CC: Jan Beulich <JBeulich@suse.com>
>>>
>>> In a fun twist, we can't use target->list directly in the expresion, because
>>> the typeof() picks up constness from the pointer, and we get:
>>>
>>>   In file included from arch/arm/vgic.c:11:
>>>   arch/arm/vgic.c: In function ‘vgic_to_sgi’:
>>>   ./include/xen/bitops.h:305:19: error: assignment of read-only variable ‘__v’
>>>     305 |               __v &= __v - 1 )
>>>         |                   ^~
>>>   arch/arm/vgic.c:483:9: note: in expansion of macro ‘for_each_set_bit’
>>>     483 |         for_each_set_bit ( i, target->list )
>>>         |         ^~~~~~~~~~~~~~~~
>>>
>>> Sadly we need -std=c23 before we can use typeof_unqual() which is what we
>>> actually want here.
>>> ---
>>>  xen/arch/arm/vgic.c | 16 ++++++++--------
>>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
>>> index 7b54ccc7cbfa..081cbb67fb52 100644
>>> --- a/xen/arch/arm/vgic.c
>>> +++ b/xen/arch/arm/vgic.c
>>> @@ -470,8 +470,7 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
>>>      struct domain *d = v->domain;
>>>      int vcpuid;
>>>      int i;
>>> -    unsigned int base;
>>> -    unsigned long int bitmap;
>>> +    unsigned int base, bitmap;
>>>
>>>      ASSERT( virq < 16 );
>>>
>>> @@ -481,15 +480,16 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
>>>          perfc_incr(vgic_sgi_list);
>>>          base = target->aff1 << 4;
>>>          bitmap = target->list;
>>> -        bitmap_for_each ( i, &bitmap, sizeof(target->list) * 8 )
>>> +
>>> +        for_each_set_bit ( i, bitmap )
>>>          {
>>>              vcpuid = base + i;
>>>              if ( vcpuid >= d->max_vcpus || d->vcpu[vcpuid] == NULL ||
>>>                   !is_vcpu_online(d->vcpu[vcpuid]) )
>>>              {
>>> -                gprintk(XENLOG_WARNING, "VGIC: write r=%"PRIregister" \
>>> -                        target->list=%hx, wrong CPUTargetList \n",
>>> -                        sgir, target->list);
>>> +                gprintk(XENLOG_WARNING,
>>> +                        "vGIC: write %#"PRIregister", target->list=%#x, bad target v%d\n",
>> Sth like "bad target v2" where the word vcpu does not occur anywhere in the msg can be ambiguous.
>> Can you add the word vcpu e.g. "bad vcpu target v%d" or "bad target vcpu %d"
> 
> Hmm yeah, v%d doesn't work quite so well when it's not prefixed with d%d.
> 
> Would you be happy with d%dv%d?  It's marginally more informative and
> shorter.
I don't think we can target a different domain with SGIs, so it does not make much sense to print domain id if
it always stays the same as the leading %pv from gprintk.

~Michal

