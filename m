Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8184FA8562D
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 10:08:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946801.1344571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39QS-0008Le-HZ; Fri, 11 Apr 2025 08:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946801.1344571; Fri, 11 Apr 2025 08:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39QS-0008Ja-EU; Fri, 11 Apr 2025 08:07:48 +0000
Received: by outflank-mailman (input) for mailman id 946801;
 Fri, 11 Apr 2025 08:07:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u39QR-0008JU-K5
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 08:07:47 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ce18948-16ac-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 10:07:45 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so17014485e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 01:07:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233a2f64sm75315255e9.16.2025.04.11.01.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 01:07:44 -0700 (PDT)
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
X-Inumbo-ID: 0ce18948-16ac-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744358865; x=1744963665; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QQXxeGqfmZncD3mNY4+0rD9cRgEPpHT0rAOQJ/zX4Q4=;
        b=SYPonrctBtYg3LSsc0D50O47z2Oz2R8JHM9Rj/A7VnOOdUcMMdpEmwG5h578E+ZvcV
         NtDngvi8MuDV/IOUF2SutVCNVGfXmph2B9uV9TwWrbdVtJKmTh28J5kZ6rqf3j9S+j7w
         GpWjkRJO8wFayLyuHo6kBMhr3UluTlr2LrK7iWRtj9u1x4d/nk7WU5Fu0m4CGdFWRJAJ
         K2tnBvzrBBtb9Oun8GHJkZmEyPmGUZDhg57ZoDZJW6erYT1W8yhIcKaT10uxKjp3K5XU
         Gk3Dy6wU6dXfru6rWkZPbP6oVK1VXyOJB/PLo2D4ZxSnecbHKbXJAX6gZYm4ThFv61cF
         Ff0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744358865; x=1744963665;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQXxeGqfmZncD3mNY4+0rD9cRgEPpHT0rAOQJ/zX4Q4=;
        b=tL3B8iaveYCvdG3Yte52NvFiEUNgp4y1Bss5RtsgS9RolKq4tpr/5gddgA46Y9jlmL
         W6TypBPnRHdk4g0apfJXsb94M9drdeML9c3xg5CLXceO0440isX9r+7HrwM+S++WWohb
         fKIebRhEpR+7OQKkSWBL9k/Y6zSEoAfVI3nTO9vcnnATPVz7GQUsaPiuGiUCIE2E2Rj3
         gxKvRO/SGggBH3QuTD/kpWj/oSFYSJmfkGBPxYeoCmiq5Ar1dhFSGplV9A0Fsl4po+0o
         uY+rYtovlL9rGgC2/1PWiQJN34Qv4iMGChmjln4qnS1kovwAjcSQkq00zm3qQyZzyjM2
         d7sw==
X-Forwarded-Encrypted: i=1; AJvYcCW2O7wdTph/ha94qAtXUG/UbbwXAe4HPr0IiDqA45bkaNGDpnVz3GnxTNZMo1cXbBcynV9anL/Mw+w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXIXoMmF/dgQP3m1DAdqYSeb2R0VsTWkNrGlorNrnk6rzc07Zw
	Mp8QXxcw2ztW4oHccF/DydwZ64WAnJ0zXfRJ2ElriSDYhHqTFAahkcdVO8Fh/A==
X-Gm-Gg: ASbGncvKR6OpgisJI3X3uova0lB8a9fHxFiW/pEyhXyCxhfDTAx4fux/uok3V8VBqCI
	gyIgkfXljwR2KL2NJbb3cTMYFInq0KHKKv0muWlUlPt2ck32pbAis32hG7CnQdu9qqdNyNuUego
	XYsSQMrqTvchyYEC83v9hhQO0IIY/1q6L2YEwqpkUigSqEzZ5TgxswiKGKO49ANYZhVa7fKCiiG
	uGJHrIFjww6GvjE15tcC00bIDVY8tWUN3P4WL2et3Nbf81sLF1Zh3FUn0OLQeVyR9Hehw/v6+dB
	FFEC4KNMJQ+S0H8bif28sU9knSB+v5swyr6msHSdBhSF2Zop8PE290sej3znfLYQKOjgtDBJgZb
	k8MY4fG/UkcMkAtb0lZkSSwdyvg==
X-Google-Smtp-Source: AGHT+IGI8bl0sodidE5wB97bKuzH3K7LxVbhZyZ2ZyoK1zv4I2fO3UBJK8smvJMCsq/CSkvLU5YgLA==
X-Received: by 2002:a05:600c:83c6:b0:43d:b85:1831 with SMTP id 5b1f17b1804b1-43f3a7d8c5emr15085125e9.0.1744358865047;
        Fri, 11 Apr 2025 01:07:45 -0700 (PDT)
Message-ID: <a6182e35-77db-4207-b24f-471afc73ad7e@suse.com>
Date: Fri, 11 Apr 2025 10:07:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Xenia.Ragiadakou@amd.com, Alejandro.GarciaVallejo@amd.com,
 "Lira, Victor M" <VictorM.Lira@amd.com>
References: <alpine.DEB.2.22.394.2504031755440.3529306@ubuntu-linux-20-04-desktop>
 <Z--0USril0UIhR4R@macbook.lan> <3c5dfd26-3c12-498b-aca4-0beac4e991a5@amd.com>
 <Z_jFSb2-efexUNlL@macbook.lan>
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
In-Reply-To: <Z_jFSb2-efexUNlL@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.04.2025 09:31, Roger Pau Monné wrote:
> Yup, the check is independent, but pf-fixup would create additional
> p2m mappings if required (note this is only available on staging).

It's also in 4.19.2 and on the 4.20 branch. 4.18 is where I couldn't
easily backport it to.

Jan

