Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAD3A20925
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 11:59:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878382.1288559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcjIw-00050D-QS; Tue, 28 Jan 2025 10:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878382.1288559; Tue, 28 Jan 2025 10:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcjIw-0004yX-NS; Tue, 28 Jan 2025 10:58:50 +0000
Received: by outflank-mailman (input) for mailman id 878382;
 Tue, 28 Jan 2025 10:58:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcjIv-0004yR-7f
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 10:58:49 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8c48e3b-dd66-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 11:58:47 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aab925654d9so1076333266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 02:58:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e64dbesm770704666b.57.2025.01.28.02.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 02:58:45 -0800 (PST)
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
X-Inumbo-ID: d8c48e3b-dd66-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738061926; x=1738666726; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rJj3eidiekjHFdZobMVCVZquWgpQtdsNdOqH5cRtVhw=;
        b=XSV7W3Vz15CAofLO1Q5ST4k+cPygq4uRMDdWFi0KU0Z4r26CrT4NtR66kdgh9fDgh0
         uu7CXXCXZGYM8lahfDMP/LI0uyY6gDpeTTxEelIJWawgv3M7yz5zc4c/fdYyyU7byftb
         lSRJeSolZh/c/Cz6cXLOhJ4Qx8UKWClXwbd78kMVn8/ZRT1Kd9TjgtEp1YZWxN5TIjv3
         yt6fRFwLPom9yTMoIzwdSSyFuFmcryLsFYWCZy8G7Lr0laJ2NvFVxnLFxbn0fKAhNEhs
         any1MdVTpf6jvLdm6lDwuwsK7unH6aXDOTl6Nmg9u04LMFNFBF9Jag1dKIsELzyVihsC
         YNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738061926; x=1738666726;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJj3eidiekjHFdZobMVCVZquWgpQtdsNdOqH5cRtVhw=;
        b=ACznE8SmZBoaSj6ptU66nlJUsm044xl40du4yLBQSI+rD7ufZ7/Q9VF6gJ/5XJeNL6
         +CAO8S7u5uBCUySEkoF0Xfr/b5GLbY9XchC1fMARP7v2NpqKSukMxwctmxd+BadzTOez
         X4iQkDRmsmTG/AGZu8tE29T1lIIod7iw1sENKE8G7EYdqElgqaRD8eT1MZsSUs4VGR4c
         ZDnExHJ8BsQGFxyLHk8Dr/DcB0DavKuURqTcBFKl2tva/ZoFbW1elHnrZ9hosNohnJrn
         HsaVAcuBeCarfaM5/+1NA3BmUmdqBuCuN3sY0gXBgl8SXb6oh3sq2W1m0MjPzChWVC9d
         64lA==
X-Forwarded-Encrypted: i=1; AJvYcCUdJnxSGjr9KRPFcN8d3QwBZuS3YN7ZbJwEXFOtTY0zNFgYQYdYPHrndCEt6HpM2WulelkRh137iy8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZIi/FPHdo68DwGEXG1cy65L+qmzLzOKjjhFFPs8kyBDvpXV9G
	G0CUrvbSEbkLERjI9nML6VAUZHMjCFICG5EBk1MXGhzsjYtOD7y/f9plrmCrDw==
X-Gm-Gg: ASbGncvRpoGorp+JSFD0ODfbyiUtx2H+ZHe8xDlcF3NPEToXX8LZFQxkUiUIhpvmshz
	pHr747QYqBKvWTYFeOm9nRBZZVuNh/YciDXxePCBguFQNEGEprflj3AsXg4M7szPiwhNyTojDQN
	8A9lXkZOYTu4pURCKLYJLTyDR10wBiNwtrToaPN/x6UP988WeGBAzXTYOtZc1HN44mEHYbp7dlr
	PUaz5Es+uavFtntNEZS1g2vtsGrqdbWHBsZPBoDovoFsRdv19WIRP/xEcbGtXnnBEmz9zg5XZgV
	UCAhJB0k0nwnaK7H/XGBf4G2w/v+dGmut8N2njViKEo/GknqgyvS/39jvIUgfqmfWU/DEi93sEb
	d
X-Google-Smtp-Source: AGHT+IEfuWflZSaLdRG/nS1r6jWnAs4qCszGzcwGPoUAe7nR8VPv+cXuKMqqlAUdwkjTL9I9MGgzRg==
X-Received: by 2002:a17:907:7f17:b0:ab2:b5f1:5698 with SMTP id a640c23a62f3a-ab38b44e10emr4538752166b.38.1738061926137;
        Tue, 28 Jan 2025 02:58:46 -0800 (PST)
Message-ID: <a3b62c5e-44e7-4592-8075-844b219df216@suse.com>
Date: Tue, 28 Jan 2025 11:58:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/24] xen/console: introduce consoled_is_enabled()
To: dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-5-c5d36b31d66c@ford.com>
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
In-Reply-To: <20250103-vuart-ns8250-v3-v1-5-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> There are few places which check pv_shim console under CONFIG_PV_SHIM in xen
> console driver. Instead of #ifdef-ing, use new consoled_is_enabled() to
> customize the logic.
> 
> Header file now can be included w/o CONFIG_X86.
> 
> Signature of consoled_guest_{rx,tx} has changed so the error can be logged.

While you use consoled_guest_tx()'es return value, consoled_guest_rx()'es
remains unused. Why change its return type then in the first place, even
more so when these adjustments are pretty much unrelated to the purpose of
the patch anyway?

> @@ -508,11 +508,9 @@ static void switch_serial_input(void)
>              break;
>          }
>  
> -#ifdef CONFIG_PV_SHIM
> -        if ( next_rx == 1 )
> +        if ( consoled_is_enabled() && next_rx == 1 )
>              domid = get_initial_domain_id();

Isn't this again a bug-fix-like change, without this actually being
mentioned anywhere?

Jan

