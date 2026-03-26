Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHm1DZAqxWnb7gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 13:46:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839143356DF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 13:46:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263972.1555728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5k60-0005nX-GJ; Thu, 26 Mar 2026 12:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263972.1555728; Thu, 26 Mar 2026 12:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5k60-0005lE-DL; Thu, 26 Mar 2026 12:45:56 +0000
Received: by outflank-mailman (input) for mailman id 1263972;
 Thu, 26 Mar 2026 12:45:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5k5y-0005l2-D1
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 12:45:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5k5x-002uI9-PI
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 13:45:53 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c52a6f-2eae-0a2a0a5409dd-0a2a450797c4-40
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 13:45:53 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c52a81-fd74-0a2a45070019-d155dd33d4d1-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 13:45:53 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43b871dd06eso539714f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 05:45:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b9192e305sm8441876f8f.8.2026.03.26.05.45.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 05:45:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1774529153; x=1775133953; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wySk8c7UhCeKQTPR7Llyf9qGhatXAtWDrr0J0PKE4cw=;
        b=MgE8iHWzY4Um8DOQlH/p3/quAhC12GFqDLJHgxcy4TOGjmvcjzZ/WejyUZE8ueNjmN
         mMzZ2JIZPmAcRPgfjDmDiwH13+dGRHBn/lKweRm9UQGRl/1QMAZLEZFeyFZAO1vE/7v9
         NfVBz5xJQoPBSDWW5GSrZCHrFntkRgoJFSiBW0pH14PjplDc3STNlkhsrl+od1rBY8lc
         7et0Y+qQhSDlEq1y0Ku12yujx8oRe9Ean8J85T/v/eI/1T5Ux5yQaxbNs+5PXWZK+ZEM
         dq6oOaQMvfowR+x2H7Co4Qm/QC4FeqU6war4V3AkcA2yNU8MwgPE8dCtuW874bYZpQ+s
         ulCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529153; x=1775133953;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wySk8c7UhCeKQTPR7Llyf9qGhatXAtWDrr0J0PKE4cw=;
        b=aNYHLBoPD1qnqXWAibrMVYPt+784L0oshEkIT8MAUh9Xnth0nV5WnYPCV4mJCIFnEL
         WBM1U3+FvNOnUfH9gV1GVf8HhFwtWdD7Zkm+DN196C9VZXdTApm54beTyE+CrGdbElP5
         HtOi76PsIZh26C5ThI6Ju2VkB8B3WcxM2XEU4L63JYxAt9Y4G1nVRSYeWBtAykjrLpXb
         9ovg0w56Ib2NPcuEBUQFsEA7zwjymMIjhUBheCcvY91URtyIR0z3Uo82zYhY2hKQrXw/
         5pAwy0qtQyvwKdgGbQOBv6WaeGqD8W+1K2cIwGO/Xm+BHDsNul+y79AXJtuDMCDshO9e
         AXkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU40C5B1ySAQoh2sqjwAk/t6QURby/+Fp7AgqMWbdXbJq+0+okImeN1nPVmLTlMgR1UB/2SrjfgIw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNe4EYb6b8TaP8kigGy+K0rTY8Hy8qLv7q/I6M21Gj53W3PpBU
	Y2D/DJi84wjsrZFPNMruwigvoB35DtOVPHtsdTwvsmnjjmBZAzG7+LFYFzlfGZfUrQ==
X-Gm-Gg: ATEYQzwiVwRS5tKNWR+4yvFeNqhF+eB6CcM3z/JrM/Xww3DdiN+wOxtND/8tLYLkLQl
	WdPZLXZNyVXW3fV4RZorIKifNHfDHRtzQdsevwarnJyBqSXbRQaPPc4KaSAV8yhMIXL1xD0H3+T
	B4Qe8SBHYNV08J6ZqOw8WJvYRhebXR1aMC+RaBLDW+uPmt7TAd5tkPfmxQPRysQY2jmsRrzsp+s
	4v5hVw7e+3Qt/RjlyUPgNE39oaQOw77ig5yC6reFxDA5q1UXSyP0Ai5SGqG1JlkgLK2i/5KN69M
	befFZQ7yxRRJYqxze7kv6rgXY6yKJq9wG0UigrVQI81Ehq+GrSk6iNCnZCSlqjVwXLQ+P1Jhxsr
	4J7RUoyn2rU4oVxPp8oFxS9KMRh4UNA0KW2aTcwpFpveAE44fifMODI3qKI8zss5IMKRtLlugWK
	sJV4IJrkb1QZeb044wlY3XGuw9C0wjN9WDxvIBK2RVYGMndERpZnokco845GEtudkLVzuTnk/Wc
	wNExaOqqCEOm5n2N/vrPprOMQ==
X-Received: by 2002:a05:6000:4381:b0:43b:4468:b114 with SMTP id ffacd0b85a97d-43b889db4b2mr10832419f8f.23.1774529152708;
        Thu, 26 Mar 2026 05:45:52 -0700 (PDT)
Message-ID: <f4db1687-2f14-44d2-85b7-bcc0339d57c5@suse.com>
Date: Thu, 26 Mar 2026 13:45:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] xen/uart: enable parsing ACPI SPCR on x86
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260325145824.31601-1-roger.pau@citrix.com>
 <20260325145824.31601-5-roger.pau@citrix.com>
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
In-Reply-To: <20260325145824.31601-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1774529153-4E4AE303-0F4C6E30/0/0
X-purgate-type: clean
X-purgate-size: 9796
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 839143356DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 15:58, Roger Pau Monne wrote:
> Introduce extra logic to allow parsing ACPI tables extra early, and use it
> to parse the ACPI SPCR table and obtain the serial configuration.
> 
> This is gated to the "acpi" device type being set in "com1" on the Xen
> command line.  Note that there can only be one serial device described in
> the SPCR, so limit it's usage to com1 exclusively for the time being.
> 
> I can't test the interrupt information parsing on my system, as the
> interrupt is set to GSI with a value of 0xff, which is outside of the range
> of GSIs available on the system.  I've also assumed that the interrupt
> being 0xff is used to signal not interrupt setup (just like the Interrupt
> Pin register on PCI headers).
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> WIP/RFC, not sure whether there's interest in attempting to pursue this
> further on x86.  So far the device I have is also exposed on the PCI bus
> aside from SPCR, so using com1=device=amt also works to detect it.
> 
> Posting it kind of early to know whether I should try to polish it for
> submission or we are happy with not having this on x86.

One concern of mine is the altering ACPI CA code. Otoh, seeing how early
you need this for SPCR, I wonder if it then couldn't also be used for the
BGRT work that's being done in parallel.

> @@ -523,3 +540,67 @@ acpi_tb_parse_root_table(acpi_physical_address rsdp_address, u8 flags)
>  
>  	return_ACPI_STATUS(AE_OK);
>  }
> +
> +acpi_status __init
> +acpi_early_get_table(const char *signature, acpi_native_uint instance,
> +                     struct acpi_table_header **out_table)
> +{
> +	static acpi_physical_address __initdata table_addr[128];
> +	static unsigned int __initdata table_count;
> +	static unsigned int __initdata table_entry_size;
> +	unsigned int i;
> +
> +	ACPI_FUNCTION_TRACE(tb_early_get_table);
> +
> +	if (!table_count) {
> +		struct acpi_table_header *table;
> +		void *table_entry;
> +		acpi_status status;
> +		acpi_physical_address rsdp_address = acpi_os_get_root_pointer();
> +
> +		if (!rsdp_address)
> +			return_ACPI_STATUS(AE_NOT_FOUND);
> +
> +		status = acpi_tb_get_root_table(rsdp_address, &table,
> +			                        &table_entry_size);
> +		if (!ACPI_SUCCESS(status))
> +			return_ACPI_STATUS(status);
> +
> +		/* Calculate the number of tables described in the root table */
> +		table_count = (table->length - sizeof(*table)) / table_entry_size;
> +
> +		if (table_count > ARRAY_SIZE(table_addr)) {
> +			table_count = 0;
> +			return_ACPI_STATUS(AE_NO_MEMORY);
> +		}

Rather than failing, limit table_count to ARRAY_SIZE()?

> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -1375,6 +1375,136 @@ static void enable_exar_enhanced_bits(const struct ns16550 *uart)
>  
>  #endif /* CONFIG_HAS_PCI */
>  
> +#ifdef CONFIG_ACPI
> +#include <acpi/acpi.h>

With xen/acpi.h included (below) this shouldn't be needed.

> +#include <acpi/actables.h>
> +
> +#include <xen/acpi.h>
> +
> +static int __init acpi_uart_config(struct ns16550 *uart, unsigned int idx)
> +{
> +    struct acpi_table_header *table;

While this can't be pointer-to-const, ...

> +    struct acpi_table_spcr *spcr;

... it looks like this can be.

> +    acpi_status status;
> +    int rc = 0;
> +
> +    /*
> +     * SPCR specifies a single port, expect it to be configured at position 0
> +     * in the uart array.
> +     */
> +    if ( idx )
> +        return -EXDEV;

While this matches what ns16550_acpi_uart_init() does / wants, I'm not sure
this is a good idea. If a system had a normal COM1 and something in SPCR,
one would need to re-define COM2 with the COM1 settings.

> +    if ( system_state <= SYS_STATE_early_boot )
> +        status = acpi_early_get_table(ACPI_SIG_SPCR, 0, &table);
> +    else
> +        status = acpi_get_table(ACPI_SIG_SPCR, 0, &table);
> +
> +    if ( ACPI_FAILURE(status) )
> +    {
> +        printk(XENLOG_ERR "Failed to find or parse ACPI SPCR table\n");
> +        return -ENODEV;
> +    }
> +
> +    spcr = container_of(table, struct acpi_table_spcr, header);
> +
> +    rc = -EDOM;
> +    if ( spcr->interface_type != ACPI_DBG2_16550_COMPATIBLE )
> +    {
> +        printk(XENLOG_ERR "Incompatible ACPI SPCR UART interface %u\n",
> +               spcr->interface_type);
> +        goto out;
> +    }
> +
> +    if ( spcr->serial_port.space_id != ACPI_ADR_SPACE_SYSTEM_MEMORY &&
> +         (IS_ENABLED(CONFIG_ARM) ||

Better !IS_ENABLED(CONFIG_X86), seeing how neither RISC-V nor PPC have
I/O ports?

> +          spcr->serial_port.space_id != ACPI_ADR_SPACE_SYSTEM_IO) )
> +    {
> +        printk(XENLOG_ERR "Incompatible ACPI SPCR UART address space %u\n",
> +               spcr->serial_port.space_id);
> +        goto out;
> +    }
> +
> +    if ( !spcr->serial_port.address )
> +    {
> +        printk(XENLOG_ERR "ACPI SPCR console redirection disabled\n");
> +        goto out;
> +    }
> +
> +    uart->io_base = spcr->serial_port.address;

Elsewhere we assume MMIO if the address is 0x10000 or above. Here we have
an ACPI_ADR_SPACE_* indicator, which I think we should take into account.
For now merely to reject values not fitting assumptions elsewhere, I guess.

> +    uart->io_size = DIV_ROUND_UP(spcr->serial_port.bit_width, BITS_PER_BYTE);
> +    uart->reg_shift = spcr->serial_port.bit_offset;
> +
> +    uart->parity = spcr->parity;
> +    uart->stop_bits = spcr->stop_bits;
> +    uart->data_bits = 8;
> +
> +    if ( uart->baud == BAUD_AUTO && spcr->baud_rate )
> +    {
> +        switch ( spcr->baud_rate )
> +        {
> +        case ACPI_SPCR_BAUD_9600:
> +            uart->baud = 9600;
> +            break;
> +
> +        case ACPI_SPCR_BAUD_19200:
> +            uart->baud = 19200;
> +            break;
> +
> +        case ACPI_SPCR_BAUD_57600:
> +            uart->baud = 57600;
> +            break;
> +
> +        case ACPI_SPCR_BAUD_115200:
> +            uart->baud = 115200;
> +            break;
> +
> +        default:
> +            printk(XENLOG_WARNING
> +                   "Ignoring invalid baud rate %u in ACPI SPCR\n",
> +                   spcr->baud_rate);

Maybe better s/invalid/unknown/?

Also, please add "break" for Misra's sake.

> +        }
> +    }
> +
> +    if ( IS_ENABLED(CONFIG_X86) )
> +    {
> +        /* Use polling mode by default. */
> +        uart->irq = 0;
> +
> +        if ( (spcr->interrupt_type & ACPI_SPCR_INTR_TYPE_IO_APIC) &&
> +             spcr->interrupt < 0xff )
> +            uart->irq = spcr->interrupt;
> +        else if ( (spcr->interrupt_type & ACPI_SPCR_INTR_TYPE_PC_AT) &&
> +                  ((spcr->pc_interrupt >=  2 && spcr->pc_interrupt <=  7) ||

Is 2 valid to use? That's the cascade in 8259-s.

> +                   (spcr->pc_interrupt >= 14 && spcr->pc_interrupt <= 15)) )
> +            uart->irq = spcr->pc_interrupt;
> +    }
> +
> +#ifdef CONFIG_ARM
> +    /* The trigger/polarity information is not available in spcr. */
> +    irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
> +    uart->irq = spcr->interrupt;
> +#endif /* CONFIG_ARM */
> +
> +#ifdef CONFIG_HAS_PCI
> +    if ( spcr->pci_device_id != 0xffff && spcr->pci_vendor_id != 0xffff )
> +    {
> +        uart->ps_bdf_enable = true;
> +        uart->pci_device = PCI_SBDF(spcr->pci_segment, spcr->pci_bus,
> +                                    spcr->pci_device, spcr->pci_function);
> +    }
> +#endif /* CONFIG_HAS_PCI */
> +
> +    rc = 0;
> +
> + out:
> +    if ( system_state <= SYS_STATE_early_boot )
> +        acpi_os_unmap_memory(&spcr, spcr->header.length);

I think you'd better unmap "table" here, and I don't think the & is correct
to use.

> @@ -1643,8 +1782,17 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
>              uart->reg_width = simple_strtoul(param_value, NULL, 0);
>              break;
>  
> -#ifdef CONFIG_HAS_PCI
>          case device:
> +#ifdef CONFIG_ACPI
> +            if ( strncmp(param_value, "acpi", 3) == 0 )
> +            {
> +                acpi_uart_config(uart, uart - ns16550_com);
> +                dev_set = true;
> +                break;
> +            }
> +            else

May I ask to drop either the "else" or the "break"? To match PCI code,
it would be the latter.

> +#endif /* CONFIG_ACPI */
> +#ifdef CONFIG_HAS_PCI
>              if ( strncmp(param_value, "pci", 3) == 0 )
>              {
>                  pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_com);
> @@ -1656,9 +1804,11 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
>                  dev_set = true;
>              }
>              else
> +#endif /* CONFIG_HAS_PCI */
>                  PARSE_ERR_RET("Unknown device type %s\n", param_value);
>              break;

I think for !ACPI && !HAS_PCI we'd better not alter behavior (i.e. that
case would still better end up at default:).

> --- a/xen/include/acpi/actbl2.h
> +++ b/xen/include/acpi/actbl2.h
> @@ -1037,6 +1037,16 @@ struct acpi_table_spcr {
>  
>  #define ACPI_SPCR_DO_NOT_DISABLE    (1)
>  
> +/* Masks for interrupt_type field above */
> +#define ACPI_SPCR_INTR_TYPE_PC_AT   0x01
> +#define ACPI_SPCR_INTR_TYPE_IO_APIC 0x02
> +
> +/* Values for the baud_rate field above */
> +#define ACPI_SPCR_BAUD_9600         3
> +#define ACPI_SPCR_BAUD_19200        4
> +#define ACPI_SPCR_BAUD_57600        5
> +#define ACPI_SPCR_BAUD_115200       7

Not your fault, but I wonder why we have SPCR here when Linux has it in
actbl3.h.

Jan

