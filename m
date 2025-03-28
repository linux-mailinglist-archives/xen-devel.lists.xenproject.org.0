Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F25C2A74477
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 08:44:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930227.1332888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty4NW-0008Iq-NU; Fri, 28 Mar 2025 07:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930227.1332888; Fri, 28 Mar 2025 07:43:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty4NW-0008GU-Kh; Fri, 28 Mar 2025 07:43:46 +0000
Received: by outflank-mailman (input) for mailman id 930227;
 Fri, 28 Mar 2025 07:43:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hnye=WP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ty4NV-0008GO-Qi
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 07:43:45 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5eacaae7-0ba8-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 08:43:42 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3912fdddf8fso1857800f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 00:43:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66aa32sm1873831f8f.50.2025.03.28.00.43.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 00:43:41 -0700 (PDT)
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
X-Inumbo-ID: 5eacaae7-0ba8-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743147821; x=1743752621; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uSSzScypUpqzgNFT0UnGi+bq66eeMyU2PF7LqVOEdr8=;
        b=g4NrJxjKln2tyqM6Su1ThGewfA7T3sfzhj73REkWIoFs/8T7SUkf5cXJVlhfB6MTfJ
         1AYatl24MaP3i26CR7fXz2/fUOtEuKBMCQOTivrHiOUCBChN3fX7jmrfr8MqVlG/j0bs
         nG2fqz8zIWJGhzYDtl86zPPaFMh3VsUKZyFfOfph0DWv79WKRTOlCtC33nzNI2p2+/89
         WQHsGIlfcJ6V9+9xFDBWb7V0Y5URFRVtNDWi5Vp5UXODUDhQDbb60Tld5eCdh8QdsBAq
         7xvNDIe0bE8Bvpjzm0kbZJk0RsspPm2cDy5I79/qTp1etB3Wzf2fvWYkwzswDbBFSL8K
         H9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147821; x=1743752621;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSSzScypUpqzgNFT0UnGi+bq66eeMyU2PF7LqVOEdr8=;
        b=SSW/yWGqVeYoKFhFinRp+QiRFbplTHsi7EF4fOvLav2L0nXe9cMbGOeTUiK9H73aBY
         VeJiQ3Pdeim8yGn3sH9E+Df7cfSfUmlR00OTpL2hNF9dLEchZroX+CzwYkOuoxfewS/U
         4OeoSnFwODExiLsGcpPcPBBYcfopQjPghffy6u5HBTSlJM5lC6fwZXAkleBQx0f/DdHb
         WsUWVIJx2O5fgIZ/MWfQZ420Fe4fGki2gVb6n/OStN2a2/IZJSCv64JUNMA9IVDzF106
         5ljqakHtERgdqQrIR6sqpWOMVCVh1F5vmLdto1llP5dvOb5H1zYhWyj/Y4xyONMBwXOL
         N7/w==
X-Forwarded-Encrypted: i=1; AJvYcCXZ6/itgMpQxjOTyNISERLlUPhtBAMl90V2RsYKRirTsSpaOd0WB8j3inivMjokBNMf+P7JvMY9NLw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6ORQzZRF533Q7QhgGmKPqJZAH2qn56txf+wFgbkVylYUzBThw
	SHv0R7U52qX6BoAEdtFdXF4kLfFAQ9ivNQc/6jhro7Z77ogz3tcY9Q3cdJidQg==
X-Gm-Gg: ASbGncu7KnXKDjwMrIqdDa9qM6D256mDmXekkxVCfgt6Ti2rZdk2HH8aYvfoZwaP573
	DeZj3A3rUGgUyDVtudiIUh9ntfiCcPJY6pD3sYaUraSf874NX7w8C9zuMSSrw8qCcc9s2cknw22
	N0wghIUDKaBdoQFxYbzZ9tO/h1dz+QPDpEzj4QJM0ha0Xp93qF9wb3Q/KiNQAvfg1BzvrMmeiW6
	GexhcKGXVotRfRbI7PsH30xJbNF0+fEChrPUNu5tGb3yQp2udXp53AcO1JrhvhFv/LZtidHx5zt
	Z2LCOiD2J1DtIthhjjXiqzbxbQVYCWbaNYZ7ydcDgIVJKzgNcbu2rdA2r4r4LfAdr8Y4vYmH25n
	fkMvRrDXgEEj4eLJB3UUJUTZHv2XHNg==
X-Google-Smtp-Source: AGHT+IFG+SOHm5wmg845z5hkxf75xIN83ECxiE+sBDA/0sKwpXF3zl+afmQR2o+z1QRdcFGwit4QoQ==
X-Received: by 2002:a05:6000:184c:b0:39c:e0e:b7ea with SMTP id ffacd0b85a97d-39c0e0eb8d4mr668964f8f.20.1743147821398;
        Fri, 28 Mar 2025 00:43:41 -0700 (PDT)
Message-ID: <bcf266a6-01c8-4810-94ba-4f47aeb541b0@suse.com>
Date: Fri, 28 Mar 2025 08:43:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Xen: Update compiler checks
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250327174302.412821-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250327174302.412821-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2025 18:43, Andrew Cooper wrote:
> We have checks in both xen/compiler.h, and Config.mk.  Both are incomplete.
> 
> The check in Config.mk sees $(CC) in system and cross-compiler form, so cannot
> express anything more than the global baseline.  Change it to simply 5.1.
> 
> In xen/compiler.h, rewrite the expression for clarity/brevity.
> 
> Include a GCC 12.2 check for RISCV, and include a Clang 11 baseline check.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



