Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAF4A5D1BD
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 22:27:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909380.1316367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts78B-0000a4-E4; Tue, 11 Mar 2025 21:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909380.1316367; Tue, 11 Mar 2025 21:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts78B-0000XJ-AR; Tue, 11 Mar 2025 21:27:19 +0000
Received: by outflank-mailman (input) for mailman id 909380;
 Tue, 11 Mar 2025 21:27:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isYZ=V6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ts78A-0000XD-1O
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 21:27:18 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a832cf4-febf-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 22:27:15 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so1649855e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 14:27:15 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a75aae2sm1365345e9.20.2025.03.11.14.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 14:27:14 -0700 (PDT)
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
X-Inumbo-ID: 9a832cf4-febf-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741728435; x=1742333235; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GokTaAnqondTU7MlgAyrCtcMbxMtopqx+4M1uwEQ87M=;
        b=GDnEP7K5+QDtnzGPES0qpr5qInzt08jkmz/Bs7qwizzzJfC61M5Y5OoSPm/WKxXNnB
         /bDSiuDc+ky7c95PQPcC2U8lVidOVPofsrm/u0X1P1zSAOjkikYczP8VbEXtf83zE1Sf
         YlE/xZMaV2W82FK5m9WM6iil62k5b3E5BpLw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741728435; x=1742333235;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GokTaAnqondTU7MlgAyrCtcMbxMtopqx+4M1uwEQ87M=;
        b=YRXY8rl3SUHs9WY7MYSpolZrWv+y9rSm7hXl9+WF9fMXB+cW1gM/VXrG29rk0d5nEN
         P1f2yE/3fPbddUTqEEV9fpbMI7SE8QlcCTiCfDTBySe6LYyvAB+ltcNk9gP3S3+zDwvC
         CfcrdYDz8hZLX5MKWyfWghs3HKOJvxErv/ukbHEObrjvTVJX/jO/noFQ0qFHPYGLIv3D
         qT9Z1vjSOV+XBUhQfKbFgmHfmjcPBRun/f0hslRCq/stKw57fY5D4wrEVhJGHZa0AQYo
         DFh1OIY+GpJP43z30gIouGsxo6YIz/71nh4vnIJe2/OzztXuOSqXElRiWE7CN4TQ+Ax0
         IoOQ==
X-Gm-Message-State: AOJu0YyH2/ApY7bX1ewZuNirftPN4b6oCgUajFF2+KQ7C0YEQqURIfp8
	LXwTNWnBnaxQGZxsE/DeZ1CAqkrMtrmVtu+NOVy9UfCmFrnZ8rs0o5KXSD7snypduY0xGcGPtIv
	1
X-Gm-Gg: ASbGnctYscdPRr5nB8mOYtK22BwDGHxmfcxOUcnFwSf0L0KUfA6URDUPUQ8EOHJx6iM
	SF8nJ/4/iT4XRmvBBAfF3b4o2ds2BiqZ+r5JrkoknjYzCEtbw8xD65YwzLt+7kqB+sJyF/A1AW2
	qKnVlvc2EMOItp2eRMRw93VNLK5RP/qdhSahPYIswhdcOQjDvuHRFy6ID6eji/eK1W9d2F3owjP
	vxEcyywChtHkX/SPOjRBe58u87Tf/m0Ch0PAULKzu7aePKp9MCDVwPdxd+RtKteCxoQKZSl6vzu
	nBlnN5akvNA1AqkfLJtuoMATEJFjTo7Btb4PywNFiBDsldm0xHfUqNBpNxI2QWGcEaxBuT41QTb
	IlCXcj25r
X-Google-Smtp-Source: AGHT+IEaPi2ScbxWEXy9LOg2nnLdeMKQA979+ekLy7JkSlJQQ18e5x9dbPGRDBJwgTfl1/KjIdAdmg==
X-Received: by 2002:a05:6000:1fa6:b0:390:ec6e:43ea with SMTP id ffacd0b85a97d-3926c97ae30mr5904486f8f.15.1741728434878;
        Tue, 11 Mar 2025 14:27:14 -0700 (PDT)
Message-ID: <cdae37d8-a01d-412c-a48b-f4e27d7d898e@citrix.com>
Date: Tue, 11 Mar 2025 21:27:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/IDT: Fix IDT generation for INT $0x80
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Luca Fancellu <luca.fancellu@arm.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250311212248.3630583-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250311212248.3630583-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/03/2025 9:22 pm, Andrew Cooper wrote:
> When PV is enabled, entry_int80 needs to be DPL3, not DPL0.
>
> This causes the XSA-259 PoC to fail with:
>
>   --- Xen Test Framework ---
>   Environment: PV 64bit (Long mode 4 levels)
>   XSA-259 PoC
>   Error: Unexpected fault 0x800d0802, #GP[IDT[256]]
>   Test result: ERROR
>
> (Clearly I have a bug in XTF's rendering of the error code too.)

Fixes: 3da2149cf4dc ("x86/IDT: Generate bsp_idt[] at build time")

Adjusted locally.

~Andrew

> Reported-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/x86/include/asm/gen-idt.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/include/asm/gen-idt.h b/xen/arch/x86/include/asm/gen-idt.h
> index 9c8810edf9d7..d1da73248c1c 100644
> --- a/xen/arch/x86/include/asm/gen-idt.h
> +++ b/xen/arch/x86/include/asm/gen-idt.h
> @@ -77,7 +77,7 @@ GEN16(6);
>  GEN16(7);
>  
>  #ifdef CONFIG_PV
> -GEN(0x80, entry_int80,      DPL0, manual);
> +GEN(0x80, entry_int80,      DPL3, manual);
>  #else
>  GEN(0x80, entry_0x80,       DPL0, autogen);
>  #endif


