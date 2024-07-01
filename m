Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC6A91D97D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 09:55:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751293.1159199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOBs3-0006ZA-9i; Mon, 01 Jul 2024 07:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751293.1159199; Mon, 01 Jul 2024 07:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOBs3-0006Wh-61; Mon, 01 Jul 2024 07:54:43 +0000
Received: by outflank-mailman (input) for mailman id 751293;
 Mon, 01 Jul 2024 07:54:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQX2=OB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOBs1-0006Wb-84
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 07:54:41 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b8cf649-377f-11ef-90a4-e314d9c70b13;
 Mon, 01 Jul 2024 09:54:40 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ec52fbb50cso26155121fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 00:54:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac1535b6esm57765905ad.156.2024.07.01.00.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 00:54:39 -0700 (PDT)
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
X-Inumbo-ID: 2b8cf649-377f-11ef-90a4-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719820480; x=1720425280; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NtitmhcGkR4aduE0oddPnCJgC63Dpz8GO10jhuaQeF8=;
        b=eeb/4eLXP6iM2soupOGEAhaBWXuD+EbawIqH3EoGlp8t/K4X+u2fwXkeppH+voBG/+
         Q8mTuNdSrMxh01cqKmeVrUhvCW3keNgaqeWCe/QAqAtOwq+5VXbqTFOH/qikt4q6rppL
         TK1zEUVqi4i10r4TTEOjIidLdICOOXAnXmTgkqi0ZAjYDH+NFw6ZDoASVqNGVAz77w6G
         OV1JkBrH7A2YLWpSjHFj9AUKpuJgIefkCF+/u1G8pZZLjI9KCmErU1sAPKzT4K10kFuG
         WICrcnINOEHMxIWO4ExNHsDtaP691V7rf2sv3EgAdzbCobiXTcypFKzokgcf2sjRxRC6
         xqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719820480; x=1720425280;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtitmhcGkR4aduE0oddPnCJgC63Dpz8GO10jhuaQeF8=;
        b=Ra1kaaUiOT33c+cj41h3qmb2AJTcq5z1FrPyChFNwAly1vKmsVgE4Eog1pMI5ZpYMB
         x1uVNEbizESQihivxnzch5Zeq20jl2/FbtgsdMnnbJzbgrrH1U9UBzS01Mx80T3+pAlW
         1M8Dea+f3RA5rx47BkGIPCA5wFfNWC1agOqzl59QWmkejzUTH1DomiPe8egoATxcVtB/
         Re68K4vNAcVyCgL49HAb4bm3Y3ZJzkNyuKoRnMibwLTwmp++XkpYJUquW5pqoCZh6w4U
         Wap0sECRBx2fS1AtMYQXJaANayOpY83TK5264rDvRYOPAdPLmAo40LIJnn95QiSRE09E
         x8sg==
X-Forwarded-Encrypted: i=1; AJvYcCWtNfckrXzJVP1DnTPvZ3KVmkGYx+DqNr5tvLLC8FoAZjI9sG+DcI3HQMuCB55W8cF5gEhkR36MDalCdTGfOmvrNkQnF+87WSkZ78/28H8=
X-Gm-Message-State: AOJu0YyV25qdfBiJdU/INKbPXSMW4QLht77ja/J4kRvfO4alHNyOO+YC
	aDaqkcsENS04LdkrDv+RUnAsz4cxfirtkI24f82OWyKKP9tXAzt1KOQt6zsBEA==
X-Google-Smtp-Source: AGHT+IHPQQLmVXBHQc0Fyib8uD1vDL6tFWxiArIvY+0V9+ggrdM6eyEpoWnOzXCBO5LDCG3O89mx+Q==
X-Received: by 2002:a05:651c:88a:b0:2ee:6cda:6380 with SMTP id 38308e7fff4ca-2ee6cda6544mr8980571fa.18.1719820479945;
        Mon, 01 Jul 2024 00:54:39 -0700 (PDT)
Message-ID: <64af8165-2456-48f4-b784-ed3e6eb2c456@suse.com>
Date: Mon, 1 Jul 2024 09:54:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v11 6/8] tools/libxc: Allow gsi be mapped into a free
 pirq
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
 <20240630123344.20623-7-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240630123344.20623-7-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.06.2024 14:33, Jiqian Chen wrote:
> Hypercall PHYSDEVOP_map_pirq support to map a gsi into a specific
> pirq or a free pirq, it depends on the parameter pirq(>0 or <0).
> But in current xc_physdev_map_pirq, it set *pirq=index when
> parameter pirq is <0, it causes to force all cases to be mapped
> to a specific pirq. That has some problems, one is caller can't
> get a free pirq value, another is that once the pecific pirq was
> already mapped to other gsi, then it will fail.
> 
> So, change xc_physdev_map_pirq to allow to pass negative parameter
> in and then get a free pirq.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
>  tools/libs/ctrl/xc_physdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
> index 460a8e779ce8..e9fcd755fa62 100644
> --- a/tools/libs/ctrl/xc_physdev.c
> +++ b/tools/libs/ctrl/xc_physdev.c
> @@ -50,7 +50,7 @@ int xc_physdev_map_pirq(xc_interface *xch,
>      map.domid = domid;
>      map.type = MAP_PIRQ_TYPE_GSI;
>      map.index = index;
> -    map.pirq = *pirq < 0 ? index : *pirq;
> +    map.pirq = *pirq;
>  
>      rc = do_physdev_op(xch, PHYSDEVOP_map_pirq, &map, sizeof(map));
>  

This is a functional change to existing callers, without any kind of
clarification whether this changed behavior is actually okay for them.

Jan

