Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2759A6C6E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 16:42:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823607.1237630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2tbc-0008Ca-Lf; Mon, 21 Oct 2024 14:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823607.1237630; Mon, 21 Oct 2024 14:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2tbc-00087s-Iy; Mon, 21 Oct 2024 14:42:00 +0000
Received: by outflank-mailman (input) for mailman id 823607;
 Mon, 21 Oct 2024 14:41:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=euus=RR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t2tbb-00087k-Fs
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 14:41:59 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f52ea66-8fba-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 16:41:57 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2fb518014b9so38792251fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 07:41:57 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c6b535sm1976858a12.68.2024.10.21.07.41.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 07:41:55 -0700 (PDT)
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
X-Inumbo-ID: 9f52ea66-8fba-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729521716; x=1730126516; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mDqF20tp3+oy1a1lJpVgUW6qTWwEfxQHY1oxgdv7794=;
        b=fVqUMnnWKGvYJLc8AdgCmuz8kE70flowOC1Cq8F6meIfqLqwlu+ejX3eNpkGkUJjqC
         QHkupquPdLno+Sw8eshYZK0vD8MKlWPi2NRGONAi/BEAwLcL02nDT6bXkewIKWPgUddj
         b+5t3JURnb7KoOdtkS8XTTCMZnC66CMiaw8fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729521716; x=1730126516;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDqF20tp3+oy1a1lJpVgUW6qTWwEfxQHY1oxgdv7794=;
        b=gJz45TW5cYphW/YKv72KYigrIvrJGJGXUWlkqNZnqym2cIwsUy2u39/tZXn8i/VbOw
         /mDo6IMezhHxc9u1/jNF7MtRFTTbU2XtK/+a6tBbe9Eeq/H2dcUNC7lm4vEoaZB2gOkf
         m/L1ESvMv5vYSy8586ClelWCtPfpKsJsmCMg8q4JEzNzcXvIAr558E2rOmpxCZ8//IXh
         1FTrOH0dgRm6DHRIelHuqTSWzVIP9F14ckSx+C7Y8ZEr3iUJFV3+IZcOzDmfgB56YCq8
         TtajTPdkdyOcpVsr6hOXO0S1/FBz5tqCMK9wiKzIvG66jq7UNc/nJdsnuiEni37MBGE3
         285w==
X-Gm-Message-State: AOJu0YzK+gpAqUyfRwsiZZJcTKfG/I023rKKXM6WvYZs38uYCUYumbwl
	AWgircj0lj6SIwN4IeTGn2Y/Os9z7uW6XaATvOGx55wQDgEa9bCfsg+m3Rh9mP44X7zoVSZaTJU
	F
X-Google-Smtp-Source: AGHT+IHDr4PmfBehgIc0d9EbWj6rgnqsfYur1t+XMefmUWHdxB9Yf3mRz8mR5h2vslaQLmsi95iNOg==
X-Received: by 2002:a05:651c:b07:b0:2fb:4b1f:973f with SMTP id 38308e7fff4ca-2fb82eb7027mr54475221fa.7.1729521715866;
        Mon, 21 Oct 2024 07:41:55 -0700 (PDT)
Message-ID: <78116f34-2448-4b08-9eb3-50d70a18074e@citrix.com>
Date: Mon, 21 Oct 2024 15:41:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] CI: Add {adl,zen3p}-pvshim-* tests
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
References: <20241021143539.3898995-1-andrew.cooper3@citrix.com>
 <20241021143539.3898995-4-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241021143539.3898995-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/10/2024 3:35 pm, Andrew Cooper wrote:
> GitlabCI has no testing of Xen's PVH entrypoint.  Fix this.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
>
> OSSTest (which is disappearing imminently) found a pvshim bug in the
> hyperlaunch series, and I found a second shortly after while trying to take
> more of the series.
>
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1505518838
> ---
>  automation/gitlab-ci/test.yaml     | 16 ++++++++++++++++
>  automation/scripts/qubes-x86-64.sh | 10 ++++++++--
>  2 files changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index b27c2be17487..e76a37bef32d 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -240,6 +240,14 @@ adl-pci-hvm-x86-64-gcc-debug:
>      - *x86-64-test-needs
>      - alpine-3.18-gcc-debug
>  
> +adl-pvshim-x86-64-gcc-debug:
> +  extends: .adl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh pvshim 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
>  zen3p-smoke-x86-64-gcc-debug:
>    extends: .zen3p-x86-64
>    script:
> @@ -272,6 +280,14 @@ zen3p-pci-hvm-x86-64-gcc-debug:
>      - *x86-64-test-needs
>      - alpine-3.18-gcc-debug
>  
> +zen3p-pvshim-x86-64-gcc-debug:
> +  extends: .zen3p-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh pvshim 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
>  qemu-smoke-dom0-arm64-gcc:
>    extends: .qemu-arm64
>    script:
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 4b6311efffa8..ace494b938d8 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -8,6 +8,7 @@ set -ex
>  #  - dom0pvh-hvm    PVH dom0, HVM domU
>  #  - pci-hvm        PV dom0,  HVM domU + PCI Passthrough
>  #  - pci-pv         PV dom0,  PV domU + PCI Passthrough
> +#  - pvshim         PV dom0,  PVSHIM domU
>  #  - s3             PV dom0,  S3 suspend/resume
>  test_variant=$1
>  
> @@ -20,8 +21,8 @@ domU_vif="'bridge=xenbr0',"
>  domU_extra_cfg=
>  
>  case "${test_variant}" in
> -    ### test: smoke test & smoke test PVH & smoke test HVM
> -    ""|"dom0pvh"|"dom0pvh-hvm")
> +    ### test: smoke test & smoke test PVH & smoke test HVM & smoke test PVSHIM
> +    ""|"dom0pvh"|"dom0pvh-hvm"|"pvshim")
>          passed="ping test passed"
>          domU_check="
>  ifconfig eth0 192.168.0.2
> @@ -44,6 +45,11 @@ echo \"${passed}\"
>  
>          if [ "${test_variant}" = "dom0pvh-hvm" ]; then
>              domU_type="hvm"
> +        elif [ "${test_variant}" = "pvshim" ]; then
> +            domU_type="pv"
> +            domU_extra_cfg='
> +pvshim = 1
> +'
>          fi
>          ;;
>  

Bah - serves me right for some last minute refactoring.  The domain type
should be pvh for pvshim=1 to work.

New pipeline:
https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1505540810

~Andrew

