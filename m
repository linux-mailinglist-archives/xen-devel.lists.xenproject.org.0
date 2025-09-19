Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADBBB8B544
	for <lists+xen-devel@lfdr.de>; Fri, 19 Sep 2025 23:27:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127071.1468215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzicw-0007hJ-82; Fri, 19 Sep 2025 21:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127071.1468215; Fri, 19 Sep 2025 21:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzicw-0007fe-5U; Fri, 19 Sep 2025 21:26:46 +0000
Received: by outflank-mailman (input) for mailman id 1127071;
 Fri, 19 Sep 2025 21:26:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uzicu-0007fY-OA
 for xen-devel@lists.xenproject.org; Fri, 19 Sep 2025 21:26:44 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55ff0809-959f-11f0-9809-7dc792cee155;
 Fri, 19 Sep 2025 23:26:42 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3ee1381b835so1504894f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Sep 2025 14:26:42 -0700 (PDT)
Received: from [192.168.42.55] ([74.50.221.250])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54ff448058sm5733057a12.54.2025.09.19.14.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 14:26:41 -0700 (PDT)
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
X-Inumbo-ID: 55ff0809-959f-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758317202; x=1758922002; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4I5EgbgYVa8+ipb8/MYRk2x6DSiwj69u9DDmQY9UWto=;
        b=fuV/UJw2fdIIam9GOGyY7PF1eTdp+wWx+ixunndcArhKgNZlsc0yq+swxJ4Pe5vHNA
         S7cbumnvK9SandYFkUmulzs78DyWyu18Ryr3W9/BXFGcH4spJGb1jC4hXNGaw6TrYc6t
         Lh9royK+R/B1ozlLT5ZD65nCF5sisIvQQRsQssADMdfODGFIkOTUO/Ku1/vtlrw4h0IQ
         0CKUqlkkhR8dxhz519I/TYR7IP/21iOe5LCqBHi2tMSG093iAmDk6IQ/qTanOqyOQUt+
         AgSk6cCvRn0lAxkFc2EEJYEHxKAIZhLrLkcc/wPGo4519WmmOdFrTSWeeZrURnfrpEXP
         BdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758317202; x=1758922002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4I5EgbgYVa8+ipb8/MYRk2x6DSiwj69u9DDmQY9UWto=;
        b=CiLhpBR5YSjsq6HBlKLLEDX1mIsye4k8ib/fjeHIJcPWIZm1TsRcway+Xwkz7mjFVY
         8WI6K+plNEnRcogb7jhA33xs9aehDOQRK3ZbWorhKk1GXGYzQJNfhDcArKuTaCZJC1nM
         9FetlVN+kXIiiLkDVLXhhaFjdmPszoZK3bhNzNcBfsE6ej2dHCsqLzC6vzMfpB7gTTz4
         Dj1ku5o26Pv5xVXLih7LEJ0Wmg36JUF6YZXvGjMA8Ol2Y3ZLYoTgnSy/Y6m4FdnduvHa
         v4ydT/nCg1SEGgW1HL95LAisGfbYFkdGMOwJn7D0PPFQ67DeZBa3JjBYVmAe+LYcNXnz
         Ognw==
X-Forwarded-Encrypted: i=1; AJvYcCUYDck29w9c3j9H3KNP8Nm/dvYdt21BJh2ydzxgC6BZCQ93zkKGHJQSi0V50slCIdCfVJK8lNPPaE4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQQ+/tGMCxANAD7djAkkWDTxUuz4KkRIywND3PJnKyoPnVYsYS
	bvYK7TI9Ewb2Q8RGiGRS3xrCAiUmJa8W+p8cVP7Dcld/WqPu74XUiKb92vcbvrNmLw==
X-Gm-Gg: ASbGnctmt9XiQeaV7GghNl6wXy+WVZDWGQGBX02Oq+IThzxKHI6j1j72JU2Ga/dqH6z
	fMPUQCP06xEMaGgQGpCqsiWo+F/EiHqD8Qdrb+Y32Fel1FcuzVMr48bUayknR9OL30A2blSlV7e
	OWnIbh/lfGPNeZJVyvlhmsbHQ7F7ax75ODZZ5yn5jyjFxhGr+cMicHSOTFHI1SF/kBoygyw289D
	R+t+iJPMh7mg/CuRnlu2i76aGdppYbCklNwns3RArzP3LECjaBOAkoRkRyEH2DmQkGmB1DazsrV
	NN34/t8OAjwpjO92YFqTTNu2QW4AE91WIAeRNSVuuk98aYrRQeXZZIHCokT91CyhqcS6fljfKrG
	BLQsvx7FaTsYpWeFHJBDaGU5RtUElKzoA
X-Google-Smtp-Source: AGHT+IEXz0dlCC3Q2Ddr+X2AEvOy8Vz025GNmBoPRcfvcAJ6iMLbzl95AsVpcX5122ycEEPWzxtzmw==
X-Received: by 2002:a05:6000:1ac8:b0:3e7:5f26:f1d3 with SMTP id ffacd0b85a97d-3ee7df1d066mr3713916f8f.17.1758317201885;
        Fri, 19 Sep 2025 14:26:41 -0700 (PDT)
Message-ID: <03c68390-fd9b-443b-a012-2846dda2a923@suse.com>
Date: Fri, 19 Sep 2025 23:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/18] xen/riscv: introduce VMID allocation and
 manegement
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <ee861e4d0e43917d230e0c31ee51ff0573fcf2bd.1758145428.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ee861e4d0e43917d230e0c31ee51ff0573fcf2bd.1758145428.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.09.2025 23:55, Oleksii Kurochko wrote:
> @@ -151,6 +152,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>  
>      gstage_mode_detect();
>  
> +    vmid_init();

Like for the earlier patch, I'm not convinced this is a function good
to call from the top-level start_xen(). The two functions sitting side
by side actually demonstrates the scalability issue pretty well.

> --- /dev/null
> +++ b/xen/arch/riscv/vmid.c
> @@ -0,0 +1,193 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/domain.h>
> +#include <xen/init.h>
> +#include <xen/sections.h>
> +#include <xen/lib.h>
> +#include <xen/param.h>
> +#include <xen/percpu.h>
> +
> +#include <asm/atomic.h>
> +#include <asm/csr.h>
> +#include <asm/flushtlb.h>
> +#include <asm/p2m.h>
> +
> +/* Xen command-line option to enable VMIDs */
> +static bool __ro_after_init opt_vmid_use_enabled = true;
> +boolean_param("vmid", opt_vmid_use_enabled);

Is there a particular reason to not have the variable be simply opt_vmid,
properly in sync with the command line option?

> +void vmid_init(void)
> +{
> +    static int8_t g_vmid_used = -1;
> +
> +    unsigned int vmid_len = vmidlen_detect();
> +    struct vmid_data *data = &this_cpu(vmid_data);
> +
> +    BUILD_BUG_ON((HGATP_VMID_MASK >> HGATP_VMID_SHIFT) >
> +                 (BIT((sizeof(data->max_vmid) * BITS_PER_BYTE), UL) - 1));
> +
> +    data->max_vmid = BIT(vmid_len, U) - 1;
> +    data->used = !opt_vmid_use_enabled || (vmid_len <= 1);

Since you inverted the sense of variable and field, you also need to invert
the expression here:

    data->used = opt_vmid_use_enabled && (vmid_len > 1);

> +    if ( g_vmid_used < 0 )
> +    {
> +        g_vmid_used = data->used;
> +        printk("VMIDs use is %sabled\n", data->used ? "dis" : "en");

Same here - "dis" and "en" need to switch places.

> +    }
> +    else if ( g_vmid_used != data->used )
> +        printk("CPU%u: VMIDs use is %sabled\n", smp_processor_id(),
> +               data->used ? "dis" : "en");

And again here.

> +void vcpu_vmid_flush_vcpu(struct vcpu *v)

An reason to have two "vcpu" in the name?

> +{
> +    write_atomic(&v->arch.vmid.generation, 0);
> +}
> +
> +void vmid_flush_hart(void)
> +{
> +    struct vmid_data *data = &this_cpu(vmid_data);
> +
> +    if ( data->used )
> +        return;

Again the sense needs reversting.

> +    if ( likely(++data->generation != 0) )
> +        return;
> +
> +    /*
> +     * VMID generations are 64 bit.  Overflow of generations never happens.
> +     * For safety, we simply disable ASIDs, so correctness is established; it
> +     * only runs a bit slower.
> +     */
> +    printk("%s: VMID generation overrun. Disabling VMIDs.\n", __func__);
> +    data->used = 1;

And yet again.

> +bool vmid_handle_vmenter(struct vcpu_vmid *vmid)
> +{
> +    struct vmid_data *data = &this_cpu(vmid_data);
> +
> +    /* Test if VCPU has valid VMID. */
> +    if ( read_atomic(&vmid->generation) == data->generation )
> +        return 0;
> +
> +    /* If there are no free VMIDs, need to go to a new generation. */
> +    if ( unlikely(data->next_vmid > data->max_vmid) )
> +    {
> +        vmid_flush_hart();
> +        data->next_vmid = 1;
> +        if ( data->used )
> +            goto disabled;

And yet another time.

Jan

