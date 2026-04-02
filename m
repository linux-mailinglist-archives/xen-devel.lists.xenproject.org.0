Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JlBO3lMzmmjmgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 13:01:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C29638806D
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 13:01:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271700.1559776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FnL-0006Uy-D3; Thu, 02 Apr 2026 11:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271700.1559776; Thu, 02 Apr 2026 11:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FnL-0006Sh-AJ; Thu, 02 Apr 2026 11:01:03 +0000
Received: by outflank-mailman (input) for mailman id 1271700;
 Thu, 02 Apr 2026 11:01:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8FnJ-0006Sb-Cl
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 11:01:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8FnI-007mxg-P5
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 13:01:00 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce4c6a-5cb7-0a2a0a5109dd-0a2a450be07a-6
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 13:01:00 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce4c6c-bca8-0a2a450b0019-d155802ccdf8-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 13:01:00 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4887d4c6234so9307805e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 04:01:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887c561750sm229542455e9.2.2026.04.02.04.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 04:00:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1775127660; x=1775732460; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ncklvoF5otYx97jBSQ6JDFXPzpLgz3WdfvaXJOFtuLE=;
        b=gsgzadRM6eRzOiAOVS6aPx+AFM/2ewvq/zIaRYixUnmPl9uViCjachQU3hkdGU9Lj+
         SXy/+bDovscoKqpX24XukmgssdvCurX7rY/XSgqlfpcgvxEeR/nt2CHprn6e9QKYuS7m
         O4poKBT4GketDaKGh8J7fQxhHcgy0IbH5UC6XpEMRHH1Fl5mmvjjUC2L+jOGcf3MMj66
         QKtWc1iSzSp+7l/K43frUvkHFW2oPvj8ecGmgY0DDMkLAKBlD6cD/BWH4COdD3hm7Ggp
         T3S6mc0q+aS8RUnvmz9iScOuH8m7ksCD1ARGvGmW5KL8YVtHzFMHHSxxlMGd08rLQ4VG
         xv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775127660; x=1775732460;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncklvoF5otYx97jBSQ6JDFXPzpLgz3WdfvaXJOFtuLE=;
        b=TyJBHX3NQaW9s7sDoBmpxOVvH471ouXt3oPJD7qXK/io8BvGl8uSYRp1/XBuACPoni
         UaNajtIkBro2xxtsobOoDNTiXy+Zypubq2mCzTzp0VxiRFy5JfJXwRMrX8wmWqgYzKzX
         GoCXMHf6oiv03bImjGK0bUEsNFlFcBvy2YvbGWAF626UUYC8lSLrWKfmHmf4ar62OHXN
         bWSL/gG+XJ+fy25NKAqp5UQ/wDRKBCVRye5aQ19NNiVCqxrRGYCTtgGCQ7vdCDwuCDpu
         PdJEWf0TT3br6jpx3aDIWtEXycCO6ptLVfpptkcMtSlXmDsrZBSESKIbkgKAzwn5coyh
         Mzmw==
X-Forwarded-Encrypted: i=1; AJvYcCWy4ImUfC/zcPLWfGRmJu//plGi3l7tYiO9MYDgURoxHvasGAuqGzhVJZxQ1HcdbpVMzVPyjQRDP/U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNWBu++20Kx2P5bp4YCV7+/andBKyGMAnwdwk2Pk/LYoU3lLG7
	hgTlC4QD2+gfq14mHL6zeqp+QSC2gtKryUfJEy2cTK6ojMXpx6tCRPXxC+M1459XOQ==
X-Gm-Gg: ATEYQzySbhAIZ6Yj9Tzyu06yzGa6DYdQrfKIUcshhWbCiA0yfbqjTOB2t0r3idVXAn8
	qhD6wcYQmUged/0FXVD5mvMvbVvu2VGoCKz+456YsjXmTx0QO11ToR+ObBe2zUup+7ppxDULgmE
	GgVgKGEOx5qXxjkwZbBWtGGKRj22SVrHoJvLmWHIcuZzVh7pf5kssf8tzQUQw4McLXd8/Gnz/VJ
	brvxo+0e07BCTNvL6C6TAzfsruQqMlHCROVv4zrA/DUPCinvxWuXTLoxuczFITcjbxMZdKzSlJ6
	/L4inewccN5b9adlDG0+Xow1YUaqkPgiEO79IDlhiyUQGmbDzgWnRRef0DDvkhMDMn+4G0DJQqY
	EDuiz69iLztVt07Yr5orhHkkQNo0mcpaU0NzxVJqMQsPrQnWSeo4pgMxNsCc/SU5CjZ+bCZzmDP
	LUGyCavye/Y5cs3ngonrsw4eBeQTuRyQ/5QudzoSIlX6qz0f6NXJ0j+0s4aL71BE2ttz4QBORhS
	86dmzM8pducKaw=
X-Received: by 2002:a05:600c:8b4b:b0:485:3fa9:358c with SMTP id 5b1f17b1804b1-4888358c814mr110796525e9.17.1775127659917;
        Thu, 02 Apr 2026 04:00:59 -0700 (PDT)
Message-ID: <104d1273-78d7-466c-ac9f-c06250211e9c@suse.com>
Date: Thu, 2 Apr 2026 13:00:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/13] xen/arm: Add support for system suspend
 triggered by hardware domain
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
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <9b0f8922cd33df2b8e8038d639c1b8d8d73ce401.1775125380.git.mykola_kvach@epam.com>
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
In-Reply-To: <9b0f8922cd33df2b8e8038d639c1b8d8d73ce401.1775125380.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1775127660-EE3542A1-3CD4198C/0/0
X-purgate-type: clean
X-purgate-size: 1927
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:rahul.singh@arm.com,m:xen-devel@lists.xenproject.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[10];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 7C29638806D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 02.04.2026 12:45, Mykola Kvach wrote:
> +/* Xen suspend. data identifies the domain that initiated suspend. */
> +static void system_suspend(void *data)
> +{
> +    int status;
> +    unsigned long flags;
> +    struct domain *d = (struct domain *)data;
> +
> +    BUG_ON(system_state != SYS_STATE_active);
> +
> +    system_state = SYS_STATE_suspend;
> +
> +    printk("Xen suspending...\n");
> +
> +    freeze_domains();
> +    scheduler_disable();
> +
> +    status = can_system_suspend();
> +    if ( status )
> +    {
> +        system_state = SYS_STATE_resume;
> +        goto resume_scheduler;
> +    }
> +
> +    /*
> +     * Non-boot CPUs have to be disabled on suspend and enabled on resume
> +     * (hotplug-based mechanism). Disabling non-boot CPUs will lead to PSCI
> +     * CPU_OFF to be called by each non-boot CPU. Depending on the underlying
> +     * platform capabilities, this may lead to the physical powering down of
> +     * CPUs.
> +     */
> +    status = disable_nonboot_cpus();
> +    if ( status )
> +    {
> +        system_state = SYS_STATE_resume;
> +        goto resume_nonboot_cpus;
> +    }
> +
> +    time_suspend();
> +
> +    status = iommu_suspend();
> +    if ( status )
> +    {
> +        system_state = SYS_STATE_resume;
> +        goto resume_time;
> +    }

So you've frozen the system just to get ...

> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -2947,6 +2947,13 @@ static void arm_smmu_iommu_domain_teardown(struct domain *d)
>  	xfree(xen_domain);
>  }
>  
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +static int arm_smmu_suspend(void)
> +{
> +	return -ENOSYS;
> +}
> +#endif

... unconditional failure from here?

Also, ENOSYS is clearly inappropriate to use here. EOPNOTSUPP or something yet
better distinguishable, please (if this can't be dropped altogether).

Jan

