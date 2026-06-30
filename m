Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0JgpEE5wQ2q7YQoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 09:29:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9964D6E126D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 09:29:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=INSjAjRy;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1348414.1606199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weStl-0004BL-C9; Tue, 30 Jun 2026 07:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348414.1606199; Tue, 30 Jun 2026 07:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weStl-000492-9R; Tue, 30 Jun 2026 07:28:49 +0000
Received: by outflank-mailman (input) for mailman id 1348414;
 Tue, 30 Jun 2026 07:28:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1weStj-00047Y-H6
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 07:28:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weSth-00364o-Lm
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 09:28:45 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a437025-2eae-0a2a0a5409dd-0a2a450cca82-26
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 09:28:45 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43702d-f399-0a2a450c0019-d155dd2eecf7-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 09:28:45 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-463f1165e16so4185812f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 00:28:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47563d19573sm4929119f8f.4.2026.06.30.00.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 00:28:44 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782804525; x=1783409325; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5GFe567EMxADlC6emMYxvpkfeJc6/w2uUW0Xpug4zHU=;
        b=INSjAjRyWw9W02g9+x+mM7WeOn9UlKiP2ctwAA+idz2qHCdNQvJMVhK9bj9DxhfKP3
         XXw6nZSrTITyfKMEeuL3rUAE7wcnSWhYw56HuAASy0gL++i05Ap4JrPDYLexK94SRXf9
         t26vdrZvWPvbN+t96zCc65eowMt3RiNNCKAlAd5MMsvJ3cGJt4JPgDZJd+xCNxjQd1uO
         Zy8BOeMXP12xBfyn76b8kK8TIO9vNLE+8EMj3J2+kjH9jfD2NPDwmJEych72VXBN+sli
         pLpIK56Hqr/cAmkceJUWi89kSnvtXOPt62/fSnI4sKF7owl+CAQjZCUnEch7uVL8TsPp
         cRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782804525; x=1783409325;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GFe567EMxADlC6emMYxvpkfeJc6/w2uUW0Xpug4zHU=;
        b=ldWmBc/QyVRC+oqGfoHRfx/3/msiMaxlDv4qBOS+pCKBNypm4aRqA4xOoIfLAWdQaS
         1/NyGUpbyKw0OFiMykRdsCOM6US0CsBZwNjjlvGAQEuCS7Yz26LkGKVxU9iBT9FqwTdR
         GZ9P0ZRQHeZFEHsnenZWuQ/5+zuWEWmtjJMAEaAmr5uP/s9tRvIWE1cy1T02TA0WfnFI
         13LohBG+MrAVjIvdemAqRzTbD3vJlpeQ4rYBkJIV0uwb37Yd1vSYnJ3TFmJ9hbeoNzyl
         B2jmFqTWCYHk+auozeQpKdkVuIW51NRGLzbR8Ts3HVBetEyk+Qvt0+AqhLRoAxlNhLPa
         J0xA==
X-Forwarded-Encrypted: i=1; AHgh+RowGgd36fj5+GGSbw1XEMFzXFYKXbEwH5Q3UTnNp6XDumtrnG+MbmfoCGNtRcBD5NBH+pllDhNy63E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDKRNJ8NKpPUTHe+Zs5AeC0Dd4DDuIGWnQ1hjU4KcWYuEBZn7H
	V1PJkmbCJWdE7gsV/fsXfHweBYoBSoVpnGWukHDOFg+QPwmeTRSRlWOnJVpLJcwWUA==
X-Gm-Gg: AfdE7cmKoSSwcRPvdSYYZzzDRkW0BdPqncBTDlqK+W2/CJKO19TqddwQ0tIJwvl5X61
	vq3AiBr9//MQbseX4a/V9U53xexSPQMjTndJf4/ctk3N9GgUhmOkFvpbVbpDBWyjer8Qv8brEN4
	TFF6eNNGXeMiW/X1SjJDFaGKFgxgoI42iY/+U0xYDPejqM0Mrb45KLmoQhqyim4SzZaV8GS8FfU
	EqhG+Ua4H47UyAz5dkoUp+aVDc6CeKmUyd6Q9rgwS3JHgwj1pbLWqDMwOgBegNTQ3fZ1y2/j9oN
	+21nP3XzmkbkQrgtwgEI9KKXP9oPbpqV3xZffEeqmz8APHBws6N2KP7LwJtIXhSguB0/GXllyOf
	PBM+wGdyo8fWzpN0MhZIMnBumNmJ/Fost7g6beINY2BU0JA3sqGjzKV1twcYBUuH0237d17fllb
	IwXpvAu4wHRd6kler8CQ4rQBHwdjrPrhBODcLVhshftUzdjVlKHo6MgMabPq8KxgZvsuw7A+ScM
	0+9wuuK/0wNBRo=
X-Received: by 2002:a05:6000:4285:b0:475:f100:35f7 with SMTP id ffacd0b85a97d-475f10036cdmr794453f8f.52.1782804524740;
        Tue, 30 Jun 2026 00:28:44 -0700 (PDT)
Message-ID: <131fc20c-1353-49fc-8f77-1ca13628ff17@suse.com>
Date: Tue, 30 Jun 2026 09:28:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 25/25] xen/riscv: add initial dom0less infrastructure
 support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <a6950e8dc2706c351fe6b0622602d34ecef133b7.1782487661.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a6950e8dc2706c351fe6b0622602d34ecef133b7.1782487661.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1782804525-A80ABD51-388FC2FE/10/73395122804
X-purgate-type: spam
X-purgate-size: 2567
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9964D6E126D

On 26.06.2026 17:46, Oleksii Kurochko wrote:
> Enable dom0less support for RISC-V by selecting HAS_DOM0LESS and
> providing the minimal architecture hooks required by the common
> dom0less infrastructure.
> 
> Add stub implementations for architecture-specific helpers used when
> building domains from the device tree. These allow the generic
> dom0less code to build and let a basic DomU be constructed on RISC-V.
> construct_hwdom() and make_hypervisor_node() are still stubs returning
> an error: Dom0/hwdom construction isn't supported yet, and the
> hypervisor node generation (needed by domains with
> DOM0LESS_ENHANCED_NO_XS set) is not implemented. Both are marked with
> a TODO and are not reached by the currently supported configurations.
> 
> Provide missing helpers and definitions required by the domain
> construction code, including domain bitness helpers and the
> p2m_set_allocation() prototype.
> 
> Additionally define the guest magic memory region (GUEST_MAGIC_BASE /
> GUEST_MAGIC_SIZE) in asm/guest-layout.h. The base is arbitrary; the
> only constraint is that the region must not overlap guest RAM or the
> emulated device regions. It is placed in the unused gap below
> GUEST_RAM0_BASE (0x80000000); the constraints are documented next to
> the #define-s.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Nevertheless, ...

> --- a/xen/arch/riscv/include/asm/guest-layout.h
> +++ b/xen/arch/riscv/include/asm/guest-layout.h
> @@ -32,4 +32,16 @@
>  #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
>  #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
>  
> +/*
> + * The guest magic region holds Xen-reserved pages mapped into the guest's
> + * physical address space (shared info, grant table, etc.). The only real
> + * constraint is that the GUEST_MAGIC_SIZE-byte region must not overlap
> + * guest RAM (the GUEST_RAMx banks) or the emulated device regions defined
> + * above; the exact base is otherwise arbitrary. Here it is placed in the
> + * unused gap below GUEST_RAM0_BASE (0x80000000), but a hole after a RAM
> + * bank would work equally well.
> + */
> +#define GUEST_MAGIC_BASE  _UL(0x79000000)
> +#define GUEST_MAGIC_SIZE  _UL(0x01000000)

... while 16Mb may seem a lot, it feels pretty little for 64-bit guests.
Even in just Sv39 mode they have ample VA space to map a bigger region.
(As iirc indicated before, a static upper bound looks questionable to me
anyway.)

Jan

