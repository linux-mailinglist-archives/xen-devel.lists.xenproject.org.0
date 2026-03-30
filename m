Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGjhDJCHymn09gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 16:24:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B10B935CC19
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 16:24:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267704.1557154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7DXC-0006Ny-2i; Mon, 30 Mar 2026 14:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267704.1557154; Mon, 30 Mar 2026 14:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7DXB-0006LN-W2; Mon, 30 Mar 2026 14:24:05 +0000
Received: by outflank-mailman (input) for mailman id 1267704;
 Mon, 30 Mar 2026 14:24:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7DXA-0006LG-F1
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 14:24:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7DX9-00GyK6-Qf
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 16:24:03 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca8781-2eae-0a2a0a5409dd-0a2a4502db8c-10
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 16:24:03 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca8783-63bb-0a2a45020019-d1558029d482-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 16:24:03 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so38486745e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 07:24:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722d40741sm297012165e9.13.2026.03.30.07.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 07:24:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1774880643; x=1775485443; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IPME0beY/JgQP8EwdQi3SsyLjLC0HbjHHiAmcEehBvQ=;
        b=DkDo1n+O20KYeyK/Ds49odQ0ZEsrzJ5Bps52y1TxzG7itrif1oQSOuVV8tFI+V1Oqd
         jnaRmJONjGTkKSraGiW+0BNHtYV53P/cL/kGnP4Rqjl5diyCo4NsO2akwpGO899U/P4e
         K/0eju8NBiq74tBH352w1hN5vqxxY6wE5yFyN1kN4dsFCsqKVVBn3WW1OTprkjlkol5R
         M7pIKdxoiCEwkZW3EWwJMV93VZjCAjGSvCEKFWjxB0X3uljJ0g55o2ydN5e1VHZO5uFb
         LzzptLTeCtstGJ/+zZiQBBjr30+ViYu4QPXQnGRYWzf7LoS6gnPfvfigS7u3xcPoKcp8
         e/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774880643; x=1775485443;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPME0beY/JgQP8EwdQi3SsyLjLC0HbjHHiAmcEehBvQ=;
        b=DYALbUKpVYHXUQctYaL1rgT/A19/Insrhn+Y2CisfJLmp1bVnqWGoz8N/izVnEBr7L
         I5I3cn+5NJL721IvliajnW3AarsLaZFHBkzrBHK5p7XUC6e0YoDzWL6x6oz18cmKciPf
         JNG5Aq8s2S+RHHCl/ew2Q4rUrsLpa46AIm2Kms4K2nnbtHKZYEfj+NgZ7PPcY6f8LJgU
         SUBZMZrxc4k7D4GO3d20XN5f7TNlLCaFPo9Bt2Lr+tx36D9y29KemJZoOuI5NbTBnaIg
         29IFVjlS6bGSwZW25+U0X8EaUpSRIEO9i98JZM2vOtd/6AWM/gNpy1bG2ibwzTAwq7zl
         PeRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfzMjzrLhS8bMcKuHttTEYN/85SQ3CkRcZI7Zp0MvQmgNwy+U8fcuTs2PL54bpSsEteNYIpOH80aY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuRtL2RpTLqiZsRnv6Gpn7R4gw4COSiV7SIH81xYjRxptu6v/G
	UGAD0evJjmi6G7qZW1rWloU7Ne1DeOUg74QV98pM15B9GXsZiTZsXWogAqKTZjzVKVADtU/PiXH
	9CSe/WQ==
X-Gm-Gg: ATEYQzz7ykstNsQbiGPbvQWQ5E6ng9Jw6RG5uzvkGiCfITuqFwF1mNLkEl/MS0VSaAh
	ois4TUvQOC0PqUJQ2RbS4SlvzjbopbAvh4rC64TfgLZVU3U8pf+0Sr6R7JqNYn8DdLln5zr7WTm
	RNH169BrM/SEDh+HvfQ7C0VKBr4uCjrok96t5WsgXuV3PHBQvS6w9GRb1KNha3g72/ivGnjI5le
	I4v9wv0d5LUD3durZCi98jrwxrnjJy3xO+rvo8O1ZYp9hfRtRQdMRzE9fUEViIS+9eTWC9uAscq
	o21lC6TsEaE/lG69PLXNUJgPUfkCTo7xVjmDF+qDEhI07FKaGveKTlg7vdLrL13VGqCJyX4xfBM
	ngaOd4rVHI7PyWN8XR5g34oMXP/kC3pHKnmtwgfNRHUr768a/mFQLem3Ig6grp18TKqklvwYDpw
	Cb2jX64WWnJsBXjRdV2SsUI5YHoAoKgozsdhai37w0AE0tOXNLPF2+DKrO/McQQGaiPZ494G83l
	VC9In/bZrjIWY4=
X-Received: by 2002:a05:600c:a44:b0:487:2432:f7ed with SMTP id 5b1f17b1804b1-48727efbffbmr217076295e9.8.1774880643113;
        Mon, 30 Mar 2026 07:24:03 -0700 (PDT)
Message-ID: <09f94c6c-349b-4f28-961d-4210fe953616@suse.com>
Date: Mon, 30 Mar 2026 16:24:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] xen/riscv: implement copy_to_guest_phys()
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
 <062e50c596b9271858d2d63e101bfde5311a3817.1774281309.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <062e50c596b9271858d2d63e101bfde5311a3817.1774281309.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1774880643-4149FDB8-3A907766/0/0
X-purgate-type: clean
X-purgate-size: 2165
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.842];
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
X-Rspamd-Queue-Id: B10B935CC19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23.03.2026 17:29, Oleksii Kurochko wrote:
> Introduce copy_to_guest_phys() for RISC-V, based on the Arm implementation.
> 
> Add a generic copy_guest() helper for copying to and from guest physical
> (and potentially virtual addresses in the future), and implement
> translate_get_page() to translate a guest physical address into a struct
> page_info via the domain p2m.
> 
> Compared to the Arm code:
> - Drop COPY_flush_dcache(), as no such use cases exist on RISC-V.
> - Do not implement the linear mapping case, which is currently unused.
> - Use PAGE_OFFSET() to initialize the local offset variable in copy_guest().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
preferably with ...

> +static unsigned int copy_guest(void *buf, uint64_t addr, unsigned int len,
> +                               copy_info_t info, unsigned int flags)
> +{
> +    unsigned int offset = PAGE_OFFSET(addr);
> +
> +    BUILD_BUG_ON((sizeof(addr)) < sizeof(vaddr_t));
> +    BUILD_BUG_ON((sizeof(addr)) < sizeof(paddr_t));
> +
> +    while ( len )
> +    {
> +        void *p;
> +        unsigned int size = min(len, (unsigned int)PAGE_SIZE - offset);
> +        struct page_info *page;
> +
> +        page = translate_get_page(info, addr, flags & COPY_gva,
> +                                  flags & COPY_to_guest);
> +        if ( page == NULL )

... this consistent ("!page") with ....

> +            return len;
> +
> +        p = __map_domain_page(page);
> +        p += offset;
> +        if ( flags & COPY_to_guest )
> +        {
> +            /*
> +             * buf will be NULL when the caller request to zero the
> +             * guest memory.
> +             */
> +            if ( buf )

... this.

> +                memcpy(p, buf, size);
> +            else
> +                memset(p, 0, size);
> +        }
> +        else
> +            memcpy(buf, p, size);
> +
> +        unmap_domain_page(p - offset);

It doesn't look like the subtracting of "offset" would be needed here. Any
pointer into the correct page will do.

Jan

