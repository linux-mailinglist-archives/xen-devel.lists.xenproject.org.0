Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB8AA717CF
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 14:53:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927811.1330550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRBV-0001wY-4w; Wed, 26 Mar 2025 13:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927811.1330550; Wed, 26 Mar 2025 13:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRBV-0001v6-26; Wed, 26 Mar 2025 13:52:45 +0000
Received: by outflank-mailman (input) for mailman id 927811;
 Wed, 26 Mar 2025 13:52:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txRBT-0001v0-TR
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 13:52:43 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94838f33-0a49-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 14:52:39 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39ac8e7688aso1648354f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 06:52:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f99579bsm17106210f8f.19.2025.03.26.06.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 06:52:37 -0700 (PDT)
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
X-Inumbo-ID: 94838f33-0a49-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742997158; x=1743601958; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ozfcPn1Sa0wlHDocChCTdPbjbsZwrzBuBCcmqZOvzb0=;
        b=cjdbOzV6UukzssB8/0/uEFD25+4QaEZ5UdZgAcKLGs7EyyzP2KfiMlx0p43M7H7CY6
         IGu18rgo8jJ1/7EIoUqUgP+fhTCUzBsyls3jdqJOcuJBSC8Su+8tkBf7njt2MVoSPBnH
         XvrbKjXeRYZnitATFm59JA4HMvUjxcwbur9zkYbsz0r4A+hLQ9e5q1vhHtI3oui65S8D
         N1nIlGe8T5TOiXzjnZ2wrFOprRaE/4FhwtfLMPCPBHQBrCXtwRE0cq8iqOTeEEqJ+UgZ
         SffDhU2RmvRk5e0+sfRWRN3IKAh3F4F8ip+Xq4lVzMU1eDCmnc5zO4uRy+dSiDLItU36
         +Taw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742997158; x=1743601958;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozfcPn1Sa0wlHDocChCTdPbjbsZwrzBuBCcmqZOvzb0=;
        b=gHZP/GQ9tYlo4RJDar0AFmRSqu2UNORVEzpsoNdklMJMbSMGfw9IfKbMN0x+4F9WdY
         +yEBwag5LhZhNqUNtZWQtzHXLd4o+aGJXvp6ypVgFku+CxSToIhaBXi8mjWQLjQu37+y
         TdhDgX5p8D/5GXcEtxdyElwLvBvNguC0SINTuEL8JEow8oKZaJBAypxTuSSZEaIA0JGI
         Ytq0nFZ6tPlcqJLnbti2puqCk3VLvA9jVpa69yqa9L17FpXigcA/TCXkIY4x8tiegsC8
         +k/2B2QMQSU489wRAbeAVE7hIDhFp6NRt2JgiNq4XyfGOJ32dr1vCxhv9/Yq+Qq+p/tP
         JN+w==
X-Forwarded-Encrypted: i=1; AJvYcCVHpEUdpnsaa6rr+/RpWu1ts7P7lPCQwvwnkOcfUc8t9ZuW2uqSj8Rt3pMzUFV/Dau3WVeYMLE3LFU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNLqPII6d+OiKNk1Uv8Es2RSoxJsu1NsbKL0meTVK4UZNTivqc
	Dw3PwhTEiBWfNREIXs3m5+Vp7xdi2pbL7sUm4FfUCkY6lIvooflkuncFSH5xrQ==
X-Gm-Gg: ASbGncvXBPOvOfAzWHwDGf5+081TkZXQgBCYs5C6u8bVYXRaG3n30cXfKW9zfDfXMf+
	gfjSbVdIXM69pIXRQZoPNTwSp2eFtlUB0GC5CIFwOcYxcxwbEHPArMAT/qKHdO3p0pqwGkEAkn1
	3YNUv4Ttan/OHnKGHVOFhxtsBX2wREaapJ1qAn+PHtszPcAdWTNKUxmytz+9ypXXeOrvcLcXIFH
	imIkwWZ+4DX6RD5UCsfFzHJl+TLOHVV2dajsrq8Ptwt4aCFyr4+Ke94UMHUMVkVgbmQFkbl8VmX
	Fhr5DvaVCr/60+IpM8iLDyclU6AtoIG9iyaxHam4BcnJetYNvxHuMsE2xvnTJp1spMroAh5OlvB
	eQhz6QEHFnUmL7jXXenSoQtuTM0chJYhmMT/L99TJ
X-Google-Smtp-Source: AGHT+IH0QTtXH/9TItLSD7dz2rY/UnAnlmrVYo67um4wBoc0O8d/Ww26kFIKkh38954z+DOP50C4zg==
X-Received: by 2002:a05:6000:1ac8:b0:391:4389:f36a with SMTP id ffacd0b85a97d-3997f937d54mr22349235f8f.48.1742997158268;
        Wed, 26 Mar 2025 06:52:38 -0700 (PDT)
Message-ID: <4d24b27a-df7c-45cc-85d4-a1dbc4057aac@suse.com>
Date: Wed, 26 Mar 2025 14:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/8] xen/domain: introduce domid_top
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250318233617.849903-1-dmukhin@ford.com>
 <20250318233617.849903-4-dmukhin@ford.com>
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
In-Reply-To: <20250318233617.849903-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2025 00:36, dmkhn@proton.me wrote:
> Rename max_init_domid to domid_top to align with its usage in the code
> (Arm), where it represents the upper boundary of the non-system domain
> ID range.

I think I said before that I don't share this view of yours. The variable
is quite appropriately named; it's the further use you made of it in earlier
versions of work of yours in this area where the name ended up no longer
reflecting the purpose. Yet that's not a reason to change the name.

I'm unconvinced we actually need a variable tracking the largest known
non-system domain ID. The domain list is sorted, so obtaining that ID
should be reasonably easy and cheap without such a variable.

Furthermore such a variable would likely also need reducing when the
domain with the highest ID dies.

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -472,7 +472,7 @@ static void cf_check dump_console_ring_key(unsigned char key)
>   */
>  static unsigned int __read_mostly console_rx = 0;
>  
> -#define max_console_rx (max_init_domid + 1)
> +#define max_console_rx (domid_top + 1)

This use in particular is bogus. The intention here is to permit console
access only to (some?) domains created during boot. Making a (conceptual)
change here would require separate justification.

Jan

