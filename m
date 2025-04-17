Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C6AA91FA3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 16:29:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957871.1350883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5QEZ-0004vp-7H; Thu, 17 Apr 2025 14:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957871.1350883; Thu, 17 Apr 2025 14:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5QEZ-0004t8-4A; Thu, 17 Apr 2025 14:28:55 +0000
Received: by outflank-mailman (input) for mailman id 957871;
 Thu, 17 Apr 2025 14:28:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5QEX-0004rV-ME
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 14:28:53 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 491e3793-1b98-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 16:28:52 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so6277825e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 07:28:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50bf3b21sm317435ad.69.2025.04.17.07.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 07:28:51 -0700 (PDT)
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
X-Inumbo-ID: 491e3793-1b98-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744900132; x=1745504932; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=slEol9Q1b90Bxf6lF/iU2UBkQUZRrnvQ8s1/O+ov+cw=;
        b=Axv7nuNin5Kg4rT11tIr/jmEJf8c1vQLD4nrCuuvONVx6FUhIa6ENGP2jCynT8LdLi
         Y+0Qm4FcXKO/dM2+u24R1H3GHthaCIE1mLpzUMkBznsPtG6tcFlLQGoa8JhdJNFE7obK
         CfHd5/YIyx+ABsEdK7gjdYhhzf+nHtMQaBXbmfcV0fCS+GaYrmRzsAoPAZ4kbe+maLzl
         sWSsgCJGaIdrNE4YyttRrLv0SVuTNneZQbaLhrhwtjVEwsJuZ9ggqFY5QeaOKNVf2jlk
         6VyGK45BPGvbOG5GRiX0rCmw1aQjkrke0sNtsPtwMtQ2pmIm0gS9KJo7h81b7Ntty1Cz
         Vf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744900132; x=1745504932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slEol9Q1b90Bxf6lF/iU2UBkQUZRrnvQ8s1/O+ov+cw=;
        b=KwG8k5i9XFEk5BzqTrnmw71+z7tIrEBmWJERbi/dkENBKJhov5tt/x+4r8Sk8rl+dg
         OCFRmoJur/IYyErCUtl7yADVhm7gIiNpraIfaqaEbkdCX3LGFuOB48KDTxDCtH9pKzIH
         Z3Q1vmenA+PzXhh054gCDBvg482qFjPKRCDWT2RXLCZbgkNoDiFvRd0hLwEs5GCA64bU
         KB9LHTgtCtu+SvcfvBeriLnVp+EwcEJs+dwr8NhDvflhsyI5P7pQTM8B8YTB5FOtaN6i
         Lv32r5Bs8+YYjXdYNc4rLsiunknT74wCRlyVqy+TU9UkdJ1xu5gH+FNOASw069cVm/V2
         gQqw==
X-Forwarded-Encrypted: i=1; AJvYcCXLvtqrzxpijw7NXEU4aas88vRhVuOaRCMkKSDLQikzyJWk+EC5WSzsE3GWBTwAWQpWvWTyogZOVsg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3CjiWlsBra73l3y+14oqoYsPkKBiF5V2cUnUF2FFRS/wSTUqZ
	4JLQUqfYEjq2lNX1yPuQ2wWFirMeAxre6F2iSWqZgJH9WiRyhal/WscNhBriuyJ4kXWBunM4p/Q
	=
X-Gm-Gg: ASbGncsVNGoR69gWf4QMEMCVCPhzY2YUNOplAAj9FyJBKpLYEujPkMxcOL0NMbz1vKE
	5pXA8NKycnCJlkxqmmmGjkA/Xttf+OJm/qgiiXbQLCu3eiPGS+7mw4csh/LhYwC+wMIILZD7+jf
	2QDV54Y30o7hIjmW5CovWQEYCIYiUOKbi6eTxbCTb9qmYUnRiFj6csbbW0KRNOGPsMsP0Ff5AZc
	s7VpQoluZkX4EF8ZZtyUiqDeiEi+eZsBcXKLtpqPJKk3iEkBIDkFGXyzej/MtKLRRWV/Xy9SqaJ
	8gsbox07YE00BEx/DanWiBVBmfNm8xXUKQV5SL0UvPr8/KCu/+0eTEdRmAUOWieoa5DRObDArMR
	g6g2WNmB6Be0r+04DirzP0GBsFA==
X-Google-Smtp-Source: AGHT+IGC4j/TGT2zZzIq3DUfNMgGY2d1BCm+sfRYMBFVVXOFUa0dqPQLCToik0EnVYeyGexxwF+p0w==
X-Received: by 2002:a5d:47cb:0:b0:391:139f:61af with SMTP id ffacd0b85a97d-39ee5b1cf87mr5461764f8f.32.1744900131988;
        Thu, 17 Apr 2025 07:28:51 -0700 (PDT)
Message-ID: <5d78f813-c073-4252-a177-a0a27ccb077c@suse.com>
Date: Thu, 17 Apr 2025 16:28:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vmx: Don't open-code vmresume/vmlaunch instructions
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <2d9480b75c80d49952812769f283a220c1753571.1744899753.git.teddy.astie@vates.tech>
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
In-Reply-To: <2d9480b75c80d49952812769f283a220c1753571.1744899753.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2025 16:24, Teddy Astie wrote:
> binutils 2.25 has support for assembling vmresume/vmlaunch
> instructions, so we don't need to open-code the byte sequences
> for these opcodes anymore.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>



