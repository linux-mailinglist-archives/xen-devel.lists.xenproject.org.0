Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 035616DB6D7
	for <lists+xen-devel@lfdr.de>; Sat,  8 Apr 2023 01:07:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519134.806364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkvBM-0001mq-88; Fri, 07 Apr 2023 23:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519134.806364; Fri, 07 Apr 2023 23:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkvBM-0001kU-4i; Fri, 07 Apr 2023 23:07:48 +0000
Received: by outflank-mailman (input) for mailman id 519134;
 Fri, 07 Apr 2023 23:07:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dUW=76=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1pkvBK-0001kC-Fz
 for xen-devel@lists.xenproject.org; Fri, 07 Apr 2023 23:07:46 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01520507-d599-11ed-85db-49a42c6b2330;
 Sat, 08 Apr 2023 01:07:45 +0200 (CEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso8842973pjc.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Apr 2023 16:07:45 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a17090adf8200b002465e66256asm1238484pjv.11.2023.04.07.16.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:07:43 -0700 (PDT)
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
X-Inumbo-ID: 01520507-d599-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680908864;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wgiL/ifYNfwo++KDFPg/Dio8zORaAFAk5bB5YtGhmQk=;
        b=MEGGWwlxDpwujW+GajFwMICW/+ZkQuiv23sCYl3JUT/QGW1SCye8aT/VwuveZyUz00
         danOwxCDQO8rPdclT/eLT0VCKJMmNVgE8cYX5i7MRWsQ4coyPuqnScvQZwZTRvGxdYvC
         FhJkRJCGIWp5W6kFxgNUJaKiGOLx9njvZfXCvRgcLvuhm7FACslFqNbhm4hJWCgiDvo2
         7hWTApcGKjnMgABAvptKlm34znz02qQ8vUOi0oekStr3YQbTAa5sGe+i21fWdcw/Aq1j
         c4DzqVmZej5HD6YvnXJJwa+uihhiloPCbj7INDw5KTL3mAU/KBhEKOkI7ZdD4FMRBbcu
         Juyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680908864;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wgiL/ifYNfwo++KDFPg/Dio8zORaAFAk5bB5YtGhmQk=;
        b=iCinFRRNOkTvhEtv3cPKeJoygZJfq96etAATtQ04vE2gCNSfNwJ6Plnk659phgaIpy
         AdRLe12sT2uGVXlzMMXlOBgr/bO0cgQ9nTRpFs5KH4YV9F8SZpUDW2VVLrjmCDdviBoi
         7hE3T8YI5AHBXAa9DNhhnm2NGDn2mLuShFo0VL0XYhsSZiuv+D93eE//JX+gG/HHN/hA
         qz1+e+20TLDr3KPhXPT/8DSVCOo6A7kf2uMrNjtxkQpIcHckKeWaefvkFigHMkN+gX9o
         Qj5YFp21uDwFNxSXY8rdCHY358mVjoXQATWhuusoC+QB2AeqC3ZM/Iy+I6i4XOF3rC7b
         OKvg==
X-Gm-Message-State: AAQBX9fWhbQkMX6X2+R29jLA+9WDD7wPGNWN/RGWKWgwVwUehUHD/DhK
	TeaxGvaUBc6WIk40w5nyXg1tcg==
X-Google-Smtp-Source: AKy350bXcZjgyQUuRpp6nyP3eJ+x1rlN/eQIhLU/UutS8vew5xsari6fdOQWku6HCBWiasGwTXkzQw==
X-Received: by 2002:a17:902:e5cb:b0:1a1:e112:461c with SMTP id u11-20020a170902e5cb00b001a1e112461cmr12302648plf.30.1680908864146;
        Fri, 07 Apr 2023 16:07:44 -0700 (PDT)
Message-ID: <a3c36603-6fd0-b093-0e8f-97e15b8e6bc9@linaro.org>
Date: Fri, 7 Apr 2023 16:07:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 08/14] accel: Move HAX hThread to accelerator context
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-9-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/5/23 03:18, Philippe Mathieu-Daudé wrote:
> hThread variable is only used by the HAX accelerator,
> so move it to the accelerator specific context.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/core/cpu.h           | 1 -
>   target/i386/hax/hax-i386.h      | 3 +++
>   target/i386/hax/hax-accel-ops.c | 2 +-
>   target/i386/hax/hax-all.c       | 2 +-
>   target/i386/hax/hax-windows.c   | 2 +-
>   5 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

