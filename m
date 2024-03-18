Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD6087EB22
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 15:35:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694757.1083841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmE59-0001yD-It; Mon, 18 Mar 2024 14:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694757.1083841; Mon, 18 Mar 2024 14:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmE59-0001v2-GG; Mon, 18 Mar 2024 14:35:19 +0000
Received: by outflank-mailman (input) for mailman id 694757;
 Mon, 18 Mar 2024 14:35:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmE57-0001uw-W5
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 14:35:18 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd20506e-e534-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 15:35:17 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so661562566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 07:35:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 st6-20020a170907c08600b00a46af639a77sm2105205ejc.172.2024.03.18.07.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 07:35:16 -0700 (PDT)
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
X-Inumbo-ID: bd20506e-e534-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710772516; x=1711377316; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3F5/xI2n9bTtGbvGmkUFaStfCLvsQ6kyaeiV8iaV5zU=;
        b=bUm4ujD5EIUDY/Zub3eIkSeT48s5pdwlWU9HhLB3aldgHQkNxb7Sjhiyl4aKxhIHe+
         /5rqHfgw2BdghBWXEx2koBc1H5gf9N8R4V55uvCq2j1vkpw3RB5UgRXWsONM/3rB42Wh
         SEkzDhlk99xixxQYajPQOd9hfYygDh4ZORMBrFNhVkTuxTiGV+4z4nPuJpjVrLI48MwY
         OIBmoYtXg6qfou0BOK3k1y6etwv/F/LzoK2zgYfjso6ueiJiXzvEYla2jnHab34msPvX
         3yVs+FwFjb/y0W0cubG7o/G7xLzIOmM8rmkJXhniJXNLASgzkcHUO8iX4hrEMf82ipqr
         NhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710772516; x=1711377316;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3F5/xI2n9bTtGbvGmkUFaStfCLvsQ6kyaeiV8iaV5zU=;
        b=NY8cIsgO/381e5SDk+be/fpXk0R44VwUhhngoQQL8a2NHmzv29I0sPqaCJIB2c+rUn
         5X9QL7pr7JEsNBs/LW8qC51vZQrV3Z9+ECJWZZYgjtM/EsXE84cvmr2pwafsPlSdTsVD
         MJtWvqgvQ3IAvzIvPH/bUEEwctYtBwCWq2y0+nG6Pp2xA2ZzXpnpQuVyUgtGC7ReZWuJ
         HLMNp7d3a97cqUd6+11xI+6ylbO29HRqhO5o15QwsTzUDBLPJgCnPxNcjUuOk6Eu2ps4
         eBfkEisdFAp+aFZ5xLzHjny7rY7Hc1IbTNWT3kAMPMyqXM0m4a0Y9CcqP58nZLzOZNiS
         5cVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHuPCjkQBY3EO6QH+OtrIcjI5uYwtCIJykANn30J3mTXom/Bt1ZCFTLk1axft+gvtEOtBygP9f/a7SahmYy3PQUH+fN6+141yCO8eoAEs=
X-Gm-Message-State: AOJu0YyS1W7CkCkTL7lgJZ6nQyFsDlpRXv9LA8oU1tiHc4Trxae8vX/m
	/iYCZRWhG/nZcjcy8kzDj/AGm0veutB0axDl23MnoKLTw31DqpX8hFSupEeRiA==
X-Google-Smtp-Source: AGHT+IFbvfOWz7saOjpj2bMk6TAXCeaOu4uE2iVUfy/WOkUmzWO8BEDhcNpFckVqwguwefLBhjY85Q==
X-Received: by 2002:a17:906:264c:b0:a46:b8fa:518 with SMTP id i12-20020a170906264c00b00a46b8fa0518mr2917770ejc.22.1710772516538;
        Mon, 18 Mar 2024 07:35:16 -0700 (PDT)
Message-ID: <33b44205-2edb-496f-9c92-e04f50f90deb@suse.com>
Date: Mon, 18 Mar 2024 15:35:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/13] xen/spinlock: introduce new type for recursive
 spinlocks
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20240314072029.16937-1-jgross@suse.com>
 <20240314072029.16937-3-jgross@suse.com>
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
In-Reply-To: <20240314072029.16937-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 08:20, Juergen Gross wrote:
> Introduce a new type "rspinlock_t" to be used for recursive spinlocks.
> 
> For now it is only an alias of spinlock_t, so both types can still be
> used for recursive spinlocks. This will be changed later, though.
> 
> Switch all recursive spinlocks to the new type.
> 
> Define the initializer helpers and use them where appropriate.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



