Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E49B2021C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 10:44:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077097.1438188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulO7r-0005lC-AU; Mon, 11 Aug 2025 08:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077097.1438188; Mon, 11 Aug 2025 08:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulO7r-0005iK-7p; Mon, 11 Aug 2025 08:43:27 +0000
Received: by outflank-mailman (input) for mailman id 1077097;
 Mon, 11 Aug 2025 08:43:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOyo=2X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ulO7p-0005iE-Bb
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 08:43:25 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37d0324d-768f-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 10:43:13 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6154655c8aeso5758420a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 01:43:13 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8ffbde5sm17944208a12.54.2025.08.11.01.43.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 01:43:12 -0700 (PDT)
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
X-Inumbo-ID: 37d0324d-768f-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754901793; x=1755506593; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWCgUz6GVKLbEbvxJqlmU/6PlX5HX7aQWbOcWcqHhwE=;
        b=kd0lZ/UipTjMexU+XMp9I3FZ1FPsVZ6wa/M4JgoiEko6XQ6KAGC5Sk8VLqOr+laLk3
         IBxo2q+voAabezcSt1dMkkm+apxT7CGpzolEMvhaci4Dfiiu6X3BZYUNwnYAKc1VmlwB
         bHzfm8/swp4R+P5Ymb3CEnwMNcQcloUgXP2Y/eGhtas5ssZt2btHXMExKS3rJ6CH2EA4
         hXgXdqw5jKMhmvY659tV5Xs5umwYZl1Q2XC0s6DSxhGE4+gMM5gURZruY6jkiyIkyZzu
         G3KU7EsygVv1dkA3Rj3TG/WtKNNrqC41yStywplJbsW/bRhuHF/vjGWy+WKBpRiloGeS
         l8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754901793; x=1755506593;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KWCgUz6GVKLbEbvxJqlmU/6PlX5HX7aQWbOcWcqHhwE=;
        b=b/c68G05xXMxwBCAAK7MF+/+cKQMvAIHpOV1oeoVEGJTDLOXMgj4UI0FmoT0V5wI8k
         8TPy1hy1SMf1yVFy74ek7QUXa1TXzbVcfUb5C0tJxHjsjJOjlN0KiUTroax71fSIT1/B
         iOBSGo8zyGQyLWTQT0jFeo+s+6qK/ngF8grfxy/yJrkvl53H6AjOFiIKw1UX1yWGNyXZ
         TyEE+8mLMs0bqEsxwAPCb2AA3JiVaQ7/LVXG7/Y9vZGS1ApLkSHtnZ/JDzWfay27i8BT
         qkSI9Bu86DVxxS6ax9NE2mxLtL+45DqP8ZqCvPATbkQHevCFz5v3D7XpSzLasPgUqemJ
         AJMg==
X-Forwarded-Encrypted: i=1; AJvYcCWsQ0JcgOWJIm1sMXaLSaE0Y6ivNEmKr/5d13v23/lGtppVOX8HgCN1T66crnjVbjzqAs+fPplK+Uo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywulv2Jaoo9GO0GbnlpX1GwCKI2BzUS8gp2cluISky0rp8KWie9
	Ib85EAa/1JFxAZRNpwRE+qJoX0jFYYe1n6Z+DKt3UT8EzoC6lXNvOzmu
X-Gm-Gg: ASbGnct8nUiMdYqp29n7Ku89T315KOR35Qeg//1mzKfciPObNH7EzZ75PYlZW5YDAo+
	JbnchJmM2+x6DMyKbLuflBNz6CH6JypRnMp8s+Vjw6TpWmy3zThGTUYBRKFJJi4nBpTyCy2p/mu
	LbvK44e2MJ9mN7i0UdlX5IwLY+GYUdaukJUsBv4ABRDjPkQdgJSQ1oZ0uBTGllCrrsS3awmCQZv
	3FcaXVYv5IdgH6ww3VjUH9LwXCkbCx3AS+XrMis39AMmLvAVaA8g10NAW5B0QIMszkGL4rwX+4f
	9452hHqEV9xTd3biLMVhuuQSUJ7LyksXE+d6PZKYRzh+wfvcoEZFLESdN0whBiJCg4JS15tlaxP
	3g+aLxn7WjVuR9nWLF28xZYo1/CFQeHgispmOj2/BhrP4FYJbVlAvxtQL3B4f2GEK+D4CdAI=
X-Google-Smtp-Source: AGHT+IE8ov+ppGayhzOqdELEGfgDTzgS2m/jQdZ5RGMlI6MSf+mKq58nwED8TZmFOjY7Gpi3cgMG2Q==
X-Received: by 2002:a05:6402:5216:b0:612:a86b:ac79 with SMTP id 4fb4d7f45d1cf-617e2b77876mr10829070a12.2.1754901792998;
        Mon, 11 Aug 2025 01:43:12 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------jBo8MouCJ84UWa0950Sndq1f"
Message-ID: <2919f22b-0b0c-488e-b0c6-96b9538e63d9@gmail.com>
Date: Mon, 11 Aug 2025 10:43:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] CI: Update riscv64 to use Debian Trixie
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Victor Lira <victorm.lira@amd.com>
References: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
 <20250809221206.1260861-4-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250809221206.1260861-4-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------jBo8MouCJ84UWa0950Sndq1f
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/10/25 12:12 AM, Andrew Cooper wrote:
> Everything works fine with Debian 13.  Provide two new build jobs, and update
> both the randconfig the test jobs.
>
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD<anthony.perard@vates.tech>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Jan Beulich<jbeulich@suse.com>
> CC: Julien Grall<julien@xen.org>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Stefano Stabellini<sstabellini@kernel.org>
> CC: Shawn Anastasio<sanastasio@raptorengineering.com>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> CC: Doug Goldstein<cardoe@cardoe.com>
> CC: Marek Marczykowski-Górecki<marmarek@invisiblethingslab.com>
> CC: Victor Lira<victorm.lira@amd.com>
>
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1975929387
> ---
>   automation/gitlab-ci/build.yaml | 22 ++++++++++++++++++----
>   automation/gitlab-ci/test.yaml  |  2 +-
>   2 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 3fe539dc5683..f8e45f3467c8 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -329,10 +329,10 @@ debian-13-ppc64le-gcc-debug:
>         CONFIG_UBSAN=y
>         CONFIG_UBSAN_FATAL=y
>   
> -debian-12-riscv64-gcc-debug:
> +debian-13-riscv64-gcc-debug:
>     extends: .gcc-riscv64-cross-build-debug
>     variables:
> -    CONTAINER: debian:12-riscv64
> +    CONTAINER: debian:13-riscv64
>       KBUILD_DEFCONFIG: tiny64_defconfig
>       HYPERVISOR_ONLY: y
>       EXTRA_XEN_CONFIG: |
> @@ -727,6 +727,20 @@ debian-12-riscv64-gcc:
>       KBUILD_DEFCONFIG: tiny64_defconfig
>       HYPERVISOR_ONLY: y
>   
> +debian-12-riscv64-gcc-debug:
> +  extends: .gcc-riscv64-cross-build-debug
> +  variables:
> +    CONTAINER: debian:12-riscv64
> +    KBUILD_DEFCONFIG: tiny64_defconfig
> +    HYPERVISOR_ONLY: y

Don't you mind to keep an order? So:
   debian-12-riscv64-gcc-debug:
   ...
   debian-13-riscv64-gcc-debug:
   ...

Also, it will make a diff a little bit better.

> +
> +debian-13-riscv64-gcc:
> +  extends: .gcc-riscv64-cross-build
> +  variables:
> +    CONTAINER: debian:13-riscv64
> +    KBUILD_DEFCONFIG: tiny64_defconfig
> +    HYPERVISOR_ONLY: y
> +
>   .riscv-fixed-randconfig:
>     variables: &riscv-fixed-randconfig
>       EXTRA_FIXED_RANDCONFIG: |
> @@ -739,10 +753,10 @@ debian-12-riscv64-gcc:
>         CONFIG_VM_EVENT=n
>         CONFIG_XSM=n
>   
> -debian-12-riscv64-gcc-randconfig:
> +debian-13-riscv64-gcc-randconfig:

Are we going to have randconfig build test only for Debian-13?

>     extends: .gcc-riscv64-cross-build
>     variables:
> -    CONTAINER: debian:12-riscv64
> +    CONTAINER: debian:13-riscv64
>       KBUILD_DEFCONFIG: tiny64_defconfig
>       RANDCONFIG: y
>       <<: *riscv-fixed-randconfig
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 2f6f3affa637..9acd984d294c 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -705,7 +705,7 @@ qemu-smoke-riscv64-gcc:
>     script:
>       - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 | tee ${LOGFILE}
>     needs:
> -    - debian-12-riscv64-gcc-debug
> +    - debian-13-riscv64-gcc-debug

The same as above, are we going to run smoke tests only for Debian-13?

If the answer to this and the question above is “yes,” then (probably
keeping the order — first debian-12, then debian-13 — for the jobs):
  Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>   
>   qemu-smoke-ppc64le-powernv9-gcc:
>     extends: .qemu-ppc64le
--------------jBo8MouCJ84UWa0950Sndq1f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/10/25 12:12 AM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250809221206.1260861-4-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">Everything works fine with Debian 13.  Provide two new build jobs, and update
both the randconfig the test jobs.

Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Shawn Anastasio <a class="moz-txt-link-rfc2396E" href="mailto:sanastasio@raptorengineering.com">&lt;sanastasio@raptorengineering.com&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
CC: Doug Goldstein <a class="moz-txt-link-rfc2396E" href="mailto:cardoe@cardoe.com">&lt;cardoe@cardoe.com&gt;</a>
CC: Marek Marczykowski-Górecki <a class="moz-txt-link-rfc2396E" href="mailto:marmarek@invisiblethingslab.com">&lt;marmarek@invisiblethingslab.com&gt;</a>
CC: Victor Lira <a class="moz-txt-link-rfc2396E" href="mailto:victorm.lira@amd.com">&lt;victorm.lira@amd.com&gt;</a>

<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1975929387">https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1975929387</a>
---
 automation/gitlab-ci/build.yaml | 22 ++++++++++++++++++----
 automation/gitlab-ci/test.yaml  |  2 +-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 3fe539dc5683..f8e45f3467c8 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -329,10 +329,10 @@ debian-13-ppc64le-gcc-debug:
       CONFIG_UBSAN=y
       CONFIG_UBSAN_FATAL=y
 
-debian-12-riscv64-gcc-debug:
+debian-13-riscv64-gcc-debug:
   extends: .gcc-riscv64-cross-build-debug
   variables:
-    CONTAINER: debian:12-riscv64
+    CONTAINER: debian:13-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     HYPERVISOR_ONLY: y
     EXTRA_XEN_CONFIG: |
@@ -727,6 +727,20 @@ debian-12-riscv64-gcc:
     KBUILD_DEFCONFIG: tiny64_defconfig
     HYPERVISOR_ONLY: y
 
+debian-12-riscv64-gcc-debug:
+  extends: .gcc-riscv64-cross-build-debug
+  variables:
+    CONTAINER: debian:12-riscv64
+    KBUILD_DEFCONFIG: tiny64_defconfig
+    HYPERVISOR_ONLY: y</pre>
    </blockquote>
    <pre>Don't you mind to keep an order? So:
  debian-12-riscv64-gcc-debug:
  ...
  debian-13-riscv64-gcc-debug:
  ...

Also, it will make a diff a little bit better.

</pre>
    <blockquote type="cite"
      cite="mid:20250809221206.1260861-4-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
+
+debian-13-riscv64-gcc:
+  extends: .gcc-riscv64-cross-build
+  variables:
+    CONTAINER: debian:13-riscv64
+    KBUILD_DEFCONFIG: tiny64_defconfig
+    HYPERVISOR_ONLY: y
+
 .riscv-fixed-randconfig:
   variables: &amp;riscv-fixed-randconfig
     EXTRA_FIXED_RANDCONFIG: |
@@ -739,10 +753,10 @@ debian-12-riscv64-gcc:
       CONFIG_VM_EVENT=n
       CONFIG_XSM=n
 
-debian-12-riscv64-gcc-randconfig:
+debian-13-riscv64-gcc-randconfig:</pre>
    </blockquote>
    <pre>Are we going to have randconfig build test only for Debian-13?

</pre>
    <blockquote type="cite"
      cite="mid:20250809221206.1260861-4-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
   extends: .gcc-riscv64-cross-build
   variables:
-    CONTAINER: debian:12-riscv64
+    CONTAINER: debian:13-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     RANDCONFIG: y
     &lt;&lt;: *riscv-fixed-randconfig
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 2f6f3affa637..9acd984d294c 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -705,7 +705,7 @@ qemu-smoke-riscv64-gcc:
   script:
     - ./automation/scripts/qemu-smoke-riscv64.sh 2&gt;&amp;1 | tee ${LOGFILE}
   needs:
-    - debian-12-riscv64-gcc-debug
+    - debian-13-riscv64-gcc-debug</pre>
    </blockquote>
    <pre>The same as above, are we going to run smoke tests only for Debian-13?

If the answer to this and the question above is “yes,” then (probably
keeping the order — first debian-12, then debian-13 — for the jobs):
 Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250809221206.1260861-4-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
 
 qemu-smoke-ppc64le-powernv9-gcc:
   extends: .qemu-ppc64le
</pre>
    </blockquote>
  </body>
</html>

--------------jBo8MouCJ84UWa0950Sndq1f--

