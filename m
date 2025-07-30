Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CD7B162F5
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 16:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064082.1429821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh7wf-00082d-9X; Wed, 30 Jul 2025 14:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064082.1429821; Wed, 30 Jul 2025 14:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh7wf-00080Q-6H; Wed, 30 Jul 2025 14:38:17 +0000
Received: by outflank-mailman (input) for mailman id 1064082;
 Wed, 30 Jul 2025 14:38:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uh7we-00080J-3f
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 14:38:16 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d20d80d8-6d52-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 16:38:14 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3b783ea502eso846493f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 07:38:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63da565bsm2252851a91.4.2025.07.30.07.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 07:38:11 -0700 (PDT)
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
X-Inumbo-ID: d20d80d8-6d52-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753886292; x=1754491092; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1g1wYLJ0cQlh9tazbbUxsdBWDeGfp2/NDZbLH1NSlc=;
        b=V87wF9xyWF3xy3Z/evM2F5GvyvYXGuT5x6R1uDGLiPzNWIQnjbOaY0zjbiVcEJR+eX
         TgOUUXXaMlfWG1ZtS975BdBs9YvBERbcY9WI+Yf5O4qQZCMXMWUFZceL6JY0Jxau3kGp
         LDazMdmbWcQ/7rDd4/GDWPXHiDYq+4sL1C8C/atc1NzV2lu1Glkwvl43TSrecGev5b6l
         1VZ7wAs4uUVHtjIFpQSZeFfnwV/59euu+ww4ioKAJ2cblg4Z03jZ6yTYPxL8GaFMYifa
         NaWK8rkPL9dv+FuoPLLLNxd8IT+dZm/pEKLTc2RB5chnZ9W9l5CQnPWD2SDMvo4Kt+Qx
         J6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753886292; x=1754491092;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1g1wYLJ0cQlh9tazbbUxsdBWDeGfp2/NDZbLH1NSlc=;
        b=OrXo17XC3zd54lUYLfQ0PBy8S07kdbWYugzu6npAN4ukPN3/K4GZb6Sody9pFod6fI
         7sLVMgKVkkBlNTIetdLdNjenyxq90NycfQCdhHDIAXzRk67Tzr+jk103w9KGOKU5NaHv
         8OSmjzlEl7cCydZJir/QRX1GcseRMKoWVvHJs+uMAhS9FZTVnI/c7j3JE7Hlz+2sKZfv
         nWOFUPcdUY4iV2OWJ0TggIEiud5SskZ/Lcs21ISXTlocIo0pJCtrx3JZt3jwvLQfDWrY
         LZbojxp+Tt+NZbOFNoTlRvN1yFMJqyz4emiJQffQgS9RBcgzMCSceW8m9j0LipNxbgv+
         0qsg==
X-Forwarded-Encrypted: i=1; AJvYcCWRUpjttV56dTrPLGpfEvkYKpiTK00q3Ot4vYa7Ez6T6hJbnTXGu6rkLAQ0y8NHJiTvNkENc4AhYEk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1zgI4pGKtYKhybvtdTQDT2YuB69lbW+R5iQ3FEwW7q/o2enah
	gHi4Xd/wajy/2YAYToCkDfqhhCn34PvS+eSr3mZjmJXFZU8Ns49Sy3FCHz+1XTlYrg9CO+GB2c0
	KSmE=
X-Gm-Gg: ASbGnctoVTthZJ4BN8jQFmFJNpJWLOFQ+A3E82k0zpI28QECDdzoUTOIDlRFBTP/FTp
	T7njPInp1+0fHhS2zUuPXaASPHosJcf6pBGZJ6IDNAXt+KTGA/DtBlwOq4KMXEN/w+VQJN2cN2e
	uOSsZ9mJIcWeQHCHn6pEK5yxsKGk0lZBvpHf1paNNdzxa7ajP3QdlsLy7D3fbqvPmZvl0K+kOYh
	rCmbNKUFwSwIWz+GC9CmS2HUxjoachFry2udu5EUSa2OWxpYZjP5f/3p6gEVU5tILuINXCgUcIP
	cWR1i40mw9Xgfdf7HBf3gOlG9hgx5d/lp/tSwqw/R0CJqQmMQhar+Mj3wH5sgWkB5ezuycGs127
	4+APvS2W15krSCs7jIUF6uXKfHcKFuAfv9JPdH0tx+SYcREfDgBPuQHrBb8TD+jWQLcrzjBqh/w
	8naEa4z1g=
X-Google-Smtp-Source: AGHT+IHi1sXwZ3+YFKYAJOCOI2kCaRT2QqJLiyuHic+thrfgcYGNXUAoFcgy+dGvJ4IBuJ1pC2A0qQ==
X-Received: by 2002:adf:f009:0:b0:3b7:8f49:94e4 with SMTP id ffacd0b85a97d-3b78f499706mr4329082f8f.7.1753886292248;
        Wed, 30 Jul 2025 07:38:12 -0700 (PDT)
Message-ID: <91a50d1d-44fd-436c-a5a6-7641a7f5cd1a@suse.com>
Date: Wed, 30 Jul 2025 16:38:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] xenstored: use fread() instead of mmap() for
 reading live update state
To: Juergen Gross <jgross@suse.com>
Cc: Julien Grall <julien@xen.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250730122305.4050-1-jgross@suse.com>
 <20250730122305.4050-2-jgross@suse.com>
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
In-Reply-To: <20250730122305.4050-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2025 14:22, Juergen Gross wrote:
> Mini-OS doesn't support using mmap() for accessing a file. In order
> to support reading the live update state from a 9pfs based file, use
> fread() instead of mmap().
> 
> While adding the offset member to lu_state, change the type of "size"
> to size_t in order to avoid problems with state exceeding 4GB.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> V2:
> - move to start of series
> V3:
> - change offset to off64_t and size to size_t (Andrew Cooper)

Wasn't that meant to also cover ...

> --- a/tools/xenstored/lu.c
> +++ b/tools/xenstored/lu.c
> @@ -27,9 +27,11 @@ struct live_update *lu_status;
>  
>  struct lu_dump_state {
>  	void *buf;
> -	unsigned int size;
> -	int fd;
> +	unsigned int buf_size;

... this field?

Jan

> +	size_t size;
> +	size_t offset;
>  	char *filename;
> +	FILE *fp;
>  };

