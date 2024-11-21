Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF3C9D4B0F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 11:50:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841323.1256808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE4kz-00066P-K8; Thu, 21 Nov 2024 10:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841323.1256808; Thu, 21 Nov 2024 10:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE4kz-00063m-HG; Thu, 21 Nov 2024 10:49:53 +0000
Received: by outflank-mailman (input) for mailman id 841323;
 Thu, 21 Nov 2024 10:49:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0oSv=SQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tE4kx-00063g-9n
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 10:49:51 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 532a4362-a7f6-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 11:49:47 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53da3545908so819555e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 02:49:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b4643194sm50113525e9.40.2024.11.21.02.49.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 02:49:46 -0800 (PST)
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
X-Inumbo-ID: 532a4362-a7f6-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmIiLCJoZWxvIjoibWFpbC1sZjEteDEyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjUzMmE0MzYyLWE3ZjYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTg2MTg3LjIwMDQxLCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732186186; x=1732790986; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fY/U65CTknhe6PuAffa5IRGg8E4YaKHX+C5Pzh5N4To=;
        b=BaqUzKSLUKuEQhD+9rf6IQkk2bd/GH5m9auTJykJAK4WR2+Fze0xKuySmjF3+6uAyt
         S2Z/1VKu/3aSiYu0FeOohjmHecdwqW2FQ3uUO95ng7IoGgljrp5pBOzv3LK5ghYGjjz3
         qtLoOjttP/16tOzsIx1rx1/LS1N5xQyYDG1Gtk2Q5i3979AFJxn45mN/7MxSxoWuXeLH
         Uz+Eozwu8wmE4noiSKzODaMcPeXIq3ggGlXYxpmxUksI7X4sU0qMg8stRSJoW81NpIst
         wPStS+1wH9DbjD7qgx7JGqaYzEXTnJbyY8ipA55tPKVL/O/VeDyIOqQ6iQ9O7qHeLzsR
         ruPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732186186; x=1732790986;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fY/U65CTknhe6PuAffa5IRGg8E4YaKHX+C5Pzh5N4To=;
        b=sxTCdMyk0Y2rmzXaLQDPcL5IHUGbmOmM2myz9qbv2n5i6qVcFWFUjTR0cTyMfIQCa6
         Ka5Tl+62rkkef4+0urc6beC8f/+ANStkZ5Hfqz46gYZHHVsSEvQcgt8aZi2ztPtYp0TZ
         lJaFn9dVtOaHoe1hxZ1SU+59AO/J5P9AsRNk5t+ilzx72c3un92OdqL9a/i3QGL8jnZP
         4gaGGd9UGHK1s1vTK123Alkp5PSfFTa6T6dlqwfroZ3iGyQNSLqVAid5rd/dBZ1nKXJi
         kZILXT8hVj07tBwh5L0yguW3BG/i2zbAr+ml+3tmti2WsHE3hT31piK26fZNHrfN52TW
         L1Kg==
X-Forwarded-Encrypted: i=1; AJvYcCW6hacUK8ylJ2S6Oe19a3x2vceJQqn6g7SqmsFkQjJ629v0CKxLbvf6/iUTZB7lBw+ox/agcDUIKjk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQHyYWMnAzn5AsvTCdL8/e7c7VSmkk0Ql3kF8gh3szLGTsu+ch
	vDeo7u8vg1eNouj1O8r3pwamFvYfFKuVvlAnbX69IkhvE221LdOSJxFf9WQPlg==
X-Gm-Gg: ASbGnctjmGrZOc2RjxFYj9eIU0Zfzif1e5JXlxpTS2y2Bep4vbrK6Ycby++YnsP9jqH
	ITtzDSlnwO6IpXXSERzhEW8oPLRYKQAgc5n5guTsj6PEoET+y17tHtNvy5lBUo9iwZQ6zxmK90r
	sX/oXyc+hjwQ7FYCE5bsgIykcGSGlSC4pFpnWXyYtYfdBlDFyyazNIrwPnIZgLrkuA31b6Ziibe
	Aa9DkU269q2gTTV4OENZ8N79F7chnsSbfaberLKe7k4YT1mpLHfuMqyjNqdGdTx6F75rBaDOaKE
	dBRy6gwNJn6NeGFGHvM3Mqge7Er+Vx31vvk=
X-Google-Smtp-Source: AGHT+IEieXfPBjWaix4OmNIlTdoFR3WuCaYfN9gPEE+Xz60eMFN52iDIPyklR7mIkQBcQe4zraejXg==
X-Received: by 2002:a05:6512:20a:b0:536:a50a:3c25 with SMTP id 2adb3069b0e04-53dc1328c39mr2333975e87.12.1732186186549;
        Thu, 21 Nov 2024 02:49:46 -0800 (PST)
Message-ID: <b849f46d-501a-4083-aecd-fdf0c4319eda@suse.com>
Date: Thu, 21 Nov 2024 11:49:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/irq: fix calculation of max PV dom0 pIRQs
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241120113555.38146-1-roger.pau@citrix.com>
 <20241120113555.38146-2-roger.pau@citrix.com>
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
In-Reply-To: <20241120113555.38146-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.11.2024 12:35, Roger Pau Monne wrote:
> The current calculation of PV dom0 pIRQs uses:
> 
> n = min(fls(num_present_cpus()), dom0_max_vcpus());
> 
> The usage of fls() is wrong, as num_present_cpus() already returns the number
> of present CPUs, not the bitmap mask of CPUs.

Hmm. Perhaps that use of fls() should have been accompanied by a comment, but
I think it might have been put there intentionally, to avoid linear growth.
Which isn't to say that I mind the adjustment, especially now that we don't
use any clustered modes anymore for I/O interrupts. I'm merely questioning
the Fixes: tag, and with that whether / how far to backport.

Jan

