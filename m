Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1588D7D9027
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 09:45:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624271.972697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwHWV-0003he-Dg; Fri, 27 Oct 2023 07:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624271.972697; Fri, 27 Oct 2023 07:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwHWV-0003fJ-B0; Fri, 27 Oct 2023 07:44:51 +0000
Received: by outflank-mailman (input) for mailman id 624271;
 Fri, 27 Oct 2023 07:44:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEfT=GJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qwHWU-0003fA-E8
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 07:44:50 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b39764d8-749c-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 09:44:47 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40838915cecso14060995e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 00:44:47 -0700 (PDT)
Received: from [192.168.10.177] (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b004068e09a70bsm940661wmo.31.2023.10.27.00.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 00:44:45 -0700 (PDT)
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
X-Inumbo-ID: b39764d8-749c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698392687; x=1698997487; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=weNLTHsNEHd1AKAqcG0eLkMfm7+O04Gb2EjgMXPk2o8=;
        b=R6VxZV+RTz06jQNzK50uCUYAzPaIb+xWBIqBje3A7t6WglJBgyXTo9keSWE3qH4qTq
         752mGzPzIZfAbhr0qRpVcskdL+6mXDgxbSlbh3mlBXbrVQQeRt2WM0zW101JHbsQwBo9
         +N53QXsB7QAE0QhsB6WPrEHnK9oGy70dNaGCioYMmNh+IilM8KQmim8e0hTwDgj6ht2V
         roghHZZ0idX+azivGsmgkHv1QPDiqR3k9alqu5BGYo6sV2zwGWi6LpU6WB/eURScJnVK
         O2tOPquOfLwHx8cMHTelArunzb7Jp2fTH3vcCGhohVbP9OGPG2v6R8WvIRHA0n8CFZCg
         b5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698392687; x=1698997487;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weNLTHsNEHd1AKAqcG0eLkMfm7+O04Gb2EjgMXPk2o8=;
        b=QNmNgaVGpeK7ciI1u0oZrtytxs0xxXsHVYUrEi6JvKd7czeGE48zMYWSpAiRSEzgfl
         qjFGMubY4Xp046nqgDGyVr3KN5mq/Mgt3yZtceQ4GGNl+QK6x9p/OA3dJlU5d9CO4Wbd
         WduIwHOroUiNw3ad6BZCsd7k9y7A9NI1b3qSaZbrDXtjm3EVlUVzSzryOGWiB/NnOWJ8
         svNOC0Nu6NbSVLiZ6C7R+jOV4Kzp9W39o2Gxd4VrAQRgzZhPgG0Mfb9B965Nv0ZXHSCf
         y0z6sdBPisULGYkJV355dUkplbUBOn2CzKTAmOio2zUFlvQIfzV4usKTJb0awYpqGXWP
         2wsg==
X-Gm-Message-State: AOJu0YzNe2dB7tyZ+rj+MIphEWbQwgz1s/uiGTKTE7zR8YtTcziUKe0a
	qc9tJYtHaDtv4pZV3HdGcAM=
X-Google-Smtp-Source: AGHT+IGfHlZcElg4jlYC+dM2f33yrgLaTa3lKMccWGDiPJqAf0Qf0ppM0UHBxCctTNhgycC9pq53SA==
X-Received: by 2002:a05:600c:45d3:b0:405:3dd0:6ee9 with SMTP id s19-20020a05600c45d300b004053dd06ee9mr1653222wmo.34.1698392686518;
        Fri, 27 Oct 2023 00:44:46 -0700 (PDT)
Message-ID: <d58639b8-09de-4820-88ae-53de0db55f7f@gmail.com>
Date: Fri, 27 Oct 2023 08:44:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 17/28] hw/xen: add support for Xen primary console in
 emulated mode
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Bernhard Beschow <shentey@gmail.com>, Joel Upham <jupham125@gmail.com>
References: <20231025145042.627381-1-dwmw2@infradead.org>
 <20231025145042.627381-18-dwmw2@infradead.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20231025145042.627381-18-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/10/2023 15:50, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The primary console is special because the toolstack maps a page into
> the guest for its ring, and also allocates the guest-side event channel.
> The guest's grant table is even primed to export that page using a known
> grant ref#. Add support for all that in emulated mode, so that we can
> have a primary console.
> 
> For reasons unclear, the backends running under real Xen don't just use
> a mapping of the well-known GNTTAB_RESERVED_CONSOLE grant ref (which
> would also be in the ring-ref node in XenStore). Instead, the toolstack
> sets the ring-ref node of the primary console to the GFN of the guest
> page. The backend is expected to handle that special case and map it
> with foreignmem operations instead.
> 
> We don't have an implementation of foreignmem ops for emulated Xen mode,
> so just make it map GNTTAB_RESERVED_CONSOLE instead. This would probably
> work for real Xen too, but we can't work out how to make real Xen create
> a primary console of type "ioemu" to make QEMU drive it, so we can't
> test that; might as well leave it as it is for now under Xen.
> 
> Now at last we can boot the Xen PV shim and run PV kernels in QEMU.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/char/xen_console.c             |  78 ++++++++----
>   hw/i386/kvm/meson.build           |   1 +
>   hw/i386/kvm/trace-events          |   2 +
>   hw/i386/kvm/xen-stubs.c           |   8 ++
>   hw/i386/kvm/xen_gnttab.c          |   7 +-
>   hw/i386/kvm/xen_primary_console.c | 193 ++++++++++++++++++++++++++++++
>   hw/i386/kvm/xen_primary_console.h |  23 ++++
>   hw/i386/kvm/xen_xenstore.c        |  10 ++
>   hw/xen/xen-bus.c                  |   5 +
>   include/hw/xen/xen-bus.h          |   1 +
>   target/i386/kvm/xen-emu.c         |  23 +++-
>   11 files changed, 328 insertions(+), 23 deletions(-)
>   create mode 100644 hw/i386/kvm/xen_primary_console.c
>   create mode 100644 hw/i386/kvm/xen_primary_console.h
> 

Reviewed-by: Paul Durrant <paul@xen.org>



