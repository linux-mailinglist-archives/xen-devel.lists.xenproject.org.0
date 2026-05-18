Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IUvB5kzC2qgEgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 17:43:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839B4570329
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 17:43:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312104.1582275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP07U-0001CV-7h; Mon, 18 May 2026 15:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312104.1582275; Mon, 18 May 2026 15:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP07U-0001A2-4k; Mon, 18 May 2026 15:43:04 +0000
Received: by outflank-mailman (input) for mailman id 1312104;
 Mon, 18 May 2026 15:43:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wP07S-00019v-C3
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 15:43:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP07R-009dKq-ON
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 17:43:01 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0b337b-e002-0a2a0a5209dd-0a2a450abab2-8
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:43:01 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0b3385-56b3-0a2a450a0019-d155802ac9f5-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:43:01 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so14294055e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 08:43:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe248dsm37522824f8f.30.2026.05.18.08.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 08:43:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1779118981; x=1779723781; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rhf9hUi+PrYqZ5KPKZaHt0LmySJhRBUtHslVoaCrFBM=;
        b=OmEra1M7PxCaYJ16/jU4r/Eie9qeigXFB3BdhzOZJAQh4A7j5kcyTVRZ+MdbzX2apQ
         m2CDxfjNpUrRNHAM9jb6OAfd2zNHGU5rGoau4YJXk5r9lseyA8xT/+qjvWD1t2XJcCS4
         kVtOxG5fEgDALHrB25MYCSCM/cyO1WmfNgIAQ2alxWoBPSVnupbdKi1WNmyKKdTuFSqt
         OEXVt+/N0rnuYc2o5MwK0cx6fRvVjIJ1U0TcM0zy6NomYyO19SqVugSnb4GPjUknFBUr
         sA7FXEHN6qof1ubzAdnzrHuyhNJ40OaBYmL7+sHIXDEJaVMrZS5WhNvAEzmJkJ5EQewZ
         +8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779118981; x=1779723781;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhf9hUi+PrYqZ5KPKZaHt0LmySJhRBUtHslVoaCrFBM=;
        b=TkoEK4OglQsXSsjkzZR6Hc6N68gDesTv1Ev6xrnxnZ0DGj9RClggiE+rABMIM9RoXj
         n6d5FvPCkeNLFdiqmrgQ83pGTlkKcsylsnQWHqY686LtXg3Dtw5B2Ht8t3BHTtC8R5Pw
         o5e9JjLUfrkrgdhNnQPrSwtlMU3FkAWycxj73ruT1M6PkyeQQUew3L+xxQUf40OE5LKj
         SjESW/Jq1Qhztundv83WT6wOQ2oOtO5VuLrz1FNCaNek67wTjwETKG9HHCSZMAe7nkur
         8o7Idu1Jyn9d82W+WdSphamr1ZjUYskDJSB116Aml/WNW4BJqFaVTVl+4X7T1HAv7a5K
         VkIw==
X-Forwarded-Encrypted: i=1; AFNElJ8rFPWuT+j3VGNXN4v/w60fSkXShkc6QGdd3nIg+murGcvrP9el/9JkCpvVU6g0bMYmCM2fJUQRja8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIW1EDEuvxHNkWftEgu0PbbzmfeUaBUXIJ4nIzha/TI8vWK3ps
	NSEqzpSwt+waN1MLVLVM7v3A71Wf3Po4Zsng8UGNYzYPdMcQJdG6vVAA9GSIHrlCsg==
X-Gm-Gg: Acq92OFAVEWKXEe1uV+E/HnJlgUN32fr5ZFVENEPtpxJKIQAEbiAyE1wprKSn4lVbMu
	on5qvRBMggfJRoYtM/nBNHtKSxCkwo92++QcHAKLluvttMZYsj7D4RScSAWNrPGNA7DgordpGYe
	fALF4rg3dNh1uI5arYz+hP/+vmoq/jEzYqOVIBS4IYv/rKOa7l8ncpTjPqedsUyfn+AaoIJNOny
	G8+KfNsSxXTMhtsSDvYhRoSsPEq39cPJhy2EOjRMDAOhqhKQd+lDioV34KQ71rzeAx4DAyIkkUI
	JQVvZMrAtNps0hME0qJ4KukXZyiAVeGWM8eM1DczC2xl5duD4TzT9aSzKZsrCGrlMLjvydeFkA1
	F9Di4W4T0nfUAFBaQ2pE9OCLZqCkR8N1RQBQIQ5YI8Wqpi6CYQfeBsG9LCrnb/bjwGozEkM8BjJ
	FNltUZpFvUhCYaOkronifspIgfny8+oguwJd8AZpzEzvOpkSasAsPXEy/R6/VoG9EYIFlpVjIUN
	Szqprkj7798ZsObVg6IdMcZOw==
X-Received: by 2002:a05:600c:49a7:b0:48f:e230:8caa with SMTP id 5b1f17b1804b1-48fe6898854mr146752735e9.30.1779118981193;
        Mon, 18 May 2026 08:43:01 -0700 (PDT)
Message-ID: <5c047204-09ac-49b7-b9b3-c6e1c7b7f079@suse.com>
Date: Mon, 18 May 2026 17:43:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/26] xen/riscv: implement prerequisites for
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
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <e4d6f36bcdf13e8fc12e8769dd965954c5f45b97.1778250616.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e4d6f36bcdf13e8fc12e8769dd965954c5f45b97.1778250616.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1779118981-7E78F8B7-ECB80F71/0/0
X-purgate-type: clean
X-purgate-size: 957
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:mid,suse.com:dkim];
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
X-Rspamd-Queue-Id: 839B4570329
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.05.2026 16:43, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -289,6 +289,31 @@ void sync_vcpu_execstate(struct vcpu *v)
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
> +    if ( (rc = p2m_init(d, config)) != 0)
> +        goto fail;
> +
> +    return rc;
> +
> + fail:
> +    d->is_dying = DOMDYING_dead;

domain_create() does this as well. Is it really needed here?

> +    arch_domain_destroy(d);

This continues to be a stub, i.e. upon encountering any kind of error one
would hit the BUG_ON() there.

Jan

