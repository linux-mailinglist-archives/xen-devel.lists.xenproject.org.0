Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG1XMCzA+Gnh0AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 17:50:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F424C0E06
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 17:50:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300082.1574650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJvYF-0004eF-OM; Mon, 04 May 2026 15:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300082.1574650; Mon, 04 May 2026 15:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJvYF-0004bH-LM; Mon, 04 May 2026 15:49:43 +0000
Received: by outflank-mailman (input) for mailman id 1300082;
 Mon, 04 May 2026 15:49:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJvYD-0004bB-KJ
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 15:49:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJvYA-000Vuo-K5
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 17:49:40 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8c013-5cb7-0a2a0a5109dd-0a2a450ca604-8
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 17:49:40 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8c013-62f1-0a2a450c0019-d155802ab8cf-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 17:49:39 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so48079985e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 08:49:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8eba8487sm277308085e9.11.2026.05.04.08.49.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 08:49:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1777909779; x=1778514579; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YkXvSUoW7PbksZ3ZDl8pofh44Ds7A3iK1SJHGng/AIg=;
        b=fTeYWb376fwDrBuX53y1NUvYkJNf7PlBArfFOnoTry3yOEXN4CzwaeaRHQnAUFTnco
         laVqWOXsR+ovTHjwG7i2YaWYpOfNkJzhn/oZ0ph1I1/E6lqCOvTtE7QTeCk6tuzA5ZO7
         WZ7TXL5J+vcOXJCPF7oIjaE/W5CGDGrNsXiSqTxbxeKZjnqmFXaOhPYF5ySKmzkiyMGF
         xXHhtBctTs/RG73n0PtbeRFhru3cLwWc/1HdH0ka7aW49VODNWHNQWEkRt6Px6q425gj
         p5hqu1lWOvkHOdJkN7+/l5OGZz2tMiXlzbTwVPDuY9cftIXPY4MvJqNoi189VduGIHXF
         qtsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777909779; x=1778514579;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkXvSUoW7PbksZ3ZDl8pofh44Ds7A3iK1SJHGng/AIg=;
        b=AJt7+R/FL/B9dOMZyihsU+mx/qInx/d0ZGSjdOmKit0O/HXLoIskUgOoObJHoRYbKp
         UzGE5PjZYUNXw3X3ZtS+bFs0AHD8K5emm7pvII1a5Nc2+uFErck4j4xJ2ME1mSS0osJC
         +lkAruGQlTfml/1G8B7D64m8qh31TCmT4Lf4YpuxTOm6Eo7MY6Um8n9gwAoPRE/3wZjh
         B/8ZT7xJtg1zvqH4WKjUgKK3U3z6QOGMPWrP/QheVocjI308WCpE+wqBahMX1TBebiqR
         ywrnSZz7CREUXYqOuEINmzuk9K+VuOR+jxS1lwTDqz1lb2arWyQyhefNaQB7VR6liE9R
         TlYA==
X-Forwarded-Encrypted: i=1; AFNElJ9UVvsndoJsn/tfZtuch/JFM0eq2NULHp9dniMkFgYkAGngOADSsOjlK4PZPelGPBjIpg7pL9FSJQs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSe/GsdQBp1KKwqglnGNC9Mz6oTju2FTM6n4Xqb6/Qp/CVmHNG
	co98CLqbR/CZx9dBhVP4vd1zZ+amIRrTfxmYYtGIO2+Xi5awmsvJK99uttCN6L/BjA==
X-Gm-Gg: AeBDiev9iWdzD/pLPZuIeEE6+bavnNTx4J03Yilusy1n6TNulSE+hmqO7yhXbGBRCe0
	9JGR7z8wFX6n3FH4/I+IdvokmBuhcY9JfnxGZPRNX6FlQG5As3Nc5jU6ZEZ0c+n/vr/WTlIxHSS
	SL/y34dIsm6ZAB5tioHaVRcP7VM6YsxeJFxgqSOzi9sF9auJHHBo2Zt0ZzpzDkYuOD7LP/jodsp
	3GFzpu0gpcw/jD9A+sExUr2SA978ZbE7Gne1ibTrbZTTjhHJ7vvt8/BP333s5Bh1RjpMrrJ1YJw
	Qeow3PWY26XSHsuT7WgL9m4JccI1P3BCM3td99NE9t3ckVzdXyarNlaCLyoA2xweAFIcXU2C6ub
	Zdr/5ijzW74ZbtwNp/7k0wFDKAx08X+rgVcccKbcU/ViB27Wc80GFGXOsv9KzuzevEq/VlQWtDH
	eUw7910E7O1L9BVBgGmFYMJUt1fLIEmavvuHma6wYnygjIR14GnS6fShRWWFImHloTbHvPhhkj7
	PxOE1KjX1ypo6wsmATxLPGlxw==
X-Received: by 2002:a05:600c:828a:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-48a98638119mr169182825e9.9.1777909779294;
        Mon, 04 May 2026 08:49:39 -0700 (PDT)
Message-ID: <a191bebd-aa7a-46e4-b3f2-a7a93c389480@suse.com>
Date: Mon, 4 May 2026 17:49:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/7] common: Track latest pCPU that ran the vCPU
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1776259594.git.teddy.astie@vates.tech>
 <f127344e083d224d2203b83c701375ca15e6368b.1776259594.git.teddy.astie@vates.tech>
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
In-Reply-To: <f127344e083d224d2203b83c701375ca15e6368b.1776259594.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1777909779-6C567CF5-B1E9A1A7/0/0
X-purgate-type: clean
X-purgate-size: 1521
X-Rspamd-Queue-Id: 17F424C0E06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 15.04.2026 15:32, Teddy Astie wrote:
> Track on which pCPU each vCPU of a domain ran. This will
> be used to know whether a TLB flush is required or not
> when the vCPU is migrated on another pCPU.

Somewhat related tracking already exists - see the dirty_cpumask field.
But what title and description say doesn't match ...

> @@ -977,6 +978,8 @@ void asmlinkage svm_vmenter_helper(void)
>  
>      svm_sync_vmcb(curr, vmcb_needs_vmsave);
>  
> +    curr->domain->latest_vcpu[cpu] = curr->vcpu_id;

... the implementation anyway: You track which vCPU last ran on a given
pCPU. Since the same pCPU may have run multiple vCPU-s which then weren't
scheduled again, you lose data afaict.

> @@ -992,6 +993,13 @@ struct domain *domain_create(domid_t domid,
>      if ( !zalloc_cpumask_var(&d->dirty_cpumask) )
>          goto fail;
>  
> +    err = -ENOMEM;
> +    d->latest_vcpu = xmalloc_array(int, nr_cpu_ids);

xvmalloc_array() please, as this can be huge. It possibly being huge is
also of concern.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -567,6 +567,10 @@ struct domain
>      /* Bitmask of CPUs which are holding onto this domain's state. */
>      cpumask_var_t    dirty_cpumask;
>  
> +    /* Mapping of the latest vCPU that ran on a specific CPU
> +     * (-1 if the vCPU hasn't ran yet) */
> +    int *latest_vcpu;

Why plain int? You don't really leverage -1 as a sentinel, and any
unsigned value >= nr_cpu_ids would do in its stead.

Jan

