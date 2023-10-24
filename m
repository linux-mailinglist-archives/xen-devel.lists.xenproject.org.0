Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D66877D56D1
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 17:44:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622135.969392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvJZj-00027T-9V; Tue, 24 Oct 2023 15:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622135.969392; Tue, 24 Oct 2023 15:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvJZj-00024F-5L; Tue, 24 Oct 2023 15:44:11 +0000
Received: by outflank-mailman (input) for mailman id 622135;
 Tue, 24 Oct 2023 15:44:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvJZh-00023O-QM
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 15:44:09 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b68c6d8-7284-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 17:44:08 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-32da9ef390fso3135504f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 08:44:08 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a5d550e000000b0032d9caeab0fsm10133987wrv.77.2023.10.24.08.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 08:44:07 -0700 (PDT)
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
X-Inumbo-ID: 2b68c6d8-7284-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698162248; x=1698767048; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yS5KTEoFqSeFaD9KDbOtnwK71r/T1IzAy2dMzIuLI5s=;
        b=UCBhpEMymx4rBEjQ6e3X6tqH7hVNUU/WkdXqP4ZXEQgTSpPppWXS/adC20Y3t0IR+x
         TabSI3z81DHa2EFWU86Oqi4/+cF7uYHIdxlByrzJMVj6OR9YlzAe9VZTm0Zl8BtxVG4E
         jPmFf3IyFwyCZmaQp+AmSQo3NnGaoOZfR4J0v6dC2/Pse9ypuEAC66CQq+vVQn5DTSvs
         9WWaJIbiVDPVzda8LurRgfGrZ+dKSPLyK9QXfeYFX3gCbm2v8bbZkX+saPYYzRjmjK4V
         Zz4ugEVB+1cQ1pmBexCZASTSizSJ6YSKkBmXdHLGUtTHcCDujjzQ9fVNq8WGY8EfloMZ
         mjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698162248; x=1698767048;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yS5KTEoFqSeFaD9KDbOtnwK71r/T1IzAy2dMzIuLI5s=;
        b=sCxdX/9B1apbCk0h9xoKVr9JYQ9sac4bFaMV6BJSv0r1f+QNquF9/5Pj+gV3gciwGz
         u4JHvZzXnimV7xHpBNKv1lHpubu6SkoyOf1cyqBUx/FZK6hSwdXrIh4vpJOct13LER6t
         bWtRVc0rRwwnOdUTSsh6HSlIf51rrJMmKpepGvx/9IS1FxJNAVCYXCxOMPyFGeHFEQxR
         KvMECoaywDlhcafUnr5fq0y9VDU70kIdyV0FkS3iNOsC3JtWBymPNNBGLx9fb6g+CIkI
         upLV7pcl2bn6ehfU7rwuHGYjpvMp9E+YjLRiP71ZHcF8Htz9sgvMBAe+Wkxps4Oufy7O
         s11w==
X-Gm-Message-State: AOJu0YxfNUa0pI8pNAcYsNBJismSqlQJtpvgev6iTU/N9uFAPSPLW2nk
	IgdiqtQjjp3He0BCW8sGXEE=
X-Google-Smtp-Source: AGHT+IGOdFp+c3H/OzmD6auBGTwD1zTQ8nmXRdo9qvd7R6YRSUetpKZX659Ae1VnlHjErrywnw2Ypg==
X-Received: by 2002:a5d:560d:0:b0:32d:d756:2cd3 with SMTP id l13-20020a5d560d000000b0032dd7562cd3mr8359004wrv.22.1698162247852;
        Tue, 24 Oct 2023 08:44:07 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <8ba01df3-6189-4e1e-a70f-37a2d4dd21ed@xen.org>
Date: Tue, 24 Oct 2023 16:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 16/24] hw/xen: handle soft reset for primary console
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
 <20231019154020.99080-17-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20231019154020.99080-17-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/10/2023 16:40, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> On soft reset, the prinary console event channel needs to be rebound to
> the backend port (in the xen-console driver). We could put that into the
> xen-console driver itself, but it's slightly less ugly to keep it within
> the KVM/Xen code, by stashing the backend port# on event channel reset
> and then rebinding in the primary console reset when it has to recreate
> the guest port anyway.

Does Xen re-bind the primary console on EVTCHNOP_reset? That's news to 
me. I go check.

   Paul

> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c          |  9 +++++++++
>   hw/i386/kvm/xen_primary_console.c | 29 ++++++++++++++++++++++++++++-
>   hw/i386/kvm/xen_primary_console.h |  1 +
>   3 files changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
> index d72dca6591..ce4da6d37a 100644
> --- a/hw/i386/kvm/xen_evtchn.c
> +++ b/hw/i386/kvm/xen_evtchn.c
> @@ -40,6 +40,7 @@
>   #include "xen_evtchn.h"
>   #include "xen_overlay.h"
>   #include "xen_xenstore.h"
> +#include "xen_primary_console.h"
>   
>   #include "sysemu/kvm.h"
>   #include "sysemu/kvm_xen.h"
> @@ -1098,6 +1099,7 @@ int xen_evtchn_soft_reset(void)
>   {
>       XenEvtchnState *s = xen_evtchn_singleton;
>       bool flush_kvm_routes;
> +    uint16_t con_port = xen_primary_console_get_port();
>       int i;
>   
>       if (!s) {
> @@ -1108,6 +1110,13 @@ int xen_evtchn_soft_reset(void)
>   
>       qemu_mutex_lock(&s->port_lock);
>   
> +    if (con_port) {
> +        XenEvtchnPort *p = &s->port_table[con_port];
> +        if (p->type == EVTCHNSTAT_interdomain) {
> +            xen_primary_console_set_be_port(p->u.interdomain.port);
> +        }
> +    }
> +
>       for (i = 0; i < s->nr_ports; i++) {
>           close_port(s, i, &flush_kvm_routes);
>       }
> diff --git a/hw/i386/kvm/xen_primary_console.c b/hw/i386/kvm/xen_primary_console.c
> index 0aa1c16ad6..5e6e085ac7 100644
> --- a/hw/i386/kvm/xen_primary_console.c
> +++ b/hw/i386/kvm/xen_primary_console.c
> @@ -112,6 +112,15 @@ uint16_t xen_primary_console_get_port(void)
>       return s->guest_port;
>   }
>   
> +void xen_primary_console_set_be_port(uint16_t port)
> +{
> +    XenPrimaryConsoleState *s = xen_primary_console_singleton;
> +    if (s) {
> +        printf("be port set to %d\n", port);
> +        s->be_port = port;
> +    }
> +}
> +
>   uint64_t xen_primary_console_get_pfn(void)
>   {
>       XenPrimaryConsoleState *s = xen_primary_console_singleton;
> @@ -142,6 +151,20 @@ static void alloc_guest_port(XenPrimaryConsoleState *s)
>       }
>   }
>   
> +static void rebind_guest_port(XenPrimaryConsoleState *s)
> +{
> +    struct evtchn_bind_interdomain inter = {
> +        .remote_dom = DOMID_QEMU,
> +        .remote_port = s->be_port,
> +    };
> +
> +    if (!xen_evtchn_bind_interdomain_op(&inter)) {
> +        s->guest_port = inter.local_port;
> +    }
> +
> +    s->be_port = 0;
> +}
> +
>   int xen_primary_console_reset(void)
>   {
>       XenPrimaryConsoleState *s = xen_primary_console_singleton;
> @@ -154,7 +177,11 @@ int xen_primary_console_reset(void)
>           xen_overlay_do_map_page(&s->console_page, gpa);
>       }
>   
> -    alloc_guest_port(s);
> +    if (s->be_port) {
> +        rebind_guest_port(s);
> +    } else {
> +        alloc_guest_port(s);
> +    }
>   
>       trace_xen_primary_console_reset(s->guest_port);
>   
> diff --git a/hw/i386/kvm/xen_primary_console.h b/hw/i386/kvm/xen_primary_console.h
> index dd4922f3f4..7e2989ea0d 100644
> --- a/hw/i386/kvm/xen_primary_console.h
> +++ b/hw/i386/kvm/xen_primary_console.h
> @@ -16,6 +16,7 @@ void xen_primary_console_create(void);
>   int xen_primary_console_reset(void);
>   
>   uint16_t xen_primary_console_get_port(void);
> +void xen_primary_console_set_be_port(uint16_t port);
>   uint64_t xen_primary_console_get_pfn(void);
>   void *xen_primary_console_get_map(void);
>   


