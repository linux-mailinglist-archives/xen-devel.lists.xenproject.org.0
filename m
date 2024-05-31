Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA308D5F06
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 11:57:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733544.1139861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCz10-0001w3-FV; Fri, 31 May 2024 09:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733544.1139861; Fri, 31 May 2024 09:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCz10-0001tv-Cx; Fri, 31 May 2024 09:57:38 +0000
Received: by outflank-mailman (input) for mailman id 733544;
 Fri, 31 May 2024 09:57:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Umgu=NC=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1sCz0y-0001tl-Ia
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 09:57:36 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3423b2e7-1f34-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 11:57:34 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4211e42e362so19715555e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 02:57:34 -0700 (PDT)
Received: from [192.168.3.251] (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421270697b6sm49927995e9.24.2024.05.31.02.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 02:57:33 -0700 (PDT)
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
X-Inumbo-ID: 3423b2e7-1f34-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717149454; x=1717754254; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uu9NBKSJTgs+S9TqmVtiCE86u3gD06b0P6Ww5JBGrEU=;
        b=YZ82u2wNAwjkmpYEGuI9NaVj1e8puatmRe2rPdujgig2EeYCeJ0angHS3+Pv3ewFkz
         wPpg9weC4rYnvDYp/Uq4o9T8do+W86GlQVt1IwvLfJzhVjOdtP8JkL6iBYt4oFtxtBZU
         4PUlMMhCa3nO99vdt7OFG/ucOXlunyg/Pb2cZMjovMN0iuxq40TIlVch7mWe2gjs4V2E
         HGawfn/fRW8kaY/HS44/FL9q6xikWIG4ijMOh6e834fgBJunU5IDDm/Up8jkDlw26Q+A
         cj6kLDrkOWICRl3Nk3cCG6fJZ4wheCEE9h4Z+kbYwu71FD/48cXAybXhIFDfTG/kD088
         m1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717149454; x=1717754254;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uu9NBKSJTgs+S9TqmVtiCE86u3gD06b0P6Ww5JBGrEU=;
        b=mpdxGwYcDALV3Yi31wqq22bYvr8X/B7GzUE/N4n2i6KBx2bw/r8OlY5V2bNu9cOiHo
         6nmHw1p07Drgqv7ZimY9R/cKpKpg93PGGA9xCG/HakiJ618yMgZI8HB9LIEG9/5AdL0q
         vk1OmuWFY9gKUqS+5te7dsxaAGU/4Umhv/6GR/KC2+Jzbqdue9qD/toYpoZyEhmI5ssV
         cxw2AVQMlth9yasTPnwTjhJ6KQwZbQvIsTGB8Yw6LeF2G0MrXm3AedgV7hKHknH0oqXC
         P9CH03if24xAlRml8IgAJ3UxN1MElxiWzqD1ff7gUvkjv6DFvStFczzgRzLXIoOCQN8p
         EgBg==
X-Forwarded-Encrypted: i=1; AJvYcCVEwSLPXAtD+AvRYVwDz5a4Ft06cfauDv46GI0fVcbDEpZpzwmW9PnsyVBN54hV990621p4Mh/TpbVpDa/7NG+iRbYFCKf+Oq29+T1LJYg=
X-Gm-Message-State: AOJu0YxSzlHp1CjLNlMQvqMoISBowRm0/6bJKknIziH4T3XFnaqSilMa
	zLKbMwZzVXIMLGTDlOBWXPwHW8ItpegEZL3VylW+9lRyAzQUknXf
X-Google-Smtp-Source: AGHT+IHf4eM0iKAXjhQyPe69MDAOzotT91YOZAZUcca/8FhBKouvh0wHz3U7tpeuUdH7yKkwcX0cHQ==
X-Received: by 2002:a05:600c:3547:b0:416:bc18:2a00 with SMTP id 5b1f17b1804b1-4212e0b5066mr12944045e9.38.1717149453760;
        Fri, 31 May 2024 02:57:33 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <660203c1-b6d9-4978-8336-1988247fd543@xen.org>
Date: Fri, 31 May 2024 10:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 6/7] hw/xen: register legacy backends via
 xen_backend_init
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20240510104908.76908-1-philmd@linaro.org>
 <20240510104908.76908-7-philmd@linaro.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20240510104908.76908-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/05/2024 11:49, Philippe Mathieu-Daudé wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> It is okay to register legacy backends in the middle of xen_bus_init().
> All that the registration does is record the existence of the backend
> in xenstore.
> 
> This makes it possible to remove them from the build without introducing
> undefined symbols in xen_be_init().  It also removes the need for the
> backend_register callback, whose only purpose is to avoid registering
> nonfunctional backends.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-ID: <20240509170044.190795-8-pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/xen/xen-legacy-backend.h | 11 ++---------
>   include/hw/xen/xen_pvdev.h          |  1 -
>   hw/9pfs/xen-9p-backend.c            |  8 +++++++-
>   hw/display/xenfb.c                  |  8 +++++++-
>   hw/usb/xen-usb.c                    | 14 ++++----------
>   hw/xen/xen-legacy-backend.c         | 16 ----------------
>   6 files changed, 20 insertions(+), 38 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


