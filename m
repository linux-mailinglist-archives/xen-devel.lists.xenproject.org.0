Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KApKaSv+GkPzAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 16:39:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C84B4BFD44
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 16:39:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299991.1574551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJuS1-0006R1-Hv; Mon, 04 May 2026 14:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299991.1574551; Mon, 04 May 2026 14:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJuS1-0006O3-Eh; Mon, 04 May 2026 14:39:13 +0000
Received: by outflank-mailman (input) for mailman id 1299991;
 Mon, 04 May 2026 14:39:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJuS0-0006Nx-5l
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:39:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJuRz-009Nj6-9t
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 16:39:11 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8af84-bab6-0a2a0a5309dd-0a2a4504ea02-46
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 16:39:11 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8af8e-1dec-0a2a45040019-d1558029ed20-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 16:39:11 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso52215195e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:39:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8ebb3dc1sm292515695e9.14.2026.05.04.07.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 07:39:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1777905550; x=1778510350; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXjX1Lhb0v6AYepyVL7QRxIlkB7gqW18XlxJifqMb1k=;
        b=bE9C8BOWWNx6hUluWhH7edPNqlI1SnKV8pQyXMeBTthJgFf3fYeFSqIMWR/k80RNPJ
         e2yEpWtiTV3e/zgnU+vYm/KMKgZEXvNCqwlk7LZKOE9DCGZjtoIASyCeiO/7o/mbqsCU
         jRSYlmiaPLRt7HCWsisRbTLOucQiwq6arS8PxpDhJGnLfmeyxz+xcP+P8/aZCFOHv9ta
         b2Jg90PAVjwbrDt5NX3pE7Q7CcODOKKuH2O75Tn4XhjTl5LC8RRt354uoypH93UlW89N
         WlGdgR85ZtaQKXeLY4HPEz2WGPSj+SKnMxDPYOLys4esbe6UaLprR4CNg1lmSwUFrzq2
         d0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777905550; x=1778510350;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXjX1Lhb0v6AYepyVL7QRxIlkB7gqW18XlxJifqMb1k=;
        b=MqW/yknekVIKanEy33Rx8vG/3z/zsyngM1qmIiPj4CEnCOLd4I+Badgr1LuOExGjAV
         rH8mVJLtAmqLuDlOJ7purBS/KkjR8K1uP/NbCPk1sQ/dovI6B5D4x9MLF5ja5bx6vvlK
         KFyEHZXcTelNNZXkAynFoO9GB/r9NYNFPXyH2ri7qTx0FMsJIK/cuuFqx06ABKroHjXR
         MeMmNyy3+ITdlAjUm1cjMEAmfvHOO/5+zI+e3Z5XW3ldLtFI4Y1SrHmKFvI+e9HaAYtj
         symhcAZwbBC5NqIiH5Uwh473iecfePrwYdWTuoWwpnVEAdF9oEwL5QHA08PjMunA2fip
         ajZw==
X-Forwarded-Encrypted: i=1; AFNElJ/PmvXZuKF1EdcTxIKTW1/j2smUpXHxSX287YcyH1TCJcPAMuEJhMOG2D/J1XR7LZBCG8lZA/qxGyE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzd10zYbuXe7eYiQ8+BEfLZx/wrJz2bP5EyxugNs1s7kHK5Z63X
	TTk/ttVcsfAc1aTOYoU39dRQuXkZyckbSbVvPPq7g2HL5JHMhlEb57/eKougre20WA==
X-Gm-Gg: AeBDievvun6BtQw7tuaYkeikb4Nj6P7DxmNAZKoPxEaGsyRQn4wPIYilPEk+9ZjRsV5
	QYWcsx8CbA50Oeeyf0VB1NrKN+/M03AX4Qw5hXbQVYvIMkdSRMXxYfBdvbAqwJiK1XymiOBpVAn
	JGn6mYlQcjqUshDXbAE40SwqXjN2ma9Shc1IVXAitBGxV1tCuYufznuoNuXkTk+GrTGNta7vcJ9
	sssEoyCYPK3d+2jygfFSgq11SxCQ4HQpWzWqJZlbovaWFKvGl9rnGFDZk9ytmhycqPs9ap650vj
	dDNrRPU2cyhRNbZconcfFdtvaJfmCQXO1zDNGUvTa/wFX5tRGn0fI0K4zpWXQQMCfLfIDHiugHi
	dpUB+IHR0+L49hanDlQmVfUqSKKnmLLpITi2LSEa5P14smcksrkTStxxAAwLFtIqD6UHwYrBP2w
	iiBLzH/P14ZKsxwBBxAkWELFpAQkYlnEnkdHBUHO7OEgVhPC1JfpHOJJkfcyYeeQA34S/PDwP6o
	OUfmYSXU+8LMKW+uR/fEwpcQQ==
X-Received: by 2002:a05:600c:4e8e:b0:489:6c22:e081 with SMTP id 5b1f17b1804b1-48a980fc4ffmr167744885e9.0.1777905550567;
        Mon, 04 May 2026 07:39:10 -0700 (PDT)
Message-ID: <a40af68f-9aec-4dd3-ba23-dedbc6467648@suse.com>
Date: Mon, 4 May 2026 16:39:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] libacpi: new DSDT ACPI table for Q35
To: Thierry Escande <thierry.escande@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Alexey Gerasimenko <x1917x@gmail.com>, xen-devel@lists.xenproject.org
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-3-thierry.escande@vates.tech>
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
In-Reply-To: <20260313163455.790692-3-thierry.escande@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1777905551-297793FF-E87A1700/0/0
X-purgate-type: clean
X-purgate-size: 603
X-Rspamd-Queue-Id: 1C84B4BFD44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
> --- a/tools/libacpi/Makefile
> +++ b/tools/libacpi/Makefile
> @@ -11,7 +11,7 @@ endif
>  
>  MK_DSDT = $(ACPI_BUILD_DIR)/mk_dsdt
>  
> -C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_i440_anycpu_qemu_xen.c dsdt_pvh.c
> +C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_i440_anycpu_qemu_xen.c dsdt_q35_anycpu_qemu_xen.c dsdt_pvh.c

This line's now definitely getting too long. Maybe with the suggested name
change (see patch 1, to be extended to here) it would remain tolerable as
a single line. Otherwise it wants splitting.

Jan

