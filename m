Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CSoOqKy+Gl2zAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 16:52:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E4C4C01D0
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 16:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300024.1574586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJueU-0002Ml-C3; Mon, 04 May 2026 14:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300024.1574586; Mon, 04 May 2026 14:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJueU-0002Ka-9G; Mon, 04 May 2026 14:52:06 +0000
Received: by outflank-mailman (input) for mailman id 1300024;
 Mon, 04 May 2026 14:52:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJueT-0002KU-4r
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:52:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJueS-00Aind-Dh
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 16:52:04 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8b287-bab6-0a2a0a5309dd-0a2a4505d8f2-24
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 16:52:04 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8b293-aaa8-0a2a45050019-d1558033c125-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 16:52:03 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso33434635e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:52:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8fea68b4sm82333865e9.9.2026.05.04.07.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 07:52:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1777906323; x=1778511123; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1m3jlV9rqWsjSfAK0KgGGIc/ay1iVJIguL20ysXzZac=;
        b=Fnf9hIY0GtEklS6hlAySWKESSACwieq0gz+Z7eo1BZMhVaQaYO3C9RmRWD261H1BMC
         M0Dy1Z11Nsp17utiLjG7Q7hNqtZffQXXLHnIAYv8agm4t0FOQ/7IT5uLFy52uFCFI9H7
         zJNuBkp7sNUkXXdDjXDBYQfZEXpIvKQG6537KdE5FCZsoPgrKjiM0pkUS/p5OCfTFiuV
         PXBJf5B2cKQZS5nXwtFq80i9fuqnIMbPVH6p7ikPkgcE3huACS5SeYVZPRkyrreTFMSZ
         hLz5i92rb195zaEDd/ybH2G0YhMtUzT2xYqSMxNegTjer3Xila2+Ung4Icj4eg7I8v1J
         2q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906323; x=1778511123;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1m3jlV9rqWsjSfAK0KgGGIc/ay1iVJIguL20ysXzZac=;
        b=RZljZZe1QjVkJnyI9wWHLq1wtXeBFRS5eqHI/iN6Cb0QIV5RrW9l/+Bf8tPbapuFNJ
         cT4VtUL+6doa7zfkxkxTm9DHaH6CLnaXJ2SHIteEsKDqzPiBsaLE8q0DQxmxH8qNikq5
         zpVwDH06owpTYHFIqktDWyRKI+EhAj69seVW6NROAJMPAeoe9icGT7LEpXXzGfVMDnCO
         LbRKzArsQggGl+9mq8H4P3yGed0nps41ds7t+nfqdnvid2S0UvbOQFFJ+zz+ZWAJWxLQ
         Zg9r1qU1kNTbW1/mk+Ru1j0yCj0u9PCw4svrIBxi+ZF0wnUm/nJ3VMiC+4eOHPFHtNr/
         Aw4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+NuYVWut1zcPu44RoSxuMpCINBuKrKxNdAMfQTusJqnErHOjvhIXxaZ/lyOrvibmWW2xUuHbEux54=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyF3AZSXzicancqxDiN2JMxbbDM85x8Lfu5dyrk1SO13xWm3ivV
	YT5dEIgqPZvuaXVV/GO55TTErr09IVBfaM5Xg9/omuXNpTzIc2YrC7/BEE3YS+Y/xQ==
X-Gm-Gg: AeBDiesnIoxliXYUL9yCn6q9b0wfbCgPI80GMT8uecZgWv9cea/FrnR4BzLCuQMbyYi
	GcoEMhv6pGn/S1eZlZWvJAB94kXBRiq/0fIqO2as7JP/ehnpWdtrEFtCsVQWpDaGHsO586jtbZu
	psVd0BlGZCoBgFCglKs6Ia8DL/5YmOMHFdgmcvkqzA43RCc4Jg7wOyKbb0FBJQ8HaWmvchA1UUl
	frxFcxknfZlkiF8en3SGSt3BKWbZD1w4HpoT8kahS/QfKA2xTJZKQUYShykqvnTD31n3sUcNaBZ
	SD1s82g5AjE2vA37/9Ecm+LNx4+81y5XOyjz0EJgB7CzR6v9fe4lpTkG5muK841rOlmc1Ssf8et
	QvLP2feFYvNKId3JhjU60f047whvLaay2HepJ8zg6fA+7BOmyjLQryremCOP3STL5y4WFxFrHQF
	5nZEtjP4G/8Gs5v2RMi/mLgoHtWN5VFarK9AZ6wTfLDRVqT25UxmmXL6XEtR9uqee1cuj3gNWN+
	oRgPdj7EWtS2LIKvaXl327yXA==
X-Received: by 2002:a05:600c:6097:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-48a9852f571mr158496335e9.5.1777906322972;
        Mon, 04 May 2026 07:52:02 -0700 (PDT)
Message-ID: <99783d58-00b5-4f3e-9393-c713eb6f2606@suse.com>
Date: Mon, 4 May 2026 16:52:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/17] hvmloader: Move pci devices setup to a separate
 function
To: Thierry Escande <thierry.escande@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-7-thierry.escande@vates.tech>
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
In-Reply-To: <20260313163455.790692-7-thierry.escande@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1777906323-E2B68443-B36544AE/0/0
X-purgate-type: clean
X-purgate-size: 451
X-Rspamd-Queue-Id: 59E4C4C01D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 13.03.2026 17:35, Thierry Escande wrote:
>  void pci_setup(void)
>  {
>      uint8_t is_64bar, using_64bar, bar64_relocate = 0;
>      uint32_t devfn, bar_reg, cmd, bar_data, bar_data_upper;
>      uint64_t base, bar_sz, bar_sz_upper, mmio_total = 0;
> -    uint32_t vga_devfn = 256;
> +    uint8_t vga_devfn = 0xff;

This change (and the related ones elsewhere) looks bogus to me: 0xff is
a valid devfn value, whereas 256 isn't.

Jan

