Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3927281B035
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 09:21:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658575.1027799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGEIn-0007N5-7o; Thu, 21 Dec 2023 08:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658575.1027799; Thu, 21 Dec 2023 08:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGEIn-0007LO-4n; Thu, 21 Dec 2023 08:21:09 +0000
Received: by outflank-mailman (input) for mailman id 658575;
 Thu, 21 Dec 2023 08:21:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGEIm-0007LI-60
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 08:21:08 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3a37e9e-9fd9-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 09:21:07 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3368b9bbeb4so102431f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 00:21:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j10-20020adff00a000000b003365fc41bcasm1428984wro.51.2023.12.21.00.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 00:21:06 -0800 (PST)
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
X-Inumbo-ID: e3a37e9e-9fd9-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703146866; x=1703751666; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2F7q5Fk6q0XRvTFT/mTRwabYu1spTDASJGoBpToE9Rg=;
        b=I5gMy9kSMVqtE+oQ1V4PlaSk2uPPtBIZc8uzX8vMjftE/QotgI97V5v1dU7g5dndOd
         emw6RuyszQjMAu7kgo65tvp5uVomcjZU62Bzc2Fz3sBXQlZeiTEp7pT9HNLfPdzvC+Lg
         FIEXzfgwpB22hOjJN8AVFjWlk9s4PmurO7A7xWMOyzAb2FXbSqJAbZytlE/BBL01ql2Q
         faV5xy2Z+DtXVnMXo9GESaY/skuKgYBp67BzqAsl2Voe9Asf5dLdd11ZHuEDq8hZJ/qE
         ZChoujWL89ib0MIpNzujvgdRo6VTPvTJLYh66AI01SJyWTfc1T8vdxL5Sw3QhUrYeDd+
         RP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703146866; x=1703751666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2F7q5Fk6q0XRvTFT/mTRwabYu1spTDASJGoBpToE9Rg=;
        b=Bk0rtNVhzzENFs1BuyM48/ALkgYfUu+bBoraYA9hKTcx6IrCfY6++csKtCpGx+zOEg
         hU4+Zgjf3+fEvdTfZtg7hlvuqNjmDjNLZBZKWkDw8yuSFrRYaCy01dn5VWRFUWmLLr8W
         bTfA5Rif4OROVQqrSwnk3N3HYs1S8Fb93A4BEPQDGjtnq5ZCPT7idbMb384wxBCru5MO
         JGmb4pC6MGmc30wbhGlT4UCjWJPhu4PdvA7SDgm6RiHnfbwXnuE3p72UvpUIO+GflHKJ
         YS9QVgvcNgWYP7bgkylS0wfVFeeKH0FktzcIOYzMPLjyEIEukPI9r0GYgxTzlVsFgSnD
         aAGA==
X-Gm-Message-State: AOJu0YwBaOg4V6vKfOHUVDPCOgXLj+f/iPjw2/tx5TwYDiAndvVzYpPr
	69Va7/fYk/wGt4XsmQPq897e
X-Google-Smtp-Source: AGHT+IFFBF7273DmakIqA7wcF7DIDD9+1/GnueEKED8ZKkGw+1+hYLCrqRoPqn3qIeRyWe0SptgabA==
X-Received: by 2002:adf:ee86:0:b0:336:7ff6:af9 with SMTP id b6-20020adfee86000000b003367ff60af9mr319260wro.212.1703146866689;
        Thu, 21 Dec 2023 00:21:06 -0800 (PST)
Message-ID: <ca09561e-4e6a-40ac-b543-80053224f64c@suse.com>
Date: Thu, 21 Dec 2023 09:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11.5 1/17] pci: msi: pass pdev to pci_enable_msi()
 function
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-2-volodymyr_babchuk@epam.com>
 <20231220214628.431512-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20231220214628.431512-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.12.2023 22:46, Stewart Hildebrand wrote:
> From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> 
> Previously pci_enable_msi() function obtained pdev pointer by itself,
> but taking into account upcoming changes to PCI locking, it is better
> when caller passes already acquired pdev pointer to the function,
> because caller knows better how to obtain the pointer and which locks
> are needed to be used. Also, in most cases caller already has pointer
> to pdev, so we can avoid an extra list walk.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



