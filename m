Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCovLqyu+Gn2xgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 16:35:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C884BFBB4
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 16:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299976.1574533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJuNX-0005AH-Qr; Mon, 04 May 2026 14:34:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299976.1574533; Mon, 04 May 2026 14:34:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJuNX-00058Q-NS; Mon, 04 May 2026 14:34:35 +0000
Received: by outflank-mailman (input) for mailman id 1299976;
 Mon, 04 May 2026 14:34:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJuNW-00058K-N4
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:34:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJuNU-009MVJ-IC
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 16:34:32 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8ae67-bab6-0a2a0a5309dd-0a2a450687f4-32
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 16:34:32 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8ae78-7371-0a2a45060019-d1558031d07f-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 16:34:32 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so40207825e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:34:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a81ed69fasm392677415e9.3.2026.05.04.07.34.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 07:34:31 -0700 (PDT)
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
        d=suse.com; s=google; t=1777905272; x=1778510072; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlzH9Zj2lvjyN9VPiYFcCnJseQHPzyvLtGosuDMEynY=;
        b=L0kqsSsQ9OaV4Xo608Q72tUfKVoIEAXNYX4uqOSAs1WS5Z7PEjcen6A33YgLXhkXip
         eQBAjXMTt2lYGY7CJ7Zvop9eIRbQLPi+3bblfm+MSVMlnTUGehQifGPszuwjakBdHkfh
         jmTazxlbWTAB2cPdyauToRon/yVrEXhuVtDKUBTQI9O+ASsyqMFMlZaBgb6MsjtwjkC9
         x6sqxQF5gV8fuNKO23IebpTlzYCwzAnYESJJtcR7OFGkP5vJc0F1ME9TXstBF4DIFzcs
         Il8yEVBAbwh795B/0t/H8Ot87XDzO5/RuLtn3fXMM2GVKdSLksb28HUzjZcLgTsTXC36
         x08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777905272; x=1778510072;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlzH9Zj2lvjyN9VPiYFcCnJseQHPzyvLtGosuDMEynY=;
        b=VrgrN8/xeXKiGDgmA6iy7J7t11ZrmUqj9DddO+7EiHAAwiqO3gITPurOgqNzuvDTv+
         W7uKJnZB8TMFUnlgjocaQ2EMF7sIj7PtIJlG1eNsVnGEWzTgt7IpKVRrIffjuyvzt4Ds
         JcgjewLDS5++u/L4GkAXcktbnvJCH9skngRNanoH2MH5hWzLncRT74taQpr4iLc7zRF+
         KoD5+UCod9S1nJl6BbGcssYQSHgM60jGWqajO6OjF/YtDne2M2fblTgmtCubRNJDUuJv
         br8sWBPyJXLEz0qbOSsb3FMKs8NxzpMpMGMBbojtfqCljwVcdJvYGz0ZEDBur5rvmLV6
         k5mA==
X-Forwarded-Encrypted: i=1; AFNElJ/CmxXvQhXhGZFgm6NQX5DEqKut5W+Qjd2R174L+JllYZH2KdKxh8X8VOTDHj5nmqXBrmDDfx0iZfU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUmDUA0c1h88oPcj9brSUXhpPHNkIuAQv2tq72snrhAnHV/Oo4
	aep7+KSZ/d1SIVsshO7TEaKOE3g7O2OzPufk/FJIdQSRbpoGpS9WrLT+s2jyfKVVCA==
X-Gm-Gg: AeBDieuIbQiSwgQxbhyPl/FjaewfFNFaMXHTB1yFK178n3AkDESYcGDr6NRThDTCBix
	lptmu7owpuNK2+dhsgXDiU15M9kAffoeV26BS7H55qW9TPT6/iNdH0N/4iLlRupzaXbfP7MR7LN
	pqsIk7mxLyNz+51QAmVFR+o9ZVCujScDC+StsB2K+bJyVsr0lLZLbiGZ8P4nYp20JNBqAvTzsoo
	xaC3tkgc9Ds8oyWpYMkpQY9GvNbLhiNjYI6IB3gl0z3/eAtq4R3Ru+FWkOh4U3EGUSrkAwsxK5n
	brDj5jOg3KjUAjOTxwd0zub8WHiiBRm2J51QbNeUnlmEDSpDemODu0qjk2esgVkimQF57hjyBJw
	+DBxzDlb7Gp7NjSRBHy62UnGmGMEnAO1MUiZpS4xznb90EJETSR0iQiV0tW+dAO04qqqcKRDCct
	aVPadUoUgeN/Lb1ZcYr6cyauMntnzU3mQKaUHuBk8NN+uoEPsQUackbx6MWN/DNs8CPiDPlCO9M
	HZCCS07fqFCy1TxfC7pdiM92L7Yaq7nS2Io
X-Received: by 2002:a05:600c:5303:b0:48a:53ea:13eb with SMTP id 5b1f17b1804b1-48a9852c5c0mr180294885e9.5.1777905271874;
        Mon, 04 May 2026 07:34:31 -0700 (PDT)
Message-ID: <58d73d7e-49e8-4bcb-ad6b-ba92dbf0ce0d@suse.com>
Date: Mon, 4 May 2026 16:34:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] libacpi: Split dsdt.asl file and extract i440
 specific parts
To: Thierry Escande <thierry.escande@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-2-thierry.escande@vates.tech>
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
In-Reply-To: <20260313163455.790692-2-thierry.escande@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1777905272-53F7BD75-1D312A2C/0/0
X-purgate-type: clean
X-purgate-size: 509
X-Rspamd-Queue-Id: 27C884BFBB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
> --- a/tools/firmware/hvmloader/Makefile
> +++ b/tools/firmware/hvmloader/Makefile
> @@ -78,7 +78,7 @@ rombios.o: roms.inc
>  smbios.o: CFLAGS += -D__SMBIOS_DATE__="\"$(SMBIOS_REL_DATE)\""
>  
>  ACPI_PATH = ../../libacpi
> -DSDT_FILES += dsdt_anycpu_qemu_xen.c
> +DSDT_FILES += dsdt_i440_anycpu_qemu_xen.c

Instead of merely adding the i440 infix, could we perhaps replace the anycpu
one (which doesn't serve any purpose here anymore, afaics)?

Jan

