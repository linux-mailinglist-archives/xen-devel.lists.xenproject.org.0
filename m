Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BA8994591
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 12:37:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812983.1225738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy7aH-0001pB-Va; Tue, 08 Oct 2024 10:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812983.1225738; Tue, 08 Oct 2024 10:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy7aH-0001mS-Ss; Tue, 08 Oct 2024 10:36:53 +0000
Received: by outflank-mailman (input) for mailman id 812983;
 Tue, 08 Oct 2024 10:36:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sy7aG-0001fx-GR
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 10:36:52 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a15b935-8561-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 12:36:50 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-53997328633so7074115e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 03:36:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9947ec941asm355057966b.54.2024.10.08.03.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 03:36:49 -0700 (PDT)
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
X-Inumbo-ID: 3a15b935-8561-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728383810; x=1728988610; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E7w+Lza7mtTvwar/7bwJvXeztIEDPySn0Yny7jXdBVI=;
        b=GmMMy8bSg2k3X41yC3X6a0Xub//LSssbiuBDiqasJuZ6WEdAoRBphSbze9sTdaZ7uf
         737YGv3KMMNJXAARJYZBtXjtEJQfT68ThchgocEeLZCrMEg2Adag5k2FnoIHQjrxo7SB
         dIjfqZn5R9syLVSQsVc+uMEJ+fS0Dd0/JayGplfamHojW8zKi+uf0WK3trOEaIwgSa1x
         vgHpFa3ddL1/36TPzUydv/twK+fuMAA5H7zMG3bjYXJPB7VlAarCZuFKFyuln9ZZuQl+
         Suic4hWKBVEjE2MCryV3ERzd8YbAQPCmUnHbo6qFP9y53S51c5A9NWvoWz9Dr/l8Hv3B
         Vtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728383810; x=1728988610;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7w+Lza7mtTvwar/7bwJvXeztIEDPySn0Yny7jXdBVI=;
        b=i0x9ru8lxq+/ZK+C9QCG7Gw1eZgZVq0aG2ZuYWZ2PGa4or8AGcFs5s3dgHrsxgk6iQ
         7bzZybKJLAJAaqCs+aavHel1Mr8rcDGehqZErWmsJEhc7W18Ks54R+AEEk6BciEPkw/X
         OhX1VefL7eBNDNfP9V1yJ6dqB9pJLNOoSxn/cSi7PjMMDh4CNYLJ4sHk+W9lAES10MAi
         OsRTNh1mg8EcQICpRsYuOfjZA/UBeTs/bJzfcoT41KHmL9Jwo4f1fqL2APWlE2/4OiCZ
         x6stCBKJFCuBR4hLm6I/v9lMr33oOa5hi5BRIDvrBltJsnYxfcP/sFItwcaP3EVVl4da
         S2jA==
X-Forwarded-Encrypted: i=1; AJvYcCXU4FMKi+eui2voYd6Y15Y4StAltECp8JZoJdyF9pXmtha0uYeBtJWCiw89Aq4JeUcHWNfDZCFOor4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypA0baFSLDpVfYcbdq+89/rFxkCYFWI+5O/nFYAF7DQOmEfqhZ
	BCNGPo1Fb+HMG0FYrAkDQ0SCqb3IuPaV6sJKFiOsZ6LM4Af97e6OeLGlrz1s5A==
X-Google-Smtp-Source: AGHT+IFCYIFr+sOcWoFFHCuXS97jl9BSsHhf+ygQnjLyhxOnOwLjKuVcYSYrlAiGWyuxigR9xJGoZg==
X-Received: by 2002:ac2:4c45:0:b0:539:8a50:6ee8 with SMTP id 2adb3069b0e04-539ab9e6ed9mr10453318e87.57.1728383809901;
        Tue, 08 Oct 2024 03:36:49 -0700 (PDT)
Message-ID: <92176e9b-a486-4607-92ba-d531b4f16bc1@suse.com>
Date: Tue, 8 Oct 2024 12:36:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/riscv: switch LINK_TO_LOAD() to
 virt_to_maddr()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1728057657.git.oleksii.kurochko@gmail.com>
 <5975a3a2d5d499244825e88cac3f9b6b4e9ddadb.1728057657.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <5975a3a2d5d499244825e88cac3f9b6b4e9ddadb.1728057657.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.10.2024 18:04, Oleksii Kurochko wrote:
> Use virt_to_maddr() instead of LINK_TO_LOAD as virt_to_maddr()
> covers all the cases where LINK_TO_LOAD() is used.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



