Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D3073A75E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 19:38:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553860.864674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOF3-000529-NU; Thu, 22 Jun 2023 17:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553860.864674; Thu, 22 Jun 2023 17:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOF3-0004zX-KN; Thu, 22 Jun 2023 17:37:09 +0000
Received: by outflank-mailman (input) for mailman id 553860;
 Thu, 22 Jun 2023 17:37:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3b9O=CK=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1qCOF1-0004zR-KX
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 17:37:07 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6691eb3b-1123-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 19:37:03 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f8777caaa1so5822221e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 10:37:03 -0700 (PDT)
Received: from [192.168.157.227] ([91.223.100.47])
 by smtp.gmail.com with ESMTPSA id
 ep8-20020a056512484800b004f26f437ad8sm1181122lfb.53.2023.06.22.10.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 10:37:02 -0700 (PDT)
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
X-Inumbo-ID: 6691eb3b-1123-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687455423; x=1690047423;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/fsL2cVXAXnCdY15L3MolzVIRIDo39bn2bc5jAVthdc=;
        b=kK9ms6oxy4w18XnqLzRC42c2y3VtHaZF6WjXDGqNMNiQNvba5S8AHyOTZEqCY8BDzY
         gSHrJgC8UlnZMr3hGroun6OS37q7nTj7t0rJS1s4dj4kEV/EdOM8bG6f6JAbd91UV8Re
         ovlIHAL3ZTFS25sFLjk1CL4w9JQHOOEo3xYK1FUH6doAfwuUX/AZyGxw7CjLF/N9xRPE
         Ce6z40LRpgoVSeaffnwM6XvFDi1MLGoP0rPfRGV9+UEr6gsStEfKCmRCH3QhxI4LKpZy
         17/b15DUPPGEIlxPBA4ymfRxYz11wMz+nZmLgkeWJndJ0QllQ7EC1vHkRYpy6UOVehTP
         gASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687455423; x=1690047423;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fsL2cVXAXnCdY15L3MolzVIRIDo39bn2bc5jAVthdc=;
        b=RcvzCCuPdYHjEm8GCX2wh1DrVPzXqooGDA9mhU53cwC+94T0beKT0BOgzZ3v6MnxYz
         u2gbe4WPOCDl7p9qolGuTdrC6V6pHpzRGDoFp7ONTUUL3twN3Mp95NUa1PlY/pcmmkx8
         gHm4Cn6v/IE5PjVwSXL6VnDkziZbYJ9470AztEQfEb3X7QviIS0RPUy/p/mi6ISiXF8m
         taetvlE7XT4dN9T061sTIhrT2hR9qnVTWvgW5qfKIiGNDo/PS1y2JYPUOpZWElZq/UK3
         YlFcd6tw7g0vb5ydj5xU/uTN2mMnd6EMiNa1nWOsyzJYY4wwB9PoJGk3ev2p6c+Wg2rX
         nxEQ==
X-Gm-Message-State: AC+VfDzWPJOH1jcWAl5TkMr7/HAMnaTHUEQg7tggwHVJj3uLXzE4/R6t
	+uNmv1eDVjxFRcJi6sNPaU9KsA==
X-Google-Smtp-Source: ACHHUZ4hXNqmNTn6U0F9nFN6Me87Rr7UBrptzXZ7Yf1Vq5uPEksRCjxnuN8AqvGh0D6IfBMleD+RSQ==
X-Received: by 2002:a05:6512:1284:b0:4f9:5ca5:f1a6 with SMTP id u4-20020a056512128400b004f95ca5f1a6mr4238864lfs.17.1687455423332;
        Thu, 22 Jun 2023 10:37:03 -0700 (PDT)
Message-ID: <960b4b4f-8899-b263-4f31-5a4ea798e034@linaro.org>
Date: Thu, 22 Jun 2023 19:36:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 05/16] accel: Destroy HAX vCPU threads once done
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Roman Bolshakov <rbolshakov@ddn.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 xen-devel@lists.xenproject.org, Eduardo Habkost <eduardo@habkost.net>,
 Cameron Esfahani <dirty@apple.com>
References: <20230622160823.71851-1-philmd@linaro.org>
 <20230622160823.71851-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230622160823.71851-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/22/23 18:08, Philippe Mathieu-Daudé wrote:
> When the vCPU thread finished its processing, destroy
> it and signal its destruction to generic vCPU management
> layer.
> 
> Add a sanity check for the vCPU accelerator context.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/i386/hax/hax-accel-ops.c | 3 +++
>   target/i386/hax/hax-all.c       | 1 +
>   2 files changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

