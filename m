Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52060C1CAA3
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 19:05:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153021.1483508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEAWg-0004Ul-03; Wed, 29 Oct 2025 18:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153021.1483508; Wed, 29 Oct 2025 18:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEAWf-0004SJ-TV; Wed, 29 Oct 2025 18:04:01 +0000
Received: by outflank-mailman (input) for mailman id 1153021;
 Wed, 29 Oct 2025 18:04:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SvD6=5G=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vEAWe-0004S9-SR
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 18:04:00 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a302c1bb-b4f1-11f0-980a-7dc792cee155;
 Wed, 29 Oct 2025 19:03:56 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3ece1102998so113341f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Oct 2025 11:03:56 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7a94sm32890124f8f.5.2025.10.29.11.03.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 11:03:54 -0700 (PDT)
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
X-Inumbo-ID: a302c1bb-b4f1-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761761036; x=1762365836; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9VQ9NFqmoQaRAvyFbiiny8iwf9jUVf2eG2Hxhn7ltXM=;
        b=Yig8Zm6deqmUg6KfbYG9cdGSE1qZQ7oFZMmhjQrCyx7SW6iexfCDHuqFI6Vo9Zp8Br
         iV+9OUcnQ0YZwykadz4pfTuXHWFh3MACaAzILRdrg7ymauPIVQOmpqaEBzyVYXKOPY3q
         lwJ2uqdG6DUCevEbyxGaJ4b0ZxuvNmUhqigDesUJrMC1JRlTVolvOb7EvAU2y7r9frsB
         5rkrT9cZDoL/PpkvNqnnhKWSig2FjJ0TKw+xfc3nTIu4GBbQpXgbfYqUn+pHhzNyPAPr
         vtyAwU5WlGXVw3O/mljFkHHSCv0TRXCCEBGwxYV1LpqyyNPmdZKTlWFqRgR/M/vh/D9a
         ZqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761761036; x=1762365836;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VQ9NFqmoQaRAvyFbiiny8iwf9jUVf2eG2Hxhn7ltXM=;
        b=achawhm9i218Ca4NNsm05Y7JDRTdOU4cyu3/W/g2LYhJC46R/+BPArT/fNTSk7HWx4
         BIm+QMT9fdG+EahGV1yn3oGxHSWDtKdBhljS71DEnpqN/nDKW+o5fTS/Vet17vrgVdgH
         LbtIADMOS7gJD1Tt0fqFDYsr5Xv3k6wD3LW9bc6T3eALqwlpK4lraHoYzPxabKLeaqDg
         FvjWUAtpUIvumdXkSj6l4NXE1Qwd9N3QZkFZ+9L8c6mm2LYb3WwRRbUSGqnL2aQQ3Hh1
         6g6I2mXG9xFDZgJVtqMbsimTotDoGyfPfC9aY1A6MpbZW3QkDU3PfAmTIIAl0lAGiTKj
         wNhA==
X-Forwarded-Encrypted: i=1; AJvYcCUTU+AyYane88eFGEA4yalwwItNZkEWAqO9EqLUJTFdosDBvCgMeCbCEJK8AP+Ab+NhVNF/8YRJQOs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywop+s+HAccl8eYMuhUQVEaxvVMY4QmBHPcbKBkkKf6CZCKMN1F
	aqfMyT9/i2vojuudfati4CdTLIYQEJoE5RLxUlkMLA+l3Q7iBTzqAFh4xTPXsN/pVE8=
X-Gm-Gg: ASbGncvVlVFGyO9jXK0X2dYb5eniV3lRUcdTkDDtXCFHmsa5hO8RVdoK/rtlt7dRwus
	A6PBcJ+2f6zxLbCbljUBzY8BvPRSvr8P++KDw4tUz2EADDufHZ0XFSEf+GmYDyxct3GN45b9fiZ
	8Rmj4z/C8tMJiilFsy3389y+PIHofL08LC35T4Y37MM5LQglib/efYpwYKz+dsniUK9IGYlOjeZ
	pPVTohW/MXXtzXISjDBGYrTy3RQmNmLYj7CXE+pknxpR3PHwsuusup4UsSMOAzdzXLNzjwgtG3m
	1Q7L0EK/+A5bzN8ipEu+KVbA3zgSX4KGmtrSkuMX2Qiic8PNYYDqZoETUR0xDC6rks4WqTSHPG5
	cIEXUYQc9KZuN0xSu/u/I4N8fEQ5trVI0JfDY4DIkG7vHk8Z6QEsmLjmGBeZ6EwKsAllJ6rW2KA
	qXWHec74vYpvjWA9OU+sx9sJu+LpQsKjrrEYCLt/YjteI=
X-Google-Smtp-Source: AGHT+IFOOC35tgEDpGgsXmuWu7r0djoujt+Yy6qRLjDUgazWUa9T871lHEfonAwAiAmla/XzbRZFLg==
X-Received: by 2002:a05:6000:238a:b0:427:9a9:462b with SMTP id ffacd0b85a97d-429aef78fb8mr3142266f8f.18.1761761035767;
        Wed, 29 Oct 2025 11:03:55 -0700 (PDT)
Message-ID: <1fb8a69d-de0b-4afd-9e61-083d7b3d7abf@linaro.org>
Date: Wed, 29 Oct 2025 19:03:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] hw/xen: Build only once
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Anton Johansson <anjo@rev.ng>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20251022140114.72372-1-philmd@linaro.org>
 <64b66fb0-f297-494a-8e79-b38c02c070b1@linaro.org>
In-Reply-To: <64b66fb0-f297-494a-8e79-b38c02c070b1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/10/25 20:17, Philippe Mathieu-Daudé wrote:
> On 22/10/25 16:01, Philippe Mathieu-Daudé wrote:
>> Replace target-specific code to allow building
>> hw/xen/ files once.
>>
>> Philippe Mathieu-Daudé (3):
>>    hw/xen: Use BITS_PER_BYTE & MAKE_64BIT_MASK() in req_size_bits()
>>    hw/xen: Replace target_ulong by agnostic target_long_bits()
>>    hw/xen: Build only once
> 
> ping?

Series queued, thanks!

