Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WECEJHcxC2oZEgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 17:34:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF365700CC
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 17:34:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312085.1582257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOzyW-0007Bj-6D; Mon, 18 May 2026 15:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312085.1582257; Mon, 18 May 2026 15:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOzyW-00078r-3H; Mon, 18 May 2026 15:33:48 +0000
Received: by outflank-mailman (input) for mailman id 1312085;
 Mon, 18 May 2026 15:33:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wOzyU-00078J-VQ
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 15:33:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOzyU-00AWpt-7Y
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 17:33:46 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0b314a-bab6-0a2a0a5309dd-0a2a45078cc2-26
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:33:46 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0b3159-229c-0a2a45070019-d155802fc86e-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:33:46 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso20359615e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 08:33:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45e6a135f0csm19579704f8f.27.2026.05.18.08.33.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 08:33:44 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779118425; x=1779723225; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ttAFH9En8RKoxwxbEZQby/iBflt+QkURqBpl3u3nteE=;
        b=VcK73qmHILzm8N9ihTSNTmAsTISkc2vgBK0EyNVyVQo2Updp65aFqLSmxc7wzhFuZt
         dsadzM1IrPjqPLtSRVYw5t5HarMKupSnCOi6FM8kCcPTQs9BKaK1a/uFnaL+aZYb9haa
         BhyKkLM/wmoJ+1iu92/SSL22bY+/IprlDXDUXZDdmIniTWo/G/98aQfCj6CzD6EfKoaC
         HHUr4b+UwQ92AYLXmVMt+Xpk6xHVEsmGdbhGgvydyRGZRnpdO32deMpUPC1rwJy2ZG2v
         T6p8YriaHfT45H6htiK1Aq7SQ+q1FJ8G8omH5YqctlvBS6F1yfmtQVncJdBftUA3xSx7
         nU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779118425; x=1779723225;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttAFH9En8RKoxwxbEZQby/iBflt+QkURqBpl3u3nteE=;
        b=UL+Wk3RE0r9WrH18+66HcEk4K5LJ6cpg2NEm3r81aH+Dl6fPq5mzyHjWtUkn3Ph/gP
         Nf3CcqPA2FGRZ7RK9e6cuBDjoE3f1imgXLxu7ctRern15H9uFCuIUTCsz99zWPj9THpy
         FjzPg9kqHh8Kcc03RBiqcp34aBcmtesRhrVZKsTpdiU2Rt3fJD+/yv7Rwl5KQgmYogOE
         8vXXcjKAcvEgApUT5vUaHiyLvyhZJN9o8toDKtHfRfyplhcffX7hXX90fDeRBGKcolWy
         zp8laUe03jx1m/sT5CqnkOTbu/PO9iUFHPJUxUEtRfmY7RmaR2ZMgLRvKWX1WSOpy1Wl
         a8tA==
X-Forwarded-Encrypted: i=1; AFNElJ+3f7JkFred6Ze9HsRHHgDBdV6K4G+P3rLBcuuw1ZQSeJnkDq/yLqsF+CN6YcrQFU0WvMJtN6y1XzM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyikHZncwkp0WYnZXsHIoi81zVMFv0Eb600hyzaFZE3M3SwfxAW
	DMT+VWHloK1F3qjRH5tnEtMAoKij4dWFx6GEtAIWxYtRmZCOq/4EYd2j7WO31u39bQ==
X-Gm-Gg: Acq92OHWy4HHXN7P5ZTTZkgYyUhq8bcSDSKqLDkiOCdKNLHVUFYaR+S09Wp0LEzNUHI
	9IqDAbm/6uOyX6ZYQS0w34zWpuBYd0U/1SBfpOnksAGUOfaBA0xNsV6c1mxcM2A5J8zNNFRQihs
	sIiXmA7exFzTyEEWBn6mlOXWSYs1D7HMGc623q3lvdp8NYrb85AfVJbqIbywv+JrHYn3zqBfzQq
	VoA2AsTujj/7LCUEUsWgA4QLF+5WSFlwuGM93Tx6lzUOcs2oBXOeT9/iN/il4oYvaSo0hW0agbZ
	YLQHYfCtOA5iRjHYIb8CEtvsgCKu+iKf48v4O0k9u0LzPItz76UNuU5sU8ebYQ7T+RPt63Mf77B
	4gNQpKy9ewkTqMoxm7NIFq3ph3rGtiLyIGIv+cKyFu9s54i6Fp7blywGt6zTmr1aMYCHjLXHbU6
	ETOUJPkvQObrYVAxKglYxvqDYNuz1efTkQEs3EAPfLDUT1F9eAZsFMTKyTsh0SFzEU+JGGZfpTl
	qS4cSb4ORqUHDk=
X-Received: by 2002:a05:600c:4e87:b0:48a:768b:eea9 with SMTP id 5b1f17b1804b1-48fe60e51bamr254801655e9.4.1779118425440;
        Mon, 18 May 2026 08:33:45 -0700 (PDT)
Message-ID: <8b076265-8559-40cd-ac65-418e7b3c9e7e@suse.com>
Date: Mon, 18 May 2026 17:33:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/26] xen/riscv: Implement construct_domain()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <3b1c60095c8a963e7df3ca5025e637e678f5ee71.1778250616.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3b1c60095c8a963e7df3ca5025e637e678f5ee71.1778250616.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1779118426-23B78C48-187BEEBB/10/73395122804
X-purgate-type: spam
X-purgate-size: 1944
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EEF365700CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.05.2026 16:43, Oleksii Kurochko wrote:
> Implement construct_domain() function for RISC-V, which performs initial setup
> for the domain's first vCPU, loads the kernel, initrd, and device tree,
> and sets up guest CPU registers for boot.
> 
> It also creates additional vCPUs up to max_vcpus and assigns the device tree
> address and boot cpuid in registers.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- /dev/null
> +++ b/xen/arch/riscv/domain-build.c
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/fdt-domain-build.h>
> +#include <xen/fdt-kernel.h>
> +#include <xen/init.h>
> +#include <xen/sched.h>
> +
> +#include <asm/current.h>
> +#include <asm/guest_access.h>
> +
> +int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
> +{
> +    struct vcpu *v = d->vcpu[0];
> +    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(v);
> +
> +    BUG_ON(v->is_initialised);
> +
> +    /*
> +     * At the moment *_load() don't return value and will just panic()
> +     * inside.
> +     * TODO: it will be good to change that.
> +     */
> +    kernel_load(kinfo);
> +    initrd_load(kinfo, copy_to_guest_phys);
> +    dtb_load(kinfo, copy_to_guest_phys);
> +
> +    regs->sepc = kinfo->entry;
> +
> +    /* Guest boot cpuid = 0 */
> +    regs->a0 = 0;
> +    regs->a1 = kinfo->dtb_paddr;
> +
> +    for ( unsigned int i = 1; i < d->max_vcpus; i++ )
> +    {
> +        const struct vcpu *tmp_v = vcpu_create(d, i);
> +
> +        if ( !tmp_v )
> +        {
> +            printk("Failed to allocate %pd v%d\n", d, i);

... %u used here and ...

> +            break;
> +        }
> +
> +        dprintk(XENLOG_INFO, "Created vcpu %pv\n", tmp_v);

... this line preferably dropped. Can do when committing, provided you agree.

Jan

