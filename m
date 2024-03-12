Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49458878F45
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 08:54:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691677.1077896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjwxd-00053D-Bz; Tue, 12 Mar 2024 07:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691677.1077896; Tue, 12 Mar 2024 07:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjwxd-00051O-8g; Tue, 12 Mar 2024 07:54:09 +0000
Received: by outflank-mailman (input) for mailman id 691677;
 Tue, 12 Mar 2024 07:54:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjwxb-00051I-T9
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 07:54:07 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3007f0f-e045-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 08:54:05 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a4429c556efso421655666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 00:54:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 uz17-20020a170907119100b00a45cac9ae6bsm3563382ejb.162.2024.03.12.00.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 00:54:04 -0700 (PDT)
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
X-Inumbo-ID: b3007f0f-e045-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710230045; x=1710834845; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f3GK0cmtdDN2N9cAiwyNY1qd0hRMu+6vns3erC5jAMY=;
        b=I9RfMTP/dXdKGjhcfFjsz28R8/WZ9SJVOLo1Q4xocb77WWusaCtK5I4V/21iC8D4kY
         ENR3W1SdaZN9EL2zCeo5F+Ae2bw1Z6ZQwuuA0sh5LR0b4SdpUf8ogP65ZF7vkvvBwOkc
         sf0ix8Ie1ZJdM9z+y/X7K5r0WGy5wnK5rM6GzuXTuaIJQkYWQxBlazz8UX69Bot2myAg
         I/oY5tygBmV60rZrxW7Mfra0JFIy+5yb8KKRtrcT6TmO4mcCoX5Z1TJ31gn9OwKWvBzo
         OyFmGfWkltEHpzlnzsRdQQ0EcosY7740DWlUOq7Ahzrw5egwK4L9l9ra0OvQI1JI5RtG
         tqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710230045; x=1710834845;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3GK0cmtdDN2N9cAiwyNY1qd0hRMu+6vns3erC5jAMY=;
        b=hAWFSNyUoKXBMKofwk4TL7YGWaQnn5rYe586sF5s12BXQLesUPNxYOYUF5dopf9JIj
         jm+N9ZL2WiAVb9vMWDwYn5jnq57PwgZ3u3g3+k7ovQ6gvAwYnVmP2E0zt1xJikpiJUnx
         Ga36C5Q8U+HOw3AUF1UeVtBRub6mtyun4J2vDnPuWwtrJIqC58Mhct3y0xdNC3E4XxTZ
         zCKoBjIR4Wr5TR4DHILWfctiF4jMU0wTEQQolYSEQ7nrnUdMv9CmrQGzTt6szqR0h8fD
         8eVnxlRDNkRa4q5dJWDPfd1u829RR+K/z0Yi4QhBhRP5x30o6Y0ox8prPBgzNx8En9c9
         M9HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSnJ8+exZiHpGNRej2ujRA1p73ahSnn2XnA28Po/18DgSUYT/teAh5ZTE7Znp3FXv1C5N4wb1Q1KLHcdjyElWJ7/yKQy6malwUM/PPqlE=
X-Gm-Message-State: AOJu0YzprM8DTcZWae+5+Z0piupQxP5NOAnAXvG0PcXavmuylZhViB+s
	stG05QBLIUP6SgRi7r8vCkpsj7qIVmz6xafe1v1P876PmbCUtBYXmoRkQIEQtw==
X-Google-Smtp-Source: AGHT+IGkBlQ/4D51Icy0kE0Ssw3BxOn727nfGFJ4t1n1oObO5yDGmUllJgwhTN/jCg3lbK3LdwB4Vw==
X-Received: by 2002:a17:906:3daa:b0:a3f:5144:ada2 with SMTP id y10-20020a1709063daa00b00a3f5144ada2mr5294718ejh.2.1710230045147;
        Tue, 12 Mar 2024 00:54:05 -0700 (PDT)
Message-ID: <1c67a337-e9d5-4e4a-91d5-3c935c410cda@suse.com>
Date: Tue, 12 Mar 2024 08:54:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/svm: Drop the _enabled suffix from vmcb bits
To: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <cover.1710149462.git.vaishali.thakkar@vates.tech>
 <8e6d8cac54ca05f1202580b574c548e08988d8f6.1710149462.git.vaishali.thakkar@vates.tech>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <8e6d8cac54ca05f1202580b574c548e08988d8f6.1710149462.git.vaishali.thakkar@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 13:40, Vaishali Thakkar wrote:
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -571,7 +571,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>      if ( nestedhvm_paging_mode_hap(v) )
>      {
>          /* host nested paging + guest nested paging. */
> -        n2vmcb->_np_enable = 1;
> +        n2vmcb->_np = true;
>  
>          nestedsvm_vmcb_set_nestedp2m(v, ns_vmcb, n2vmcb);
>  
> @@ -585,7 +585,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>      else if ( paging_mode_hap(v->domain) )
>      {
>          /* host nested paging + guest shadow paging. */
> -        n2vmcb->_np_enable = 1;
> +        n2vmcb->_np = true;
>          /* Keep h_cr3 as it is. */
>          n2vmcb->_h_cr3 = n1vmcb->_h_cr3;
>          /* When l1 guest does shadow paging
> @@ -601,7 +601,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>      else
>      {
>          /* host shadow paging + guest shadow paging. */
> -        n2vmcb->_np_enable = 0;
> +        n2vmcb->_np = false;
>          n2vmcb->_h_cr3 = 0x0;
>  
>          /* TODO: Once shadow-shadow paging is in place come back to here
> @@ -706,7 +706,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
>      }
>  
>      /* nested paging for the guest */
> -    svm->ns_hap_enabled = !!ns_vmcb->_np_enable;
> +    svm->ns_hap_enabled = ns_vmcb->_np;
>  
>      /* Remember the V_INTR_MASK in hostflags */
>      svm->ns_hostflags.fields.vintrmask = !!ns_vmcb->_vintr.fields.intr_masking;
> @@ -1084,7 +1084,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>      if ( nestedhvm_paging_mode_hap(v) )
>      {
>          /* host nested paging + guest nested paging. */
> -        ns_vmcb->_np_enable = n2vmcb->_np_enable;
> +        ns_vmcb->_np = n2vmcb->_np;
>          ns_vmcb->_cr3 = n2vmcb->_cr3;
>          /* The vmcb->h_cr3 is the shadowed h_cr3. The original
>           * unshadowed guest h_cr3 is kept in ns_vmcb->h_cr3,
> @@ -1093,7 +1093,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>      else if ( paging_mode_hap(v->domain) )
>      {
>          /* host nested paging + guest shadow paging. */
> -        ns_vmcb->_np_enable = 0;
> +        ns_vmcb->_np = false;
>          /* Throw h_cr3 away. Guest is not allowed to set it or
>           * it can break out, otherwise (security hole!) */
>          ns_vmcb->_h_cr3 = 0x0;
> @@ -1104,7 +1104,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>      else
>      {
>          /* host shadow paging + guest shadow paging. */
> -        ns_vmcb->_np_enable = 0;
> +        ns_vmcb->_np = false;
>          ns_vmcb->_h_cr3 = 0x0;
>          /* The vmcb->_cr3 is the shadowed cr3. The original
>           * unshadowed guest cr3 is kept in ns_vmcb->_cr3,

While spotting the small issue below it occurred to me: Why is it that
vmcb_set_...() is open-coded everywhere here? I think this would be
pretty nice to avoid at the same time (for lines touched anyway, or in
a separate prereq patch, or alternatively [and only ideally] for all
other instances in a follow-on patch). Thoughts?

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -473,7 +473,7 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
>  
>      if ( paging_mode_hap(v->domain) )
>      {
> -        vmcb_set_np_enable(vmcb, 1);
> +        vmcb_set_np(vmcb, 1);

No switching to "true" here? (If the answer to the other question is
"No" for whatever reason, I'd nevertheless like to see this on adjusted,
which could then be done while committing.)

Jan

