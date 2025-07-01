Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 322D3AEF7FA
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 14:12:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029699.1403448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWZqB-00045i-Du; Tue, 01 Jul 2025 12:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029699.1403448; Tue, 01 Jul 2025 12:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWZqB-00043a-B8; Tue, 01 Jul 2025 12:11:59 +0000
Received: by outflank-mailman (input) for mailman id 1029699;
 Tue, 01 Jul 2025 12:11:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWZqA-00043E-6u
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 12:11:58 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 955ee241-5674-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 14:11:57 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so3228032f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 05:11:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f5426be4sm16529638a91.32.2025.07.01.05.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 05:11:55 -0700 (PDT)
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
X-Inumbo-ID: 955ee241-5674-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751371916; x=1751976716; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OdSdKKWFZr4hfnefmA76q4gyrk73FkwVuR+fLEE1nX0=;
        b=M88OkUpgejmFcvHnbBRUG4/5w57B+3jO6vbxD8jOFBqi9iLkT5x6bqFon7mJRj+IkF
         OHLh/Q1SI8QTLvF4pmxFUTu3bp2Iry9g25VLgTSn2+hHuzOrx9uHUT839c9eGK2kDZ34
         r3HIzDQtiieEpXBjrIs4nAMdUAozfZ+x5n3jbe1z+Z2RsHF4s+tPr6qTJ+4zVQiVZ7T/
         KnrBhgD0ohUIiBBYDiS1BWarUVy7Ogy3q98TGrBu73aEJzi05qoA7N4jeHwQyYXESqVf
         BLV9ccwFxR389voMipM5PADto1KA/rpln/75S3z0s218O/6XolhcRWhW6PAdf7j7S2eJ
         DaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751371916; x=1751976716;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdSdKKWFZr4hfnefmA76q4gyrk73FkwVuR+fLEE1nX0=;
        b=aAX/H0KogfSt7g3/BEKYn3b6QBw7H86GiLQC8sOH7Cl45OXJM9HXDQOsiQ/h3SkBMf
         WUQVQkWyHyTwyBuVwjvbjFJzYPKQlHkNeNQ5h/wYNnNKqaM3qnNZdhMXieDVtw4X9eHI
         pdZ3Yd9QjtWxgWiPlhUOew768AUXlqSAmX6JkP0V6ORaDqk1hQ+tbysGjkdSGftSqWpA
         k9SYngdPY5Phm6j7lCx2QAB8wFaQIpMPQ8MfFFrRUPm2jyKuuTlXz2TnrCITnuFn5bd5
         Tk3NFjnEjMLJpOo8UxfKrNo9swfFAMhb9Z7RyHa+Yox9ihm4VGOWqeFV4jDFPFKTEoQB
         mRWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVUHw9VqWDKpz0r8glLv+0yfqwae54RSac62cJ3dJeNLiuMi0N6Nvfvflsknf4rkEduow/7J0I3cM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxv9kya8yi7+81HyiacwC5jZvjuKiuh/O3MgCZ1FPHau/ag5jm0
	5sAewOHHWdQp9v4HoTQSQWuymcN9zlVCvrZoZ03Mb4MYFv4QP9t82plonrS5xJ9pag==
X-Gm-Gg: ASbGncvnxizvenWEOVppxR/ofYmILB3MxHulIpeowyxV/6xoiObov9RvBegpGaCuaje
	J7cgCtkkI1ds/HUMOL7lYJCd+oRTXnum7xt3kuBJSxEfkid55pc3UD3cbib2we1vKjzkisN9EGr
	qOvxCS9KnATTNai0xVWeAuILsf+9fRxBG2oyBd1FfXsJ9uBpFTX+R54uig7dJWzjWbY57fbYBO2
	R4gVb3Esu/U4QlndzxQLK+GUOFPmlq2vqo4zG/86XhaQ7EVR+c7jiy8JnVWu63EWFtTgospatVs
	jKH5CvvyyQAzZAmbGgCC9LcHVWELHjjxe+31ZaUPkNivSynOOECU7H2XwyJz1Ocf4nmPQCh7efG
	XNrL/KsEDNNWBRLqVASQy041i3Kl8vaiplCbnBTqd6py31LxF7ZyOz+eebA==
X-Google-Smtp-Source: AGHT+IHgDbG3TP8x2hXDL1GiJ8XsFovfpMuAmOnDBrwqUm3RLQKLiPYWDJELB8QMigWVSxPVD8un7w==
X-Received: by 2002:adf:9dd1:0:b0:3a4:f63b:4bfc with SMTP id ffacd0b85a97d-3a8ffcc9f0cmr13613672f8f.34.1751371916438;
        Tue, 01 Jul 2025 05:11:56 -0700 (PDT)
Message-ID: <d88b5a27-0bdf-48b2-b55b-ca66add9f78a@suse.com>
Date: Tue, 1 Jul 2025 14:11:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Fix handling of leaf 0x80000021
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250701105307.705964-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250701105307.705964-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2025 12:53, Andrew Cooper wrote:
> When support was originally introduced, ebx, ecx and edx were reserved and
> should have been zeroed in recalculate_misc() to avoid leaking into guests.
> 
> Since then, fields have been added into ebx.  Guests can't load microcode, so
> shouldn't see ucode_size, and while in principle we do want to support larger
> RAP sizes in guests, virtualising this for guests depends on AMD procuding any
> official documentation for ERAPS, which is long overdue and with no ETA.
> 
> This patch will cause a difference in guests on Zen5 CPUs, but as the main
> ERAPS feature is hidden, guests should be ignoring the rap_size field too.
> 
> Fixes: e9b4fe263649 ("x86/cpuid: support LFENCE always serialising CPUID bit")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I notice I have similar omissions in the respective AVX10.2 and KL patches.

Jan

