Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40D3AD574C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 15:36:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011747.1390212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPLch-0003yH-0p; Wed, 11 Jun 2025 13:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011747.1390212; Wed, 11 Jun 2025 13:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPLcg-0003vw-UU; Wed, 11 Jun 2025 13:36:10 +0000
Received: by outflank-mailman (input) for mailman id 1011747;
 Wed, 11 Jun 2025 13:36:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPLcf-0003vq-Dc
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 13:36:09 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06964363-46c9-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 15:36:06 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-450ce3a2dd5so59555055e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 06:36:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603d14206sm87391795ad.34.2025.06.11.06.35.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 06:36:05 -0700 (PDT)
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
X-Inumbo-ID: 06964363-46c9-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749648966; x=1750253766; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rkuojl8eYF1ouZRGYRiishF0d8bI4Jee9szhrB+GhPw=;
        b=chX6zJOamrqVv9l8LhZFGjNVk9KktWQoH1NL52wlA6sLbS38u+uWp9ZY3UIduF95+i
         4CwzOvAblpHnf1KG5IxSS9wX53zomoyveNcKJXMAVFpYJRv3EpPrEg82lOgWUjyRWUCN
         OvPfDX95JFpXMXVqoEoOlIp19xqcGvzojpZl3yCYw+BQw3IlcTmJKdBxHjhHrxR3T2Zn
         LRO53uZXTFPxhQWUconR6R3RwkOhg+h0s8y1aobQEk5HJQZdpsPLdE2hvkI855p9LfQw
         AMaOLy6j9yE2qGTrxuAPOhmfb7gLMatFpd9EsX21iNUoVKy1RVSeZ1zYcvmUw55UELge
         2SQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749648966; x=1750253766;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rkuojl8eYF1ouZRGYRiishF0d8bI4Jee9szhrB+GhPw=;
        b=hL5TxDQjugVDLK+zk1NrKJbTrbqgf3FxHr2Iu4M/OMF4m1elZGOjXs/2SejaoQoCZ8
         aUXszc9IIB+KNniVzDA53QG7zVlYE87cyBbt66ZMuVQfaFyTHgGMMf67I/isBN5mAMnS
         Q/8U3mhy/4/apwdxFSHQzjrucMY31kLwuMKDSVwTnCIrr1OwjlcCuPDcMCe9/EH1I+8J
         SzI5sMWFi8O9Y+wAqOZZEJuzZOdLBJ3Bs3ty++f6e3YuD2m46fw5r7KvtI8pa+z7D2yr
         IBI8+7sPG0J/hzXMs0oFces0Qve1mfkL9HeLBj8eh4aO9sDqfid9e/PloiuXdDuaK2a0
         e6EA==
X-Forwarded-Encrypted: i=1; AJvYcCVKwk+IltjfgWrj09RinSraMD2ElAOxgbMUk7hka0f/PFa43Hq99A3SxRSdjb3D2kFQN7qAdS0WGic=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywl8UlPnxC8uBx+UHm0yaKG959QWTBgA1XLazwsVntLSRCB9hU8
	jLCCY3tm98QVF7OelMbeRN7TtBSwpBtCnS1x2UaJiYR0gzvi3xvp9f9pHWGE4K9B3A==
X-Gm-Gg: ASbGnctXIMhENPQoneWn4CggTLkuDFhOs8MbM1KBTr740SBIgE0fsYe3dPeCPSr8R5c
	i/fc3t1c8czqGxHieHd0mz/xGPSY48eJL/TP9RlSdyqC1OxXoh53QIOemSDEXPOoqgi3j5rPbxj
	1pAK2ssEaPzzSC0KkJqP1IxxavgUAcIwtF1QiiSxkYMa9kwobVDSQVY//4ZEMyv9C2bubct0MrZ
	RYDyocOHDthv26OJqYpVbNvZCwPkakCfaSzrP2GJtlUIR9+DmvfWFUsUDd4VnRVqfS6L9dZ3R0A
	Uk3lujFr6Jl1iqjy0hGZRhsXo0eFqeiWaCyNLy/TZD7TOo/xSMh+NgdY0ZOoPMjNsqpTnhJcYNa
	qT6Xg9RI5cdNrW6doIo5DvuRnK9VsNZzlTgH0lZX6gNK1hIY=
X-Google-Smtp-Source: AGHT+IFLELa0I+JYgdF5kXyfkdmIhtJKoNRHLCZa6kcWFGppK0UDY5BFl/+m+b5n8iTIEhvjlcP1Yg==
X-Received: by 2002:a05:6000:430c:b0:3a4:ef00:a78c with SMTP id ffacd0b85a97d-3a558a4296amr2428793f8f.55.1749648965690;
        Wed, 11 Jun 2025 06:36:05 -0700 (PDT)
Message-ID: <4352622c-f33a-405e-98c0-cad8f6b4f4f5@suse.com>
Date: Wed, 11 Jun 2025 15:35:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] xen/page_alloc: Add static per-node counts of free
 pages
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
 <20250314172502.53498-4-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20250314172502.53498-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2025 18:24, Alejandro Vallejo wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -485,6 +485,9 @@ static unsigned long node_need_scrub[MAX_NUMNODES];
>  static unsigned long *avail[MAX_NUMNODES];
>  static long total_avail_pages;
>  
> +/* Per-node counts of free pages */
> +static unsigned long pernode_avail_pages[MAX_NUMNODES];

Performance-wise I find concerning any addition of yet another array like
this one, which - unlike e.g. avail[] - is randomly written from all nodes.
I think we either need to introduce per_node() paralleling per_cpu(), or
(less desirable, but perhaps easier to carry out) data structures need to
be introduced to make sure one particular cache line would only ever be
written from a single node. As it's visible from patch context:
node_need_scrub[] could/should move there, too, for example.

Jan

