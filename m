Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCr8E30zDGrdZAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 11:55:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5AE57BADB
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 11:55:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312703.1582770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPHA3-0002CT-5l; Tue, 19 May 2026 09:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312703.1582770; Tue, 19 May 2026 09:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPHA3-0002AP-30; Tue, 19 May 2026 09:54:51 +0000
Received: by outflank-mailman (input) for mailman id 1312703;
 Tue, 19 May 2026 09:54:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPHA1-0002AJ-C0
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 09:54:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPHA0-00BQ55-NR
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:54:48 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c335b-5cb7-0a2a0a5109dd-0a2a4507cffc-32
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 11:54:48 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c3368-229c-0a2a45070019-d155802fb84a-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 11:54:48 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so39577045e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 02:54:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48feb00bbe4sm103156265e9.12.2026.05.19.02.54.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 02:54:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1779184488; x=1779789288; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mif5GzhT3SRTz4VX/5pttmO9kHwwZIDrTn2yshbDP/E=;
        b=bSmoFYFxuXxfVwSvkSq6TaRat1rt1DZIPnDl9oPE4az0rKngqjArjQlMbngzTdJNBa
         ANZxtwhwN0TAdAJCIo/aDpMx09yP0nGVmLTAb6f7yBMO1VKvOnxaMmzSq+/DPM1s5Ldq
         GmekUIOUtvTWSLZKhfGlwH7bAlM/eFn0tuCQZXb6h19CApaAzV6wQ35easVi5NXylsI5
         MF26qgt/IN1KRgpEBADJjz8QyLEO7CQbGIA+lubwsXqAZIs3E1VL8Y+oOKYtGj7qC5XT
         r8wLTiT9Uw3o5GBl9g+f1IEEHuWWC9lJ21ALE1ozxyQ/pb4I/2VN67ljnHD6EZpkN22m
         Hnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184488; x=1779789288;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mif5GzhT3SRTz4VX/5pttmO9kHwwZIDrTn2yshbDP/E=;
        b=UfEY6VDIA5wnM92m27RpxBrbvo4A7uO8/6X1MIfv31QhKqy172qk4egYGkHK9uutaI
         Y/HQcOhtrcABK5MHKXbyYInU3c3sDOjre7g2bvkmCyIviJcehWD+8Jc3ctmHDmRDdNcS
         7NnpE/I16eOHkDC+MqyaCl+IUebWiki3GS1ssak0v5qvYzb9ZxXmRcHKM1kltLvd8rSx
         6Po+kUrqyhGHTabPSHY96qmOc81YNDTzX0D+v7hgEcOg5bNWS2iG5HVRUdwm03wsywLm
         pE2xXqJOwXuosxhMI4dHaDXgzZpsoO6f899JKNjr8A1sB6ZlJMxRwtFAyqm3R06nkE2I
         hYIw==
X-Forwarded-Encrypted: i=1; AFNElJ/4MRd4D4OEbD5zc24moBh89oXpziX1MuRijzQtE/1yy2GELyfn+W8Q2HaXkID+K8kbvW0dCYxr5Zo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzziC9FPr4lUxiHtyf7+vLuzDH0NwBWOj/k1LQ4BQuwXO/m5qMV
	D/FnCZiLvvPbh8LxdCI5OmaW82LmDgNsWBwCRewaplAFtnP8FVrNfYCmgGbu6LgKpg==
X-Gm-Gg: Acq92OEWK79+7BMaUCYfSoyCFtvEJmHFs/6Pcvkzy4hk2tH0YtkJ68LmYFE2LHiQThh
	5xO4el832HO0bcqcwe0vOv2oluGMh9NwbpQHiB5Mh3vPwDN3aPsPFvgY4YRaU5DkSpY8PEETRsT
	qmJgvA7gIyaYU25xYJfo3ZxOlgYKr1YwDbo/SNVn9JogS/CgM/V1ELqMx801zqRTmkVbaFhKN6k
	6B8mSqkjJkpn6HaA0hZgk5shMsyECKMw1DMoFUxxXifDh9Nlb4QPX6K+L015mQBQ9D9xrrTA7Xh
	U/6pmSfH+tV/lI9QqibTZaRRz1Hj6u4553hcY8swM5ONirCtpDBbjkN8a4qWwMu9cBdGucZ44TO
	H8dJh2gyGpbVccGWQflLRrFxTVzXeVz+1aHQJj/pOM5BMuFJHHUtfzWo3DnNk8Uct1AI1ha35CT
	DAiPss2JumR5QdntGRTywdKOO78MHbXs32nPjeGJcLG6ElWajou6B9LJg8GTWkSHhUECyt/JWzN
	9xmlSr/PW2+qB4=
X-Received: by 2002:a05:600c:8b47:b0:48f:dfe3:dae3 with SMTP id 5b1f17b1804b1-48fe63223edmr319417225e9.17.1779184488113;
        Tue, 19 May 2026 02:54:48 -0700 (PDT)
Message-ID: <2005e70d-06c1-4a9c-a532-7f1a65761fd8@suse.com>
Date: Tue, 19 May 2026 11:54:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 2/7] x86/hvm: Introduce hvm_emulate_one_ctxt
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
 <20260518131404.3716969-3-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260518131404.3716969-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1779184488-21364C48-AD335BCA/0/0
X-purgate-type: clean
X-purgate-size: 1797
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BA5AE57BADB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18.05.2026 15:13, Ross Lagerwall wrote:
> This is like hvm_emulate_one_insn() but takes an existing
> hvm_emulate_ctxt as a parameter. This will be needed to merge the
> instruction emulator and VMEXIT fast paths.

I'm yet to understand why this is necessary, but I'm afraid I don't consider
the name very descriptive. Even hvm_emulate_one_insn2() or
hvm_emulate_one_insn_ex() would come closer: You don't "emulate a context".

> --- a/xen/arch/x86/hvm/io.c
> +++ b/xen/arch/x86/hvm/io.c
> @@ -53,27 +53,32 @@ void send_timeoffset_req(unsigned long timeoff)
>  bool hvm_emulate_one_insn(hvm_emulate_validate_t *validate, const char *descr)
>  {
>      struct hvm_emulate_ctxt ctxt;
> -    int rc;
>  
>      hvm_emulate_init_once(&ctxt, validate, descr, guest_cpu_user_regs());
> +    return hvm_emulate_one_ctxt(&ctxt);
> +}
>  
> -    switch ( rc = hvm_emulate_one(&ctxt, VIO_no_completion) )
> +bool hvm_emulate_one_ctxt(struct hvm_emulate_ctxt *ctxt)
> +{
> +    int rc = hvm_emulate_one(ctxt, VIO_no_completion);
> +
> +    switch ( rc )
>      {
>      case X86EMUL_UNHANDLEABLE:
> -        hvm_dump_emulation_state(XENLOG_G_WARNING, ctxt.descr, &ctxt, rc);
> +        hvm_dump_emulation_state(XENLOG_G_WARNING, ctxt->descr, ctxt, rc);
>          return false;
>  
>      case X86EMUL_UNRECOGNIZED:
> -        hvm_dump_emulation_state(XENLOG_G_WARNING, ctxt.descr, &ctxt, rc);
> +        hvm_dump_emulation_state(XENLOG_G_WARNING, ctxt->descr, ctxt, rc);
>          hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
>          break;

These two lines were already touched by patch 1. Afaict leaving the change out
there will be fine, and hence will be overall less churn (plus following the
lines' histories will be one step shorter).

Jan

