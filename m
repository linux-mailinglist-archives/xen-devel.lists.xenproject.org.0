Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCCC190894
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 10:11:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGfXk-0003Ol-1I; Tue, 24 Mar 2020 09:08:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGfXi-0003Og-GR
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 09:08:14 +0000
X-Inumbo-ID: fd8377c2-6dae-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd8377c2-6dae-11ea-b34e-bc764e2007e4;
 Tue, 24 Mar 2020 09:08:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C65A5AC19;
 Tue, 24 Mar 2020 09:08:12 +0000 (UTC)
To: Pu Wen <puwen@hygon.cn>
References: <20200324045219.2110-1-puwen@hygon.cn>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <688ba3ba-edaa-c504-cceb-b2e7f4f4214e@suse.com>
Date: Tue, 24 Mar 2020 10:08:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200324045219.2110-1-puwen@hygon.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH] SVM: Add union intstat_t for offset 68h in
 vmcb struct
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.03.2020 05:52, Pu Wen wrote:
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -508,7 +508,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>      }
>  
>      /* Shadow Mode */
> -    n2vmcb->interrupt_shadow = ns_vmcb->interrupt_shadow;
> +    n2vmcb->int_stat.intr_shadow = ns_vmcb->int_stat.intr_shadow;

While bit 1 is irrelevant to VMRUN, I still wonder whether you
shouldn't copy "raw" here.

> @@ -1058,7 +1058,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>          ns_vmcb->_vintr.fields.intr_masking = 0;
>  
>      /* Shadow mode */
> -    ns_vmcb->interrupt_shadow = n2vmcb->interrupt_shadow;
> +    ns_vmcb->int_stat.intr_shadow = n2vmcb->int_stat.intr_shadow;

Same here, or at the very least you want to also copy bit 1 here.

> --- a/xen/arch/x86/hvm/svm/svmdebug.c
> +++ b/xen/arch/x86/hvm/svm/svmdebug.c
> @@ -51,9 +51,9 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
>      printk("iopm_base_pa = %#"PRIx64" msrpm_base_pa = %#"PRIx64" tsc_offset = %#"PRIx64"\n",
>             vmcb_get_iopm_base_pa(vmcb), vmcb_get_msrpm_base_pa(vmcb),
>             vmcb_get_tsc_offset(vmcb));
> -    printk("tlb_control = %#x vintr = %#"PRIx64" interrupt_shadow = %#"PRIx64"\n",
> +    printk("tlb_control = %#x vintr = %#"PRIx64" interrupt_shadow = %#x\n",
>             vmcb->tlb_control, vmcb_get_vintr(vmcb).bytes,
> -           vmcb->interrupt_shadow);
> +           vmcb->int_stat.intr_shadow);

Please dump all 64 bits here.

Jan

