Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839C3A046F7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 17:46:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866674.1278017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVCis-00047E-MH; Tue, 07 Jan 2025 16:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866674.1278017; Tue, 07 Jan 2025 16:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVCis-00045b-I8; Tue, 07 Jan 2025 16:46:30 +0000
Received: by outflank-mailman (input) for mailman id 866674;
 Tue, 07 Jan 2025 16:46:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVCir-0003do-Am
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 16:46:29 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0e05869-cd16-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 17:46:28 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so162799015e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 08:46:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b4432dsm632985345e9.41.2025.01.07.08.46.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 08:46:27 -0800 (PST)
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
X-Inumbo-ID: f0e05869-cd16-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736268388; x=1736873188; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N6vrKGTX0KxATwjBLqj5b/5b4OXXpH1B6XY960fwugQ=;
        b=GQVChVJbLPwVlwSkacvj+WqbYrYtPWN0AKR7XMzAEgil2Kthxo4H3uMcQujbZUryDs
         yOWgPO7KpnCcnEVpYSE+3U6rxkCQd1JFnnPiCLzWWI9khpxMFAnRKXarL8R6RmvYNxZG
         mVadYcq9wMND/WiWvd5Vb5a5K9b9lkmBFahDNjMTXd3cU4Ruu0ooiH7tHgK0p6EwKt+N
         WXNLgt5veKQgBTC6LDHsLiqJT9sA+wrsz2XD8a9BK7Fz2UcaBpSVX1ZZ15DzEw8zlvmd
         jFpn1VMsQ37SObyvlBJyd7mEke1R3Ry0Q4rLAeW5dcmm9CGiQvg+VfFtLfDuseirqYgR
         /WHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736268388; x=1736873188;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6vrKGTX0KxATwjBLqj5b/5b4OXXpH1B6XY960fwugQ=;
        b=Zm4NSdjZCn2ViV0rYOjXYIq7k/ZvD6iSNkpKcQF4TOFBqqx0t+wBaBMEsn1pJ7x8Sk
         wAw8VKFIvgvFn/QymOKFJENuEAXaBOpWlTeTiKnPLiy33EYVVKGBmpqU650Lb1fO7Jtv
         EWSfhD0UC1B05rXWi6l5ATpKo2Q70OmBj0Mdei/M+QZDGwDh0UfkwhkvMy6NQqSrIASj
         sANbH4p74IWuMKKMUdMjU4UpAOkMmoZ4Irm2pkO1/Vb+dbLP6ik0wddCbgvA1N5M7igc
         P+HuQqU8WLRMfYNyC1L7S/nQRjzgzDYk5mxDTp4kPrTWMYwJHpMjAPgNuf+45jZ2lSAj
         vyeg==
X-Forwarded-Encrypted: i=1; AJvYcCVNGEK4OjW5pOeRVfk8oqPt/vduLGdZTX3/5gIyqtWR3VqHM6Dm7HicOl3HmZS06zGPWpZRj7DxMHc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZfWTH+cK3bsUYA5sjr9UFTUPjFPuEA/BVLhnsQaD7IC9Njpmd
	ZBwenCrqU8dJBuyX8Jt2UGQ2jq1x1ulFxPDh2gjiae34o1lUS9usIjF/SKeydg==
X-Gm-Gg: ASbGnctCaoqSE9sdjXTMkD/Tyj98CIzauhRemqm/svYJfUMymqrrqRur0hGmUu7LwWh
	vYEKUdH0VY6QdIrte6mi7y+b+jGSDXZKu44l26PzpPjJbUeHeADlCKN+4nt+BOFY/752qTL7uZ+
	KlD3LKJiPTffyWFlJzU3cPo6w3G1zV7ZotMh2c6NzLzQI2dlC/IdtoKmgVak4XeJMFGPR5qf7c4
	8ABc+zG8qnPxbHJW/ZWdIT0wmvyUY2rirtWs1Eg39pN+dp/A1HR2d+kGfhabDKgaQ/P+ACyYTvy
	CNEFzQlhwrUdaffX+tTu/A/7s+LebGLoCu3gezbP+w==
X-Google-Smtp-Source: AGHT+IGzqsDV2iv6LmrqPOACmPWY1p+/WDxdA6pLWNC++Db6n8csHiOcXuEgOxMQS/qFT84QcPYUXQ==
X-Received: by 2002:a05:6000:4618:b0:37d:4833:38f5 with SMTP id ffacd0b85a97d-38a221f9405mr50932907f8f.30.1736268388167;
        Tue, 07 Jan 2025 08:46:28 -0800 (PST)
Message-ID: <d6eb70a7-5895-4471-95b3-609f133fa457@suse.com>
Date: Tue, 7 Jan 2025 17:46:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] x86: Add Support for Paging-Write Feature
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1735837806.git.w1benny@gmail.com>
 <31a1ff2d5d1e17bb73231e008f1e47c501bb3ce8.1735837806.git.w1benny@gmail.com>
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
In-Reply-To: <31a1ff2d5d1e17bb73231e008f1e47c501bb3ce8.1735837806.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.01.2025 18:13, Petr Beneš wrote:
> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -154,27 +154,39 @@ static void ept_p2m_type_to_flags(const struct p2m_domain *p2m,
>          case p2m_access_n:
>          case p2m_access_n2rwx:
>              entry->r = entry->w = entry->x = 0;
> +            entry->pw = 0;
>              break;
>          case p2m_access_r:
>              entry->w = entry->x = 0;
> +            entry->pw = 0;
>              break;
>          case p2m_access_w:
>              entry->r = entry->x = 0;
> +            entry->pw = 0;
>              break;
>          case p2m_access_x:
>              entry->r = entry->w = 0;
> +            entry->pw = 0;
>              break;
>          case p2m_access_rx:
>          case p2m_access_rx2rw:
>              entry->w = 0;
> +            entry->pw = 0;
>              break;
>          case p2m_access_wx:
>              entry->r = 0;
> +            entry->pw = 0;
>              break;
>          case p2m_access_rw:
>              entry->x = 0;
> +            entry->pw = 0;
>              break;           
>          case p2m_access_rwx:
> +            entry->pw = 0;
> +            break;
> +        case p2m_access_r_pw:
> +            entry->w = entry->x = 0;
> +            entry->pw = !!cpu_has_vmx_ept_paging_write;
>              break;
>      }

Hmm ... Instead of you touching the bit in every one of the case blocks,
I was expecting you to clear the bit ahead of the switch(), accepting a
double update in the p2m_access_r_pw case.

Jan

