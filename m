Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 496677AF46A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 21:49:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608521.947039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlE3U-0001q8-FK; Tue, 26 Sep 2023 19:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608521.947039; Tue, 26 Sep 2023 19:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlE3U-0001nQ-Bq; Tue, 26 Sep 2023 19:49:12 +0000
Received: by outflank-mailman (input) for mailman id 608521;
 Tue, 26 Sep 2023 19:49:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d5Ia=FK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qlE3T-0001nK-Dz
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 19:49:11 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1f9a066-5ca5-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 21:49:09 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4053c6f0d55so96162795e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Sep 2023 12:49:09 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k10-20020adfd22a000000b0032320a9b010sm7637032wrh.28.2023.09.26.12.49.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 12:49:08 -0700 (PDT)
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
X-Inumbo-ID: c1f9a066-5ca5-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695757748; x=1696362548; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0C4Ca2jCC7lXg3RovRvqqjoiMqNBb0XFt0Nq10n5wk4=;
        b=ivb9GAzlFjPpaQRsX9EWKdRqNmOIohhtckXUECH3a+BH95HLKQQ1xRx2lMUncsCodh
         L2g0lpV5Hwf7CdN9w7KuJY16hI3NlsAhorMmb8zJVFlXvEOVwKWc0xDFPcocdwHu/nqI
         jxSEr2TBQxqVQakuWv+XGm25tv5EzWliXTVCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695757748; x=1696362548;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0C4Ca2jCC7lXg3RovRvqqjoiMqNBb0XFt0Nq10n5wk4=;
        b=HKrfRy8ihq7bUflKAOXNb5MYjTfsJFeS7dp3slwsuWWyq238qc6vLne8IAhyfpkYKb
         NIzPM6EJMaK0Ts9+nBoI2v94BJHkn/mf/ygIZrMyAAzZSI+3KEI6xIq8L9dGhbBZY8qu
         hmy+T21g36X0hDAWOzCfzv7Wu58O7ZPWYM2sSo5q5K0UVU6EpmBo5uOaFOn3WLqL1Ifh
         5F7PsKKax6j4RO8ndvF+vm/b5F2z74QJEGzw4/cTIEFPuwb+ZWh79QR8DICrWPsAAVoJ
         NPnE8hPsm+6toDWGQYmHSWtMiSNjX0iG+vSEwHgqItyt0qkG9+wLg3mNV0GycO6o0HZj
         Z5Lg==
X-Gm-Message-State: AOJu0YzGOPo86gy1zlXU/MHH978Y7jI6E6YOk8lZkbCxu9TZrbpSAeWU
	frqf1wf4cGGLQfm1l3isXV0nCw==
X-Google-Smtp-Source: AGHT+IFg5JEaK3DKnDo0Po+XlxymZeGE4vAuPoS6f4RM0NSEn6K5mVvjgJBjPAlmp9asUUZpbGDA2Q==
X-Received: by 2002:a05:600c:2056:b0:403:cab3:b763 with SMTP id p22-20020a05600c205600b00403cab3b763mr9617828wmg.33.1695757748513;
        Tue, 26 Sep 2023 12:49:08 -0700 (PDT)
Message-ID: <6856be3e-1f06-6c5a-5d0b-7ca72200d456@citrix.com>
Date: Tue, 26 Sep 2023 20:49:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/3] automation: Drop ppc64le-*randconfig jobs
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
References: <cover.1695681330.git.sanastasio@raptorengineering.com>
 <76d21ac8a0de7d5ebac8b39a8d552b931a6302a3.1695681330.git.sanastasio@raptorengineering.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <76d21ac8a0de7d5ebac8b39a8d552b931a6302a3.1695681330.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/09/2023 11:42 pm, Shawn Anastasio wrote:
> Since ppc64le is still undergoing early bringup, disable the randconfig
> CI build which was causing spurious CI failures.
>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Reported-by: Jan Beulich <jbeulich@suse.com>
> ---
>  automation/gitlab-ci/build.yaml | 18 ------------------
>  1 file changed, 18 deletions(-)
>
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 1619e9a558..32af30cced 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -563,24 +563,6 @@ debian-bullseye-gcc-ppc64le-debug:
>      KBUILD_DEFCONFIG: ppc64_defconfig
>      HYPERVISOR_ONLY: y
>  
> -debian-bullseye-gcc-ppc64le-randconfig:
> -  extends: .gcc-ppc64le-cross-build
> -  variables:
> -    CONTAINER: debian:bullseye-ppc64le
> -    KBUILD_DEFCONFIG: ppc64_defconfig
> -    RANDCONFIG: y
> -    EXTRA_FIXED_RANDCONFIG:
> -      CONFIG_COVERAGE=n
> -
> -debian-bullseye-gcc-ppc64le-debug-randconfig:
> -  extends: .gcc-ppc64le-cross-build-debug
> -  variables:
> -    CONTAINER: debian:bullseye-ppc64le
> -    KBUILD_DEFCONFIG: ppc64_defconfig
> -    RANDCONFIG: y
> -    EXTRA_FIXED_RANDCONFIG:
> -      CONFIG_COVERAGE=n

I know this has been committed, but it shouldn't have been.  Randconfig
is important to have even at this point in the bringup.

For options which are known-incompatible, append them to
EXTRA_FIXED_RANDCONFIG, just like COVERAGE already is.

However, it was only grant tables which showed up as broken, and ought
to be easy to address.

~Andrew

