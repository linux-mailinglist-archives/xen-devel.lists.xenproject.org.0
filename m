Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE3994BA3C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 11:58:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773830.1184266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbzuI-0006gO-AU; Thu, 08 Aug 2024 09:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773830.1184266; Thu, 08 Aug 2024 09:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbzuI-0006eZ-7k; Thu, 08 Aug 2024 09:58:06 +0000
Received: by outflank-mailman (input) for mailman id 773830;
 Thu, 08 Aug 2024 09:58:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbzuG-0006eT-Ln
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 09:58:04 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b367c2e9-556c-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 11:58:02 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a7ac449a0e6so74296166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 02:58:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9c12a79sm723917866b.60.2024.08.08.02.58.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 02:58:01 -0700 (PDT)
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
X-Inumbo-ID: b367c2e9-556c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723111082; x=1723715882; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dKikCVFLb4uJce7xEaR093Avd0a4h5DuqfDjKb3Vnwo=;
        b=PenDbTz+D6L7yvW4RJUpyvktBVHjaKB2Onuq0+tT6ZbHhPv4HIRbck6wPwgJc+QqVV
         C/OjK7XCz319TgGErcMIBpDU+L7KPgMTm+5TObmfh01QVbDZYKaIkLBU/rmpweecBuj+
         R7B9+pWHGrC5sK2BJgS8K/W/rMFyR63fB0FPaSPCRQmdm47FOPm+KY7ttB5EQIr/Azrn
         knIPYFJOLRAwra4sxMTvako0WadsjRPytieFPpFywr95dGc4RWkUzHvww/ANQYPAU2rI
         +QQpkf3pKVueHS7J/bqs43ocXhowynwN1EWDx6Ypxy6eOe1pFen9dfNq7SGXZVbG7cLP
         aBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723111082; x=1723715882;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKikCVFLb4uJce7xEaR093Avd0a4h5DuqfDjKb3Vnwo=;
        b=LBIyWefdeIxFLgbaIAKufxFQoCHHFAsKcD1ujNKmfoCL0TI5ra1jxjaBPZaj4tbkNY
         D1oobVOhDy7FLyN7lDoWYkJSP69CKM2r2oXAXKqBCdF776sRxt3SLRPiaKtymDjxCZAw
         Exi4U9DmW4e5VBvFLQOlCPPfWuSOOMckfnAOJPX3W9m9khrORtxR/i9LskbnnuGZvj7G
         CDpezsXzHDOMtx0gq76++soh1OQG59CoRU+M8NDAXS3HlgFJjxcQU+/RRjtxb7y4ic1B
         luyuEVMe8EYvxTgvCxPzPKuHWK/mqQTuAcVXnvYO/C0/XBcR1HD7SSTLfjC/YD3OY0Em
         uyNw==
X-Forwarded-Encrypted: i=1; AJvYcCWktUepnszya4E+YKXlTd8XuvwAGJdb0TnQ8YHoz0920ZiEmZvA49+DG5RiEnbuLY01xSMA+firtESlr+UwESOaTjpHFePNGQyLhUNsUB0=
X-Gm-Message-State: AOJu0YzbSA9KjS8NAlQOkkwfNosUmjcx/smcA6VZs9lcYSeUOhNjKls3
	izy7HR2+QbXqjvT6zpxt80YUEP5t8Q5vNX9pORcGwYmr4jwCAU3yY8SHhsebGg==
X-Google-Smtp-Source: AGHT+IEiKYeqaw3yygp+l4U3XnU+IANaxVWGVYjjw6fmgetopqXoTS5U4xEVa2Y8hTNosL/xhFr5VA==
X-Received: by 2002:a17:907:f74b:b0:a7a:c256:3ce with SMTP id a640c23a62f3a-a8090c7e891mr99779666b.21.1723111082114;
        Thu, 08 Aug 2024 02:58:02 -0700 (PDT)
Message-ID: <fea5c345-5cf6-4144-9ccf-5c0f7a34a136@suse.com>
Date: Thu, 8 Aug 2024 11:58:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] x86: Force proper gdt_boot_base setting
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-5-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20240807134819.8987-5-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.08.2024 15:48, Alejandro Vallejo wrote:
> Instead of relocate the value at that position compute it
> entirely and write it.
> During EFI boots sym_offs(SYMBOL) are potentially relocated
> causing the values to be corrupted.
> For PVH and BIOS the change won't be necessary but keep the
> code consistent.

As already hinted at in a reply to an earlier patch - there are ample
further uses of sym_offs(). Imo we need to sort them all in one go,
not by hacking use sites individually. Which hopefully can be done by
simply calculating %esi correctly.

Jan


