Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A32A7E060
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 16:04:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940178.1340037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1n5K-0007xc-7V; Mon, 07 Apr 2025 14:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940178.1340037; Mon, 07 Apr 2025 14:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1n5K-0007wo-4G; Mon, 07 Apr 2025 14:04:22 +0000
Received: by outflank-mailman (input) for mailman id 940178;
 Mon, 07 Apr 2025 14:04:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u1n5J-0007wi-K5
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 14:04:21 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 323dd3c2-13b9-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 16:04:18 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso27886205e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 07:04:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec34bf193sm129955525e9.24.2025.04.07.07.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 07:04:16 -0700 (PDT)
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
X-Inumbo-ID: 323dd3c2-13b9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744034658; x=1744639458; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bwxcyzgPV8r2I866GPfT7ihqH67f1wcBr5QPG75gC7c=;
        b=H3J6GFsqDD42q+X4sna8VPpff1mRka7sdQkfWzw2wxe16YvePjukyqxYBxVOBZrlVh
         vdUPeT132KuV45G83Dir4A1BVCngl0g0vSXRIv/ZrmX4xuCsjnEsROQ+4r5IQC8RlrvX
         z97OpTbsU3yNsoQh3DUUoAX0U9xIZKrHZlXAXMTUGnxgkAF0M+qN9v03F8YzIgk5NJqs
         JiBxl2PZdd+mnwutens/qSrtYYWI9P69UzNyeSlDTS2dTRkBiAmXcB+KotWYs4Mza0O9
         S+B9ec0T9Pe+LrDwalQEyr1pImyT7YsaJH43g6H2UTSNetaH3LVeN8OScyDgCNQaeDNo
         19bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744034658; x=1744639458;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwxcyzgPV8r2I866GPfT7ihqH67f1wcBr5QPG75gC7c=;
        b=Hn5BNKt2sS3SeNftwFth+4LcU3fRvZhYMBhCvROy7q07T6gTbwINWGiad8yTdehykq
         b8PPomy7W6L9UMj7wQW4BIkY79rvaQ64PbtjC/yxVX6oE1FwFqIDs45VOZv5eyYFOT7p
         ZdzIjS+TBExevHoHOaZFExmCYnr2Z8Qs6FX0FZNpNkb6YbWgiHTwgs+Jp+uwL+5kkY54
         y/yjrXao5JgYaBIo+YsbOexxv0cjJUL915wa530s4ZzadXxdo+uQxg5Q1cmHnuohHjGj
         jctQEnfP2VhE6e9iIAwHFdSjbHA8zaZYIwJPd7HJDColZM5WJ/qeH5XPGYwI1qDctXyC
         m/FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoodtyyu1fJoFkSXa9EH8CEmq01oaDfqpEZDMQnwusx2oKk3VEeww0DfgMO62G9s986aJlo481q7A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhpqPWrN1/BVaGGVL0U8d5AgHrFgGd9n/8PQFNn1YlxqawMyYQ
	XAv2zW9VVlh1bVcEDnOLespacqKlBmv9eWk5fMSDrdxbBPH3Fn0hktJDLho6WQ==
X-Gm-Gg: ASbGncvf2tqPNkAYwaD5inCxNxOyg5EOyNLBKLWG0iskx2jq3jW9jzlYlw4tfJR14sK
	mDaDYHYVNkrenjnsvpA5P7VSrs0UgkPX/4MhPsBqZAs8dqn2xBGb8O3S3mDotRB0OtBZk0nUf1y
	zclQPyNedGM/KPGFVsl4qAThw2g7O4OsUVgaL/2B4GG0srK5uV2/Fqopi79Ayp1NXid7+sXz3Ci
	o9nsoYoV1iV1CgRfCXLPDK2Utos9xgfe6CKSKBEQjCbJOmH76IzTPYRCDYQB7A+ONGo3Swn+uwZ
	sZ1XAjn2Hnigwg+O2A83Fm4Q0XeX/JaD7/ANNiugUDl69qSesrrlIpKk6k/dC99BqMNeoTTC5My
	n6B3E1iSBXHvrGKd8ZfTt342rOIm+Ig==
X-Google-Smtp-Source: AGHT+IGejb3NDzYhfLmqbRsgs8rjIDqsDTgARZfi0jcl4+uqIamSDm173cSLK7seZSE7+qHj0Nt8dg==
X-Received: by 2002:a05:600c:1f17:b0:43d:1bf6:15e1 with SMTP id 5b1f17b1804b1-43eced66978mr119755285e9.1.1744034657160;
        Mon, 07 Apr 2025 07:04:17 -0700 (PDT)
Message-ID: <f71c3298-24df-4d6f-b73c-382d4a112e01@suse.com>
Date: Mon, 7 Apr 2025 16:04:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] x86/EFI: prevent write-execute sections
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <c686844c-4cb8-43d0-a762-7f93a30f9388@suse.com>
 <Z-vpoh858ldjXok_@macbook.local>
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
In-Reply-To: <Z-vpoh858ldjXok_@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.04.2025 15:26, Roger Pau Monné wrote:
> nxcompat should be enabled by default I think?  I can of course make
> it explicit by adding to the PE link command line.

--nxcompat wasn't the default originally, then was made the default for MinGW
(and by mistake for everything else as well), then it being the default was
undone for Cygwin. I've meanwhile submitted a patch to undo it for everything
that isn't MinGW [1]. I simply don't think the linker is in the position to
declare that every binary is NX-compatible. It's the programmers who have to
determine that. With the flag not being honored everywhere one also can't
simply test an EFI binary on a couple of hosts, at least as long as the EFI
implementation there is a black box.

So yes, we will need to pass --nxcompat explicitly in any event.

Jan

[1] https://sourceware.org/pipermail/binutils/2025-April/140422.html

