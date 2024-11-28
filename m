Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6E49DB6F1
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 12:54:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845395.1260819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGd5h-0000TB-AG; Thu, 28 Nov 2024 11:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845395.1260819; Thu, 28 Nov 2024 11:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGd5h-0000Ql-7N; Thu, 28 Nov 2024 11:53:49 +0000
Received: by outflank-mailman (input) for mailman id 845395;
 Thu, 28 Nov 2024 11:53:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGd5g-0000Qf-R5
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 11:53:48 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bf45331-ad7f-11ef-a0cd-8be0dac302b0;
 Thu, 28 Nov 2024 12:53:45 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-385d7b4da2bso12058f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 03:53:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434b0d10d52sm20521075e9.0.2024.11.28.03.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 03:53:44 -0800 (PST)
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
X-Inumbo-ID: 6bf45331-ad7f-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzAiLCJoZWxvIjoibWFpbC13cjEteDQzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZiZjQ1MzMxLWFkN2YtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzk0ODI1Ljg5MTU2Nywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732794825; x=1733399625; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oCQqXz5QRnHWz5PPN8v8+dO4jNy1l28cez7CMgB8pE8=;
        b=aamHsnPxR+RN3Pg7g+rgUEo8txJ67ayR29Kl8JCzm5ocX72aYNTyPcSFEpIIIxIQIG
         GRi902dt2IqZJ72O0+QmlMF0whjBBsQm90zJiVk70Us1/CrwvPRgrRKMm6fwtZOEZhQb
         sRiM8SE7iEDYnKp1UBHopCS6yizOS/cD9J9Sde1AfBgxJJA7QCf7v4dM22FtJUedZFR9
         ko8ROkoYGh82LNveFCZqBcNHmi/P4JO4kl9NuR1OzWhIXT77cVEtSGw4I2MFNGG1Nxik
         a5vRoiLEy9X7oADaLuyjZumkJ0GwluAecZPxrBsH+fbnPDgEkcuFc3vHa18oJKvHkvod
         lYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732794825; x=1733399625;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCQqXz5QRnHWz5PPN8v8+dO4jNy1l28cez7CMgB8pE8=;
        b=tZDnrqg5dErF0+FyPRGMel1uyh+yCQoDVgjnn+DXiBMeHB7QGc7gjVK7iPe5zBWjdM
         9gITsOh6vM4p1Gu2x+osIrd9iNyJ8Cayojm2HPtEpEfMhmcwVkapmZGY7PG5eOL92pWl
         8P9ke7c4GCaI+uzOXGjNICzMrzIAsGeQjt5n7QLyvyjlC7CVJgWO5Oa3g7aHAmFtrLiP
         afJ2VLaydkDOyyxnLJ5DAXYIXBAAGeJG/0ez7xi6UPqkebYAXlCbqRxnggh2fszXASno
         vausyFBcZWprQ/+Yg8rcDABmQBmQ/a0DGIGVm4bNdBnE9UCz1SlMd90NfzFfDzZxyZBQ
         fEbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsA66SHMNDrpi/kN1/0C96IEGkcYsH2i/JZ0bK2TkLakl0mBS5f+mpqcNKXxJ8H5bl7NcbkLvdETY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxl2zFnazUN+z5qR+BFXXHo/i5sGDe3VDsUi5URv0aLdlwbZMqE
	JvSMMW/8Spcw875Ar5UGMSR58hqXL+O7J1H9GD+YnZYmkSuCAGGW/hJpgSNrAA==
X-Gm-Gg: ASbGncs8pjk89sY4KFtmRpT18NbnvQdDh0wiAwFnEDeHWKS/YjVUV57mC9o1yGGuYXo
	jmQeC3n19WlLdg+FSbgSjRW+mc1uduGOOXmA1Ju/AtneE/Fkzw5o6ww3oEy4tYRpRBMTM1oMN4V
	XXgB8Dl8Ay2a1Gjb/3pIRT2kEUzOHr0vnQDwMaI3wBj4bFoUVz6RRIgXTYZ+O05s0uPJOC0pfTN
	lO/zoHeW97+kEb55XtCg9rNCjFUkm0LfPOkvZ+qfXoLr8Lnuknp2PXZLDSgwovnGRdpCRRRBTZ/
	blcX/fEBM7BgM2Ig5T/ShdtFJp0x/ooYYhc=
X-Google-Smtp-Source: AGHT+IFkxl2kreJ5RFYzOx0tK5FAbbBqtVv50QKeBbBgLra7sN9h1DlHBi5Wc2yMxW0iPjgf0EPkZw==
X-Received: by 2002:a5d:59ac:0:b0:382:450c:25e9 with SMTP id ffacd0b85a97d-385c6ebb925mr7067376f8f.35.1732794825078;
        Thu, 28 Nov 2024 03:53:45 -0800 (PST)
Message-ID: <e8dcd294-a9a7-43d7-94af-f01d86020741@suse.com>
Date: Thu, 28 Nov 2024 12:53:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 12/12] xen/arm: add cache coloring support for Xen
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-13-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20241119141329.44221-13-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.11.2024 15:13, Carlo Nonato wrote:
> Add the cache coloring support for Xen physical space.
> 
> Since Xen must be relocated to a new physical space, some relocation
> functionalities must be brought back:
> - the virtual address of the new space is taken from 0c18fb76323b
>   ("xen/arm: Remove unused BOOT_RELOC_VIRT_START").
> - relocate_xen() and get_xen_paddr() are taken from f60658c6ae47
>   ("xen/arm: Stop relocating Xen").
> 
> setup_pagetables() must be adapted for coloring and for relocation. Runtime
> page tables are used to map the colored space, but they are also linked in
> boot tables so that the new space is temporarily available for relocation.
> This implies that Xen protection must happen after the copy.
> 
> Finally, since the alternative framework needs to remap the Xen text and
> inittext sections, this operation must be done in a coloring-aware way.
> The function xen_remap_colored() is introduced for that.
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com> # common
preferably with ...

> @@ -353,6 +355,22 @@ unsigned int get_max_nr_llc_colors(void)
>      return max_nr_colors;
>  }
>  
> +mfn_t __init xen_colored_mfn(mfn_t mfn)
> +{
> +    unsigned int i, color = mfn_to_color(mfn);
> +
> +    for ( i = 0; i < xen_num_colors; i++ )
> +    {
> +        if ( color == xen_colors[i] )
> +            return mfn;
> +        else if ( color < xen_colors[i] )

... "else" dropped from here.

Jan

