Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A252AE5C92
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 08:08:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023099.1399007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTwpA-0002Dp-1k; Tue, 24 Jun 2025 06:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023099.1399007; Tue, 24 Jun 2025 06:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTwp9-0002CL-TA; Tue, 24 Jun 2025 06:08:03 +0000
Received: by outflank-mailman (input) for mailman id 1023099;
 Tue, 24 Jun 2025 06:08:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTwp8-0002CF-ID
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 06:08:02 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 930a26bb-50c1-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 08:07:57 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-453066fad06so151935e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 23:07:57 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2f9:d2d:164b:59bd:2475?
 (p200300cab711f2f90d2d164b59bd2475.dip0.t-ipconnect.de.
 [2003:ca:b711:f2f9:d2d:164b:59bd:2475])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535eac8e0asm164433285e9.23.2025.06.23.23.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 23:07:56 -0700 (PDT)
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
X-Inumbo-ID: 930a26bb-50c1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750745277; x=1751350077; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=msz8tMbNWaI6lpFLJaHTLWRxd9pAkhJLKqkuuQ5T81g=;
        b=d3JqMrkmO9ak0z9WEA/jsa4lDpd7AV/rxCIlA1YWw3EHNy4H3F9+OWh8hWKVqVgrM+
         iEsh1IK8Rm3TdPGVGXP+bAIboN8KgVGN7FL6fSrJ9hELHWQEgJ1qZG+aZoZ1Iy0fYrt0
         iyILjQedx3WlLgNQGBH9Zht54CIPtf0gaNBQ4ijdm6RLhO9lraUwNSzX1JFObHYzCONC
         FpNsbHw7egd2+7uDKvpvahpfYDtdgK1Vr3ScZbTRkAOp0HOQWjX4EqFgTKdQ/HAbxwXY
         0/TjAHXlO0Cl4IxFGuVBNPDSMcmuUSESvNwQgGYjNf9nceSgNGkJZ6+sfTrEu4wdjMaJ
         pm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745277; x=1751350077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msz8tMbNWaI6lpFLJaHTLWRxd9pAkhJLKqkuuQ5T81g=;
        b=h0oz4vEADFfZdnZnlvxsBKbfGfsrv3K0GWDhUryX2fsAl+jtBEJCm1ckETC/MSNRa+
         NcSMtZwVMf9+ttJsBqwCn+qFAOj5n+JxDM6eel0aT/sXTxHQANlVx8IY+dO0wOHMldzS
         5U0h3OuLVe5zkoKsuSJd2XmDbm/SkRBM7U3ODgKpFyM3ChNiXGanI/uKo1TBthDdOOKu
         UbiUPThPAGGUV2P3H27d4W9JNFVOZ5GAhH6DhswTkMUoloXlIP2waKM9lG2ORlI5EyZb
         kZTPtjlTiZHASLwTVeNEy6Ura2D4xW/Z1zkPnoFuD1Dbg1j/5tIpeAezZ1H9pZtQFBTO
         pk4g==
X-Forwarded-Encrypted: i=1; AJvYcCWk77zWE1Edz6F4CjQAprukKWP8e1R7THPGVg+uH0Ti4ZZiW1Dp4LiREemI3AExzMlnZoHDd8N513o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxq4c1NRhdMYd2iAiOdO4tnKHQzox+Ihpto0j0nN283JAM2sI2b
	KKPn2L/Tcxc1faapFE2Ceu4SLMHtrBKBM25N762YJIQgz+MKHKkqaPPg9szOcFCZmw==
X-Gm-Gg: ASbGncvV3QWZTADeVWnp5cuxJUvsSztdfiOaQ9P7oLK6EIyHLxq5J5qQnWH7kzRxZnx
	D5S3611FgJ5G7FlDzV/Q+QpG1UzLTFc191uTn/TZn++sYbNq/RXDaLkT6HzQFC+gAtD77GxZG/k
	Bu5hbkbJplF4WWAnNhi1225XLyJen2Sw/yaE2sdsTZQkDYLQlQEEFxezHga69XEDnRiEb2qp7bF
	mIy/uOdIFLP9UU/3sR/1gjmuPSaKz65EMuVR6aYLIanU0dRQ7Kwuwym1hiPkm1vFBIgOqgLKUhO
	PYnshl7RUdTpTM9pm9bwjMpaszHw3Q2y9yfXjyC4/s806h7rYfRkfb/YdHZNRwHEJwd6Pf4aVlh
	4nmyVeuMk7yUsRCs0ko9ymsIFjs5rMfmOtUWCLSNdnS8SBJ/BsmABI1mNKfZPN+fLd4ZW1Q4tTC
	ALGQpsm+jB25BK7HheiA==
X-Google-Smtp-Source: AGHT+IEiPPVo52xKGNgs6VhbRDPtNhgjrTWfgmq+zcfDLx97hMmrNcoOXDIgnNHefMX8ma2W1yhNJA==
X-Received: by 2002:a05:600c:a209:b0:450:d00d:cc with SMTP id 5b1f17b1804b1-45365392622mr82554835e9.2.1750745276980;
        Mon, 23 Jun 2025 23:07:56 -0700 (PDT)
Message-ID: <93080cb5-d00d-4c58-9efd-c377343eb165@suse.com>
Date: Tue, 24 Jun 2025 08:07:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] xen/domain: use get_initial_domain_id() instead
 of open-coded 0
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250623182721.194238-1-dmukhin@ford.com>
 <20250623182721.194238-4-dmukhin@ford.com>
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
In-Reply-To: <20250623182721.194238-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.06.2025 20:28, dmkhn@proton.me wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -492,7 +492,7 @@ static int late_hwdom_init(struct domain *d)
>      struct domain *dom0;
>      int rv;
>  
> -    if ( d != hardware_domain || d->domain_id == 0 )
> +    if ( d != hardware_domain || d->domain_id == get_initial_domain_id() )
>          return 0;
>  
>      rv = xsm_init_hardware_domain(XSM_HOOK, d);
> @@ -501,7 +501,7 @@ static int late_hwdom_init(struct domain *d)
>  
>      printk("Initialising hardware domain %d\n", hardware_domid);
>  
> -    dom0 = rcu_lock_domain_by_id(0);
> +    dom0 = rcu_lock_domain_by_id(get_initial_domain_id());
>      ASSERT(dom0 != NULL);

For both changes above you're introducing a subtle (largely theoretical)
behavioral change: In shim mode, this assertion, if we somehow made it
here, would suddenly not trigger anymore. Similarly for the earlier
change the return path may wrongly be taken then.

> @@ -2479,7 +2479,7 @@ domid_t domid_alloc(domid_t domid)
>          if ( domid == DOMID_FIRST_RESERVED )
>              domid = find_next_zero_bit(domid_bitmap,
>                                         DOMID_FIRST_RESERVED,
> -                                       1);
> +                                       get_initial_domain_id() + 1);

This imo is the worst of the changes. get_initial_domain_id() can return
non-zero. In that case we still would (in principle) want to re-start
from 1 here.

Jan

