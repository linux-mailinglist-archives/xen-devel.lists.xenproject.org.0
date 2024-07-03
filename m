Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7938592622D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 15:49:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753059.1161326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP0MA-00064s-Kh; Wed, 03 Jul 2024 13:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753059.1161326; Wed, 03 Jul 2024 13:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP0MA-00062j-I3; Wed, 03 Jul 2024 13:49:10 +0000
Received: by outflank-mailman (input) for mailman id 753059;
 Wed, 03 Jul 2024 13:49:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sP0M9-00062d-Mq
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 13:49:09 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0507f6a6-3943-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 15:49:08 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ec4eefbaf1so58059161fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 06:49:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-754b5cda258sm2215226a12.16.2024.07.03.06.49.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 06:49:06 -0700 (PDT)
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
X-Inumbo-ID: 0507f6a6-3943-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720014548; x=1720619348; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H2MRtvs6Q+T29lDr2TcZ175P/dLKJDWyZ7JT+WcGmtM=;
        b=hDv5HjchkLcqP8Bk8oxoejuQaLwp+3nMc428eF0RCHwnR/bugKAnaaQkul49fMIYSH
         yehIR1VPDDmNeFLyPEHmyF15nSNIfAvQTvP++ssVOAXPS/yjKs+E45a1AcLs6XemIpQc
         nu2ETrm9YliSWo7eTS52SUD/42yWHNRdz5UfjvhxJq+eS/aXA03eSb4T8kuojM+xXsZz
         0bCbovC7xj+hFpkOSG5kxxNfvdB3ip4s7AEz5WDLxsqTyfc8uIxl9lPIinFoDeLz2AEf
         zMiz38viDI4Ol9+6za2z56r0TYBCmLnll450E7hzGIMJvoJrlzIrIOV4r275+Z9hej/o
         DyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720014548; x=1720619348;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2MRtvs6Q+T29lDr2TcZ175P/dLKJDWyZ7JT+WcGmtM=;
        b=xKLgiOhsswB6KlCIxrl2fI0nu+JtFwHSq7imxln1IEYAwvf+tMEcGi9Ut80//PU1as
         rJv9DYTVZ5v7hONir1YpNVzAXm+1gShCm/6D9buX2FjqC2FShC7N9fsxJzWirHnNe++d
         fdzsK07DnW+BBw607nouunIvubiv/gQ4Q70c5Gf+KIp00wNgfdF2Wq+DPJH5TzhnD94T
         WoSFRABcYWNLgY/+bvgf+LGXKkiS6e8WuKRis2f12pQnYjgLhO/O3Fqxd/nXTXILv+Dk
         53/eKzdro5R8gRp3wW0YfwaY5jL1TDk+CqSd/hLbvR5S28WJRbhMqy6Oep7A5Mea2/OI
         ucAA==
X-Forwarded-Encrypted: i=1; AJvYcCXbqvp3Hlo3ts63jARc0XYs72OcAZaR9Rt3X807o5Bl5QmqN6c0T5qzxQF//KFigoSjVG/FWYGCyIOiPZulfdneJK9dvAGTt95VjdR6MO0=
X-Gm-Message-State: AOJu0Yz5UWl8b3aMLrPF+NlK9Qhq7VFU/gjL6mLDGyeSd4qHH+UttwjI
	/bLGVDORMBg6ro20vWVNWci2S3bK5JayrhcG/yb6i5bG8Y4bq2k/2rXWALD0Vw==
X-Google-Smtp-Source: AGHT+IGcKfhMIFw5LJV6m8bq1DHLmSpc6J1hs+1e/aNULySiK8QyuqF8M8Ia5Kk5EawzLECsmL52Gw==
X-Received: by 2002:a2e:bcc2:0:b0:2ee:7caf:db5d with SMTP id 38308e7fff4ca-2ee7cafdc57mr19579171fa.51.1720014547696;
        Wed, 03 Jul 2024 06:49:07 -0700 (PDT)
Message-ID: <375074a0-0db7-40ba-9c9f-590b0cbe2409@suse.com>
Date: Wed, 3 Jul 2024 15:48:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 17/17] CODING_STYLE: Add a section on header guards
 naming conventions
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <fdb3811e00b9d6708c18d349a5a5043bb1b49cec.1719829101.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <fdb3811e00b9d6708c18d349a5a5043bb1b49cec.1719829101.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2024 15:46, Alessandro Zucchelli wrote:
> This section explains which format should be followed by header
> inclusion guards via a drop-down list of rules.

Ah, so this answers my earlier question regarding where the naming
rules are spelled out. Yet why is this not much earlier in the series,
/before/ anything trying to follow these rules?

> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -167,3 +167,22 @@ the end of files.  It should be:
>   * indent-tabs-mode: nil
>   * End:
>   */

This footer is not just an example; it also serves that function here.
While not strictly needed in this file, I think it should still remain
last.

> +
> +Header inclusion guards
> +-----------------------
> +
> +Unless differently specified all header files should have proper inclusion
> +guards in order to avoid being included multiple times.
> +The following naming conventions have been devised:
> +- private headers -> <dir>_<filename>_H
> +- asm-generic headers -> ASM_GENERIC_<filename>_H
> +    - #ifndef ASM_GENERIC_X86_PERCPU_H
> +      #define ASM_GENERIC_X86_PERCPU_H
> +      //...
> +      #endif /* ASM_GENERIC_X86_PERCPU_H */

GENERIC contradicts X86. Please try to avoid giving confusing / possibly
misleading examples.

> +- arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM_<architecture>_<subdir>_<filename>_H
> +    - #ifndef ASM_X86_DOMAIN_H
> +      #define ASM_X86_DOMAIN_H
> +      //...
> +      #endif /* ASM_X86_DOMAIN_H */

I'm afraid I can't connect the example to the filename pattern given:
The example has 4 components separated by 3 underscores, when the
pattern suggests 5 and 4 respectively.

> +

Please avoid empty lines at the bottom of files.

Having reached the end, I don't see common headers (the ones under
xen/include/ in the tree) covered. I can only conclude that the odd
INCLUDE_ prefixes I had asked about were derived from the "private
headers" rule. Yet what's in xen/include/ aren't private headers.

I further have to note that, as indicated during the earlier discussion,
I still cannot see how occasional ambiguity is going to be dealt with.
IOW from the rules above two different headers could still end up with
the same guard identifier.

Finally, it shouldn't be silently assumed that all name components are
to be converted to upper case; everything wants spelling out imo.

Jan

