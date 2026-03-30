Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAv4OEucymmg+QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 17:52:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B79F35E331
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 17:52:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267844.1557319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Eu3-0006AQ-1w; Mon, 30 Mar 2026 15:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267844.1557319; Mon, 30 Mar 2026 15:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Eu2-00068p-VS; Mon, 30 Mar 2026 15:51:46 +0000
Received: by outflank-mailman (input) for mailman id 1267844;
 Mon, 30 Mar 2026 15:51:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7Eu1-00068j-Co
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 15:51:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7Eu0-008o7d-As
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 17:51:44 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca9bfb-5cb7-0a2a0a5109dd-0a2a450aaa4e-44
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 17:51:44 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca9c0f-1772-0a2a450a0019-d155dd29ad29-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 17:51:43 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-43cfd832155so804405f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 08:51:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf2580194sm18405238f8f.37.2026.03.30.08.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 08:51:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1774885903; x=1775490703; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p7XdhkhCDLZT0BfoxgMn+qGUvz4sfXzzYfX8Q9jHuq0=;
        b=eXAzCI7UInEl1Y5F4x1osN1AcEAeq1eoEjCFEa2sD86PoGUcPr1He6gN/R8sOrc1ig
         bF4Qf28ZBZYEZncvsGgJlOFtB+Qtze4fGSIifzHQ7yf6taeGzkeAU7yuppUwOaKD/+ZR
         trxw8jXpwx/kU4cA4g64+tl6pQjQFlaPcsuXTScYVkGIi7Ru3cJ0ji+P0XrjIxXZhUqb
         6ThvWhvxSxtP+RCxQ81NAqaDrkd8Hank9XRg975Yn7Th6DhDvgYiYmDBPbyuy85RE50G
         GIMjh5ICitD5RxIawUF1HjxbJb6UgBrXFI1jvVmnJm31VKnMhAyPTyYi79ieqBv/4Zpt
         s0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774885903; x=1775490703;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7XdhkhCDLZT0BfoxgMn+qGUvz4sfXzzYfX8Q9jHuq0=;
        b=f4eg44BVsg1JJs6Fo22/a4SVZ3JBqkmrPTpabqH0Se2czPJldMMwLL2OmqTh9rFnPh
         xwTx2AMpIndCqdZtb+55hRwkEMzjY3dVZHeXDDFCmPRb2qNHibAQfC+it/zU+G7qocOw
         CjViYLiLGj1h7DoWT86C64K5J087riIn1So1l0Nx4Uv/oe0YlN/WLKMTqH2S/0JZc2JY
         2ztnJGM2kV1jVunwlPBGw/XG3Xl9OQbg3DeuDa68KFzG9LgGmoCgjyMq/zOshM5ad6OV
         ejPEmwkhqzjKp0NEz+GxNQXZVIssGgjsQwESO05XCkNwlDLPJn6fiVg7AINm07KmczaV
         5l5A==
X-Forwarded-Encrypted: i=1; AJvYcCXd4dgPNIIo64udeWtjVGrY21oSFEQwpS5mrHvC+NQihN5oy6NnJ4REHzrWnmn6+miGUp+tZWydG5Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzCMI7fdKNIenS+floqk+ujkuA7VcVrv3NfzZqgKNWK+niyCvW
	xFlT66+Dxj4+3Ro1ESCNGe4iRYmwq9XM6mS5WOFmO8e2v+mfRBKD4TZOpSN+8hCFkw==
X-Gm-Gg: ATEYQzyEsfCFqKaiNVdADJlR73PWPiYqXt2MA0116yTluyOQk1gFXUc7MV+LwIDkQbc
	WwcROYkb2Jb3ep4zM5ZrWQxPHd1BDhiBSUNN11oUUj2v8wAbC8x3tErCPJMWmHtu1sTZBgJQFYp
	6PG/i2NBxeq0j1kIwPmpP4am4jzpxdFV9qG0WQVZoOwrDscKu0QNYcRiTJlno7WXLtZIRdHTV4h
	vlVBkv3K0FCS4tSZ0gkn6/CHOCKMNrymIUFaHfOUrOFkwlXvlHJZLovCkXQ1jffvv7qvj57joyK
	UxTn7pwmAKrUo/+QZhUbxDUYEMP1j86oexYvlQfsm6tifIAQbZrtOZRJ6Mdt6Yrt03ddh/TfZU2
	KlzOCZOf05ACqfGAFu7Hg/yE5+l46Do4JM5x2sQM9b03zdSlbQ6JfdNnOhHM4fxmxUF6jTWexss
	8fn16fiw0bBCEsZ75mnxbUT+EA7RW7nOvQhGi0PNu81Cd0XkicyA0m++uSrTILVL1vRfvQgxhkJ
	uYhLTxdCVv81L8=
X-Received: by 2002:a05:6000:2406:b0:439:b59e:5e6a with SMTP id ffacd0b85a97d-43b9e9e8424mr22103610f8f.14.1774885903188;
        Mon, 30 Mar 2026 08:51:43 -0700 (PDT)
Message-ID: <1a3a316e-f0ea-4514-95d6-9813d6d5ca76@suse.com>
Date: Mon, 30 Mar 2026 17:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] xen/riscv: add definition of guest RAM banks
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <8278256f3d270b456d19cb9891b89b88a46548a5.1774281309.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <8278256f3d270b456d19cb9891b89b88a46548a5.1774281309.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1774885903-CC5C6900-74052CC2/0/0
X-purgate-type: clean
X-purgate-size: 2770
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3B79F35E331
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23.03.2026 17:29, Oleksii Kurochko wrote:
> The dom0less solution uses defined RAM banks as compile-time constants,
> so introduce macros to describe guest RAM banks.
> 
> The reason for 2 banks is that there is typically always a use case for
> low memory under 4 GB, but the bank under 4 GB ends up being small because
> there are other things under 4 GB it can conflict with (interrupt
> controller, PCI BARs, etc.).

Fixed layouts like the one you suggest come with (potentially severe)
downsides. For example, what if more than 2Gb of MMIO space are needed
for non-64-bit BARs? Further, assuming that the space 4G...8G is what
you expect 64-bit BARs to be put into, what if there's a device with a
4G BAR? It'll eat up that entire space, requiring everything else to
fit in the 2G you reserve below 4G.

> So a second bank is added above that MMIO
> region (starting at 8 GiB) to provide the remaining RAM; the gap between
> the two banks also exercises code paths handling discontiguous memory.
> For Sv32 guests (34-bit GPA, 16 GiB addressable), bank0 provides 2 GB
> (2–4 GB) and the first 8 GB of bank1 (8–16 GB) is accessible.
> 
> Extended regions are useful for RISC-V: they could be used to provide a
> "space" for Linux to map grant mappings.
> 
> Despite the fact that for every guest MMU mode the GPA could be up
> to 56 bits wide (except Sv32 whose GPA is 34 bits), the combined size
> of both banks is limited to 1018 GB as it is more than enough for most
> use cases.

Okay, more memory can be made available by (later) adding an optional
3rd bank.

> --- a/xen/include/public/arch-riscv.h
> +++ b/xen/include/public/arch-riscv.h
> @@ -50,6 +50,22 @@ typedef uint64_t xen_ulong_t;
>  
>  #if defined(__XEN__) || defined(__XEN_TOOLS__)
>  
> +#define GUEST_RAM_BANKS   2
> +
> +/*
> + * The way to find the extended regions (to be exposed to the guest as unused
> + * address space) relies on the fact that the regions reserved for the RAM
> + * below are big enough to also accommodate such regions.
> + */
> +#define GUEST_RAM0_BASE   xen_mk_ullong(0x80000000) /* 2GB of low RAM @ 2GB */
> +#define GUEST_RAM0_SIZE   xen_mk_ullong(0x80000000)

Connecting this with my comment on the earlier patch regarding kernel, initrd,
and DTB fitting in bank 0: How's that going to work with a huge kernel and/or
initrd (I expect DTBs can't grow very large)?

> +#define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 1016 GB of RAM @ 8GB */
> +#define GUEST_RAM1_SIZE   xen_mk_ullong(0xFE00000000)
> +
> +#define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
> +#define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }

Why's this needed in the public header?

Jan

