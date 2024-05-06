Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDA68BCEE6
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 15:25:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717649.1120070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3yKr-0000D8-3d; Mon, 06 May 2024 13:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717649.1120070; Mon, 06 May 2024 13:24:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3yKr-0000BH-0k; Mon, 06 May 2024 13:24:53 +0000
Received: by outflank-mailman (input) for mailman id 717649;
 Mon, 06 May 2024 13:24:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3yKp-0008MO-IH
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 13:24:51 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03ce3cc9-0bac-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 15:24:49 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-51f8211c588so1926150e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 06:24:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h11-20020adfe98b000000b00343d1d09550sm10711581wrm.60.2024.05.06.06.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 06:24:49 -0700 (PDT)
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
X-Inumbo-ID: 03ce3cc9-0bac-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715001889; x=1715606689; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KiJBdPPRY/NUJaEPZJ4xZh1WqKJ1mjEkLa8gfRm5A6Y=;
        b=UlVSrjDVNUhau509H15lwlJvQ8V23Dl+RDWxuvaYw0iXwv6S+vW6aSxFu6CRHwb0dN
         ILjGkSug+ZpHNS1pcgN/LHGetnGNY4LdIfW6S0jrnZVJSHDIAyWDBT1VhN1hMQ5sMsMw
         121JVGgVGBgd7tQFkPIcQmm0jKWWVIUyMsZYwZgdhZHdvfFQcbRfxrfjkfRf7jHlnBTx
         kaIhKacBa2N6jYh38MD0rK2WdTenvzLvyoodtVUT8BqOGD2XR7Zz2AMoAV3vFW0DGsta
         W03h2GzshuKfKiKS5qUbcvZvTwSBYL+LTLFolhbB5MMseEWidQCuBJGm9b1FVHOYOscO
         rfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715001889; x=1715606689;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KiJBdPPRY/NUJaEPZJ4xZh1WqKJ1mjEkLa8gfRm5A6Y=;
        b=CqWM0/E4FLVymoY/L4r8v6DVPX/qFfgbVPXvm3mtqRxBBdphtKdCCFRvgZwCcTam+B
         o/J4ntQoKHfs5VWBvU5zykiDfydBW71YypB1sRVCrKqTlN7Hqtkcf9TmwHFt3f+00lI4
         AqGUgrRH8jXJG/fsoUSafu67p6qUGTJ0T+RCadDcdUaFjduAyVkjr+fLPDVkNhh2HBy6
         it56Cpek7GyJNGdtY3C6hdZ4WYpI6tx33tXDBNyhrsOwVn6sPTAoxoRreYDQia1D4A3v
         iIpOg6sZ3k6Lqm4R23f9JVfkBxOpDtAR6pFCzGpM5uKQXPNUxImICO+wnxYMjVC9neg/
         CVig==
X-Forwarded-Encrypted: i=1; AJvYcCVpkaXL7RVUpF+RmQj8BTkqWfBVE3FHzLsztDidophgDhFMfeudixFn2raQNg+YBUYDpXWfY3bFvlLpjSeFu7pwXbAWVaTaaiwSuVpYmZ0=
X-Gm-Message-State: AOJu0YwI87VRruSQBmBSYHYIth2K/ScVebytgzjRpDtA2zf6huQykoGf
	cA1Ad8jeZdFhPyjVJNjsc/sNVHoXKELfZFNOwniXlVe5q4ZhaOfUHJHLGHDH5w==
X-Google-Smtp-Source: AGHT+IGewT+MutigeIuDr5hJAY1fGM1J73lQvtbidYmsNdhZ9inG1Z/Zt9Hiebjk7BgodK5Iz+Y8SA==
X-Received: by 2002:ac2:4959:0:b0:51d:abb3:d701 with SMTP id o25-20020ac24959000000b0051dabb3d701mr6568286lfi.5.1715001889409;
        Mon, 06 May 2024 06:24:49 -0700 (PDT)
Message-ID: <01bd95f8-9122-41dd-9bc4-0fb6bbea1f6c@suse.com>
Date: Mon, 6 May 2024 15:24:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/13] xen/arm: add Xen cache colors command line
 parameter
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Luca Miccio <lucmiccio@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
 <20240502165533.319988-12-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240502165533.319988-12-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.05.2024 18:55, Carlo Nonato wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Add a new command line parameter to configure Xen cache colors.
> These colors are dumped together with other coloring info.
> 
> Benchmarking the VM interrupt response time provides an estimation of
> LLC usage by Xen's most latency-critical runtime task. Results on Arm
> Cortex-A53 on Xilinx Zynq UltraScale+ XCZU9EG show that one color, which
> reserves 64 KiB of L2, is enough to attain best responsiveness:
> - Xen 1 color latency:  3.1 us
> - Xen 2 color latency:  3.1 us
> 
> Since this is the most common target for Arm cache coloring, the default
> amount of Xen colors is set to one.
> 
> More colors are instead very likely to be needed on processors whose L1
> cache is physically-indexed and physically-tagged, such as Cortex-A57.
> In such cases, coloring applies to L1 also, and there typically are two
> distinct L1-colors. Therefore, reserving only one color for Xen would
> senselessly partitions a cache memory that is already private, i.e.
> underutilize it.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



