Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037A4A85B20
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 13:10:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947176.1344882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3CGy-0002oE-AG; Fri, 11 Apr 2025 11:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947176.1344882; Fri, 11 Apr 2025 11:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3CGy-0002m2-6x; Fri, 11 Apr 2025 11:10:12 +0000
Received: by outflank-mailman (input) for mailman id 947176;
 Fri, 11 Apr 2025 11:10:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cS7z=W5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u3CGw-0001cC-Iv
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 11:10:10 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87309bda-16c5-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 13:10:08 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso2185289f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 04:10:08 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae964089sm1703280f8f.15.2025.04.11.04.10.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 04:10:07 -0700 (PDT)
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
X-Inumbo-ID: 87309bda-16c5-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744369808; x=1744974608; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BVsda8boPA924uY36PhnI2sUwN31bJ3e8fcRs/mNves=;
        b=fCacBdf3o6dJTA/ZtJU+o3qLOj7eUZDsprqWzWhle2+AgOQo3R5oBG+EeRt/ovw5dF
         jQhk7V9QkSAv2n8HgzrH8yw7pKFf/K689RJ6FpuBEQcPMw36OC2Kh+aEjquVzlRYNhom
         ByDvp56GXfH27/6JKYoWaO8xGn+/SEkwcrmcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744369808; x=1744974608;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVsda8boPA924uY36PhnI2sUwN31bJ3e8fcRs/mNves=;
        b=wA1d1UcLsLQs9/hPYMtOR+a1q+nDRhF49iN8HqquGQqPvgAdit7J5l80bjdqacH+jh
         wtuZ3ERw7sPwNh6+BiFb9m88gXo7qzM78TiQmvcqXbdcTtDjM0lxs9mhnADnGKEbifvZ
         PnevZOGOsWt42vpPiWqi3QNjBdpCX1ndfUdpbJho9qnnrH9ULbz7MPtez8Kr0NYRaxF0
         whqz7jNCI2Uz/++R9Ww4iEaYOf/IdoJmg+LXcSgjjG/B1GCbkZRueUzCbrg+A80dVoMq
         G44d4OqnH7ntHvFqBkV0GqaR0t5oxhuUlDArSETtw8+Q5i3I4/+JvMvXYZMQBm+NbpSA
         2Daw==
X-Gm-Message-State: AOJu0YwpCSx6fB0SAt5B0TfnWLStG5WVtbkZQSpdz17KkdP8ydHPA+G7
	zcHzdvPlWpUPmLxpXB6pW6eHrcEA6rvZCNbijZlIjGJoGyClgN4K6o7/1t2rjek=
X-Gm-Gg: ASbGnctDJom+bQbyLGwnxm+hDCG3XAe+1Tk5AqFPNJCk+vWkdLgPM2Oev/0D/GBntm0
	Ud1yc/xRq1DgtOutLZ9eNg4NXlxCnrbI3kSd+nXObyhdCS55zMcYucI4Bxf5gPLfWOfq0gGzkoA
	QqzMczAxdDr9V40sr57nR2VX6uXaYY9hKo+/b/mQLlI7r6Pe+CWNmJPaBLxGRLsIL9h1N8eL+dw
	i/dhnD0LxB761l5Hp3PCsqH8GA22k0mklenVG1mmH+xJnkp/z/PEqYut7S0pPpAGO0YpTDvQHag
	BG6QuEzzqsuqeaKy+Jt5uYl4uH/vu1ZHxYfgKK57gh7OoikF6xugsKPM7eHyl+JiV3heoa7Vj6i
	9y5ZGGw==
X-Google-Smtp-Source: AGHT+IF3Bjik/4f5nlJt9lZuPbnm7MSt/+cjJKbq+wPzy6V+IqPdXlDZDoDBNsEhLhEHphjGDXopSg==
X-Received: by 2002:a5d:59ac:0:b0:39c:13fa:3eb with SMTP id ffacd0b85a97d-39eaaebab0dmr1601896f8f.39.1744369808068;
        Fri, 11 Apr 2025 04:10:08 -0700 (PDT)
Message-ID: <6000ef43-b24e-4bb5-8dd9-0fa2374adcf4@citrix.com>
Date: Fri, 11 Apr 2025 12:10:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] Overhaul how Argo is built and packged
To: Denis Mukhin <dmkhn@proton.me>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jason.andryuk@amd.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20250410213724.2098383-1-andrew.cooper3@citrix.com>
 <20250410213724.2098383-3-andrew.cooper3@citrix.com>
 <YPFuP6hQq0myBCOddL4tzFCBWAxGuKFkxdWlMOo5EkBkQVOjBoimEYoBywJD4vXGRatlf81hAvyLekktbrbH1zvWyEH_OUY97aF0YZtEfnA=@proton.me>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <YPFuP6hQq0myBCOddL4tzFCBWAxGuKFkxdWlMOo5EkBkQVOjBoimEYoBywJD4vXGRatlf81hAvyLekktbrbH1zvWyEH_OUY97aF0YZtEfnA=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2025 3:22 am, Denis Mukhin wrote:
> On Thursday, April 10th, 2025 at 2:37 PM, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
>>
>> Right now, the argo artefacts are a pile of files which the test has to turn
>> back into something which resembles a filesystem. Furthermore, because we do
>> not build modules for the main kernel, it is extra important to make sure that
>> xen-argo.ko doesn't get out of sync.
>>
>> Build argo unconditionally as part of the linux artefact. It's ~100kb all
>> together, compared to ~14M for the kernel.
>>
>> Produce a single argo.cpio.gz with xen-argo.ko in the standard location.
>> Prune userspace down to just the executables and libraries.
>>
>> This is cribbed from the existing scripts/x86_64-linux-argo.sh, which stays in
>> place in the short term until Xen can be updated to use the new scheme.
>>
>> Signed-off-by: Andrew Cooper andrew.cooper3@citrix.com
>>
>> ---
>> CC: Anthony PERARD anthony.perard@vates.tech
>>
>> CC: Stefano Stabellini sstabellini@kernel.org
>>
>> CC: Michal Orzel michal.orzel@amd.com
>>
>> CC: Doug Goldstein cardoe@cardoe.com
>>
>> CC: Marek Marczykowski-Górecki marmarek@invisiblethingslab.com
>>
>> CC: Jason Andryuk jason.andryuk@amd.com
>>
>> CC: Daniel P. Smith dpsmith@apertussolutions.com
>>
>>
>> I tried to make MODPOST work properly, but we don't build enough of it for the
>> kernel, and I didn't feel like adding an extra 10 mins to the build (all
>> modules) just to get the metadata right.
>> ---
>> .gitlab-ci.yml | 2 ++
>> scripts/build-argo.sh | 67 ++++++++++++++++++++++++++++++++++++++++++
>> scripts/build-linux.sh | 6 +++-
>> 3 files changed, 74 insertions(+), 1 deletion(-)
>> create mode 100644 scripts/build-argo.sh
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index fb997cc62162..790a6d9f9896 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -47,6 +47,8 @@ linux-6.6.56-x86_64:
>> script: ./scripts/build-linux.sh
>> variables:
>> LINUX_VERSION: 6.6.56
>> + ARGO_SHA: "705a7a8a624b42e13e655d3042059b8a85cdf6a3"
>> + ARGOEXEC_SHA: "d900429f6640acc6f68a3d3a4c945d7da60625d8"
>>
>> #
>> # The jobs below here are legacy and being phased out.
>> diff --git a/scripts/build-argo.sh b/scripts/build-argo.sh
>> new file mode 100644
>> index 000000000000..0b4005f3b9a0
>> --- /dev/null
>> +++ b/scripts/build-argo.sh
>> @@ -0,0 +1,67 @@
>> +#
>> +# This is a partial script, sourced by build-linux.sh
>> +# It has expectations about the environment
>> +#
>> +
>> +cd "${WORKDIR}"
>> +
>> +#
>> +# We're going to collect everything in argo.cpio.gz. Construct it under
>> +# $ARGODIR as we go.
>> +#
>> +ARGODIR="${WORKDIR}/argo-root"
>> +
>> +git clone https://github.com/OpenXT/linux-xen-argo.git --depth=1
>> +git -C "${WORKDIR}/linux-xen-argo" fetch origin "${ARGO_SHA}"
>> +git -C "${WORKDIR}/linux-xen-argo" switch --detach FETCH_HEAD
>> +
>> +# Build xen-argo.ko against the target kernel, and install it. Install
>> +# linux/argo.h too because userspace needs it.
>> +make -C "linux-${LINUX_VERSION}" \
>> + M="${WORKDIR}/linux-xen-argo/argo-linux" \
>> + KBUILD_MODPOST_WARN=1 \
>> + CFLAGS_MODULE="-Wno-error" \
> Suggest adding `W=e` for catching problems and `V=1` to help debugging a bit.

The currently referenced commit is buggy, and depends on this -Wno-error
to compile.

I've submitted a PR upstream to fix (see next patch), but there's no ETA
on when it will get merged, and we can't be blocked waiting on it.

>
>> + modules
>> +install -D -m644 "${WORKDIR}/linux-xen-argo/argo-linux/xen-argo.ko" \
>> + "${ARGODIR}/lib/modules/${LINUX_VERSION}/updates/xen-argo.ko"
>> +install -D -m644 "${WORKDIR}/linux-xen-argo/argo-linux/include/linux/argo.h" \
>> + "${ARGODIR}/usr/include/linux/argo.h"
>> +
>> +# Build and install libargo, applying fixes to build in Alpine Linux
>> +cd "${WORKDIR}/linux-xen-argo/libargo"
>> +sed -e "s|AM_INIT_AUTOMAKE|AC_CONFIG_AUX_DIR(.)\nAM_INIT_AUTOMAKE|" \
>> + -i configure.ac
>> +sed -e "s/_SOCKADDR_COMMON (sxenargo)/sa_family_t sxenargo_family/" \
>> + -e "s/__SOCKADDR_COMMON_SIZE/(sizeof (unsigned short int))/" \
>> + -i src/libargo.h
>> +
>> +autoreconf --install
>> +./configure --prefix=/usr CPPFLAGS="-I${PWD}/../argo-linux/include"
>> +make
> Perhaps add something like `make -j$(nproc)`?

Can do.  The build is so trivial you don't even notice it when non-parallel.

>
>> +make install DESTDIR="${ARGODIR}"
>> +
>> +# Build and install argo-exec, modifying for xilinx argo test
>> +cd "${WORKDIR}"
>> +curl -fsSLO \
>> + https://raw.githubusercontent.com/OpenXT/xenclient-oe/${ARGOEXEC_SHA}/recipes-openxt/argo-exec/argo-exec/argo-exec.c
>> +sed -e "/#include <xen\/xen.h>/d" \
>>
>> + -e "s|ret = shuffle(s, fds\[0\], fds\[1\]);|ret = shuffle(s, 0, 1);|" \
>> + -i argo-exec.c
>> +
>> +gcc -I"${ARGODIR}/usr/include" -L"${ARGODIR}/usr/lib/" \
>> + argo-exec.c -o "${ARGODIR}/usr/bin/argo-exec" -largo
>> +
>> +#
>> +# Building is now complete. Strip the devel components and the nointerposer
>> +# lib, which we don't care to deploy to the test system.
>> +#
>> +cd $ARGODIR
>> +rm -r usr/include usr/lib/pkgconfig
>> +find usr/lib -name \nointerposer\ -delete
>> +find usr/lib \( -name \.a -o -name \.so -o -name \*.la \) -delete
>> +
>> +# Package everything up
>> +find . | cpio -R 0:0 -H newc -o | gzip > "$COPYDIR/argo.cpio.gz"
>>
>> +
>> +# Print the contents for the build log
>> +zcat "$COPYDIR/argo.cpio.gz" | cpio -tv
>> diff --git a/scripts/build-linux.sh b/scripts/build-linux.sh
>> index 652fdba7b9d1..49b5ebed6424 100755
>> --- a/scripts/build-linux.sh
>> +++ b/scripts/build-linux.sh
>> @@ -8,7 +8,7 @@ fi
>> set -ex -o pipefail
>>
>> WORKDIR="${PWD}"
>> -COPYDIR="${WORKDIR}/binaries/"
>> +COPYDIR="${WORKDIR}/binaries"
>> UNAME=$(uname -m)
>>
>> # Build Linux
>> @@ -45,6 +45,10 @@ case $UNAME in
>> x86_64)
>> make -j$(nproc) bzImage
>> cp arch/x86/boot/bzImage "${COPYDIR}"
>> +
>> + # Build argo
>> + make modules_prepare
>> + . "${WORKDIR}/scripts/build-argo.sh"
> Nit: I would use `source` instead of `.` which is simple to overlook.

I expect you'll find that . is more common `source` in Xen.

~Andrew

