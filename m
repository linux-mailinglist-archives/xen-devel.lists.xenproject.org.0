Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCLeGF8WzWmMZwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 14:58:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0F037AD72
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 14:58:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270249.1558969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7v8s-0007Ih-CI; Wed, 01 Apr 2026 12:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270249.1558969; Wed, 01 Apr 2026 12:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7v8s-0007Gk-9S; Wed, 01 Apr 2026 12:57:54 +0000
Received: by outflank-mailman (input) for mailman id 1270249;
 Wed, 01 Apr 2026 12:57:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7v8q-0007Ga-U1
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 12:57:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7v8q-001VCs-9w
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:57:52 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cd164d-e002-0a2a0a5209dd-0a2a4508865a-10
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 14:57:52 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cd1650-fab6-0a2a45080019-d155dd30ccb4-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 14:57:52 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-43cf8d550bdso3082429f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 05:57:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf21ebef9sm38004880f8f.13.2026.04.01.05.57.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 05:57:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1775048272; x=1775653072; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eC0Mb6oTeX6UxFBHxxuPt3AeFwUamDuOUF/SNXhgpno=;
        b=Pkj7uyV04Il7NRzjYuRL0JF0YW0tX17hXhMZYmH4MMonVF6mfrdOU/h8WyOduyKRvq
         NETO3HARFY2ZLWlxOvtK2+wDk2gqfuKwitLPcx7DUQJWG69GQHZ5cafIZ9UezFChdIAw
         WkdZrFqqOuJbv056cWNT8hAXeDqtSfyyr+2Co2DmOmDlZjLh+xeBMyHeydMtjYfF3/Vv
         JNruuwpspN9EOoPoHgmjqLhV7GjXYVihgD1f8CqBykBxJXycMKYyK17C3p1OT0OzWNbJ
         J4Ao/4E96lkJmD6UZoJsIpZKuDWqiHP6uGu3vOdvwCCnSRT+2A/9NQvvCm6HT+C3FL2T
         Z4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775048272; x=1775653072;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC0Mb6oTeX6UxFBHxxuPt3AeFwUamDuOUF/SNXhgpno=;
        b=CWot9LYYAdTNaWBlWh/ZzPf1a85bn4Bmw0IfTME0o70I1lRSF5zCGJkibJFQb4vjUx
         t5cTyFqB8spyoHW6qyfiy7OWgpRCAfhmaq3bOhMgSw0NvZ41G/50dlsnCdAeecIMu4yG
         e6jjQDmQA3EUMrlxRqAd0IaXPSpvCXHS2YktPb0EIDZjjqpbccjrB017tdza6ThvuSbZ
         94oU/PwMU3/280FcOeM7ixzOBCtanK5Mhz9UJTGrh+qAM/sWbkFSyXqZ6/HtFlGC77IJ
         Gg3T2O2l6v7brxaTmufeOo3x7inHAEJrjkgc6vW5S9tKQFC4Q1X/VHHfNcm0F4rqVfzz
         r2zw==
X-Forwarded-Encrypted: i=1; AJvYcCVjcoO2jbbIRN7NVSiGRjbbLN62SkRlQ8iFn/kNId8UWnTLtUqQ/FddRfG8vhPFV9VfrhIkhScDSmk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYaVNmDRi/KKlmwENW2zc1TMbZN9WAa9bF1vtM1g9O00I4DIsE
	cObzhvktY2ekiyz+EK4Emz8xywcWZRcle4ovf7+f3fINhbhrtZk/gxqXYjDAUAASsw==
X-Gm-Gg: ATEYQzyTULBiCfbDGAO8t9+TT8ZDJlGbVjEgFmnZ3UlPZBLNK3dYZJczISxtKHZLv5g
	gfuVzyB+sDmjl0LQnGBORiutPyvOnLbodnf2Dxvtk906pzqoBS+wfnr0LE2DWX/6ZOYBddYS8K9
	RayyU6+R7fcupKvCV3X3rBLftbWwjC5cqZ5GAX/CFGWT2mw4XFqVWKay294fLWy/SYl5YUp1rKB
	DG2WQt5QgiWjH/kx3Uk0/+mVIdK+kqYlOPXf942ODCNGY95DAtbGQHPjX/4QbLiitufPQNQa945
	xQA8nwPoo2jyvPBLgrgbYXD7Qe9s4LXk14HnFYIghONmGAU0CyIH0vuluHfLCFoytZ2FrQPBDNa
	mMLl22al9eFc1NiQqArFGCep7RLC8sThmop440/WjUbg7YklK3528TJCUtw1V/3CgDV9dUmmnRW
	nySwhFuuh3qsSg8dlKy1drFKvsBk8Db4Kxu0DTJGK5/kRgk2iSB4s65bgqVDD6tZmM5G5SS358y
	5konW1O9zvoTha1NGBxAxqEFQ==
X-Received: by 2002:a5d:588f:0:b0:43c:f7f6:6016 with SMTP id ffacd0b85a97d-43d150d3d2emr7240304f8f.32.1775048271615;
        Wed, 01 Apr 2026 05:57:51 -0700 (PDT)
Message-ID: <2cec4690-b23e-4057-841f-efca4348af5c@suse.com>
Date: Wed, 1 Apr 2026 14:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/27] xen/riscv: implement prerequisites for
 domain_create()
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
 <ccd6d21b224b478c88ca5f2fdd2d1dd507671510.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ccd6d21b224b478c88ca5f2fdd2d1dd507671510.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1775048272-77B44497-941A95E2/0/0
X-purgate-type: clean
X-purgate-size: 2598
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CB0F037AD72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> arch_domain_create() and arch_sanitise_domain_config() are prerequisites for
> domain_create().
> 
> arch_sanitise_domain_config() currently returns 0, as there is no specific
> work required at this stage.
> 
> arch_domain_create() performs basic initialization, such as setting up the P2M
> and initializing the domain's virtual timer.

Does it? I can spot only the former; instead there is ...

> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -288,6 +288,33 @@ void sync_vcpu_execstate(struct vcpu *v)
>      /* Nothing to do -- no lazy switching */
>  }
>  
> +int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> +{
> +    return 0;
> +}
> +
> +int arch_domain_create(struct domain *d,
> +                       struct xen_domctl_createdomain *config,
> +                       unsigned int flags)
> +{
> +    int rc = 0;
> +
> +    if ( is_idle_domain(d) )
> +        return 0;
> +
> +    if ( (rc = p2m_init(d)) != 0)
> +        goto fail;
> +
> +    d->arch.next_phandle = GUEST_PHANDLE_LAST + 1;

... this, which I can't make any sense of. I can't find matching Arm code
either, which might otherwise have helped.

> +    return rc;
> +
> + fail:
> +    d->is_dying = DOMDYING_dead;
> +    arch_domain_destroy(d);

(At least) for the use here, that other function would better also move out
of stubs.c at the same time (and no longer have unconditional BUG_ON() in it).

> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -101,14 +101,7 @@ void dump_pageframe_info(struct domain *d)
>      BUG_ON("unimplemented");
>  }
>  
> -int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> -{
> -    BUG_ON("unimplemented");
> -}
> -
> -int arch_domain_create(struct domain *d,
> -                       struct xen_domctl_createdomain *config,
> -                       unsigned int flags)
> +void vcpu_switch_to_aarch64_mode(struct vcpu *v)

What is this? Surely nothing with this name should exist under riscv/.

> --- a/xen/include/public/device_tree_defs.h
> +++ b/xen/include/public/device_tree_defs.h
> @@ -14,6 +14,7 @@
>   */
>  #define GUEST_PHANDLE_GIC (65000)
>  #define GUEST_PHANDLE_IOMMU (GUEST_PHANDLE_GIC + 1)
> +#define GUEST_PHANDLE_LAST GUEST_PHANDLE_IOMMU

This, to me, looks like a questionable addition to the public interface.
Yet I'm not a DT person, so I may simply be missing why something like
this might be wanted (and how stable it then would be, long term).

Jan

