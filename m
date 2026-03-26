Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMnMCnEgxWnr6QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 13:02:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1230A334DEE
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 13:02:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263858.1555676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5jPv-0005RG-A4; Thu, 26 Mar 2026 12:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263858.1555676; Thu, 26 Mar 2026 12:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5jPv-0005Ok-6k; Thu, 26 Mar 2026 12:02:27 +0000
Received: by outflank-mailman (input) for mailman id 1263858;
 Thu, 26 Mar 2026 12:02:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5jPt-0005Oe-VH
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 12:02:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5jPt-009Sje-BF
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 13:02:25 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c5204d-5cb7-0a2a0a5109dd-0a2a450190d2-20
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 13:02:25 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c52051-6400-0a2a45010019-d155802db903-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 13:02:25 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-48374014a77so10828265e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 05:02:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48720914e5dsm14104275e9.22.2026.03.26.05.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 05:02:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1774526545; x=1775131345; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FeNuwUXtSTj/xR3BjqqT4rEnA7T0R1qi8aFedKcP+Ec=;
        b=UP5PlNQyPsQr4T90IFvOJj8G4aGrh+fDjqebJY1Nox2p3z+eVLyb4RBylUmw5S22Gi
         yEQT6jjA9u7M80VwZc75PIybZb++azSMtBo8qQKjtwHRlF3b+GLJ6kbjWDPGVXl4BzkB
         cpAippDgeDZSAKfMVqdSjJP+Oau9z1h5zL89NkFyxgMQvA7+2FPEfOX3HNKsKPTZ8xnw
         guUXcN90ug8BZYUn/suhAjG64xxBJYk5jTu6m5YTvSbL5TU1vJJmGOrT2lcOneQ/XnpA
         tGFZhfMyQ9MKL8cB/0hDrz9uaHqfAFPbHbH7gDFvtpr83ksXM8+RocnFQocxpgHtLUOS
         VmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774526545; x=1775131345;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeNuwUXtSTj/xR3BjqqT4rEnA7T0R1qi8aFedKcP+Ec=;
        b=IVCXjAgfSniMfRgBE/Ap8v06eZ6QoYRHg+phK7BYR/RfsQ7380Baz9t2LdhjKhM/4b
         gI+aW1XKWZa9S8U8FsrZARQoktQzvALwyfG4BfZLK+bnSEgWfd1cZDWNLhAVVEkmsx8K
         gyyvfVza/xZJVEHT8M6xUTYMDGv+eIkolIVFD/Zm5J34eBSAe376tvx42o3s1siDpRSV
         SwZOv4bXopH+YQJn2L3imGSvjpT9EMOpQQSc0VKoYbzNJ1ZMZNb23T/I+LmaaZWfvyXh
         toWI0+TsIfSwAZJeTiM/WLLDUD69ZaLqjlR4H0ck+y6esD1WJg3sRQFwgOtIqRBXp6Bn
         wb9w==
X-Forwarded-Encrypted: i=1; AJvYcCXrKDhCkcs2JJYchURVeRUV6vNBQoEFnBNisIilDlEqMYyPA2SqtYLT3QmZeZttW3/yrMtYSUm4Uj4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyT8jzdEVePdSkZh9IB8+JKFk89FAJC1DlNbYHdQKc80n+6/nvP
	7tTqG6oSIUCCRZOaMoX1j0v+m7ShOT0zEFcTWB4uwGHC5TJXgCWXB3E7+pIU4iOGpA==
X-Gm-Gg: ATEYQzxLahKw8fqhgWNnHrdTyqlW4FYwUSieEJOFtOHWpmiShwPC+EHBEcY+4SRMDbS
	pBqCAv9sU3LPX78upQmMSM+1HZ4dEWeiYgCg3qo0P4NIgfIxNF+R+nyWEU9VF2tc1hgXxtdlEaF
	oTx+je9OwKkoTJT8FiQRuE0hw/AfB66OUNiNKDC7Gp4E0/A+sbEvwZjA/yKTa5jONsqHDKLCt+h
	LnUxFUwIcGu2rmTa7cj7V4Bz/Grpbeg9ZotMFbjG4/EF6liwnwgeI24AiwSdtmenjJb8K0Fzeax
	cPLBViOBdLZJruYJnr2gXlFSYPBNL598quJWUfyMPAccZjseDqBFy5TV6Gdx2EhJyY4lnlnxZQo
	ezRuIUs0IFxMcIePcnzNtCOErXnUCFBu+oinK9yZFVQpH47MCFw+7KGFMUzh1B9r+RZ7f/5Uk0C
	sXGKN15+q9f3k01jYD+IceP4euyoWRzsmkC7n0J/1lWUrYMgw+5DCFvYY0v4JQwq7eCQd1CCKwo
	D3tmjPM9v4An+I=
X-Received: by 2002:a05:600c:8106:b0:485:3f58:d84 with SMTP id 5b1f17b1804b1-487160b496emr112629615e9.32.1774526544523;
        Thu, 26 Mar 2026 05:02:24 -0700 (PDT)
Message-ID: <2a00a1d2-7017-4c76-8344-018eb3f30f50@suse.com>
Date: Thu, 26 Mar 2026 13:02:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] xen/uart: be more careful with changes to the PCI
 command register
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260325145824.31601-1-roger.pau@citrix.com>
 <20260325145824.31601-2-roger.pau@citrix.com>
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
In-Reply-To: <20260325145824.31601-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1774526545-8FAECDF3-8C8D1798/0/0
X-purgate-type: clean
X-purgate-size: 2412
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1230A334DEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 15:58, Roger Pau Monne wrote:
> Read the existing PCI command register and only add the required bits to
> it, as to avoid clearing bits that might be possibly set by the firmware
> already.
> 
> This fixes serial output when booting with `com1=device=amt` on a system
> using an "Alder Lake AMT SOL Redirection" PCI device (Vendor ID 0x8086 and
> Device ID 0x51e3).  That device has both IO and memory decoding enabled by
> the firmware, and disabling memory decoding causes the serial to stop
> working (even when the serial register BAR is in the IO space).
> 
> Fixes: f2ff5d6628b3 ("ns16550: enable PCI serial card usage")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

I'm not convinced Fixes: is appropriate here. There's nothing wrong with that
commit, aiui. What's bogus is the device behavior.

> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -283,11 +283,17 @@ static int cf_check ns16550_getc(struct serial_port *port, char *pc)
>  static void pci_serial_early_init(struct ns16550 *uart)
>  {
>  #ifdef NS16550_PCI
> +    uint16_t cmd = 0;
> +
> +    if ( uart->ps_bdf_enable )
> +        cmd = pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
> +                                       uart->ps_bdf[2]), PCI_COMMAND);

Why is this conditional? While fine for the use at the bottom, ...

>      if ( uart->bar && uart->io_base >= 0x10000 )
>      {
>          pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
>                                    uart->ps_bdf[2]),
> -                         PCI_COMMAND, PCI_COMMAND_MEMORY);
> +                         PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
>          return;
>      }

... it looks wrong(ish) for this path. Actually, in ns16550_init_postirq()
we use

    if ( uart->bar || uart->ps_bdf_enable )

for example. With the new conditional updated accordingly:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

> @@ -307,7 +313,7 @@ static void pci_serial_early_init(struct ns16550 *uart)
>                       uart->io_base | PCI_BASE_ADDRESS_SPACE_IO);
>      pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
>                                uart->ps_bdf[2]),
> -                     PCI_COMMAND, PCI_COMMAND_IO);
> +                     PCI_COMMAND, cmd | PCI_COMMAND_IO);
>  #endif
>  }
>  


