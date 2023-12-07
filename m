Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE337809226
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 21:18:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650170.1015415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBKot-0004Zu-0A; Thu, 07 Dec 2023 20:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650170.1015415; Thu, 07 Dec 2023 20:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBKos-0004XM-Tl; Thu, 07 Dec 2023 20:18:02 +0000
Received: by outflank-mailman (input) for mailman id 650170;
 Thu, 07 Dec 2023 20:18:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fdCZ=HS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rBKos-0004XG-25
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 20:18:02 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8119d7d-953d-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 21:18:01 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c2c5a8150so8372495e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 12:18:01 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c3b9500b0040b2a52ecaasm2921770wms.2.2023.12.07.12.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 12:18:00 -0800 (PST)
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
X-Inumbo-ID: b8119d7d-953d-11ee-98e7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701980280; x=1702585080; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ysd62m2tBouM6AjR2z4aUe4Aev1c+bGhzdO9PHyaMyg=;
        b=F/ogYHBDyN77aYZMcjnCtAtgJhrW01hFu/Qe/KL/kOeDpHgn4w8zUhn0KkRrqWaqkq
         yYQ/lcSjr0WzdtXm6M6F1nd+bGdmqJQgf2+jS221oSAMrevB4r6n2WD93Y1WAwqUTWaJ
         OUpboYQ9h2xBz0+H1u8VoodHzfWkxX/6zTl/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701980280; x=1702585080;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ysd62m2tBouM6AjR2z4aUe4Aev1c+bGhzdO9PHyaMyg=;
        b=vAZ0q9PELW1BFRucIC+hATMkvRxDAKgmXUOS/8LL6c24s2qD8CNop1QCQs8fQHOEmN
         Y+IRXQe0a6WQnpd9vUXjDjnsRaFWcc8Oo6fo4Y0MoMKHUHGR0HmpR7KzeAIdM2HcqRku
         AvnwjR8Uz5rvV3NcV747YOi+qqJB4IoTNco7f4speUPznC/mAlTpjws+UXjYSh3Z78q3
         Nc1VPHk5O9upJ2dsjFuSmUZbTbyk3aJ1viLl3UKc10Q3lj2Kk2pVup+YuKBdyW+otZT/
         MNogzCvGM6QV/K2L8I5/aGhwuJV1zmEZlYdsUWDygwtF9BIkZE2zXbgfymxKGEQBv4Eq
         IN0A==
X-Gm-Message-State: AOJu0YweE2tGP8pxBPwrbkfr0sVc6d7Gb8R1CAg+sPXJRVym90OlGbHp
	KqngUIP72fyeXU8HdDegaSX6WQ==
X-Google-Smtp-Source: AGHT+IFWj+FJiFxCQou9mgyjOJOCfNiwm4fshEUi2Lsu8bKvUAMO3qfLjTPC/JpKvjZHiSr7RGDEGg==
X-Received: by 2002:a7b:cd10:0:b0:40c:1ebd:11c4 with SMTP id f16-20020a7bcd10000000b0040c1ebd11c4mr1673494wmj.15.1701980280355;
        Thu, 07 Dec 2023 12:18:00 -0800 (PST)
Message-ID: <f9ceb8f7-a664-452b-8b38-f74b36386e33@citrix.com>
Date: Thu, 7 Dec 2023 20:17:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/1] xen/Makefile: introduce ARCH_FIXED_CONFIG for
 randconfig
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <cover.1701966261.git.oleksii.kurochko@gmail.com>
 <c95959adca794a90465abd10f579dc9159a7697f.1701966261.git.oleksii.kurochko@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c95959adca794a90465abd10f579dc9159a7697f.1701966261.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/12/2023 5:03 pm, Oleksii Kurochko wrote:
> ARCH_FIXED_CONFIG is required in the case of randconfig
> and CI for configs that aren't ready or are not
> supposed to be implemented for specific architecture.
> These configs should always be disabled to prevent randconfig
> related tests from failing.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/Makefile | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/xen/Makefile b/xen/Makefile
> index ca571103c8..8ae8fe1480 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -336,11 +336,14 @@ ifeq ($(config-build),y)
>  # *config targets only - make sure prerequisites are updated, and descend
>  # in tools/kconfig to make the *config target
>  
> +ARCH_FORCED_CONFIG := $(srctree)/arch/$(SRCARCH)/configs/randomforced.config
> +
>  # Create a file for KCONFIG_ALLCONFIG which depends on the environment.
>  # This will be use by kconfig targets allyesconfig/allmodconfig/allnoconfig/randconfig
>  filechk_kconfig_allconfig = \
>      $(if $(findstring n,$(XEN_HAS_CHECKPOLICY)), echo 'CONFIG_XSM_FLASK_POLICY=n';) \
> -    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG);) \
> +    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG); \
> +    $(if $(wildcard $(ARCH_FORCED_CONFIG)), cat $(ARCH_FORCED_CONFIG);) ) \
>      :
>  
>  .allconfig.tmp: FORCE

We already have infrastructure for this.  What's wrong with
EXTRA_FIXED_RANDCONFIG?

---8<---

CI: Revert "automation: Drop ppc64le-*randconfig jobs", fix Randconfig
with existing infrastructure
    
This reverts commit cbb71b95dd708b1e26899bbe1e7bf9a85081fd60.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

diff --git a/automation/gitlab-ci/build.yaml
b/automation/gitlab-ci/build.yaml
index 32af30ccedc9..346d0400ed09 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -538,6 +538,7 @@ archlinux-current-gcc-riscv64-randconfig:
     RANDCONFIG: y
     EXTRA_FIXED_RANDCONFIG:
       CONFIG_COVERAGE=n
+      CONFIG_GRANT_TABLE=n
 
 archlinux-current-gcc-riscv64-debug-randconfig:
   extends: .gcc-riscv64-cross-build-debug
@@ -547,6 +548,7 @@ archlinux-current-gcc-riscv64-debug-randconfig:
     RANDCONFIG: y
     EXTRA_FIXED_RANDCONFIG:
       CONFIG_COVERAGE=n
+      CONFIG_GRANT_TABLE=n
 
 # Power cross-build
 debian-bullseye-gcc-ppc64le:
@@ -563,6 +565,26 @@ debian-bullseye-gcc-ppc64le-debug:
     KBUILD_DEFCONFIG: ppc64_defconfig
     HYPERVISOR_ONLY: y
 
+debian-bullseye-gcc-ppc64le-randconfig:
+  extends: .gcc-ppc64le-cross-build
+  variables:
+    CONTAINER: debian:bullseye-ppc64le
+    KBUILD_DEFCONFIG: ppc64_defconfig
+    RANDCONFIG: y
+    EXTRA_FIXED_RANDCONFIG:
+      CONFIG_COVERAGE=n
+      CONFIG_GRANT_TABLE=n
+
+debian-bullseye-gcc-ppc64le-debug-randconfig:
+  extends: .gcc-ppc64le-cross-build-debug
+  variables:
+    CONTAINER: debian:bullseye-ppc64le
+    KBUILD_DEFCONFIG: ppc64_defconfig
+    RANDCONFIG: y
+    EXTRA_FIXED_RANDCONFIG:
+      CONFIG_COVERAGE=n
+      CONFIG_GRANT_TABLE=n
+
 # Yocto test jobs
 yocto-qemuarm64:
   extends: .yocto-test-arm64


