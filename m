Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GCNGssPk2lO1QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 13:38:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B843414360B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 13:38:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234118.1537451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrxrb-0006fN-06; Mon, 16 Feb 2026 12:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234118.1537451; Mon, 16 Feb 2026 12:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrxra-0006cv-Su; Mon, 16 Feb 2026 12:38:06 +0000
Received: by outflank-mailman (input) for mailman id 1234118;
 Mon, 16 Feb 2026 12:38:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vrxrZ-0006cp-GW
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 12:38:05 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55bb07d2-0b34-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 13:38:03 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4836f4cbe0bso22304825e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 04:38:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a337dfsm86388705e9.19.2026.02.16.04.38.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 04:38:02 -0800 (PST)
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
X-Inumbo-ID: 55bb07d2-0b34-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771245482; x=1771850282; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q88y04WTf4fECkxwMu4XuGo04vLjhcH/ov8RS4yqA3I=;
        b=Xf5B5ryGXmRumWAvBJtZivaqG0FmXtLE0jLIqerCQu7v8BkokRf7cP18OLYXiliRYN
         /w6VmMbKiYyNUnsn+FiuhjAGRIlwnf3Z4ctAgKI0SuaHnQiqA4SQ0gTWCrW1cx5mblgb
         ZXs+GGU10sfpii6W73oDRmeBGxqXO+ASrd43Mf2d4r6VvONrdMGAp/xP5vqOaDg9r5lQ
         0pgZFUcUHL8HFtC8OPAWWCmOJd4hmGNc7GTrKJXpcoSIaUkcesX/b437hAsKHJs8VCbe
         kaSTADMF9avSh2oxjDT5qTmG88DJJ7vB/oBCUUQtIiERv2u7Ujyq3ILjNolcYDGqnKab
         N13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771245482; x=1771850282;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q88y04WTf4fECkxwMu4XuGo04vLjhcH/ov8RS4yqA3I=;
        b=wT1kUmTTGn1VyhOFWEw0CdUmRXydxzIe6rp4eH8ld01N/nlK0rj4MrDvyN3Ozv7Ug1
         1iFdxPIJSPD9lSaa4deK37bOI1xVkOLsUNTOB7v+7aatKr06uRtLFhfYbRxEsH/NOqTY
         H86OPET/Toy6d2JfHVtb+tyuhZ0at7lsym2xtYsMbz20MlRp11EtpH91Ba4O6cBH1SF3
         VNN6/WDFmIzAGzE3ZmZ5GXpfntg5JcCZS6T1ITjQutY//oTToX8GoPJMgwdUkX4A4pFc
         kg0hyAzjg53kX7s/3Plc0g08Z1IpGNIiJ9l13fDFzCU7OUA6dksOjDmkiEgKWAlEaW2R
         sx2w==
X-Forwarded-Encrypted: i=1; AJvYcCUobcHsWl4OPxQC66aW011wnFTcvD34jCLIutcmdcafVnhdLJ0mdG3hkWsgTJlJhsNj1tkkMZ8eM5I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHKOGjqDBXL1XPjUibsK7HUfkM0iY+swihex174zxwIsjDPjK3
	HsZDhbgLHhTowX5Uul8GddyMay74qqrHrK09uy+1yjthmizosyXSOJVHe8llXI1LLw==
X-Gm-Gg: AZuq6aK0ZoESi5xwY8Mtp0zAnnO5bNPNXAuYJQSNUN46vBuwt/IYtAPXHhzn/f5kR+V
	xEjP79xTDtotoZu+3HOzjODf83aFmIsoR3ccjzy8ccAJKOVlJoWmmLCDjln3JZAnYxU7sRC1HSk
	Bi8yAnjVGURGQybYrL1LmVinf20DqZJPHX9ibmd+6D+BfOmEiEKYndzbwIejv7RWhSy/OCEHp22
	x83fl0JEtMreNiJAsgrkc7HFaRbYRdN6YKGDbJgQTT4Yioy7XDpgd5ynexlBPhnhChG0m+brXKE
	sz00XRJqCwSF/PYONg87zP72Ri7uQycc+oJ287T6ijK+F04jRFUpay9PUdIJVzV5gn4zHB/YzyP
	+gJlyXW0Sv2G9IQevjWqVffI+ftaIfAWBb504LhsqSTpgE13pgytpbpy6pEzHxQ8qSxPoj+tEUu
	fc5bvCKMuupngESeH/LP0D0OUUT5YTCIZQp3wBinU84t34F2p55FeaMsqvVh7lQdEpI9f5/V2Rm
	Ewzh3SRhQUwj1Y=
X-Received: by 2002:a05:600c:3d87:b0:480:3ad0:93c0 with SMTP id 5b1f17b1804b1-48373a5d6d5mr149809225e9.23.1771245482448;
        Mon, 16 Feb 2026 04:38:02 -0800 (PST)
Message-ID: <c053f6bd-eedc-4dbf-a404-802781dee722@suse.com>
Date: Mon, 16 Feb 2026 13:38:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] xen/riscv: implement get_page_from_gfn()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <04eee3ae5e8aadf8c7f0b873ba24ce38220e8fa2.1770821989.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <04eee3ae5e8aadf8c7f0b873ba24ce38220e8fa2.1770821989.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B843414360B
X-Rspamd-Action: no action

On 12.02.2026 17:21, Oleksii Kurochko wrote:
> Provide a RISC-V implementation of get_page_from_gfn(), matching the
> semantics used by other architectures.
> 
> For translated guests, this is implemented as a wrapper around
> p2m_get_page_from_gfn(). For DOMID_XEN, which is not auto-translated,
> provide a 1:1 RAM/MMIO mapping and perform the required validation and
> reference counting.
> 
> The function is implemented out-of-line rather than as a static inline,
> to avoid header ordering issues where struct domain is incomplete when
> asm/p2m.h is included, leading to build failures:
>   In file included from ./arch/riscv/include/asm/domain.h:10,
>                    from ./include/xen/domain.h:16,
>                    from ./include/xen/sched.h:11,
>                    from ./include/xen/event.h:12,
>                    from common/cpu.c:3:
>   ./arch/riscv/include/asm/p2m.h: In function 'get_page_from_gfn':
>   ./arch/riscv/include/asm/p2m.h:50:33: error: invalid use of undefined type 'struct domain'
>      50 | #define p2m_get_hostp2m(d) (&(d)->arch.p2m)
>         |                                 ^~
>   ./arch/riscv/include/asm/p2m.h:180:38: note: in expansion of macro 'p2m_get_hostp2m'
>     180 |         return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);
>         |                                      ^~~~~~~~~~~~~~~
>   make[2]: *** [Rules.mk:253: common/cpu.o] Error 1
>   make[1]: *** [build.mk:72: common] Error 2
>   make: *** [Makefile:623: xen] Error 2

Surely this can be addressed, when x86 and Arm have the function as inline?

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Does it make sense to make this function almost fully generic?
> 
> It looks like most of the logic here is architecture-independent and identical
> across architectures, except for the following points:
> 
> 1. ```
>    if ( likely(d != dom_xen) )
>    ```
> 
>    This could be made generic by introducing paging_mode_translate() for ARM
>    and defining it as `(d != dom_xen)` there.
> 
> 2. ```
>    if ( t )
>        *t = likely(d != dom_io) ? p2m_ram_rw : p2m_mmio_direct_io;
>    ```
> 
>    Here, only `p2m_mmio_direct_io` appears to be architecture-specific. This
>    could be abstracted via a helper such as `dom_io_p2m_type()` and used here
>    instead.

With P2M stuff I'd be careful. Abstracting the two aspects above may make
future arch-specific changes there more difficult.

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -1557,3 +1557,31 @@ void p2m_handle_vmenter(void)
>          flush_tlb_guest_local();
>      }
>  }
> +
> +struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
> +                                    p2m_type_t *t, p2m_query_t q)
> +{
> +    struct page_info *page;
> +
> +    /*
> +     * Special case for DOMID_XEN as it is the only domain so far that is
> +     * not auto-translated.
> +     */

Once again something taken verbatim from Arm. Yes, dom_xen can in fact appear
here, but it's not a real domain, has no memory truly assigned to it, has no
GFN space, and hence calling it translated (or not) is simply wrong (at best:
misleading). IOW ...

> +    if ( likely(d != dom_xen) )
> +        return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);
> +
> +    /* Non-translated guests see 1-1 RAM / MMIO mappings everywhere */

... this comment would also want re-wording.

> +    if ( t )
> +        *t = p2m_invalid;
> +
> +    page = mfn_to_page(_mfn(gfn));
> +
> +    if ( !mfn_valid(_mfn(gfn)) || !get_page(page, d) )
> +        return NULL;
> +
> +    if ( t )
> +        *t = likely(d != dom_io) ? p2m_ram_rw : p2m_mmio_direct_io;

If only dom_xen can make it here, why the check for dom_io?

Jan

