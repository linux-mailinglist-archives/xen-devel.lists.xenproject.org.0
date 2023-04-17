Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 161DF6E47C6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 14:30:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522060.811212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poO07-0005jQ-1P; Mon, 17 Apr 2023 12:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522060.811212; Mon, 17 Apr 2023 12:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poO06-0005he-TT; Mon, 17 Apr 2023 12:30:30 +0000
Received: by outflank-mailman (input) for mailman id 522060;
 Mon, 17 Apr 2023 12:30:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=be8F=AI=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1poO05-0004j0-Kc
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 12:30:29 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2944436-dd1b-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 14:30:28 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 eo6-20020a05600c82c600b003ee5157346cso15416986wmb.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 05:30:28 -0700 (PDT)
Received: from [192.168.0.165] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c3b8600b003f173a2b2f6sm2802937wms.12.2023.04.17.05.30.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 05:30:26 -0700 (PDT)
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
X-Inumbo-ID: a2944436-dd1b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681734627; x=1684326627;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sOoY5WTG+InyofH4KHUoATfgAaPfNyAeXdK/e766al0=;
        b=f8522ysrl1IfSEB7/siDCOfEDKk/w/Do6Pgobux024FweSGC0QGYT10SBjf1VPso14
         utEY3jq0+lwGGGGvyw55J5wcn+t/pJu3jNlxravd31EZKNoPv7htBNkOECKCynWT+jHK
         xYjLRgI9Zx1zpxWbFB1HBwMH5bhPZNchVD3zVA7ADjuDHuxsumT1/czYS0eOktteISoN
         dl+Pap8Ihk9qzhrQ93ZrFA8NDYnTlGzfM2GAqnrSk6HPkT3NxdmyUGME2LhLbv6DZg9w
         nhHSrclBAjVRkd7ceyoXfa34gJHoABQ2gQ3EgvIL4UyDDh/NWJDCPg4F3AC6+DzsCN9Y
         mY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681734627; x=1684326627;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOoY5WTG+InyofH4KHUoATfgAaPfNyAeXdK/e766al0=;
        b=lcFXOZ+j9MzlosR2ytwWYrfxIiejRDnjP3qcg1InrrHGBvlTZFlVLu1go4aXdERuKR
         Ijg0uVFnhkUq1nIZ6p1bsjORHwv9iHQ2qpuT9CqVxLgYReIdb44TIgLMdVTHsE53MtxD
         FfkdgdeYkH0xJ76PGhpjgpjtuI9wD8S78M3TxGOqFcYR39vZ4YSQxCzpOC1DHXh/yKbU
         IDUjc++FVjVF+Svd+2BGkWiocBJolYmdhhuB5o/9oFeUYRFwyhgsgVmafKhBoB6x5tTV
         Z8ILBIRbHHKgKJ0q7A3gteqKs0sI9ht9/MzXN6g8t/LunXfnhWOrCwvGQdAm0sKJUZ+i
         UgWA==
X-Gm-Message-State: AAQBX9fyZpoZjSbJAU/XH5q1fOdPLZDfrF2ozuTuOFvUji+ctoV2CljX
	/kXNYi9e+7MfSqMGHvplB4A=
X-Google-Smtp-Source: AKy350ZCWY+iLGD9Fyd2GzYGRLSxota9WngBMMlDXO/QahTk7nhjmJvBA6V5jWeqLAnMpj4K2y9GTA==
X-Received: by 2002:a1c:e90d:0:b0:3eb:42fa:39d5 with SMTP id q13-20020a1ce90d000000b003eb42fa39d5mr10451882wmc.29.1681734627479;
        Mon, 17 Apr 2023 05:30:27 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <79aefe17-be48-2be9-7c3e-12056f5f2819@xen.org>
Date: Mon, 17 Apr 2023 13:30:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Reply-To: paul@xen.org
Subject: Re: [PATCH 3/5] xen: Drop support for Xen versions below 4.7.1
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: no Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, xen-devel@lists.xenproject.org
References: <20230412185102.441523-1-dwmw2@infradead.org>
 <20230412185102.441523-4-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230412185102.441523-4-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/04/2023 19:51, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> In restructuring to allow for internal emulation of Xen functionality,
> I broke compatibility for Xen 4.6 and earlier. Fix this by explicitly
> removing support for anything older than 4.7.1, which is also ancient
> but it does still build, and the compatibility support for it is fairly
> unintrusive.
> 
> Fixes: 15e283c5b684 ("hw/xen: Add foreignmem operations to allow redirection to internal emulation")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/xen/xen-operations.c     |  57 +------------------
>   include/hw/xen/xen_native.h | 107 +-----------------------------------
>   meson.build                 |   5 +-
>   scripts/xen-detect.c        |  60 --------------------
>   4 files changed, 3 insertions(+), 226 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


