Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD2CLFjB+Gnh0AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 17:55:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9E44C0FD9
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 17:55:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300091.1574659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJvdB-00069w-8q; Mon, 04 May 2026 15:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300091.1574659; Mon, 04 May 2026 15:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJvdB-00067a-5d; Mon, 04 May 2026 15:54:49 +0000
Received: by outflank-mailman (input) for mailman id 1300091;
 Mon, 04 May 2026 15:54:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJvd9-00067U-Lo
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 15:54:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJvd8-009cXr-TH
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 17:54:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8c13e-2eae-0a2a0a5409dd-0a2a450bc4e2-6
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 17:54:46 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8c146-212f-0a2a450b0019-d155802ddcd9-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 17:54:46 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-48909558b3aso45771245e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 08:54:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a822c3422sm309985025e9.8.2026.05.04.08.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 08:54:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1777910086; x=1778514886; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NmvwynO5uu5Ho03hYMoe5uJgfCpVHw+QR3AFPgHKed0=;
        b=aupwdaNXSmO3CGhcz//FUh6dXQROf+Sq3qgt+jRg0EUcgDk/A3s2YjjcIxO7ib2DZk
         1oIBdK5tgUuiCbUZnl0skJxN4PPoCXkkSpAh0RqhXhgFUUj/mgE3KvIR4fctZs91zyl5
         YdcyhOq1QdR0WNaIM882RfeNack2qSYQKU7CkOlqTrAYzbS7BlJRh65xKpRkCRnAki2l
         Oy8dfOAAXZKatnX3yA915W21w8FwqHcqqGvs3dTd8iudBr0YFNoCzXMwOAvL9oo6eMp3
         WkjQysKIQ3Nv40g6yuICrx01qUw4sw56yKqBX9mBC4rBV7Q1vSHuDEYUKOryaw+xDele
         9ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777910086; x=1778514886;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmvwynO5uu5Ho03hYMoe5uJgfCpVHw+QR3AFPgHKed0=;
        b=A+g+VitkgzL5cZZ9gV3eR5ajc4ZKu3Vl39B5vzYlYypweM8QOUdeakajitF5RPwRAw
         O62nOsPYB/agXhTQZ/5SUtl4sqEhfq4HbNFpke9z5WraDH7H9jfH8Dq0RoulP+JyGi5w
         +VrQXw+VoNzy0NLK4v2YFB6e9cznT2r2TFMLBKuTKzSER61aKe+OeCMpNGNTL4fuQdsI
         bJ7qFqn+CAdcDjacHOXJdW16KPRCigPjcQYCCfzKOulxnwRrjEmIYkHtp3aKHwuS5QVB
         6vqlrKszWxafGPHUmJiUA280bYw3QfaBj8FDzFKZ6DFxfTm41CO07VCGC+cZO/2NKydh
         gUsw==
X-Forwarded-Encrypted: i=1; AFNElJ+DLTu8y0BuYzKRLJT8nCvD/k21AacI1FUur4m8YeKK28/RpA1qJ4x554+jrjpLDWZU3fau3VTIWWc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKWujrr6UGodSfULa1yxparBz8WL8V09IjcAnNvgfzMPNgQDSU
	vqrwOjuEixsytlGEcZYwWcZHVSUjGWR0xy1LKGBQMKCETmVXX/vyXE2P1lw1koCPdA==
X-Gm-Gg: AeBDieuhv0KbcCEF18MN2iABlYZ8mX4QjDAsBJlZgN8o8EmtsA9CgFf6lUWGtUays3E
	aef27T/ia73omx8FS0bdi51jDXCI7nFOkVRAjgVUEazIFAomgqVD2hcYMHAQJOmcggvl/3AtTxd
	6+qKtNhpdtXc42dS+6X+UYICaTF1XwVGHNioGhTuWeLOwhIVx19K1FKpmk5HtH9UGGu+rEunAAC
	mu4hWpfRE+jjLav1TpdYfUN7Iftd4UsPw9LZ7Zkt0h2r59iF3d/lt7pXFCh245ExJDDlDK/uLSo
	hMauhaLcMicQ/aTNL0HlU8rK5hOu527BOHsLubu+EI9XMHue04Pxt6iW8d8xqb0/CtaQQjU6uIP
	JVbPLSUxt+h0MHD+QbqJyGWQdwCmUWrkZ9FE9gbXlsYwajm4v0vZIbGa09TM/BAY1skfUhnNe64
	LJJkHjwNFQTHSLq4I3bFuwsAxa2PlJoZqosoa/CZmixUFeSyz910/dR7gnhpVyPceJ5MBhSROMj
	O5oS7T5tqixA3Kt8jEUc7hFdA==
X-Received: by 2002:a05:600c:a411:b0:488:b14f:b8ed with SMTP id 5b1f17b1804b1-48a980fc5d0mr122491545e9.0.1777910086231;
        Mon, 04 May 2026 08:54:46 -0700 (PDT)
Message-ID: <139ab590-27d1-4ffa-b95d-2f6be15aa3f1@suse.com>
Date: Mon, 4 May 2026 17:54:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/7] common: Introduce needs_tlb_flush vcpu field
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1776259594.git.teddy.astie@vates.tech>
 <76d570a1b444a0bf2308389d9ed8bef8878b0c96.1776259594.git.teddy.astie@vates.tech>
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
In-Reply-To: <76d570a1b444a0bf2308389d9ed8bef8878b0c96.1776259594.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1777910086-07979F3B-BC976202/0/0
X-purgate-type: clean
X-purgate-size: 1562
X-Rspamd-Queue-Id: 1E9E44C0FD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 15.04.2026 15:32, Teddy Astie wrote:
> This field is meant to be used to schedule a TLB flush on the vCPU
> before waking it up. This field can be set from another vCPU at any
> time.
> 
> Schedule a TLB flush when the vCPU is migrated to another CPU.
> This is needed as the vCPU-related TLB entries may be out of sync
> with what happened on another core.

While not an issue with ...

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1188,7 +1188,12 @@ static void sched_unit_migrate_finish(struct sched_unit *unit)
>  
>      /* Wake on new CPU. */
>      for_each_sched_unit_vcpu ( unit, v )
> +    {
> +        if ( old_cpu != new_cpu )
> +            /* Migrating to another CPU needs TLB flush */
> +            v->needs_tlb_flush = true;

... this setting of the flag, for almost any other place (which apparently
the next patch is going to introduce, judging by its title) the immediate
question is: What if the vCPU is presently running? The flag is meant to
only take effect on migration to another pCPU. IOW the overall purpose
doesn't become quite clear.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -224,6 +224,8 @@ struct vcpu
>      bool             defer_shutdown;
>      /* VCPU is paused following shutdown request (d->is_shutting_down)? */
>      bool             paused_for_shutdown;
> +    /* VCPU needs its TLB flushed before waking. */
> +    bool             needs_tlb_flush;

If only x86 is going to use the field, why is it being put here?

Jan

