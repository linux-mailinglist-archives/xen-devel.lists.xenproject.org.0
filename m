Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF80DAD2F8F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 10:11:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010577.1388708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOu4K-0006Oc-Jp; Tue, 10 Jun 2025 08:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010577.1388708; Tue, 10 Jun 2025 08:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOu4K-0006Mm-GK; Tue, 10 Jun 2025 08:10:52 +0000
Received: by outflank-mailman (input) for mailman id 1010577;
 Tue, 10 Jun 2025 08:10:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOu4I-0006Gp-UB
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 08:10:50 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68cea739-45d2-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 10:10:45 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a375e72473so2570134f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 01:10:45 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a532435fbfsm11682508f8f.64.2025.06.10.01.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 01:10:44 -0700 (PDT)
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
X-Inumbo-ID: 68cea739-45d2-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749543045; x=1750147845; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qwWWPJTWMaorfeOcISTR/qpqWCjDp0p6zk5YlMsAqlw=;
        b=eiG/mubAmZBTfyCvUisDEixKFu8wTRY8vMcXqEjW7vHcGyvD9wtQSX5hQDsKbuW3nf
         oxs5qHDkLRYRVlT9U6yY6/j4OzBgnQoBXfwJpfYJ1czaXo5LeCJha3AoNMy+jkUhQF6m
         H0gYpwzT6a43yRvUN24qIeKcV9isx/Q7z2UA4uAVEuTGuG1DjXQ7zTxExWNAkIvf+03S
         +jrIHWhSI+BqSjAOFOC8v479JzKZqycEuEHIa5RqKWQYjp6evqutheMPdvnU1oPA+s3x
         cNQ1tFPh0x339nluQJOJ3oO8Sl6mFQGIndHkdFMXSjJm9LZQe1gJrqfe8xNEvmwtZqgY
         koYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543045; x=1750147845;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwWWPJTWMaorfeOcISTR/qpqWCjDp0p6zk5YlMsAqlw=;
        b=K4OkAEB3E7oIUXj/c0xIMCPw7PvFJ9CBEMV6PeWaZ76RvOtnz2eqkHmyGa60QxqXSM
         aNDNs4NSHL3Qx1RbYFY8ZLaQ9qCNKaJ4yjelu8Dt09i9xxJ4dL2i+aawygZAvjCEonJ4
         zJGMp7kEVQeJC1Nz9BTcETNBPYek/weGpctMX9wled0g3LV85BWt/HEzDCfdEU/ZagpS
         7Jp9BtfXBVfT9wdUC6/b4j8Dj0zifwG3HqQ5c8XWBzOAByWrk9TjBYyWHz2wYdvNUXNy
         Iu0Swaxa7ZE28H9+fZN9nzkC1ISwci52jQ6A2pdHPlV3ZNyY0PrZco5B4O0BpnOCWWLt
         wmMg==
X-Forwarded-Encrypted: i=1; AJvYcCVowQ9XtcX/cc1jjCdbWLJKmwIHkNZEsQzPKPD6Mwv+pti5ct61h0Mf65FMXm+bJ99dyBB9/e86cb8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOdb9lXf4sD/g7fI1NqWcOE77xxwwMHjgzFqAmjFpN4iwUZ1J5
	2Z2eHiQFjbKj1e/u7OL56K0UoMWF6ThDI2nw7V9RujRw4uZOvLt6hZn6wYR428ZS9A==
X-Gm-Gg: ASbGncugK9Gvwgtx5U30T6TMYN2MItbSLIyTlVVurpV45PnLQwkoTqznzFYN7y6Kh8O
	ccwNB4I5+bD959AE6h1J8C8o6Wtkf6zQlHVCeDjpXT6xzCVJdHIfu/8+hJoDW2LGUzki0qq7i56
	13lrDCMFpfkSrp0LBrqAVhautfmAXgTOJ3r/u4EI9LzCd/uCGGlh6nCTNh+VWRsb61Vr7xARg/P
	jH6dTE+kxlvexxbDbqf+Aj+qx5kteeijTi0Ye0uKqIwfJwkaFCClxwGXDumTCi50fNrtrKwwim2
	RfJmW6ugUALny+CG/QCOHkWAxDrfp6hiqx/pvrdqZviDmdeZqI6BpTfh4DGcFriozSdSmQrlUpT
	3GQiL/Nat+fbLtfU5gSf+HGsKNmJu3GYHp5x+qPx0GKDKRbNYhWVG8nI4kLYOaG2YKjzGq7o9My
	KWeS4NSsHsvm5f4TWaP4gR
X-Google-Smtp-Source: AGHT+IFIx3RdLabpI6UPVGW7/0QYCTzeLAx5Vpc0vRGyta7nj57QqSnHqcvxpM4TUFX0L9fFcHPIng==
X-Received: by 2002:a5d:5f8f:0:b0:3a3:7bad:29cb with SMTP id ffacd0b85a97d-3a531cba7afmr12547474f8f.52.1749543044792;
        Tue, 10 Jun 2025 01:10:44 -0700 (PDT)
Message-ID: <db9d23ee-9115-45db-b428-104aeaabcb2a@suse.com>
Date: Tue, 10 Jun 2025 10:10:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/console: group pbuf under console field
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250606194937.2412579-1-dmukhin@ford.com>
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
In-Reply-To: <20250606194937.2412579-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.06.2025 21:49, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Group all pbuf-related data structures under domain's console field.

Fine with me in principle, as I was indeed wondering about the lack of
grouping when the sub-struct was introduced, but ...

> @@ -654,6 +648,12 @@ struct domain
>  
>      /* Console settings. */
>      struct {
> +        /* hvm_print_line() and guest_console_write() logging. */
> +#define DOMAIN_PBUF_SIZE 200
> +        char *pbuf;
> +        unsigned int pbuf_idx;
> +        spinlock_t pbuf_lock;
> +
>          /* Permission to take ownership of the physical console input. */
>          bool input_allowed;
>      } console;

... since all uses of the fields need touching anyway, can we perhaps
think of giving the fields better names? I never understood what the
'p' in "pbuf" actually stands for, for example. My suggestion would
be to replace "pbuf" by "glog" (for "guest logging"), but surely there
are alternatives.

Jan

