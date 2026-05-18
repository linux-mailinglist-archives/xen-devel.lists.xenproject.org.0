Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBQuGLUsC2opEQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 17:13:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD75456FB3C
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 17:13:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312008.1582177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOzf3-0008Al-9q; Mon, 18 May 2026 15:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312008.1582177; Mon, 18 May 2026 15:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOzf3-00087w-71; Mon, 18 May 2026 15:13:41 +0000
Received: by outflank-mailman (input) for mailman id 1312008;
 Mon, 18 May 2026 15:13:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wOzf2-00087q-Kg
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 15:13:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOzf1-003hkX-SA
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 17:13:39 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0b2c94-5cb7-0a2a0a5109dd-0a2a450ca68a-36
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:13:39 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0b2ca3-62f1-0a2a450c0019-d1558029ac72-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:13:39 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso14654895e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 08:13:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c833fcsm261610255e9.2.2026.05.18.08.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 08:13:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1779117219; x=1779722019; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tLSX+LZzydbu81O22Az/uyJa+78LpFfEI06C4sxaR+8=;
        b=Ddn7ovNZjZSKWDrX3CybnQGUhcCHXA2SHkiGZLwnWcksEa9ja0HgZGQyIzumYuwXKl
         UfR7n1/+8cZ1Mz7BEphAFAcCOPRVc88JmFIGhi3dcUEfaxLcCIjksQpOinnV0MrLNTCj
         DmxG+YQJRx+yZkKlZiOUpNsksnjOfntGbzKPfBZ0jEnE3Pl1k/kr4oBwgGC17xxM8dN+
         eBgZKyJrxSRbsGvVDv5pRxzP0FH/myAGY7E+NFyZbQLA6YrHjQfIzMV4Nx3TRRGRvl54
         gX/HMaj3b+b1bCyd3/GtzX2m93p5/l+5l9sRcd9A/SzdIG5pZyCv/mEFfZc8Y0PNlJnf
         e/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779117219; x=1779722019;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLSX+LZzydbu81O22Az/uyJa+78LpFfEI06C4sxaR+8=;
        b=OBrI9iCTC63+B2kWRK1gS60asBIequm7jrvnEMViS2Qdoey0cN2kWfqwV4tBWQMKaD
         /PmIA+c7O8kvbPPv4h0hudH29bsY0R+B8UbNwYW62r3k8KlahqMpWjOroENGwlTF7Gti
         JRWy7baUuAx9p3BceCH+9t6HK3rapF5Ek4samTs6DZ/8/ZMfd9O+jkszpIzEqV6ZJ50t
         sJFCs96tTFENg0TPtqJlDXbF2Ql24LuKpsoizt5bg9bMK1tu7FgamNS4jD+90zJPMEJL
         zhYga7Js7LFao+nMmgJn4WcGndd/7CCYpX+otuGZiybwssQuCeXagTisl+qPNap/LdYM
         CTQg==
X-Forwarded-Encrypted: i=1; AFNElJ+OgHD3+U+1b6o96Z8kkMNcgAHn7RGcH8qp7GlmZFe6/OSSbcA5Qvhf3OiN4Nmxi48AjDKnrtduxxw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7dAr9HNqtjcsRjd2sEbhSrPP1as+3Ldwt1uot9c74Yqz+mibQ
	5iedcUvAKFdsvAwdY9+UGXWirPFtvw6kMelxojRUc5pIrzD0N7g4Y5cU/ikBKCPLjQ==
X-Gm-Gg: Acq92OF6JKYI9vKP+qoUHDPBFryvdcsFwFWQR7MxOCwAthftD6bYzGm5WbwQLhv02ub
	em+7c5Ta2YUdzjJ+I9ayi39PEJsUzNUIn9NmNgToMgcXLg3VCnhdPT9COV/t6TiRW5F9VDUBER1
	ZS+xbYLyXtlFT6H3qV0ATeNxCAQNuXJ3I4wjeK4XY6DhKz11yYXKRWBr4NX9jGaNo/Vpm+bkDTq
	a0BP2rRXr1IjYOmDLgvzDz/3TOZKcd3+1bat159ke9svbVZoCy7TANZwnxuIsKzsxS51lKRQj+I
	B3Q6GvbXiKPUn+dMts3hYPFO1L6fGKWRWhXUTr3D42xuK4ZlOPMnx+WQm4yGBfalYEeqyjuXzzP
	9OVVUd5PFx8cTOwdUqGBN8M5QYllB7QGtnCXDStA+74ZxgTo4m9wPOo66seeZiIyHmhJs2g2LAN
	2I19lH7TmuRJpSdfOBnHnDOeF0GpgQiX9TXkD0RYjGc4o/hsjXg+4tkzaAXxpOvN636lYnexsYP
	7RQOXAFwowg66c=
X-Received: by 2002:a05:600c:a406:b0:48a:6798:52e9 with SMTP id 5b1f17b1804b1-48fe59b06acmr205236055e9.0.1779117219142;
        Mon, 18 May 2026 08:13:39 -0700 (PDT)
Message-ID: <97011ba2-0f54-4336-9949-5ea0d76900f1@suse.com>
Date: Mon, 18 May 2026 17:13:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/26] xen/riscv: Implement ARCH_PAGING_MEMPOOL
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <97f20cc49563fdf01775a649e562e302bd0fa886.1778250616.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <97f20cc49563fdf01775a649e562e302bd0fa886.1778250616.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1779117219-DB57FCF5-B0F7B8C4/10/73395122804
X-purgate-type: spam
X-purgate-size: 1620
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CD75456FB3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.05.2026 16:43, Oleksii Kurochko wrote:
> The p2m_freelist is used to allocate pages for the P2M. To initialize
> this list, domain_p2m_set_allocation() may be called from construct_domU()
> in the common Dom0less code, so RISC-V provides an implementation and
> enables CONFIG_ARCH_PAGING_MEMPOOL unconditionally.
> 
> Additionally, implement arch_{set,get}_paging_mempool_size(). They are
> not directly used yet, but are required to support the
> XEN_DOMCTL_{get,set}_paging_mempool_size hypercalls.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -1606,3 +1606,27 @@ struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
>  
>      return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);
>  }
> +
> +int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
> +{
> +    unsigned long pages = PFN_DOWN(size);
> +    int rc;
> +
> +    /* Non page-sized request or 32-bit overflow? */
> +    if ( pfn_to_paddr(pages) != size )
> +        return -EINVAL;
> +
> +    spin_lock(&d->arch.paging.lock);
> +    rc = p2m_set_allocation(d, pages, true);
> +    spin_unlock(&d->arch.paging.lock);
> +
> +    return rc;
> +}
> +
> +/* Return the size of the pool, in bytes. */
> +int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
> +{
> +    *size =  pfn_to_paddr(ACCESS_ONCE(d->arch.paging.total_pages));

... the stray blank dropped from here. Will take care of this when committing.

Jan

