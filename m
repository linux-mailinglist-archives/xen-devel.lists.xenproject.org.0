Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E814C9C872A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 11:14:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836223.1252111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBWrA-00041L-Oo; Thu, 14 Nov 2024 10:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836223.1252111; Thu, 14 Nov 2024 10:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBWrA-0003yb-MB; Thu, 14 Nov 2024 10:13:44 +0000
Received: by outflank-mailman (input) for mailman id 836223;
 Thu, 14 Nov 2024 10:13:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBWr9-0003yV-5m
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 10:13:43 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d5868e0-a271-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 11:13:38 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4319399a411so4314105e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 02:13:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dac0ae04sm14787975e9.33.2024.11.14.02.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 02:13:37 -0800 (PST)
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
X-Inumbo-ID: 1d5868e0-a271-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmIiLCJoZWxvIjoibWFpbC13bTEteDMyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFkNTg2OGUwLWEyNzEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTc5MjE4LjEwMzI3OCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731579217; x=1732184017; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8UlSKAaX/FPkMXejU5xZ7R3GnHc25IaXZrbC34ZZFAE=;
        b=dK0x6K+vvIRzKn7YqllpUfkGuPmqt2T8EbPqTaj8ocjk24mpa2SntadwF5N7oUPXxP
         N1wqt8mYVPSnaMZLp9WvCXJlYBBVq5TeG7WHzOSKTJMpCPRwhb7l+N0vZ9+JbDNZnC36
         h8aat4+L3D415arC9t+jw2wA5D1JXhNQIdZyQpXb/6amdMsF4g+ZmBx/JBl2EgAEb8FL
         gTeexOES9C2jdD1BDB44wZnrajN3uR8tStD7Tmg5mO8Btk3FclTIVh6HfTlxHRzLGY0w
         hB3zHPBGb3/+w+7B9ftu3hDgVBFOmmbOMcNW9Fc+Oi6qaz3ni4w2OPUjftzAA4a0xnJK
         RXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731579217; x=1732184017;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UlSKAaX/FPkMXejU5xZ7R3GnHc25IaXZrbC34ZZFAE=;
        b=S6iJU5G3Ys4GrdWRnyKNvr57x6MMrBpzIpNvT9KPT5N7g/RCRVJnYugizBHiirbM71
         2+pmLvGQ9wtMPy9tevY/Lw3sDCK7n2g4L59pFmLpp5hgUJ3ea43xdSX8sfd0IGVSUWkY
         titUK6caXm/qA23Ac97H+QwL6MghXK74LkhplUOds/7jvWKaGFugdm0FEB4aiUUr7sRe
         qm26+RlJg/B3kkH9z5PqDRFLTNa4x9O8qvGzmHwHm95VPbQLMN4qp0livnHfV3UGX+0M
         1pm/rdCVjitqr4wHR8/vSYLTniHSDQ38cP/qh6WzCW1peOAN2Jc3WRbVaxRoOdHjOlNU
         i8SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz2VWW13z8XIw4ZxFRfn3gLJ/2XwEzPtxvInoNZdC7HU+3IRfsVqoCsai8wJWqQ1NaEMI3EhTySg0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAi0D+GhkrxQsKcDK9OjeAb/+HJsjjmyFVCqfme5ozNMmVcimC
	Yg31Q5A8dQCNF8Ig8l2tcD6JXW8Z1QoZkue91TNnszpLNhcS3npqKRq4EFHJMg==
X-Google-Smtp-Source: AGHT+IHMbJBpEqDHgjyMxNe28OI4bAtUci3UoAR3WAVnPhvLm2jlXvv6mrryImOP3kXIFzXBfv0u8g==
X-Received: by 2002:a05:600c:8715:b0:431:93d8:e1a1 with SMTP id 5b1f17b1804b1-432b751bcc2mr198535125e9.27.1731579217513;
        Thu, 14 Nov 2024 02:13:37 -0800 (PST)
Message-ID: <c04dd574-97ab-4337-ae50-4e85de029315@suse.com>
Date: Thu, 14 Nov 2024 11:13:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] x86/trampoline: Rationalise the constants to
 describe the size
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241114090810.1961175-1-andrew.cooper3@citrix.com>
 <20241114090810.1961175-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241114090810.1961175-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2024 10:08, Andrew Cooper wrote:
> The logic is far more sane to follow with a total size, and the position of
> the end of the heap.  Remove or fix the remaining descriptions of how the
> trampoline is laid out.
> 
> Move the relevant constants into trampoline.h, which requires making the
> header safe to include in assembly files.
> 
> No functional change.  The compiled binary is identical.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



