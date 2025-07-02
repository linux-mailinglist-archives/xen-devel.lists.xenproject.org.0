Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CFCAF63F3
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 23:27:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031553.1405362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX4yp-0007z2-Tw; Wed, 02 Jul 2025 21:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031553.1405362; Wed, 02 Jul 2025 21:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX4yp-0007wv-R6; Wed, 02 Jul 2025 21:26:59 +0000
Received: by outflank-mailman (input) for mailman id 1031553;
 Wed, 02 Jul 2025 21:26:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MFEm=ZP=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1uX4yo-0007wp-Ir
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 21:26:58 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47c546c5-578b-11f0-a314-13f23c93f187;
 Wed, 02 Jul 2025 23:26:57 +0200 (CEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-31393526d0dso4842144a91.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 14:26:57 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31a9ccf8711sm570443a91.27.2025.07.02.14.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 14:26:55 -0700 (PDT)
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
X-Inumbo-ID: 47c546c5-578b-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751491616; x=1752096416; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VnT9NdXE3ybydcEe8oSYwUjLjEOXETYq80rC4G+1H7Q=;
        b=CgJ5Y4GhEZEHGCkzSUtMwX3xbH+f0WWYTKhSdtDPDgOae+sS81wNngiOVG6fTBsn/E
         uOpBiia7EAGGZhN1UwDRPVeJYR487ISglYWJFk64ku7JuYWJJ7sWZeXRx4EXbrRQHREi
         IdN1fgSPZ0o/wcPZeksjmlDkWuXBDWoyh9Bulb7tBJEGfvx3/J5f8Gm5oM13Lafhm0l1
         RWOnU//vBarAECNzB42G7mAbXAbD+HJ9S+XOipLVKXGtj6Jv+kzm5WI2Q8/oRDE5VZZB
         wT96TyOd2n4msAl53/6uj2xFbq086XNhYnnO8qt4ZXVYgAY1GRSJVdmWbFpmhLzLQj9M
         6uLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751491616; x=1752096416;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VnT9NdXE3ybydcEe8oSYwUjLjEOXETYq80rC4G+1H7Q=;
        b=Bjkh+T6z5gm2DBghfhOE7CnjoICc9zIvmz987weLKjmJTuTNb3Ij2wz9YQnOZ3mGL4
         XJN7r7FZlVvA5Y9wRNkBBBZF19eP3tAv/7Yf59yU3mHdGH/2zxAuEdB7MXqPGHizLmMi
         7OH3SPyE4s2FUIuwPBT9JXLFiuyfj9BOP3srxxpuvthiiifB5+npJW1EYNUlRUlxKZFV
         yNOYTDWduS+CD466kT1wqty+boh2n4U+rmANki2onRzF3jVDJTQHLD+z1z515QfHAikj
         4mLpzUcm3kB7xcFzIXvWdX149/M8N+PodksVtcvilyr+Esx+RcWmo/TZgfyr4GO9HGDg
         03lw==
X-Forwarded-Encrypted: i=1; AJvYcCX+Jb7XYQUDSmr/bV60a1hPnz6Y/zxvrJVtezJd5DT66xewAlQaIj+ehoGgwh2SUD8KPRitpZzF4rA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdBTw3yfLh+swXbN9EYyG6zmsNfIlUrHa29OrAODvu6f7eVWKD
	mJGKLCnqDaT4P95UGQ4b0sDv4dq/5lE86Zvh7FzUQkNmxThDQRoqx8mcq+gKO+8uhf8=
X-Gm-Gg: ASbGncuKsnLwng9XpTzMQEV5FRrSD34pUVkuyuTnLM8NVxLkhXVfrXyDZmiXs1tSSxv
	LY4DWYj0T4Ciojpe3C18vO202Dd8H1R8SwGQ3SrqAl3rPOZ5OkYQNoKYsPJ97YRpvDTPTLSoANX
	PhLqCw0ckNroN48vLzvwblGCL1IiOfdSp/mnQG111lKJXVQyftfJKXPewQs+WoY2esNP9oy5AFb
	HSMU5+qkxfKeTSu0SfXRr/v/JeTdhwcqLXSAqdp6RFXoEUTPz84mCvOW5bPldZRFvpi5bv0Vc6z
	cMbHWA85mNNvxBY/wnuc0Pqy7gWxSggMyizshsZFWXw0qCSaEN+8ePfb/BEy0QU/mylc/IdfeII
	=
X-Google-Smtp-Source: AGHT+IFcgjPigidp2JUObKIfrGnW+CVetFfi2zv1TnmMkn0UzMtONPXdsIJh8GiugT0++pMmG1OYrA==
X-Received: by 2002:a17:90b:1848:b0:313:db0b:75d8 with SMTP id 98e67ed59e1d1-31a9d64e448mr1002562a91.32.1751491615640;
        Wed, 02 Jul 2025 14:26:55 -0700 (PDT)
Message-ID: <5348f155-5644-497d-b9f9-89924d961cff@linaro.org>
Date: Wed, 2 Jul 2025 14:26:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 57/65] accel: Always register
 AccelOpsClass::kick_vcpu_thread() handler
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250702185332.43650-1-philmd@linaro.org>
 <20250702185332.43650-58-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250702185332.43650-58-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/2/25 11:53 AM, Philippe Mathieu-Daudé wrote:
> In order to dispatch over AccelOpsClass::kick_vcpu_thread(),
> we need it always defined, not calling a hidden handler under
> the hood. Make AccelOpsClass::kick_vcpu_thread() mandatory.
> Register the default cpus_kick_thread() for each accelerator.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/system/accel-ops.h | 1 +
>   accel/kvm/kvm-accel-ops.c  | 1 +
>   accel/qtest/qtest.c        | 1 +
>   accel/xen/xen-all.c        | 1 +
>   system/cpus.c              | 7 ++-----
>   5 files changed, 6 insertions(+), 5 deletions(-)

Sounds good.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Unrelated, but I noticed that hvf_kick_vcpu_thread uses hv_vcpus_exit 
[1] on x86 and hv_vcpu_interrupt [2] on arm64.
I'm not even sure what's the difference when reading the Apple doc, 
except that exit existed before interrupt.
[1] https://developer.apple.com/documentation/hypervisor/hv_vcpus_exit(_:_:)
[2] 
https://developer.apple.com/documentation/hypervisor/hv_vcpu_interrupt(_:_:)

It might be worth moving x86 to use interrupt also, in a future series.

Regards,
Pierrick

