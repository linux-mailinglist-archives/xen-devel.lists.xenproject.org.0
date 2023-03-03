Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EAA6A9516
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 11:22:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505747.778663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2Y3-0007D5-Nz; Fri, 03 Mar 2023 10:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505747.778663; Fri, 03 Mar 2023 10:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2Y3-0007AZ-LA; Fri, 03 Mar 2023 10:21:59 +0000
Received: by outflank-mailman (input) for mailman id 505747;
 Fri, 03 Mar 2023 10:21:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=adzj=63=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pY2Y2-0007AT-Gd
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 10:21:58 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38eb94c7-b9ad-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 11:21:56 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so936796wmi.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 02:21:55 -0800 (PST)
Received: from [192.168.59.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 v38-20020a05600c4da600b003eb68bb61c8sm1678065wmp.3.2023.03.03.02.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 02:21:54 -0800 (PST)
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
X-Inumbo-ID: 38eb94c7-b9ad-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677838915;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mzlTP7R7zKCP7RJ8UiVzNpPB9G68mLprKPS65LltYYQ=;
        b=ngRXPhil7bj3ycpjZ2nfojxKpA1sozPlWMzoi6tz5m+9ydiiaE9GrSxvNVUUgb22uU
         PSrwz6wkEnyslNL8Bn/sp4HB6BbfQN9DbGBqk4wljP5Y6aN5uuHixDU93FiGsAsKVxoW
         vlaVAltrwSf8bUTl5MbjF01UqOit1HYpD3DiuIAq5nPkcwEZ8eXP4CSk+7s7SycANOCq
         wD8BQ3KrQmP3R7ypZ3j/cr8zCEmC4HeLpWPKL/ftjh4vOMHbIlOhmj7Hm5H4yQDdyBHl
         pOaKVylMGdrEmDIVLvkshVsT0aQVjEmLim6y79vWd+UnSrgf5LZiED14limOAuU/S/q6
         cFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677838915;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzlTP7R7zKCP7RJ8UiVzNpPB9G68mLprKPS65LltYYQ=;
        b=6Bhgqgh5Yp1lPw9/qO2U10j6PDr8fGy53JoTGCFyrTFJCmcfflw/NaN2LHsAFFJBBp
         rbo+usgsteNeBrnoNn3FAd0V3QXZEDGJB3dQFt5wzot1faQIOyIYnvGGbIEjhExRFROl
         1ZZy1psSrLB0HH4E0pxBOKv1hI5WJnxw1YO+te5clxgyi6drXpAuc+CGrl16frupxUBx
         D7iLu9Z5BrFImjF5NpqrNC5MgHu8H5c2zLewACYFPrKsXamo4O6nLgnh81i1VWB6CWBS
         PG/Q30TJTAXMHmp2LkfHU15Z3w9Qm4eedKFQvxpXcbSC7gd7nKXBenMkaQNYseiKl+as
         EStQ==
X-Gm-Message-State: AO0yUKVcKkTmgY7XbZwTxODJR0qtBw9nicNWPkTXFsDUaYd8I60FKiGV
	k7nZJm6H4daaOZh+YXWJ9KA50Q==
X-Google-Smtp-Source: AK7set/y4nBoHbF+MCdO2IUmaX6TdF9cDnDQW+P6n0jDIjBG5I8GF1PCA2fXKcwrdTiiqAq5Gr/d1w==
X-Received: by 2002:a05:600c:548b:b0:3eb:39e7:3607 with SMTP id iv11-20020a05600c548b00b003eb39e73607mr1254174wmb.4.1677838915005;
        Fri, 03 Mar 2023 02:21:55 -0800 (PST)
Message-ID: <0ffef565-0332-43c3-2786-9fb0a8c356bf@linaro.org>
Date: Fri, 3 Mar 2023 11:21:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/6] gitlab-ci.d/crossbuilds: Drop the i386 jobs
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
References: <20230303101452.769367-1-thuth@redhat.com>
 <20230303101452.769367-4-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230303101452.769367-4-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/3/23 11:14, Thomas Huth wrote:
> Hardly anybody still uses 32-bit x86 environments for running QEMU,
> so let's stop wasting our scarce CI minutes with these jobs.
> 
> (There are still the 32-bit MinGW and TCI jobs around for having
> some compile test coverage on 32-bit, and the dockerfile can stay
> in case someone wants to reproduce a flaw locally)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.d/crossbuilds.yml | 20 --------------------
>   1 file changed, 20 deletions(-)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index d3a31a2112..b96439146f 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -43,26 +43,6 @@ cross-arm64-user:
>     variables:
>       IMAGE: debian-arm64-cross
>   
> -cross-i386-system:
> -  extends:
> -    - .cross_system_build_job
> -    - .cross_test_artifacts
> -  needs:
> -    job: i386-fedora-cross-container
> -  variables:
> -    IMAGE: fedora-i386-cross
> -    MAKE_CHECK_ARGS: check-qtest
> -
> -cross-i386-user:
> -  extends:
> -    - .cross_user_build_job
> -    - .cross_test_artifacts
> -  needs:
> -    job: i386-fedora-cross-container
> -  variables:
> -    IMAGE: fedora-i386-cross
> -    MAKE_CHECK_ARGS: check

The cross-i386-user job might require an Ack from Laurent,
so cc'ing him.

