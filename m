Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD2D8D5F1D
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 11:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733547.1139872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCz2h-0002WA-QY; Fri, 31 May 2024 09:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733547.1139872; Fri, 31 May 2024 09:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCz2h-0002TT-NL; Fri, 31 May 2024 09:59:23 +0000
Received: by outflank-mailman (input) for mailman id 733547;
 Fri, 31 May 2024 09:59:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Umgu=NC=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1sCz2f-0002TL-Qq
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 09:59:21 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 736b0d27-1f34-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 11:59:20 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-421124a04d6so19730785e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 02:59:20 -0700 (PDT)
Received: from [192.168.3.251] (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212b84ba40sm20025015e9.19.2024.05.31.02.59.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 02:59:19 -0700 (PDT)
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
X-Inumbo-ID: 736b0d27-1f34-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717149560; x=1717754360; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NWtVkOLDgF1rKwf3NbyJWvRkovccoP5yn6Z5++pjXzA=;
        b=NEe1LlvLvp8PqCHz0BRqviwU5Apul6r/Cz3BXaFPcAg0WXZltz8M62FxvUGbRx69mo
         gBDMRjYZ+mjwUakjG7e7dOmZGQp08VB2gFs4VktFB7DBPq41rrbffUj1XU0zXhg8rqU+
         Qbv/G5mcn/H7N6SVDCTPihku0JzDi0wbw2omhQhXqCLge7j3hwI79fuo8iG+ww7D6pnS
         oqvb18BP5Bdp0BTLZcGDkphN4zmBzVMNH1kx59tU2T1TsPGeQqeXSKeYh5RAVWA61o4c
         ur4Gq4K4TAh6QJGPiR12dKSm0M2jRsp6wsIi+oO4Iw8FZtSBS6XulDW+ynmSgyvWLhsP
         +eiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717149560; x=1717754360;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWtVkOLDgF1rKwf3NbyJWvRkovccoP5yn6Z5++pjXzA=;
        b=qMeQf4cUHTW/0KmvI0XT8+tNkcIs2cPrG+mWzK/JtqYpByjKQ3UHiZq3gE0P0p39Ri
         V23ppvUnFCEyzXbR3AfUltPM/Jl31NdI9dBsOOoQfRsCmqdEXMRk/obkHmg+iySc6lAN
         pV+/FPXiNfWkY3yJCmTyZ9YfsnKSZTE3MTq/Thm2ni8uyKF204p0Wlhvk9xso99Ibaxu
         J3IfLYcLUTDJ+sm6cN3O1c3YwBugsUwWh9VH/E9fp03WlCytpmCBO8/jXUYKXZdjPpYm
         gikpd8ApnsDARAOB05VzraGX0lUMKO0DqVrVpdeGC6WxO+OLa9nFn/O4Wm2BzpurqbJL
         CKQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnEsJ4Qm2BU+pZC5Sfshkux+oygktxJaAFQEjEI3+K2wODwc95VmCyYIXevpmeFbOBIxuMkQVsvGFR9qebedfvcShu5Xqd3UI0jJeMiWE=
X-Gm-Message-State: AOJu0YwNBGaEYdCj3kdbYO9aKK8+jn1aeuAwnk+rF7Fyttb9qiYhCFWz
	1DpjKjK433f0KfkxSOOSqIOAsQFYJhgGJuNDxFvEs7Yn2gZCQrYZ
X-Google-Smtp-Source: AGHT+IFV51hSYt8NK9PiJAKTrsoXn7LryxkGS6g5ElhZz8ENQt9V721ZCsqMK+nfys/TO6a5gG7gkg==
X-Received: by 2002:a05:600c:4e15:b0:41f:f053:edb4 with SMTP id 5b1f17b1804b1-4212e076511mr9570605e9.23.1717149560202;
        Fri, 31 May 2024 02:59:20 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <0fe5773f-1524-4a9d-bdd8-606b18b4ced4@xen.org>
Date: Fri, 31 May 2024 10:59:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 7/7] hw/xen: Register framebuffer backend via
 xen_backend_init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20240510104908.76908-1-philmd@linaro.org>
 <20240510104908.76908-8-philmd@linaro.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20240510104908.76908-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/05/2024 11:49, Philippe Mathieu-Daudé wrote:
> Align the framebuffer backend with the other legacy ones,
> register it via xen_backend_init() when '-vga xenfb' is
> used. It is safe because MODULE_INIT_XEN_BACKEND is called
> in xen_bus_realize(), long after CLI processing initialized
> the vga_interface_type variable.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/xen/xen-legacy-backend.h | 3 ---
>   hw/display/xenfb.c                  | 9 +++++++--
>   hw/xenpv/xen_machine_pv.c           | 2 --
>   3 files changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


