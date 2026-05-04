Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKKNN+i0+GnDzAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 17:02:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E5A4C055F
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 17:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300042.1574605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJunm-0004ni-GQ; Mon, 04 May 2026 15:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300042.1574605; Mon, 04 May 2026 15:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJunm-0004kk-DM; Mon, 04 May 2026 15:01:42 +0000
Received: by outflank-mailman (input) for mailman id 1300042;
 Mon, 04 May 2026 15:01:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJunk-0004kc-RF
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 15:01:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJunj-00AkzT-NF
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 17:01:39 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8b4cc-5cb7-0a2a0a5109dd-0a2a450cabc6-40
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 17:01:39 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8b4d3-62f1-0a2a450c0019-d155dd33e593-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 17:01:39 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-44a5174670eso1576696f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 08:01:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a8ea7cfd2sm25079037f8f.2.2026.05.04.08.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 08:01:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1777906899; x=1778511699; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D0+U2Qlhu0zsgoOlZz7Zfm6W/943g1qXYwCKWtOa7bg=;
        b=KSs/scSX7+d7pZ5BAA7wKOS+ArJ0TJpIu5rA+PfC5hYNDGwmglI+zOWlLSCm1+K4E7
         ZYQ/7qQooj4ju3Eu8jKeCeECyicEVKaOe8B4jFHIXHfo7+G0onAnEBH/NKq43nliDUJZ
         srKSgXOzrIYgGG6dOfd+sfO4DQjJIcft6xmsF0FiPGdAnTLbf51VN+yVAGXbrJ86FqZS
         vKuP3I6lsnghYrXAaJPcugrDH2Ho9/zsIZXld7W+hgBEBrnyPMvz9jB4iPRrF2bmvtKL
         VcgTuw9z9KZcw6xwbllc1138YhqIGfwtNorwOqW1SoCvMjjJ5oFyyyCBLDB4OptIssKg
         3QLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906899; x=1778511699;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0+U2Qlhu0zsgoOlZz7Zfm6W/943g1qXYwCKWtOa7bg=;
        b=f6wUIJzDvokRm6XqDDsouXqMu385yETQ7mId6ZMqBP4krenrD1K1CC/KgubZ4YhYOx
         HznHAqSxnY17NdPW6L5YpPuJfURu8dBCZkbEen7DUNOpqT/+XbsxgFKu6B6iTmY8S2vA
         IgM9hmDOPBMviwpBRxixwjcQwMKG8/70L7YC74tckeY/vSksjFk4I3ZzpLlDuIAYxX5/
         dvtLVBng9L4AcHjZJWd3AFeMvfXlQhcXmjJCYgTE4UW9+28TGbLPqJynIzRjZDrS6Ca2
         7BpNZQ/Gm4kk0dW1PgsJh7qzE+oTCbiL4NGxZ9b2KbA1lg3S8fx6hjAEZEYdO5nGg+Xr
         n6dA==
X-Forwarded-Encrypted: i=1; AFNElJ//kQwq3WoE7vUsERnD/e88hB7IkkZYgrDAPUQOMjWZNxqN1OFXWb+BeVIZznQrHwFL/XvQ5JNoGi4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBTqxEJsBq8ZziTZ/4mZZ6gS+cHySkXXkFSk7zIaSYL5ojsUzl
	6QZ4vobssJ8FCjzciZfO5i7Fu27Pj3SbjWhqWcfCZOrYPryfrPrKSbKYOsGsRIk38Q==
X-Gm-Gg: AeBDievFRVKTReY55LJZxUPXwMyWkEQh9wG6xooNKE29Y3dTi92nVJRPdVS0j3UslXF
	J7pgtioZqLlUdyNw+HFDHPcqBZNs1SV8oREJaCzzCK7pmhrTlpuleH1VsumFiA0gJ310O8dM7ut
	39kht7noENIcLmbWYSpcrOOrKEfRm8ukH87C264L93tru+yPD7LF2luY3xK7AKVy6qtdXrJyncc
	5FXLtySVsUkva+3BNBmdXWMNn6WKpaZFf+BIgMcRwOP1imBUpy3Gle9nRJHwH3D/2Sc3h4T+MOZ
	CoTR4TGxGeC4/NymTMVhyiabY/PG8usVaGOlVv9x9v2rc2nKRalRbIZcwK3tKwDTwuV0OsdN7fr
	YZx1uIGvSwgJTEdcJ/ib+z9W4EU24lC6ISFa1rzbO2DS2J6OZY1taXI7pLqqBgFsHAsXdY8Cfkb
	cNZ9cpUzTbnAzteVVYgNBTI5yEiZ0M6pVyL7ESQgnO9IBNn9qXlJj6nCBbkgAofxYvUfg7Przqo
	huKCW6llePlvzpOwppd/pNXKQ==
X-Received: by 2002:a05:6000:1869:b0:43e:a69b:d810 with SMTP id ffacd0b85a97d-44bb6205dc0mr16361177f8f.38.1777906898702;
        Mon, 04 May 2026 08:01:38 -0700 (PDT)
Message-ID: <9d2470a7-18a3-43da-838e-85b1981ebc79@suse.com>
Date: Mon, 4 May 2026 17:01:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] hvmloader: Extend PCI BAR struct
To: Thierry Escande <thierry.escande@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Alexey Gerasimenko <x1917x@gmail.com>, xen-devel@lists.xenproject.org
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-9-thierry.escande@vates.tech>
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
In-Reply-To: <20260313163455.790692-9-thierry.escande@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1777906899-6D360CF5-14B01F25/0/0
X-purgate-type: clean
X-purgate-size: 1269
X-Rspamd-Queue-Id: 33E5A4C055F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 13.03.2026 17:35, Thierry Escande wrote:
> @@ -176,10 +177,13 @@ void pci_setup(void)
>  
>      /* Create a list of device BARs in descending order of size. */
>      struct bars {
> -        uint32_t is_64bar;
>          uint32_t devfn;
>          uint32_t bar_reg;
>          uint64_t bar_sz;
> +        uint64_t addr_mask; /* which bits of the base address can be written */
> +        uint32_t bar_data;  /* initial value - BAR flags here */

Nit: Comment style again (also elsewhere).

> @@ -278,13 +282,21 @@ void pci_setup(void)
>                  bar_reg = PCI_ROM_ADDRESS;
>  
>              bar_data = pci_readl(devfn, bar_reg);
> +
> +            is_mem = !!(((bar_data & PCI_BASE_ADDRESS_SPACE) ==
> +                       PCI_BASE_ADDRESS_SPACE_MEMORY) ||
> +                       (bar_reg == PCI_ROM_ADDRESS));

Nit: Indentation (pending open parentheses want to be reflected by extra
indenting blanks). With, as requested by Roger, is_mem switched to bool,
the !! also can go away, and with it perhaps one pair of parentheses.

(I realize pre-existing code further down has similar issues, yet when
such code is touched - and even more so when new code is added - this
wants getting right, to aid readability.)

Jan

