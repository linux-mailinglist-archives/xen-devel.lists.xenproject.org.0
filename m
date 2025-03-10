Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E11A58EDC
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 10:03:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906266.1313724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZ2X-0001WA-BV; Mon, 10 Mar 2025 09:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906266.1313724; Mon, 10 Mar 2025 09:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZ2X-0001Uh-7s; Mon, 10 Mar 2025 09:03:13 +0000
Received: by outflank-mailman (input) for mailman id 906266;
 Mon, 10 Mar 2025 09:03:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sahL=V5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1trZ2W-0001Ub-3y
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 09:03:12 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cb67d98-fd8e-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 10:03:09 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso636875e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 02:03:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd9471b7sm136066705e9.34.2025.03.10.02.03.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 02:03:08 -0700 (PDT)
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
X-Inumbo-ID: 7cb67d98-fd8e-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741597389; x=1742202189; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gK7kVpDIOq3HwZqo56/VCxhWYDmn0+uWUzqZws8lHRs=;
        b=H0aERoqvl+sdiAMvOcCV40NTcjhNNtu+Rr9gSdFJx4hcPXmbiDNwo1L6p0AUaRhz0E
         u59NvSVm31fHvwWWdqZejCAixcHEiC4WKsyDT2FTM0Q1ej1KByYfbfC3G6WVlob+vfEH
         sVDP5FqdGeWbfkoalDfTBild0GoMqQ3D83GOBLRD46a6YOkk65YUaFDVB1Cwr6aEHDNg
         cT0XdUONPsrzHdcNr/fOf7sJ/Tjpw1Mfiikbz3zJAY6sI5VXWIfc4h75jbcOKoxN2Ot9
         y6QI8DPfpF2T++WcHaSw94oC4F9dv+Jq0Eqccq+f2H1RfPaC/0fGNrW+F5cTtIEms+M1
         r2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741597389; x=1742202189;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gK7kVpDIOq3HwZqo56/VCxhWYDmn0+uWUzqZws8lHRs=;
        b=gzMdzXvydr6jn3N5aCURahDURPJFroCozPyOz2LwR6ugjQJHRJMMmTTXduvmFTU0vs
         brbcUZBzu5S3/xLb8kMwwF0sMM1tscXBa/+/bzNrQJ7PWGHtAE9RroJ9hdJNc+f9aVhb
         x3gvon5X0PSmWJxt/+8QDOE5ra/s2ZzRKTVWPBLl/W5g0SVKEJVPdt9+4F0c/9b3QFwz
         XhPZaRDHpZ9AoFep7PFA1P9ZmtxNSwjXqQ2poafpyOqXEOR9I2f5MKxlT1J0PdS951KO
         wUjqug5VbZVMMVvkCs4un0Zxy9cidePEJAdh6NmP+B3vr0x5IbUPi3ubXJzutqgxcqh9
         mWgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz7qXmr+/JCX5FVHbW1pgHKfRzN4UkEE4SvF3StwQBLFvwxkqG6kHQlm+yDLZnX7ysCPpLmwnG3AI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/ki/BIf7aDaUw2a0H6Go1+LhQE5KCVoKe96+uGjHMR8spfAJt
	NaA11GMwe4xPGfOHNl4yqdabqztv5MDXCxwQfvCD/afrIFUSl8q5/zGMvSDJfg==
X-Gm-Gg: ASbGnctLy440uURyUKqsjB8dfjqC+wuZuqd6bjMIwXTmr/Nlc50pohE1z9EPTC3OUSl
	pQtjsh2lBWuCDWOM+eZIK7JZTUddPvwnZRooFjzH2NrMpsrvJpNHvxz5M+YYhVD1QQgCcC3N934
	NTFoVAoGTOdGLlQqV/Kk/Fnyu8Y/lVzXKlqJobQpkaSVCUMAbCaFINuZWCSq5pzFvk6saBMT2HP
	qI48BPUlR4OeInm+VH60Bfrm9R7oRrxrdj+0J5t4IZVkGwo3e0iVDVLBmq5o3JeLD7bqHx3CAKh
	1lpw0kUu28eo7z7ymIcN3W6k7bxRhz3foopaK2wUvwevxHXeB9UiDY58LaCRdjpAXRkNugIFDPW
	9t4J4cMxwf1kgCwZlVV2HHACy8GLASg==
X-Google-Smtp-Source: AGHT+IGl8UuBrwJOmPFb6OM2C+aGC5f/WTakA7J5YJGeZKAAPtsjf9CW8tkG26U4mlGqn9EdVvQPLg==
X-Received: by 2002:a05:600c:3543:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-43cec4c272fmr41091415e9.10.1741597388702;
        Mon, 10 Mar 2025 02:03:08 -0700 (PDT)
Message-ID: <813569bb-a1f7-42b0-a872-f6ecf4033880@suse.com>
Date: Mon, 10 Mar 2025 10:03:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/23] xen/domctl: Expose privileged and hardware
 capabilities
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-7-jason.andryuk@amd.com>
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
In-Reply-To: <20250306220343.203047-7-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 23:03, Jason Andryuk wrote:
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -155,6 +155,12 @@ struct xen_domctl_getdomaininfo {
>  /* domain has hardware assisted paging */
>  #define _XEN_DOMINF_hap       8
>  #define XEN_DOMINF_hap        (1U<<_XEN_DOMINF_hap)
> +/* domain is hardware domain */
> +#define _XEN_DOMINF_hardware  9
> +#define XEN_DOMINF_hardware   (1U<<_XEN_DOMINF_hardware)
> +/* domain is privileged */
> +#define _XEN_DOMINF_priv      10
> +#define XEN_DOMINF_priv       (1U<<_XEN_DOMINF_priv)

Oh, and: If we really need both constants (I doubt we do), the latter wants
to follow style even if all of its siblings don't (i.e. blanks around binary
operators).

Jan

