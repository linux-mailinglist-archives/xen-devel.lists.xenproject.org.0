Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE7F7AF48A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 21:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608524.947049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlEAI-0003vD-53; Tue, 26 Sep 2023 19:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608524.947049; Tue, 26 Sep 2023 19:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlEAI-0003sm-1j; Tue, 26 Sep 2023 19:56:14 +0000
Received: by outflank-mailman (input) for mailman id 608524;
 Tue, 26 Sep 2023 19:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d5Ia=FK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qlEAG-0003sg-Uy
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 19:56:12 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be10437a-5ca6-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 21:56:12 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4053c6f1087so88310715e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Sep 2023 12:56:12 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u2-20020a05600c210200b004063d8b43e7sm2163467wml.48.2023.09.26.12.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 12:56:11 -0700 (PDT)
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
X-Inumbo-ID: be10437a-5ca6-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695758171; x=1696362971; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dA2s4CZaZ9THP0vP5ijFooET2LcGlUDtBm1SuCrg4uQ=;
        b=ZEOzSGA/wJLR0dof4xhYhFvYbHbggH0l4MKDikoD92LtInNmi+JUlWCiwkPIJBVj1w
         E76ZFn8/aeR68BqViKH5KUrcNU9VBJs7bLPiba0Z8to6Q47Z2t/jZubiBVaaAwcsRPyl
         whIrG0TNdrYQBvaOYlAVzfwP3XiqQN4u8/GGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695758171; x=1696362971;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dA2s4CZaZ9THP0vP5ijFooET2LcGlUDtBm1SuCrg4uQ=;
        b=SKpOLZ1C/nPCA6wEZ0oYIqkjsYRXDPV7wnKnfjmrR0kelSK8jsFm3zgZlI3lgGfl3A
         V+IVM33H6E4IsOUEP6orAxUA3BrakGksOJjoB7S4uZPHXAxPDD/6isQ82v2HKu6/XiCv
         F4Uo1J66QDljQU9w8Y4tzoCJ05KKK6RwfPCLYKzjMFK41xu+dSSG7qJFlkn6fcH5lMuI
         dWlOxjVwuCpxldqQRJfBavNSjsSCGRLNEvRaHKb8X8R8x1w5i2KjlnHeQGhjQkoI9wSI
         a/YVfr5TzwH7viIuz3eOXAnS49QywJPtRLN7yosSmKsPwLrpnB8VjZ+89oSeVj6+Aenv
         05AQ==
X-Gm-Message-State: AOJu0Yw2tJkZ0qVv6BxEcZTm8j8JKx/sOG0hjiO7hWTn0hKMS1Z7lZFQ
	M71SlRekCLrkQ4oD7dSZBjL9EQ==
X-Google-Smtp-Source: AGHT+IHjN4h+bpRSrXrcqvRCMHK+1TTLx9451giRber/OzXtHpE2e0oKc9piH6itBvbRUsyBd3FKeQ==
X-Received: by 2002:a7b:ce11:0:b0:3fe:1af6:6542 with SMTP id m17-20020a7bce11000000b003fe1af66542mr9533055wmc.33.1695758171362;
        Tue, 26 Sep 2023 12:56:11 -0700 (PDT)
Message-ID: <0eda179a-2f64-39b3-c604-7aaa3b2659be@citrix.com>
Date: Tue, 26 Sep 2023 20:56:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/2] automation: Change build script to use arch
 defconfig
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>
References: <cover.1695754185.git.sanastasio@raptorengineering.com>
 <a949070e4730f55ac214e22a3dea92a5cc6ec7fa.1695754185.git.sanastasio@raptorengineering.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <a949070e4730f55ac214e22a3dea92a5cc6ec7fa.1695754185.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/09/2023 7:54 pm, Shawn Anastasio wrote:
> diff --git a/automation/scripts/build b/automation/scripts/build
> index b4edcf010e..19dd9e8270 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -22,7 +22,12 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
>      # RANDCONFIG implies HYPERVISOR_ONLY
>      HYPERVISOR_ONLY="y"
>  else
> -    echo "CONFIG_DEBUG=${debug}" > xen/.config
> +    # Start off with arch's defconfig
> +    make -C xen defconfig
> +
> +    # Drop existing CONFIG_DEBUG and replace with value of ${debug}
> +    sed -i 's/^CONFIG_DEBUG=[yn]//g' xen/.config
> +    echo "CONFIG_DEBUG=${debug}" >> xen/.config

Kconfig is latest-takes precedence, which is why we always append for
this and the other related options.  There's no need for sed to drop the
old value.

~Andrew

