Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0B2AD3DC7
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 17:46:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011073.1389384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP1Aj-0003Vp-Gc; Tue, 10 Jun 2025 15:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011073.1389384; Tue, 10 Jun 2025 15:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP1Aj-0003UM-Ds; Tue, 10 Jun 2025 15:45:57 +0000
Received: by outflank-mailman (input) for mailman id 1011073;
 Tue, 10 Jun 2025 15:45:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uP1Ai-0003UF-37
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 15:45:56 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fde3bfe0-4611-11f0-a307-13f23c93f187;
 Tue, 10 Jun 2025 17:45:53 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so4605190f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 08:45:53 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5322aa3c0sm12450902f8f.22.2025.06.10.08.45.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 08:45:52 -0700 (PDT)
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
X-Inumbo-ID: fde3bfe0-4611-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749570353; x=1750175153; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ye4BOMohhlw7Z0BEcrYqBlRvGxBbQ5Cho9rGrm3TBps=;
        b=AfNDJT9OWSq9SAazRRvGHcwGLdwsZJKrcCoUQKkyDzm6MfUwHXbjmb439jif8TWF0q
         gs0sGbrrhCBMVmi3b8N7qVD3CEBLFVSqzUHYPT4bkHWFFMFKPhl3VuSC4/SX6DCYhX8g
         fDHQ2Ygtxcs4/3smushhRQ3v+euGygnC7Lf5HtnGB2/3zz/Y/8s6DOvVjT6m4WHF174W
         YBm6GtjXl5bULYNNEJyKP74hGwuSLt3hRnNyPIVla2VhEEX2C3kkbC9LXMgDqcgtwOX9
         AHFhLMPmvrGdr6Q04PevVvD3ze8ex+BgOZTjm1tX8Ucah4N5MJJYkp+2eH1a47piSF9H
         cwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749570353; x=1750175153;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ye4BOMohhlw7Z0BEcrYqBlRvGxBbQ5Cho9rGrm3TBps=;
        b=WNsxDuLqhuwjI2x5n0SuIzdaR9g6a7t6QDjKyx3WMqAdMZrfny1IFqllbBUoFBjAI6
         af0L14ziBqC3UdhCuUEf2W+Yhi3lB8YO1Fh2NQkm9FSHainN6415/cM7koa2NjQE3mSG
         WJfXclz0+BtM1McwFHHXO/G4X03JbBqZYEn5ox/xL1y8RzViSXMwgs7J8hCAeyoFBl+V
         n9nI3CKEJyIxNBB37KKuyA3qFAex3gk1IKEMNmaDcKZIXMiBJv/Zw+4DJWSWsGO35sEm
         8wi0g5AxV7ljhUhC4rXGDYa/yWq2atJKH6v+IVvz/mpSk8meu2TvxmbihqNh+KcKz55F
         vkkA==
X-Forwarded-Encrypted: i=1; AJvYcCU0CQskPZYA3Jtt2fL3XVeXhNvUfUsvQoluTCclWGF9rDpiZqcgNNOLfSvNTiYjKLS3SRhdwKgvyno=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+8JgS7r9AsOkdw5Ty6Z+Oaklu6Y3yTuMgPe5j4on+7DOdru9Y
	Tp2AMrEutkiEiNT8P+As4tv34LgQ4Z2lorXeWelxB8td7n3v2jJrfc+XlJ2JJejPjA==
X-Gm-Gg: ASbGncuCI/vZY0+tE5M2kU07Lq6SmVgipD8ZB7B68KgwenTZp0TNI00SX+NLs9FUyTk
	oKdh6T3hSL+AuM9BUuNehLomN3K0iQJvma+yllHJGJd3/XighrRgbGT3F26zc081jSrEcULja/D
	5wo9Y4TwbGj0tDDRNQ3wCC99aYIFuW/0FBY6+dy4dJCe1f6J44C/qTZ75WmE/3+Ut+KQ86Dui7s
	L/Kaa8oUpjyL0GhTj/Wi1vwDfXFdk9PFX9aHgsMac34H2PQqLc04WS/yJR0r3Ens0A0AErgZQr4
	43x/DrmiPQCU0EtJfGuircjVKdwmaY9h0iJvfhHY43skcuZTNApeygYvHc83y4lPbp1Adz94nIZ
	KZmRlTZFTf3E07tfwyoL4puUfoexNgF7RMMUCN90wNDaJfJXIZJOXRaZX92+94HpXOQdrapePiX
	QBSzb5QHoLK2uLmVRtKv3j
X-Google-Smtp-Source: AGHT+IG5cDHXhvZ5cvr6FJUopTGCDmbmBJ3daL6UNeVDU7jx5AOo1tPKU3HOt3G70SvQV2Y0nbEPJA==
X-Received: by 2002:adf:f08d:0:b0:3a4:f70e:bc25 with SMTP id ffacd0b85a97d-3a5514111d7mr3241750f8f.27.1749570353208;
        Tue, 10 Jun 2025 08:45:53 -0700 (PDT)
Message-ID: <bdb0d15b-619e-4ff1-9db5-0beb07683a39@suse.com>
Date: Tue, 10 Jun 2025 17:45:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/hvmloader: select xenpci MMIO BAR UC or WB MTRR
 cache attribute
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Anthoine Bourgeois <anthoine.bourgeois@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20250605161659.18201-1-roger.pau@citrix.com>
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
In-Reply-To: <20250605161659.18201-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 18:16, Roger Pau Monne wrote:
> @@ -271,6 +279,43 @@ void pci_setup(void)
>              if ( bar_sz == 0 )
>                  continue;
>  
> +            if ( !xenpci_bar_uc &&
> +                 ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
> +                   PCI_BASE_ADDRESS_SPACE_MEMORY) &&
> +                 vendor_id == 0x5853 &&
> +                 (device_id == 0x0001 || device_id == 0x0002) )
> +            {
> +                if ( is_64bar )
> +                {
> +                     printf("xenpci dev %02x:%x unexpected MMIO 64bit BAR%u\n",
> +                            devfn >> 3, devfn & 7, bar);
> +                     continue;
> +                }
> +
> +                if ( bar_sz > pci_mem_end ||
> +                     ((pci_mem_end - bar_sz) & ~(bar_sz - 1)) < pci_mem_start )
> +                {
> +                     printf("xenpci dev %02x:%x BAR%u size %llx overflows low PCI hole\n",
> +                            devfn >> 3, devfn & 7, bar, bar_sz);
> +                     continue;
> +                }

Is "continue" really the right way of handling the problem here? We didn't
skip this BAR prior to your changes just because of either of these being
true.

Jan

