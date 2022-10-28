Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18379610D6C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 11:36:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431851.684473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooLmz-00011v-QV; Fri, 28 Oct 2022 09:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431851.684473; Fri, 28 Oct 2022 09:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooLmz-0000yS-NF; Fri, 28 Oct 2022 09:36:33 +0000
Received: by outflank-mailman (input) for mailman id 431851;
 Fri, 28 Oct 2022 09:36:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ToJk=25=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ooLmx-0000yI-3p
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 09:36:31 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe1a5e0a-56a3-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 11:36:27 +0200 (CEST)
Received: from BN9PR03CA0572.namprd03.prod.outlook.com (2603:10b6:408:10d::7)
 by CH2PR12MB4922.namprd12.prod.outlook.com (2603:10b6:610:65::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Fri, 28 Oct
 2022 09:36:24 +0000
Received: from BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::d7) by BN9PR03CA0572.outlook.office365.com
 (2603:10b6:408:10d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14 via Frontend
 Transport; Fri, 28 Oct 2022 09:36:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT035.mail.protection.outlook.com (10.13.177.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 09:36:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 28 Oct
 2022 04:36:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 28 Oct
 2022 04:36:23 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Fri, 28 Oct 2022 04:36:22 -0500
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
X-Inumbo-ID: fe1a5e0a-56a3-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpE3cS477FHgdF4hAthAozkm/EbhDyOV4VSA7c85DOEL7KiFDBTkD6KS5+CQ8/MUFc/ye2pOP8GRiYnjiZCJDWWF6Ep2QFW3EJjO7072vPD+MggIm0IlWED357H83dBc9uQYHyNv7gR1wmeRzWBcFIVIc58iO0P6KNB1j759Pw0Hz8/VZOCK2hK5Mdu2kHoDc3EVEt5vqoO3Heb0l4ezUFkAg/K9jYSXxea3Qaww/zdl5aU43FBqoE2o9qymdPaSe27HLcv9PGeHTicQd58B1BZPk7cBq/vqDyIX7nrN83lJQx8BmWqHylRGfRWg2CEHPAs9ttkHltK4BEERlFO2Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFyMI16L8NG++G/MAxE4y4FnFfJTFapEsVSkvT3B5Rw=;
 b=FYaLd9AJWNYSlU4Xb28RiH5tCU/CMrIrfwDahLJHgzW/rDU6l47LoIp6srOlhiB36lPTr47rQ4oE5kRArvvRuUzJ7+FPZMTZQ70xNZN2lSew+iGnt/suk2tzL3Z0G1SusPMBiqDkxLv4nQRT0cOnOaTkUEJx4Gwuv60OlvbYaocL+O1VsC49m19L6S3pbvJPIQSTxhINOWjKyo4eWevfs3s5+Df/y4GnudtzgEJbCdjY6vg8CdykO2je6TdrFKyAzDBXbCXmZSRWt5ZxnysdGiad/W7NqOtpJiTjCNVwiMC0fv2HyzAvtDYnkCAyjV/0bIMMnWdChAFAHHDXgCgJBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFyMI16L8NG++G/MAxE4y4FnFfJTFapEsVSkvT3B5Rw=;
 b=SPADtIgQS9WAyK5DxDnlWD2RoQhFMThsWBfyUptxSoikVI9R3yTrvq/DWT/dArT8/cS5bkkb1hqI8IDPLSZs3P9R3hx3iCcEdEj1EvuAPwtDCS1B3+OFk+Vyoskrww/pf8XjhZqjlRdBrXqKDb1PHzVa5FDr+k9ifMPcMP174PM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6413650b-efc4-8feb-2e70-f54044cdb0ef@amd.com>
Date: Fri, 28 Oct 2022 11:36:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] xen/arm: Do not route NS phys timer IRQ to Xen
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221028075630.32261-1-michal.orzel@amd.com>
 <ecd3e603-b1d1-210b-1212-3b9151f4bc3d@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <ecd3e603-b1d1-210b-1212-3b9151f4bc3d@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT035:EE_|CH2PR12MB4922:EE_
X-MS-Office365-Filtering-Correlation-Id: e8fd77b3-9e71-4734-d7ed-08dab8c7e0d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BmtbOueOwK9JD3d/WM6rcgchYiufgIpjAxefJykiMZMQt533TFP7VgQVfpsLQQEm3jXjx3KkpKj0udM9Bp+Pgrs7JMiKP7sPcGihQY1/CqgL2c2pTIMnkroK03DfxVZfNGXwdv/EQTUQZewesnYNJzSbze7Kp2cI8YkEIW3g3jP6awdk4fAOuKxdN7GUL7tlzwEvIl2WN3LR5X6n/eYY+jeOjViP7zPUimugTqFoi9k6AlcatotUmOIB3qUTuL5OEKLz0L9v+pSmQMN5FwDsx1v8ola5mMXV6mPgDOd3qK4cPnW1Bt7lImK6rqAa9+CLX6oC+CCz2Jsm/p902jZjya3ine+3pgJfg/vHRez5eiScUnEsPRq41KYLkaedfyXAbTSAKw/ui5QWjL8n29KKcuxRD/auENjogzT5FPJpJcd+INCYW9JFX0nQJm1CuO64/jj+dz2Mfw63RuVDfym4nYg0itRR7+PYaTBGphCQ55s/6bV9XXdBiMP4c9uBU14+skqdycGtEbptWyDqYdiZteyRG2I6Gy8amlaodkETT8tE7X8VNqQkRtZyMMcS6Gd29l+FUZtRB2ODVG4HU4TotBu5mJyh/pTKtbE8Z4azqKK/tUNlA2V0rgfExcs4LW2OOWhgyiJd60xOGa9scQKfOZm03d/z99TyER33lK0EN1GOjTkLTPA3aSQ84PPzfw9LwoNzHgcxPN/vyrtZgAmOP2kUvloKZl3UT/3veDqjRIXKJ7fWEFr6EVmriTIeM2VyOy7hnwDOr0BcBrTUav18rqBAtMyOBWRMxeH1F3oUgI1EGSNCyrc4idGnqZL5a88WPSoE+sMWGeXs6EVqA6FnFPcokDUHM0H77DO+URpBTg4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199015)(46966006)(40470700004)(36840700001)(478600001)(966005)(31686004)(45080400002)(356005)(82740400003)(81166007)(110136005)(8936002)(54906003)(16576012)(316002)(86362001)(83380400001)(31696002)(41300700001)(8676002)(70206006)(426003)(70586007)(4326008)(26005)(47076005)(5660300002)(82310400005)(44832011)(40460700003)(2616005)(186003)(36860700001)(2906002)(53546011)(36756003)(336012)(40480700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 09:36:23.5950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8fd77b3-9e71-4734-d7ed-08dab8c7e0d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4922

Hi Julien,

On 28/10/2022 11:03, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 28/10/2022 08:56, Michal Orzel wrote:
>> At the moment, we route NS phys timer IRQ to Xen even though it does not
>> make use of this timer. Xen uses hypervisor timer for itself and the
>> physical timer is fully emulated, hence there is nothing that can trigger
>> such IRQ. This means that requesting/releasing IRQ ends up as a deadcode
>> as it has no impact on the functional behavior, whereas the code within
>> a handler ends up being unreachable. This is a left over from the early
>> days when the CNTHP IRQ was buggy on the HW model used for testing and we
>> had to use the CNTP instead.
>>
>> Remove the calls to {request/release}_irq for this timer as well as the
>> code within the handler. Since timer_interrupt handler is now only used
>> by the CNTHP, remove the IRQ affiliation condition. Keep the calls to
>> zero the CNTP_CTL_EL0 register on timer init/deinit for sanity and also remove
>> the corresponding perf counter definition.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> Based on the outcome of the following discussion:
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fxen-devel%2Fd55938a3-aaca-1d01-b34f-858dbca9830b%40amd.com%2F&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C4df8dc89b3124eb8f51608dab8c35ab3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638025446431622763%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=qeZR%2BBvOwKA9PKjq2xemSXhJ1Xij%2F%2FMWKADD70vrwW0%3D&amp;reserved=0
>> ---
>>   xen/arch/arm/include/asm/perfc_defn.h |  1 -
>>   xen/arch/arm/time.c                   | 16 +---------------
>>   2 files changed, 1 insertion(+), 16 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
>> index 31f071222b24..3ab0391175d7 100644
>> --- a/xen/arch/arm/include/asm/perfc_defn.h
>> +++ b/xen/arch/arm/include/asm/perfc_defn.h
>> @@ -70,7 +70,6 @@ PERFCOUNTER(spis,                 "#SPIs")
>>   PERFCOUNTER(guest_irqs,           "#GUEST-IRQS")
>>
>>   PERFCOUNTER(hyp_timer_irqs,   "Hypervisor timer interrupts")
>> -PERFCOUNTER(phys_timer_irqs,  "Physical timer interrupts")
>>   PERFCOUNTER(virt_timer_irqs,  "Virtual timer interrupts")
>>   PERFCOUNTER(maintenance_irqs, "Maintenance interrupts")
>>
>> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
>> index dec53b5f7d53..3160fcc7b440 100644
>> --- a/xen/arch/arm/time.c
>> +++ b/xen/arch/arm/time.c
>> @@ -222,8 +222,7 @@ int reprogram_timer(s_time_t timeout)
>>   /* Handle the firing timer */
>>   static void timer_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
>>   {
>> -    if ( irq == (timer_irq[TIMER_HYP_PPI]) &&
>> -         READ_SYSREG(CNTHP_CTL_EL2) & CNTx_CTL_PENDING )
>> +    if ( READ_SYSREG(CNTHP_CTL_EL2) & CNTx_CTL_PENDING )
> 
> AFAICT, this condition is meant to be true most of the times. So as you
> are modifying the code, could you take the opportunity to add a
> "likely()"? Or better invert the condition so the code below is not
> indented.

Sure thing. I can take the opportunity to do the following:
if ( unlikely(!(READ_SYSREG(CNTHP_CTL_EL2) & CNTx_CTL_PENDING)) )
    return;

Also, shouldn't we reflect the purpose of this handler by renaming it
from timer_interrupt to htimer_interrupt (or hyp_timer_interrupt) to be consistent
with the naming (i.e. vtimer_interrupt -> virtual, timer_interrupt -> quite ambiguous given the usage)?

> 
> Cheers,
> 
> --
> Julien Grall

~Michal

