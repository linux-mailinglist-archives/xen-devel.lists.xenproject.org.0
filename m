Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7F49950F2
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 16:03:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813152.1225969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syAo3-0004nF-PA; Tue, 08 Oct 2024 14:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813152.1225969; Tue, 08 Oct 2024 14:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syAo3-0004lC-MU; Tue, 08 Oct 2024 14:03:19 +0000
Received: by outflank-mailman (input) for mailman id 813152;
 Tue, 08 Oct 2024 14:03:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syAo1-0004l4-Ki
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 14:03:17 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10d278cb-857e-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 16:03:16 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9968114422so123875066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 07:03:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99384f8258sm480630166b.16.2024.10.08.07.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 07:03:15 -0700 (PDT)
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
X-Inumbo-ID: 10d278cb-857e-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728396196; x=1729000996; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lc086HIpNhWaQTWIXhDl/159HP+WwwT7ahDqkkt2P+o=;
        b=g6xWy5HMT/S3nKyxlwnBDKrlM6s3zeOQVUPE1pwC+oO+euIW9dTH0mndYEzN3n0fim
         PxU0QtzNHL64HXdCFueGoTwLbkQqCqpKCpMxQG7f9W2FoOx/Y9q6RM5yP591h+CIokoP
         isI83WhX679AVpJknBGfpW1EX2sKK+uOrkpxcsP6HO+s3TcQP5pHiCTMGTfWe8lyT9E1
         rmYMX2ripqcorGBj7lKDSGWPSAYmUXF9lDKLksjzYBOyeE/B6vl+xZTpiNy9FAYmAqjP
         0DetsbVSw5HJFWkgRXJF+ZspTuk/VWA3EilxkHtFs2hR4Bm8USisusr1ZtqpiU7W1KZF
         qe5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396196; x=1729000996;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lc086HIpNhWaQTWIXhDl/159HP+WwwT7ahDqkkt2P+o=;
        b=auQ9lD1LR6vM2k1rYNilVUf3zca3VaLl4zQS2ACZ8uXyykN19KtuoAxFQQS/8cqZjy
         6wK4Sh9ixrbKtE9B91ZVkElhfphFVfgkOJFrkw60nKe6ERtEJ7TRVbcMaYEUxRt6hXzI
         OHeNU/BEubMtxhJnJqLbGv981BKCDVohJfc/QkfujRAJXZ4jhiPguWHlJUcAEg6S44gx
         dI/4ZX3MoeTNkiPNhb/H3HpJ4njzaqDXWY+JVennT/ACYTLAmtw33wj5arUMrJtynMyj
         KNdMpt6rkg/hijPEzS9a6Aau0b8bTbQXY9j08sv6PSz/ffUF6Er43sliy5oqfOPdzMW0
         ZRHg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ9UlcgQRs8XSEFD9g8i/CR6PP2PCIoxCeDbCl6LfMkdZ7e1ylG0xhPUJqXqNDHTBstqhO75RqaFI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBKgHUrde6QbaZlLHVH/jK1GVJ6lLtk1GmtpaqlC1fPoE+aaZ8
	5dB/OLuaufgQ1WMUwxvAyanz5hpGJ3Kb1ABKeAhhjpg7E7yJ+ojvIazRq5wJ3A==
X-Google-Smtp-Source: AGHT+IF0GYoeccRNogHZXhSjcDctnUv0ASq+gT5+K0I9unxq33ZgeKqxQgxrpDU0k3vlUGgMz6dQ/A==
X-Received: by 2002:a17:907:944a:b0:a99:77f0:5208 with SMTP id a640c23a62f3a-a9977f06fc1mr162338966b.12.1728396196055;
        Tue, 08 Oct 2024 07:03:16 -0700 (PDT)
Message-ID: <4f6ba64e-2392-4793-aca4-b90a231900a4@suse.com>
Date: Tue, 8 Oct 2024 16:03:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add myself as maintainer for arm tee
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <e853549e25d26264e1a470336a98c48d22b799eb.1728395637.git.bertrand.marquis@arm.com>
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
In-Reply-To: <e853549e25d26264e1a470336a98c48d22b799eb.1728395637.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.10.2024 15:54, Bertrand Marquis wrote:
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -516,6 +516,7 @@ F:	stubdom/
>  
>  TEE MEDIATORS
>  M:	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> +M:	Bertrand Marquis <bertrand.marquis@arm.com>
>  S:	Supported
>  F:	xen/arch/arm/include/asm/tee
>  F:	xen/arch/arm/tee/

Like for Frediano's change to this section, I think the ack should come
from the present maintainer, whom I have no Cc-ed.

Jan

