Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E93257D549C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 17:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622093.969270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIvn-0006xo-C5; Tue, 24 Oct 2023 15:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622093.969270; Tue, 24 Oct 2023 15:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIvn-0006vz-9P; Tue, 24 Oct 2023 15:02:55 +0000
Received: by outflank-mailman (input) for mailman id 622093;
 Tue, 24 Oct 2023 15:02:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvIvm-0006vt-Lv
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 15:02:54 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6844bce7-727e-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 17:02:53 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-507a0907896so6819577e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 08:02:53 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a056000128500b0031c6581d55esm10091262wrx.91.2023.10.24.08.02.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 08:02:52 -0700 (PDT)
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
X-Inumbo-ID: 6844bce7-727e-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698159773; x=1698764573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CgHp0CJaaQlW610O/NVGeBqWOSNojjcDIIfF8qOnyh8=;
        b=OHbcs4UinNYdkRloBoka+V4wp6p744makUOwZr6sXNTFh3jIxjTJw5fmB5JQlav5mK
         2V5N1vGJPxSWm4qZcRBFjMMax3zoVA3VtI85VdiEjGg1djsy+f/ahETdXcFiTPIdnVf1
         ZQKxMzHQSBHt/bMo8f1lU5PyJ8gWkrmWFY/4gxuE1j0ZGU1i+TmD+1bVtRr1o008FMB7
         1x2VXNZjOIt8cGSVcBUHSNRlhcbcsONVOLz1I6c0yAHpdovUrSX42utL7+gRzZ6Y6rQH
         Gk3L3gFxp8enmDbRk6J2Hfn+v0jboK/6R9cVA5GcxrGKJ1TFlLgsOOu/6kC7nJWq9spP
         vjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698159773; x=1698764573;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgHp0CJaaQlW610O/NVGeBqWOSNojjcDIIfF8qOnyh8=;
        b=bUnS7csRfQoFgoE9+zH+7IeOINu+4/Ysq8NjYDzV+azBfrS6MYhhvBk+d9ydnt4ZEh
         utImwzydB6Gth3NFlsWNQsh8202EzVtcCZoMxBPnjYHVmBBB215NCDoZUx98OdBr+Hpd
         3wYwCEj5lqIdG4wPOzrRmuIFewtDJiMW8G60dXIr4iZOixYNjF8gQryUgkvjuphMnD+Q
         aixqUQlOEGz/NoUtYNV/8rrJuf/7qUoe/ELf/8RO6eyEsP4VgYsz84gALvsz2RQEOXZx
         RhOV2uGmx2IZFEIbQ/Y9obZIuF0hkdxLQik8NYrbZk9iZTec5aW/dCRqmchW2BjuxN/m
         c81g==
X-Gm-Message-State: AOJu0Yx2Aire8KlUmwV18RDyP54TMiwuo8ITG9LThCgQlPQFpBerCsiO
	mWaTeAgCqSvn+M/kXg/kwpU=
X-Google-Smtp-Source: AGHT+IH9T45ADuXoRcFMFSb5Oytx69M3MV46mrRNCIVJ622Q0DyMPbV1Z877betPlfNUrQXWzUmZCw==
X-Received: by 2002:a05:6512:3b8e:b0:502:ffdf:b098 with SMTP id g14-20020a0565123b8e00b00502ffdfb098mr11070376lfv.6.1698159772803;
        Tue, 24 Oct 2023 08:02:52 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <bd55f12a-1a01-40fb-a61a-dd5ddbd58557@xen.org>
Date: Tue, 24 Oct 2023 16:02:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 03/24] hw/xen: select kernel mode for per-vCPU event
 channel upcall vector
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
 <20231019154020.99080-4-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20231019154020.99080-4-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/10/2023 16:39, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> A guest which has configured the per-vCPU upcall vector may set the
> HVM_PARAM_CALLBACK_IRQ param to fairly much anything other than zero.
> 
> For example, Linux v6.0+ after commit b1c3497e604 ("x86/xen: Add support
> for HVMOP_set_evtchn_upcall_vector") will just do this after setting the
> vector:
> 
>         /* Trick toolstack to think we are enlightened. */
>         if (!cpu)
>                 rc = xen_set_callback_via(1);
> 
> That's explicitly setting the delivery to GSI#1, but it's supposed to be
> overridden by the per-vCPU vector setting. This mostly works in Qemu
> *except* for the logic to enable the in-kernel handling of event channels,
> which falsely determines that the kernel cannot accelerate GSI delivery
> in this case.
> 
> Add a kvm_xen_has_vcpu_callback_vector() to report whether vCPU#0 has
> the vector set, and use that in xen_evtchn_set_callback_param() to
> enable the kernel acceleration features even when the param *appears*
> to be set to target a GSI.
> 
> Preserve the Xen behaviour that when HVM_PARAM_CALLBACK_IRQ is set to
> *zero* the event channel delivery is disabled completely. (Which is
> what that bizarre guest behaviour is working round in the first place.)
> 
> Fixes: 91cce756179 ("hw/xen: Add xen_evtchn device for event channel emulation")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c  | 6 ++++++
>   include/sysemu/kvm_xen.h  | 1 +
>   target/i386/kvm/xen-emu.c | 7 +++++++
>   3 files changed, 14 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


