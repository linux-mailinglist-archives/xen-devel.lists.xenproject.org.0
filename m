Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B40DAA1CE4D
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 21:00:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877234.1287362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc8ng-0003sG-8l; Sun, 26 Jan 2025 20:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877234.1287362; Sun, 26 Jan 2025 20:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc8ng-0003q9-5k; Sun, 26 Jan 2025 20:00:08 +0000
Received: by outflank-mailman (input) for mailman id 877234;
 Sun, 26 Jan 2025 20:00:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl/L=US=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tc8nf-0003kh-Hh
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 20:00:07 +0000
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23186b99-dc20-11ef-a0e6-8be0dac302b0;
 Sun, 26 Jan 2025 21:00:06 +0100 (CET)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2ef714374c0so5728307a91.0
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2025 12:00:06 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffb1dc56sm6196959a91.49.2025.01.26.12.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 12:00:04 -0800 (PST)
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
X-Inumbo-ID: 23186b99-dc20-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737921605; x=1738526405; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jvT1nOyyGXJEnkXkKCQj0Xq14BrdlE2RAOYFWR4ybQg=;
        b=e7SDiUR23qm+RyyWxecnkkruvlx+zoM/1pqYtyLJk3ATfnIG9d/LZX1HwooD5d6SwA
         wrKygL1OY3MUKkfVnyaHa0iYE0vcW6eFfgohATMCgs9MYD4nwdG66U5xvw8WrD6GIFek
         WT2xYVdVpA4/Zyw8e3cqJfiGFZRUfZGe7he/HNPs9t79l7JRyyhzIL0zRrRfUsiuy3Ik
         Rpx1VxXWUECjJVpTnYKDj+RDegPmirpR8ynkdFMSSxf6NvzcVWArF1/pl1i8G4/pkbqd
         ix+HfEl4/8qKGxfVgizSY7PUDtBdUEGssfCxYsSesQ+bmuJjgXga8KfldL0Zv1s/o/B0
         3NhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737921605; x=1738526405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jvT1nOyyGXJEnkXkKCQj0Xq14BrdlE2RAOYFWR4ybQg=;
        b=wCM97nY4u4OmRVNSyoe7TfCQXMsVHAolHaV68EPBoKt/l6UqibhLyR+OZzHoTxx8No
         r5t1z4SFHCz+BGsaHhg6KXL8vaV0AOwr7oLGp5V763RnauH1mXsO1iASnlTmfC34VjbY
         GJpT7aIPoGnkNi24RlxN4gAeVVI2qIZTbAkMQxDLeC4izeSUIWkI37buGJ15eEEFqMEW
         Cg9aHvPptL6c0OnWJdgCsTQxyh66MhdCnCME1Y3qHYUIKliFpAkJ2e4PLeHqKguNrFr9
         ZvWd4yAca4Th6wtbyy3+eU0a+7TA43jpq0PpQBD8turESA05j7/Zbmh8EhOZ8lxm/xjI
         bMkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+SYi6W7mfRMq+sz6qiCznEE5J/J2RA0vzuUfajKe12unoQKF2xdlihO5pkuMSXyZWbFniAZGP63g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywntrpLK7NJM8Bpm+hBRMje9KtlrPuM7xrF4aWtta7i4aMN8n8
	NYqyeCKbTROgmafhsM0y9HKh2vvldAnssHBVn6WP11bkzFXFuqkgXYH0VmqO4Ck=
X-Gm-Gg: ASbGncv1FZ0TJnzGiTEBgDnfT1n67e9AGN3zURWCE9D2HrtKdRjDLzOJkqiSCqERvY0
	/XsRKAwjSLl29aIX0fWVMjbe3U3+GxtsEHOxrI3Sq7GTfIer18BgkRifhqcoQfTFTMktxPWRWL0
	JOs7Ehg30XbTY5sIcQwGt8J0zxn0AHXqfsoxzR9Eu7bkzMNa+3wN35xXiiM720KwNfLlikj2WM0
	yK8XdUNeqme4mXTSIn2DvyyW3Mjw4M4r3RFBqVH4aA7mIIkQjnDN+dz+KUilAgGpkgpB/vovYIT
	XAW6kc5CR7EH9ChruXW6zFaKlbSI9RPxIU92xCehXPwrXVg=
X-Google-Smtp-Source: AGHT+IEP4DwQ/u514V5B38J2P62wTL0qYp8JNncl4+5UB0i/l/G/YI+4UbX8eVL0ayMsA+c7B1DDZA==
X-Received: by 2002:a17:90a:f947:b0:2ee:8cbb:de28 with SMTP id 98e67ed59e1d1-2f7f176b184mr25848071a91.8.1737921605198;
        Sun, 26 Jan 2025 12:00:05 -0800 (PST)
Message-ID: <ba781224-7b4a-43f6-af25-acb308f11313@linaro.org>
Date: Sun, 26 Jan 2025 12:00:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/20] cpus: Keep default fields initialization in
 cpu_common_initfn()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-6-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/23/25 15:43, Philippe Mathieu-Daudé wrote:
> cpu_common_initfn() is our target agnostic initializer,
> while cpu_exec_initfn() is the target specific one.
> 
> The %as and %num_ases fields are not target specific,
> so initialize them in the common helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   cpu-target.c         | 3 ---
>   hw/core/cpu-common.c | 2 ++
>   2 files changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

