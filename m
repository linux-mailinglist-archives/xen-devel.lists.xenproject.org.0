Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3DCA55142
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 17:36:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903895.1311836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqECG-0004Hv-SY; Thu, 06 Mar 2025 16:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903895.1311836; Thu, 06 Mar 2025 16:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqECG-0004Ff-Oe; Thu, 06 Mar 2025 16:35:44 +0000
Received: by outflank-mailman (input) for mailman id 903895;
 Thu, 06 Mar 2025 16:35:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqECF-0004FZ-BP
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 16:35:43 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09e0acc2-faa9-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 17:35:39 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43bc30adad5so5962755e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 08:35:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd4352eccsm54154895e9.27.2025.03.06.08.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 08:35:38 -0800 (PST)
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
X-Inumbo-ID: 09e0acc2-faa9-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741278939; x=1741883739; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sLWlZzEjhCIh49EMqQnQRG7DFmjtF0+CxltcNT03DiY=;
        b=b++nl6W1Fm8EUPgJ/LhmHVvrfMTD+mSM1BcybT/n1/S11UirhldbXg/hzUxMrQiM5N
         wFHzuN4XCxL7lxZz7hxQGVzzWZmUOvdy40ahb1KnnBFliNd7KBYB0NMqZp4CdVVgkW+h
         ub7vmzP6b8TnB2/LP9bnj6QmKSyE9LnFXhsG+YUzo3yzkDnFXxuixstoVe+yAbUs6yxS
         YjTTBt8gfZDfhTV6WC06dIEwxF407owU4x+NFfgpYJU0CYz6CqTOmxPVcXsndUFzBG08
         4x+4Jgvs5U++qtHxEQmA6CrDbo8c4D3L/CVkBdHF0ewryngGUSz2UwonijNgoO5cg25k
         w5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278939; x=1741883739;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLWlZzEjhCIh49EMqQnQRG7DFmjtF0+CxltcNT03DiY=;
        b=pReBcdP/PDFFP8RbHpefn9iqOOzldyQN55gLBCQtjJDMfYg3B1vJ2CxgdmY/jHH/3A
         WCJfHydxUkanSzsDkghoakOGahj8X9MKArBfvc3+vEQni8PAYDxD4euZarJF7W39/bH7
         Pfwr6aD6MGaELMBzzvQwM+v6nSe7PaXCqCyIJo//A9/d3s0JinQWeA8WxILkuSQthn0i
         wFcX7wNsJvqKniy+JYpm8GlfVeNMRj1w+P35mD8h6QfEubTZ/h0KjLnR/Cu4nuULhNu4
         UoHzi4NZIPrpGkhObT0EFwYK8VTthBxDfWbYylgquXJm5PRS4oZRPAo5gSnCHa1rjUdj
         hs4g==
X-Forwarded-Encrypted: i=1; AJvYcCW95fQLEVBu1Jt8ejCCCocxODjdAWD+Ug+WeBK07pW0rAVpfThqw0GQBtcprFQjGbWohSeqmDQQyL0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAJoT7/4a+f1uVbqDZ1RVE3JpL9bx/FfKTYYsHtZd8cm8C5ktk
	0lw2tNkOZzsS36LXAPcbJyuurBvc4z/hGKLsIFXPkqlUWBxjTtQxYrHsGXUyHA==
X-Gm-Gg: ASbGncs6+oXkovVbpDNlKxBaT2yIuPONyxcgVLsWDtz+kXrP0OB2OcRtzj2rPxl/4g4
	uNNonm/2w2kL111PPjjlI5hIN+OP9d35GvtPZ0t4sqnvv69IjWYHVR3V+yLKNLWnzHspoONGCWH
	PNZW7kiL5vCufrmFkj4MgHe2B//0eZ7G9xyOdwLOD4c688YSACpLGQQhAjQK23SlNn5Upa8fUAW
	ECDjG7i2sJIZk9Si+7BGVAd/D602pxhJquER+yo9lz4fm4kd46+Fq9yL4CHw6uN2PEwW9FEO7LZ
	vFdRdgTsicCu93mR9rcnQm2nG8xUM6xksCW+Zg5GT7fEE4fVZ+iGdgqKvBCWWlwvxuYJ1XfVrvR
	nqs155vR6wMaB2bDBjw+XLRS4Rjg5rQ==
X-Google-Smtp-Source: AGHT+IEldQBGkNarCl3zrJY4HBmNm3UZQOYq5A8QdGgqS823SQpR2K37l/nIm8MTeT2MA2DHlnAO/g==
X-Received: by 2002:a05:600c:5112:b0:439:8c80:6af4 with SMTP id 5b1f17b1804b1-43c5a63051emr1439935e9.19.1741278938944;
        Thu, 06 Mar 2025 08:35:38 -0800 (PST)
Message-ID: <6aadb0dd-8bfe-4c63-9997-8ded6a9faf98@suse.com>
Date: Thu, 6 Mar 2025 17:35:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/consoled: clean up console handling for PV shim
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250306075819.154361-1-dmkhn@proton.me>
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
In-Reply-To: <20250306075819.154361-1-dmkhn@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 08:59, dmkhn@proton.me wrote:> --- a/xen/include/xen/consoled.h
> +++ b/xen/include/xen/consoled.h
> @@ -1,12 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #ifndef __XEN_CONSOLED_H__
>  #define __XEN_CONSOLED_H__
>  
>  #include <public/io/console.h>
>  
> +int consoled_guest_tx(char c);
> +
> +#ifdef CONFIG_PV_SHIM
> +
>  void consoled_set_ring_addr(struct xencons_interface *ring);
>  struct xencons_interface *consoled_get_ring_addr(void);
> -void consoled_guest_rx(void);
> -void consoled_guest_tx(char c);
> +int consoled_guest_rx(void);
> +bool consoled_is_enabled(void);
> +
> +#else
> +
> +#define consoled_is_enabled()   (false)
> +
> +#endif /* CONFIG_PV_SHIM */

I'm sorry to be picky, but why did you move just consoled_guest_tx() out
of the conditional? Once something needs moving out, imo everything that
doesn't strictly need to be there wants to move out as well. Which would
leave just consoled_is_enabled() there. Then
Acked-by: Jan Beulich <jbeulich@suse.com>
I can certainly make the adjustment while committing, if no other need
for a v6 arises.

Jan

