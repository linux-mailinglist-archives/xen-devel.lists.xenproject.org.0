Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFpXBoNK5mnSuQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:47:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F71042E949
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286304.1567399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqpv-0001pY-MB; Mon, 20 Apr 2026 15:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286304.1567399; Mon, 20 Apr 2026 15:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqpv-0001n5-Jc; Mon, 20 Apr 2026 15:46:59 +0000
Received: by outflank-mailman (input) for mailman id 1286304;
 Mon, 20 Apr 2026 15:46:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wEqpu-0001mz-J8
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:46:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEqpt-0092gc-Le
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 17:46:57 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e64a68-5cb7-0a2a0a5109dd-0a2a45079ae8-16
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:46:57 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e64a71-229c-0a2a45070019-d1558031bcfe-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:46:57 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4896c22fcbaso7689745e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 08:46:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ffc558f2sm170314415e9.1.2026.04.20.08.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 08:46:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1776700017; x=1777304817; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+DK9r27z8FkDNPpAXB5qEP7dssxbh520W9qiu1OJko=;
        b=PoCEBd7Ylot4wh8xOnsoka5P51QgRUEOShUgvcOo66KICwcZPcv2K644pt8aWXzFTx
         fVkSImpc9oXGNVD/KZBX5iC4FFFhzN18EgGufl46MO3apZAFss3mCUFethnnW76lBhuA
         7cq8Vjb/4r1b5/P61fOjtqtE0a4hCsR4Xr5W6teY5qAbh6Z/3pO/qJzOggARd0VQF7SW
         sNPLnqyuUvbSrVoQOp8cw2HUtqdzOU7cOxBpDaQq3AdAWZ63U8B/4K0J2r5Z3l4ixIYI
         bgVZ4pv4g8yD/x7gw8eVccjehk2oi0VKL8W77TCOJ4J38dOHfZH5nbS8KqpRT9vyb3XE
         Rjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776700017; x=1777304817;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+DK9r27z8FkDNPpAXB5qEP7dssxbh520W9qiu1OJko=;
        b=IUHNsSBiaB7dNNJhRUEmhqEVBCoqag8P6oHiBfrHwTU+NEVOXCWpGsjZ5N0g4XHO9h
         R2/nKcDo1ExmsZWH24dLkLxIwD5SKiQFh+KpEiKa0o9UC2qPWyn/obZjufPxwTrGpECF
         erN4ngULg0bscsNz6XMQJ85qqT75afeqH++DJF4Wjr00ogrLCLDr2X7xCR0ErQlmnAq3
         japeGiGjLTKUoAPJjUKJtxbowtHw/QKEADm89RlDlQ3wE/KEuPH4iuLOJ01G1RsIS3fZ
         +4/CEkkkNynXOySCxUcBTwV949qx7J3qWL1vwA5+JMousomZxO52llZ84qxeT5Z3WE47
         YsWg==
X-Forwarded-Encrypted: i=1; AFNElJ/7ur+FKU8xZDzFutPkMDaUHIQ0MTLUGw+PMIDOYzjbN7T1qWjn8qBk7D250c5WFothviPUS/ZZE0w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywys5sSDOusfaS7cOcjQudthPaxw9Cpc6cq6xMU/E3/E0zMngRd
	9crGU129R8X/HK3y4PpDu6elJyNNbWP5SuKRGqjUZgbfcu2zXlBT2OyiSWszlbxnqw==
X-Gm-Gg: AeBDietqoI7oaRPjqmdqFFJzKBLiZwKUheEcqPVmOwfWwSDzPcT1jREPKwrfqgqaDGJ
	o4xLYYMDVF7vMpLQE7AuB+yWMmQkhAuKto0PkU1a10T/wQz2avQe0JxOTGqBm0YOLzsLUw0nQya
	DhrDLuK4Hkw4IwcO/BgcXKNhNqttmDSABe+30LXZUay5cLYFdMr/KyGP0NHl90B5aRnGcegxXDi
	w16SlSmwJi7oqQR52Z6n+irM5XeG2FvVHAxyZkeDz2KIcLfP5tuVB1YO4dP+UnDFzSp7Us6iqtR
	GnW+O/PzsMXDX4cRwKguXUZGr/pEllWCDo22sDn03Twkb5QujFVG94UFzZe/M7KHp9nSn3ApGjZ
	FETzB3FUeoDd0Iiuec3WGYvG1wuo7Db6B5W4QYsgE/ub+INndg8bdWYhpGKIChQwZipTbBUlRVm
	14vFzuIIoMKT5Y0lZ5pm61pPKrv/jcwUySTTsJ/hreQE6b3/ebj95S2txkyW8iW6JF52vVT1ASH
	qelePo03s09tom8qBC3jt5gxQ==
X-Received: by 2002:a05:600d:8449:b0:485:445a:87d1 with SMTP id 5b1f17b1804b1-488fb74a66cmr174513515e9.8.1776700016965;
        Mon, 20 Apr 2026 08:46:56 -0700 (PDT)
Message-ID: <f166ad21-08c6-41fd-8c27-e43f87a5f249@suse.com>
Date: Mon, 20 Apr 2026 17:46:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] xen/riscv: implement copy_to_guest_phys()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
 <265d9fe7c0ff46c1c969156c889e133593d57fff.1775836193.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <265d9fe7c0ff46c1c969156c889e133593d57fff.1775836193.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1776700017-AF57BC48-A4402F70/10/73395122804
X-purgate-type: spam
X-purgate-size: 2918
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
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
X-Rspamd-Queue-Id: 4F71042E949
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 17:54, Oleksii Kurochko wrote:
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
with ...

> --- /dev/null
> +++ b/xen/arch/riscv/guestcopy.c
> @@ -0,0 +1,116 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/domain_page.h>
> +#include <xen/page-size.h>
> +#include <xen/sched.h>
> +#include <xen/string.h>
> +
> +#include <asm/guest_access.h>
> +
> +#define COPY_from_guest     0U
> +#define COPY_to_guest       BIT(0, U)
> +#define COPY_gpa            0U
> +#define COPY_gva            BIT(1, U)
> +
> +typedef union
> +{
> +    struct
> +    {
> +        struct vcpu *v;
> +    } gva;
> +
> +    struct
> +    {
> +        struct domain *d;
> +    } gpa;
> +} copy_info_t;
> +
> +#define GVA_INFO(vcpu) ((copy_info_t) { .gva = { vcpu } })
> +#define GPA_INFO(domain) ((copy_info_t) { .gpa = { domain } })
> +
> +static struct page_info *translate_get_page(copy_info_t info, uint64_t addr,
> +                                            bool gva, bool write)
> +{
> +    p2m_type_t p2mt;
> +    struct page_info *page;
> +
> +    /*
> +     * Not implemented yet.
> +     *
> +     * If gva == true, the operation will likely require a struct vcpu
> +     * rather than just a struct domain. For this reason copy_info_t is
> +     * already passed here instead of only struct domain.
> +     */
> +    BUG_ON(gva);
> +
> +    page = get_page_from_gfn(info.gpa.d, paddr_to_pfn(addr), &p2mt, P2M_ALLOC);
> +
> +    if ( !page )
> +        return NULL;
> +
> +    if ( write ? p2mt != p2m_ram_rw : !p2m_is_ram(p2mt) )
> +    {
> +        put_page(page);
> +        return NULL;
> +    }
> +
> +    return page;
> +}
> +
> +static unsigned long copy_guest(void *buf, uint64_t addr, unsigned long len,
> +                                copy_info_t info, unsigned int flags)
> +{
> +    unsigned int offset = PAGE_OFFSET(addr);
> +
> +    BUILD_BUG_ON((sizeof(addr)) < sizeof(vaddr_t));
> +    BUILD_BUG_ON((sizeof(addr)) < sizeof(paddr_t));
> +
> +    while ( len )
> +    {
> +        void *p;
> +        unsigned long size = min_t(unsigned long, len, PAGE_SIZE - offset);

... this adjusted to whatever the final shape is going to be on Arm.

Jan

