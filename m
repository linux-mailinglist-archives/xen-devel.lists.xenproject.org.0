Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659777D55A5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 17:19:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622106.969311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvJBm-000681-IT; Tue, 24 Oct 2023 15:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622106.969311; Tue, 24 Oct 2023 15:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvJBm-00065B-Es; Tue, 24 Oct 2023 15:19:26 +0000
Received: by outflank-mailman (input) for mailman id 622106;
 Tue, 24 Oct 2023 15:19:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvJBk-000651-Rk
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 15:19:24 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5d9273e-7280-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 17:19:22 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso3120903f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 08:19:22 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a5d4001000000b0032dc1fc84f2sm10223557wrp.46.2023.10.24.08.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 08:19:21 -0700 (PDT)
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
X-Inumbo-ID: b5d9273e-7280-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698160762; x=1698765562; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VEfz8HGhwcX+gjgFcsp72jn1Jb62YijVFIO7IeDxV9U=;
        b=gzX4MnlMYRTGSdSFTiRZAUBwP5YXiAo/fwgxs1OfSeIdTCv3gIcJ3LOPJDaYAItyEJ
         qiMLLhUm3TE02b4cghGG8wsNVbR6uD82BjGeNOo8zcXKBkdQlIx0Q8bTfo2AlWyZrvWh
         cQs7IQznLxr3Ki5S7KKbHplBLZ8f1TFqO2ZHKWCU47Boz+1J4v1jF536lpN0LA/WcMwY
         RwGN8c77QSjEyXgyzuypnIUPrn4Wy21ARHMdLVi9EsVWAmIpmwbyb/6vcKw8AzjtfPpY
         myisplTaocMnZzdpLbd+QbsXcwk/9mKX67o0NOvBr79o57YY8Vr4x3IR0JUHSRyvzjQr
         uzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698160762; x=1698765562;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEfz8HGhwcX+gjgFcsp72jn1Jb62YijVFIO7IeDxV9U=;
        b=R2TYZm8wX8K84uCkvopAvJ30jVm3WzPZUiqf3vovck8/wShvrRQVJLsN/Jo5+h5vG5
         99KJ4zDqAFbqH9yZ/u42PPvxnH1LQlWmmZ6+H2eMixDtbAl0keZtffsLRVOdCE5b0U3y
         8Mca2bw4AdTqZoSrJDbBY4G5uKeY57ftdFkHqYD87x0WQlxQouFlamQTL29hyCfrcAJN
         6/9MD3X3wpe81BXsu6FAPaUChPvCMRThBbAyw+D/TBVgt7K5M2APa3WxzOrDhtjQGX37
         E0akHdbi1U5B9yofDjJ34v7jb3cSuH5rtMdi0kE1K9Qfd2Xk9wEju5oGW/tbi/ep3KF6
         ABwQ==
X-Gm-Message-State: AOJu0Yxm5ryP3ouUMra6+tp1GScMqptPZVehS372FHEUlkNmOerGgqw0
	ZGqh+0RFqMgrat+R5qCpC/o=
X-Google-Smtp-Source: AGHT+IFftEtEWBlIWSE4+gB3PiSf+ybDx5RYYWCq9oIN1LDrIU9iRO6mz1Q4jl+RB/Bs7pJY5A6gBQ==
X-Received: by 2002:adf:ef42:0:b0:32d:aa14:875d with SMTP id c2-20020adfef42000000b0032daa14875dmr9015766wrp.29.1698160762122;
        Tue, 24 Oct 2023 08:19:22 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <88ce2b55-c933-4c72-933f-c8cd10470c7f@xen.org>
Date: Tue, 24 Oct 2023 16:19:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 05/24] hw/xen: fix XenStore watch delivery to guest
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Bernhard Beschow <shentey@gmail.com>, Joel Upham <jupham125@gmail.com>
References: <20231019154020.99080-1-dwmw2@infradead.org>
 <20231019154020.99080-6-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20231019154020.99080-6-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/10/2023 16:40, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> When fire_watch_cb() found the response buffer empty, it would call
> deliver_watch() to generate the XS_WATCH_EVENT message in the response
> buffer and send an event channel notification to the guest… without
> actually *copying* the response buffer into the ring. So there was
> nothing for the guest to see. The pending response didn't actually get
> processed into the ring until the guest next triggered some activity
> from its side.
> 
> Add the missing call to put_rsp().
> 
> It might have been slightly nicer to call xen_xenstore_event() here,
> which would *almost* have worked. Except for the fact that it calls
> xen_be_evtchn_pending() to check that it really does have an event
> pending (and clear the eventfd for next time). And under Xen it's
> defined that setting that fd to O_NONBLOCK isn't guaranteed to work,
> so the emu implementation follows suit.
> 
> This fixes Xen device hot-unplug.
> 
> Fixes: 0254c4d19df ("hw/xen: Add xenstore wire implementation and implementation stubs")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_xenstore.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
> index 660d0b72f9..82a215058a 100644
> --- a/hw/i386/kvm/xen_xenstore.c
> +++ b/hw/i386/kvm/xen_xenstore.c
> @@ -1357,10 +1357,12 @@ static void fire_watch_cb(void *opaque, const char *path, const char *token)
>       } else {
>           deliver_watch(s, path, token);
>           /*
> -         * If the message was queued because there was already ring activity,
> -         * no need to wake the guest. But if not, we need to send the evtchn.
> +         * Attempt to queue the message into the actual ring, and send
> +         * the event channel notification if any bytes are copied.
>            */
> -        xen_be_evtchn_notify(s->eh, s->be_port);
> +        if (put_rsp(s) > 0) {
> +            xen_be_evtchn_notify(s->eh, s->be_port);
> +        }

There's actually the potential for an assertion failure there; if the 
guest has specified an oversize token then deliver_watch() will not set 
rsp_pending... then put_rsp() will fail its assertion that the flag is true.

   Paul

>       }
>   }
>   


