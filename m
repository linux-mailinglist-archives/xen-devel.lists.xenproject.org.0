Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91635A85D40
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 14:39:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947327.1344980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3DfC-00042t-IR; Fri, 11 Apr 2025 12:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947327.1344980; Fri, 11 Apr 2025 12:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3DfC-00041S-EV; Fri, 11 Apr 2025 12:39:18 +0000
Received: by outflank-mailman (input) for mailman id 947327;
 Fri, 11 Apr 2025 12:39:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cS7z=W5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u3DfA-00041K-VG
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 12:39:16 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9d2bc5f-16d1-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 14:39:14 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso14129995e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 05:39:14 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f20a303absm59951575e9.1.2025.04.11.05.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 05:39:13 -0700 (PDT)
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
X-Inumbo-ID: f9d2bc5f-16d1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744375154; x=1744979954; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SYKb+PN2e/LR8iiyi+jhYVCzN7RHLkzIYt3z0ej2NAM=;
        b=eeHEIGZpb+JYy7ecH9xHJmiYTzrecmI6IQ5FVZqWYLVPkwJwml/UEtM4RSd1259XyS
         NzwpnLVnB7qAa0gE/yw1+MGr9zBMlnxYWx0BSt34SxtLpGFE0vn9bKTfejKV0JWrSqij
         jbpypw7qZdS2muim2SgL8MOD//rWr6PovXsDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375154; x=1744979954;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYKb+PN2e/LR8iiyi+jhYVCzN7RHLkzIYt3z0ej2NAM=;
        b=E0n5OFL3utHzg8te4YurV5If9+C5vdMeRFjCs61bpA181P2VOj9QI+GiaSd+bPccmY
         cli4QYIEXSDySPQ1fppGMTKIfL6DTQhrROCFowUObNjUvRn3r6okMTe8V+LihXVIHP6b
         JQNoNh/XEFHUmn9DzL/bHZR/ioQr+c+Q+Ery4LkRNlGmBzkqTyVfql5sxPkQbtk99aq+
         yGBpMIF34JCiz/cf8nxhi+MAoBR2aHQgT74uBA1Lx0Xv3atNt4Y6bcIEZyOJpK+1sqaP
         h0FqFfs+C3MFSw0ZDEZlsNDs9j/yDLQtjcoap8uyxE3qenngWuZi8K3678MwhF22aFvE
         Qr9Q==
X-Gm-Message-State: AOJu0YzNpu8oyafEYJFcr5pEpTgrDYJhbJzPgF1BW+KIrPs08co4Ps6g
	00IUWm7sX05sL4F6ZH32wzPDTXr4PmJyRDdD39hgPQznT4ZynhpzL3mjJbL5S74=
X-Gm-Gg: ASbGncsqRCS4tLkzz5VKvU8Sn8krmg6HLxHBGlR4ep7Vjy4DL3LXv6FLh28W4zfFs39
	SHQYguDDfaOB45BKBpOMIgilJ3PKSCoyRFb+HCHP2lnuI/quafhO7ZxEdD4XnMk+iNAPXIc5FK6
	nlOKKL5osrHVuDUCLZiQbJ2q1HArAjoIUsfQ35NwZLz3deb+9G6yuXLYoMk93F64c5O32dcljCM
	/ksPl/Hkc8u9rc5b+fi3d4tYrCz8HK4TDKvs+H3uJSzkoraiOpJb85dNPk4lgAy8SXEUDWeMh2q
	H1h8A/lgSKOs1/KcWsWDi7pp/5yxPS0D0L78rJNx4v+zu5VZLzrfKN7Ystml5Z6Tbb1WBGoFqCp
	10H2+jlMqaDYI5Zvb
X-Google-Smtp-Source: AGHT+IFxczhackqjYiE97EhhbAF4RDt7OPKNsxdZvptR2pBNQfi5HQQ+Xvl30s4IHQlDhL12tmRxOw==
X-Received: by 2002:a5d:584a:0:b0:39c:16a0:feeb with SMTP id ffacd0b85a97d-39ea5213ca5mr1931372f8f.27.1744375154078;
        Fri, 11 Apr 2025 05:39:14 -0700 (PDT)
Message-ID: <d25c6102-0e15-4934-aafc-0801cdd65664@citrix.com>
Date: Fri, 11 Apr 2025 13:39:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Rework rootfs generation to make a cpio archive
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20250411105217.2141356-1-andrew.cooper3@citrix.com>
 <20250411105217.2141356-2-andrew.cooper3@citrix.com>
 <CACHz=Zhs9jT8GDN=LUfewPJpX6Q2LNxBgpyv1wW-D-qv_K-qLA@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACHz=Zhs9jT8GDN=LUfewPJpX6Q2LNxBgpyv1wW-D-qv_K-qLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2025 1:25 pm, Frediano Ziglio wrote:
> On Fri, Apr 11, 2025 at 11:52 AM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
>> Rename the script as we're going to use it for ARM64 shortly, and have it take
>> a tar or cpio parameter to determine the output format.
>>
>> Turn it into a proper bash script, and provide the cpio form under the new
>> artefact naming scheme.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Doug Goldstein <cardoe@cardoe.com>
>> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> ---
>>  .gitlab-ci.yml                                |  9 +++++++-
>>  ...6_64-rootfs-alpine.sh => alpine-rootfs.sh} | 21 +++++++++++++++++--
>>  2 files changed, 27 insertions(+), 3 deletions(-)
>>  rename scripts/{x86_64-rootfs-alpine.sh => alpine-rootfs.sh} (75%)
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 1d2c72b268a3..916c5ae9d508 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -42,6 +42,13 @@ linux-6.6.86-arm64:
>>  #
>>  # x86_64 artifacts
>>  #
>> +alpine-3.18-x86_64-rootfs:
>> +  extends: .x86_64-artifacts
>> +  script:
>> +    - ./scripts/alpine-rootfs.sh cpio
>> +  variables:
>> +    CONTAINER: alpine:3.18-x86_64-base
>> +
>>  linux-6.6.56-x86_64:
>>    extends: .x86_64-artifacts
>>    script: ./scripts/build-linux.sh
>> @@ -62,7 +69,7 @@ x86_64-kernel-linux-6.6.56:
>>  x86_64-rootfs-alpine-3.18:
>>    extends: .x86_64-artifacts
>>    script:
>> -    - . scripts/x86_64-rootfs-alpine.sh
>> +    - ./scripts/alpine-rootfs.sh tar
>>    variables:
>>      CONTAINER: alpine:3.18-x86_64-base
>>
>> diff --git a/scripts/x86_64-rootfs-alpine.sh b/scripts/alpine-rootfs.sh
>> similarity index 75%
>> rename from scripts/x86_64-rootfs-alpine.sh
>> rename to scripts/alpine-rootfs.sh
>> index b70b3a54ede5..c29c92d1c682 100755
>> --- a/scripts/x86_64-rootfs-alpine.sh
>> +++ b/scripts/alpine-rootfs.sh
>> @@ -1,4 +1,9 @@
>> +#!/bin/bash
>> +
>> +set -eu
>> +
>>  WORKDIR="${PWD}"
>> +COPYDIR="${WORKDIR}/binaries"
>>
>>  apk update
>>
>> @@ -56,5 +61,17 @@ passwd -d "root" root
>>
>>  # Create rootfs
>>  cd /
>> -tar cvzf "${WORKDIR}/binaries/initrd.tar.gz" \
>> -    bin dev etc home init lib mnt opt root sbin usr var
>> +PATHS="bin dev etc home init lib mnt opt root sbin usr var"
>> +
>> +case $1 in
>> +    cpio)
>> +        find $PATHS | cpio -o -H newc | gzip > "${COPYDIR}/rootfs.cpio.gz"
>> +
> Paranoia mode: -print0 for find and -0 for cpio to support weird file names?

This is a tiny alpine rootfs.  There aren't any, but weird filenames
would be a problem elsewhere too.

>
>> +        # Print the contents for the build log
>> +        zcat "${COPYDIR}/rootfs.cpio.gz" | cpio -tv
> I saw other comments about -v and busybox compatibility.
> I suppose it depends how important are performances here, otherwise I
> could suggest the usage of mkfifo before, use -F option to the fifo
> and use an additional pipeline to compress the file.
>
> mypipe=$(mktemp -u)
> mkfifo $mypipe
> gzip -c > "${COPYDIR}/rootfs.cpio.gz" < $mypipe &
> find $PATHS -print0 | cpio -o -H newc -F $mypipe -0
> wait # for gzip
> rm $mypipe

These artefacts are built once, then reused indefinitely.  Generating
this artefact takes 18s, most of which is the gitlab runner starting up.

~Andrew

