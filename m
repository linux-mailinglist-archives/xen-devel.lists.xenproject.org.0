Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 835947D9347
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 11:15:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624288.972732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwISN-0001PJ-Mv; Fri, 27 Oct 2023 08:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624288.972732; Fri, 27 Oct 2023 08:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwISN-0001Ly-Jc; Fri, 27 Oct 2023 08:44:39 +0000
Received: by outflank-mailman (input) for mailman id 624288;
 Fri, 27 Oct 2023 08:44:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEfT=GJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qwISM-0001GX-1M
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 08:44:38 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e77e766-74a5-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 10:44:35 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507e85ebf50so2472410e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 01:44:36 -0700 (PDT)
Received: from [192.168.10.177] (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a5d6704000000b0032dde679398sm1276365wru.8.2023.10.27.01.44.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 01:44:35 -0700 (PDT)
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
X-Inumbo-ID: 0e77e766-74a5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698396276; x=1699001076; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tNlTPL/h1q0gctttAApwRF+1wbJdOYFnWGSZhWSB3FY=;
        b=lDJn4TIsGac7/9FguS4058xlSQ4KoI1EV0esQFHRVnmfkHs71FPaYLWBjlttCbZKfZ
         J/yo6DLnXqSYRU9oaG6wrIxdTALW7rjjX38PGb24kmQwrmPPZ7bTfJVfc83Ua6b623D7
         vYRk0HasR0TZfjiib0X0tCbjj6ipxozhKtisPwmY9Py2azwfyWPuU2kxf++M16qCK1PH
         XoB0tHbRd697YlNjjSQ88BrfkKCoIiCpYk1fR7BiJ70V61ygALnU5TQkyWKgzrTBvJ8u
         RFBfKGwhsGsjHajVVWQ//2U5+PG0q7EC4SpjphYGII4usutk+eQ2P9J7oHugojcrvuWS
         jV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698396276; x=1699001076;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNlTPL/h1q0gctttAApwRF+1wbJdOYFnWGSZhWSB3FY=;
        b=E19MLTeM7s022oZQ65zRr9B/s2X6PTAWWb1aHN3c0zHlfLn6DYFRxEwRPi0lnTiShe
         th9AGr19rTpFjgu9/WDZ1u+D6zfQ/5AHmXCzWgw0Fs9PsQ5EM7jafeIQ3h1bcsvOKjvT
         l43x5b1iR7PeSkwKDcrwljP+mtlBi7EDl3cQcugJUgryDOrfMicZ47PBLtmuX0emWez1
         nnPwhH63ffGe7tCVPc+O4Ky8dr6j89PlkB6y5KZeY9U+9iNFSQxE332JhAUDfe64+Lo1
         uyO7wZpX29yzlWYt0xKgGdhzgBSoHaQ1puW5xrOJYGu8ZIQ54mvHaXB+VaL47T9iAxx8
         uZFA==
X-Gm-Message-State: AOJu0YwK/MhIhsG4yW/Y2NvuYoIl5InK3x0wsebZMCKeyP/KMe7cPicV
	KhzfiZIARkmKmlYZKwucwPU=
X-Google-Smtp-Source: AGHT+IGDgLtfXBaR32xR7jkwm7OjIsXKvGrggAwxMX3BfT7FEKsGbWVQFL/Ib+4ohIFSlDse9DRe/w==
X-Received: by 2002:a19:6d03:0:b0:507:c763:27a5 with SMTP id i3-20020a196d03000000b00507c76327a5mr1182175lfc.62.1698396275565;
        Fri, 27 Oct 2023 01:44:35 -0700 (PDT)
Message-ID: <db350375-9bb3-4ae7-bd2b-7bcce9974577@gmail.com>
Date: Fri, 27 Oct 2023 09:44:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 20/28] net: do not delete nics in net_cleanup()
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
 <20231025145042.627381-21-dwmw2@infradead.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20231025145042.627381-21-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/10/2023 15:50, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> In net_cleanup() we only need to delete the netdevs, as those may have
> state which outlives Qemu when it exits, and thus may actually need to
> be cleaned up on exit.
> 
> The nics, on the other hand, are owned by the device which created them.
> Most devices don't bother to clean up on exit because they don't have
> any state which will outlive Qemu... but XenBus devices do need to clean
> up their nodes in XenStore, and do have an exit handler to delete them.
> 
> When the XenBus exit handler destroys the xen-net-device, it attempts
> to delete its nic after net_cleanup() had already done so. And crashes.
> 
> Fix this by only deleting netdevs as we walk the list. As the comment
> notes, we can't use QTAILQ_FOREACH_SAFE() as each deletion may remove
> *multiple* entries, including the "safely" saved 'next' pointer. But
> we can store the *previous* entry, since nics are safe.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   net/net.c | 28 ++++++++++++++++++++++------
>   1 file changed, 22 insertions(+), 6 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


