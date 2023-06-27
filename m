Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB48D73FC21
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 14:43:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556153.868439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE82O-0006Xl-QV; Tue, 27 Jun 2023 12:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556153.868439; Tue, 27 Jun 2023 12:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE82O-0006VQ-Nv; Tue, 27 Jun 2023 12:43:16 +0000
Received: by outflank-mailman (input) for mailman id 556153;
 Tue, 27 Jun 2023 12:43:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9jY1=CP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qE82M-0006VK-Mu
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 12:43:14 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d88e55d-14e8-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 14:43:12 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-991c786369cso268351066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 05:43:12 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.199.204])
 by smtp.gmail.com with ESMTPSA id
 kg1-20020a17090776e100b0098e2eaec395sm3430672ejc.130.2023.06.27.05.43.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 05:43:11 -0700 (PDT)
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
X-Inumbo-ID: 2d88e55d-14e8-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687869792; x=1690461792;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oiGMShFqsK5vy0r+ZoVprgd+7ONOa51b6TZq+l7w8nA=;
        b=N9jYqZxdR661UImV0f2eqz9etcpnHRQWFJOWqbKzx+pPrr0rGpTyRrmz5XuUcm1Jel
         baeVg/QwQJBCIEde+fmbP7LG4Izl1AuD0EKT+rEyp5sfJSH192El68xs7rbT6+K4WH9y
         IfQhrB0iGU5wf9XPYsYmDFUbqjvN0yAjtDAbR5RKLJJX7UPC2owKWr4ScVk8mulj3v1M
         rUlnRkKpW+k6Vp3tBKcP/u8zcAy+nchDJTbp1UFf/jwRX/gpGEnEqqlo9lImfk5IYIgt
         /E/zRUzGds4zgAE/1m6/1FiPOwoCYKzmruujyCiOPEFDktm5hG65u6lqnFuN24x3EXwg
         3F0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687869792; x=1690461792;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oiGMShFqsK5vy0r+ZoVprgd+7ONOa51b6TZq+l7w8nA=;
        b=jTQP+gMPS9tsgcb8P+2xkWlByONWSBfdKshRB3aG5HhWGr5a1Q4hdovXbbiKnI5mtw
         NzLMX57h9+6JjVgBt+r2Q8QYo8WmU5KWNC/frnTpmRw9hpqzEoZB9pmZpM4eGPb89TD6
         5hZGfwwNAjay8cNkMW0A3pcVgka8uAdPWpgWJnuMwOTPiPDDsWW9ea8uk3d5Y3FvDaWY
         46WjNd3Iwi/jWSLefyfKlf5dgMWaF929t5C0QSfe9oKxozLjn3P2dtSUGk3faGTTSS9w
         gk2RdGJWkH6F6dzx1vlfO86EUlOyEC26g5gLKpXr8rNR7sUWCmGTS7Po1hDHEnompSHk
         xEDA==
X-Gm-Message-State: AC+VfDwlUkkavl0W5KzkBdQAlu/0umcg30YY2vrNY3mBiVQoTMkSlapq
	/hLqYImsoOVdyrv7XelXPOPF4g==
X-Google-Smtp-Source: ACHHUZ6zoAvKTmIUPl7vS48VUGVb/8NUBU9FbZNA+3XvIM6YbbuEMppTKmcZbeQKq+uiXwT/1/ecVw==
X-Received: by 2002:a17:907:c0a:b0:96f:d345:d0f7 with SMTP id ga10-20020a1709070c0a00b0096fd345d0f7mr28092609ejc.62.1687869792013;
        Tue, 27 Jun 2023 05:43:12 -0700 (PDT)
Message-ID: <9d54d187-dd61-9d48-01bc-d0d6a44d119e@linaro.org>
Date: Tue, 27 Jun 2023 14:43:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 15/16] accel: Rename 'cpu_state' -> 'cs'
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, xen-devel@lists.xenproject.org,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paul Durrant <paul@xen.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Eduardo Habkost <eduardo@habkost.net>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230624174121.11508-1-philmd@linaro.org>
 <20230624174121.11508-16-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230624174121.11508-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/6/23 19:41, Philippe Mathieu-Daudé wrote:
> Most of the codebase uses 'CPUState *cpu' or 'CPUState *cs'.
> While 'cpu_state' is kind of explicit, it makes the code
> harder to review. Simply rename as 'cs'.
> 
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/i386/hvf/x86hvf.h |  18 +-
>   target/i386/hvf/x86hvf.c | 372 +++++++++++++++++++--------------------
>   2 files changed, 195 insertions(+), 195 deletions(-)

Per IRC chat:
Tested-by: Peter Maydell <peter.maydell@linaro.org>


