Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F144AEFEB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 12:24:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269018.462987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHl51-0004sK-0z; Wed, 09 Feb 2022 11:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269018.462987; Wed, 09 Feb 2022 11:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHl50-0004oo-U2; Wed, 09 Feb 2022 11:24:10 +0000
Received: by outflank-mailman (input) for mailman id 269018;
 Wed, 09 Feb 2022 11:24:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRaV=SY=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nHl4z-0004oi-S6
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 11:24:10 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7eab::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cacab247-899a-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 12:24:07 +0100 (CET)
Received: from BN9PR03CA0381.namprd03.prod.outlook.com (2603:10b6:408:f7::26)
 by SN4PR0201MB8758.namprd02.prod.outlook.com (2603:10b6:806:1ea::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 11:24:04 +0000
Received: from BN1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::f2) by BN9PR03CA0381.outlook.office365.com
 (2603:10b6:408:f7::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Wed, 9 Feb 2022 11:24:03 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT007.mail.protection.outlook.com (10.13.3.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 11:24:03 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 9 Feb 2022 11:24:02 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 9 Feb 2022 11:24:02 +0000
Received: from [10.71.116.78] (port=63252)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nHl4r-0007lR-ET; Wed, 09 Feb 2022 11:24:01 +0000
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
X-Inumbo-ID: cacab247-899a-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ff8ctjCDdTaYR98K7h0qmGjkuzYcL9h3WebP0OrH+jk9xa6UPtbOmTzECDcAjVdVTTwGCjfD9vj0BoEftzgCHOTtkXifOhZn6ihw/Md0cyUTdujCSdrcy65DXh806Fb/GDvpCyhHG0BjM6dvloPrgWDAgl5yk9orRFvhLMt8vuSizbieWkQPcd8BDF7PJ40WjKMY7UJNkKzg9Ugo+xKyur0u/7CLwhQw+TWv6zmMzLJ6KcAmEa1UTm1fbiWoac7yDezwMfyQnTh3k3JRv4R8qgk/Sz/urvvMii0AGBoNp1V7qzzbVIoD2VMRzMLOoct7/vCZilBd32aCTKBpC9iQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gV0sztLsJSsewBo1bwZz08pjI3DAGGuXRR5j3EmG92Q=;
 b=gTtyg5y+owm/44iloM/8VoVd3cSLPC4DsWHFyPAv7jhyO7ahO/6ekVnLtJhy1bGO8B/x+9fQuhELUZx0ddtERvX07qFszWiKbICrUtdyB1lWfbJt0wl7dnhCfTVWuT7f4xuDKxRBCjAXN20izKj//95kiKvO1aAJbSSozwy6RIg7cNo62xbiQIzZ0mukygdX828jmKNtsNT6kuhtgcZNLq5rEaccuKgAi1HKNZmajLIEBYeR9a4IVSBzq+BWFzmg8JyZZQmdVmp656wq4o1O9nGXILEvzv/NbG6wnb3zs5c1P72l4+mpp1dXc/CVgOytxyCIRmpbgOydmS6WlM68jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gV0sztLsJSsewBo1bwZz08pjI3DAGGuXRR5j3EmG92Q=;
 b=hX6fdTXDc7xRItaIm9kMLDWKmwTjQKG8DrEDCMZcYfNNxDUoRD1samYgICK1ssF00YFJTARzDatz1SfuFEPzoue0MZVvDVLqm1KtGldE0JZARGwMiNyY5yD4Uim9FZ8qqHugSKY2OYm8spVodf94wbfx4kmamVheDv7y9ARC1L0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Message-ID: <016444fc-6e7c-9cce-b4a7-70326b64dfff@xilinx.com>
Date: Wed, 9 Feb 2022 11:24:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v7 2/2] xen/arm64: io: Support instructions (for which ISS
 is not valid) on emulated MMIO region using MMIO/ioreq handler
To: Stefano Stabellini <sstabellini@kernel.org>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, <stefanos@xilinx.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>
References: <20220205225816.5952-1-ayankuma@xilinx.com>
 <20220205225816.5952-3-ayankuma@xilinx.com>
 <alpine.DEB.2.22.394.2202081730130.2091381@ubuntu-linux-20-04-desktop>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <alpine.DEB.2.22.394.2202081730130.2091381@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34171964-2125-4f1e-7384-08d9ebbead51
X-MS-TrafficTypeDiagnostic: SN4PR0201MB8758:EE_
X-Microsoft-Antispam-PRVS:
	<SN4PR0201MB8758AD001E89936FF71A964CB22E9@SN4PR0201MB8758.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NzHhknKLWgdCQX6Ni+mJgPFm55C4MICgBnIXiudbmKV3DEfgm1vxamDyEu15kmccvBsl5W2XxP1/0c7K5B+xgbWq5+c6g9dGZrh4tnBoXZyxTnLw2HeCxjzTlD+2BgEP5B0nQ0F+JgYkR8UNPPGUDa1X/ApXIDyIYEseh8tBCP2Ia181rmipF1eJyNmU4CQTW0LSnf+22pCJXgmcdBLQ811jxpAhJoG2Yw4ReFOlZWqP8H6dwSEdoOusM3fdlsnqPvRlVEviMbOGVvGG1B1NIPegElUCDZdNSnPBIEyIjCEsZK241adPNi4p5RP4Ej7keR8lk0njXrJCUjzBdQdfZ1dyTnD/yu3zDd1oduUZf3Bf7TxlfRYxcZwlB2shwk/qpjjft5B8dJ6p5Rvv7QDDAmMvZ0IQLHJhZBHFemc/9dS4j5/+cn/ZyGLP446MiBdBudRKuuOv/CzstnC774f7x9cTwx9YyWngizbDb/2g/HSaBk4bzw1O6DsdM3zwDIF0MwaeSIaWR2y+pItc4ZOJRjWz+0l4S3a3cDuAKDhRaBX0wRAUHV5dWoSc2Pp+tL/VnGmdgveCpPyLOuNkfSaRyr3jIZgSofBgNCkKLQwxRmpEyfLxUOaHvf20m1CjDxbZ/VqJV4OtLakf+s7DBm5nAe3hbWdJMHHAMGGJeTbJS7mb8a+y9PoPtfW8YPzz2nk5B+B9erbhm5WwBIJ9LFL2wuavPkf4aPnryjwWlpMT7YPm9Z2G8i0EyI6VHZDh3x8ciSMN5roKryfE8QDzBRPiWQ==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(8676002)(36756003)(26005)(40460700003)(8936002)(186003)(82310400004)(70586007)(70206006)(4326008)(508600001)(54906003)(53546011)(47076005)(316002)(9786002)(31686004)(31696002)(36860700001)(7636003)(336012)(426003)(83380400001)(356005)(2906002)(2616005)(5660300002)(110136005)(50156003)(43740500002)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 11:24:03.2027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34171964-2125-4f1e-7384-08d9ebbead51
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB8758

Hi Stefano,

Thanks for your feedback.

On 09/02/2022 01:50, Stefano Stabellini wrote:
> On Sat, 5 Feb 2022, Ayan Kumar Halder wrote:
<snip>
>> @@ -95,6 +97,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>>   bool arch_ioreq_complete_mmio(void)
>>   {
>>       struct vcpu *v = current;
>> +    struct instr_details *dabt_instr = v->io.info.dabt_instr;
>>       struct cpu_user_regs *regs = guest_cpu_user_regs();
>>       const union hsr hsr = { .bits = regs->hsr };
> I don't think that v->io.info.dabt_instr should be a pointer because at
> this point the original structure is long gone. The original field was a
> local variable mmio_info_t info in do_trap_stage2_abort_guest. So by the
> time arch_ioreq_complete_mmio is called, the original variable has been
> deallocated.
>
> Instead, v->io.info.dabt_instr should be a "struct instr_details" (no
> pointer).
I see what you mean.

arch_ioreq_complete_mmio() is called from leave_hypervisor_to_guest(). 
That is after do_trap_stage2_abort_guest

()  has been invoked. So the original variable is no longer valid.

<snip>

> +
> +            /*
> +             * When the instruction needs to be retried by the guest after
> +             * resolving the translation fault.
> +             */
> +            else if ( info.dabt_instr.state == INSTR_RETRY )
> +                goto set_page_tables;

As discussed with Julien on IRC, when hsr_dabt.s1ptw == 1, Xen should 
only invoke p2m_resolve_translation_fault(). If it returns an error, it 
should send an abort to the guest. The reason being there is no need to 
invoke try_map_mmio() as the gpa is not a mmio address. Also, Xen does 
not support the use case when the guest places the page tables in the 
MMIO region.

I will wait for Julien's comments before sending out a v8 patch.

- Ayan

> +
> +            state = try_handle_mmio(regs, &info);
>   
>               switch ( state )
>               {
>               case IO_ABORT:
>                   goto inject_abt;
>               case IO_HANDLED:
> +                /*
> +                 * If the instruction was decoded and has executed successfully
> +                 * on the MMIO region, then Xen should execute the next part of
> +                 * the instruction. (for eg increment the rn if it is a
> +                 * post-indexing instruction.
> +                 */
> +                post_increment_register(&info.dabt_instr);
>                   advance_pc(regs, hsr);
>                   return;
>               case IO_RETRY:
> @@ -1985,18 +2056,12 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>               }
>           }
>   
> -        /*
> -         * First check if the translation fault can be resolved by the
> -         * P2M subsystem. If that's the case nothing else to do.
> -         */
> -        if ( p2m_resolve_translation_fault(current->domain,
> -                                           gaddr_to_gfn(gpa)) )
> -            return;
> -
> -        if ( is_data && try_map_mmio(gaddr_to_gfn(gpa)) )
> + set_page_tables:
> +        if ( check_p2m(is_data, gpa) )
>               return;
>   
>           break;
> +    }
>       default:
>           gprintk(XENLOG_WARNING,
>                   "Unsupported FSC: HSR=%#"PRIregister" DFSC=%#x\n",
> diff --git a/xen/arch/x86/include/asm/ioreq.h b/xen/arch/x86/include/asm/ioreq.h
> index d06ce9a6ea..ecfe7f9fdb 100644
> --- a/xen/arch/x86/include/asm/ioreq.h
> +++ b/xen/arch/x86/include/asm/ioreq.h
> @@ -26,6 +26,9 @@
>   #include <asm/hvm/ioreq.h>
>   #endif
>   
> +struct arch_vcpu_io {
> +};
> +
>   #endif /* __ASM_X86_IOREQ_H__ */
>   
>   /*
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 37f78cc4c4..afe5508be8 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -160,6 +160,8 @@ struct vcpu_io {
>       /* I/O request in flight to device model. */
>       enum vio_completion  completion;
>       ioreq_t              req;
> +    /* Arch specific info pertaining to the io request */
> +    struct arch_vcpu_io  info;
>   };
>   
>   struct vcpu
> -- 
> 2.17.1
>

