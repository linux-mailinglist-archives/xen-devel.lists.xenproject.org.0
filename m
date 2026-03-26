Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE69CNw5xWn/8AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 14:51:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88169336498
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 14:51:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264173.1555874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5l6l-0005kT-QS; Thu, 26 Mar 2026 13:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264173.1555874; Thu, 26 Mar 2026 13:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5l6l-0005hf-NO; Thu, 26 Mar 2026 13:50:47 +0000
Received: by outflank-mailman (input) for mailman id 1264173;
 Thu, 26 Mar 2026 13:50:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5l6k-0005hZ-Hf
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 13:50:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5l6j-0093OK-U0
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 14:50:45 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c539b3-bab6-0a2a0a5309dd-0a2a4502bc30-6
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 14:50:45 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c539b5-63bb-0a2a45020019-d1558030ac90-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 14:50:45 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-486fb439299so9500255e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 06:50:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b9192e528sm7867942f8f.1.2026.03.26.06.50.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 06:50:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1774533045; x=1775137845; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oRmIAczwzc6tHf8uMCnh9Nawk+I6B82vpZqm967EGkk=;
        b=faTpQdFTVGFyuPUNiV4a7ovm20Sv1D7pEydIAjcU03dis8b/NkmjHb/lwF9wQJdj6I
         FpRUgGo26AVq9V9pHG5K5qIB8f8OuoXGNnWc4piJ0X1eLHy40DwXR9mF9DIo9npZpEsF
         0PdJafWPO+2gqOdUBlp6cEgtzLNv1fU3zMTli7iL1hDvbkJ9+44+HZLH3Kqb741ot76W
         /5z+XzGqVLl6lPzuPgvUDkV5M8aOBCAGv3zkc2tx6hHWmwe9eoXrq3KQLUskc1QR3mrm
         ZV3ZxsPiOIhFWqnFNz8+yivrdirVkKkoTzJhKA7zC85w+IpB1S0TmkaIsBcwmMTrWQIb
         Y/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533045; x=1775137845;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRmIAczwzc6tHf8uMCnh9Nawk+I6B82vpZqm967EGkk=;
        b=rOlBtSPKXHA9yHOApm9kxhm9dMC1EIW9q0+Vi5gkNRlJdi6PXsOyEZt3mpd3v0dGwR
         Pe7XH69OWWDh2XZIFhufNDiZOoP2G3TEs2keFHYMceZWHXh/Q9ITRwKYC/qin9W961ra
         6Jc4ZaKM2S4T+2cFJvioxLfZ5ZGFQipoXxZRq1O7F4NFvtbrl7vX+Z0WmN7V3F7dNuMB
         gfg9YAepj6CJ37ImU++5cZlbdn0tlFpMHphg8Wq9IXxn4jYgvz3bNqMfug8iyxCpYPRs
         37KWCjvm2jnNPQHEtowOsJSxj3bnFvn6s97UjeuwSOHR4bx3sZYhaGVsC4Rc5SC07gGs
         zRmw==
X-Forwarded-Encrypted: i=1; AJvYcCUspGGwxuh6TPCfwJgMsIfFwGt1e8nhscfLZTkdDbXI+OPrDBfTJp9Xx/jzR6gVpeKskxjiLmPbwuo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQR7RPYlfvgRLSselF9DBpvRO4Y3NNZFNG1NDQxD4JUJGoLhK9
	sIKfTySVRglYCsmwbUx63cqXj3rRee3tIigEJ/ddeXCa0uMa7BiHFP898zNAj6izAQ==
X-Gm-Gg: ATEYQzyHtOO/URIiZwncXVPURG3C32vQj5cRwIt8xToUtA5opLTeT6vU91P6qPycHzy
	6N8eWS8DfdufeE2X+vRezuev+7XyCfAbIVBDIrMmqie2LhKFzi7WwS7jqQtN3TnqUV5dPGHJgoy
	BOrV/fj6bSf6SZeVnOQD+3ruEVLZ10a9mfPhaRFyutTssRdFJSXq6HY5RCBPebyjyRgF/VQIAaq
	kznPn8vsAKEmUEdBetFSIUR4MDhU2/sQxqcQXKNIpeXcIdGlSBAbdJvRvtoO07ZEB08LjBxRoBz
	QxcafHXxOXUnjwsLk37I09H5SwhpWNrGg0WlqbjNSX8kOK9uwcFKFovAXyB1FPpLRNgezd+1Sg8
	ZA+M2AOaiqnUmPB3rHeoh21t4nFH4/iUSiLXKKdX2d31mh+xvSoKB0MIm1jp8AGm/eB/l5zy8vx
	3ol3SSyfTVbnmbLNGtPKXcnC0OZW9QXXbQ33S1fTRFVbiiGnWexvj6GaXIzbgGCfV4H8/kEqdb9
	odefvHUtz774Yo=
X-Received: by 2002:a05:600c:1394:b0:485:3fe6:21f5 with SMTP id 5b1f17b1804b1-48715fd9fe7mr115439815e9.10.1774533045062;
        Thu, 26 Mar 2026 06:50:45 -0700 (PDT)
Message-ID: <ef4eac20-d136-4c9a-82be-72259c088537@suse.com>
Date: Thu, 26 Mar 2026 14:50:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] xen/riscv: implement get_page_from_gfn()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <ba0ea599c4ced7fca0b8f5dd66bb7ffb277f3a4f.1774281309.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ba0ea599c4ced7fca0b8f5dd66bb7ffb277f3a4f.1774281309.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1774533045-BF88DDB8-D8C17B95/0/0
X-purgate-type: clean
X-purgate-size: 1935
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.981];
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
X-Rspamd-Queue-Id: 88169336498
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23.03.2026 17:29, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -1534,3 +1534,32 @@ void p2m_handle_vmenter(void)
>       * won't be reused until need_flush is set to true.
>       */
>  }
> +
> +struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
> +                                    p2m_type_t *t, p2m_query_t q)
> +{
> +    struct page_info *page;
> +    p2m_type_t p2mt;
> +
> +    /* Special case for DOMID_XEN as it isn't "normal" domain */
> +    if ( likely(d != dom_xen) )
> +        return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);

Comments usually apply to immediately following code. When that's not
the case (as it is here), the comment either wants moving or wording
accordingly.

> +    if ( !t )
> +        t = &p2mt;
> +
> +    *t = p2m_invalid;
> +
> +    /* DOMID_XEN sees 1-1 RAM. The p2m_type is based on the type of the page */

As before - I don't think implying any kind of translation (even 1:1) is
correct for system domains.

> +    page = mfn_to_page(_mfn(gfn));

This, strictly speaking, is UB until ...

> +    if ( !mfn_valid(_mfn(gfn)) || !get_page(page, d) )

... the mfn_valid() check succeeded. Yes, Arm code has it like this, but
I can only repeat that you want to carefully inspect any code you copy.

> +        return NULL;
> +
> +    if ( page->u.inuse.type_info & PGT_writable_page )
> +        *t = p2m_ram_rw;
> +    else
> +        BUG_ON("unimplemented. p2m_ram_ro hasn't been introduced yet");
> +
> +    return page;
> +}

Finally, what doesn't become clear at all is why dom_xen needs special
casing. ISTR that when looking at the Arm code in the context of reviewing
v1, I spotted why Arm has this special case. Maybe I'm misremembering, as
now I can't spot it again / anymore. Yet whatever the reason there may not
apply at all to RISC-V.

Jan

