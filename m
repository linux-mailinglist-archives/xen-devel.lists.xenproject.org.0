Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 733889C5B18
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 15:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834690.1250459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAsLR-0004rB-7P; Tue, 12 Nov 2024 14:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834690.1250459; Tue, 12 Nov 2024 14:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAsLR-0004p4-4b; Tue, 12 Nov 2024 14:58:17 +0000
Received: by outflank-mailman (input) for mailman id 834690;
 Tue, 12 Nov 2024 14:58:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAsLQ-0004oy-In
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 14:58:16 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89c605ca-a106-11ef-99a3-01e77a169b0f;
 Tue, 12 Nov 2024 15:58:12 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43162cf1eaaso72818535e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 06:58:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432cf1216d6sm14782455e9.0.2024.11.12.06.58.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 06:58:11 -0800 (PST)
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
X-Inumbo-ID: 89c605ca-a106-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmMiLCJoZWxvIjoibWFpbC13bTEteDMyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijg5YzYwNWNhLWExMDYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDIzNDkyLjc0MTM0MSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731423492; x=1732028292; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYnJ0Z23EK3KdgOFbAQW0JAC7iVmAR8R31UNuC1Nv3g=;
        b=c831cBp7/UZSH2svai1xCibYee8P4oVJqDDXD49E//sa92FXeEVb8eSCplKZ7HvglV
         LJ1kpd4/1IxtUQutEmyqyHbMrncQ1ftJTSfZvNevSc0W3OoRN+HIngq76crA4Lho41GC
         AxvqCIk0I31KyP0SnNYyi0Ik27cMC2hS8suC5irdHesfNJ52lphPTjoBsuh3RmeVkWVX
         C9pE2OubViZFPiQhHgVWtAMjIwf9S3LpaB3r/qe7AYFZHdw+dwnh4XHBpmafCLICgOpI
         wZjMlZpRq93q0bLBEJPXI2tT6iHoEUV1syA7XwjrltSuRTkyc9HkXbi5KRhYkmQ26klM
         lhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731423492; x=1732028292;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tYnJ0Z23EK3KdgOFbAQW0JAC7iVmAR8R31UNuC1Nv3g=;
        b=ZMVm0HV3l/cWpy1mUh2A49sQOmbCgBh970G5QmliEEeEEaHFLt4P2wn5+UJbGd4U1C
         LyqE5rnF8Ff8ICEebhgowDX3eqfmBrCNUEauwbwMNj8W4H0J+CBzaVEvsnPl4+KJJErC
         J8XBaeFGuzfGlIfMNcEZ+FoScD3eD39q74SG7whutkyyg2io0Zb2HlDKZQdD0l0kF+xs
         1iIMZpCkbGLSuTVVfETVM40o1NOONuye9bOd5k8bJi0/TUr/jkZuFT/tUTGalH8uzAGW
         ObIlgVZ9m/hM0oofolIxQpea6wW2d7vX+KJZnMk/3bHKVY5sVmDOiu5WFDO3krRzzQfv
         CGGA==
X-Gm-Message-State: AOJu0YzpZJi5Keo4tLRmAe+ycs87LD7B4CuOwFb6qp0m2TH88HHzWcp+
	I0v6dgEbnzyAlGpq5bN+aa9X1Vo5pnfl7Tk7E93/PYwqB8k+un4jUOgeGWGuLZHDbbH0Vi2VBiA
	=
X-Google-Smtp-Source: AGHT+IEdI4wZt9apfuYgh9CikjFnuP044xTpgAoc8WdhI+RZ5bxwVYq3uzBSS0/jKLFQLL/E4FqhPQ==
X-Received: by 2002:a05:600c:1e89:b0:431:557e:b40c with SMTP id 5b1f17b1804b1-432b751e250mr174065805e9.27.1731423492127;
        Tue, 12 Nov 2024 06:58:12 -0800 (PST)
Message-ID: <367ba117-f376-433b-bd70-586d7519d94c@suse.com>
Date: Tue, 12 Nov 2024 15:58:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86emul: BMI{1,2} corrections
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

1: correct EFLAGS testing for BMI1/BMI2
2: ignore VEX.W for BMI{1,2} insns in 32-bit mode

Jan

