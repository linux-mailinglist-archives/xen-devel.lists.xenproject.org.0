Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aK8LBImEMmqK1QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:27:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D456990FF
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:27:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Xmw+yq0O;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1340278.1601332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoQ0-0007eP-EG; Wed, 17 Jun 2026 11:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340278.1601332; Wed, 17 Jun 2026 11:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoQ0-0007ck-B8; Wed, 17 Jun 2026 11:26:52 +0000
Received: by outflank-mailman (input) for mailman id 1340278;
 Wed, 17 Jun 2026 11:26:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoPz-0007cb-8x
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:26:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoPy-008jwd-M7
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:26:50 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a328479-2eae-0a2a0a5409dd-0a2a450b9a86-14
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:26:50 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a32847a-212f-0a2a450b0019-d155dd36a423-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:26:50 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-462cdb88d01so342699f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:26:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4620b3ed0d2sm13058979f8f.22.2026.06.17.04.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 04:26:48 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781695610; x=1782300410; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fL90O+qmwfXcnXK4xebo5Fd5mOdE/JIRioGBHwtm9nE=;
        b=Xmw+yq0O9dIzS4TmGFgqpUFynRroOiH1dAXT/S06RzLkpquf20cE0eihNpjD0GJPEb
         KT6cwUxQGCcyTUGHj6lXYHmianqgSUhA5k+qRzYmEBxTJLPLHuH5qkIkROkV8SqTwYVW
         KwIZbUofZZ9qSiVgWkJcRFBPjqJbXRrk8JScIAjhlj62xlCmNTJfGH6xSOpbe8CxuWyM
         T/uGKSbmz/Qbz3xFrMcLMIJzHj89HtEgSG1JBl792rCp63H23A+C7hRESzmioAArZHkW
         nNoSccN1Sow2DdZgKgGwK5h2vjyFo3+Mw0AfchV2uuicduSMbxctnyCLjVEt2AqRIM8X
         M3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695610; x=1782300410;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fL90O+qmwfXcnXK4xebo5Fd5mOdE/JIRioGBHwtm9nE=;
        b=SfrXkBVxxo4WbKLWp1K34c2H9DwWpnulVeEu6W5Xx0JdIejn7Ne66lq7T5r/wYLKJb
         l213NszkyqaLzNEtxkG1ly4T2SC27LtHieLiKhkErQiH+PGvWg2DrR2LealhJig7RRLw
         xwLDKkdywQKSRjRGvJ78qKJDzLY2nGm6ZXzG7SEElMiWbyQ8RGCz+E9wroRvSqHCry3M
         Wco8Pi10zPzV4XtLC+HYXfPDyb0Em2EHpBSUgKPyZi5vMKe90iQsbOFQLI+GHCgsnKZ3
         NrEBKbyVbRm8bYL2lsB5C3vxPLidulIb1sWIibkmC075a5kDyIrHbGxt6JXbOXuIYqkn
         usrA==
X-Forwarded-Encrypted: i=1; AFNElJ/xSQUC/ftWGfZuC5efisj7Dg+9Ag7WuspGnD8dh4N6qNrtroq1OR6F3o77wkgwbnj6U1+zlIQVNZE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4LQu15Ij/WY175ld52JWDKzKPmJXIHHx9o61bwjGyvQ4B6rVs
	hmN4tyJQIhu0OvuTWB72ziFAMYPO3fr8vHGRf3XIqYyLRPlQ2udQxeW5QtUFzuAfGw==
X-Gm-Gg: AfdE7cmG5DQ6gSeFXOBmOqhvMCARazIh67vKU+JaZdqUnJiL2hfxV3vLd1Z35+XuFuD
	MeMZ5m4gBYHZiJ/ih/K3SG6orH0o3A99S6ecZEyazhpj0H6gYbCedUKLHU8H3qHg2yB+w/dPc7d
	MLQxCgJx5GZFo00flgMeimfWUblYdmppbFl2OR/0cwjwfNez+vs9LEl34wkR4Fgn/NY48AKqizm
	f7Dr2Jmm9I3nsppUMKkp7jF1+5d3LQg86NSYEMi/kuJJRXwcW4bstDuxBP7WwdjwsaTlgVzIuea
	2fKjiqbjOBF3qBhWt78HnCiTwOmpjuAWugMhJbcjQUx+Bm1lqst5AkptZZlGtW3Wi1yQhbB82Ci
	0zI4WpzOwxgS0iCl9rUAYfLojc8HZXdVwHbTj7IWsoJ36eLEA4laqzwkzjRYOUYEPxKOYGm0JBY
	JI3OnyMVoYNq5aUlhTWgBzSSQcTJ+1YXp5iZMY1hQ0CV6tfTHIPUZ3mXMFHJwyS6ApJCltdUvnT
	B8DJogBvFBGJGI=
X-Received: by 2002:a05:6000:26cb:b0:460:d1e:a59a with SMTP id ffacd0b85a97d-462699af503mr4389027f8f.8.1781695609855;
        Wed, 17 Jun 2026 04:26:49 -0700 (PDT)
Message-ID: <cd91fa75-435b-4100-8932-99f3da5523a7@suse.com>
Date: Wed, 17 Jun 2026 13:26:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/23] xen/riscv: Implement construct_domain()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <db630a8a003a1aa69e4edaf6d5f4994f18ac1354.1781693963.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <db630a8a003a1aa69e4edaf6d5f4994f18ac1354.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1781695610-1976AF3B-81B32720/10/73395122804
X-purgate-type: spam
X-purgate-size: 2196
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69D456990FF

On 17.06.2026 13:17, Oleksii Kurochko wrote:
> Implement construct_domain() function for RISC-V, which performs initial setup
> for the domain's first vCPU, loads the kernel, initrd, and device tree,
> and sets up guest CPU registers for boot.
> 
> It also creates additional vCPUs up to max_vcpus and assigns the device tree
> address and boot cpuid in registers.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v3:
>  - s/%d/%u for printing vCPU index in the failure message.
>  - Drop dprintk() for successful vCPU creation.

My

Acked-by: Jan Beulich <jbeulich@suse.com>

was lost, however. One more remark:

> --- /dev/null
> +++ b/xen/arch/riscv/domain-build.c
> @@ -0,0 +1,50 @@
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
> +            printk("Failed to allocate %pd v%u\n", d, i);

If you dropped the blank before v%u, the output would match that of %pv
(improving the chances of people actually spotting that the exact same
thing is meant). Once again - can do the adjustment while committing,
provided you agree (and provided earlier patches gain the necessary
acks).

Jan

