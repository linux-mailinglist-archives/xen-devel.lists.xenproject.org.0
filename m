Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CB3873D28
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 18:16:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689422.1074374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhuse-00008J-S0; Wed, 06 Mar 2024 17:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689422.1074374; Wed, 06 Mar 2024 17:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhuse-00006X-PM; Wed, 06 Mar 2024 17:16:36 +0000
Received: by outflank-mailman (input) for mailman id 689422;
 Wed, 06 Mar 2024 17:16:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9guM=KM=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rhusc-00006P-LL
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 17:16:34 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4752ef5a-dbdd-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 18:16:32 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-512b3b04995so5602466e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 09:16:32 -0800 (PST)
Received: from [192.168.69.100] (vau06-h02-176-184-43-100.dsl.sta.abo.bbox.fr.
 [176.184.43.100]) by smtp.gmail.com with ESMTPSA id
 m26-20020a17090607da00b00a441ff174a3sm7372337ejc.90.2024.03.06.09.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 09:16:31 -0800 (PST)
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
X-Inumbo-ID: 4752ef5a-dbdd-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709745392; x=1710350192; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MTstlGT/a18Frjz+rGLei+v7kWgyirApdQCesjszieE=;
        b=PAkjQpC7glJceQnF0s+8OVBPNvN85azfrlUTB0dm74iIwXT231JosVg9HzhCnbGqya
         S9TeUfcikREg/vRtLGfh8H6qzbGAvLDvHhC377ZVkjl5czRgWvaeEQSMpyB2TTVQoDpv
         mRS0+kMPpH1WlrLNtHQZFyPoY5rRgl6A9lSExN7cCrkU8tif3lgY+qegzt/cmwxb9HYX
         LA2ditSGkij/WfRTeWQhXhoCzjr3Og+k3LNsorg9N25rz1OtHQ8xaAPYo6e+cuc/09Zx
         Z+dSVRj2pT5oXVpcW1lJBfIj/egwdJ3WCNQ2UQT1/+npTrV4ly4QDxFr7bJk1XggsmFi
         jySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709745392; x=1710350192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MTstlGT/a18Frjz+rGLei+v7kWgyirApdQCesjszieE=;
        b=wMSWG9PxRFxzAq25BN2RLWjtgtyBkj9dt/I8Y8MjswV825HGrXf9v0KukWKcmGmDk5
         i1J+Kqwq8GI5GJV1eP+jBpYGUK8D7F0UdouflotSXE2p6WpqHTNWTidcpO3DXipN4rBO
         WBhF/lA2RgPYa7Rjlpo5UbclQhsPAx/9RN1yu+ahWHjORDKA3AdBOw2bm+FQQdF+t24F
         mVqeuwC0lQdX8mK4vH+3+oY/rGZTpD4MmWBv7MYAFTmZIR0heOKXD9T54OO/x5xYr8wr
         QGUxMDmEH9UekXwPvlpHozCLTYi2BpzglrXWJ/rTvTooFQ+lG2LEhlvaVwVT9tbfHjDi
         wdJA==
X-Forwarded-Encrypted: i=1; AJvYcCVrJu8l+G/c6GDv3m1shWndVie2nUgNMYlmBKeYt7Y9GtYp4hX4//LYMjOVry10ufi2GuRatw8fLAtb2gSOycx6/y6wpROrjv0MsVHlxLg=
X-Gm-Message-State: AOJu0Yz4FkZdQKIm2A3mKxp9shNvHsqm4/ne7NU/Q4WrnCOfrmLZGUpM
	vLf5ZO7HGj/swdRN+gWUJGVg/562/sw/SC8rdrPwmGC0X/7L39TfeXHa75mW/OU=
X-Google-Smtp-Source: AGHT+IEEEm27HQQ1yt59I8k1pXk5Kp9RWbi0wEjybB+XpiWEN9134OAxfJLk1YHC0bnesbA0/Cv8CA==
X-Received: by 2002:a05:6512:1152:b0:513:5203:e255 with SMTP id m18-20020a056512115200b005135203e255mr4652979lfg.7.1709745392070;
        Wed, 06 Mar 2024 09:16:32 -0800 (PST)
Message-ID: <6de50dbc-9525-4e25-ba70-55aea0d3f044@linaro.org>
Date: Wed, 6 Mar 2024 18:16:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-9.0 v2 13/19] hw/xen: Remove use of 'target_ulong'
 in handle_ioreq()
Content-Language: en-US
To: David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, kvm@vger.kernel.org,
 Thomas Huth <thuth@redhat.com>, Anton Johansson <anjo@rev.ng>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-14-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114143816.71079-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Cc'ing Anton.

On 14/11/23 15:38, Philippe Mathieu-Daudé wrote:
> Per commit f17068c1c7 ("xen-hvm: reorganize xen-hvm and move common
> function to xen-hvm-common"), handle_ioreq() is expected to be
> target-agnostic. However it uses 'target_ulong', which is a target
> specific definition.
> 
> Per xen/include/public/hvm/ioreq.h header:
> 
>    struct ioreq {
>      uint64_t addr;          /* physical address */
>      uint64_t data;          /* data (or paddr of data) */
>      uint32_t count;         /* for rep prefixes */
>      uint32_t size;          /* size in bytes */
>      uint32_t vp_eport;      /* evtchn for notifications to/from device model */
>      uint16_t _pad0;
>      uint8_t state:4;
>      uint8_t data_is_ptr:1;  /* if 1, data above is the guest paddr
>                               * of the real data to use. */
>      uint8_t dir:1;          /* 1=read, 0=write */
>      uint8_t df:1;
>      uint8_t _pad1:1;
>      uint8_t type;           /* I/O type */
>    };
>    typedef struct ioreq ioreq_t;
> 
> If 'data' is not a pointer, it is a u64.
> 
> - In PIO / VMWARE_PORT modes, only 32-bit are used.
> 
> - In MMIO COPY mode, memory is accessed by chunks of 64-bit
> 
> - In PCI_CONFIG mode, access is u8 or u16 or u32.
> 
> - None of TIMEOFFSET / INVALIDATE use 'req'.
> 
> - Fallback is only used in x86 for VMWARE_PORT.
> 
> Masking the upper bits of 'data' to keep 'req->size' low bits
> is irrelevant of the target word size. Remove the word size
> check and always extract the relevant bits.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/xen/xen-hvm-common.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> index bb3cfb200c..fb81bd8fbc 100644
> --- a/hw/xen/xen-hvm-common.c
> +++ b/hw/xen/xen-hvm-common.c
> @@ -1,5 +1,6 @@
>   #include "qemu/osdep.h"
>   #include "qemu/units.h"
> +#include "qemu/bitops.h"
>   #include "qapi/error.h"
>   #include "trace.h"
>   
> @@ -426,9 +427,8 @@ static void handle_ioreq(XenIOState *state, ioreq_t *req)
>       trace_handle_ioreq(req, req->type, req->dir, req->df, req->data_is_ptr,
>                          req->addr, req->data, req->count, req->size);
>   
> -    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE) &&
> -            (req->size < sizeof (target_ulong))) {
> -        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
> +    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE)) {
> +        req->data = extract64(req->data, 0, BITS_PER_BYTE * req->size);
>       }
>   
>       if (req->dir == IOREQ_WRITE)


