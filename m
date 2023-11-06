Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 167337E2938
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 16:59:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628180.979358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r020F-0002ZO-Aw; Mon, 06 Nov 2023 15:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628180.979358; Mon, 06 Nov 2023 15:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r020F-0002X1-7X; Mon, 06 Nov 2023 15:59:03 +0000
Received: by outflank-mailman (input) for mailman id 628180;
 Mon, 06 Nov 2023 15:59:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4jw9=GT=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r020D-0002Wv-Mi
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 15:59:01 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65ed00a8-7cbd-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 16:58:59 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40842752c6eso35687795e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 07:58:59 -0800 (PST)
Received: from [10.95.110.31] (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id
 bs14-20020a056000070e00b0032d8eecf901sm10060456wrb.3.2023.11.06.07.58.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 07:58:58 -0800 (PST)
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
X-Inumbo-ID: 65ed00a8-7cbd-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699286339; x=1699891139; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YdRU2ICAmJ5fzVK5A8/S2GOgHKTlNLHwKSHWlkevpuU=;
        b=HWR2JDKQk9tI65PGGeS7k9dQDTKkeMscALgVvv38ax+0lRbZ8DFGwbQnNkMOq2wg+M
         EFQi4W6S2Pk7h2JbQ7EkU2wlmHHbq27Z/WwJWSLTjvQG/mUpgGtUzzGLa1dPeaSSGsBj
         QO8Cft0xWd49qSPjnT+kiQiSbAd/oPRnDYP5x8ulVI/hjoo4HynfVU8FhI0nysqg6rDX
         CVX9s3HZvQDd1QZQMSKB1HW+8y9g2L43dNrUL4lJI0HjQ+zCsmbLd9Xr7cVKit+ckP0F
         diBxHgeDi8bVPrfYoNGrTnGA+xhDqqAkcp4PTND1FCv2s+5bjyl/OjZO4PJzeDUYPYI4
         9iaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699286339; x=1699891139;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdRU2ICAmJ5fzVK5A8/S2GOgHKTlNLHwKSHWlkevpuU=;
        b=IG5QlTYBveA90HSgoK4lUuUvqMdC6K75fB5opnxQ08aJ1L0NwoLYKKwaafngRXhEnT
         s1uqAps43xeSDe123zjincI0j8iAlRw03+nDB6nMn0oe+ONCayj8OCCKZFhytnr6NdIO
         6YXb6D/ZMTSLUNp3H6KU/5x8qCGmIW3hj+jGJ5W1cIjJ2BuV7FE2UG6pShORGFvJOqiz
         A6u1bUltsX+MCqJwCk0kddzNyMaHthWFzK/giwFtcgD/Z8g975tdQ1iI4uWJuuoGfNyt
         7cEy7NiIw1JTgrMyaMXv/afp5tDUuWI2JztSxIKpT/QplJFUdMACf0JZqc1c8Uq9QVMB
         2O+w==
X-Gm-Message-State: AOJu0YytpPc/OTwsnZOd+4jjdqQ8P3Le0+iLjWS9KaSNl4qRwQ937dTV
	rw87rfbQ7qTbnk37JG3hLBM=
X-Google-Smtp-Source: AGHT+IG+oPN1NQBnC7slICVrFKIK+QQJ+pHrO26W48S90buGxRQhChU5XJhSimZD7bEJ7PpCsy+dGA==
X-Received: by 2002:a5d:6051:0:b0:32d:a4c4:f700 with SMTP id j17-20020a5d6051000000b0032da4c4f700mr20821057wrt.38.1699286338898;
        Mon, 06 Nov 2023 07:58:58 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <e2cb5f62-9a32-4ea2-bb34-b551dcb0755c@xen.org>
Date: Mon, 6 Nov 2023 15:58:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v4 06/17] hw/xen: automatically assign device index to
 block devices
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-block@nongnu.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org
References: <20231106143507.1060610-1-dwmw2@infradead.org>
 <20231106143507.1060610-7-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20231106143507.1060610-7-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2023 14:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> There's no need to force the user to assign a vdev. We can automatically
> assign one, starting at xvda and searching until we find the first disk
> name that's unused.
> 
> This means we can now allow '-drive if=xen,file=xxx' to work without an
> explicit separate -driver argument, just like if=virtio.
> 
> Rip out the legacy handling from the xenpv machine, which was scribbling
> over any disks configured by the toolstack, and didn't work with anything
> but raw images.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Acked-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   blockdev.c                          |  15 +++-
>   hw/block/xen-block.c                | 118 ++++++++++++++++++++++++++--
>   hw/xen/xen_devconfig.c              |  28 -------
>   hw/xenpv/xen_machine_pv.c           |   9 ---
>   include/hw/xen/xen-legacy-backend.h |   1 -
>   5 files changed, 125 insertions(+), 46 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


