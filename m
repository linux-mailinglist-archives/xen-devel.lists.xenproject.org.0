Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BNZAePUgGmFBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:46:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27911CF1DF
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:46:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219000.1527869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmx3k-00020P-3D; Mon, 02 Feb 2026 16:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219000.1527869; Mon, 02 Feb 2026 16:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmx3k-0001xa-0I; Mon, 02 Feb 2026 16:45:56 +0000
Received: by outflank-mailman (input) for mailman id 1219000;
 Mon, 02 Feb 2026 16:45:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bi8a=AG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vmx3i-0001xB-Nk
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:45:54 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a28aa3ed-0056-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 17:45:52 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-42fb6ce71c7so3849260f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 08:45:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e4762sm43126989f8f.6.2026.02.02.08.45.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 08:45:50 -0800 (PST)
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
X-Inumbo-ID: a28aa3ed-0056-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770050751; x=1770655551; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7FMYtYbudKgAG4CvwK6NTykjmaW0CA4U3dbA83dbTuU=;
        b=faJ3ynp95kVQoj5ErTOPq2pgeBBQmLD8VAnNjFZvPou1PKBhuHDzoPI0XidThn0nqJ
         Jf/GR7SVrfoF8OZgrjpkSoqq4/254GHIQ7LTP8O+342KzhxiqhulbhMoJrfbJT4prBU2
         toeSChbhKFRxwSwXS9BMRGnSa/Qdw1qZsJhYsx43erRNgOWDUXvhKmVZ0tEXEOOzOS5e
         wOkLbwaCHh34lqel5u1QMUXbNtCZ0N5wzRoeJhGsoRyTHghBppbRwp6JWtWpJKOcKxnb
         7wqAomJuBKwbbWgEVPxM+pP6clXQKk11Br174g55cfDizsZmADOzP3SEq3GtRZeONWOZ
         uIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770050751; x=1770655551;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FMYtYbudKgAG4CvwK6NTykjmaW0CA4U3dbA83dbTuU=;
        b=gPf76Vy8b+iDjjrhLcDUj9Mt2Lu/DZ4UYM6G++GtytQPDtT7UIIXzXrRWsDZsn02ir
         mHsDNXjrL+Ue5W1gRFeJm3E090E68ic9U55TZYwHZAhD7yVLoxmtxYc3M9Ne6L84eIO5
         N/OffqTeJsBwc2ZSyxVnLqNGx4coduplJgePXJADqFaDCn5HnXePAtoPRcpVWy2Duj0P
         V/1/JxLEwwFZ9+vmVlbYL26BEpYuB88PwCSBQkY/ifi2PvghjxnK/+0yO0U70257f/kH
         V1iNGxNqkM+JqkWQ903QLr0MgnyygVzkdkt4SPmdritAA6/HmA+bm4iXIazQgEqeyY9k
         OU6g==
X-Forwarded-Encrypted: i=1; AJvYcCUaFOz8HHLuCMnfGu6CsXDohG9uolU/InKjrk/LpifkP73mlvpKtzNyFF+AhPOKoI2DtuvYy2D+LGY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6cOV62cL4r62TnSx20LsMMpoyz0mY+0RygieBh1uhhWxhHkSw
	fvV/LATBhVZczf76rQTQ9kwPBkNYetxhIWGP+hB5hzxYadWrLYMNXdrd8+g2CKdK0g==
X-Gm-Gg: AZuq6aJd4M6l+kmyg6ps7JJMuictWPDvkWZ8zaqwiCs8Ylq1R6wZHK+P1XCiUUGfq+R
	Tc2r0wvXE5bJw1DncQBp2r6dxmTJN1bd8WfY71jB21Gy99LBEdz/z0eLta1jeCzEzcKsPLBx3SE
	5gwsj2AFURXlySzVhOIfU7U5NFyRXC1jcuBk+RscHsrYgPSCl+FAf+OoszLqKcOrpuQDOSRBtSo
	Vlmo2/lYN9y36qKj5BCBZIYXh4KI5sMAP5Ht8bZSzT6HxsdHSfEmLI7DMmDZAFnc/stcbF0m7NC
	ZNXVM3+AIzK+HrVgOkyVDAUFB0Llty1cpR9lN++/YWPgBt9L9Ro7D7MfyswjZDL9MOxNhY6XpIA
	5fi99cly1ZX/Ww0CaJkCNVPQdz0EOHIbPu5xs/jARbMHEL68xVxebX/cTdKY95UpEBXvtbLbB3A
	x1wJB1Zdb53XxpCnlbkS/f2KE9UdtRbeqmHysQ56p7ys1BOamHVZRTaNz0qqBicnvvsMU7rXM+i
	m8=
X-Received: by 2002:a05:6000:1446:b0:430:fbe1:382a with SMTP id ffacd0b85a97d-435f3ab8953mr19778111f8f.54.1770050751439;
        Mon, 02 Feb 2026 08:45:51 -0800 (PST)
Message-ID: <8a303ef0-32fb-44f3-bc73-2276e5e08be6@suse.com>
Date: Mon, 2 Feb 2026 17:45:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/19] xen/domain: Alloc enough pages for VCPU struct
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1770046465.git.mykyta_poturai@epam.com>
 <a34c89037c29728943d0a15168e7c87e2ed50630.1770046465.git.mykyta_poturai@epam.com>
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
In-Reply-To: <a34c89037c29728943d0a15168e7c87e2ed50630.1770046465.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xakep.amatop@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 27911CF1DF
X-Rspamd-Action: no action

On 02.02.2026 17:14, Mykyta Poturai wrote:
> With introduction of GICv4 the size of struct vcpu can again be more
> than one page. Modify struct vcpu allocation to request enough pages
> again.
> 
> Don't reintroduce the MAX_PAGES_PER_VCPU check.
> As per commit b77d774d8274183c2252f5fbc9fa3b3b7022ba06
>> It turns out that beyond efficiency, maybe, there is no real technical
>> reason this struct has to fit in one page
> 
> Since there is no technical reason to limit struct vcpu size to one page,
> there also seems to be little reason the fiddle with 1 or 2 page limits.

Before writing this, did you check the recent discussion around the Arm
side change going back to a single page, and the moving of this code to
common/? Any ...

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -342,18 +342,24 @@ static struct vcpu *alloc_vcpu_struct(const struct domain *d)
>  # define arch_vcpu_struct_memflags(d) ((void)(d), 0)
>  #endif
>      struct vcpu *v;
> +    unsigned int order = get_order_from_bytes(sizeof(*v));
>  
> -    BUILD_BUG_ON(sizeof(*v) > PAGE_SIZE);
> -    v = alloc_xenheap_pages(0, arch_vcpu_struct_memflags(d));
> +    v = alloc_xenheap_pages(order, arch_vcpu_struct_memflags(d));

... non-order-0 allocation is at risk of failing despite there being
ample memory available, if there's heavy fragmentation. I'm sorry, but
without a much better justification this gets a NAK from me.

Jan

