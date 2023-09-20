Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4418C7A8AEF
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 19:55:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605864.943475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj1Ps-0005re-1U; Wed, 20 Sep 2023 17:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605864.943475; Wed, 20 Sep 2023 17:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj1Pr-0005oZ-V4; Wed, 20 Sep 2023 17:55:11 +0000
Received: by outflank-mailman (input) for mailman id 605864;
 Wed, 20 Sep 2023 17:55:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFM0=FE=redhat.com=pbonzini@srs-se1.protection.inumbo.net>)
 id 1qj1Pr-0005Yn-7J
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 17:55:11 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6c97069-57de-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 19:55:10 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-nCC5Brl2MNOSRX0tqr0uag-1; Wed, 20 Sep 2023 13:55:05 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-401bdff6bc5so769885e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Sep 2023 10:55:05 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 w11-20020a5d608b000000b0031ad5fb5a0fsm10876963wrt.58.2023.09.20.10.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Sep 2023 10:55:03 -0700 (PDT)
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
X-Inumbo-ID: d6c97069-57de-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695232509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NnqOeIozWLoSx9J0xtQeCKdqhemo3EjzKycC15MNaXI=;
	b=BCbggvbfYaWm9q1Yn9nt9xdLO3ZQMJRTyiMMbKKGAqwkRivXu0dJyinBCc96TMddS5l/XZ
	x04gfDmU0iyn1fOWdhsxCFXULExjQ6T2GgrNVIEHnX6gxxMzlIsYmZb5Jqmt4Lcnk5uLMf
	dh+4uAi0iSmz0Q2YFKhWuioiPeAcS44=
X-MC-Unique: nCC5Brl2MNOSRX0tqr0uag-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695232504; x=1695837304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NnqOeIozWLoSx9J0xtQeCKdqhemo3EjzKycC15MNaXI=;
        b=megpqMnTGRRCM6RFvjKw45lMgAGQSyhC3wYOwcMLzQT8H+3jE57lkfyoU0kfWgCemy
         h15o7HVoNzzkBAOZhGZLRAk9s/8pkTjF1LEUeMS+yq07F3lXI8AbMugAGUXLY0RNEDtk
         1pWmUb0eQLDmvPmGgYs7SNFROazMhRMkVfpdDPB9dZ+3xtnWCFG6H+8WYFm+oCinpbxt
         Dq9YESRMlOylMRkZUz/E+RPqJSxpOpHajdVnzeoTJKhwKSDDIia1JX1d5ZUz+HEqOFpL
         Xr9Qxj+B0aGnWWXpzAaUATdW2HaKL+YTL5mv6TNAMOAdjA/LsMLT2bLZj+w7ljEMthTE
         Xabg==
X-Gm-Message-State: AOJu0YxkMU5VkW7TbxrVuehPMbEI5XkuoTolT5v1MPm6+3lQAnwl74CI
	yidEp/3HbcpFJ8oKGQ3VqS6m8meL2QXV3pwysGOQZ+8uHLvmR9W5XI9Q0jvdNij5muCimzEkUBn
	2BMvL9XWwn9loFEeyPjyJKUB1YRs=
X-Received: by 2002:adf:ee88:0:b0:313:ecd3:7167 with SMTP id b8-20020adfee88000000b00313ecd37167mr2737766wro.42.1695232504616;
        Wed, 20 Sep 2023 10:55:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0pIzmkmEwrfJkDIWYrHXNUyhISLDh7IqFEh0BjNiUe37zgzv0CZuijHzQCZR9e7yYqC6CoA==
X-Received: by 2002:adf:ee88:0:b0:313:ecd3:7167 with SMTP id b8-20020adfee88000000b00313ecd37167mr2737745wro.42.1695232504286;
        Wed, 20 Sep 2023 10:55:04 -0700 (PDT)
Message-ID: <26b92bbb-0519-8b94-07fc-75d900fde600@redhat.com>
Date: Wed, 20 Sep 2023 19:54:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v10 34/38] KVM: VMX: Call fred_entry_from_kvm() for
 IRQ/NMI handling
To: Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org,
 seanjc@google.com, peterz@infradead.org, jgross@suse.com,
 ravi.v.shankar@intel.com, mhiramat@kernel.org, andrew.cooper3@citrix.com,
 jiangshanlai@gmail.com
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-35-xin3.li@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230914044805.301390-35-xin3.li@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/23 06:48, Xin Li wrote:
> When FRED is enabled, call fred_entry_from_kvm() to handle IRQ/NMI in
> IRQ/NMI induced VM exits.
> 
> Tested-by: Shan Kang <shan.kang@intel.com>
> Signed-off-by: Xin Li <xin3.li@intel.com>

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

> ---
>   arch/x86/kvm/vmx/vmx.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 72e3943f3693..db55b8418fa3 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -38,6 +38,7 @@
>   #include <asm/desc.h>
>   #include <asm/fpu/api.h>
>   #include <asm/fpu/xstate.h>
> +#include <asm/fred.h>
>   #include <asm/idtentry.h>
>   #include <asm/io.h>
>   #include <asm/irq_remapping.h>
> @@ -6962,14 +6963,16 @@ static void handle_external_interrupt_irqoff(struct kvm_vcpu *vcpu)
>   {
>   	u32 intr_info = vmx_get_intr_info(vcpu);
>   	unsigned int vector = intr_info & INTR_INFO_VECTOR_MASK;
> -	gate_desc *desc = (gate_desc *)host_idt_base + vector;
>   
>   	if (KVM_BUG(!is_external_intr(intr_info), vcpu->kvm,
>   	    "unexpected VM-Exit interrupt info: 0x%x", intr_info))
>   		return;
>   
>   	kvm_before_interrupt(vcpu, KVM_HANDLING_IRQ);
> -	vmx_do_interrupt_irqoff(gate_offset(desc));
> +	if (cpu_feature_enabled(X86_FEATURE_FRED))
> +		fred_entry_from_kvm(EVENT_TYPE_EXTINT, vector);
> +	else
> +		vmx_do_interrupt_irqoff(gate_offset((gate_desc *)host_idt_base + vector));
>   	kvm_after_interrupt(vcpu);
>   
>   	vcpu->arch.at_instruction_boundary = true;
> @@ -7262,7 +7265,10 @@ static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
>   	if ((u16)vmx->exit_reason.basic == EXIT_REASON_EXCEPTION_NMI &&
>   	    is_nmi(vmx_get_intr_info(vcpu))) {
>   		kvm_before_interrupt(vcpu, KVM_HANDLING_NMI);
> -		vmx_do_nmi_irqoff();
> +		if (cpu_feature_enabled(X86_FEATURE_FRED))
> +			fred_entry_from_kvm(EVENT_TYPE_NMI, NMI_VECTOR);
> +		else
> +			vmx_do_nmi_irqoff();
>   		kvm_after_interrupt(vcpu);
>   	}
>   


