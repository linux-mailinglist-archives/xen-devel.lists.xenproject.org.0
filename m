Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B49409C54E4
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 11:53:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834344.1249970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAoWH-00045w-88; Tue, 12 Nov 2024 10:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834344.1249970; Tue, 12 Nov 2024 10:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAoWH-000436-4a; Tue, 12 Nov 2024 10:53:13 +0000
Received: by outflank-mailman (input) for mailman id 834344;
 Tue, 12 Nov 2024 10:53:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAoWF-000430-Do
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 10:53:11 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d9dc191-a0e4-11ef-a0c6-8be0dac302b0;
 Tue, 12 Nov 2024 11:53:08 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4316f3d3c21so44600505e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 02:53:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6bf546sm244038035e9.21.2024.11.12.02.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 02:53:08 -0800 (PST)
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
X-Inumbo-ID: 4d9dc191-a0e4-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzAiLCJoZWxvIjoibWFpbC13bTEteDMzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjRkOWRjMTkxLWEwZTQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDA4Nzg4Ljg5NjkyMiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731408788; x=1732013588; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7qAlRosy1msISIEm2H4umvbsNeNDI/wvYZSgv7eFOPY=;
        b=Ym48TAg+UaQaIMZtCB0k2TtgI46V4ZqA4g0GqpYPJ2FrB8nWqZbkAmoJy7iULkcmAq
         OhRofzybPca5ah1wQ6MWqP+jsShIHu/jLzZpHyVlPcNVli7pp1Ow1P7wOXVPCqaU1Z5B
         7xlyqY+XVoNnXknfEDb7IxruBIHn3Eb9MxEE3gEF6z/fj4ZjHlJwBpNLUQkjZFSfC5EP
         zpqVXHIkbE8g/PMv0kt0OczcJNNHTdWdwVn4oGR9X38PgJcjuZUhCeVxuxzNlXs9eL6g
         g4vBRP26YXxes972HjSxG4vD/fxLJTjKEDPS9xXh9UAa2WkoBsUCL2fpyvTi56tPY3iJ
         Mw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731408788; x=1732013588;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qAlRosy1msISIEm2H4umvbsNeNDI/wvYZSgv7eFOPY=;
        b=JD+Hr9Jb5n3Vy5orlsaKl4ZgFVhcYeVya7buHPX0C8hpq06838G3vzAoR0KXarXDSb
         CLlvxJDdUfuGdV2xLnOFpGYCPndtW17aJJvsO/ZinYYIwBrpibV9SholHpZqAQ1GUFZR
         lQcGxbDIm7BQFR3tanfGhl1tm5mbEhGa5Mji04TpV+eyen/bk7HqktHZvQU9QPvHgvBl
         WaEjvtFXVzuj616Lu5mBd8kaSmAyzfNp9GvAsWd4B7J9L1D8jFSZUvMKo7iGc7+sn9rR
         TtBQdaOsSRhuroiXO3bX3r85+rqsUPldOI/pTrGqGXAEb8IyUYc/gICfM9ePPDU6+rHg
         hRWg==
X-Forwarded-Encrypted: i=1; AJvYcCX9nIhsT3zCWcm3BSMBkZ/XV3tggygzBl3wOHArWFNvD40PWmPJnJc1VAWIql4wLpJzAyFWpK/9D8M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+Cm1QDSxEa/Pi3iAPEte7VyFsf1+BwixFGTXNuaFm5MtrX056
	rPK7NhXU20R7K5pQgIQS0DxT2fXX+TemxWV9knEip0Blwio0QUTHF0Q2ajuVxQ==
X-Google-Smtp-Source: AGHT+IF/rM2L53/Pp2naoliALyCpbYsR6VvszVSY36LXvnnhb4KaNI6D8MsFiLxpIcUB6b2lCLtpXQ==
X-Received: by 2002:a05:600c:5125:b0:431:588a:4498 with SMTP id 5b1f17b1804b1-432cce7295cmr17873385e9.14.1731408788294;
        Tue, 12 Nov 2024 02:53:08 -0800 (PST)
Message-ID: <e855f74b-94a5-4154-9d29-47d8ec44d6f3@suse.com>
Date: Tue, 12 Nov 2024 11:53:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/ucode: Rework Intel's microcode_update_match()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241108144252.315604-1-andrew.cooper3@citrix.com>
 <20241108144252.315604-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241108144252.315604-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.11.2024 15:42, Andrew Cooper wrote:
> This function is overloaded, creating complexity; 3 of 4 callers already only
> want it for it's "applicable to this CPU or not" answer, and handle revision
> calculations separately.
> 
> Change it to be microcode_fits_cpu(), returning a simple boolean.
> 
> Notably, this removes a path where cpu_request_microcode() inspects
> currently-loaded microcode revision, just to discard the answer.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



