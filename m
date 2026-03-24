Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIGqMgKdwmm3fQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 15:17:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3989B30A087
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 15:17:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260873.1554040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w52ZJ-0003MH-0g; Tue, 24 Mar 2026 14:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260873.1554040; Tue, 24 Mar 2026 14:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w52ZI-0003JL-U2; Tue, 24 Mar 2026 14:17:16 +0000
Received: by outflank-mailman (input) for mailman id 1260873;
 Tue, 24 Mar 2026 14:17:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w52ZH-0003JA-Mx
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 14:17:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w52ZG-00DNqk-P9
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 15:17:14 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c29ce7-5cb7-0a2a0a5109dd-0a2a4508cce0-16
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 15:17:14 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c29cea-1950-0a2a45080019-d155802eac30-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 15:17:14 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-486fb439299so44917585e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 07:17:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4870f81db8esm23115115e9.8.2026.03.24.07.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 07:17:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1774361834; x=1774966634; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jjk36FmCoVluiy2HZwxxB/+cIqhyJA+nOWcfdolVM2A=;
        b=ck9sis2/2DMCSYHHNaqG1OAMy1Xl7IpylVQ1mOuACbGOW2003rQz60qhn1aYQoezg/
         yrJhtADPsktFQu0cNEjrG47F+M9oKkucNbc2Rim8/vs38nsfWFOk62antG0haJbNL/fm
         glcA4dGVpLzbD61t3HuHSiPLXXLzCxmXWO1FK/74njRe7nwJwvy6cwH21vnobY1Nqa3u
         aI4VBrI71gdML51eVeAubYZDqhQRs51//KyTHlwCj/FSRVbLHfF34qgPHhUfUCeMZrIC
         Uu7F4ZFDfrIfjiSunggzvJwQxpoRwOiULvS7jTh9iNFO7hWu/3+qxfq2PU2p7i6Xd50c
         N3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774361834; x=1774966634;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjk36FmCoVluiy2HZwxxB/+cIqhyJA+nOWcfdolVM2A=;
        b=MQPLl60JW5D8iengklGBBiwYYoTxKo0+ku3EpI6sSGbtTbi+aP/KtzGYTWy4OoYAyK
         +DvFvbGn9E1PVRWLPMxOShld5LVh98ZMUnJxKlhCM37WUl9P+erwN6nhb9tKBRqm5kob
         H9vgvvYC6wzEqLfbrkE8gFEMcyYf1/wnEOYpke2+FRFmSBGQGjyjUfCiTNj4kQPyYVJC
         8s4VvavZ9J9orQ36OnQTqL79Zw+sp4hwebjY1wvuYDbSFnoNPE1A8TTlYMlFICHlMFpA
         CVder4JXneRJd9WFe3TPHLzxXYy3og0hYdhaXA1nSh86eSYttioQdPLWkvbcSUQI2+0d
         yc+g==
X-Forwarded-Encrypted: i=1; AJvYcCXX4HH4s0UrY0BJ8MgADQ2Z0Zqk2NhKGlHwFybZJJskeu3Km5hWGHcHJoQrYl9vTaK8o9bDKKjvDRc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxnnmj8KocZan+Sy3VHgjhdzisn8RwpsIYZL3c0264SccEsZqXF
	laSCm2IWIOoWULiuMa1ZRnAb5pFvJWRfCZGPWhpnAN0JRIundRDAwqMMG75D9X4ndw==
X-Gm-Gg: ATEYQzwxbY44yrOOAUFVHsJKeNiv4wqC5StBWzqwumY40BWN+dUh7Ro1i5faDN2PgIn
	7aDW+ZdpdGoFIGNCFRIkA5idbhdezbQ+ax6Dj7VjfFD4UJudqouNCH1ezu2kqORcXqja2H2V8PO
	gdo6mm1EHYtTj0FQVBEhVzINV/QJHc2U52cSYWyf6Y3VKdxp0smCH8B6Q+V7N6AAVVJ5Qivy5E2
	wNvz0OWsnJc6FYpOrY+HpkXzxM8OtwIthFuRQCFil7TXjTNklJONvY5kVhUJ9+DMmbAllMM5QzH
	iDbea2aqZGgAqlyFivbzzoZ6eSl/yb1DrXshWOOqLKW/6dsM4NruW8w2nyaUjnlDvURSFMvYxVN
	2Xr/cnDp+ZuRkzpHiEb3Rwu1dql3KKg2WPqR1eZQYj9P/FAcw3ky3pn3hwyycpuyF0tXua2+eC0
	lgzAArubsocqu5tZsklmqlcHvvKcDpazJYTWW/jeOXsA+vMLD8L3R3TwDpU3BkuXeoowIdpdUvH
	JtLFmZdjSEc5xE=
X-Received: by 2002:a05:600c:c48f:b0:485:b6dd:5066 with SMTP id 5b1f17b1804b1-486febb6014mr232959745e9.7.1774361833899;
        Tue, 24 Mar 2026 07:17:13 -0700 (PDT)
Message-ID: <f80e15ce-3494-45b7-b434-d383f020c80d@suse.com>
Date: Tue, 24 Mar 2026 15:17:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] xen/riscv: add csr_allowed_read() helper
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773419622.git.oleksii.kurochko@gmail.com>
 <2ea34e564533accb33ccee66b4a8c7a750733ae0.1773419622.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2ea34e564533accb33ccee66b4a8c7a750733ae0.1773419622.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1774361834-E8882726-26241A44/0/0
X-purgate-type: clean
X-purgate-size: 3033
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
X-Rspamd-Queue-Id: 3989B30A087
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13.03.2026 17:44, Oleksii Kurochko wrote:
> Accessing some CSRs may trap when the corresponding extension is not
> implemented or enabled. Introduce csr_allowed_read() which attempts to
> read a CSR and relies on the exception table mechanism to safely recover
> if the access faults.
> 
> This helper allows Xen to probe CSR availability without taking a fatal
> trap and will be used for feature detection during early boot as we
> can't always rely on what is in riscv,isa string in DTS.
> 
> While touching the header, reorder the include directives to follow the
> usual Xen style.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/include/asm/csr.h | 34 +++++++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
> index 01876f828981..b9bee3d25d21 100644
> --- a/xen/arch/riscv/include/asm/csr.h
> +++ b/xen/arch/riscv/include/asm/csr.h
> @@ -6,8 +6,10 @@
>  #ifndef ASM__RISCV__CSR_H
>  #define ASM__RISCV__CSR_H
>  
> -#include <asm/asm.h>
>  #include <xen/const.h>
> +
> +#include <asm/asm.h>
> +#include <asm/extables.h>
>  #include <asm/riscv_encoding.h>
>  
>  #ifndef __ASSEMBLER__
> @@ -78,6 +80,36 @@
>                             : "memory" );                        \
>  })
>  
> +static always_inline bool csr_allowed_read(unsigned long csr,
> +                                           unsigned long *val)
> +{
> +    bool error = false;

Wrong polarity or wrong name? You set this ...

> +    /*
> +     * Use "+" as a constraint instead of "=" to ensure the compiler passes the
> +     * initial value into the asm volatile block. Otherwise, if the instruction
> +     * (at label 1) faults, the variable 'error' may contain an undefined value
> +     * instead of 0.
> +     * If reading of CSR register was failed, we don't care about val, so "="
> +     * constraint could be used in asm volatile block to not force always init.
> +     * val argument before being passed to csr_allowed_read() functions.
> +     *
> +     * This avoids the need for an additional instruction inside the asm block
> +     * to explicitly initialize 'error' to 0 before executing the potentially
> +     * faulting instruction.
> +     */
> +    asm volatile (
> +        "1: csrr %[val], %[csr]\n"
> +        "   li %[err], 1\n"

... to true in the success case.

Please can all of the commentary be dropped? You're re-stating what the compiler
doc has, and (imo) such doesn't belong here. If you want to comment on anything,
then the (again imo) less obvious need to use always_inline.

> +        "2:\n"
> +        ASM_EXTABLE(1b, 2b)
> +        : [val] "=&r" (*val), [err] "+&r" (error)

You don't clobber [err] early, so & isn't needed here.

> +        : [csr] "i" (csr)
> +        : "memory" );

The memory clobber, if you think you really need it, wants to come with
a comment.

Jan

