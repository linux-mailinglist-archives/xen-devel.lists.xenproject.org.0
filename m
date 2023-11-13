Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6DB7EA2AE
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 19:18:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631947.985725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2bVm-0004sz-TO; Mon, 13 Nov 2023 18:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631947.985725; Mon, 13 Nov 2023 18:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2bVm-0004qk-Qg; Mon, 13 Nov 2023 18:18:14 +0000
Received: by outflank-mailman (input) for mailman id 631947;
 Mon, 13 Nov 2023 18:18:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZgi=G2=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1r2bVl-0004o0-CK
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 18:18:13 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00690f90-8251-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 19:18:11 +0100 (CET)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-280cc5f3fdcso3798760a91.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 10:18:11 -0800 (PST)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 ju10-20020a170903428a00b001c59f23a3fesm4142792plb.251.2023.11.13.10.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 10:18:09 -0800 (PST)
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
X-Inumbo-ID: 00690f90-8251-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699899490; x=1700504290; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cUZHYtdDAzSjFTXLnaas09EEkDjSU/8RG04d1d7Vlz8=;
        b=w//UhM5tPS840eb0HIs2kPNdllzCaqYkHyofLsUgJ62MlXyDsmo8JahwulafpPAXsi
         31IUr1hrYRCCpnshMPULLAcMcvwZEkGBIqhQTft+7KXTVbk32UZ9HCctsXvTXEPfLwOS
         P3TEKRfKiv3ySYW7I0SdRShS6xJOZkhW+uEWf9dYKZ2i3tM2In5PndfkaYEA4TnqfcP4
         ROdDPwbQRGH9EzCdfau31UMQ9y6Q7Q3Pm6wkMW8391Ob8VVVtxTxfgcdFGrhifwuhCcs
         fYTKyR5tSn5VHZKUs9sb45VLoLuA+n6RUYEzHg+M2Z3G0hCorQmLS0mLdeiC7tIjjfcU
         DJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699899490; x=1700504290;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cUZHYtdDAzSjFTXLnaas09EEkDjSU/8RG04d1d7Vlz8=;
        b=f5RBH7jGl+0qTEfUxdaIXF3mezDeOHEnD1ODtmYLcg8FXSWwYnzuoM7jJOm5QGU5Vg
         6JZVp+0ohQenWEsoEBYHj8BZD4x4ra1vsIeWDx5t+t5nYWK+ZuJ1lo/sHYlPwf7Dcl11
         ZgD9CMbGzfz7oAzrncNRbN/C7nLtQFiLdgotUxYOSgaYf5rIbINdouXcl1PwGyTrjdYy
         vq1vBB8pp5Z53JZX7Vspck2iTAKI8ot3x7OKPTHNBx4JlK+UXdb8Jskzk8N0iwck1nQZ
         OWL5tZXsq8RuDVF/DL1JNwXX5VXCItWV6CWc+48Mi1SPFAH3mE8BJY4P4PJ4p9Q2yfbx
         Vptg==
X-Gm-Message-State: AOJu0YyUOd7vgajF1dhFIkcJExRK5QuxBCC/uJqn9HVUQr4qVXvWoHnQ
	IjdWNh5nkR/XqPGQQEmLjSjWDw==
X-Google-Smtp-Source: AGHT+IFJSWU0EbEsWYs25C8piGyK3+q/+cqma/6uQPpfrlrJMZSyxnmKER/5e0gBjmHmts16wFp5ww==
X-Received: by 2002:a17:90b:1a92:b0:280:bb7:9fa0 with SMTP id ng18-20020a17090b1a9200b002800bb79fa0mr5083402pjb.43.1699899490100;
        Mon, 13 Nov 2023 10:18:10 -0800 (PST)
Message-ID: <ed177c44-6a59-493c-9010-1d534b0109bd@linaro.org>
Date: Mon, 13 Nov 2023 10:18:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 05/10] hw/xen: Use target-agnostic
 qemu_target_page_bits()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>
References: <20231113152114.47916-1-philmd@linaro.org>
 <20231113152114.47916-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231113152114.47916-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/13/23 07:21, Philippe Mathieu-Daudé wrote:
> Instead of the target-specific TARGET_PAGE_BITS definition,
> use qemu_target_page_bits() which is target agnostic.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/xen/xen-hvm-common.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

