Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EECD022EA
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 11:45:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197572.1515067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdnWS-0001cM-Ik; Thu, 08 Jan 2026 10:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197572.1515067; Thu, 08 Jan 2026 10:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdnWS-0001ar-Fp; Thu, 08 Jan 2026 10:45:44 +0000
Received: by outflank-mailman (input) for mailman id 1197572;
 Thu, 08 Jan 2026 10:45:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdnWR-0001al-6r
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 10:45:43 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d11e5dd-ec7f-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 11:45:41 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4327790c4e9so1474572f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jan 2026 02:45:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5df9c5sm16065436f8f.22.2026.01.08.02.45.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 02:45:40 -0800 (PST)
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
X-Inumbo-ID: 2d11e5dd-ec7f-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767869140; x=1768473940; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2YR8x/rE7hoB8YL8fsqE+c+pcuL3201VtN5Ovg2PFsg=;
        b=JHdDiEkmsaoR/Ahkv6l0ANdppARVur3HLe8YyrUKUgALooJHvBtrkR3sCb4DbrFIvN
         h0MhMed7B5tLggtms3WYiP4S/cxqb7fY30MPSG5oixfETrHz6qtOMtxxxr/OHep9cAWT
         do3T7CHf7Fl3fjHI1qVMNS44BfRwTZ4CkefeKoEy0obgDU5yjN7BipuqTJgZqZScJROW
         emgQ6N36cYpE5XTOOJLUtMUgvvQZGvDvimk1Q+9ClWslZAPz5pM6HweZ6WNIsTzCWA1E
         SfZ4ABlNngyszwspWXanJhLsU0V7Gjox/d/Z94GadJj84vGsnSVQ40MDj466r5f6Iicr
         qFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869140; x=1768473940;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YR8x/rE7hoB8YL8fsqE+c+pcuL3201VtN5Ovg2PFsg=;
        b=DIXOsN0cX0wRe5vBPCwIgwZOXOuiGdo4jIupeJ1UguewtuSEYBIFQ2xE09uETpMTzx
         dizsQYFIbJTa68VdGNbXn0t5T+3MImLJyeX2mUq7L1lh7Ov9izy2FVcZSWqz18l5NcAa
         QsltfZC7tLQ0sN37Jy9q30BnlGIlRguS3grREPwRk+lD0dGoNjPLj2N2X4t+5bKIuob8
         Kklmkrss6YRYu/n5cC9dj5A4klpdwihVvDgKNwxXPyG2wFEGq9BiqaNVU7A98XvsUwD5
         Ae/TzcTxgJ1rb3p6YFNAaB9V2gRTYrQ+C/8V9UYejWEsVBiAqgTjrF2ySqqkDifVzxlJ
         Z19A==
X-Forwarded-Encrypted: i=1; AJvYcCUJcRM30+PAswLH8IwlkXsK5SZGHCpS5ggFlePGscUmQ8zMO09B1bUkvvsROssRQLGIoo1sS3EFQ9I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzpVxpiZSBBT6MWK866L1TvW8xbSVrB9oLXag/bb/FGfEes6tl
	ZjTAa/YZtSzvgzEAXa151UVQyxDrEZ+J06I6vH+/SRf+HVSkRX4yLMo/1qVEw6IXSw==
X-Gm-Gg: AY/fxX4WyYWIxB60vKb6MfSYhzHqdZhQq5KeT9dkVgXYlMuTe6hjzq5XocZLn5+k3Aw
	LjcU3cq4ZFQerdoH1a/H05PNuw/OHTvPalAeXuyfU/SEK2eTe2lg+qXRLtUf0D5KgMMydfcmPDS
	laawPUhrgsMy+DC4wWYDLMgQ6Sc1oC9EOaGWYEnzqA62VCG7/5V0+bBy9rI8TutiSYR5UHLP5L8
	GLdlHthgiYezPGFKgU5O4uX2YiKBHWE+BCWy4GKkKjayiZcVWhmwFMyRVu+yIKcWJqKseyfS6Xx
	aGsuDmX3cBW1/4YOtGptES4GKXsFmjYfj6zg/WhjpvZxT6Mopwvbrtjl3kGS6WXxqQJW4VMbYn7
	RlsAGzWRTNjsSOP003XwGzQan6+hfOs6/I/YoJqKcVzI8AsK3zygaFKP3TKeebkdUrucUOx2J5i
	rt3HRdkzNGrkoQgn4I3f2zymw1UfgjLCvcI5VSRiCg8Np8eiT+oEHjcRpHzhw9GpX9ER4PPtKj7
	JA=
X-Google-Smtp-Source: AGHT+IGXXbRPuFmV4F7d14FKGG3UfAiqcP2XHZWmE+zCzyMoEl3mapJpaf1d/5D/gozAVd1VHgoAiQ==
X-Received: by 2002:a05:6000:2483:b0:42b:3806:2ba0 with SMTP id ffacd0b85a97d-432c3627fc6mr5557476f8f.2.1767869140500;
        Thu, 08 Jan 2026 02:45:40 -0800 (PST)
Message-ID: <53913b1f-5413-4cb8-9758-9f891a704445@suse.com>
Date: Thu, 8 Jan 2026 11:45:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/15] xen/riscv: implement SBI legacy SET_TIMER
 support for guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <dfead0f29d2b93350acc5a20b9f75d534dde5d25.1766595589.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <dfead0f29d2b93350acc5a20b9f75d534dde5d25.1766595589.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.12.2025 18:03, Oleksii Kurochko wrote:
> Add handling of the SBI_EXT_0_1_SET_TIMER function ID to the legacy
> extension ecall handler. The handler now programs the vCPU’s virtual
> timer via vtimer_set_timer() and returns SBI_SUCCESS.
> 
> This enables guests using the legacy SBI timer interface to schedule
> timer events correctly.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

What about the more modern timer extension, though?

Jan

