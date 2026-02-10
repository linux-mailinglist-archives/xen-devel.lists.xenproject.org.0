Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPBYKwtKi2mWTwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:08:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0E711C48E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:08:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226474.1532982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vppLe-00034Y-M2; Tue, 10 Feb 2026 15:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226474.1532982; Tue, 10 Feb 2026 15:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vppLe-00032j-JG; Tue, 10 Feb 2026 15:08:18 +0000
Received: by outflank-mailman (input) for mailman id 1226474;
 Tue, 10 Feb 2026 15:08:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vppLe-00032d-1Q
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 15:08:18 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53205e91-0692-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 16:08:15 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so11170915e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 07:08:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d7e64b0sm80040255e9.11.2026.02.10.07.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 07:08:14 -0800 (PST)
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
X-Inumbo-ID: 53205e91-0692-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770736095; x=1771340895; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uqJ7H72ncEND5SnzB+zrdRm+07gCCGGs7+TXhIdV72U=;
        b=BzTVNhB5qENe74bb2h8ji/fpxyBmWFFsN9XDSeA/tt3JVyVy/eHpbZKi2lV+/IGJsd
         9wjUjGi7IPR3sTdZHRPIXykPAKHgP9N/+XY91nHlaCUxrq9aujwScd3hMiEJImVCZpbN
         rGRivx9qHdTDEQtmb2ycRlBL2+cHNjQkrItnVEVhR7CbId+hADuIopc1C9P/g1/KKbyN
         mL2zU+iJQJFcTxOTl0jzceG6lR93m7S0DgC01nPHt6G1xFBpSrfMF3E+sfIvJzz47Jyn
         dyu7HQ2dJHzZWlaKib4KdDXJL49YSbmjwCXulIHI9csmxgsw3h7Fw2IVpTOXqfaeYXU2
         YDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770736095; x=1771340895;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqJ7H72ncEND5SnzB+zrdRm+07gCCGGs7+TXhIdV72U=;
        b=JzvATfFCZ0tLUISyt9iZpdGWg6YpsQxtJG7ZHbaq8GwLplVhDx+6R63w5wvz9alT1G
         p9x8y58ZO2s1K/+gvOBgXNickll2AKciIPp6+KCC/aue9wv0Fb0i7a8cjzX4Vt7jxMw9
         6/HRQSkIyTVGGOYJL2LVtaS+PtABOA1yTCzhqMq4Rj/UH2C4UiCR6KXweqHCQ4+byvp8
         Ul/4BX8lwpKrVa6YBB7MIlO6UPKkS1gIz8vGMLs0UNVVC2tXcuH7xsm+Cw6l4sY9q3uU
         fMFQAmhP8TbQkDYtki+mU76sj8jcvQ7icjpKZf1EXL20BAgIQjlwGlDRL2ox3oJf39aE
         hxdg==
X-Forwarded-Encrypted: i=1; AJvYcCVn3RlQD038z45ZId/b/bQj1iFFv3Zj2OSFZaSKj7nCKHYOo2OAPW2AwH5/FJ4DEEngGKYpG7kFMBM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAY5yNMdhsnMz3qLcuXza902ro6GKmrpOQhus9aaRTbDFTwluZ
	nL/gB13D5VdhvmyboowV70EkeAxajUzFGproEJQANE5zxU+IjUoVLc0AK7eZzzRuiQ==
X-Gm-Gg: AZuq6aKzfRwkOTxEx0rNaJ0WqB1aHVtSGCj75GW73PfJy2exOiv9caA6xwaAt3vxcc3
	t3i+eXy3lhnu8cBHpqHc+4s57YA+qyUXF8l8WrfvAtEZuQTzLS/aMD9jSeT4/KS4DSmq+B8Ffit
	DWLIvxmFWrwPQwcF79YkUt7D9pDnKpAGgTjMdSucIxS+qKs0MD2DdQM2g/AMZqf7m0CGTgrEM2d
	Rpn5Q66zv+rNBKTYWAED+relJdRUpiF6f81YGxAryVdJibRWsEd6YUdt//F3Z5UGYxw0BboajoP
	67j4xS6uVBUaC7FgNtGOEYacKPkwD9io+KMjuqWDBNG3Dd3rOiFmXpxz9lyoMXi9vsS8BwbeEfE
	ay1m4WvNcmqofwfw9JcaW/9U8T9GWZFF17boGyAn5RACYmdqgyuyszVZfVqiTESBSdFTaabRC+w
	xYykttBEfhJTrxON4S/v02DkWhGK9qQQFBQNqUxAljWdQbsnwG6lj98vjjGoUBYPduT4RSo/igA
	Pgu7LrgldGkNSk=
X-Received: by 2002:a05:600c:6285:b0:47e:e87b:af8 with SMTP id 5b1f17b1804b1-48320231170mr228488825e9.21.1770736094968;
        Tue, 10 Feb 2026 07:08:14 -0800 (PST)
Message-ID: <869795f7-1bd8-4b4b-ae91-6876477115df@suse.com>
Date: Tue, 10 Feb 2026 16:08:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] xen/console: update conring memory allocation
To: dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20260205013606.3384798-1-dmukhin@ford.com>
 <20260205013606.3384798-6-dmukhin@ford.com>
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
In-Reply-To: <20260205013606.3384798-6-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@xen.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: ED0E711C48E
X-Rspamd-Action: no action

On 05.02.2026 02:36, dmukhin@xen.org wrote:
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -463,20 +463,34 @@ static void cf_check conring_dump_keyhandler(unsigned char key)
>  void __init console_init_ring(void)
>  {
>      char *ring;
> -    unsigned int start, size, chunk, order, memflags;
> +    unsigned int start, size, chunk;
>      unsigned long flags;
>  
>      if ( !opt_conring_size )
>          return;
>  
> -    order = get_order_from_bytes(max(opt_conring_size, conring_size));
> -    memflags = MEMF_bits(crashinfo_maxaddr_bits);
> -    while ( (ring = alloc_xenheap_pages(order, memflags)) == NULL )
> +    opt_conring_size = max(opt_conring_size, conring_size);
> +    size = ROUNDDOWN(opt_conring_size, PAGE_SIZE);
> +    if ( size != opt_conring_size )
>      {
> -        BUG_ON(order == 0);
> -        order--;
> +        opt_conring_size = size;
> +        printk(XENLOG_WARNING "Rounding down console ring size to multiple of %lu KiB.\n",
> +               PAGE_SIZE >> 10);
>      }
> -    opt_conring_size = PAGE_SIZE << order;

I've spotted this removal only while looking at patch 6: How does this
work? We require conring_size to be a power of 2, or else masking by
(conring_size - 1) isn't a valid thing to do. You even touch
CONRING_IDX_MASK() twice in this series, so you really should have
noticed.

> +    if ( opt_conring_size >= GB(2) )
> +    {
> +        opt_conring_size = GB(2);
> +        printk(XENLOG_WARNING "Limiting user-configured console ring size.\n");
> +    }
> +    else if ( opt_conring_size < _CONRING_SIZE )
> +    {
> +        opt_conring_size = _CONRING_SIZE;
> +        printk(XENLOG_WARNING "Using compile-time console ring size.\n");
> +    }
> +
> +    /* Contiguous buffer; does not need to be naturally aligned. */
> +    ring = xmalloc_bytes(opt_conring_size);
> +    BUG_ON(ring == NULL);
>  
>      nrspin_lock_irqsave(&console_lock, flags);
>  


