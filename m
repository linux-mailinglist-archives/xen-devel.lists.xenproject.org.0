Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285A0AAC766
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 16:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977358.1364376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCIvG-0002I1-UH; Tue, 06 May 2025 14:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977358.1364376; Tue, 06 May 2025 14:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCIvG-0002Fm-RQ; Tue, 06 May 2025 14:05:26 +0000
Received: by outflank-mailman (input) for mailman id 977358;
 Tue, 06 May 2025 14:05:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cniF=XW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uCIvF-0002Fg-JQ
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 14:05:25 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27274379-2a83-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 16:05:23 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-441ab63a415so57413905e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 07:05:23 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae3cfbsm13583087f8f.40.2025.05.06.07.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 07:05:22 -0700 (PDT)
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
X-Inumbo-ID: 27274379-2a83-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746540323; x=1747145123; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PAyJOpVVAN2YTo8d53BgwloaGhKjOkoV66ckmxX0dG8=;
        b=BRq5m5Quufu3XjL46OqhjvmdyJqKSqKThPW5W+F53kCMkjTPPydBp0q/CoSLaf5fbl
         jwB+bl4yiuFcEK3kEaT5/W7rotmEGfo+vVbFVMbGcqz02wn783xIf7+hIgeIpU8CPuhV
         sQj6QrZDDtFcXHgRRoJmmSGbIYrcTCD44c42c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746540323; x=1747145123;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAyJOpVVAN2YTo8d53BgwloaGhKjOkoV66ckmxX0dG8=;
        b=gT72qJPh/kiQP2S1OcUxg8akfe2wN15o2eMIkhVbnsjqE996GzdUU4e2BTyBG1a/qy
         kxsiEMIwE59m2d+h+Racuehw+xhZxSDYjSnPYxNRgG7hjKUOb2ge2AmqvJZXzWIszTSv
         PIO3imU2/a7hVS+I7rzCKkyB1ZtuBf+yMGX9Csv0lEjCB/PZ872JPhjgl9YQPoUBozN5
         WknMVHiI3oaKteM9ZE5dHCY9aY7Y8lAV8xiGmPsfAI8a41Z6WRlQvscZQ9uLc+Y7a4m3
         pkqiUcvKrBISOSyN3oG1zVYf9jSYA2cUbeCp2Y86Sl+WpOAD/9QYqG2fi+lJaUuRdD3a
         GlvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgYUl2DXocaaxfMVxakCr8h5HwkCQcEJEsPa+ua2knxg+nnsYxSCJXmIuTSxVWNuNxRJt0TNnAeHU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyiIPHWCrGZRve33tP5yXeM8oBqIIBTVp5z7oPT9Of/fVzj55Kn
	7L6AmOy7+rFE7PqGtNqjnNQzJPFIeF0l4KZOIsNhUlzRObQ1VBeHq+lINPCB7po=
X-Gm-Gg: ASbGncvAG12uD9hIrvNb02tGfosPEIocYIRDqxg2x5qIo5IwKI5mq41TBS45i++4GX0
	vJwb3RAu0qcEL0+yRW1kYTuMYK56cfsBeZb/+du4XTpjWQwXeHeOCvsgj7LR32W2ZZRvyGWrpr7
	1cYfJt1x9Am5yHqVG6wmRiBsix3ip35ezu5c3uYtqWBY34X5wsigXc4QlI+D/91/x9Zt7tuWCsK
	kFFscPS7ogTp9rCdiIFLjbXQzQOWNjkPER8oqSq6YSmL0GyNZzdaSfie/OatNZ6wrREsyejnuAm
	1BkD/+gnM3LrWuWkFO+ktPm4ygyDCm9y0iDCqo/IhAsA4fPgeREMGQ6zNsbEMPaIZisUtpPpuwS
	wzo9jtg==
X-Google-Smtp-Source: AGHT+IGYqC3EfPrsnPM0XuQRMnZCLCCZsvVeH2bFzbMeedDpBydufmcYOQfhj19fV9MfyutbCMOwLw==
X-Received: by 2002:a05:600c:358b:b0:441:b5cb:4f94 with SMTP id 5b1f17b1804b1-441d0fbd5cfmr24821455e9.5.1746540322650;
        Tue, 06 May 2025 07:05:22 -0700 (PDT)
Message-ID: <de48c8bc-a7b2-4b9f-b45e-cbe3f7eb03c4@citrix.com>
Date: Tue, 6 May 2025 15:05:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] xen/lib: Export additional sha256 functions
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250506135655.187014-1-frediano.ziglio@cloud.com>
 <20250506135655.187014-2-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250506135655.187014-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/05/2025 2:56 pm, Frediano Ziglio wrote:
> diff --git a/xen/include/xen/sha2.h b/xen/include/xen/sha2.h
> index 47d97fbf01..ea8bad67e4 100644
> --- a/xen/include/xen/sha2.h
> +++ b/xen/include/xen/sha2.h
> @@ -9,6 +9,16 @@
>  
>  #define SHA2_256_DIGEST_SIZE 32
>  
> +struct sha2_256_state {
> +    uint32_t state[SHA2_256_DIGEST_SIZE / sizeof(uint32_t)];
> +    uint8_t buf[64];
> +    size_t count; /* Byte count. */
> +};
> +
> +void sha2_256_init(struct sha2_256_state *s);
> +void sha2_256_update(struct sha2_256_state *s, const void *msg,
> +                     size_t len);
> +void sha2_256_final(struct sha2_256_state *s, void *_dst);
>  void sha2_256_digest(uint8_t digest[SHA2_256_DIGEST_SIZE],
>                       const void *msg, size_t len);

sha2_256_digest() is unlike the others as it holds sha2_256_state
internally.  I'd suggest having all of the additions below this point,
which group them more nicely.

Can fix on commit.  Otherwise LGTM.

~Andrew

