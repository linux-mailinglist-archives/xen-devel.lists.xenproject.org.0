Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJZHLH9bwmnQbwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 10:38:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDFD305B5E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 10:38:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260190.1553550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4yCr-0003ZP-7t; Tue, 24 Mar 2026 09:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260190.1553550; Tue, 24 Mar 2026 09:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4yCr-0003X3-4s; Tue, 24 Mar 2026 09:37:49 +0000
Received: by outflank-mailman (input) for mailman id 1260190;
 Tue, 24 Mar 2026 09:37:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iLjC=BY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w4yCq-0003Wx-4r
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 09:37:48 +0000
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d8c9ce3-2765-11f1-b166-2bf370ae4941;
 Tue, 24 Mar 2026 10:37:46 +0100 (CET)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-43b467dcf0bso3649409f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 02:37:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b647177e8sm35715718f8f.34.2026.03.24.02.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 02:37:45 -0700 (PDT)
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
X-Inumbo-ID: 1d8c9ce3-2765-11f1-b166-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774345066; x=1774949866; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HtchiBUwAhun9mMkWgmGNUxcFrHng6e/ies3aRlxXcA=;
        b=HGctSRcpj5x4LEyaoYL4H56SY6V85bC64lqthqbEZzXzREy2h51DDwcwFCjq2S76Aj
         rmNb2q1MMV8JRinkN5/aYtUSUde79Fj5b9rz5jpncHP8nvW4ARtJ9fRxtRhmytYz73G9
         ZDWLDyWMV0K9ZWSBA3fAE7EwiijrvXZOUMb2QaVO/Z7HHpPpaBZGIN82v/1K0oQ1QPQR
         AF9dPee+Fcmv9jnAF+l5mLE6n0h/hEmAygWASG+nvqieV6UVQPy2hkYZqtSJX1c5j34D
         jMMR+jutrcaReOcGNOK8CgHKjc5dpJGeYd+RlKhpPUVj5SJ/PNSVA2tkVJrArNHUSuNG
         EiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345066; x=1774949866;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtchiBUwAhun9mMkWgmGNUxcFrHng6e/ies3aRlxXcA=;
        b=eC0s7YQ4fiCD0ANDjx+OciroeeAuE7sU+wl8POWukuUTzdU0kHkCgKj/+PLvOVwOan
         Idv1Bfy1qWnVwpwXp5oeJAFFMu7UYTa4+kT6TQCuWzaQTYR+gAG23EYfN8uVSe7Hherv
         eP+b1fdF9FwDycyAwhg+xHSw2uDHg2Ocb5Sx5McrQvu79gpjOwLudPnV+e0u1znFKkZH
         6UxL2Sb8+SklRusUysnvG5DjSgaXZPwBCkbP+M9BkgWHVC8oTD0oyWe0EukugHjCUYWh
         nGOw+UsNpzJmZ5WGQEL+B6lgYdRzeEvJv+SR5GZlYBAluAa/wxHcuQx+ZlE7SQLj3bMC
         tTQA==
X-Forwarded-Encrypted: i=1; AJvYcCUayC26/xDkavHld0c8A8DFKV4wWJYLpCf0026ytobG82skcGfINhneNzqT/qkdAHL1Ppa1ypRtBG0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuxyO4IVEZYCk7pyJgYnLj2NohUXxByP2RI1DvCkuXAE6OC+l0
	7sSIbuF2vVboaGy98zKTGo892DbWu/1wOKYx0DB7ERBqUPRCmWA5sIEs6+WTX5bLcQ==
X-Gm-Gg: ATEYQzxX0AWth8xWOI/vRSdLCyI9yZK/2nMC0QKxwUW5XZ2tdHqpKH1DiFw29FybmxE
	AYi60qsqvTPlpxPCLPXGj+2XpqE+rglep5ujMvJoKRy0FEbwrP38C+L7lmuaNsCMO1PF+RAW5mB
	OrWOvj+zportcl3CEQQCSZvhB1DVDz/zj/xtsH+YABTnZrUYorrp4x8qUdHZI7yhJXib8xhAXH7
	mqE4Mg13S8Mp3MsKglRsnruuw7Ndlt8V67bqgarsKl+zKcxH7TtZBipVZ3l9PPm+mzHZZu3Djic
	WCCsStcRFFAf7TuhAOPCFV78O3onXMe10HLy93k0JS6yJLNrcKbb4nLyENUFbsE3h2zOcbrpmBI
	tcbyuPsW4P7aKmUuRuZbWyjJevEmipZgrqL4Dv4C5L244qrlC98jmJwyJJ+D8HK7KIKkZbcyuR4
	1005TPLeJ2VHdQHSxRPwy5S+h1Dxm+zL1tK9jfztHZLhIAbGDF72maq/gLDWweqsNXbZdgRo/Wd
	ZxXHV56ESV3CFQ=
X-Received: by 2002:a05:6000:4103:b0:439:df59:abc5 with SMTP id ffacd0b85a97d-43b80535f97mr3117608f8f.12.1774345065873;
        Tue, 24 Mar 2026 02:37:45 -0700 (PDT)
Message-ID: <cd1fa52a-0ff2-4b7f-9b0b-c33b6a01b6c8@suse.com>
Date: Tue, 24 Mar 2026 10:37:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/27] xen/riscv: Implement construct_domain()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <3a86599284108e6f2a27488a03145f8dd1b71def.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3a86599284108e6f2a27488a03145f8dd1b71def.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1BDFD305B5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/domain-build.c
> @@ -0,0 +1,46 @@
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

Are you actually altering what kinfo points to?

> +{
> +    struct vcpu *v = d->vcpu[0];
> +    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(v);
> +
> +    BUG_ON(d->vcpu[0] == NULL);

Why not simply "!v"?

Also, while in the cover letter you state a dependency on another series,
this is somewhat unwieldy here. From the titles there I can't deduce which
of the patches would introduce vcpu_guest_cpu_user_regs(). Yet I would
have wanted to double check that it doesn't de-reference v already.

> +    BUG_ON(v->is_initialised);
> +
> +    kernel_load(kinfo);
> +    initrd_load(kinfo, copy_to_guest_phys);
> +    dtb_load(kinfo, copy_to_guest_phys);

These all return void, despite this also being used for non-Dom0. Is it
really fatal to a dom0less system if one out of many domains fail to be
built? Especially when, despite the name, there is a Dom0?

> +    regs->sepc = kinfo->entry;
> +
> +    /* Guest boot cpuid = 0 */
> +    regs->a0 = 0;
> +    regs->a1 = kinfo->dtb_paddr;
> +
> +    for ( unsigned int i = 1; i < d->max_vcpus; i++ )
> +    {
> +        if ( vcpu_create(d, i) == NULL )
> +        {
> +            printk("Failed to allocate %pd v%d\n", d, i);
> +            break;

And no error is indicated to the caller?

> +        }
> +
> +        printk("Created vcpu %d for %pd\n", i, d);

dprintk() at most, and if so, then please use %pv.

> +    }
> +
> +    domain_update_node_affinity(d);
> +
> +    v->is_initialised = 1;

This is a boolean field, so the rhs wants to be "true".

Jan

