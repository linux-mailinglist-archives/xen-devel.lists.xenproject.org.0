Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EA2B01B70
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 14:04:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040826.1412126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaCU2-0004Mx-8j; Fri, 11 Jul 2025 12:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040826.1412126; Fri, 11 Jul 2025 12:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaCU2-0004Ky-4d; Fri, 11 Jul 2025 12:04:06 +0000
Received: by outflank-mailman (input) for mailman id 1040826;
 Fri, 11 Jul 2025 12:04:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yw5d=ZY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uaCU0-0003tM-HL
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 12:04:04 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 234f65f6-5e4f-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 14:04:03 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4538bc52a8dso14477025e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jul 2025 05:04:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c3019ea00sm7896543a91.34.2025.07.11.05.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 05:04:02 -0700 (PDT)
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
X-Inumbo-ID: 234f65f6-5e4f-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752235443; x=1752840243; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=plEoU/yN3l31hY/ZjbqmCQQJ66pa5cIeezrAybC0pEM=;
        b=TXvWRynDXlzIaGXbZmLKi1KDvIlzCOMeDesc/UID4CFMm2x1N0TckJaPI4czWfHkCg
         r5bg8GY6cqspgugbCtmPyTXSPkXV0mm/cUhinhBuWkkcw6s7WsmDd6/N5jnn6/2t5uTB
         AEDNV64zESnBJLEqF0BTPbs+Lhx5pQv4fGYyVWvPi7J4NTyk4IHU8hQV+1Wz+u972hDz
         FOsSjo4PBZu/FPRnBdFkRlnhZoLzbkQH3sVwk/pN94PWPcPH6JsRx6GbWwtF8d6zYmK4
         3y09AYEi5f/A9AvVdTca3MdlODFj8G2C7oBz8WMZZADrmf9j/YBM//fjK7AcfAHXDg3M
         uUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752235443; x=1752840243;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plEoU/yN3l31hY/ZjbqmCQQJ66pa5cIeezrAybC0pEM=;
        b=T4XraV9+jIivbp90fkwYnJ+BR7pAHyHJ2neXJOfoAS7U6DSJPYWRmorpU5/THjtsRV
         UMokjzx7QCCY6PO7apuUjEiX2FLcQ9YdTqyIrYEZv+aGpoGw2xEZz10xtZxebtUK2c8O
         5yM8c1MIZqgKx5Fq9sIqptuErGFzZ65tMGa2NfyRESG6xTtofYrjZ1fmBe6zTbS8UpVt
         ZnPxu/YQ0lJKNiPvllTgo5bTVwKVnCiPgF/6tI4n1JGVIhQvlYkBAJhPKS4PNsLEaZV+
         ElDMew9JfFgFwNBeG0InPlM5kSMN3HBQIHGWbpxgd8WSAKpNHXS/nWZykmi+WB8CDglh
         Y1KA==
X-Forwarded-Encrypted: i=1; AJvYcCWPfQ1Cv7Is9H6/xz2ksCKQaIdE5BUMBwijPfzdM1gzQ+E5g278Mr9nFsUw5/4KJH/mrXPDvZPnwsQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJJMTf9kkWNFd0I62yihzvGmd8u23sG/XI44YwSFZpl53DPobf
	wZAZOB9kcYd/i7TxO6WGseTWjlrZ008iP280TmgBmthHEA/87OFfi2F7eNkZ1gisVg==
X-Gm-Gg: ASbGncvAEMX8I2qYSJZzKkwvQnaUI3MKRw/up+2CS2cDVtrPE8ANIskC9VPNLVfV89F
	yS4I74K9EqYdwr9lGA+MS7j+SREEyiJbAFMO2atXDANZB2Hz5tv4soRvftism6H1ftL9szIrGMh
	Nfweb0QcvuMUh4uHeD+eBXYGhIxbyJbapCJr/+x/B5zBdpzdynQjxKjPwiOH+vZ4/yAHMOF9pwS
	XOjMQK7zrYIMBCXIdZeAjZ60MPs8dPfFbGoKosYEx1duaeOtU+c8C9KEg/WoQIWfcSvsfJTNPao
	q+uG3j9o9uOGE3cJw6GB2NsK97j4l148QoM8jG04OXk/PHy7nHqnesqOBwrwFV/Nztl3tQ3vku2
	LzGgZCoa8HagYiDTNpyj2Bwis+xx1Jd6kMF7cp5c/s4vtwpLxT81EjOjIAkqNpM2w5JVevR538N
	KkHSB2H4GdYx5ABMoKWA==
X-Google-Smtp-Source: AGHT+IG1ydweD6zjTxwa19f7zfohfN9en7bh4dax4ak8vlRDiRXMeCbyNYATQfUNDyRWxjHRQqUxYw==
X-Received: by 2002:a05:6000:2c12:b0:3a4:eef5:ae26 with SMTP id ffacd0b85a97d-3b5f18e7cb4mr3053703f8f.55.1752235442782;
        Fri, 11 Jul 2025 05:04:02 -0700 (PDT)
Message-ID: <f88e729e-5373-473d-904f-c878bd8ce158@suse.com>
Date: Fri, 11 Jul 2025 14:03:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] misra: address violation of MISRA C Rule 10.1
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <41538b6b19811eb74c183051d3e7a4fd216404e6.1752232902.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <41538b6b19811eb74c183051d3e7a4fd216404e6.1752232902.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 13:43, Dmytro Prokopchuk1 wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -773,7 +773,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>  
>                  nrspin_lock(&d->page_alloc_lock);
>                  drop_dom_ref = (dec_count &&
> -                                !domain_adjust_tot_pages(d, -dec_count));
> +                                !domain_adjust_tot_pages(d, -(long)dec_count));

Here and elsewhere I continue to think that we would better avoid casts
in such cases as well, just like we try to minimize their use everywhere
else.

> --- a/xen/common/time.c
> +++ b/xen/common/time.c
> @@ -84,7 +84,7 @@ struct tm gmtime(unsigned long t)
>      }
>      tbuf.tm_year = y - 1900;
>      tbuf.tm_yday = days;
> -    ip = (const unsigned short int *)__mon_lengths[__isleap(y)];
> +    ip = (const unsigned short int *)__mon_lengths[__isleap(y) ? 1 : 0];

If an expression is needed here, I'd suggest to use !!, as we have in
(luckily decreasing) number of places elsewhere. Personally I don't
understand though why a boolean cannot be used as an array index.

> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -315,7 +315,7 @@ static int queue_poll_cons(struct arm_smmu_queue *q, bool sync, bool wfe)
>  
>  	while (queue_sync_cons_in(q),
>  	      (sync ? !queue_empty(&q->llq) : queue_full(&q->llq))) {
> -		if ((NOW() > timeout) > 0)
> +		if (NOW() > timeout)
>  			return -ETIMEDOUT;

How does this change fit here?

Jan

