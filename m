Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E77866C8C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 09:40:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685316.1065831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWWH-0005Y3-0m; Mon, 26 Feb 2024 08:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685316.1065831; Mon, 26 Feb 2024 08:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWWG-0005Uq-T9; Mon, 26 Feb 2024 08:39:28 +0000
Received: by outflank-mailman (input) for mailman id 685316;
 Mon, 26 Feb 2024 08:39:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5KjY=KD=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1reWWF-0005TO-Ee
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 08:39:27 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ab53c5a-d482-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 09:39:24 +0100 (CET)
Received: from CY5PR13CA0042.namprd13.prod.outlook.com (2603:10b6:930:11::10)
 by CY5PR12MB6646.namprd12.prod.outlook.com (2603:10b6:930:41::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 08:39:21 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:930:11:cafe::95) by CY5PR13CA0042.outlook.office365.com
 (2603:10b6:930:11::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23 via Frontend
 Transport; Mon, 26 Feb 2024 08:39:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 08:39:20 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 02:39:20 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 02:39:19 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 02:39:17 -0600
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
X-Inumbo-ID: 8ab53c5a-d482-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDbNHh2vSiG+rPtutxKR81viafXmipkzZLnjeAX3434cOkBjaD4AmEHryDsgwv49fa66IKr8pnlMFQ076mAQjcQPo5nht+I1LKs15LX4sYOQEv4EPftwy4E/FfhBliJgNAU5mEEu+Z4smMsY93bwe8uaJpg/EjO38tKr+pJlPcbOuO0ilAcvU7xgcti5PxRKmUdlHJ27VFT9N6cc0gSLy7gVxbQgNZzl4bBl/Lkd6YBRV34HpCQQIRG69fUe7YK6g9lAhLPakrWMVccGoDpuXOZm2e7IOkEnsUAjNd+Utf7FFeqEsiYbd5951tAbFE/AhVlYrEGVoKn8mUVbM3JDIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/jCDJu3unxdFq/kDk7cAywEYK4eppDvAEGWf84PgjE=;
 b=UVrXM90R2u4jWG8JEA/XzRus95X18yj+dZRpdEZUklynsk850jQv4kpSuEBaV9B5QwTGRlO+UAdB05i86blgKiiNrlN+aw8Mj5ret41+JU4m4jOecigJE+QQgo6R4Qq0INNXB5GQHY8zmYLVFkaFyM25lQtNgVHJbMDIWZXNS6jRB1duvNqB5WhcheLvfPYvy/jEN5PkYfeWrgz/JeQ7imQx+4rcUIfHnRaXGVzOk9/FNF/996tjUWaX94Kqf7toXkyUvL+fyZuMYahbAhv1LhsEh7TuZXQCKw7ZlBUtj2HjROTCUBibozewocSIQgB/rnf1o42wsQLNIR2CiDK/6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/jCDJu3unxdFq/kDk7cAywEYK4eppDvAEGWf84PgjE=;
 b=xQdQL4P46UHVJZ/dKIBMsze65Q4KJk0/VO3mjs7X3mH5BN5copglpmR5NWAVF3a1WghY3egNREw/SVB8ef7fPQ1sdf3VYA6KWIToDjlE2FcMMN+k5lruaZFYkBVO3tviptvoHTpcXpg8dULqUuk1Silbfbu4pVmHornZWH74UVY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9579f84a-ec9e-44be-b614-b70ced221c47@amd.com>
Date: Mon, 26 Feb 2024 09:39:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v5 2/3] xen/arm: arm64: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>
References: <20240220121743.3680715-1-ayan.kumar.halder@amd.com>
 <20240220121743.3680715-3-ayan.kumar.halder@amd.com>
 <c5c0a46b-8793-481d-a678-da0929a0d6e9@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <c5c0a46b-8793-481d-a678-da0929a0d6e9@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|CY5PR12MB6646:EE_
X-MS-Office365-Filtering-Correlation-Id: 3741897d-57cb-456c-dfe3-08dc36a66d53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9cdmHlN85BzdC1d0fKE8iaaaL3MydkF2kLzKqXUwLXhm2/lTK+/tAVBNhrbYkLkqs6y3BtauHKO/NI3KyVEnA4Yh+8cqp+8ODiRxZ4u8MAFBflf8ws2RuKvZEN9BATeMb9F3Uqw7HbaI9GNhQ+CLs2TFKrc6c5p0NqHr8RIJKkaSvJKmpd3RGe+LLjj1JZLcfdDT62RcW7VMcUnPBfkZWJvTYOluCyY5tsNVmiqbjtkWwMMbohsC6vBDSg+Z7u3f8j8DyAWSXhosl/wa6lQapOhdxidzvVje1PRXbt0EouEC1FpVMJfnQSDIyxs+xgH1drwYb6irk6JYC5i/K/vdqHbVYcYlZyr9ZfJPigGHdmimnteKQFKhLvbBPGgVO5Ga6HwhOsmrdy3ixR4RG6Gg5ARzoYbUpTyWmY2LKEbVyUptWTDRJIHhRDoQBqtZ2rD/a1lsRGvLO14HqnX4nm3JKAoANpVgVp0Az7a4wGI/dK0MQVbp87hntL/bUKd93mvRrQjlLCF5ZSfU4ActLf72Qc9RELmSASmc5V5C9aKgapEqGgFnnG2W8fk3rZLoYFlM7Qn+3SNXzn4nEuBkq8df3Rd3/YJc6AAn30zcCRIlCxCvXo2ESoU1LN4sqOpaqibn6T5dBXbJOT87wYJzSAQ03vrIgFjtpq9AwmEi1m4dKPdtVqlMcuvUhgOU/Kt/Tjxv2/l0p3qqU6ZEnULK55UTcxiUFxu4O7yKQj+jV2ykeCKGXiLXyichmITjf/UbOsOe
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 08:39:20.5358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3741897d-57cb-456c-dfe3-08dc36a66d53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6646

Hi Ayan,

On 23/02/2024 16:41, Ayan Kumar Halder wrote:
> Hi,
> 
> On 20/02/2024 12:17, Ayan Kumar Halder wrote:
>> From: Michal Orzel <michal.orzel@amd.com>
>>
>> Currently, if user enables HVC_DCC config option in Linux, it invokes access
>> to debug data transfer registers (i.e. DBGDTRTX_EL0 on arm64, DBGDTRTXINT on
>> arm32). As these registers are not emulated, Xen injects an undefined
>> exception to the guest and Linux crashes.
>>
>> To prevent this crash, introduce a partial emulation of DBGDTR[TR]X_EL0
>> (these registers share the same encoding) as RAZ/WI and MDCCSR_EL0 as TXfull.
>>
>> Refer ARM DDI 0487J.a ID042523, D19.3.8, DBGDTRTX_EL0
>> "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN".
>>
>> Thus, any OS is expected to read MDCCSR_EL0 and check for TXfull before
>> using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() ---> hvc_dcc_check(),
>> and returns -ENODEV in case TXfull bit is still set after writing a test
>> character. This way we prevent the guest from making use of HVC DCC as a
>> console.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> Changes from
>>
>> v1 :- 1. DBGDTR_EL0 does not emulate RXfull. This is to avoid giving the OS any
>> indication that the RX buffer is full and is waiting to be read.
>>
>> 2. In Arm32, DBGOSLSR is emulated. Also DBGDTRTXINT is emulated at EL0 only.
>>
>> 3. Fixed the commit message and inline code comments.
>>
>> v2 :- 1. Split the patch into two (separate patches for arm64 and arm32).
>> 2. Removed the "fail" label.
>> 3. Fixed the commit message.
>>
>> v3 :- 1. "HSR_SYSREG_MDCCSR_EL0" emulation differs based on whether
>> partial_emulation_enabled is true or not.
>>
>> 2. If partial_emulation_enabled is false, then access to HSR_SYSREG_DBGDTR_EL0,
>> HSR_SYSREG_DBGDTRTX_EL0 would lead to undefined exception.
>>
>> v4 :- 1. Invoked "goto fail" from "default:" to ensure compliance with
>> MISRA 15.3.
>>
>>   xen/arch/arm/arm64/vsysreg.c         | 68 +++++++++++++++++++---------
>>   xen/arch/arm/include/asm/arm64/hsr.h |  3 ++
>>   2 files changed, 50 insertions(+), 21 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
>> index b5d54c569b..80918bc799 100644
>> --- a/xen/arch/arm/arm64/vsysreg.c
>> +++ b/xen/arch/arm/arm64/vsysreg.c
>> @@ -82,6 +82,7 @@ TVM_REG(CONTEXTIDR_EL1)
>>   void do_sysreg(struct cpu_user_regs *regs,
>>                  const union hsr hsr)
>>   {
>> +    const struct hsr_sysreg sysreg = hsr.sysreg;
>>       int regidx = hsr.sysreg.reg;
>>       struct vcpu *v = current;
>>   
>> @@ -159,9 +160,6 @@ void do_sysreg(struct cpu_user_regs *regs,
>>        *
>>        * Unhandled:
>>        *    MDCCINT_EL1
>> -     *    DBGDTR_EL0
>> -     *    DBGDTRRX_EL0
>> -     *    DBGDTRTX_EL0
>>        *    OSDTRRX_EL1
>>        *    OSDTRTX_EL1
>>        *    OSECCR_EL1
>> @@ -171,12 +169,42 @@ void do_sysreg(struct cpu_user_regs *regs,
>>        */
>>       case HSR_SYSREG_MDSCR_EL1:
>>           return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>> +
>> +    /*
>> +     * Xen doesn't expose a real (or emulated) Debug Communications Channel
>> +     * (DCC) to a domain. Yet the Arm ARM implies this is not an optional
>> +     * feature. So some domains may start to probe it. For instance, the
>> +     * HVC_DCC driver in Linux (since f377775dc083 and at least up to v6.7),
>> +     * will try to write some characters and check if the transmit buffer
>> +     * has emptied.
>> +     */
>>       case HSR_SYSREG_MDCCSR_EL0:
>>           /*
>> +         * By setting TX status bit (only if partial emulation is enabled) to
>> +         * indicate the transmit buffer is full, we would hint the OS that the
>> +         * DCC is probably not working.
>> +         *
>> +         * Bit 29: TX full
>> +         *
>>            * Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We emulate that
>>            * register as RAZ/WI above. So RO at both EL0 and EL1.
>>            */
>> -        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
>> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 0,
>> +                                  partial_emulation ? (1U << 29) : 0);
>> +
>> +    case HSR_SYSREG_DBGDTR_EL0:
>> +    /* DBGDTR[TR]X_EL0 share the same encoding */
>> +    case HSR_SYSREG_DBGDTRTX_EL0:
>> +        /*
>> +         * Emulate as RAZ/WI (only if partial emulation is enabled) to prevent
>> +         * injecting undefined exception.
>> +         * Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We emulate that
>> +         * register as RAZ/WI.
>> +         */
>> +        if ( !partial_emulation )
>> +            goto fail;
>> +        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);
>> +
>>       HSR_SYSREG_DBG_CASES(DBGBVR):
>>       HSR_SYSREG_DBG_CASES(DBGBCR):
>>       HSR_SYSREG_DBG_CASES(DBGWVR):
>> @@ -394,26 +422,24 @@ void do_sysreg(struct cpu_user_regs *regs,
>>        * And all other unknown registers.
>>        */
>>       default:
>> -        {
>> -            const struct hsr_sysreg sysreg = hsr.sysreg;
>> -
>> -            gdprintk(XENLOG_ERR,
>> -                     "%s %d, %d, c%d, c%d, %d %s x%d @ 0x%"PRIregister"\n",
>> -                     sysreg.read ? "mrs" : "msr",
>> -                     sysreg.op0, sysreg.op1,
>> -                     sysreg.crn, sysreg.crm,
>> -                     sysreg.op2,
>> -                     sysreg.read ? "=>" : "<=",
>> -                     sysreg.reg, regs->pc);
>> -            gdprintk(XENLOG_ERR,
>> -                     "unhandled 64-bit sysreg access %#"PRIregister"\n",
>> -                     hsr.bits & HSR_SYSREG_REGS_MASK);
>> -            inject_undef_exception(regs, hsr);
>> -            return;
>> -        }
>> +        goto fail;
>>       }
>>   
>>       regs->pc += 4;
>> +    return;
>> +
>> + fail:
>> +
No need for this empty line.

>> +    gdprintk(XENLOG_ERR,
>> +             "%s %d, %d, c%d, c%d, %d %s x%d @ 0x%"PRIregister"\n",
>> +             sysreg.read ? "mrs" : "msr", sysreg.op0, sysreg.op1, sysreg.crn,
>> +             sysreg.crm, sysreg.op2, sysreg.read ? "=>" : "<=", sysreg.reg,
>> +             regs->pc);
The original formatting (i.e. placement of printk args) looked better. I'm not sure why you changed it.

>> +    gdprintk(XENLOG_ERR,
>> +             "unhandled 64-bit sysreg access %#"PRIregister"\n",
>> +             hsr.bits & HSR_SYSREG_REGS_MASK);
>> +    inject_undef_exception(regs, hsr);
>> +    return;
> 
> The last 'return' needs to be removed (spotted by Michal)
> 
~Michal


