Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513F3B531CC
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 14:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120175.1465219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwgAd-0007Zy-Nt; Thu, 11 Sep 2025 12:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120175.1465219; Thu, 11 Sep 2025 12:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwgAd-0007Wx-Jp; Thu, 11 Sep 2025 12:12:59 +0000
Received: by outflank-mailman (input) for mailman id 1120175;
 Thu, 11 Sep 2025 12:12:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwgAb-0007Wr-Ex
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 12:12:57 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5df3fb0-8f08-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 14:12:55 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-623720201fdso1319012a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 05:12:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b3333e81sm122410966b.94.2025.09.11.05.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 05:12:54 -0700 (PDT)
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
X-Inumbo-ID: a5df3fb0-8f08-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757592775; x=1758197575; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CJ4QEto79CF5RB4ihut1AYj5dYYkPa+6FCfTnZrB3sQ=;
        b=fn0YLycd7wVyWgZ79gJ3bzVlu0zUkschKa4U/oE0hRI/q/ayAOGFLxfAqWC+yz/H91
         wXkFWD/5n3AzCv+g9d3kOjRtHlrqVgdGnw4zMa8lDhV/aHmu+3PR9YsrfvxS03ooxpEP
         qTGvW76zpP/AL5qky/BTi5mLDMaIf8UEBiOWcm3KS3iUZO5bCVINV3+kQqfuUXNsrn2c
         3R0AJlCrBNWRvWj4jbOa/RrbO4e527S60rby462HJp9KrqSIvxLa4ayms4ex5CDTIHIA
         4vmn0j9iQdJcFdICCBacOO312JEd4Mc80lVZleWpOkaauNAZeQ+wTrz4DN1ZTM3DaOjx
         ERgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757592775; x=1758197575;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJ4QEto79CF5RB4ihut1AYj5dYYkPa+6FCfTnZrB3sQ=;
        b=M2CLnYW/KpakUKwx8tHsN/5yMhQD1RJE/740d5Pi7Ws2uru1SouAmMNeag29BbC7H0
         bOggw6fKpE/pgWKy8/uMc7eWjYIA7x2ruSwrTuH6T9F8+UUm/4UXWPTc9LiQx1WXsowo
         JHf52DIV8n8tPnrcKdPMHsDp/JB/CkOHyBunVDE1GzYyjMFZKAXxI06cVhu3/aG+nV0e
         4gEBiXK/qBlRh6NGzKOr5VuiKIYWLBW1Y+LmvhpKGtOavl3xjyGhpvUujAM0C34bnrq6
         imnTwJEnuMwRVXQOIKypsA6JVy4ywZJk3raKO8WCthAt/9lPypKyzGyRmmzfJ83EGigL
         G81Q==
X-Forwarded-Encrypted: i=1; AJvYcCWN0zdcemsp671q8+Ev6acPfxb5vKESlEwMPCBMShz3tywc+5+bJ3u0e+gV5FIxlREjzL9QY5u6OkI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYseypYm56/Er1R8mn0+kYKkri4tU3jAOQnZYgxKGWLv1BO/fe
	oSvZ8DtjU+rF+tvro4iEBbnENLFn41KOs4h8SuDCuYOBTOqBsjcbAz8AGeJbHq/QIQ==
X-Gm-Gg: ASbGncsSZvo7cEDTyImHmZmu+Hjqe4B4T9QrSKeEWvPdGQYiPkylt4LoB5AP5TbmLWR
	8YNscImQKY7NCW52zM9Jc1doTNtNcpDC6RnYrUoYu8kvEmRvsdGZwcpc2UpcHsOXu9B+rTYl1IW
	Biakq0UJTgyo09FMzJJA7P16MAbTznFgjFsn2/fob3MHimLj9WAwCKpI/+rJBZG7ezlWmgkuBlb
	z2xrx0emI5vthAuMm2w9hej4jr7ejHPIc8YQ8AWxT7QeGyHPP8XgqlaJj9Ne248pXHBHBmfEXxp
	6Y7nr4Ae+go/VkdkOFzGBdvPIHaW0PDqqaGv5PHsfFEoekZ0gfdDiP04leBxSrBX6YlNh/qMxJa
	vucb6joYSoczuwEhdwLQgQLbLiiFHb2CCpqAqJt/00erL9H9uSK0WRv8BIORCC3nNBQu0AYS3S9
	TFRQKPx2XzwPMybfUoTA==
X-Google-Smtp-Source: AGHT+IHR/BZHwwwmp9AKZklb5fedwLJhv7KbT4p14ukSCP6uv9LTJ10hW0kwZ1IljaBIfyDb8//mxQ==
X-Received: by 2002:a17:907:7290:b0:b04:32ff:5d3a with SMTP id a640c23a62f3a-b04b10081d8mr1861189066b.0.1757592774926;
        Thu, 11 Sep 2025 05:12:54 -0700 (PDT)
Message-ID: <1c67c451-9c52-46e4-89ee-419c6bc96e0e@suse.com>
Date: Thu, 11 Sep 2025 14:12:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/26] xen/domctl: wrap
 arch_{get,set}_paging_mempool_size() with CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-23-Penny.Zheng@amd.com>
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
In-Reply-To: <20250910073827.3622177-23-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 09:38, Penny Zheng wrote:
> Arch-specific arch_{get,set}_paging_mempool_size() is responsible for
> XEN_DOMCTL_{get,set}_paging_mempool_size domctl-op, and shall be wrapped
> with CONFIG_MGMT_HYPERCALLS
> Wrap XEN_DOMCTL_{get,set}_paging_mempool_size-case transiently with
> CONFIG_MGMT_HYPERCALLS, and it will be removed when introducing
> CONFIG_MGMT_HYPERCALLS on the common/domctl.c in the last.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com> # x86


