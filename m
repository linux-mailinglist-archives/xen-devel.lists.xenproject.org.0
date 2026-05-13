Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEcUMzUgBGpyEAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 08:54:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EEC52E4A8
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 08:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307624.1579226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN3To-0006Ze-AY; Wed, 13 May 2026 06:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307624.1579226; Wed, 13 May 2026 06:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN3To-0006XT-7V; Wed, 13 May 2026 06:54:04 +0000
Received: by outflank-mailman (input) for mailman id 1307624;
 Wed, 13 May 2026 06:54:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wN3Tm-0006XN-Hz
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 06:54:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN3Tl-001TRv-Ra
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 08:54:01 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a042000-e002-0a2a0a5209dd-0a2a4506b008-36
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 08:54:01 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a042009-7371-0a2a45060019-d1558033e0e7-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 08:54:01 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so107085685e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 23:54:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8f410d9fsm49248815e9.6.2026.05.12.23.53.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 23:54:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1778655241; x=1779260041; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0WQBOK2y5ytwxP8GeopHUORAq13cq7X0A3saVGSqMMM=;
        b=ViV2wDZIoLnwkdFp3VDV1sDNuqM3UCZloKdFZ0poW163zEgJUh71qzMQvHEv35VLB6
         lLO+g8AdIcDHwFbKqVjgGy07Zem5Bg+RymGE4TyQ6kVY18seSXtqGBQzoG3ZMIGUFTLy
         BgOm/7ir9JTrpx6jUvrlNGiYw6ZLZv/m98uv6CKyJyOz0+fwRmnQUbAOFJ3XGv4RNEgd
         XeeHasKTrJV5nE+MA9mIZ0ZSXr2x+0NiDi2I8FMZkD8sCtbQRDFKM89ZwK04HRYEgl91
         eE7a2Qct7CpkhyEZlRo4KbqMXqYjn3PNUaVurnxjcnaAWpVsHH79kBVA5ddKy1iLZTS3
         CXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778655241; x=1779260041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WQBOK2y5ytwxP8GeopHUORAq13cq7X0A3saVGSqMMM=;
        b=IeMIoDUEB1hkKdc2h5THn7SjoYgqPopAwHSNiGNHpJUxOMUAf85l9mWUS9bGyw1vJl
         jMLqYPfDjV8rvjwftuj4GZeYX0V04BqeugF7HO6KalqzR/o7YXRDvE/EyV41W8zjnOEF
         g+qqBiZkOrfKiFfGqoih8hPEa/FaXsHeA4jB+fd5sKDLCZM1NaabTxlljPyrK7faoTEb
         /HVBtFGjBt86CPvRr0v8/lTOEgBi0vsEBks9yc9Rru76/5v9pJDbn9ll6M5/GgFGCm7b
         QnWAf8oTQ5dL9nYZ3iluHrcwK0DmSbwOlquP+2r5fcOcgDI6mWlaFJ0Arp7ZU91V7eDH
         TEvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ykg0sE6zbF7t3WOzThck4kcZl1mQmxp/ZsO8tIOoZNl2UvumOrAfsD6IX0n/L9e67t9QbeSxLvV0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1GCBrlELJ1AYqzR9XgqvIF6lSLpWl0mMjxL1J0U1p6czrO8+r
	fHHDrQKcXFRRib2QrE6CEmztjBxMmnUNG55GzE9g2rF8AVTtpK02TEZ0eJQYHavPfw==
X-Gm-Gg: Acq92OFJddW/NQCUR6UJXCokvnsiQqZgGA8vAzJrfNUwjz/BDA+lFWqwCSVUUw6hqdd
	yGIq/NanB9FCwt0YHvH/TQcn3LR68blA9yLzcm64dqgbBX3yS74iestOhjL7FnrRUTo76mxWmBC
	c58lX49LHyZcatOuNeCseE28SiZ0gAbrze+CmNGsSsnc2rlb6+d01TjkO7357sJgfd3WXDHKPlT
	24YyL23CWaKsXFYNKk+zMfX12oAx5kFJbDaLXQmZrFkpobpXcDj6x4VTmnuvg/uMFf8rpXfGg8B
	cpwN0OxV8dIHFBXEfVbW+6KOb1fdcE+l6nK6NIdDLn2+a56CmBWeCg/ES4lPrPWFocFSpC1pIVy
	+XLQ77eNWdNhXbLYttpZ7lRWDXAriqdcvySl9hJSXQFKaIQxIsDpYrgK4LYhohgNTT53tbOp4j4
	DsJIfmUlWP6N6bQnEAH551ZDYXR6PFYu5c750pZQ8+HpU9ePHTsggGcB85zNliKdPN8i3l4PtAj
	pGHRzWCOj0U+kg=
X-Received: by 2002:a05:600c:8705:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-48fce9c731dmr18906225e9.9.1778655240745;
        Tue, 12 May 2026 23:54:00 -0700 (PDT)
Message-ID: <7a540913-adc4-4172-9108-9c91eaf854fe@suse.com>
Date: Wed, 13 May 2026 08:53:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/13] xen/arm: Add vPSCI SYSTEM_SUSPEND policy
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
References: <cover.1778605274.git.mykola_kvach@epam.com>
 <06448a30ef6694a55ac85d4c8c78ca2d71342430.1778605274.git.mykola_kvach@epam.com>
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
In-Reply-To: <06448a30ef6694a55ac85d4c8c78ca2d71342430.1778605274.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1778655241-8EB8BD75-C0D0E279/0/0
X-purgate-type: clean
X-purgate-size: 6329
X-Rspamd-Queue-Id: 44EEC52E4A8
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:rahul.singh@arm.com,m:xen-devel@lists.xenproject.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 12.05.2026 19:07, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> Introduce CONFIG_HAS_HWDOM_SYSTEM_SUSPEND as an architecture-selected
> capability for platforms where the hardware domain can be parked with
> SHUTDOWN_suspend without calling hwdom_shutdown().
> 
> Expose PSCI SYSTEM_SUSPEND as a vPSCI operation for all domains. For
> non-control domains, including the hardware domain when it is not acting as a
> control domain, the call is handled as a guest/domain suspend request and
> parks the domain in SHUTDOWN_suspend.
> 
> Control domains need additional sequencing because their SYSTEM_SUSPEND
> request is used to coordinate host-wide suspend. A non-last awake control
> domain may be parked in SHUTDOWN_suspend without requiring the host suspend
> path to be available. The last awake control domain is treated as the point
> where the request becomes a host-suspend request, and it may only proceed
> when all non-control domains are already in SHUTDOWN_suspend and the host
> suspend path is available.
> 
> Keep the control-domain sequencing and domain-readiness checks out of
> PSCI_FEATURES. They are per-attempt runtime conditions rather than stable PSCI
> function availability. Advertise SYSTEM_SUSPEND as implemented by vPSCI and
> enforce the sequencing policy in the call handler.
> 
> Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSPEND so
> that SHUTDOWN_suspend from the hardware domain can be treated as a domain
> suspend state rather than as a hardware-domain initiated host shutdown. This
> does not by itself imply that host-wide suspend is available.
> 
> Add host_system_suspend_allowed() to combine the host PSCI SYSTEM_SUSPEND
> capability with runtime blockers reported by Xen-owned subsystems. Add
> runtime blockers for registered serial, IOMMU, GIC and SMMUv3 MSI IRQ paths
> lacking suspend/resume support. These blockers are runtime based, so they
> only apply to drivers or paths that Xen actually uses on the platform. For
> SMMUv3, the blocker applies only when Xen actually uses the MSI IRQ path,
> since resume does not restore the SMMU *_IRQ_CFGn MSI registers yet.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>  xen/arch/arm/Kconfig                  |   1 +
>  xen/arch/arm/gic.c                    |   6 ++
>  xen/arch/arm/include/asm/psci.h       |   3 +
>  xen/arch/arm/include/asm/suspend.h    |  10 ++-
>  xen/arch/arm/psci.c                   |   7 ++
>  xen/arch/arm/suspend.c                |  40 +++++++++
>  xen/arch/arm/vpsci.c                  | 114 +++++++++++++++++++++++---
>  xen/common/Kconfig                    |   3 +
>  xen/common/domain.c                   |   7 +-
>  xen/drivers/char/serial.c             |  12 +++
>  xen/drivers/passthrough/arm/iommu.c   |   4 +
>  xen/drivers/passthrough/arm/smmu-v3.c |   4 +
>  xen/include/xen/serial.h              |   1 +
>  xen/include/xen/suspend.h             |   2 +
>  14 files changed, 201 insertions(+), 13 deletions(-)
> 

Contrary to what the cover letter says, there's no revlog here.

> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -1,9 +1,49 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
> +#include <asm/psci.h>
>  #include <asm/suspend.h>
>  
> +#include <xen/lib.h>
> +#include <xen/serial.h>
> +
>  struct resume_cpu_context resume_cpu_context;
>  
> +/*
> + * Non-PSCI infrastructure can make host suspend impossible even when the PSCI
> + * SYSTEM_SUSPEND conduit is present, e.g. when a Xen-owned driver has no valid
> + * suspend/resume path.
> + *
> + * This gate is checked only when the last awake control domain attempts to
> + * turn a guest SYSTEM_SUSPEND request into a host-suspend request.
> + */
> +static bool host_system_suspend_runtime_allowed = true;
> +
> +static bool host_serial_suspend_allowed(void)
> +{
> +    if ( serial_suspend_supported() )
> +        return true;
> +
> +    printk_once(XENLOG_INFO
> +                "Host SYSTEM_SUSPEND blocked: serial driver lacks suspend/resume support\n");

Please try to keep log messages down to a reasonable size. In the case here,
what value does "suspend/resume" add?

> +static int32_t domain_psci_system_suspend_policy(struct domain *d)
> +{
> +    struct domain *other;
> +    bool last_awake_control_domain = true;
> +    bool awake_non_control_domain = false;
> +
> +    /* Only control domains participate in sequencing policy. */
> +    if ( !is_control_domain(d) )
> +        return 0;
> +
> +    rcu_read_lock(&domlist_read_lock);
> +
> +    for_each_domain ( other )
> +    {
> +        bool suspended;
> +
> +        if ( other == d )
> +            continue;
> +
> +        suspended = domain_in_suspend_state(other);
> +        if ( suspended )
> +            continue;
> +
> +        if ( is_control_domain(other) )
> +        {
> +            last_awake_control_domain = false;
> +            break;
> +        }
> +
> +        awake_non_control_domain = true;
> +    }
> +
> +    rcu_read_unlock(&domlist_read_lock);
> +
> +    /*
> +     * Another control domain is still awake. This request is only the first
> +     * phase of the sequencing: park this control domain and leave the host
> +     * running. Host-wide suspend gates must not block this intermediate state.
> +     */
> +    if ( !last_awake_control_domain )
> +        return 0;
> +
> +    /*
> +     * This is the last awake control domain. It must not be parked unless the
> +     * request can proceed as a host-suspend request; otherwise Xen would lose
> +     * the last domain that can coordinate the system suspend.
> +     */
> +    if ( awake_non_control_domain )
> +    {
> +        printk(XENLOG_DEBUG
> +               "SYSTEM_SUSPEND denied: last awake control domain dom%u requested host suspend while non-control domains are still awake\n",
> +               d->domain_id);

Same here, plus please use %pd.

> --- a/xen/drivers/char/serial.c
> +++ b/xen/drivers/char/serial.c
> @@ -497,6 +497,8 @@ const struct vuart_info *serial_vuart_info(int idx)
>  
>  #ifdef CONFIG_SYSTEM_SUSPEND
>  
> +static bool __read_mostly serial_suspend_available = true;

__ro_after_init?

Jan

