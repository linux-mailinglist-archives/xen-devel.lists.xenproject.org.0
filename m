Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 727B39EB264
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 14:58:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852454.1266241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL0kE-0002g7-CI; Tue, 10 Dec 2024 13:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852454.1266241; Tue, 10 Dec 2024 13:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL0kE-0002dZ-8y; Tue, 10 Dec 2024 13:57:46 +0000
Received: by outflank-mailman (input) for mailman id 852454;
 Tue, 10 Dec 2024 13:57:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL0kD-0002dT-5Y
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 13:57:45 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba14e0d5-b6fe-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 14:57:43 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-434a2033562so50578275e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 05:57:43 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434f5774454sm84508125e9.13.2024.12.10.05.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 05:57:42 -0800 (PST)
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
X-Inumbo-ID: ba14e0d5-b6fe-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733839063; x=1734443863; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mexqWB4ToY1R/WZwNIYERX0OQh2A1Jz2DsN4cZ8rjSg=;
        b=UvAVDN0q2ujrXIxkK1kmbIh8iNqhnND0dxw9yNlcjozPYqpoThKzz4DAeOJ7FVRzlB
         nsuvU2iNkFS/Iu09myt89J5byIRD/OOOud01GdyKmR4wG1kORDcNnwCNHFBXPPfggDYi
         UdqJ9EZ8hggJZd4eB3O4K+QQgOvuNS+6fokcvX6NHhmIeBf/LeAPj9ug2+TN8rorbOSB
         cG07FEGpq73q8ni3NBWanGBQOgWkodWk7n+OS9yeXKe5XOMYias2UyZSZvR3f8IBb+C7
         JWH9tMniAlnPvF7S9VzFqnW4dY2PRkhga0e28NAZh6rp7aUClTb9ZU0gx8fs/pBS933y
         o4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733839063; x=1734443863;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mexqWB4ToY1R/WZwNIYERX0OQh2A1Jz2DsN4cZ8rjSg=;
        b=uuOCiJwjUMqp0IWmS3QFd2OAlZhDimjpw0YXhZbAVlCWt30e2k/ANFKRgkEWZVwEbB
         uomRntirBd8sdjxqzSxurqR9kz6LwbeyH7uy3hzGiy+dFi0O6kuyBWJllRaqrXx4Pz0g
         f8o074ONzHF1t+Ko1Py4C9DTpW1p/hpguSxxqEONj1uM2htOobXYaFR4bvK1veUxD1io
         TUuq8quVRPwPR22A2LCkIGxseT6GK/G97COla7/TlXogdF3+hyzHUlZo4pBIVI+Nfk9w
         ZnymUjy1pSmguvJQZ1v0EwvWk8grc8YcZi0XTIBA4w8CA5W7cwnPQ7mfbjpcIWs2vS1n
         XFag==
X-Forwarded-Encrypted: i=1; AJvYcCVyUPJ0b1rkPwXsQBXJFG64Gdgni5yAoSmbdeBfqY6itGEKc9KDoS5vptg6bY3R4FWZ2ce3f/7dzPc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPYaDsY1UpcLWCrKsL6pYk9hgJnt59C+CJjPCnyKG6+tlHMuAd
	kVmsjBsovNb8R0Vyoz3pw7sRZmxRVE2OfJtRqQFAGjpVWCbTYHnwyRCRHo9XfQ==
X-Gm-Gg: ASbGncsb1ppOy0xJtqN+WT/GBrnr2Ru6RZt67TZe/EiXrvfhImTOOcA/2r7dpE4fTbc
	CbOevHOPblnCK4ekMLVm79ZtA2ahqdMb87VSaye2xRgdpzQk4Qk9xvmqVTU/Df+8ozfr5B2HXtx
	w3HedICiWMTOQZv6gZKWz59a4q+OHsJpoGcvQEdp5Pg3TMEElMwcx3xDRH3xNYC3Va7lnzCgLqT
	MIPrJeL0RHoX05RvsO0NmtGduWwGqD1JUCfXzvNRMmDk1If/prLegPg3mEXBwzA1lWeMzTcukcI
	/BKseEIuXCEMvzRxrUj1z8I2eBFWPMUp0Den2Qh0yWxlbQczBmJEaVk+b1ZLofthRnHz3E6LXKr
	mnf/pMXvx+g==
X-Google-Smtp-Source: AGHT+IGolCklT8SvwQB74vZ9/3UsfKXlQmL45/6LYQlnpxh+LVG/V1QWUQVLDMWKDB+4Oukcevn5Bg==
X-Received: by 2002:a05:6000:1fa9:b0:385:dc45:ea26 with SMTP id ffacd0b85a97d-3862b33e10cmr11153970f8f.12.1733839062714;
        Tue, 10 Dec 2024 05:57:42 -0800 (PST)
Message-ID: <32065c58-ca83-4a18-8831-6044da2377e9@suse.com>
Date: Tue, 10 Dec 2024 14:57:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/35] xen/domain: enable max_init_domid for all
 architectures
To: dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-11-e9aa923127eb@ford.com>
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
In-Reply-To: <20241205-vuart-ns8250-v1-11-e9aa923127eb@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -65,6 +65,9 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
>  static struct domain *domain_hash[DOMAIN_HASH_SIZE];
>  struct domain *domain_list;
>  
> +/* Last known non-system domain ID. */
> +domid_t __read_mostly max_init_domid;
> +
>  /*
>   * Insert a domain into the domlist/hash.  This allows the domain to be looked
>   * up by domid, and therefore to be the subject of hypercalls/etc.
> @@ -815,6 +818,12 @@ struct domain *domain_create(domid_t domid,
>  
>      memcpy(d->handle, config->handle, sizeof(d->handle));
>  
> +    /*
> +     * Housekeeping for physical console forwarding to the domain.
> +     */
> +    if ( !is_system_domain(d) && max_init_domid < domid )
> +        max_init_domid = domid;

Yet this affects all domains, not just init ones. Either the variable
name is wrong then, or the updating logic needs adjustment. The comment
in the earlier hunk suggests the former, yet then this is a behavioral
change for Arm, correctness of which needs explaining.

Jan

