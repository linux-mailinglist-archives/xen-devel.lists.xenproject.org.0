Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF5587B855
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 08:11:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692885.1080502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfFC-0003EA-U2; Thu, 14 Mar 2024 07:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692885.1080502; Thu, 14 Mar 2024 07:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfFC-0003Bi-QI; Thu, 14 Mar 2024 07:11:14 +0000
Received: by outflank-mailman (input) for mailman id 692885;
 Thu, 14 Mar 2024 07:11:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkfFA-0003BH-SL
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 07:11:12 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09889e8c-e1d2-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 08:11:11 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a4644bde1d4so72571066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 00:11:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a11-20020a170906190b00b00a44e2f3024bsm407573eje.68.2024.03.14.00.11.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 00:11:10 -0700 (PDT)
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
X-Inumbo-ID: 09889e8c-e1d2-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710400271; x=1711005071; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SDY4jjLhZUBmy0omOEEqP4FrI3d4/utzdwwQ/ZpA04M=;
        b=TPc0ygq3tWNuC326HPrMf004Xysuv4WZ+18mWXBpcDRlRYR96LEZwUQh3O9NQORV8h
         VCFKZrOIF93kZTEIzKlgBJXrfW9Ev3oA8b+fIN8yjoYEuAC6io5sRnFDcTTdiE/rbLNR
         gcnkv/p987X9QJVEwwRXiCdV6JWJTxL4c1pGpGI4/4tlN1F/dJG0y03YeSzjmGGTnq0z
         +27ZFJKf4t3ii/0lpBovLTj7HCs7D46+bYb48iJv6c2D1lBK7DB8fcjvRg/WY+ST9lWA
         eG4a34j7bLvUih8LfNhBBbkHMoifQelnJJwL/Jh80KVciXIohvETuvASLdXJE6vA5nmG
         i1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710400271; x=1711005071;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SDY4jjLhZUBmy0omOEEqP4FrI3d4/utzdwwQ/ZpA04M=;
        b=J671szI0O0OuSKIioSUa5qE2OWLuQ6sfeAjh68N84qC8nIIkunaspY/dXXDX6OkQ2z
         BApdHnJVNE24zlH9XTS0OAvu/nMK4sQle65/bd2pPffOGrYosz3Q8i8f0go1mKCiSNze
         mPsdWWo/tX5O43AI9sSaqDnBGUW6gfqTFeSpC8JomFsfaF8tH1n1fMWj4CHhx6M1amxg
         eDST1Tb6c3cdlslDQZR04Ot/oTOp//ij51dz02MZVMEGTm7Q+9mkdJh1dQaESsrDmXtO
         HJgKVXM7JdPheQEKC84ECqG2beVTs5LAxVkv3nHvUbmSBFlg+DMZDyk7NVWiWp2+ZVZ9
         JijA==
X-Forwarded-Encrypted: i=1; AJvYcCUBt4pyOrH9rxyE3+fVQIFlmBHzRnco7RHVsmCY0LAp2yxY01DO+15bDhEjxngkILRNj50Eu93WpGgteG7h/nqZ0o3xUfwRyhKDwA1jfkk=
X-Gm-Message-State: AOJu0YyAtNrEUkWOu5X7rD+N9BWJKe0WQwwmiPHi3E/FpNwrLZ/0Oada
	uWZ1ufaXWuRQVtUx/ti33k0ExG8sqrVdseVModXtdbacTYjLRPNpUATCLu3pkA==
X-Google-Smtp-Source: AGHT+IE39Fz82EN2jBhgle/gy6FAsWss++CefBwacU6aIw//7hMZpmN58GHMQbkeidRy0ALmgFnttQ==
X-Received: by 2002:a17:907:c082:b0:a46:74f0:6380 with SMTP id st2-20020a170907c08200b00a4674f06380mr292932ejc.3.1710400271021;
        Thu, 14 Mar 2024 00:11:11 -0700 (PDT)
Message-ID: <82ae53ac-f2d1-4d86-8719-4e5cc2e5f57d@suse.com>
Date: Thu, 14 Mar 2024 08:11:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] Revert "xen/x86: bzImage parse kernel_alignment"
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-2-jason.andryuk@amd.com>
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
In-Reply-To: <20240313193021.241764-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2024 20:30, Jason Andryuk wrote:
> A new ELF note will specify the alignment for a relocatable PVH kernel.
> ELF notes are suitable for vmlinux and other ELF files, so this
> Linux-specific bzImage parsing in unnecessary.

Hmm, shouldn't the order of attempts to figure the alignment be ELF note,
ELF header, and then 2Mb?

Jan

