Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E8284E484
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 16:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678303.1055423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY6lR-00066B-0r; Thu, 08 Feb 2024 15:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678303.1055423; Thu, 08 Feb 2024 15:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY6lQ-00062y-UG; Thu, 08 Feb 2024 15:56:36 +0000
Received: by outflank-mailman (input) for mailman id 678303;
 Thu, 08 Feb 2024 15:56:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rY6lP-00062h-RW
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 15:56:35 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1f4126f-c69a-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 16:56:34 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33b436dbdcfso1442564f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 07:56:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dr9-20020a5d5f89000000b0033b14f22180sm3940318wrb.20.2024.02.08.07.56.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 07:56:33 -0800 (PST)
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
X-Inumbo-ID: a1f4126f-c69a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707407793; x=1708012593; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WoKTmhnl937M83ulqEmDhr8UT5Fq+44qVy8o8fulbP4=;
        b=AsAx/XkgwiBFqltYPM30/uLojylOdMAfWXucRLih5Tt544PNXXfZXO95/dAzAM2o2n
         YaxJlXY/cKdd3/ZgaSj9OuPZX1DNdtZG96eASwll7elNyHdQQyaYWMYkzG/25iCkePdL
         G19urwlh9sYun63U3E0kauhC4ODp0TOa0P124fythvuZ+ZICWYrSS9c9fNq1lCShelEY
         MNkh7aTcRZ9VoK0aL3Mbf8T7f66Yr+SHpRqVGpxBbD3SlFaXqDMDC058lB45NyIm136N
         RomyAOFpMI+lakuA2II7QyFPDoAkcmxVWCq0xGthUn4AlAgPID099k44fpv0u/DyF5L6
         YmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707407793; x=1708012593;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WoKTmhnl937M83ulqEmDhr8UT5Fq+44qVy8o8fulbP4=;
        b=EFJUxYxltTdmUcvEgjrQaZkShd+SKbf7wyZ5SYZN9lQQoXiclSKb9jvbN+O50UlQ7j
         9tuMtFRFB3PCXvfFGM3KE4JruwZqjAZjmf8EFDJLuvwM11B9g9vzHL2avf0zRKw8NkmR
         pkvNXNpAAtu/jWIv3oK/OfyzHqdXXogm48Gn+h+J3R5oge7Y3mwk83LZn9Ex7uN5961n
         Gakh7SWHbdCtj5IBninC1VggmsIbNruwrYg6SUHDi3mcs0uQr/wnvrJ/xzW1mNQxRURt
         TbkSYykhV48vMCbCpV02i50laHZsszsEH7woNmQ2BDWGtTQOX1Psf33ijyC0R90DPWDh
         2ahg==
X-Forwarded-Encrypted: i=1; AJvYcCWgG75P9aDypPCwelVK+U+sd+IFlFCp5Id2dd2pdJpmtFNCl2Sn/1jsXfD6eStGf1mP+KIFfLC2WKTqa7f6QgHZ7fz5u04gorBus3HBy/4=
X-Gm-Message-State: AOJu0Ywv4ktaZyCqdH85BB5++jmOPYON6Ir6tcusF42E0cjcw+f4D0Tm
	LpnNW6KhI+pzsshUBn6YQmL5Ry+8ekr9zbTdc3m/WCnBNDJDjMPf86RPrPqKkg==
X-Google-Smtp-Source: AGHT+IEXxy4E4Mcg6IM9g0DANqMlEQWN12/RB5CcSE4m5hpDG2PMk8mUyGy98G4iEfWFIjzrHRrkKw==
X-Received: by 2002:a5d:42c5:0:b0:33b:1a39:e501 with SMTP id t5-20020a5d42c5000000b0033b1a39e501mr5494134wrr.28.1707407793541;
        Thu, 08 Feb 2024 07:56:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPmvhsxXkUehwKER38yQsypxjca1lfVSAd0MGyfsN6IHTwHc71D/q6lz6jqcx35v2jXr13sA3N0R7dq2OTrjIdZRCL93HhxfmzsjAgGIYHyxHZVdnJWhtqyyX6XitTq3SCMbFnqOzGaBtNPoQTdS2BQ5nIA2OcNG7EHfmp+0kraQ3xLRjGk7r6h0DIsSw2ouLvcWLWkA1P5x8wRb8aK9cciNMGeDIdZ5qnVSrJjEOC3oiBY3hdC8rMMj7iUDqawteOJZbcP7wCtMopYScvWn+FSu83RCeMEq2kd8Nnz2UpYBMAwSFwMK2J7WqLPq8VprFADdkX2mdSfzuQTvYsL932KmvCOJQdQ0wOwd123xYsM0+HJPouQAIdtYdv1xlz1ZsIHSh3nlAGFujNhfVDU6h2TGI=
Message-ID: <891e8cc2-e073-4cd3-9998-4c01ae775a3b@suse.com>
Date: Thu, 8 Feb 2024 16:56:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] docs/misra: add asm-offset.c to exclude-list
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <09b659e19bf2cc6b3ee4320e019bdfa7def5f3b8.1707406598.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <09b659e19bf2cc6b3ee4320e019bdfa7def5f3b8.1707406598.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.02.2024 16:50, Nicola Vetrini wrote:
> These files contain several deliberate violations of MISRA C rules and
> they are not linked in the final Xen binary, therefore they can be exempted
> from MISRA compliance.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/docs/misra/exclude-list.json
> +++ b/docs/misra/exclude-list.json
> @@ -101,6 +101,10 @@
>              "rel_path": "arch/x86/efi/check.c",
>              "comment": "The resulting code is not included in the final Xen binary, ignore for now"
>          },
> +        {
> +          "rel_path": "arch/*/*/asm-offsets.c",
> +          "comment": "The resulting code is not included in the final Xen binary, ignore for now"
> +        },
>          {
>              "rel_path": "common/coverage/*",
>              "comment": "Files to support gcov, ignore for now"

... something looks odd with indentation; can probably be adjusted
while committing.

Jan

