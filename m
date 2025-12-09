Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A936BCAF843
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 10:54:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181307.1504373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSuQ5-0001N7-AP; Tue, 09 Dec 2025 09:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181307.1504373; Tue, 09 Dec 2025 09:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSuQ5-0001L4-7A; Tue, 09 Dec 2025 09:54:09 +0000
Received: by outflank-mailman (input) for mailman id 1181307;
 Tue, 09 Dec 2025 09:54:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rCN0=6P=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vSuQ4-0001Ky-15
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 09:54:08 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff85134a-d4e4-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 10:54:05 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-640b0639dabso8712320a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 01:54:05 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f4498ed9sm1336520066b.16.2025.12.09.01.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 01:54:04 -0800 (PST)
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
X-Inumbo-ID: ff85134a-d4e4-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765274045; x=1765878845; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vcz884HHtwVOs8Zkb6Wfc8IbRh86xIj0X3WWWxxB36o=;
        b=aBKyzX2YwJsWZBTOmXcYyBSltgmJAmqSIm1LksA4fX3YGFkc7GQdAgq3Tlvp+bxk5E
         GEkPd9T2gprSW5rIg7SSH0iz0CTZr2Ji1QvAeLMVS5syaqGlCH06KZ5dgVF5LYv26cPp
         nGbqoi2iwHCIyEQxSmMgGuS9fCcjUKWz+Ro1StXklqmYDM7b2h9JNeHKKjj2IjpwHc4x
         nnp6fdBHZnQGrOi9Lyhv3OoX0Sh8pQXcnLUalZfyyfUPzEkArJTxxzyETLXZHjh45hgl
         mD9dLUHiXNkupvu6n2OkEmXPeQorz6Fe9JQtz9bAEPvKBsDTFFsYbnMplnkhpKTzoULD
         feog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765274045; x=1765878845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcz884HHtwVOs8Zkb6Wfc8IbRh86xIj0X3WWWxxB36o=;
        b=YDKrtTurWjtfBhHIjEsm2yAZJpQJwt7W0LsU9hbO6gnSwpZhV+RsdLCgq7T5jf+x3n
         ZheKXOeI/Fz+a3Fla9fDerHn5WsKJ+q7KIaoMzZSZkPVMsDVb60FTP8amVErwmDooclm
         JIG5W6mWd24MgMnLK+E0k5pKBYMb66q2m09OBpmi5orYXhWpqNstJRt775QKlf2zYu9M
         QM3JZc9FDed31aKKyeTSVOeJcRPu+w+pxCCXZWSw92C1TjmJ3m3+w5kGOlZ7xSN6BBTC
         7he7ZZ/xSu4ro8Y3q0WLpu40RVUDOGcNQXpojcrVqlXkRTdGQcUet4NvmHrgxeObWyo0
         7imw==
X-Forwarded-Encrypted: i=1; AJvYcCXQKyOgOlG2aPOVS2n+26CqMBUR16vx7/TwSGLwSYIk9CgWQOll0TP5Ph9ZgrdXUMwDASfMDHbVmvU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6yIk53ia1e+5fLEbHAD3QefLnxuFbhTqVgos2GBFo4Q/Uh5AZ
	5AzzpeYHzF2gB+qjF0ZRppg4q5QV0apMLTY4GT8F16B6MRuOaupRit10
X-Gm-Gg: ASbGncvdAoKDsJccZGnBzmqbGfDg60ZnrNXNXDcgwj+JUzuHPQXnN2ark+sNgJxexbj
	3+H5HH3logH+5DA02uFIgPyGf+9/poWwK0LnCNZusyTUT2/XIJIieoZ9ubJXE9ahdpUuyrGX/m7
	Q+dk6Gs8i9uhHV70IURh8EhNSxd4QbXRW9F+2wYN6vaASWYSj2iHKl/2cd2tvSrnthnp7JeSCBY
	PmncaEAOxC0UwqGe9pJ5xfxBWYHTYhuK+wy967zFJLfYZjqsrOxXaiIYF3AgVTOfL33sgueIOCs
	gjnN9BHHmvZvXri3w5f/yLVSRHJ6r3NpnIUdG58Xe3sVxsaYyMro1NKhxHbNowPAGohYoC88yBX
	Okr13wOU/y1rOH2Mv5l2vHjyLJNxYL1YaDAWjim57GfzcyVrzGQYcJ5D/BPWvDdndLgT+ylX2L8
	6TWXIAepJPouEwpxn2gAXjmzpb/sSf4knOJKq8phW5RFt5YYyIWv/Yz3pwTF0f
X-Google-Smtp-Source: AGHT+IGJDIpnhBnJZQwDSNNG+MdXNR0ADJP4CunMyi6v1wuvuienlTxfZZ1oW9FndegW7tRRWZiS4g==
X-Received: by 2002:a17:907:94c8:b0:b73:8792:c3ca with SMTP id a640c23a62f3a-b7a2474fee5mr1024160866b.32.1765274044898;
        Tue, 09 Dec 2025 01:54:04 -0800 (PST)
Message-ID: <d4758b99-48b3-4cae-b55b-6552b6daa887@gmail.com>
Date: Tue, 9 Dec 2025 10:54:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/19] xen/riscv: detect and initialize G-stage mode
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <0e32a6bd86828952d7494b8d49b48d512f53cada.1763986955.git.oleksii.kurochko@gmail.com>
 <67c222b8-fafe-4af4-be5e-2eb4638af4cf@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <67c222b8-fafe-4af4-be5e-2eb4638af4cf@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/8/25 5:22 PM, Jan Beulich wrote:
> On 24.11.2025 13:33, Oleksii Kurochko wrote:
>> +static void __init gstage_mode_detect(void)
>> +{
>> +    static const struct gstage_mode_desc modes[] __initconst = {
>> +        /*
>> +         * Based on the RISC-V spec:
>> +         *   Bare mode is always supported, regardless of SXLEN.
>> +         *   When SXLEN=32, the only other valid setting for MODE is Sv32.
>> +         *   When SXLEN=64, three paged virtual-memory schemes are defined:
>> +         *   Sv39, Sv48, and Sv57.
>> +         */
>> +#ifdef CONFIG_RISCV_32
>> +        { HGATP_MODE_SV32X4, 2, "Sv32x4" }
>> +#else
>> +        { HGATP_MODE_SV39X4, 3, "Sv39x4" },
>> +        { HGATP_MODE_SV48X4, 4, "Sv48x4" },
>> +        { HGATP_MODE_SV57X4, 5, "Sv57x4" },
>> +#endif
>> +    };
>> +
>> +    unsigned int mode_idx;
> Can't this move ...
>
>> +    for ( mode_idx = ARRAY_SIZE(modes); mode_idx-- > 0; )
> ... into here? You don't use the variable outside of the loop.

Agree, mode_idx isn't used outside of the loop anymore, so I will move
declaration of it into for header.

>
>> +    {
>> +        unsigned long mode = modes[mode_idx].mode;
>> +
>> +        csr_write(CSR_HGATP, MASK_INSR(mode, HGATP_MODE_MASK));
>> +
>> +        if ( MASK_EXTR(csr_read(CSR_HGATP), HGATP_MODE_MASK) == mode )
>> +        {
>> +            max_gstage_mode.mode = modes[mode_idx].mode;
>> +            max_gstage_mode.paging_levels = modes[mode_idx].paging_levels;
>> +            safe_strcpy(max_gstage_mode.name, modes[mode_idx].name);
> This looks as if you were overwriting .rodata here (the string literal
> "Bare"). You aren't, but why can't the whole copying be a single struct
> assignment?

Agree, it could be just:
  max_gstage_mode = modes[mode_idx];

>
> Preferably with the adjustments:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~ Oleksii


