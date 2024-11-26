Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D359D9519
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 11:06:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843502.1259119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFsRm-0005Ho-CO; Tue, 26 Nov 2024 10:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843502.1259119; Tue, 26 Nov 2024 10:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFsRm-0005Fc-9l; Tue, 26 Nov 2024 10:05:30 +0000
Received: by outflank-mailman (input) for mailman id 843502;
 Tue, 26 Nov 2024 10:05:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFsRl-0005FW-JA
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 10:05:29 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4fa40ff-abdd-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 11:05:26 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4349fd77b33so15921715e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 02:05:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fcff017sm12838557f8f.108.2024.11.26.02.05.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 02:05:25 -0800 (PST)
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
X-Inumbo-ID: f4fa40ff-abdd-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzIiLCJoZWxvIjoibWFpbC13bTEteDMzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY0ZmE0MGZmLWFiZGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjE1NTI2LjAxNDIwMSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732615525; x=1733220325; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/bLSBzi23tLlOlfvnet11HoFjOr6yB4syboMHczw9Nw=;
        b=D1F+/VQ3dNyxYSWf5CSytd/O5YMtSWWWAJmVRksxaRWReybwENgjQIx/7bTMX/maMy
         aHIr+PwCpB0C3G4Sej+eU83RYCvohYk4Deah4iiRbMIHsufcUfF2PmbxPX1Vtjik0c5E
         xwl9CSd4Ls3s5HmIXZKIP9Rooaz5x1+yMnn0SQh8VEtuzSa/gmPfzCeHjUFpDPCvj/kX
         jbwXHM8VR5arbHeA9fqdHXrALUz0czpY26m+9GETFlMNdeqnWMNKt4t3jGlWrYdSW1gn
         PLxDZmUxxHWRvhZas6VgOpSWjXVVAGY1ntRQJEaXq9AkYB9tJ0+YKf8HqzS3OzzaCGpo
         pwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732615525; x=1733220325;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bLSBzi23tLlOlfvnet11HoFjOr6yB4syboMHczw9Nw=;
        b=I4rDaIcBoVW/ZR09+eXKuoSQVU2aA053+Rdro542G4xQu4RCpBwYnOxRQ7nTaSr+9x
         00czfTN4haz9ruhQuF6bv+l8NF7quZ4ZCfprPN0MOh9+9ySrMXmClzCIjtA3mNb4jt9C
         P2jSRvLwrkrrm7qyWyYH1zXDxk8QjK9+3yw4ANdWJ7opIi0zv/kA2F5suQEuPJSWgGh6
         FyWMQL3zRnKHAgKCpLAzSYEnWRFqNDrhh8QbrGsgtGFgBToseCPKjBkJlyGernX5P9m4
         ARWRJKFpPCm1/y9Rpd99dsM6nBj+veOyLSA7cN6HnDVY++RbjGY4zVi/QMXDYCr6Edav
         cs3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJhtsaS3VGIKbT7K7vi9cDplQLNrJ0OUjisddry/AUhF/jgiY/q0NPXAL2M/QwVOadufvlKhV0yBs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyX70ax2xPmZLDpleaSW712ev+dZWK2zGyqjd7jnmXeYALEm+H
	cbOa00UBX1H95QUQJ2acyUqqlnCsjJ3sn/q4DrhNsT7StvwN6X0g3IS0B/+BqA==
X-Gm-Gg: ASbGncu16UI+YYIihMQsJk0H5GXPR6dt3pKD5MZPtvZhworsGrdObM/xR0aUYBAVnAi
	84ShFqKTlWPrHobbpY5+Z+i69BrV3i2/y3VS12dXRK3NYdtIuLPhNpiHj94KLBExmcHng3sNEHC
	aEajYn1ym+JvQuc8jJQBP+9yl4Gmq2IPIwgmyxJhACuQOaZveXrM4UyA2dvGmaTcmHo3HinmbI4
	VLZj3AoYPJkZr6IEKpAfmHwGMTehJJi86XDRQDY2Qcv5sPD/E0Su8PStZGijXq/esQQDDR+Ezqq
	IqVp/posThIJPbktdl3u4AuCMl/RLTi+okw=
X-Google-Smtp-Source: AGHT+IH7e9b0SOvEAV9FUiJwOScnaGcxkAHs5uztqM0VdYTAGgOyMTyAHzMH3VLYpQhLjuKFTw54iQ==
X-Received: by 2002:a5d:6c69:0:b0:382:31ca:4dca with SMTP id ffacd0b85a97d-38260b4d679mr13511664f8f.7.1732615525425;
        Tue, 26 Nov 2024 02:05:25 -0800 (PST)
Message-ID: <87779b38-c027-45c3-a7af-f3e2b4b2a0f5@suse.com>
Date: Tue, 26 Nov 2024 11:05:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] kconfig: introduce option to independently enable
 libfdt
From: Jan Beulich <jbeulich@suse.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-5-dpsmith@apertussolutions.com>
 <1c920063-efc9-4004-8670-fa3aae1389ef@suse.com>
Content-Language: en-US
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
In-Reply-To: <1c920063-efc9-4004-8670-fa3aae1389ef@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2024 11:03, Jan Beulich wrote:
> On 23.11.2024 19:20, Daniel P. Smith wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -53,8 +53,12 @@ config HAS_ALTERNATIVE
>>  config HAS_COMPAT
>>  	bool
>>  
>> +config LIB_DEVICE_TREE
>> +    bool
> 
> Nit: Indentation is wrong here and ...
> 
>>  config HAS_DEVICE_TREE
>>  	bool
>> +    select LIB_DEVICE_TREE
> 
> ... here.

Oh, and - please don't put LIB_DEVICE_TREE in the middle of (sorted) HAS_*.
It wants to move past them, before MEM_*.

Jan

