Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46257A86E31
	for <lists+xen-devel@lfdr.de>; Sat, 12 Apr 2025 18:43:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.948348.1345644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3dvn-0003vt-7i; Sat, 12 Apr 2025 16:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 948348.1345644; Sat, 12 Apr 2025 16:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3dvn-0003uR-4f; Sat, 12 Apr 2025 16:42:11 +0000
Received: by outflank-mailman (input) for mailman id 948348;
 Sat, 12 Apr 2025 16:42:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsqC=W6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u3dvk-0003uJ-Uc
 for xen-devel@lists.xenproject.org; Sat, 12 Apr 2025 16:42:08 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11d40223-17bd-11f0-9eae-5ba50f476ded;
 Sat, 12 Apr 2025 18:42:06 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so21948325e9.2
 for <xen-devel@lists.xenproject.org>; Sat, 12 Apr 2025 09:42:06 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2066d92csm122981915e9.24.2025.04.12.09.42.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Apr 2025 09:42:05 -0700 (PDT)
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
X-Inumbo-ID: 11d40223-17bd-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744476126; x=1745080926; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=amB9wIbUskdsHmNTzZzQUPBhbBxEsnDgH1hkUEl6XC0=;
        b=lTeVj+5cy+C4eurlfkcLDjKLhwjUXDx4362WqIdiW/H/4uptakTXK+azv884wBH3qa
         i4r2VQE879o5ysUMNVqd+RBSWFAwz5FtsgQcQCHIANPftxePN+l5dVD8ti66q8zSGJDb
         OHKUMX26kUpeVViej0l8ADXf/AO1AyC8cR1as=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744476126; x=1745080926;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amB9wIbUskdsHmNTzZzQUPBhbBxEsnDgH1hkUEl6XC0=;
        b=nnccznLrQSuJmePFrVcybmwhuM+Ud7NeXU5VT6CnIHp+3N+IfNP+LA/kaIaZ+XbCAI
         2DQcuUulcftRzV0IAqrkMBrcexgy6OxCTgMq036SxNcrPYjF2WIKKG5FODWy7TDkxlXK
         mcrOvZrFS+8mVAjxhGimIlz9nDk/LV3cF5pG82jXhkAAVV1YwI/GSzXvpghusKUJkxy9
         SuxQfJgP4+rwEu3weOvfJ+MFcL2cm2FP/exLVplafBqtYj3b3KGqAHO5Cqr3pRlaw9P6
         nkFrxU6nvv4xWgVr1NlkrKzE7CXYKOPxJx26A3QlSyjUU8EqFhSWhRFWEevX37NWZaZz
         8z4g==
X-Forwarded-Encrypted: i=1; AJvYcCVmgPJM/vJBHsyJHxfbvWcel1tlRO8PKMI8HI1hd3So/7sg9rYeNAPm8e9g+PdFL4xU4FcK+eKo4d4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5HzhLaCRYYTgjxh5J3RADQPCIh07OWFnKcxw6lveFFl3aXewF
	Z8iC60QBcmbjvek50f7PrZ3M3plqyYoS6pn0VtiOox6HteoVaFpf+yNM+mHVftY=
X-Gm-Gg: ASbGncs/cLAT/aDPoO3Js2XRX2NLSIHZ/JmR6fdyiu8EypgSJ7m5Dd5uv8y3Co2a33p
	JPFn6WhWrq61yHTB91V0z1foMg6I4hCvhflkqGmeEUFE42RXBAKXxMXDJZns2TchIdVDRfMHGrk
	ulOCB2vPNTtw+ET8UrUfSGp+icM6ADr2t/JyMxtV0ZKX9LjMEwf3piweah8WLDuLxVJH/IyASD/
	Q9Hd4eRAQdDPildAqHNJBa9iXL5SYTM/9mgIatLqSQAjNLEkTBtsYr4Rwob15kGJT6+dAbA53O/
	8PoJay+pfMcUTIF3qLPRWoEC/8kQI93+DraD6HnESnHytY4yzqj7YsoJ40QQN7t80kZqoNMR3ts
	hNBLRnQ==
X-Google-Smtp-Source: AGHT+IFU/yz3W7QkGTw/S9MTSGkxQyLC/rbnGY1rR/G3x8bIpqfkynp2DHEm28UoonYN0p8KS2mpqA==
X-Received: by 2002:a05:600c:a04:b0:43d:ed:acd5 with SMTP id 5b1f17b1804b1-43f3a93d4a8mr67329945e9.10.1744476125626;
        Sat, 12 Apr 2025 09:42:05 -0700 (PDT)
Message-ID: <48036676-3d7a-4bf7-b106-b23465371e31@citrix.com>
Date: Sat, 12 Apr 2025 17:42:04 +0100
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

It's probably worth saying ", fixed subsequently)" for the toolstack, as
it's the single largest aspect.

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

These two paragraphs are a little stale now.  etc/issue has already been
committed, and there's no initd building now I've moved arm into test
artefacts.

However, they're going to need tweaking again if I can get the rootfs
generation working more nicely, so lets hold off for now.

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
> ---
>  automation/gitlab-ci/test.yaml                    |  6 +++--
>  automation/scripts/qemu-alpine-x86_64.sh          |  9 +++-----
>  automation/scripts/qemu-smoke-dom0-arm64.sh       |  7 ++----
>  automation/scripts/qemu-smoke-dom0less-arm64.sh   |  7 ++----
>  automation/scripts/qubes-x86-64.sh                | 18 +++++++---------
>  automation/scripts/xilinx-smoke-dom0-x86_64.sh    | 15 ++++++-------
>  automation/scripts/xilinx-smoke-dom0less-arm64.sh | 14 +++++-------
>  7 files changed, 35 insertions(+), 41 deletions(-)

One thing that does matter now is the order of appending archives.

I've reworked this locally to be of the form:

# DomU rootfs
cp ../binaries/rootfs.cpio.gz ../binaries/domU-rootfs.cpio.gz

# test-local configuration
mkdir rootfs
...
find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz


This then ends up looking rather more clean in followon patches, where
we end up with:

# Dom0 rootfs
cp ../binaries/ucode.cpio ../binaries/dom0-rootfs.cpio.gz
cat ../binaries/rootfs.cpio.gz >> ../binaries/dom0-rootfs.cpio.gz
cat ../binaries/toolstack.cpio.gz >> ../binaries/dom0-rootfs.cpio.gz
if [[ "${TEST}" == argo ]]; then
    cat ../binaries/argo.cpio.gz >> ../binaries/dom0-rootfs.cpio.gz
fi

# test-local configuration
...
find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz


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
> @@ -92,9 +93,8 @@ fi
>  # Set up domU rootfs.
>  mkdir -p rootfs
>  cd rootfs
> -tar xzf ../binaries/initrd.tar.gz
>  mkdir proc run srv sys
> -rm var/run
> +mkdir -p etc/local.d
>  echo "#!/bin/sh
>  set -x
>  export LD_LIBRARY_PATH=/usr/local/lib
> @@ -102,23 +102,22 @@ PATH=/usr/local/bin:/usr/local/sbin:\$PATH
>  ${DOMU_CMD}
>  " > etc/local.d/xen.start
>  chmod +x etc/local.d/xen.start
> -echo "rc_verbose=yes" >> etc/rc.conf
>  echo "domU Welcome to Alpine Linux 3.18
>  Kernel \r on an \m (\l)
>  
>  " > etc/issue
>  copy_domU_files
> -find . | cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
> +cp ../binaries/initrd.cpio.gz ../binaries/domU-rootfs.cpio.gz

Stray initrd.  Found while reworking.

I'll give the whole lot commit-by-commit full runs, when I'm done tinkering.

~Andrew

