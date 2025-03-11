Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD28A5B9F3
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 08:36:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907314.1314572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tru9q-0002qZ-5c; Tue, 11 Mar 2025 07:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907314.1314572; Tue, 11 Mar 2025 07:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tru9q-0002nP-2K; Tue, 11 Mar 2025 07:36:10 +0000
Received: by outflank-mailman (input) for mailman id 907314;
 Tue, 11 Mar 2025 07:36:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+cUl=V6=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tru9o-0001G6-NW
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 07:36:08 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d479f8e-fe4b-11ef-9ab8-95dc52dad729;
 Tue, 11 Mar 2025 08:36:05 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-39140bd6317so1735233f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 00:36:05 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cee67ae5esm91023745e9.33.2025.03.11.00.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 00:36:03 -0700 (PDT)
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
X-Inumbo-ID: 7d479f8e-fe4b-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741678564; x=1742283364; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YBDtd+wGYXepiPCUvcu8NxohmXbd41Si0c1Rztrtm0M=;
        b=BWnRMCPw154basHCJkqQs6/Bg6u6ICLwUkydumixDViB3ZAOl8MlEqhVoo8N12bUqG
         olCtGJXbUmG9U74t5p52bYXW7nXYN2PHp2hP7FNdhP3RoxtISlKXodWS5qX6aY7VRCkx
         DX5zzaZYYxk4k+YWs0bYYONIwaJu1aTobWQVlD8J6jjtxT5WPpf2Jfn9K384zZSdQy/9
         4pWY3qA6dNwkjyLNbSp3jlnxOVHxJTjRjfMb8in1eG5cn6b/ExC2IBYsrZRbf5iYl5tb
         P9xlb9sCi4P/Q3XLUTVV2MpzkZojBbapeO2BwuakDCPxFetJ21GK1od8Qq6U6ROma6Ni
         0pwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741678564; x=1742283364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YBDtd+wGYXepiPCUvcu8NxohmXbd41Si0c1Rztrtm0M=;
        b=gJH3KTUMnotXhWQzL5B/mM/aUNTm9wZxrZO53HnOAbqDLwEtq8Ly95gLhEPfCYigz8
         PyapaSMuKy86eDn/v/oRQSxaRrQ/3PqUjN0GYakmtBg1cH8wL85JFZ3tG899IuGZvzLI
         UTohjc60xFOQHI8S40uxZeNrnjS6k5z/O/N8kRtuPBRf9OESvb5bfGk6+EOoykbOT7AM
         8pM7k5PBXCGEMLCKUay6W3mZ19QbS+aL5Z04qtKfpJoZWih0D759GnNZWd1O/zDKXH1T
         W+PWV8wTVis5KNbBqYLi46/475yZ928+BKGBxywcECZsZ95L2YHZ6MtVSo+HtIOhs3Jl
         6FIA==
X-Forwarded-Encrypted: i=1; AJvYcCUdAx53bw45dMJBVPPzTAHxRKSOih0gDNXn0lKPEBd6X9zzv5+0NpXjsX4Dp9lOJ/gMrG86iO8vtpk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvpcmULUyeaQrVzewyAM6XAK6KLOjaUxGt5iXcUG+vJcChnM43
	ZHeSzED2e+JcOevya4QzW31BDRb2DBAYDERCin+L/eAjG/Ck3KCqcswTYLMO8Vg=
X-Gm-Gg: ASbGncusCxx+gmTNzTvU93POuPSOd9/KY4OrrIPoRcatQB6kTJ9cNFLhk8raQnhH0gi
	LVrOh4mwsXLaXWk1inswvhXMEpwwNIEN70h3hCJtsq6B1CZw71nUVbwkJOlm6Rah7XqYXh/HU4H
	riU60ADM18rNOz1/g7SQBcCqiYBzhvnlAy9vhJUPSJ6QOaLM7d8zi0fOotE9wfMutJHDAOcwVF2
	Ic9MTdZ2zL+rskbmC8f3pBaP/IOw4c17Dzqoj62f6bvpud0sjhdYb7QH4rS1Oslf8urhV9Qt9A1
	lFC/tSE/nj0Qe/eRQSxKPfReT5qr2QGV12x4FLpJ6T1rW2KZACWBYnR3OmVFC7YVCWb2ofx/egg
	U+4DlfMFxcbIdCDDlcwydQQc=
X-Google-Smtp-Source: AGHT+IFSPGz9/gfwsiFYEmt/RzI+9DcM9u3J2MgkQs5at33CHQLyaRLSm47Zlzsudug5b+arJ/EAbg==
X-Received: by 2002:a05:6000:188b:b0:391:496b:5646 with SMTP id ffacd0b85a97d-391496b5792mr6565392f8f.28.1741678564530;
        Tue, 11 Mar 2025 00:36:04 -0700 (PDT)
Message-ID: <b8073e25-ae8a-462b-b085-84c471a4bf5e@linaro.org>
Date: Tue, 11 Mar 2025 08:36:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/16] include/exec/memory: extract devend_big_endian
 from devend_memop
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org, manos.pitsidianakis@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
 <20250311040838.3937136-15-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250311040838.3937136-15-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/25 05:08, Pierrick Bouvier wrote:
> we'll use it in system/memory.c.

Having part of the commit description separated in its subject is a
bit annoying. But then I'm probably using 20-years too old tools in
my patch workflow.

Only used in system/{memory,physmem}.c, worth move to a local
system/memory-internal.h header? Or even simpler, move
include/exec/memory-internal.h -> exec/memory-internal.h first.

> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/exec/memory.h | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 60c0fb6ccd4..57661283684 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -3138,16 +3138,22 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
>   MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
>                                 uint8_t c, hwaddr len, MemTxAttrs attrs);
>   
> -/* enum device_endian to MemOp.  */
> -static inline MemOp devend_memop(enum device_endian end)
> +/* returns true if end is big endian. */
> +static inline bool devend_big_endian(enum device_endian end)
>   {
>       QEMU_BUILD_BUG_ON(DEVICE_HOST_ENDIAN != DEVICE_LITTLE_ENDIAN &&
>                         DEVICE_HOST_ENDIAN != DEVICE_BIG_ENDIAN);
>   
> -    bool big_endian = (end == DEVICE_NATIVE_ENDIAN
> -                       ? target_words_bigendian()
> -                       : end == DEVICE_BIG_ENDIAN);
> -    return big_endian ? MO_BE : MO_LE;
> +    if (end == DEVICE_NATIVE_ENDIAN) {
> +        return target_words_bigendian();
> +    }
> +    return end == DEVICE_BIG_ENDIAN;
> +}
> +
> +/* enum device_endian to MemOp.  */
> +static inline MemOp devend_memop(enum device_endian end)
> +{
> +    return devend_big_endian(end) ? MO_BE : MO_LE;
>   }
>   
>   /*


