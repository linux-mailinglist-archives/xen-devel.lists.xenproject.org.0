Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLEZL4s1fmnGWQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 31 Jan 2026 18:02:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4F6C31B9
	for <lists+xen-devel@lfdr.de>; Sat, 31 Jan 2026 18:02:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218177.1527120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmELE-0005UL-Gs; Sat, 31 Jan 2026 17:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218177.1527120; Sat, 31 Jan 2026 17:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmELE-0005RD-DW; Sat, 31 Jan 2026 17:01:00 +0000
Received: by outflank-mailman (input) for mailman id 1218177;
 Sat, 31 Jan 2026 17:00:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQ/4=AE=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1vmELC-0005R5-Mu
 for xen-devel@lists.xenproject.org; Sat, 31 Jan 2026 17:00:58 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 696c31ac-fec6-11f0-b161-2bf370ae4941;
 Sat, 31 Jan 2026 18:00:57 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6580dbdb41eso4863279a12.0
 for <xen-devel@lists.xenproject.org>; Sat, 31 Jan 2026 09:00:57 -0800 (PST)
Received: from [192.168.0.109] ([91.123.155.165])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-658b4453094sm5430433a12.14.2026.01.31.09.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Jan 2026 09:00:55 -0800 (PST)
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
X-Inumbo-ID: 696c31ac-fec6-11f0-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769878857; x=1770483657; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2bhQQevyf9AdeIPxUCE2YsbW12q7eOLP2FUGRr8woF4=;
        b=F6QPRwgn1uNw9/JD1vuwNBY5N1R8Ha/G6KxV8dLhnsOTg2gpUTFYBf57b4A8zp2Wwc
         sEUtMnnJWRqNMbP20l9L6bL0Ms5d83434EgdKcd6vhMii9iDjGbeJr3iza20jyz/mL52
         n3jjmzxPY6F2FJ3lTs1VgtzD8oczzp1LJ8CWH1/zsgr0dbrvR781CmuwkehFMVFZr30Q
         f7Fq+C/YZz5p9cdrAQJ+wk+rZskZJG/RpTL1nJVXRep7PQvcer1v7/fLvItDL0hT/SC4
         gUT8UARrXoXaEXNFuyVMt3pgeHR22sIFittnVgNJFxeOQQ2JC6OUwT/nXK7J92rYx6me
         jJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769878857; x=1770483657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bhQQevyf9AdeIPxUCE2YsbW12q7eOLP2FUGRr8woF4=;
        b=vrBeUpsjgs0PN8yHgZfhGPAIaSVjeho/zCoGdWYPhs0r6DD6DDLrMCHHZBGVzODoGR
         7EHpbNMvxkXkJTjCypHHB98a8HJCLrICa/bBs8ZdgiE7NRSdtMl+vaKJq3rtuZkP7sqW
         hJ8Lng/04/ZylgZt4BlNozYuFp2t/zAX0yiYIM14pn18mjOey/UR6c+cskw2h84STJ+F
         1Xe53b2PRilXRc1+jE4YItr0Ndq6kvkd+2kOmWS6XiSrthKd+yXDW4d9jiqyc83spttu
         v/O850Pec/FcBLhWiX4cxJsQH0Du5Q2zdjoaKAKITl81zQz+YjGPle/Si43Yko6j9NhA
         aFVg==
X-Forwarded-Encrypted: i=1; AJvYcCWGbp5CR2Uqn9eieOnWNshpoYcjpI4uPbZuAQWwbGMOK+mA7IAd+PtRNfEyBTgg9ir9QOXl59o7cRA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywo3FGUxkHRI7h++/kQtKbVmAEEFR0YkpQYhIC67M3EYl7f6K42
	yeD2/r2rijCgeG77zcSD/njWUxeZLeHlwu4mO9ZBu+VdZBFiUMhicSDd
X-Gm-Gg: AZuq6aIJq2crMdyRjEdNdu+Juv0zaBQR/gXNxBc+VvVT/1Jg4JICazh9O0zUP8oLMnZ
	F8qwXfLZgKp2OvSrRrE+GIt/Ae+LcAn9aalaBvh9FOW3IL/LQZfc1bIaI9BgOKbO832XJVOFfgQ
	7lr/jLuZVqzW6GkLAXgh6wTWr+mNQngJz5M9U+CcFAvrnmjzB6gSwtiWoeclY5331pLHD0amsZt
	2gbliSC9NhulXdZ/zVxDG9+nC+gjfMI9HmeGESDLhJz7dIApnUYCrU8KACKS16doe7R22f09a9V
	2JQ/QSi9a1iDZIH80o1cRnyIr1lalmRFePGMM8J9lvbdR5jBTC6Uv7WSHnjslNoF6Khyqr46+i6
	LjkVWjwWiBzskiYLt+Py0aWKUWzgJ3L3ALBgXLn8TjdMn+gV1wornknNVVsoeTyfAce8Yg8OsE6
	rWbG92THoL5rwx27nkT172hgSEZw==
X-Received: by 2002:a05:6402:50ca:b0:658:c177:7510 with SMTP id 4fb4d7f45d1cf-658de544fdfmr4025009a12.7.1769878856595;
        Sat, 31 Jan 2026 09:00:56 -0800 (PST)
Message-ID: <7c93f37d-3699-454e-abb9-4499b08d0654@gmail.com>
Date: Sat, 31 Jan 2026 19:00:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/12] xen/arm: gic-v3: add ITS suspend/resume support
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1765472890.git.mykola_kvach@epam.com>
 <2fade2b96128053fbe3ed59f1d5e3444b32b96c3.1765472890.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <2fade2b96128053fbe3ed59f1d5e3444b32b96c3.1765472890.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1F4F6C31B9
X-Rspamd-Action: no action



On 11.12.25 20:43, Mykola Kvach wrote:

Hello Mykola

> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> Handle system suspend/resume for GICv3 with an ITS present so LPIs keep
> working after firmware powers the GIC down. Snapshot the CPU interface,
> distributor and last-CPU redistributor state, disable the ITS to cache its
> CTLR/CBASER/BASER registers, then restore everything and re-arm the
> collection on resume.
> 
> Add list_for_each_entry_continue_reverse() in list.h for the ITS suspend
> error path that needs to roll back partially saved state.
> 
> Based on Linux commit: dba0bc7b76dc ("irqchip/gic-v3-its: Add ability to save/restore ITS state")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>   xen/arch/arm/gic-v3-its.c             | 91 +++++++++++++++++++++++++++
>   xen/arch/arm/gic-v3.c                 | 15 ++++-
>   xen/arch/arm/include/asm/gic_v3_its.h | 23 +++++++
>   xen/include/xen/list.h                | 14 +++++
>   4 files changed, 140 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 34833166ad..08a3d8d1ef 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -1209,6 +1209,97 @@ int gicv3_its_init(void)
>       return 0;
>   }
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +int gicv3_its_suspend(void)
> +{
> +    struct host_its *its;
> +    int ret;
> +
> +    list_for_each_entry(its, &host_its_list, entry)
> +    {
> +        unsigned int i;
> +        void __iomem *base = its->its_base;
> +
> +        its->suspend_ctx.ctlr = readl_relaxed(base + GITS_CTLR);
> +        ret = gicv3_disable_its(its);
> +        if ( ret )
> +        {
> +            writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
> +            goto err;
> +        }
> +
> +        its->suspend_ctx.cbaser = readq_relaxed(base + GITS_CBASER);
> +
> +        for (i = 0; i < GITS_BASER_NR_REGS; i++) {
> +            uint64_t baser = readq_relaxed(base + GITS_BASER0 + i * 8);
> +
> +            if ( !(baser & GITS_VALID_BIT) )
> +                continue;
> +
> +            its->suspend_ctx.baser[i] = baser;
> +        }
> +    }
> +
> +    return 0;
> +
> + err:
> +    list_for_each_entry_continue_reverse(its, &host_its_list, entry)
> +        writel_relaxed(its->suspend_ctx.ctlr, its->its_base + GITS_CTLR);
> +
> +    return ret;
> +}
> +
> +void gicv3_its_resume(void)
> +{
> +    struct host_its *its;
> +    int ret;
> +
> +    list_for_each_entry(its, &host_its_list, entry)
> +    {
> +        void __iomem *base;
> +        unsigned int i;
> +
> +        base = its->its_base;
> +
> +        /*
> +         * Make sure that the ITS is disabled. If it fails to quiesce,
> +         * don't restore it since writing to CBASER or BASER<n>
> +         * registers is undefined according to the GIC v3 ITS
> +         * Specification.
> +         *
> +         * Firmware resuming with the ITS enabled is terminally broken.
> +         */
> +        WARN_ON(readl_relaxed(base + GITS_CTLR) & GITS_CTLR_ENABLE);
> +        ret = gicv3_disable_its(its);
> +        if ( ret )
> +            continue;

If ITS fails to disable (quiesce), the code skips restoration and ITS 
remains in an unconfigured state. However, immediately after the loop ...


> +
> +        writeq_relaxed(its->suspend_ctx.cbaser, base + GITS_CBASER);
> +
> +        /*
> +         * Writing CBASER resets CREADR to 0, so make CWRITER and
> +         * cmd_write line up with it.

NIT: The variable "cmd_write" does not exist in the Xen driver. As I 
understand, this comment was ported from the Linux kernel driver as is, 
which maintains a software shadow copy of the write pointer named 
"cmd_write".


> +         */
> +        writeq_relaxed(0, base + GITS_CWRITER);
> +
> +        /* Restore GITS_BASER from the value cache. */
> +        for (i = 0; i < GITS_BASER_NR_REGS; i++) {
> +            uint64_t baser = its->suspend_ctx.baser[i];
> +
> +            if ( !(baser & GITS_VALID_BIT) )
> +                continue;
> +
> +            writeq_relaxed(baser, base + GITS_BASER0 + i * 8);
> +        }
> +        writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
> +    }
> +
> +    ret = gicv3_its_setup_collection(smp_processor_id());

  ... this function iterates over all host ITS instances (including the 
one we skipped) and attempts to send MAPC commands. I am afraid, that
attempting to write to the command queue of an uninitialized/unrestored 
ITS might have bad consequences.

> +    if ( ret )
> +        panic("GICv3: ITS: resume setup collection failed: %d\n", ret);
> +}
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
>   

[snip]


