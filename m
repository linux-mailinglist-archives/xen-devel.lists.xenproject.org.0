Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FCA5BBAB8
	for <lists+xen-devel@lfdr.de>; Sat, 17 Sep 2022 23:41:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408359.651134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZfXU-0001js-Aa; Sat, 17 Sep 2022 21:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408359.651134; Sat, 17 Sep 2022 21:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZfXU-0001hi-6W; Sat, 17 Sep 2022 21:39:52 +0000
Received: by outflank-mailman (input) for mailman id 408359;
 Sat, 17 Sep 2022 21:39:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r4e4=ZU=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1oZfXS-0001hc-9p
 for xen-devel@lists.xenproject.org; Sat, 17 Sep 2022 21:39:50 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 402e9231-36d1-11ed-a31c-8f8a9ae3403f;
 Sat, 17 Sep 2022 23:39:49 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id l8so12847213wmi.2
 for <xen-devel@lists.xenproject.org>; Sat, 17 Sep 2022 14:39:47 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 185-20020a1c02c2000000b003b482fbd93bsm7096378wmc.24.2022.09.17.14.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 14:39:46 -0700 (PDT)
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
X-Inumbo-ID: 402e9231-36d1-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=UuxlmufKDaO+uVhqh434cR8OZGtikvtxCDQMwyzPUDg=;
        b=VNJkQefiZ8CtsVmyF/p0QFLF9afGazBT24Og6lL6U+0jm/ABVUFt2C9T7VeQcOTH1y
         bCAxUfca3sJdfduGFWYtQE07kDzw8UdREKg4SzRiWX/3edcUWApA3lRpsfbsrt5n9a+C
         DWiYNSuywVbl+AOWYctjMBB46x6KKWXMX8wBeO8yv5T6kGeUZ0g6Wv9zsRF+L3yIf8Uh
         Zave+cjPU2gUI6NCyDKt5KAS9IEVEKFsFyFAmZEiqFdweiJ6GldwxCq8MMXVzRdDo4iC
         jLUwOYU/P1RA/fRTnZuL86YRQ/WgKIre9EKcs5N+iT9Rd53pYQ3Vzb27ag2kaf8DZQ//
         2J9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=UuxlmufKDaO+uVhqh434cR8OZGtikvtxCDQMwyzPUDg=;
        b=d5zzVeJhhyxiozqN0ZxdH0jE8cnQs+KsuUo8rTUpHiB7LKEWM8L95E96HN87llvl6/
         mX6PP//L+DydJoONUqzJUpIOPJZUSjtwm0GUse/gS84+uzJ77kC61BBMeutNevwG8+TL
         MM7JQN1icgjAXg8MlWpxQezy2Sk+RzRzNkpnQ8vOA4M6FNbYcCKG673UW3seKuUFnTzw
         Qg4/Z+8TdgRwr3m2NRa1AQeIIl2iHs1di6FQeMOCZriPn18m58UT+k0Olvnc/zbUFc7j
         GeLpPeTU7j3rGwFilCip3mjuMIe72FCPSnok1NEeuZPW8XkwRyo2DBpEuvCrUbeXJQJe
         18lg==
X-Gm-Message-State: ACrzQf0zuQR+p0sVApMPGn4/toUL8Ismg/kUL3hjSdDwO8acZpEYnLX2
	siC2AbyBNcMVN9u8bPqYR9A=
X-Google-Smtp-Source: AMsMyM4VEzNjWX+DIvRxsRDeKWviiS3epJjRpOEM+YnLjCI5zY7u4P4YPCVZcwzu2u1ARLSCnLzOvg==
X-Received: by 2002:a05:600c:33a8:b0:3b4:874c:f48f with SMTP id o40-20020a05600c33a800b003b4874cf48fmr7392003wmp.131.1663450786853;
        Sat, 17 Sep 2022 14:39:46 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <9af8b91d-92d4-7e6e-2c8c-34bc29859d46@amsat.org>
Date: Sat, 17 Sep 2022 23:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/4] scripts/ci/setup: Fix libxen requirements
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20220914124153.61017-1-lucas.araujo@eldorado.org.br>
 <20220914124153.61017-3-lucas.araujo@eldorado.org.br>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220914124153.61017-3-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/9/22 14:41, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
> 
> XEN hypervisor is only available in ARM and x86, but the yaml only
> checked if the architecture is different from s390x, changed it to
> a more accurate test.
> Tested this change on a Ubuntu 20.04 ppc64le.
> 
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   scripts/ci/setup/build-environment.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
> index 6df3e61d94..7535228685 100644
> --- a/scripts/ci/setup/build-environment.yml
> +++ b/scripts/ci/setup/build-environment.yml
> @@ -97,7 +97,7 @@
>           state: present
>         when:
>           - ansible_facts['distribution'] == 'Ubuntu'
> -        - ansible_facts['architecture'] != 's390x'
> +        - ansible_facts['architecture'] == 'aarch64' or ansible_facts['architecture'] == 'x86_64'
>   
>       - name: Install basic packages to build QEMU on Ubuntu 20.04
>         package:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

