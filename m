Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A251A823F60
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 11:20:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661480.1031189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLKpD-00055q-3M; Thu, 04 Jan 2024 10:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661480.1031189; Thu, 04 Jan 2024 10:19:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLKpD-00052d-0Y; Thu, 04 Jan 2024 10:19:43 +0000
Received: by outflank-mailman (input) for mailman id 661480;
 Thu, 04 Jan 2024 10:19:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nu+b=IO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rLKpB-00052X-G3
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 10:19:41 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3f53e26-aaea-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 11:19:39 +0100 (CET)
Received: from DM6PR07CA0100.namprd07.prod.outlook.com (2603:10b6:5:337::33)
 by MW3PR12MB4425.namprd12.prod.outlook.com (2603:10b6:303:5e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.14; Thu, 4 Jan
 2024 10:19:34 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:5:337:cafe::4e) by DM6PR07CA0100.outlook.office365.com
 (2603:10b6:5:337::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15 via Frontend
 Transport; Thu, 4 Jan 2024 10:19:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Thu, 4 Jan 2024 10:19:33 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 4 Jan
 2024 04:19:33 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 4 Jan
 2024 04:19:32 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Thu, 4 Jan 2024 04:19:30 -0600
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
X-Inumbo-ID: c3f53e26-aaea-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zqme9GvYB/3pHY6YJo5dFciA09NExqYQoZpXVmteaRCZ3uy1vGEk+APyyG8qG3Msu4ftUdYAqjHuZVMrAGNrmbtYevChATMR9j7Y1meCuBfeD3zZ4RAKhpsNJYVdKJXnsimFPhnB6Uqe7F8CDmZzBU/sPDsFzoW2hQwFEllU2zLQlVAf/8ln69JMQap55rQMzVF8+PHhZ2UsKSk4YB8CkSVEruGAuNVIq0n6CO4KhAJnDFATEaKJ/tiyb7ED4zHzzpKPeeJIq1hMq7pE/8JG2ce+tRzKQidiZ8S6JrSnHYpyiait5/0E5aWmeuibZE8hEyB37wfOa90FU8kJCKU14g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56/EsmmJAImuc/HA8mpDJl0CaOzEPeNKFyL0hwjUg9o=;
 b=BXaKHpRlKRuzo67VUXpZ/oT3dmlNg20Y21hF0FGuFUrR/Uc6SIl+BOtn7T9xAfNt/2Yb/I9zrLnpND97v1Eh4jJ/RWUkohIoyfI3i06PfbHfkzBuY3TqkzTAf9bKpNliwpCA4nRwKUv9zU59oOTZRDUUjGls3cxKS3Krc4dLSvu2MJJCaq7yzt0yCjw5jIc0f+XkNzXN89tHApL8Hbud0AClIefhn2O/0s4OWDE/Rn+HRPYKuGrV+W3D6VwsleigkCY5Ij81mrB6nbVfMdpA5n2IDPgZ4nqC9/gqZPmKZoP7cq94leRkWteOYys9Vvy+LoxxDj21deQaKNLIep+4IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56/EsmmJAImuc/HA8mpDJl0CaOzEPeNKFyL0hwjUg9o=;
 b=M3+//y0Y8imNJ/ayYrAC7cWX/dZ+TXJo2HPlwIxuxFUTqAM5JzHRnmouKtXMj85tse1qdATSXhzN3NbkiZwzKy2V+p11fTfm9pCPB7LR2T35JEi+65xkP0cW5G4SmFK1aRqjlv/L40tGc0vOWIdIRxVrRJGGmgLIzkmjyAPTbug=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <fbe44fb6-2be3-4720-8b8e-3a05c0307d25@amd.com>
Date: Thu, 4 Jan 2024 11:19:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/13] Arm cache coloring
To: Carlo Nonato <carlo.nonato@minervasys.tech>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <6d652309-50e1-4850-ac52-d086a3a32726@amd.com>
 <alpine.DEB.2.22.394.2401031601180.1322202@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2401031748040.1322202@ubuntu-linux-20-04-desktop>
 <CAG+AhRUAOcT9HTj+v4vfz6nqBG4FumYc1of9XcmyTYKtW-66yA@mail.gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CAG+AhRUAOcT9HTj+v4vfz6nqBG4FumYc1of9XcmyTYKtW-66yA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|MW3PR12MB4425:EE_
X-MS-Office365-Filtering-Correlation-Id: a11536a5-ed60-4777-96a9-08dc0d0ea5a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wpo6+kkQk8Aj4jZkBcD7TgQy2Nuf0cxpWGl4qhCyQyuV6S41gLNWqvVWcd6ZDyqAVwEI03O9V8ocJzcQz1UZCd7QaNH6yiGVp36Qq7dXhl6eVQtrbqMuyBHZaittbmNcD6tDyAtOXonm+EU14A+VYzuXAYcTRkt2aOf84g9MeWbdUxChTpY5TkaH34GJ99sNWwT5ap9NNkrHr68SUmuLpsJD3J7mVCLFBQ5DpNDfYuq1rqIeTfsFnqxIM83KJ6kCYKX2ma+dWjjIgtoyanYkX7OlGXY71UR0iEfwnFoQNUQbEENsMCjPCDaOw+z4roEHtdS1XjyzGVaNeQsqE1OtaLW6bPt6HkG2Lv42OBOwtlx+HRfCAXbuSCERtanRAAX08bafxZ/FGj8IAiEUahvCYDK6MWoXx4HqCCc1U7r0X3MaVLzc5O5LJYLQl3thWSMiGUFyCANewaVaDoB0dLO9p5I6FtlGSPAEv/NxgSpcbxnov+JP55BcqPVv5RnpJ2tKoDfh59RGkFc+e2oEjK5u0Ku5rBgx7XQEiuPlGTi9wVbvotN/U435cU0Qe4XCGM9KBKWg9eRQ67ZwKRPMBHYJjwt8svJ8y/p6O+z9jXyBqwjH8kuhTQUDyX+qw1qz2JTvDnpTA2SLnxQ5fPOy0oIeTFr1ZZFdlPdbk2vZAFLjmWql4/szWgj3anmC+BWvqcE6EQMMtfzi/UycKDqbFX+8Eo4RHU3lVBn+2maVMsszGyD1VaLGYut5+a3wdPQFwD58RZS9Z4T69nBPkE/1gjoeM5udfX4116BYB64i+JeQGsE2fUjE6BLwpV+co8codgnE
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(82310400011)(186009)(36840700001)(40470700004)(46966006)(86362001)(31696002)(36756003)(356005)(81166007)(478600001)(53546011)(70206006)(70586007)(31686004)(54906003)(16576012)(110136005)(26005)(336012)(2616005)(44832011)(426003)(7416002)(5660300002)(2906002)(8936002)(8676002)(316002)(4326008)(36860700001)(82740400003)(40480700001)(40460700003)(83380400001)(47076005)(41300700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 10:19:33.8575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a11536a5-ed60-4777-96a9-08dc0d0ea5a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4425



On 04/01/2024 10:37, Carlo Nonato wrote:
> 
> 
> Hi Stefano,
> 
> On Thu, Jan 4, 2024 at 2:55 AM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
>>
>> On Wed, 3 Jan 2024, Stefano Stabellini wrote:
>>> Also I tried this patch series on the "staging" branch and Xen failed to
>>> boot, no messages at all from Xen so it must be an early boot failure. I
>>> am passing this command line options to Xen and running it on QEMU:
>>>
>>> dom0_mem=1024M dom0_max_vcpus=1 xen-llc-colors=0 dom0-llc-colors=1-5 llc-way-size=65535 llc-coloring=true
>>
>> I managed to make it to work successfully with the following command
>> line:
>>
>> xen-llc-colors=0 dom0-llc-colors=1-5 llc-way-size=64K llc-coloring=on
>>
>> I think the problem was llc-way-size that needs to be rounded up (64K
>> instead of 65535).
>>
>> Also I found a few build issues when building for other architectures or
>> different kconfig options. This patch addresses those issues (however it
>> is not to be taken as is as the build issues should not be introduced in
>> the first place and there are probably better way to fix them, but I
>> hope it can help).
>>
>> Cheers,
>>
>> Stefano
>>
>>
>> diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
>> index f434efc45b..efe5cf3c23 100644
>> --- a/xen/arch/arm/llc-coloring.c
>> +++ b/xen/arch/arm/llc-coloring.c
>> @@ -39,7 +39,7 @@ static unsigned int __ro_after_init xen_num_colors;
>>
>>  #define mfn_color_mask              (nr_colors - 1)
>>  #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
>> -#define mfn_set_color(mfn, color)   ((mfn_x(mfn) & ~mfn_color_mask) | (color))
>> +#define mfn_set_color(mfn, color)   (_mfn((mfn_x(mfn) & ~mfn_color_mask) | (color)))
> 
> Thanks for spotting this.
> 
>>  /*
>>   * Parse the coloring configuration given in the buf string, following the
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index 3bb0c9221f..bf16703e24 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -610,10 +610,10 @@ void __init setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr)
>>      pte.pt.table = 1;
>>      xen_second[second_table_offset(FIXMAP_ADDR(0))] = pte;
>>
>> +#ifdef CONFIG_ARM_64
>>      if ( llc_coloring_enabled )
>>          ttbr = virt_to_maddr(virt_to_reloc_virt(xen_pgtable));
>>      else
>> -#ifdef CONFIG_ARM_64
>>          ttbr = (uintptr_t) xen_pgtable + phys_offset;
>>  #else
>>          ttbr = (uintptr_t) cpu0_pgtable + phys_offset;
>> diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
>> index 7cd481e955..516139c4ff 100644
>> --- a/xen/include/xen/llc-coloring.h
>> +++ b/xen/include/xen/llc-coloring.h
>> @@ -21,7 +21,27 @@
>>  extern bool llc_coloring_enabled;
>>  #define llc_coloring_enabled (llc_coloring_enabled)
>>  #endif
>> -
>> +#else
>> +static inline void *xen_remap_colored(mfn_t xen_fn, paddr_t xen_size)
>> +{
>> +    return NULL;
>> +}
>> +static inline int domain_set_llc_colors_from_str(struct domain *d, const char *str)
>> +{
>> +    return -ENOSYS;
>> +}
>> +static inline int dom0_set_llc_colors(struct domain *d)
>> +{
>> +    return 0;
>> +}
>> +static inline bool llc_coloring_init(void)
>> +{
>> +    return false;
>> +}
>> +static inline paddr_t xen_colored_map_size(paddr_t size)
>> +{
>> +    return 0;
>> +}
>>  #endif
>>
>>  #ifndef llc_coloring_enabled
> 
> Sorry for the compilation mess.
> 
> This is definitely a solution, but I wonder if the best thing to do would be
> to move all signatures in the common header, without the stubs, relying again
> on DCE. This seems a little strange to me because users of some of those
> functions are only in arm code, and they always have to be protected with
> llc_coloring_enabled global variable/macro if, but it works (now I'm
> compiling also for arm32 and x86).
There are a lot of places in Xen relying on DCE, so I'd be ok with that (you can wait
for Stefano's opinion). Furthermore, you already rely on that in case of e.g. domain_set_llc_colors_domctl,
domain_llc_coloring_free.

~Michal

