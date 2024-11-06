Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3559BE59E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 12:35:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830759.1245837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8eJe-0004u7-Ji; Wed, 06 Nov 2024 11:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830759.1245837; Wed, 06 Nov 2024 11:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8eJe-0004rn-Gv; Wed, 06 Nov 2024 11:35:14 +0000
Received: by outflank-mailman (input) for mailman id 830759;
 Wed, 06 Nov 2024 11:35:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8eJc-0004aC-Rw
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 11:35:12 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e1c99f7-9c33-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 12:35:10 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-431ac30d379so53580625e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 03:35:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6c6569sm18929155e9.21.2024.11.06.03.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 03:35:09 -0800 (PST)
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
X-Inumbo-ID: 2e1c99f7-9c33-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJlMWM5OWY3LTljMzMtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODkyOTEwLjQ1NzY1Mywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730892910; x=1731497710; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IMiUwPdLpa03q2yGO43zPx+DDS9AZrV8C08NzOSoyK8=;
        b=BBXO0DL4is/ntl643JTe5BTK2O6aCY9JbqHnJEiJ26Z+mmll5WgC+hOHxieQ3cDCn6
         lL5bCPs3teGJsye+1JyaYIEvvQQVnU8qZ8DpyDoXADzilK++l7vvgYTrrMFkTvytqOAK
         4UDzai/4sxJg7oa5lGnU5JBh5bTv5rYCqmsJQD5sN7ma/2UNBMmmW/w9TzgvgSShMR/U
         teSZR682a0mJR58djEz/sOI7/fq8pzeKF+tkjwRw/lOjR2ovqS9hqPX2Q7b2RvmBU6ki
         a9TPR50jx/Yt+PGwrFhxrcVfLPCojTdKHCy8R2cCeLKryLRNz0p/hpYDdDqzOHH2uOdo
         xoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730892910; x=1731497710;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMiUwPdLpa03q2yGO43zPx+DDS9AZrV8C08NzOSoyK8=;
        b=JWCaqYUCp5doUSUA3hoUTFz6i3QbH2NvmszodVt/REyWmJf7b+nsC7EmiAZZY2sJFD
         2lym7oQW8SUOLt+0BAwbSQrBficX9DYzCw81vmNTGaiQ1CvIXJ6+hpoeijCqTADUgBIX
         xwtmlcju/cE32osNJnDw2jNJrid+6pFH9nb9g7s8EaHTFoxvTmspIa6fXH1imA0vF3zi
         2HNyGRocMqOqN0V/TGZ6CYPyGVMhI3j6QwVRbXv98aGSdf920sTxIQEVPTTE6rUbuk0l
         13Eoq9bV7wPP/QC6o10INGmvzCTlUUfoqXI/omDAC98xUgTxWtSfbMHgaielHrkqiwKd
         MyQw==
X-Forwarded-Encrypted: i=1; AJvYcCX2wsI0770A28bu/9dcP2Pk9nlDz4Wf1bJSwgxEJWQsBqA6OtlEpqbB8UKgU+ZsLBWlEiwDp/7gmN0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5tU/bnUzfrgBy07RtjlM9vHX1uKRuY1zBZx44NqbTk3xBXS3n
	qHBgOh4pponWnPo2b9pDoTYRpF+/McCk4M2wB9M87dWrNSYJnbyCo+WhiHRegg==
X-Google-Smtp-Source: AGHT+IF361oezCbLwepcZaxD6rQBfH3prl1QMoA9iG7Hdv4hQBG0f8TT1T9E3q5DDdGKxvtwKldtTA==
X-Received: by 2002:a05:600c:3514:b0:431:4880:3120 with SMTP id 5b1f17b1804b1-4319aca55a6mr332304595e9.11.1730892909868;
        Wed, 06 Nov 2024 03:35:09 -0800 (PST)
Message-ID: <3762161c-c803-4794-9d61-61b5519746c3@suse.com>
Date: Wed, 6 Nov 2024 12:35:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/vpci: Fix UB in mask_write
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <559dfac91b8f097bc59c4de194fd2ae2b5b4144c.1730880005.git.mykyta_poturai@epam.com>
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
In-Reply-To: <559dfac91b8f097bc59c4de194fd2ae2b5b4144c.1730880005.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.11.2024 09:05, Mykyta Poturai wrote:
> During the construction of dmask value, it gets shifted by
> (32 - msi->vectors) bits. If msi->vectors is 0, the result of the shift
> becomes undefined due to shifting by a size of the type. While this
> works fine on x86,

Oh, also - what made you think this would be fine on x86? Afaict ...

> on ARM the resulting mask becomes 0xFFFFFFFF, which
> is incorrect.

... the exact same thing would happen (if msi->vectors indeed could ever
be zero) there, due to the type of the value shifted being unsigned int,
not unsigned long.

Jan


