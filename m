Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF28NBULxWma5wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 11:31:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4578233367A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 11:31:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263656.1555522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5hzm-0004jR-71; Thu, 26 Mar 2026 10:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263656.1555522; Thu, 26 Mar 2026 10:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5hzm-0004hy-3N; Thu, 26 Mar 2026 10:31:22 +0000
Received: by outflank-mailman (input) for mailman id 1263656;
 Thu, 26 Mar 2026 10:31:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5hzk-0004hs-Ox
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 10:31:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5hzi-00FuAt-EZ
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 11:31:20 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c50ae9-5cb7-0a2a0a5109dd-0a2a4505ac5c-42
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 11:31:19 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c50af7-5aeb-0a2a45050019-d155dd2ccd38-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 11:31:19 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-439b97a8a8cso767088f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 03:31:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b91943184sm6303944f8f.14.2026.03.26.03.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 03:31:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1774521079; x=1775125879; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B005jyrLeguN/Hm7h4beFlQbyyiM3uJRIwjse60dLY0=;
        b=KjvT/Qjlgm1jWk/DLrldM63bnhomGJnvPZo/PsodOYVLELxWEIYcAY/J5C9rDLnSb1
         xlw3XnevWw6m0MeMfIH4Mg7m2eRniJvl5KxRX5SqL6c+A8SCd0hRvQsmdkv8hcXbdbqj
         DrKjA1cLHMfgmRcM2Nf62SoK766RRZt2QneIoKXfVI0iiV4QwG3JkZEzcIWImmPR2V77
         n2zEpTYdlwEGZ5Fz+yFL7l25m9AG77tEztz4RPpINLo8CEC+ltcdOfgh6vm3AGxoZ1nP
         YSTC6YC+RlYSBsSavU+zs7vciUtaIR3i7ywuPShmUPxuTd3psBzjMkb9RvJciAdluwPT
         NdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774521079; x=1775125879;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B005jyrLeguN/Hm7h4beFlQbyyiM3uJRIwjse60dLY0=;
        b=Q4kWw6fcYbSjcol1HoVmXEjPBjiArzXEEMlm/6rUpGNQobjP+ENvh7Enrg9dr7MUNx
         xeIHqNvE4tSgAYcH/4o8oNwIotOT9RYVqXHTXerynGouqfkoYYeVn0EqKjqBRPhcOii2
         +pTG8s3dkAqL8P2zACW1OhsY4dVK8MHHcGEESamOXkjLnSt6HgOvkcHjfT8uqDsyc4yB
         B7mJhRIOMuuzXatlQAIVFasxlgUvd66yH3ZWTGUMKxKey2ojI2YlEarPSdhqGhInkB7Z
         uay5+9xKcNAiPSA4ww1KCt7iFCVX5qUAJdp025YSkin+yEdvJUXJ8Pze3a1HtqS97r2G
         i34w==
X-Forwarded-Encrypted: i=1; AJvYcCVy3evhkvPEwWxzG6fcq9GEMhdRTVBOvgmNHn7ppNaQsSYFBKG98U/YpCuUrWpqVnbNSbo+HIBQoHA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHUnAu+8cXPIV1somoibPhlVb1Rwet66+xD93wfg8y9rD1Vv1b
	HBbszEjAaOejibKcn9d8X3SqZhSzXneYAk/sHRaVqEbAkPQufhYS6w6Bv1mYIgL4JA==
X-Gm-Gg: ATEYQzzJDx71fzkd2H3KZz9o9Q9OzgSGKADV9xhY+H9B5+N0Kw318bVufUwrqPwjlEZ
	Zm5GwEn/IjMSAxXV+npxSIFmJOHk3Bt589f/D9IT4E+4qPdoI1zTiRqLMkPwB+kw6u3+S7C7sbL
	TMsN9JKjw3/VBqu5w4DaHAq72lntZhQ5iW1uDEi4NvhLq+i1JTpWOT/psLADROu2Ob2hz/JDCfu
	D+JZAmbbpWrr+OxLiI8M1DRxyvxuy4FFoGtqiz5NL1Vc7i1Dvs2DMfU9Y7mDk0OktD+F5Ihmv79
	EwXpfUAjkk6or0HY7+0jCokN6oONxvtnBPFA63IiRoGQCE5Fx4Bhqz7LpAj2gB7KwEJf8aYOPzw
	qfWU8a33kLa9xJD5Te6/BiRtDSeAAv/Uktc5+fX+E/dW3tsdqj+soQOLJwfLRLfcR0nJwUWMWEK
	g1DFfJ0TnBzzjaXq4M7DDLIy7dDHlI00tfBvogiTOaX4J5NWXmaxCjwlHGHmUOo5DWNdBW6yK5s
	2QBwhsW2zZ4QuY=
X-Received: by 2002:a05:6000:430e:b0:43b:7ff5:fdf7 with SMTP id ffacd0b85a97d-43b88a0561emr10988038f8f.29.1774521078914;
        Thu, 26 Mar 2026 03:31:18 -0700 (PDT)
Message-ID: <642c8ea4-61af-4235-a4e6-d518c5da1c3b@suse.com>
Date: Thu, 26 Mar 2026 11:31:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: Check supported features even for PHV dom0
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <CAHt6W4f0iSN5vqbPHTCv6dLdoxUFXivoPX8BYV+gurxxv9q66Q@mail.gmail.com>
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
In-Reply-To: <CAHt6W4f0iSN5vqbPHTCv6dLdoxUFXivoPX8BYV+gurxxv9q66Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1774521079-2169D488-57B35EFB/0/0
X-purgate-type: clean
X-purgate-size: 1522
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4578233367A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 16:55, Frediano Ziglio wrote:
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -321,6 +321,22 @@ unsigned long __init dom0_paging_pages(const
> struct domain *d,
>  }
> 
> 
> +int __init dom0_check_parms(
> +    const struct elf_dom_parms *parms, bool is_pv_shim)
> +{
> +    if ( parms->elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type !=
> XEN_ENT_NONE )
> +    {
> +        if ( !is_pv_shim && !test_bit(XENFEAT_dom0, parms->f_supported) )
> +        {
> +            printk("Kernel does not support Dom0 operation\n");
> +            return -EINVAL;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +

Nit: Rather than adding another bogus pair of blank lines, pleases leverage
the two that there by inserting between them.

> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -494,14 +494,8 @@ static int __init dom0_construct(const struct
> boot_domain *bd)
>          return -EINVAL;
>      }
> 
> -    if ( parms.elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type != XEN_ENT_NONE )
> -    {
> -        if ( !pv_shim && !test_bit(XENFEAT_dom0, parms.f_supported) )
> -        {
> -            printk("Kernel does not support Dom0 operation\n");
> -            return -EINVAL;
> -        }
> -    }
> +    if ( (rc = dom0_check_parms(&parms, pv_shim)) != 0 )
> +        goto out;

Why "goto" when it was "return" before? (This may be warranted, but if so it
needs justifying in the description.)

Jan

