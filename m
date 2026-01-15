Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D301FD23931
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 10:33:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204526.1519181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJja-000307-8C; Thu, 15 Jan 2026 09:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204526.1519181; Thu, 15 Jan 2026 09:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJja-0002yD-4i; Thu, 15 Jan 2026 09:33:42 +0000
Received: by outflank-mailman (input) for mailman id 1204526;
 Thu, 15 Jan 2026 09:33:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgJjY-0002y7-UC
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 09:33:40 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 459a920f-f1f5-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 10:33:38 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4801c314c84so1417895e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 01:33:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af6fca57sm4532916f8f.42.2026.01.15.01.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 01:33:37 -0800 (PST)
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
X-Inumbo-ID: 459a920f-f1f5-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768469618; x=1769074418; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/99ddwQSI5EW2LBegFhid5W2imJC03ePbUzWYJ3u+OI=;
        b=UzrEXd6CtkKZ0unA+60rrEsP0xg6K5nojVePl4vqIsM9QDe46k5nv/XWrlDyv2EA3B
         +Pdz2Hq8ZnXVM1EPs0YM0T9q1jegYi7OF3ZEBG3PpLODv1cBysqEtSRnksF8Pw4ctBEm
         szsQ23oDmEkgluZrTZ31pAZvjgVXg6SD0239kF4h6t1cYplEI4M0RPQES/GNVUBSzooO
         VZxNBALQ01L+sWBbbtOWXP1lFoDUz8AkGqpehg9DiNsqA0UeaAEICcwhxjQZt0lEIPyb
         gjzI65d8+WyoxHyi7Ipyy5Bw8Gz2uy6a4dADhcja+phBEj+kLgn0jodyd/ZE+eUPF1vT
         W4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469618; x=1769074418;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/99ddwQSI5EW2LBegFhid5W2imJC03ePbUzWYJ3u+OI=;
        b=Rn/xWB5bMthTJf1NudzkfBRDOXykBppT7eNQQ1WaK97ywdPkVgER1CJriu9ldd729g
         Y8QceKJ8Oe6pufCGKjyjNpnxi+iejBt50rEtG+sxinulsWL0HBd8UEjD8hyiBmPHy1Oo
         hDuszCLJ5IoK3e+fvn82qQ5j6qnelWkC/XW++G+eY1nOC/ILxMkIyl/araupvjHL5Q4W
         GkMqyAj0jKdVM9Opf/NW56GXwCKZeYjHLy0iATqcC4zKOeLgsT88FEEu0co5p7BUJ55v
         AMDE2u8iJeUyJ5N+D5ACTae3BvWeEkkaR7rJbCZir2gtCKXHKaCb0Yn+NeA3K8FTURoR
         peVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaaMTq7CSfgkfby/ABBC/cqTA2jss608jMwZgziCsoinF7OLd3Uz7C3EPJUdQo5wpGOL6zanoG0Gs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHE0GSPFBkYH0M8pgLNWdRkQt0bJ8DdnL4ke0hg5+d4+bzGSuv
	jiSghi3jnQOQiav2dqVhO2ymglWYWGFYLPIW+G3T/MKac54iUIHakH1VO4BqJJgBXg==
X-Gm-Gg: AY/fxX7K/eBgd7jZ6I0sZVk6VYqel84mRw00DEXdeLKIMMaR4qhX7fLUOSlk4+LHSyO
	YyVXqtNqsqoWWRfNxQr2+3lqZP9SaZgb/iV8LlRjeYaxXmsi4XQl76ZlLj+3AODPS5jUjFPpzJn
	XDOJiRxGsn80yE487mJxQqZx8LYNHSqZGZG2qHJfYG4JX2pb1RHBj+1TD4VG5zIPogGTBzU9N/D
	D++dbcwfbk7paliGJ1DfZswUH3xhQ97GMhlYiN72CbGJOtNpn+yFBda1R1sMz0YOVNObe0kX9L7
	XeKOXQ7hCyDWHIT2HW9nOGx7YPzHlXOuea6uTeygdJZKlMt1iyqbPD0/ruK4rNWsZwU84EX8VLC
	aTwUfaV7znipWlAbbSmuUOc7ryFp05G3ZA0sdSlqwF0HLDLvtXzUz6xF0cnfYqxXtZCZE3eWYXL
	jAG7LMeHjX0Rs5I/JMWiuT1S9aJqafvSg2+NOSeigToMkZzHFfIQhZ2940mlhab+PQKd7ZBTHRB
	H8=
X-Received: by 2002:a05:600c:8217:b0:477:7bd2:693f with SMTP id 5b1f17b1804b1-47ee3317131mr61238015e9.6.1768469618114;
        Thu, 15 Jan 2026 01:33:38 -0800 (PST)
Message-ID: <29c2d1dc-23fb-403e-bb03-d8c2f32424e6@suse.com>
Date: Thu, 15 Jan 2026 10:33:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 driver
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1768415200.git.oleksii_moisieiev@epam.com>
 <ee4995bf385f0ec691151fb797e14acdb5419c6b.1768415200.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <ee4995bf385f0ec691151fb797e14acdb5419c6b.1768415200.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.01.2026 19:29, Oleksii Moisieiev wrote:
> @@ -1107,6 +1115,15 @@ affinities to prefer but be not limited to the specified node(s).
>  
>  Pin dom0 vcpus to their respective pcpus
>  
> +### scmi-smc-passthrough (ARM)
> +> `= <boolean>`
> +
> +The option is available when `CONFIG_SCMI_SMC` is compiled in, and allows to
> +enable SCMI SMC single agent interface for any, but only one guest domain,
> +which serves as Driver domain. The SCMI will be disabled for Dom0/hwdom and
> +SCMI nodes removed from Dom0/hwdom device tree.
> +(for example, thin Dom0 with Driver domain use-case).
> +
>  ### dtuart (ARM)
>  > `= path [:options]`

I appreciate missing doc for a pre-existing cmdline option to be introduced,
but: Why here (in two ways)? First, why in this patch, without it even being
mentioned in the description? And why in the middle of options starting with
'd', when the entire file means to be sorted?

Jan

