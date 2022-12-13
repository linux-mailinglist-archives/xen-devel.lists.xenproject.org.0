Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 642A164B1EC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 10:12:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460294.718178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p51Jq-00052y-Kl; Tue, 13 Dec 2022 09:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460294.718178; Tue, 13 Dec 2022 09:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p51Jq-000508-Gx; Tue, 13 Dec 2022 09:11:22 +0000
Received: by outflank-mailman (input) for mailman id 460294;
 Tue, 13 Dec 2022 09:11:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nvb8=4L=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p51Jo-000502-Ra
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 09:11:21 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19ccac8c-7ac6-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 10:11:18 +0100 (CET)
Received: from BN9PR03CA0284.namprd03.prod.outlook.com (2603:10b6:408:f5::19)
 by CH2PR12MB4168.namprd12.prod.outlook.com (2603:10b6:610:a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 09:11:11 +0000
Received: from BL02EPF00010208.namprd05.prod.outlook.com
 (2603:10b6:408:f5:cafe::cf) by BN9PR03CA0284.outlook.office365.com
 (2603:10b6:408:f5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Tue, 13 Dec 2022 09:11:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00010208.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.8 via Frontend Transport; Tue, 13 Dec 2022 09:11:10 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 13 Dec
 2022 03:11:09 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 13 Dec 2022 03:11:07 -0600
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
X-Inumbo-ID: 19ccac8c-7ac6-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQIIxcE43ZfTaWiEUyCmdvhCSDZZL2+Bu5zwKyrGHFxO80wLwZotBGWqsurs71QivnCd5DLOWDZPYV2eetnQX5WFwTZZ11ZvqnOIJg5O9OhW14EBuRoJ6MoyIT6kZ3yDKGJoBpbWI4XkFSrK7k5m2aPNw62XZGTl7qWXQ79Z3GzYN4GFHFt+AXC6TKSs5N463kPvnd9+7bchUnDTmvy2X+ZR6ZyP42/bwoCFnRP1QfrzRaYqcrF85KPlmZHny6Jcg6yGT0gZgHD5Wjplvt6EPdhDGdbjAPyIACErfvJCCBK14rOXva70e7gp4cPUyu2i7VJaKEyQkO3Qss6KGrWI6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0d+gSCbqUoMQdzRZw4S6A2uuAnzfg6ukRDb6/wWMlA=;
 b=mjnxVBw9O8Ag3a6S2aj2dKt9y3VnijcNwJFYMHCO13KcmXBavvyF876iAyAg13OXCIX/nM+ZMhrJZQub98dfGCBb/oJ+2bX5axm5CX3HNrQlxC6e6hIYBqTjUbyqkpAiUQfxLaT6oNotFUk1Uc3Wc+G7AHTptbjo52DVeQ5zrOxmLkMp19u9V7p61zXGK3ui3abV4LBeT68UE+wlI0TuhngtQK74r3PDwkI+GfwtP/HpGcq54Y5aSilSzXGunxgxA5ICJmFjHahjXmMk0jBXU/bORoem7PWBJhlGDQityKbuWEac6J4zFteSrH0iLvCXhekDeiQf/a9apDJExRfGNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0d+gSCbqUoMQdzRZw4S6A2uuAnzfg6ukRDb6/wWMlA=;
 b=jmcPRHg/9WBNXGIQrg9kYz4ttZbhZ5HVKhV3bLxvffOn4w6J6wkil787GGhhVHV0ZFP/uG2pEANSOAeKchuJE1Rgier81Zm7LzGEmsk+sMvNJB7grE0/lK9rwt/Qslj9zFzSPkQtTZbm0QY+xtU5xUQ5yOCJhsluQoe9/ts5J2s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <650bc040-63a9-8950-e2ff-6829c9a452a8@amd.com>
Date: Tue, 13 Dec 2022 10:11:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 01/18] xen/arm64: flushtlb: Reduce scope of barrier for
 local TLB flush
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221212095523.52683-1-julien@xen.org>
 <20221212095523.52683-2-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221212095523.52683-2-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010208:EE_|CH2PR12MB4168:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ef34891-280c-495e-6c89-08dadce9f9fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mRBHX9onAn0ATwDLboQfRcid/IpJDumN7rbynFFrlcxnmolm1pavslZPRwcLstWJwJorkGQ1+AZ5RKJt8sLB+aI76d+lysRWtk4i/77Hx9cWboLNGA/bmami9Ti14+iM6gdioryJ18Phyvi+xPSIdzEJP8nctLFXKLuzqhqVI6J8XEAxvWolY23a7q7a1UQLFBCigH/hWNyKkRZPOdBdnd42aMfuoE4S4HMgNYlZCPTJ+FCADvnvvX3EPT1i6pZRQfUTuU9JwOM/FbeQ3z7IHVfL+RaMx04n025ySSbKeWa4g8C4qW4266xNlIO0UIBv4B2bD4NIvllnksLgp+VOC/2FK8o8voPcdbq0XG7gwkI07/1wykKtlF+fT2FovV6enVYbdhuew0ykzg9fRyCanqddMvsYgHYXJcMm1RxL83zHBYGE+b2xiA1TKBlzQlLybzZxkEpPnOp7rThGu9lyyruegjKyIeA7M9PuOy/OTHqlvDTVW/g/b8O4h2J10zFjyGMOeS88OKfpDlRfuQQli+riB/sOJ8YZdZBi2P80CnFBs4mNtk1lF6wt43P8vgWf1/kEWNGE/pHQLzIaXxfA8rU5HkMfOKGPLM1gHSxvEFHzIJR0N9U1Shr+dQjbw5prYJVWsDLc5UZRpE51GGjAVo3Wor5lF7CjZxqrMbWN1kxXotVnFgxW9h3AZakkHweQTQLeOgGUUAGr7G/rWpYPH+YLVp/JzpWShgrwjgIj7Bszs9Zq11jQ7EVbes9ra7/h5D7p3udvjkgwt51COrgNiXxTSLuUkYMtXWcpq4P25H0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(46966006)(40470700004)(36840700001)(82310400005)(110136005)(41300700001)(70586007)(336012)(8676002)(70206006)(4326008)(31696002)(16576012)(5660300002)(54906003)(8936002)(36860700001)(316002)(36756003)(26005)(47076005)(82740400003)(356005)(81166007)(40480700001)(53546011)(478600001)(186003)(426003)(2616005)(40460700003)(86362001)(83380400001)(44832011)(2906002)(31686004)(36900700001)(43740500002)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 09:11:10.5438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef34891-280c-495e-6c89-08dadce9f9fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00010208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4168

Hi Julien,

On 12/12/2022 10:55, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> Per D5-4929 in ARM DDI 0487H.a:
> "A DSB NSH is sufficient to ensure completion of TLB maintenance
>  instructions that apply to a single PE. A DSB ISH is sufficient to
>  ensure completion of TLB maintenance instructions that apply to PEs
>  in the same Inner Shareable domain.
> "
> 
> This means barrier after local TLB flushes could be reduced to
> non-shareable.
> 
> Note that the scope of the barrier in the workaround has not been
> changed because Linux v6.1-rc8 is also using 'ish' and I couldn't
> find anything in the Neoverse N1 suggesting that a 'nsh' would
> be sufficient.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
>     I have used an older version of the Arm Arm because the explanation
>     in the latest (ARM DDI 0487I.a) is less obvious. I reckon the paragraph
>     about DSB in D8.13.8 is missing the shareability. But this is implied
>     in B2.3.11:
> 
>     "If the required access types of the DSB is reads and writes, the
>      following instructions issued by PEe before the DSB are complete for
>      the required shareability domain:
> 
>      [...]
> 
>      — All TLB maintenance instructions.
>     "
> 
>     Changes in v3:
>         - Patch added
> ---
>  xen/arch/arm/include/asm/arm64/flushtlb.h | 27 ++++++++++++++---------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
> index 7c5431518741..39d429ace552 100644
> --- a/xen/arch/arm/include/asm/arm64/flushtlb.h
> +++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
> @@ -12,8 +12,9 @@
>   * ARM64_WORKAROUND_REPEAT_TLBI:
Before this line, in the same comment, we state DSB ISHST. This should also be changed
to reflect the change done by this patch.

>   * Modification of the translation table for a virtual address might lead to
>   * read-after-read ordering violation.
> - * The workaround repeats TLBI+DSB operation for all the TLB flush operations.
> - * While this is stricly not necessary, we don't want to take any risk.
> + * The workaround repeats TLBI+DSB ISH operation for all the TLB flush
> + * operations. While this is stricly not necessary, we don't want to
s/stricly/strictly/

> + * take any risk.
>   *
>   * For Xen page-tables the ISB will discard any instructions fetched
>   * from the old mappings.
> @@ -21,38 +22,42 @@
>   * For the Stage-2 page-tables the ISB ensures the completion of the DSB
>   * (and therefore the TLB invalidation) before continuing. So we know
>   * the TLBs cannot contain an entry for a mapping we may have removed.
> + *
> + * Note that for local TLB flush, using non-shareable (nsh) is sufficient
> + * (see D5-4929 in ARM DDI 0487H.a). Althougth, the memory barrier in
s/Althougth/Although/

> + * for the workaround is left as inner-shareable to match with Linux.
So for the workaround we stay with DSB ISH. But ...

>   */
> -#define TLB_HELPER(name, tlbop)                  \
> +#define TLB_HELPER(name, tlbop, sh)              \
>  static inline void name(void)                    \
>  {                                                \
>      asm volatile(                                \
> -        "dsb  ishst;"                            \
> +        "dsb  "  # sh  "st;"                     \
>          "tlbi "  # tlbop  ";"                    \
>          ALTERNATIVE(                             \
>              "nop; nop;",                         \
> -            "dsb  ish;"                          \
> +            "dsb  "  # sh  ";"                   \
... you do not adhere to this.

>              "tlbi "  # tlbop  ";",               \
>              ARM64_WORKAROUND_REPEAT_TLBI,        \
>              CONFIG_ARM64_WORKAROUND_REPEAT_TLBI) \
> -        "dsb  ish;"                              \
> +        "dsb  "  # sh  ";"                       \
>          "isb;"                                   \
>          : : : "memory");                         \
>  }
> 
>  /* Flush local TLBs, current VMID only. */
> -TLB_HELPER(flush_guest_tlb_local, vmalls12e1);
> +TLB_HELPER(flush_guest_tlb_local, vmalls12e1, nsh);
> 
>  /* Flush innershareable TLBs, current VMID only */
> -TLB_HELPER(flush_guest_tlb, vmalls12e1is);
> +TLB_HELPER(flush_guest_tlb, vmalls12e1is, ish);
> 
>  /* Flush local TLBs, all VMIDs, non-hypervisor mode */
> -TLB_HELPER(flush_all_guests_tlb_local, alle1);
> +TLB_HELPER(flush_all_guests_tlb_local, alle1, nsh);
> 
>  /* Flush innershareable TLBs, all VMIDs, non-hypervisor mode */
> -TLB_HELPER(flush_all_guests_tlb, alle1is);
> +TLB_HELPER(flush_all_guests_tlb, alle1is, ish);
> 
>  /* Flush all hypervisor mappings from the TLB of the local processor. */
> -TLB_HELPER(flush_xen_tlb_local, alle2);
> +TLB_HELPER(flush_xen_tlb_local, alle2, nsh);
> 
>  /* Flush TLB of local processor for address va. */
>  static inline void  __flush_xen_tlb_one_local(vaddr_t va)
> --
> 2.38.1
> 

With the remarks fixed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


