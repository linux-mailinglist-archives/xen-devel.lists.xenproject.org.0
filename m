Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07980CD91E5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 12:32:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192519.1511689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY0cH-0004Yf-Jp; Tue, 23 Dec 2025 11:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192519.1511689; Tue, 23 Dec 2025 11:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY0cH-0004Vb-Ge; Tue, 23 Dec 2025 11:31:49 +0000
Received: by outflank-mailman (input) for mailman id 1192519;
 Tue, 23 Dec 2025 11:31:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7uuJ=65=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vY0cG-0004VS-7r
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 11:31:48 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2c1fea4-dff2-11f0-b15b-2bf370ae4941;
 Tue, 23 Dec 2025 12:31:40 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-42b3d7c1321so2903889f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Dec 2025 03:31:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea226d1sm27910838f8f.13.2025.12.23.03.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Dec 2025 03:31:38 -0800 (PST)
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
X-Inumbo-ID: f2c1fea4-dff2-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766489499; x=1767094299; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YrD5D1qBJxXCjf9P/QjB9PpkOYOEGgNyFkp6U2yZlXE=;
        b=KKbeBNc0x7ix2RefNu+LvQxc7jqLYR5vgkOKDDtfIoGV4zTPj1G+AQ07L0NCgmt2Ey
         88BI3t+qR7lZWlUnwcHRcloynDVl+DvrWDi7kgJE0KhKkHL0xNFO8L8FQ4ENFpbWTIZX
         rhXwlHV2EXAzq8b60fYgi5V50gex71SYXj6c8UWPzBoDZlZT4vjqbA15Fb5h8nNnF4t3
         15Mt33gvgcQH+PUfi+dRUQ/nhHq82ZAMLkHSWYBSQvvxKjAUvXMCnpG8hFU3q7Gpg4Fk
         zWyYzHrDPuw0EV8I26Q930cdJu8WcmJxkmD49WcDzfRWab1tarunBqgrg5RX+YWTm2EK
         Gdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766489499; x=1767094299;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrD5D1qBJxXCjf9P/QjB9PpkOYOEGgNyFkp6U2yZlXE=;
        b=kYEQvoCWCjLTpa6Y/DGm6zBoBYIVQutblsd8CFQ7Ivj8e2JiB1O83cLxRxLRJXv8Pg
         nNksTUnwQ+R7H/g+33M5XBSxfYqnFpKRcdOoquIhCXUWCdmwCuUyUd+7Kfx1ZaJE1Wl/
         MCsP8dRaBfZLLU1Gn4ybbnYgu+2HpKpbdsKHC8sG6rTZNoWwbd1Vn0PSMbEETNlLbw/P
         FS5LvTY4r2scA+4GjY2Yu3h6a2XEtaELqPsRrt/VEKinTkY2lSTCfIAOSzzyzXFQhxpm
         B+2YeWT7glK4YRYeantwvflMxhzJIauCsRpaetrKVgIbWi3xE2BvPzmhKUwQ8/D822wn
         SkIg==
X-Forwarded-Encrypted: i=1; AJvYcCUeRWEOP6sH9PQIsjvafiYGxAJ+WMDpzG/GkcaOzm6bWgm6keXCFoHyv7MW0qR0w5bANAokkM/UtqY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrQ/jyHF1G9OfJSHRu6uak4k70/bf8ksUWu+IVvuX/NQLWl4TC
	v06CV7VcRxAp4lIqKTLbSyMsZqgs4YhTp3kHL5xiyDBKiroBk2La7/McXcxSQp4tIA==
X-Gm-Gg: AY/fxX6gTJZI3VpWoxKvrFD8TPo7p/rFksawD6LRCO9Z6ty/uAKs3ObptYQx52T7WG2
	aTmdmZZPCE6vT/JRzGBR/coWO7+O9ZrzERcwl9OnoK8AwnJbeBrOqFmKAtzvh5ZcJm60fAsYImY
	fp/h9OyoaY6yAoY37Dlbd3C4t+W/XGO9H5Ajn/0VrGhttb853Tlxw8tgACI1GXWHxBLOeRUYbh9
	YBgoNvqkYolJe4HypjJTRKJ+PAhXk8cv6FMMMi10IBa8W5QPvSI80Ft/wJp/KtrUW0kVSiaX7Ze
	hcn4gIHQsq0d/S9c1WM2pMoW8ryY3shxaAdFkyvXyed8gjAT3ps5QOYtCyTWARftVGrw1chMuOa
	ISYNW8Au/OqN8J6d1w1WvGxyyTgkrxoNzrKKjj/azd96iosgyExvntpdlBGSDaepOAnz1WoRZlo
	GFSc1J4DQuw/FvJ0KIAtXSraH57R82AuALotGLmQJxOu0nE5fRAC90KY3XJCT3PjDcSJXnDaqx1
	xs=
X-Google-Smtp-Source: AGHT+IFV7hU0M14Wzl/iDYD13nQfQEivkGgegMG9bwDnr2rkQrlCLwU+GvuLUKgnrRsQnSkQpyF+hg==
X-Received: by 2002:a05:6000:1844:b0:430:fa58:a03d with SMTP id ffacd0b85a97d-4324e70ef05mr14497561f8f.63.1766489499092;
        Tue, 23 Dec 2025 03:31:39 -0800 (PST)
Message-ID: <179e8f57-2249-4eb9-9512-c315f1e8e5f4@suse.com>
Date: Tue, 23 Dec 2025 12:31:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] xen/common: make {alloc,free}_domain_struct()
 static
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766404618.git.oleksii.kurochko@gmail.com>
 <07e8305e7d9730f65822f43ecefb7543b08f764b.1766404618.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <07e8305e7d9730f65822f43ecefb7543b08f764b.1766404618.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2025 17:40, Oleksii Kurochko wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -690,6 +690,27 @@ static int domain_teardown(struct domain *d)
>      return 0;
>  }
>  
> +static struct domain *alloc_domain_struct(void)
> +{
> +#ifndef arch_domain_struct_memflags
> +# define arch_domain_struct_memflags() 0
> +#endif
> +
> +    struct domain *d = alloc_xenheap_pages(0, arch_domain_struct_memflags());
> +
> +    BUILD_BUG_ON(sizeof(*d) > PAGE_SIZE);
> +
> +    if ( d )
> +        clear_page(d);
> +
> +    return d;
> +}
> +
> +static void free_domain_struct(struct domain *d)
> +{
> +    free_xenheap_page(d);
> +}
> +
>  /*
>   * Destroy a domain once all references to it have been dropped.  Used either
>   * from the RCU path, or from the domain_create() error path before the domain

I think this is unfortunate placement: You put the two functions between two
other related ones, which imo would better stay together. I would suggest to
put them (and the ones moved by patch 3) ahead of vcpu_teardown(), or ahead
of vmtrace_free_buffer().

Jan

