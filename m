Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7252740F6
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 13:35:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKgaL-0006kb-Mu; Tue, 22 Sep 2020 11:35:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VADB=C7=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1kKgaK-0006kR-Ly
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 11:35:48 +0000
X-Inumbo-ID: 8e6e3eb2-846f-4589-9f49-5d54be7a6e6b
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 8e6e3eb2-846f-4589-9f49-5d54be7a6e6b;
 Tue, 22 Sep 2020 11:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600774546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iVuM9z2yUr8zyxXYDwbwyPVDW6UrW4ow9wkAb6hmN1A=;
 b=ERk/iBuKCAPFUQlQ3Otikx+wCNsToH1pYkXQjTPHFA3DdnNOK3V/eH/IILrFYNxsJn9xyc
 fsV+q8X/yc3nflr2z/ea/WNOTLsvEnYAc5U8sSn9mIzdHQnEQkOcDSoq1grQn4E3c23ndt
 VEbOaGHWmBAVpblGq3I7Fs5zKx9YezQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-egRsHQ8ONES9v-RWVXDFtg-1; Tue, 22 Sep 2020 07:35:42 -0400
X-MC-Unique: egRsHQ8ONES9v-RWVXDFtg-1
Received: by mail-wm1-f71.google.com with SMTP id m125so790886wmm.7
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2020 04:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iVuM9z2yUr8zyxXYDwbwyPVDW6UrW4ow9wkAb6hmN1A=;
 b=Vkh+Q6yIA7L0QEF32Y2bIpW6GzAvU9x5gQPLKKDtd4Slv+aBly4hSgDImhJdChQD41
 GrrKQCz16q8jBa1aqkD+BoQRBSZDTks2aCZmdIdLnn3a4aVxfMrbN+zJcnpUGdcZ2rFK
 zkQmj63xdFnuEUezf+q3VO0q7ueYgCqfdXVrBQvmgx/FSV15NjC4yYnPg3He0elLoNPF
 Cxy0mabNIq+t3mRESoz6qZO2BO4AsIvPFJd6LiKb6IqVJzwG9t1CZNi5sdEeL+P6mrNR
 VVQvp9dko137WOXfe3lS+8TCUxWi6W9jQRbmgypLC0lxw3pEU1LQlp1rNHwncvo3ZXAU
 pgNg==
X-Gm-Message-State: AOAM532O/DWYIJsI+TNZScEjtPw4J7QoF4AjY5z1CImNAZXqFA/Xrk2j
 a2hnoqbRVxjk1QJUOcu8+Vjm5oSf7g4FDEh/Sf9LwWboM1adAH90i3sROPiv/c78K5FPFxdfUs5
 Lud0CJz0Fa99KKkhS9KIHUelG9W8=
X-Received: by 2002:a1c:2c0a:: with SMTP id s10mr522280wms.103.1600774540928; 
 Tue, 22 Sep 2020 04:35:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRA5AQEUn4rCczYkkzXjxs49KTP7PwCp4IUjQhU4ZWgDSvFRTPtzciduuPsGxbrjwX11t5eA==
X-Received: by 2002:a1c:2c0a:: with SMTP id s10mr522238wms.103.1600774540651; 
 Tue, 22 Sep 2020 04:35:40 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:ec2c:90a9:1236:ebc6?
 ([2001:b07:6468:f312:ec2c:90a9:1236:ebc6])
 by smtp.gmail.com with ESMTPSA id m18sm25626053wrx.58.2020.09.22.04.35.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 04:35:39 -0700 (PDT)
Subject: Re: [PATCH v2] qemu/atomic.h: prefix qemu_ to solve <stdatomic.h>
 collisions
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Eric Blake <eblake@redhat.com>,
 Peter Lieven <pl@kamp.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Alberto Garcia <berto@igalia.com>, qemu-s390x@nongnu.org,
 kvm@vger.kernel.org, Liu Yuan <namei.unix@gmail.com>,
 Jiri Slaby <jslaby@suse.cz>, Fam Zheng <fam@euphon.net>,
 Paul Durrant <paul@xen.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Max Reitz <mreitz@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Kevin Wolf <kwolf@redhat.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-arm@nongnu.org,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, sheepdog@lists.wpkg.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Juan Quintela <quintela@redhat.com>, qemu-riscv@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Stefan Weil
 <sw@weilnetz.de>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Markus Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-block@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, xen-devel@lists.xenproject.org,
 Laurent Vivier <laurent@vivier.eu>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, Huacai Chen <chenhc@lemote.com>
References: <20200922085838.230505-1-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <33631340-e3e3-b10f-4f9a-0e1b295d79ef@redhat.com>
Date: Tue, 22 Sep 2020 13:35:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200922085838.230505-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22/09/20 10:58, Stefan Hajnoczi wrote:
> clang's C11 atomic_fetch_*() functions only take a C11 atomic type
> pointer argument. QEMU uses direct types (int, etc) and this causes a
> compiler error when a QEMU code calls these functions in a source file
> that also included <stdatomic.h> via a system header file:
> 
>   $ CC=clang CXX=clang++ ./configure ... && make
>   ../util/async.c:79:17: error: address argument to atomic operation must be a pointer to _Atomic type ('unsigned int *' invalid)
> 
> Avoid using atomic_*() names in QEMU's atomic.h since that namespace is
> used by <stdatomic.h>. Prefix QEMU's APIs with qemu_ so that atomic.h
> and <stdatomic.h> can co-exist.
> 
> This patch was generated using:
> 
>   $ git grep -h -o '\<atomic\(64\)\?_[a-z0-9_]\+' include/qemu/atomic.h | \
>     sort -u >/tmp/changed_identifiers
>   $ for identifier in $(</tmp/changed_identifiers); do
>        sed -i "s%\<$identifier\>%qemu_$identifier%g" \
>            $(git grep -I -l "\<$identifier\>")
>     done
> 
> I manually fixed line-wrap issues and misaligned rST tables.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v2:
>  * The diff of my manual fixups is available here:
>    https://vmsplice.net/~stefan/atomic-namespace-pre-fixups.diff
>    - Dropping #ifndef qemu_atomic_fetch_add in atomic.h
>    - atomic_##X(haddr, val) glue macros not caught by grep
>    - Keep atomic_add-bench name
>    - C preprocessor backslash-newline ('\') column alignment
>    - Line wrapping
>  * Use grep -I to avoid accidentally modifying binary files (RISC-V
>    OpenSBI ELFs) [Eric Blake]
>  * Tweak .gitorder to show atomic.h changes first [Eric Blake]
>  * Update grep commands in commit description so reviewers can reproduce
>    mechanical changes [Eric Blake]

I think the reviews crossed, are you going to respin using a qatomic_
prefix?

Paolo


