Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPwWLN+1BmrrnAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 07:57:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E05A549CED
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 07:57:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309554.1580594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNlXb-0002Y7-B1; Fri, 15 May 2026 05:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309554.1580594; Fri, 15 May 2026 05:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNlXb-0002WI-83; Fri, 15 May 2026 05:56:55 +0000
Received: by outflank-mailman (input) for mailman id 1309554;
 Fri, 15 May 2026 05:56:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNlXa-0002WC-0W
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 05:56:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNlXX-009VN7-IS
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 07:56:51 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06b596-5cb7-0a2a0a5109dd-0a2a4506b5be-26
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 07:56:51 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06b5a3-7371-0a2a45060019-d155802cd92b-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 07:56:51 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-48e82c23840so46373165e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 22:56:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a6449sm11545525f8f.37.2026.05.14.22.56.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2026 22:56:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1778824611; x=1779429411; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QY/5uJ/lYfBdWRoMT0tCNS3zl2PQuJ+GlLOUlLPPHzY=;
        b=NXkyIjgphEZm/aKMZNofw/c4uDTh1tmyZLh0qk2vyfVRhcb/RVLuPMcgq3khoaMx0M
         Q5dVPHp+N7Wn5bPPN8M3jpQB6CF4JlRyO7GT+LGAHItQYRLelQ7p1rAuXaUrluctmN7t
         ucrzGPgTVXg1AU10Z//fRY1zDqVMAhilieuDzICAtv6glVT2yaqJFiCRjLi5vdeLhS5L
         fV7dqvRXz69mmxUMWaRv7XAVgGPVDCGK00po8xZSI/xe0ziANhmAAGR+e33xfhTEbwXj
         gdvjSXjDMOVJLXPwO5D+S9eRQICRjKWWBD93XsKcsEPwHHqe5ldnahHnmrYxNz8mWYRF
         Mmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778824611; x=1779429411;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QY/5uJ/lYfBdWRoMT0tCNS3zl2PQuJ+GlLOUlLPPHzY=;
        b=TD6YKDmpOrwPDZcHYGelB9X20eixeKgp3wuZmSEpKRt5f37paEyurq954TjkVRh5Hq
         J/danSS6fRSiZ3y3cy3g6sTz5/tpvy92rxrs1gdQD2TRhxbcgs4ZC/vLmr4sHPIiOgi1
         RnB5htOEsmtheol7LWdqNMlbV84nP0gE0elDR0EeMxGvxb8rWAeX3jkZdONNAiWgwyCe
         13sYwUF8pfOIsw941RZLXHbPDR3S4kAqqp2hTYt4v20CNs2U+YkKSakw4nYVZDfswJJE
         aI+CIhtbmDJonLaS2Hi50ZnIwNZfldQ/AVvoPgyTrC8u5GCgf/44qKXTD1UeYNAtsP3I
         e1UQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TEwBGjXjpF17Ef6FcZgwNkV8zlj6ZpDlHl3rKDa9Z06TJFyopY0Nvq+lYcfyqT/7i8Wod2N1gPdw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXlnQjI5Z44B94f9PlnvbW1LHLuaeVNxKHt+ELGm10DkvBQkyq
	O5ODDzVtNhejnaWM7A+2wlwFPjIniuoRuctAMjOZ6MW++1AzZe948vFiLb1tkme+nQ==
X-Gm-Gg: Acq92OEgcEy8P0lYYHSNyQxFlk5YjuHKp+/B7YPWN12tdbTA/0lzVPw4tAS4ISDg6Cv
	+fq35I4EKzLgFQNGpQgw2JPznwMRi3I3/d96ajLVXbahX12j/x7zXuQ6RotyzWl/AKwGMbHRQva
	C6HQ3+fD5Cuiado/wjM7jPbOBWSYRz6wYxioavhkCCPA9UJSf8JWShoM2WG/KfFTTueHpjDBL0x
	fccenVbYdkYUxLpbfmhtZrcjE0G6bC8RpAfMdJ1R70KMBfoRvG2J4Icc5fRLayIn7yGZNCswgV+
	SABhzEuGAPkuGR3YBvMisTboanrpB1BDLLDzd5T5sJVEHpVg/Sfwm/bvUpdMANrsYRohrf/vyI2
	XJRPiDuJJgiOXQ3yIuwaOeSwN/aMTmYUp/AcTyNEmZ7kG0H/+vk55lOYVx732XNlmGZhBvn6+aE
	Bu+cJLwfpTXHyrIXlNooVozSHcqZXCBemjvKnMAqulH98EkRIszrqMIRfP7jiG+9vl+ukXshuQv
	ym0h5rE8gtgrEn/U6RAUZ4SlA==
X-Received: by 2002:a05:600c:8901:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-48fe60e3663mr24739695e9.5.1778824610888;
        Thu, 14 May 2026 22:56:50 -0700 (PDT)
Message-ID: <843895bc-75a9-487e-87a3-2e11492faf3d@suse.com>
Date: Fri, 15 May 2026 07:56:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 24/26] xen/arm, tools: add domctl for Realm
 finalization
To: Koichiro Den <den@valinux.co.jp>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Juergen Gross <jgross@suse.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20260515040812.983626-1-den@valinux.co.jp>
 <20260515040812.983626-25-den@valinux.co.jp>
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
In-Reply-To: <20260515040812.983626-25-den@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1778824611-8CE79D75-D9BA651B/0/0
X-purgate-type: clean
X-purgate-size: 1744
X-Rspamd-Queue-Id: 0E05A549CED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:den@valinux.co.jp,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 15.05.2026 06:08, Koichiro Den wrote:
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1201,6 +1201,16 @@ struct xen_domctl_vuart_op {
>                                   */
>  };
>  
> +/* XEN_DOMCTL_arm_cca_op */
> +struct xen_domctl_arm_cca_op {
> +#define XEN_DOMCTL_ARM_CCA_OP_INIT_REALM  0
> +        uint32_t cmd;              /* IN - XEN_DOMCTL_ARM_CCA_OP_* */
> +        uint32_t flags;            /* IN - reserved, must be zero */
> +        uint64_aligned_t base_gfn;   /* IN - first guest RAM gfn to protect */
> +        uint64_aligned_t nr_pages;   /* IN - number of 4K pages to protect */
> +        uint64_aligned_t rmi_result; /* OUT - raw RMI result on -EIO */
> +};
> +
>  /* XEN_DOMCTL_vmtrace_op: Perform VM tracing operations. */
>  struct xen_domctl_vmtrace_op {
>      uint32_t cmd;           /* IN */
> @@ -1368,6 +1378,7 @@ struct xen_domctl {
>  #define XEN_DOMCTL_gsi_permission                88
>  #define XEN_DOMCTL_set_llc_colors                89
>  #define XEN_DOMCTL_get_domain_state              90 /* stable interface */
> +#define XEN_DOMCTL_arm_cca_op                    91

If this is to be Arm only (as the name implies), ...

> @@ -1429,6 +1440,7 @@ struct xen_domctl {
>          struct xen_domctl_monitor_op        monitor_op;
>          struct xen_domctl_psr_alloc         psr_alloc;
>          struct xen_domctl_vuart_op          vuart_op;
> +        struct xen_domctl_arm_cca_op        arm_cca_op;

... this wants to move ...

>          struct xen_domctl_vmtrace_op        vmtrace_op;
>          struct xen_domctl_paging_mempool    paging_mempool;
>  #if defined(__arm__) || defined(__aarch64__)

... into this #if.

Jan

