Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGsrB0oTimlrGAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 18:03:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8310D112D38
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 18:03:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225932.1532549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUez-0002Kx-TW; Mon, 09 Feb 2026 17:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225932.1532549; Mon, 09 Feb 2026 17:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUez-0002It-Qr; Mon, 09 Feb 2026 17:02:53 +0000
Received: by outflank-mailman (input) for mailman id 1225932;
 Mon, 09 Feb 2026 17:02:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpUez-0002In-32
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 17:02:53 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b37ddca-05d9-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 18:02:51 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso28621155e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 09:02:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5e0ed5sm1747805e9.5.2026.02.09.09.02.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 09:02:50 -0800 (PST)
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
X-Inumbo-ID: 2b37ddca-05d9-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770656571; x=1771261371; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P6c9fUbkxft9yNZeozSNHrFJI7c/+k2HI4137NH/B9o=;
        b=Lv8uMK7VrFFYI/gw3cSowgezLAeBEptoQHKAFUam4sjmYr6GyoDxZPY65x4Ra2THLD
         NMdra5/4SSn14NsJxxk275ZTIY7lI7cGavCNhV6B4NhQ5h6CFQ8yyIA2SoVoY/wNigy9
         h6keNgAHEQiX2SGrZyiyhfMl3+cWRMQnCGClNzl9tj/fcNvukPlbxRfMLyM4nzsPp4Dv
         OCrSAjMeQXft+Mo8oAM5/8H1HMtgRbg15EOdhedvGCD2FFXjY4x4Y5eBh97wy0nJIcmL
         b2ETx2rEoZbVoCM15OlQC5uCN3O2BEkx/CgNM8J7reiCBO6SUsgPqozm8rNSeHI1LMI6
         /AEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770656571; x=1771261371;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6c9fUbkxft9yNZeozSNHrFJI7c/+k2HI4137NH/B9o=;
        b=u/unoaRxmoWY9kABOSvH1V+KlbMcW3kLU8QJGUjuJmepOcHSsfSKpa24sgGKNxcpjT
         EANVw8lRiqpQT/vfhIDVwzu/L+NLjDrDYfAOHjkDytyvLTCSGd1kRCkKlaQBJG2cFdxq
         p5QVtrpEQx/TrnQBakWmPjsmdT0qyKdZXAPmWwgKHR1hGFB67Fa9kl+cbT8LTn9dQzQ+
         698XA9L5Wviaoq816zeHzZ+y17BOd7VErJMvFJa1s3yT8wkOqlDBLzMRv0Qm92iQpuol
         TltMSQp5lMSFna9+1Wow5yhhIfQ4YkyODhTPyU9vHsa0KhxDIL1yHhSk+7o6nKugzdKe
         mhtA==
X-Forwarded-Encrypted: i=1; AJvYcCXdodlNRbncSlMCF9YyWcgfgkzfONQy9JaNQyc2fB1xp3bJAIMA7n9gS4K8/ErN+jDOssDIv/rAFAI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRnxN9scH3bvECa3UB9LLkH898dVI3abMrifmV3CUB6k2LzlP/
	GE2zkf/Na6oJjsyagn217knOcpFBsWtk8QEo13nyjJfkhx3Ivh+qNT7X3sGHhaA99g==
X-Gm-Gg: AZuq6aKDj41h2PoiZTCDH9hFubCAYJC8Lmf0ReKCck9Nzdr0iss2D0cConwcK/aHWfC
	rLY+RSOcgkrfbnBAsFfkXkK1nNHoERPub/oVNxejFJAmRrCjejN8n7rnepQTS1CgiIJuph1JJNc
	Wf9xcOl1OEDjyBgC7B8TAUxJDhKoushSmmSIvQHYlzaGmz3AUZFEhwsOfKCFX19KxSWU0V2Oo8r
	sTpSthbFkwbMxs3NR/z8AXxLnlkjBc2xgKK0Sk9O0MHw7k3H0JCidiOzro/+MCqf71U4cEB+jLH
	RqqAxexllfaNsEkY2Pp/Lrpgg8/1m8lON3G0RpYC80KBWf48LiBAvDOdYQgD1lp/SmtDsvWuZnh
	tkS2m/ERq9D4eUQt/0Phgu8XPLUeoDGNbrfkWx55KB+ZrHERBGOSaRi/Zqsxm21ejw+NibFJOIs
	1qt3qSQhMMNIQ2a3IGjfroJPETmd/mXQayaDLj1FHi/Saguh+C2Dv8ONfuGpi9+rqQ8trNaL9WI
	zQ=
X-Received: by 2002:a05:600c:4590:b0:480:4d38:7abc with SMTP id 5b1f17b1804b1-483201e25e3mr154032015e9.11.1770656570929;
        Mon, 09 Feb 2026 09:02:50 -0800 (PST)
Message-ID: <b5c89f74-cdaf-40a7-b32b-6c54610a5d9c@suse.com>
Date: Mon, 9 Feb 2026 18:02:52 +0100
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,xen.org:email];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@xen.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 8310D112D38
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

I'm sorry, but I'm going to veto any new uses of xmalloc_bytes(). As per the
comment at the top of xvmalloc.h, the family of functions there should be used
in new code. That family deliberately doesn't include a counterpart of
xmalloc_bytes(). You're wanting a multiple of page size anyway, so perhaps it
is warranted here to actually use vmalloc() directly.

Jan

