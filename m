Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F19A1CED0
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 22:37:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877363.1287522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcAJw-0003G4-3l; Sun, 26 Jan 2025 21:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877363.1287522; Sun, 26 Jan 2025 21:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcAJw-0003Dj-17; Sun, 26 Jan 2025 21:37:32 +0000
Received: by outflank-mailman (input) for mailman id 877363;
 Sun, 26 Jan 2025 21:37:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl/L=US=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tcAJt-0003Db-Rq
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 21:37:29 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd504737-dc2d-11ef-a0e6-8be0dac302b0;
 Sun, 26 Jan 2025 22:37:28 +0100 (CET)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2ee46851b5eso4989871a91.1
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2025 13:37:28 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffaf896csm5651556a91.34.2025.01.26.13.37.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 13:37:26 -0800 (PST)
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
X-Inumbo-ID: bd504737-dc2d-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737927447; x=1738532247; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MbN5ftkFW90qPVFMQN7kThRB1jW5R9e9lwVcXv22rrA=;
        b=z6jaCheu/p4I1jjGljbnBLEjysV36Yrb9OvXAF2O7WJ8x7yoDAPxIeQ/iyQf3TKFhn
         sG+Z8g3ugUoQ50C/pTWwNSThWz73MhhM3HNNYlH73pNm/4nrhRDXfQAJqPUZfoJHYeWs
         4sxY1GI5QCwgSJytkwruxUcylbfIk+i8YezexTZu6lIQKenTWv7bD4i1B1Gx1B79JlNG
         +JCiywV3VN4q188FmsotTC9elQaa2thzJNmAb1Z4G10zkXt4ioIZqkE9nQPt1y3RNU2I
         NUWBahhh1EEl+1UenYnUsISgV+w86HToI81vffFLCjYgKAhkTzCuw9XWDFuThlFz3t/J
         jncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737927447; x=1738532247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MbN5ftkFW90qPVFMQN7kThRB1jW5R9e9lwVcXv22rrA=;
        b=T6Ef7XNSgRrt/W/uV3r8+KHcDq/OiWagORvOBSASfmsa+5NarAp9yOUxgGKjkl3kqX
         HcyE7phOTC9nQezbWPpodT58tU/vq3dHLdKg+kVuIuFPKHtpwH2VP3N0W03i9/WMjwDz
         KYEHEHPfQ/TVmz5oVd6CR7sWUaQFz253P03DVGMjJPPTvP7MYxLjXl5yRU+E4TxZqrOJ
         U5FgwvdOQBzNsP7NujsgZY971xTSD/Y8oX5RgmVd2t/rjWWDjSjuw3LYMpodVkq+egXk
         bqtIaacPyXE3haitAK49mtAjv+n3B2Yq63Xpu4se+ja7O5D/NVXzFi6Q87NghQtKdbLw
         vYSw==
X-Forwarded-Encrypted: i=1; AJvYcCWduke+VfY+9Kzxn6DQJgJ2xLrP6MBTCCeZQQr7EhxvQJjSNJ2L64bOaUjwMcpaa3Sqw1GF2mYkx3A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuH4Nm4wyRLZqMHSodK0LH4uaLW4jFhnMnAomoISAxMDgnFoqg
	W7UOoqM9D7r5B3PeB5HGgyBIYulY41SwivdfO/SYWQ5ZWXATTWzyBq4OgllbRMg=
X-Gm-Gg: ASbGncuK1gA8Aq02PJJME8eyALSSm1xJfBU34SmrC+ZCBJqh5qZz9qjQ2UlwJHczsqt
	BArJtpN/XkV8ToW6+Low7BI87xQ7To/FJ6OqkmH7r1xH69cAHy5t4w0sQzwMrfMpEWLH3zPgkAw
	vqEjCv9HJA40BuUXig1vIj5Nl2oEfEfccYAdIEV+ApqVuZdswBa45XalhapMW+Yv9JxLFW6+bLJ
	lcb00rk+hS8XAODxYGevQVT60SsNTnMFLEqsmexq4ccjqdwIP5iP8ocE++M2hAbenQ6FGPuhP5d
	i9ExyLcpZQ5jpTveLneNShcVC6B7uNF23AtBK8I1mxBNjt8=
X-Google-Smtp-Source: AGHT+IFiuSNxM6E2NLFZz0UKT8aL9HnJkIEUZ+PxBPmebPJCN8+PDu1ajnV9q5XziLSw+N+w1RiQzQ==
X-Received: by 2002:a17:90a:c888:b0:2ee:f687:6ad5 with SMTP id 98e67ed59e1d1-2f782c5174emr59291165a91.2.1737927447421;
        Sun, 26 Jan 2025 13:37:27 -0800 (PST)
Message-ID: <46ab28c5-d417-4b83-97d2-b2ba49f7abfa@linaro.org>
Date: Sun, 26 Jan 2025 13:37:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/20] cpus: Build cpu_exec_[un]realizefn() methods once
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-21-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-21-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> Now that cpu_exec_realizefn() and cpu_exec_unrealizefn()
> methods don't use any target specific definition anymore,
> we can move them to cpu-common.c to be able to build them
> once.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
> Eventually they'll be absorbed within cpu_common_[un]realizefn().
> ---
>   cpu-target.c         | 30 ------------------------------
>   hw/core/cpu-common.c | 26 ++++++++++++++++++++++++++
>   2 files changed, 26 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

