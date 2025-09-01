Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B80DCB3EB97
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 17:56:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105177.1456132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut6sk-00031u-8f; Mon, 01 Sep 2025 15:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105177.1456132; Mon, 01 Sep 2025 15:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut6sk-0002zD-5o; Mon, 01 Sep 2025 15:55:46 +0000
Received: by outflank-mailman (input) for mailman id 1105177;
 Mon, 01 Sep 2025 15:55:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut6sj-0002z7-JF
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 15:55:45 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e37465c-874c-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 17:55:44 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b043da5a55fso93288066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 08:55:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b042a4b3110sm280325466b.49.2025.09.01.08.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 08:55:43 -0700 (PDT)
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
X-Inumbo-ID: 1e37465c-874c-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756742144; x=1757346944; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wc1IbT75z30hfNaM4eYm7WwvCn86qqWn0tIobmwcmDU=;
        b=Zb+9Fj1cl6sxR1npZsgDL/RXabfau8fw0nfpPjBA40HAwMFIN2w7hlmrwQELfZlS7J
         fHRq4s5FDdTX66pV609pFCKSEkBquAx9cGet/XTnYqryAPDUfSIZGpZV84IhapPJM2aM
         7plH3WosqrUdB7MBfJSwPlv6ckdEuRCgMRSu5F+3vO3sQv3oeK/xX0Xyu+SF7NyXvOGU
         aeg+8aonguDk2H77Ozi4upS67jYxJ3fADDzh33URZFfreuPNiAtFE8RpwiATq5d5Gomh
         GBsqCM+iLOlTYJ+35qG9wdNZeeUbq4BTzgI4sLyFP3HJV5tepRzOjq9QRFvQdkCmehal
         zTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756742144; x=1757346944;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wc1IbT75z30hfNaM4eYm7WwvCn86qqWn0tIobmwcmDU=;
        b=PPHhJbZd5q5Qr/QoYc45tsLvIx0EZTr1k/H9U03AOy/FWOJxMCsUmzt512VDPJxo8U
         UFexs88Tk3602yv+RojjRisTFpAeuMr0dTFZZqlLKGhJIunTA4LrYGzDn7fm7mLxpNZR
         qN2mZCfPQzbhOhn9Ozmkke5HQbh/h6LOpXQog2UAQAfYHNSXEstfX751LNdEmCjkOIhm
         DKEidz0a+ScDuVls0ExcnpjtTqDdRlsx0j13wFHHzXIi4PftWWNubY9kW0H1bhcE7GER
         Dby0oT+L3SKwEsM/UABD2IUTNoE9Da1LTDJd72aj/dQFnZyzs3jP9IhsclK4jmj9fD+O
         kTDw==
X-Forwarded-Encrypted: i=1; AJvYcCXAo4G8gaIq0JQYu2swY1xMJzY1n2EdW/ugTYW20cPVws13mlAmDesPUj9mJR9qExh5ZLr0Uy+d2N0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzt0pfKRDy1k0MPwAPrsIIRbzYX/oWBmZIYEAOyuHOi8n6pqbu/
	85J0/Eggrlt6RyllOJ8vsoNZ54Owzpieh8JqLpxza6eK8oBOR0EscsITm1Jan4KA5g==
X-Gm-Gg: ASbGncsI1xrH8Z7C0aKj6hGhI88G6cR4pF+UfAlg+CsbM6DXXYDipDg+0kSxeZ3OJ0r
	Xg3bhrIYqPCOHQFUMt5/7XIqUttuYdvRwBFndGz9D9YpWdHZgxrVrYD0n0pi+bXCjvX3tRQ7ipA
	xA/XGceKl1qdQTNh+AGoPK4HUB8zDqW1fUfqjaiEUTnRMChWpPLSCEulxOBzyxvgE2iF7oCDOB5
	Pm4wEg+xAK7AliMCqbU0jxm3d5sIJsG6L+XRhyLqR2LjEQdSmTTAhDtplgeZa8TEEuaJ7tsekRn
	bpD7KBSVAHli65xfxpONe2B8Z9wlf6RGjpVdkQH2qW0fNrLd+2lNu5qu3ergNBuHUE73eAqUDP2
	32ccq84W7qVpexzyWDoc7bfUwl7J4YfNNd1B8K4Mp7d+WwxgPXehVQP+JXNMGCKx5PQXM/BnuDW
	W9PBSo3Lc=
X-Google-Smtp-Source: AGHT+IFO5bSXwMTfEORZKm7GOoDf5t74C32F2t948i4P9mlKdH/mSSYWcXlP3Kk8Su7WE3RNlAPUfQ==
X-Received: by 2002:a17:907:fd15:b0:afe:ef48:ee41 with SMTP id a640c23a62f3a-b01da23e859mr889305666b.58.1756742143856;
        Mon, 01 Sep 2025 08:55:43 -0700 (PDT)
Message-ID: <d4fb77fe-e956-4c3b-b7be-06fc36fe4be4@suse.com>
Date: Mon, 1 Sep 2025 17:55:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2 1/3] xen: Define xen_domain_handle_t encoding
 and formatting
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1756460430.git.teddy.astie@vates.tech>
 <a12f705dae18ae2b87c9e21027d14c4e60bff146.1756460430.git.teddy.astie@vates.tech>
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
In-Reply-To: <a12f705dae18ae2b87c9e21027d14c4e60bff146.1756460430.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2025 11:58, Teddy Astie wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -11,6 +11,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
>     - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
>   - Linux based device model stubdomains are now fully supported.
> + - Clarify guest UUIDs as being big-endian encoded.

Is something like this really in need of having a ChangeLog entry?

Jan

> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -973,6 +973,13 @@ typedef struct dom0_vga_console_info {
>  #define xen_vga_console_info dom0_vga_console_info
>  #define xen_vga_console_info_t dom0_vga_console_info_t
>  
> +/*
> + * The domain handle is chosen by the toolstack, and intended to hold a UUID
> + * conforming to RFC 9562 (i.e. big endian).
> + *
> + * Certain cases (e.g. SMBios) transform it to a Microsoft GUID (little
> + * endian) for presentation to the guest.
> + */
>  typedef uint8_t xen_domain_handle_t[16];
>  
>  __DEFINE_XEN_GUEST_HANDLE(uint8,  uint8_t);


