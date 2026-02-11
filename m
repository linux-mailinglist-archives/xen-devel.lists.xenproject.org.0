Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGjBCJCXjGnhrQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 15:52:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ADE12555E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 15:51:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227748.1534178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqBYr-0000Im-E6; Wed, 11 Feb 2026 14:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227748.1534178; Wed, 11 Feb 2026 14:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqBYr-0000HK-Ah; Wed, 11 Feb 2026 14:51:25 +0000
Received: by outflank-mailman (input) for mailman id 1227748;
 Wed, 11 Feb 2026 14:51:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqBYp-0000HE-LU
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 14:51:23 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2165c84f-0759-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 15:51:22 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-436e87589e8so3145649f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 06:51:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783d310c6sm5653952f8f.2.2026.02.11.06.51.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 06:51:21 -0800 (PST)
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
X-Inumbo-ID: 2165c84f-0759-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770821481; x=1771426281; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rs1jFyCrmM241sPXkD/9ur1pKEAxpEw+pZsqx62VxIk=;
        b=aTSKDAWzLLWtcs0H0/cVelCDhVpW9x2f+mTMXHaPUdh7trYFKBeyY8jVaiL+1odkK3
         zg21IZwrfoA/DJm28QxwNISeEDCeN64WNAUbw+a96RGH5hVkPWozs17XYBlZQWq8ye0l
         Z2vxQZWqi6vXKe2OMh1JLn0w84sHSE8ZCvUMCcIugyRHeuFoxkfvEqVJDGnymbt/UwdB
         JamDFWu2V0mjM4vRiNhSKX8PySJzIEH73DBeeDjzXzi+LApqughK72UoH0pHG5eb7diO
         /zMc0HGdFlUs2D2FtHQUYNxGpKbNgnVOlAH429BWEcpKrcG0MLLrpOAwgPTPyVMbhPHH
         G0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770821481; x=1771426281;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rs1jFyCrmM241sPXkD/9ur1pKEAxpEw+pZsqx62VxIk=;
        b=SCFHwvorzeiIDa86Hyj3aXZBCmHEd3m1Tw686fic1bA60431NW29ZL4hlavOHT5cFP
         wcWol9XJBIYIAGnDVsq8p/30k9+s+LQJBvk8yOkbby9loUVdcG3vKyIkLr0x1x5c1GyH
         aLFKW/HlRj+KYW91EgASJhAgUM31/sB1u9JygIDcRGG3QpMJCMvhgY3UkXVypa7HCUDo
         s6tbg6YGbJO8DMokWxyL2d/wTe1QcO5CnuyNbX3QN85L+FSi5d2GROPQ9rfC1rI/BgeO
         y8REhjdd0AiX9mw6IYkSxvmpiA3+VI84ggQgmGm6CGO0fUM9NZvqcv80Giyqo6IMijSr
         VwfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTPvTAbVf0iM+7UtuESAq7xnJGU+Xy0/ms2ELfHZ0+TQ2Kacaqb5Js0K2re5FZhYTiFa7N34bRWuA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywph2ZKLA6QhK45UBY4CQxaHjD1AAExekiu9r/Hw4pN/FJlOyBR
	PCj+/rFjT4iNKSRgmTQhPMf/G23daW1X53ILOWCV4TPPbAT7NeCJIARbcMDGonCu6A==
X-Gm-Gg: AZuq6aIEBb/rCAYOwL8IIfSvAHRltfnP65cdTSkJlGSqGHGCW510lz+baKDXMaLDbf4
	eRHNmFcpNQlTnxKlG9ASKvQ0Nt3+4cs1EX0+1QPrutAvi8bG7G9xKg5zbGJ18IoG9ad+P5kzlXX
	YWC13NjhKK9l9u84ZUd2b0It5OpeNWXY6BlJ+5S+hvHea9nAnhCyfsAZRvQZ/fK8MSNTryhq4m3
	B7N3TvqEGABZmPioeHnC0rnDRsFUyqeIKE8i0xBaT1ecsBtfxTe+s+qm7nXqu4GSRSRBB4R6yHo
	isLIU8Fkgp1kEQsYR75m9BxaJvltnUDYHRWhJEFytQCti4g5pVdADMJ47GHHe4BfU9KP84o0Pj/
	80slbDr2iKa3B09ZpjLaHGsSTbvluwllgkMoA7xtOTTGUVjk0XV0/0Fs+ejJSYtjrj5qaO/p0T0
	HFbt9h5+9GSjNdZwmiKYnONgIcjXkecV9LogXO0m+S0anD7xPG6MGZJqCu300f7Rmsgmp/VUady
	LyroFHDn8LEoJs=
X-Received: by 2002:a05:6000:144c:b0:435:a0ca:bdce with SMTP id ffacd0b85a97d-4377a5bcd4cmr8685022f8f.63.1770821481320;
        Wed, 11 Feb 2026 06:51:21 -0800 (PST)
Message-ID: <75d70edc-b0f7-4d61-8da6-e783c57b4490@suse.com>
Date: Wed, 11 Feb 2026 15:51:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/16] xen/riscv: introduce basic vtimer infrastructure
 for guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
 <792ea928d748e9ff7bd331b8e8b0262695a062e9.1770650552.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <792ea928d748e9ff7bd331b8e8b0262695a062e9.1770650552.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 87ADE12555E
X-Rspamd-Action: no action

On 09.02.2026 17:52, Oleksii Kurochko wrote:
> @@ -105,11 +106,14 @@ int arch_vcpu_create(struct vcpu *v)
>      if ( is_idle_vcpu(v) )
>          return rc;
>  
> +    if ( (rc = vcpu_vtimer_init(v)) )
> +        goto fail;
> +
>      /*
> -     * As the vtimer and interrupt controller (IC) are not yet implemented,
> +     * As interrupt controller (IC) is not yet implemented,
>       * return an error.
>       *
> -     * TODO: Drop this once the vtimer and IC are implemented.
> +     * TODO: Drop this once IC is implemented.
>       */
>      rc = -EOPNOTSUPP;
>      goto fail;

Shouldn't you then also call vcpu_vtimer_destroy() from arch_vcpu_destroy()?

> --- /dev/null
> +++ b/xen/arch/riscv/vtimer.c
> @@ -0,0 +1,71 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/sched.h>
> +#include <xen/timer.h>
> +
> +#include <asm/vtimer.h>
> +
> +static void vtimer_expired(void *data)
> +{
> +    struct vtimer *t = data;
> +    struct vcpu *v = container_of(t, struct vcpu, arch.vtimer);
> +
> +    vcpu_set_interrupt(v, IRQ_VS_TIMER);
> +}
> +
> +int vcpu_vtimer_init(struct vcpu *v)
> +{
> +    struct vtimer *t = &v->arch.vtimer;
> +
> +    init_timer(&t->timer, vtimer_expired, t, v->processor);
> +
> +    return 0;
> +}
> +
> +void vcpu_timer_destroy(struct vcpu *v)
> +{
> +    struct vtimer *t = &v->arch.vtimer;
> +
> +    if ( t->timer.status == TIMER_STATUS_invalid )
> +        return;
> +
> +    kill_timer(&v->arch.vtimer.timer);
> +}
> +
> +void vtimer_set_timer(struct vtimer *t, const uint64_t ticks)
> +{
> +    struct vcpu *v = container_of(t, struct vcpu, arch.vtimer);
> +    s_time_t expires = ticks_to_ns(ticks - boot_clock_cycles);
> +
> +    vcpu_unset_interrupt(v, IRQ_VS_TIMER);
> +
> +    /*
> +     * According to the RISC-V sbi spec:
> +     *   If the supervisor wishes to clear the timer interrupt without
> +     *   scheduling the next timer event, it can either request a timer
> +     *   interrupt infinitely far into the future (i.e., (uint64_t)-1),
> +     *   or it can instead mask the timer interrupt by clearing sie.STIE CSR
> +     *   bit.
> +     */
> +    if ( ticks == ((uint64_t)~0) )

Btw, such a cast doesn't further need parenthesizing.

Jan

