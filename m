Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0396A78AEF
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 11:22:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935346.1336755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuII-0001CG-70; Wed, 02 Apr 2025 09:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935346.1336755; Wed, 02 Apr 2025 09:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuII-000198-3r; Wed, 02 Apr 2025 09:21:58 +0000
Received: by outflank-mailman (input) for mailman id 935346;
 Wed, 02 Apr 2025 09:21:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qYE3=WU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzuIG-000192-Kz
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 09:21:56 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaaf4cf2-0fa3-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 11:21:54 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso61398885e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 02:21:54 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b658ab2sm16581014f8f.15.2025.04.02.02.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 02:21:53 -0700 (PDT)
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
X-Inumbo-ID: eaaf4cf2-0fa3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743585713; x=1744190513; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mVu+XsclTEC69Fn0hfsPm/jbJrrBw+MNBUSAN9D3KoA=;
        b=YH9KCPouYgRoZ3AcG7re+NrDIENfMsIT7Lzky+4ylOJ3wvldRC4pG6xCgsnVbQwIqw
         tbqTnPvadrqnZerA/ltGdPakxCm74O0owdpqj+oFkdm6rE6eaiQdKSN1GukKNzjewZrw
         dFdY2X+qrq3rrpwTNoRbS+Sss4iubwnQYbAWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743585713; x=1744190513;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVu+XsclTEC69Fn0hfsPm/jbJrrBw+MNBUSAN9D3KoA=;
        b=b4DjjvKHFtr0/NWGv/tb6fD6JKB37FGcYnK6mQylvZb/1FhJRpWC6Mi2ZCetF7Vjmn
         NDd9EeYysXXmVBRIaD4mfGrcL45yDZDf+7ReenNjms4foJ82/5VYYhAGZmRHo9CSBTd6
         1SO3qyFXx33xCoaUeAZ+wHg9N3r5c6Httpw67u2GctKJjLwOucPIXWQrz0xZR1PWe284
         mgVRHj+BQZGKhTNZR6x3ycqxDjFYW14lfhzdRUYVR+45L0gXl6VuZiyD9OvwU2jBjZZz
         utRFZdzvRYdHDyZGE50oi97/005Y1JGmbrjYuKdGcSoRD13+Aw0s+7JoLf6g/7PzEve8
         H+8g==
X-Forwarded-Encrypted: i=1; AJvYcCWr//A/uYaKrLUjeJBaF6p2XAnggpwFZ2dXNFKHRQgQXuqsPQesc+lLLrs290ehrLhFjwlLjWU68Vk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcJijMQiN72DwHEh4oxG4b6DZZQkKaCrckX9JO9NTsEfyeuWZO
	C6lR5xEbbKFXVxryPUlflDQvyhyTeUpuI5C6jYKqft/RbzlI7e3IhTsDgstx1XY=
X-Gm-Gg: ASbGncuvqItTfff1pgPm4BbF1bCMe/RD8XnM2tX84SE0NW+Eg+zpy8TmvLBdqI/E4YL
	JsTEIB6XuiDL8ygfz/dnxqLVAcbYnBmiG8J7+UCvrUYgN4KyCd2DIbLBZgm5ZMkGqmCuD2+F9m8
	SOHYfN5NsavmV6c9gOqHcOEgD331P3dLfnnGpPy9GsoZkshtWQutj6wi9WSsFPMtsQYHAKwwrYN
	eAR4p5WUr1YJw8hrUVroQZ7q/EOZey+GLBn8L6qNjgOfSCUxc/SYbhV+hima8rWXwAtQo40BT/i
	OKcI+zdG2lz/227Tmoma0gvSS1H3c4cczUK2Ao+apodfA4hSoMmJHwKBHJaAPbVMGnD8/MMWL6k
	1gLA8zhNQZg==
X-Google-Smtp-Source: AGHT+IEjg2h2sr0RGMW7BYHDBG9NGN8XBDyWLSPudhDAVwOv023J+nRR0TyF62V+D/be7OMopFOj6Q==
X-Received: by 2002:a05:600c:310c:b0:43c:f575:e305 with SMTP id 5b1f17b1804b1-43db6227bb7mr137625625e9.8.1743585713535;
        Wed, 02 Apr 2025 02:21:53 -0700 (PDT)
Message-ID: <87f8fc5f-ed82-4930-bc04-50106cc5acff@citrix.com>
Date: Wed, 2 Apr 2025 10:21:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen: simplify bitmap_to_xenctl_bitmap for little
 endian
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250401005008.2787764-1-stefano.stabellini@amd.com>
 <694eac75-e872-4ba0-80ed-95c14cd11f5e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <694eac75-e872-4ba0-80ed-95c14cd11f5e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/04/2025 11:09 am, Jan Beulich wrote:
> --- a/xen/common/bitmap.c
> +++ b/xen/common/bitmap.c
> @@ -359,12 +343,11 @@ static void bitmap_byte_to_long(unsigned
>  
>  #elif defined(__LITTLE_ENDIAN)
>  
> -static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
> -				unsigned int nbits)
> -{
> -	memcpy(bp, lp, DIV_ROUND_UP(nbits, BITS_PER_BYTE));
> -	clamp_last_byte(bp, nbits);
> -}
> +#define LITTLE_ENDIAN 1 /* For IS_ENABLED(). */

I guess I can fix this in my bswap series by giving __LITTLE_ENDIAN the
value of 1 when it is defined ?

Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

This is very very long overdue.

~Andrew

