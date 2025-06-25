Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14589AE8622
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 16:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024972.1400729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUQz2-0004tr-8G; Wed, 25 Jun 2025 14:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024972.1400729; Wed, 25 Jun 2025 14:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUQz2-0004r9-4m; Wed, 25 Jun 2025 14:20:16 +0000
Received: by outflank-mailman (input) for mailman id 1024972;
 Wed, 25 Jun 2025 14:20:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUQz1-0004r3-2L
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 14:20:15 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82957486-51cf-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 16:20:14 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso1097819f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 07:20:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d8391574sm138071255ad.28.2025.06.25.07.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 07:20:12 -0700 (PDT)
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
X-Inumbo-ID: 82957486-51cf-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750861213; x=1751466013; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OC1YKeH/WCJq6Wjy8egzIZEhR8mzEaIjmqEqPACoQhs=;
        b=Z2haDrF9l53w86npbVV0zG7gVr7eQSBX8UnjRqbojCg1z12Cul7GP9XyOEwVcW+3Tl
         oF/TIlvGHo4FnJpCUzDEhRtpHiEVPK1KyE4g5e7SmkeTYQNT3rnpMBSRnQEELzajDF0q
         gbkw4GI4I1qgsSUM3T6vU7cOa/V5ISfy4LXmMMl0mkay8cNl7mHJSvYMEVHu6tl2VwkJ
         BPdtxiHuZXhzdyxssILt6OF+N2IQcBObmfGEMMstt8NOF2LXB23CiPjrtL5Slv4M3AMC
         A/t8VVLEVPbhSU8oJh4Zj+YvwuRr5fawQUagguZeSCkydR2szuy5tsAeDM9xmIKSicB9
         CBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861213; x=1751466013;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OC1YKeH/WCJq6Wjy8egzIZEhR8mzEaIjmqEqPACoQhs=;
        b=P7L/pc8OK3rIz/clFp3eXw9kQQEROv+Jc38wuzz9rkIAzUHNjYBBbNXTNMR5E0Vtoq
         K6JxPwX7N26X1Z6jCPhGxe+8GD2N2xjhfMOH+QWvXULjHLG+5Aj26aQmn3t2C4mztRz+
         aG/UOhIrsswNO1yAzzZuLovmgD9Z0dzIZv6OZ7j2LdW8uR0CgavNFTqZDQt0yOLEVgbJ
         3rmy5X8oBbB7K6fdB/BIwQB489BD8DhkucaNXUAxiAIxO8mJE//VfuLUmK94sPIoZe+l
         8n8xhFvWbVfLpPy6jhiM0MBcpm3JctiABh9ChlGiRyGN1SMXIDJTTqdehvTjk00vOfWz
         Rq2w==
X-Forwarded-Encrypted: i=1; AJvYcCW8p9ZlWgKHmSGCbV6dwrHXE1/zNMTk/FyUGJOkQzxcHCVPf+AoQ2zW44wV71zNr47BMpLwd/BTpIE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8cdxTSYyEWq732JLTuTWzdiPN5+OFL5DsnRIaJIr5iNJoUSsO
	X2M7CVq7APT43eqyUdT0NCK3Wqx1q38p9FMV+5l/ZPTdRN8xbX0P7z3XlDmatLaDOg==
X-Gm-Gg: ASbGnct/LNcJx4/zXo6cMwk8jyvV+ASQY60B/6kcQZFgdCrTZzT96DBhqiZNd33co9Q
	2K91cWCQri9V7fS0twQusKEarCnHyn35o6dnsZmdPWDqgC2S3mbh4Kvp1/Y7oVvKb7Bh1439+Ut
	O+vjd0uS8DAabYz3GWWlAyshik/e5hpjfrnW3irwIiTXoVD52JZ6fBKoI+kiNTzykrWnDprPRDq
	+YZTBY1734wvkrU4rUFYkWgUSTVGyhvnJ76agTKUegLTYZGp0Hf17XZtr3r2ilR2f3kzye6o+2T
	Y1WNzlfNSL3LJe3OV55nZVZ7UD4Sv4e5E2FNjqRBzqvFZZE4CGN6A23QDWH3RsPQD0+4dVCckod
	PiG8YFdKJHCY4G3V7g40jvdE0+a2UbxFYffIzz0op7rPT26g=
X-Google-Smtp-Source: AGHT+IGne5DzCr7NUWkqmaZdVwlFBtB+vLucY3gvlA7JR07+s+GhLyB6Uxq4B9gZB4dTBh+fbWAexw==
X-Received: by 2002:adf:e18f:0:b0:3a1:f5c4:b81b with SMTP id ffacd0b85a97d-3a6ed630717mr2668368f8f.23.1750861213449;
        Wed, 25 Jun 2025 07:20:13 -0700 (PDT)
Message-ID: <b6fb9ba0-7d37-41be-ac21-70604739202c@suse.com>
Date: Wed, 25 Jun 2025 16:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] stubdom/grub: avoid relying on start_info definition
To: Juergen Gross <jgross@suse.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org
References: <20250625110843.24840-1-jgross@suse.com>
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
In-Reply-To: <20250625110843.24840-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2025 13:08, Juergen Gross wrote:
> @@ -432,3 +431,10 @@ out:
>      allocated = 0;
>      xc_interface_close(xc_handle );
>  }
> +
> +static void call_start_info_hook(struct xc_dom_image *dom)
> +{
> +#undef start_info
> +    if ( dom->arch_hooks->start_info )
> +        dom->arch_hooks->start_info(dom);
> +}

Maybe add a comment ahead of the function clarifying that it ought to remain
last?

Jan

