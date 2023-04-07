Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9956DB704
	for <lists+xen-devel@lfdr.de>; Sat,  8 Apr 2023 01:13:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519159.806414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkvGk-0005NC-U3; Fri, 07 Apr 2023 23:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519159.806414; Fri, 07 Apr 2023 23:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkvGk-0005KA-Qs; Fri, 07 Apr 2023 23:13:22 +0000
Received: by outflank-mailman (input) for mailman id 519159;
 Fri, 07 Apr 2023 23:13:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dUW=76=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1pkvGi-0005Ev-KI
 for xen-devel@lists.xenproject.org; Fri, 07 Apr 2023 23:13:20 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c80f6c5d-d599-11ed-b464-930f4c7d94ae;
 Sat, 08 Apr 2023 01:13:19 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id o2so122996plg.4
 for <xen-devel@lists.xenproject.org>; Fri, 07 Apr 2023 16:13:19 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a170902821600b001a199972508sm3382209pln.124.2023.04.07.16.13.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:13:17 -0700 (PDT)
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
X-Inumbo-ID: c80f6c5d-d599-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680909197;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ItnoDxjRyq5NxF6TJi+AQI7ZLK0+7Nql3EFIwnRinE=;
        b=tBpx2Whb4QzegaMnt95h9v7OIs3R0veH7QI0AUG8m9HbqbV69oRmE1Lp3HyvnMwLin
         McrVCRHDPd0x2sKbwU88FmIlMhQnR+/8x5bkAEnXgzjwWrTRhDDlXblkJAD/Gz648Xwc
         5Raj8RHXLDPLqPir8wxUa9xK9fb7aGTo1JHNiEa3mGeWRYIsyKtHdFiZJYaxFCiRB9Sw
         e3YuDa9UieI9e3U+MI+GMOtmitZ6G286gVAMwWk6LF3ANI4RVLMGHfTrXI4s+jKap2JY
         LvI5E5XUdmS2/NCFq1bHDfM8/DxpdIw7Sp0m9wmFWfggE3O13TldNX65vBYEOTNlWaI7
         hICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680909197;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ItnoDxjRyq5NxF6TJi+AQI7ZLK0+7Nql3EFIwnRinE=;
        b=bhqY53vuCmAMHhHohma2geZjl7/NAIYvFF1DNaALZHlB4/cy2EKZqOy31mzv+cYXUG
         MoqRvh93MOZ+plSvZaYv227CassUKdG1Iaai+T9mTL8nb1t4YRVTzSji2xoZ4N2PMt6n
         Yrm9qIHsNcc04/1YGqEAVi52r3vczrX/Vn/mImvEJsGGOAVtFhR5S/9/hnfakkwolqnw
         D0MbjQV9PEEdIxtxf+Sz37uSnFiOyI2lMSMWDQFODxaz1bcGfV90781h2T4V6z2N7mJi
         SpzyW27raEcfh0ooyVa3NXsaukf3jT5tiwxseX7778Q0UJbs2A8e6IQtG0PnVpnGXkkZ
         26Qg==
X-Gm-Message-State: AAQBX9fG5Ag8agHXX0xA4mMrdN3MzC/xy77nScHoXNQ169AgJjeccNrc
	FtSm2efSfaXBDq+83BMwNq7GZA==
X-Google-Smtp-Source: AKy350Y3lzjtZw4RK/yOE1pq/rsEAaEwouoQEVbujzz2mrQjMkOvcprqVjsdpaOumVHAhvkYih/Nlw==
X-Received: by 2002:a17:902:f544:b0:1a1:b8cc:59da with SMTP id h4-20020a170902f54400b001a1b8cc59damr5210653plf.33.1680909197678;
        Fri, 07 Apr 2023 16:13:17 -0700 (PDT)
Message-ID: <9a1a1a4a-ef80-61a8-8d2c-55817fd12496@linaro.org>
Date: Fri, 7 Apr 2023 16:13:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 13/14] accel: Inline WHPX get_whpx_vcpu()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-14-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/5/23 03:18, Philippe Mathieu-Daudé wrote:
> No need for this helper to access the CPUState::accel field.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/i386/whpx/whpx-all.c | 29 ++++++++++-------------------
>   1 file changed, 10 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

