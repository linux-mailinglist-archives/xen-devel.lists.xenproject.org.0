Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 296D7958127
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 10:40:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780204.1189827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgKPc-0001kz-Vq; Tue, 20 Aug 2024 08:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780204.1189827; Tue, 20 Aug 2024 08:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgKPc-0001iO-Sd; Tue, 20 Aug 2024 08:40:20 +0000
Received: by outflank-mailman (input) for mailman id 780204;
 Tue, 20 Aug 2024 08:40:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yfvp=PT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgKPb-0001iD-4H
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 08:40:19 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4411490-5ecf-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 10:40:18 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a86464934e3so84907066b.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 01:40:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383946538sm732780666b.151.2024.08.20.01.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 01:40:17 -0700 (PDT)
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
X-Inumbo-ID: d4411490-5ecf-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724143218; x=1724748018; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UIDfxVhY7fnottjWLC7fDlRPFUbWqgVBnlZeCyzgUPg=;
        b=R0cHUYVSYv+hfVplTZXgg6+AyFevwJpwJsNzAmcNHZdS0flH4AhuUhdbqKc0EPpjvU
         nR+tzEgz1rkDLgBYY2FNAg0GWijCDtPtSGwy8Nf+tvAH7tm/x4lRlYGK6Ul3Qm6Rxrdy
         Gyat5fZvOOy5DdiVK27B/5+HwlKkF16DDyQnlyULcaiX4xcLXlipW4i7G5JagMlGp/yN
         CLviLmbYQTNShcGliaB69EzaABeOuwzyFnGgsB15LNgnUkoxTRtooa2FLtDvmgg2oQI6
         D8+eu+qz1j89eczVg11jbcIVwJFcXjvZx7hbz75/zg7Y/YZx9VJscO/uaA0raEPl6tJu
         z4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724143218; x=1724748018;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIDfxVhY7fnottjWLC7fDlRPFUbWqgVBnlZeCyzgUPg=;
        b=hD95IFF3aEPkOLZu7w9djy01kacT15Ruc5uvbZzs4ifmPMDE9yJkyG4/P3fvnsi6YZ
         /V9s2fHKAHi5niQqPvh/8uMfQA5eNkoah65ceoIoXZrOW0mIPomlplhcudnK8nLhr5Ux
         0KJuaL0/2+hy7ZqmqyNrSRtQIp0inAdzX+8ik8T+nNhP93CHLLEJt1g//yvnQswnZh4M
         FQPPzDW2g7z3TJtwGt8Z/OBADNVZTD2wCkYHIwNQuEi8a8bvBKS138VEfteRG20q2f4D
         WGVe0uKY1oST6DxLrE9r+Fy1/7hPG9dj2j6+sNlMCHtguMkO5AGgJPJDipqHw2JJ3a72
         fXrA==
X-Forwarded-Encrypted: i=1; AJvYcCUMF+Kv5wIgV+9qGnOMohxK4XrrnlC7qVbbxsyHXixva6oCjrgjGAEYtpL6O11kGRkQZh2NtkQovR1nd9aT88dS8mzpzr+RhX/fC86eBBE=
X-Gm-Message-State: AOJu0Yy5yMOucycZ7BEUb2tE68Rvw+YrozpJKiZDh3iq8cDRcKpUsOnf
	1f3e+QorlV+JE71kNwEFp9Wrt6yMrHlC4FHqhqyCB7B+U+1uXbCH/Py8cWAkEQ==
X-Google-Smtp-Source: AGHT+IFKKwbAe4UsLI5P0/ECxxMtGDpjSBVELhqGsnY3Ji1MWH4EqctA+4Uw+oYqt73ir9MQOPbetg==
X-Received: by 2002:a17:907:7e93:b0:a7d:3f4b:fcaa with SMTP id a640c23a62f3a-a8392a38e65mr867605966b.67.1724143217855;
        Tue, 20 Aug 2024 01:40:17 -0700 (PDT)
Message-ID: <e01257b4-e2b2-4b3c-84e7-9b4c17d97baf@suse.com>
Date: Tue, 20 Aug 2024 10:40:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] xen: move checks for e820 conflicts further up
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20240820082012.31316-1-jgross@suse.com>
 <20240820082012.31316-4-jgross@suse.com>
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
In-Reply-To: <20240820082012.31316-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.08.2024 10:20, Juergen Gross wrote:
> Move the checks for e820 memory map conflicts using the
> xen_chk_is_e820_usable() helper further up in order to prepare
> resolving some of the possible conflicts by doing some e820 map
> modifications, which must happen before evaluating the RAM layout.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



