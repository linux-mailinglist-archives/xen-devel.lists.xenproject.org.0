Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B63A86D6C
	for <lists+xen-devel@lfdr.de>; Sat, 12 Apr 2025 16:06:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.948247.1345615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3bU1-0008Tg-G0; Sat, 12 Apr 2025 14:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 948247.1345615; Sat, 12 Apr 2025 14:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3bU1-0008RY-AO; Sat, 12 Apr 2025 14:05:21 +0000
Received: by outflank-mailman (input) for mailman id 948247;
 Sat, 12 Apr 2025 14:05:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsqC=W6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u3bTz-0008RO-6M
 for xen-devel@lists.xenproject.org; Sat, 12 Apr 2025 14:05:19 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28bf487d-17a7-11f0-9ffb-bf95429c2676;
 Sat, 12 Apr 2025 16:05:16 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so23424385e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 12 Apr 2025 07:05:16 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f23158849sm119975865e9.0.2025.04.12.07.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Apr 2025 07:05:14 -0700 (PDT)
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
X-Inumbo-ID: 28bf487d-17a7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744466715; x=1745071515; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3Z6fVRPX9Pt5YkoZ34E9hxS7unoAhfIreaWAiVO6kNA=;
        b=qpUHhVEEr48WqiMZWIfcmDGVz6i+w//BI6+arXoF6dViujpWiwv6D8u9tvVk9qKdU1
         QyOV+ILwZG9PlsLjMIUyNOG9Aa/wLksev4XOPpBUHnBX57XvUjMaMwp9tWOm9FxSd/Jh
         VUImraMZGwBewjOrfrIsBhTyn22SvP+39xKHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744466715; x=1745071515;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Z6fVRPX9Pt5YkoZ34E9hxS7unoAhfIreaWAiVO6kNA=;
        b=TtvV+g6hpsAv07+21IhDolaCAOs5VavE0fU4xqhup4RyS5fVYpvGRt05qjfg/neTCB
         9bhsAg8NNTjiLyEBeJDrYPbZTTFnwBhOUJLxas1fCE/TL9FBC6fIHanXNl6F9BRKP7pN
         vZPMPq01LIoW/VCR6EYger9xPP0joubOejNn7N5+Gu6vpBzWsXK3BGF0OnmDD2Xj6Vw6
         0W5zZ6mOHjzmtlic9lJ45/q3ZBoplDGv9NdE0GYNW8HxcITb+sQ6FmYxof5zKQUHtwgy
         YpeZk8rbfZBMqS2WbuEf11Y7Fqar77zHxx+eQQf8+87P32+8dhddcSoZZgJpwX83mw3U
         92SA==
X-Forwarded-Encrypted: i=1; AJvYcCXmrTDiC6vbQxZLb0vENzkRqQ/J+D6AewgngNI229VaeyglKrMOiT4S76TBxJrVNendeHNCMTkb3hQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz38DOZ+fqD9vZkoAgnwHofgVjFZqCuJni+uF9rZz71qjYSbdi5
	m1FFxyC8+waU101B5uX20u4waxt7jvP6VXAyJwMq7qNLxsu9Dn0tVEyFkQim7JA=
X-Gm-Gg: ASbGncuSTrl4gI8xccBY0QcVM8ualHTPCG5VqNiLAqLDas6OKUFN0LH3xg8e06D0D5X
	U80nq3C0D4/QM8Mpt+jeZVbZGfLgjVdveVl2Yfo+ZfEljU5qrPu6wyNpcwKqNXd8CfC+awgDyCR
	51w60wloh6R7821IKeH2dHQFGumMtrYuJEE9S+nmyTm1XugJ9LSiC4dlGxk/XYYBv7sw71hID4k
	I11CwAvzCgqQ2W9zTGhb+y8d2eqSJ9UYLeKm8p4FoxGtsymE23DVCDEPR7Nru0FrESlDG68ySSD
	f8IqRxwkCqI/Hcsuq0OZw42S+Re5Eo7sHJZKdjQ0IZL8Fqay50LyYZ7Zff0z1wIYPWenfLxz02p
	URAGqRw==
X-Google-Smtp-Source: AGHT+IGqPNnYR73RZw4WdNeN2Kl4NEpYwFllR0FMwTaUdKgr/RatX3Oj/WwFYBK6lyMhxNF7DdorVg==
X-Received: by 2002:a05:600c:5494:b0:43c:f050:fed3 with SMTP id 5b1f17b1804b1-43f3a93d850mr58733745e9.11.1744466715331;
        Sat, 12 Apr 2025 07:05:15 -0700 (PDT)
Message-ID: <b1ffc4df-bd79-47ec-b80c-8bd935f5f2ed@citrix.com>
Date: Sat, 12 Apr 2025 15:05:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] CI: avoid repacking initrd as part of the test job
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
 <c7bd8aa95e8bd85f3e42ed4f07d69444f5435e25.1744403499.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c7bd8aa95e8bd85f3e42ed4f07d69444f5435e25.1744403499.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2025 9:32 pm, Marek Marczykowski-Górecki wrote:
> The prerequisite for this is building rootfs.cpio.gz, not only
> initrd.tar.gz. That's a change in the test-artifacts repository in the
> "Rootfs generation" series from Andrew.
>
> Having that, do not repack the whole initrd, but only pack modified
> files and rely on Linux handling of concatenated archives.
> This allows packing just test-related files (which includes the whole
> toolstack), instead of the whole initrd.
>
> DomU initrd handling is a bit more complicated thing. It's sent to the
> target host as part of the dom0 initrd. For now include prepared domU
> initrd as a whole in dom0's rootfs "overlay", which means compressing it
> (again) each job (this takes 3s). This can be later improved by
> splitting domU initrd into two parts (base + overlay) and concatenate
> them in target dom0 already. For this to be useful, test-artifacts would
> need to provide pre-made double-cpio version too (rootfs.cpio.gz wrapper
> in yet another cpio.gz as boot/domU-initrd).
>
> Since full initrd is not unpacked now when preparing domU (and dom0)
> rootfs, a couple of minor changes are needed to how they are prepared.
> This includes creating whole etc/issue file, instead of modifying
> existing one, and a need to create a couple directories.
>
> Finally, move adding "rc_verbose=yes" to /etc/rc.conf to initrd
> building.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> Changes in v3:
> - adjust for Andrew's version of cpio rootfs artifacts
> - don't require double-cpio archive for domU initrd, instead add it via
>   dom0 initrd as plain cpio to avoid re-compressing the same thing
> New in v2
>
> Jobs xilinx-* are untested, as I don't have necessary access.

I can test these.

> ---
>  automation/gitlab-ci/test.yaml                    |  6 +++--
>  automation/scripts/qemu-alpine-x86_64.sh          |  9 +++-----
>  automation/scripts/qemu-smoke-dom0-arm64.sh       |  7 ++----
>  automation/scripts/qemu-smoke-dom0less-arm64.sh   |  7 ++----
>  automation/scripts/qubes-x86-64.sh                | 18 +++++++---------
>  automation/scripts/xilinx-smoke-dom0-x86_64.sh    | 15 ++++++-------
>  automation/scripts/xilinx-smoke-dom0less-arm64.sh | 14 +++++-------
>  7 files changed, 35 insertions(+), 41 deletions(-)
>
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 59a2de28c864..3e02bf0e4d21 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -11,7 +11,9 @@
>    - project: xen-project/hardware/test-artifacts
>      job: linux-6.6.86-arm64
>      ref: master
> -  - alpine-3.18-arm64-rootfs-export
> +  - project: xen-project/hardware/test-artifacts
> +    job: alpine-3.18-arm64-rootfs
> +    ref: master
>    - qemu-system-aarch64-6.0.0-arm64-export
>  
>  .arm32-test-needs: &arm32-test-needs
> @@ -22,7 +24,7 @@
>      job: linux-6.6.56-x86_64
>      ref: master
>    - project: xen-project/hardware/test-artifacts
> -    job: x86_64-rootfs-alpine-3.18
> +    job: alpine-3.18-x86_64-rootfs
>      ref: master
>  
>  .qemu-arm64:
> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> index 89bdb4df7dac..6e0a67b4018c 100755
> --- a/automation/scripts/qemu-alpine-x86_64.sh
> +++ b/automation/scripts/qemu-alpine-x86_64.sh

There are some very poor choices of name in this script.  I'll do a prep
patch to make them consistent.

> @@ -28,16 +28,15 @@ cd initrd
>  find . | cpio --create --format='newc' | gzip > ../initrd.cpio.gz
>  cd ..
>  
> -# initrd.tar.gz is Dom0 rootfs
> +# Dom0 rootfs - overlay on top of rootfs.cpio.gz
>  mkdir -p rootfs
>  cd rootfs
> -tar xvzf ../initrd.tar.gz
>  mkdir proc
>  mkdir run
>  mkdir srv
>  mkdir sys
> -rm var/run

I'm not sure why we need to make proc, run, srv, sys in the overlay
image, but this is repeated everywhere.

srv is just a plain empty dir.  It's missing from $PATHS in the rootfs
generation, so that's easy.

proc, run and sys are more complicated, because we don't want to simply
copy them from the rootfs generation environment.

dev is also in the same boat, and what we do now seems to cause openrc
not to seed it normally, which seems unwise.

I'll see what I can do to clean this all up.

> diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> index 4db249530823..52a0e05e3f1b 100755
> --- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> @@ -80,6 +80,7 @@ argo-exec -l -p 28333 -- /bin/echo
>  "
>  copy_dom0_files ()
>  {
> +    mkdir -p root usr/local/lib
>      cp "${WORKDIR}/binaries/xen-argo.ko" "root/"
>      cp -ar "${WORKDIR}/binaries/lib/"* "usr/local/lib/"
>      cp "${WORKDIR}/binaries/argo-exec" "usr/local/bin/"

This would be better based on top of my patch to switch to the new argo,
at which point it will simply be to append argo.cpio.gz.

~Andrew

