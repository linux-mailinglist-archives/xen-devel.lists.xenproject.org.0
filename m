Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1909883B7
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 14:00:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806253.1217598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su9eJ-0003p8-AP; Fri, 27 Sep 2024 12:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806253.1217598; Fri, 27 Sep 2024 12:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su9eJ-0003mi-6v; Fri, 27 Sep 2024 12:00:39 +0000
Received: by outflank-mailman (input) for mailman id 806253;
 Fri, 27 Sep 2024 12:00:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xuKF=QZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1su9eH-0003mK-4K
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 12:00:37 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a779ce8-7cc8-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 14:00:35 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so277142266b.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 05:00:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27c70c4sm126393066b.65.2024.09.27.05.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Sep 2024 05:00:34 -0700 (PDT)
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
X-Inumbo-ID: 1a779ce8-7cc8-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727438435; x=1728043235; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bm0Ck5rGubWw5FYtzYMw8DalxbtTujRfTr/+PrcK430=;
        b=A1pWC0DfURyE1Bcq31xhg6IU/f9rUIGGzuuoazeJ5l8Tgaj0RCI+2adHwtQ7FUoedy
         Wvkh0tnJmzSWPyIC76nkZf22yJXdFZjLeaiZbGFHix9X7vu/BQx55s0XBBhAANWiGxxK
         CZ5re7205H/vgA2zzG33TcVyXnpM/bpFmVSKD8q5PYS9LoEdbRcEAYUWpepO9BQcZkNi
         sd/UN9Faa+fpDQqi9DPJs/nTBjQZxyFtHadcXJDDt6+Ol3NU2BVyAmWPNJDK63mw8TPa
         qYbH0NoL6lAx4lYGO4dJPGJ+n85ccwqXX4RAwDC2GNrNMzYVOBzCj+BqfKZFW2OsKD/K
         3qNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727438435; x=1728043235;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bm0Ck5rGubWw5FYtzYMw8DalxbtTujRfTr/+PrcK430=;
        b=T5os8l3eIczBmHxEbysY3A4H8oH9s9oTdQeZi8IIfcRi+kaqD8etnIxdGc7TQvTZ68
         21lUUyoeJiz2Px4Y6WeGP/SnNVUeQrs8lGrc6WQeLIKoWaj1qCh10ntjyZV/UrjpRxNG
         7NhImL9Yqhdko/HVR8RgY1/HEuRfX7xM6/y7POdvLa1tiXFs8kHg1LaQu+kP8pK0DCmR
         sUNgRewWvk+o+FyTgHifsMWyUNQFUC5fQ/sNbR5EMAzeIEU1lzUOyxAMnZ8ySnVFMMgi
         tuwomxGTs6VA+iKIvxkKBPRWi1dJRlcqTnwCXFwFAeJgcrLZTaOBV7GjrK02PiDlyWWx
         Ea2w==
X-Forwarded-Encrypted: i=1; AJvYcCUMa+2vQ4+SlZ2Zd40MFT29S4LD53SVUcvhEZuGurhIJ6YB9u6y8G49XhV75yBm3RRx4sjdB9yEVEo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxA94X1eLjYq9bHGf/IsIOekWHl3RdC2XxHCLSubke6aw7NqNzj
	2TlSyzob1iRRgpyhLta3goyb6/GZ5ci4XO7vKruSwTGJbIj2z+iigALmO4flKw==
X-Google-Smtp-Source: AGHT+IEgj3LlVRBLsdBPs7EPnT0wVysBzm+wVz5sigbqKPJOUIBDjx6CVrtwZlF5/ZDJ77yF79ybug==
X-Received: by 2002:a17:907:1c8d:b0:a8a:9054:8399 with SMTP id a640c23a62f3a-a93c492f8b7mr325033366b.27.1727438434605;
        Fri, 27 Sep 2024 05:00:34 -0700 (PDT)
Message-ID: <82a81ef3-9502-4891-841f-9946f44ff2eb@suse.com>
Date: Fri, 27 Sep 2024 14:00:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] xen/riscv: page table handling
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1726242605.git.oleksii.kurochko@gmail.com>
 <582c4cee40222e80faf1e465c011b07eeaf2c19f.1726242605.git.oleksii.kurochko@gmail.com>
 <6100a4e0-5bf3-4555-90ae-20624171ff79@suse.com>
 <fc23fbd82c1495e75fc0bdcfa894cdb56262b11b.camel@gmail.com>
 <9371e8fd-a1de-40df-8994-814dd6196953@suse.com>
 <ecab08fbbe1a1e364cf6d4bf9dafa42ced4faef4.camel@gmail.com>
 <03b67663-1a55-4642-b997-8680961aadeb@suse.com>
 <cf994aa4f9dbef890f53cf8567519b840da8faf4.camel@gmail.com>
 <60dd2287-351c-4fd1-bf2d-00645342fc73@suse.com>
 <dc14add3e5daa4db91955127812b84fb03209831.camel@gmail.com>
 <c5b22604-5fa5-4034-8596-654be962ad84@suse.com>
 <edc8bda6d7cf67b370652ea17b5d3ce462adf962.camel@gmail.com>
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
In-Reply-To: <edc8bda6d7cf67b370652ea17b5d3ce462adf962.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.09.2024 13:32, oleksii.kurochko@gmail.com wrote:
> Just to be sure. Do you mean the following:
> 
> diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
> index d7eb207ddc..6cd2e595b6 100644
> --- a/xen/arch/riscv/pt.c
> +++ b/xen/arch/riscv/pt.c
> @@ -209,24 +209,15 @@ static int pt_update_entry(mfn_t root, unsigned
> long virt,
>      for ( ; level > target; level-- )
>      {
>          rc = pt_next_level(alloc_tbl, &table, offsets[level]);
> -        if ( rc == XEN_TABLE_MAP_FAILED )
> +        if ( rc == XEN_TABLE_MAP_NOMEM )
>          {
> -            rc = 0;
> -
> -            /*
> -             * We are here because pt_next_level has failed to map
> -             * the intermediate page table (e.g the table does not
> exist
> -             * and the pt couldn't be allocated). It is a valid case
> when
> -             * removing a mapping as it may not exist in the page
> table.
> -             * In this case, just ignore it.
> -             */
> -            if ( flags & (PTE_VALID | PTE_POPULATE) )
> -            {
> -                dprintk(XENLOG_ERR,
> -                        "%s: Unable to map level %u\n", __func__,
> level);
> -                rc = -ENOMEM;
> -            }
> +            rc = -ENOMEM;
> +            goto out;
> +        }
>  
> +        if ( rc == XEN_TABLE_MAP_NONE )
> +        {
> +            rc = 0;
>              goto out;
>          }

Yes.

Jan

