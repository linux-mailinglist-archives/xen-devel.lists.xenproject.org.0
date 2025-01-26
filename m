Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B781A1CE44
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 20:56:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877219.1287342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc8jQ-0001o9-Kw; Sun, 26 Jan 2025 19:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877219.1287342; Sun, 26 Jan 2025 19:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc8jQ-0001lb-E2; Sun, 26 Jan 2025 19:55:44 +0000
Received: by outflank-mailman (input) for mailman id 877219;
 Sun, 26 Jan 2025 19:55:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl/L=US=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tc8jO-0001lU-Uo
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 19:55:43 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84b9010f-dc1f-11ef-99a4-01e77a169b0f;
 Sun, 26 Jan 2025 20:55:41 +0100 (CET)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2ee76befe58so6533802a91.2
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2025 11:55:40 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a77c4ecsm5519455b3a.121.2025.01.26.11.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 11:55:38 -0800 (PST)
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
X-Inumbo-ID: 84b9010f-dc1f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737921339; x=1738526139; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k/VcBzCgSZMRn5BGbBxU096iXq4FkgwntnoR7v0hF60=;
        b=wCmCTNWFzRLk7f3OQ3uZiz3xfXHPCQu3fuCXUC8klKtsxuvdOzG4YryILaKgRaCWDm
         wOKiylYHc+GMbXfqW4JsPiEe1/lICMLQd8uNaUo1SA9nfvMgfSzCMMY9lzS9449zBank
         hObGYdPegWrFVcJjETGvqdKAN45XOMZ8PAiGFxLDBK35F3QRx6Uu3DSnBFlw7rJTWFM/
         yghXXwSUeI+Vc6nnrphLfxKLsmqQQoBc5RT/8ief6FpgvLzedyFOOc8jKYox3hUBy0PL
         Cnml0fPPEnKybIEilwvQzif+zJ2G24jIDLu4N4QuXIifwUdCDygKtP58Mf1Q3u6/AmTc
         EzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737921339; x=1738526139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/VcBzCgSZMRn5BGbBxU096iXq4FkgwntnoR7v0hF60=;
        b=S0rWURlKYWPuJh7b4sLb6ehnTq9itwVzL8kuJLPWsPHuXmo9nUN3gmaeBPocL1rngY
         0z3ksWWsK/JEdAtxmvJCz9pox5OvJdxii4jbDzlN9RGxi74VVerZ2kwPJCNn/kbrSa/D
         gAv3GkFKzGOXHT+TKKcCCCAt/VmQUGzGZDkze2hpIcLqbNH0jDa5chfLXvpLVlSGUznC
         rsu4G7+O808wNtYgDQSTR/rqkk7yK7PZXwPLVFkjQLn72TkytnjgOjtUNVWrb5Po7N9x
         1tgiBdZckP1gCtdYORGmHM+GWVnjy/4kc+SgB0rC9jx8WzxvHIj1qFpZZdx1bqnqdNxZ
         uMaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBd3+zd2BhvNvdwOuo3zWZmPc+Ds0O3xwkPAFrnfzeni1SkzleRA1C9QjbdFOE45sLQK5Pd1pxiwk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySFMCxD/ApQBM4HFBBMZuNvb+XfeO7h1q2hpyTfijMh5XtP2Ro
	o6FwgUXxrma17HD5u6SI7aPUS574fJ0imRvQS0wqMv2/vgUVJKaRrKyJpPp09s8=
X-Gm-Gg: ASbGncuAkqxADjE7UI1Wtuqfff/lA1pkvCKz1o/Oh/my/ccO4YIrQHt1LLWf4MUsN2i
	YwEWjRXUyaHI7ww+YgArILvbkL0qBVX/YftEA+Yym7ESMmB4l4YEoB6e59sEqEniEk9m0Es3rVP
	USOhk+SpfdjVj3YPQIXM5HljmRpMHjiLSt+iOdi8PwFp+wMNn7V4+/5EW7BZvACf0vL8ZEAl6Y/
	WjtfS8G7NOCdO/ClljMKMiml+p/D54/nJjAIX4zybxyM31TVTv0gUcGqZVR5L74kXxnNBj02BdC
	J30V6uPN2cHiHGd+Vn3JfaPdwrQcIt93Dx24YLU24JmBVcEeg2GxZ5a+Ow==
X-Google-Smtp-Source: AGHT+IHkPOqmTCjp5vaq/+XEVF4ezQ8MyiAJ8YKEj+eBpJYARUzB5sl2GUtr7fAvVdhnF62+x0fMUA==
X-Received: by 2002:a05:6a00:a09:b0:72d:80da:aff with SMTP id d2e1a72fcca58-72daf9c1dfcmr48758529b3a.9.1737921339455;
        Sun, 26 Jan 2025 11:55:39 -0800 (PST)
Message-ID: <ea6edd46-f1f6-40b0-bf89-c7f6f68bee87@linaro.org>
Date: Sun, 26 Jan 2025 11:55:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] user: Extract common MMAP API to 'user/mmap.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-3-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/23/25 15:43, Philippe Mathieu-Daudé wrote:
> Keep common MMAP-related declarations in a single place.
> 
> Note, this disable ThreadSafetyAnalysis on Linux for:
> - mmap_fork_start()
> - mmap_fork_end().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   bsd-user/qemu.h        | 12 +-----------
>   include/user/mmap.h    | 32 ++++++++++++++++++++++++++++++++
>   linux-user/user-mmap.h | 19 ++-----------------
>   3 files changed, 35 insertions(+), 28 deletions(-)
>   create mode 100644 include/user/mmap.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

