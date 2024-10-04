Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6560D98FD80
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 08:48:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810016.1222609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swc6j-0003DE-OL; Fri, 04 Oct 2024 06:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810016.1222609; Fri, 04 Oct 2024 06:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swc6j-0003AD-Lg; Fri, 04 Oct 2024 06:48:09 +0000
Received: by outflank-mailman (input) for mailman id 810016;
 Fri, 04 Oct 2024 06:48:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1swc6h-0003A7-WF
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 06:48:08 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c0ba310-821c-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 08:48:06 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso342559566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 23:48:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9910285701sm183244266b.52.2024.10.03.23.48.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 23:48:05 -0700 (PDT)
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
X-Inumbo-ID: 9c0ba310-821c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728024485; x=1728629285; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EYdymnkFdan5/zJYRg6cH81Z0APzLjbE6Q0L0i/nahA=;
        b=Abrzs14P6mQ5Ty0q6HhZ+CfG88e/DD/qM9wX6KfG2m5P6K25wRVk15VJSSYUEVSoRq
         1DBNIbvhoThqAp9yJRVv0Umu/ZbkxL1YJfsHa7fYukT1ja6pDrKYJVnbc3puXsy0x9D4
         6uD/Buq395k5mYz2QjF0lV2FS/GG1yJoPnB662EfxfmNhrSatw0pn6DfG5WuN57NkhMr
         v6sk5ORRrRhzxFxJPQZugc6tAhIvkZuPvcPdi7I65T7afG+wMa9ZE21OktSps9ulhFaN
         eujsH9tir2AVbZtb5w+CoTE1cfHWNrToWoPbrFRkiEzBFfTkWIe2eeqxW2qGWeyW+mL+
         AO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728024485; x=1728629285;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYdymnkFdan5/zJYRg6cH81Z0APzLjbE6Q0L0i/nahA=;
        b=u0zPw7m48qYm4dnwqTbSirpxLUbXcmEWBO+vLqDv78ntlXGwfwlavJAP1Hup3bLtPM
         hPj4H1bU+EXuJdWXv0q50EJEAxtUGfr26ld6iP1+K9h/bxGrVnrqY7Jw6KmQ+3cxsR4M
         4y+OG3VwPBxNftuTDV/Brs1rloyZtiuEt163VZZ599SE/mGMqdVPW3t5OnooxV+ZFobg
         2ckWaRs58l/YtIvkItAsv/H9IcVBmVDMGoWaDgFUPrgmJ0YXAZUk/7QKCYsIejBR6ZNg
         hptZ99/ELui4eh9bWRK04WpyaiBXbV6vsw2IfvNKegVDjR7G6E5EzPa1xbo6d6delip9
         92YQ==
X-Gm-Message-State: AOJu0YxpfkDeoWJHBnnsUmEYP5RqL0/lxVbDWNtd/lxLMGOCGBcjHV+4
	8rIiUbnZdMtXWJ87qCiahLzji8S0rgoHKrbxkDvyEkp/u32CQA3dNLQjKyLCwQ==
X-Google-Smtp-Source: AGHT+IEc2QSukVHcbdKHU9djwnweh7plWgSb8BKNRaX6dnbl4sMOxr47HZmpfegfxhBAiIWQ+M0SNA==
X-Received: by 2002:a17:907:36c8:b0:a8d:43c5:9a16 with SMTP id a640c23a62f3a-a991cede585mr152704266b.6.1728024485484;
        Thu, 03 Oct 2024 23:48:05 -0700 (PDT)
Message-ID: <ef73f945-1fc0-4f91-a185-0b74e393e89c@suse.com>
Date: Fri, 4 Oct 2024 08:48:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/APIC: Switch flat driver to use phys dst for ext
 ints
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Matthew Barnes <matthew.barnes@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1727880621.git.matthew.barnes@cloud.com>
 <8c6d1fee5261169a9bbc62ed1bafd2c32406fb4c.1727880621.git.matthew.barnes@cloud.com>
 <Zv53FGD0ju5XsVjz@macbook.local>
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
In-Reply-To: <Zv53FGD0ju5XsVjz@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.10.2024 12:51, Roger Pau Monné wrote:
> On Wed, Oct 02, 2024 at 04:17:24PM +0100, Matthew Barnes wrote:
> 
> The commit needs a log, doesn't need to be extremely long, but it's
> important to note the reasoning behind using physical delivery for
> external interrupts vs logial mode.

Furthermore I question that the naming can remain as is - the driver
is no longer uniformly "flat" then.

Jan

