Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEwJA6kPzmmnkgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 08:41:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6995338497A
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 08:41:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271135.1559419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Bk2-0005A9-4U; Thu, 02 Apr 2026 06:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271135.1559419; Thu, 02 Apr 2026 06:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Bk2-00057q-1b; Thu, 02 Apr 2026 06:41:22 +0000
Received: by outflank-mailman (input) for mailman id 1271135;
 Thu, 02 Apr 2026 06:41:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8Bjz-00057k-T9
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 06:41:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8Bjy-006qKl-TD
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 08:41:18 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce0f8c-bab6-0a2a0a5309dd-0a2a450389f4-10
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 08:41:18 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce0f8e-02b3-0a2a45030019-d1558033c450-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 08:41:18 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4888244e9f9so3892885e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 23:41:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2c5419sm6218262f8f.11.2026.04.01.23.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 23:41:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1775112078; x=1775716878; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uoSZwaA3X/0HvUMbGP9CLY6I+PK9oHLjZKdiTnymqFM=;
        b=UVhxbQeKHwUUWX/zfzCYdPT29SxdvTDMoptOZ5064E7D/fmc6bvauZeY71PrXuYpai
         UJMnRoYhXuZ5hiE3NnhZCsA73gv1/eb8xnX2LjAZVB98oYvRHrGCAKLS5Hp5JvfANHHK
         tOWdPrJyD0uadrRxRaaEFpLLMsPPpmRw5hWQtKvaggU2mpHizp8BRNm6JHS8fVeh1tg9
         Z8V5Gbh/pqv8ygcwbmg7O+ajimD3AlFzIchB7e/HUpMHTQQ0OWEFOj4Q6MEcfvGG6Ljq
         dKl0/YQLGtEyVcB3tQErLxMpzcZ/UXydns50/d+YKfC983bv8/z2eQvcsAUcvex4Sd5q
         7kAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775112078; x=1775716878;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uoSZwaA3X/0HvUMbGP9CLY6I+PK9oHLjZKdiTnymqFM=;
        b=rMAQ22mHbtGylJJXXogbeU4craGlVjKmaQX6owrhwFlexIVTUCK80EITn8QxGiNtOQ
         0rAe0oYZYdRsDhVNQiTpsV8LENIFA3gjd04T3ndE9JZwEEqjaRwk2t/sjHl3aw5ErokX
         EEXMR3WCCk/nJCKSHBNkNNPry8AnB8LkDLmsCP2M23j4YR9JE3xCUA0L5SmMCRkmKMed
         GB0bpg75M4dULjrSZgoL0+vPRwRYo7mnZ9e6hhZpVPewW4yECGX918XNcruvF5B1kFXP
         wvTx31RDmKdXv2wGtEVNnvQwbKN3VQeFtRc+ur5eG/3Ds8F33yCzCkgKCdla01tJu4EV
         i5dg==
X-Forwarded-Encrypted: i=1; AJvYcCV9WGxb0y8oOmC30N4y9pQ6/fy7H22/7GX7ocF8nq+faIU04ps9LVZZqDq6C3hFit2ZShOOFlPPTZk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymxaohPpUX00gKr6T4r9ztBdDezUOREJ7oGB+cusdhPSTHuFQN
	G0D6mbxAnnbtYgxC+B7v02UOhdO7Db88vuVygRFI8T5LkXLJWPqR1qNpZn4PHVKrMA==
X-Gm-Gg: ATEYQzyKzzKkZLijcOJdGf2RsRDuYpfGbSo5B9D7Kq67rlOR/Egd7XNleudieSFtImf
	jlcWmwRCJPgDIwvOk6k7YAA06eG5C3s9taOytL5zSWB2natrEQoB+3zqp7pMDJ63uWO3ThWgTGW
	y7xVN14yqy17/hd6sEvM5GCqALIUNpGsELuEnzHQ9ZsOAeARK9RA/pulmLv1cZ1W58Zu7PWoohj
	kOSlbs0ajJDz1fP3a9lmIIlyrmabSN2+qZgQUzBQ/pv7Cm2GEOpLFT4oHSfTfuMs3vbvhpOc2oJ
	t4fZTe5ziIFcHwKOHg+p2zpTeOakImFP3hjNuywkKI4tEh42MyoQw/LgLSs46XyWgfe4gEoi4EB
	XlgKuG6hLT5ThkVewhX/AVkVxCqkUoAjM+PeCkitdnFkfXAdN94K9o5az6SfeKYUGtNgeeUpgb6
	GnaMmp0unPZ1nmDjgPagOEwK7qEQQttQwl9s+UIP1Jo5B/9ES6ZoweAHqeJQHY+/5zyzSnL1Psh
	WI1p9gPT9gCOfjkAphdEtBHKA==
X-Received: by 2002:a05:600c:8b38:b0:487:1fbf:e0bb with SMTP id 5b1f17b1804b1-4888356a021mr112730705e9.6.1775112078127;
        Wed, 01 Apr 2026 23:41:18 -0700 (PDT)
Message-ID: <df6fb4f1-b420-4b5f-90e1-dea9069311bf@suse.com>
Date: Thu, 2 Apr 2026 08:41:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/riscv: allow Xen to use SSTC while hiding it
 from guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774863161.git.oleksii.kurochko@gmail.com>
 <ff0e2e7332d5b887d00ad10caf01952f90f5da5c.1774863161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ff0e2e7332d5b887d00ad10caf01952f90f5da5c.1774863161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1775112078-4792AC9A-747ADD21/0/0
X-purgate-type: clean
X-purgate-size: 3080
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
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
X-Rspamd-Queue-Id: 6995338497A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31.03.2026 21:04, Oleksii Kurochko wrote:
> @@ -495,6 +498,36 @@ void __init riscv_fill_hwcap(void)
>          panic("HW capabilities parsing failed: %s\n", failure_msg);
>      }
>  
> +    if ( csr_read_safe(CSR_STIMECMP, &tmp) )
> +    {
> +        printk("SSTC is detected but is supported only for Xen usage not for "
> +               "a guest\n");

Please don't wrap format strings. Them going slightly beyond 80 columns is okay.
Them going much beyond that is a good indication that you want to consider re-
wording. (Here e.g. "SSTC detected; supported for Xen use, but not for guests".)

I question though whether something like this needs logging.

> +        /*
> +         * As SSTC for guest isn't supported it is needed temprorary to:

Nit: temporary

> +         *
> +         * 1. Clear bit RISCV_ISA_EXT_sstc in riscv_isa as theoretuically it

Nit: theoretically

> +         *    could be that OpenSBI (it doesn't pass it now) or whatever ran
> +         *    before Xen will add SSTC to riscv,isa string. This bit clear
> +         *    won't allow guest to use SSTC extension as vtimer context
> +         *    switch and restore isn't ready for that.
> +         */
> +        __clear_bit(RISCV_ISA_EXT_sstc, riscv_isa);

Seeing your other series, shouldn't this instead be done without affecting
riscv_isa? The BUG_ON()s in vtimer.x therefore also look inappropriate.

> @@ -61,20 +73,7 @@ int reprogram_timer(s_time_t timeout)
>      if ( deadline <= now )
>          return 0;
>  
> -    /*
> -     * TODO: When the SSTC extension is supported, it would be preferable to
> -     *       use the supervisor timer registers directly here for better
> -     *       performance, since an SBI call and mode switch would no longer
> -     *       be required.
> -     *
> -     *       This would also reduce reliance on a specific SBI implementation.
> -     *       For example, it is not ideal to panic() if sbi_set_timer() returns
> -     *       a non-zero value. Currently it can return 0 or -ENOSUPP, and
> -     *       without SSTC we still need an implementation because only the
> -     *       M-mode timer is available, and it can only be programmed in
> -     *       M-mode.
> -     */
> -    if ( (rc = sbi_set_timer(deadline)) )
> +    if ( (rc = set_xen_timer(deadline)) )
>          panic("%s: timer wasn't set because: %d\n", __func__, rc);
>  
>      /* Enable timer interrupt */
> @@ -85,10 +84,17 @@ int reprogram_timer(s_time_t timeout)
>  
>  void __init preinit_xen_time(void)
>  {
> +    unsigned long tmp;
> +
>      if ( acpi_disabled )
>          preinit_dt_xen_time();
>      else
>          panic("%s: ACPI isn't supported\n", __func__);
>  
>      boot_clock_cycles = get_cycles();
> +
> +    if ( csr_read_safe(CSR_STIMECMP, &tmp) )
> +        set_xen_timer = sstc_set_xen_timer;
> +    else
> +        set_xen_timer = sbi_set_timer;
>  }

Doesn't all of this together eliminate the need for sbi_set_timer as a
separate global variable?

Jan

