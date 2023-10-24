Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A36097D5013
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 14:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621912.968822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGjm-0000LV-O2; Tue, 24 Oct 2023 12:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621912.968822; Tue, 24 Oct 2023 12:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGjm-0000Ho-KZ; Tue, 24 Oct 2023 12:42:22 +0000
Received: by outflank-mailman (input) for mailman id 621912;
 Tue, 24 Oct 2023 12:42:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvGjk-0000Hi-T8
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 12:42:20 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c506ba92-726a-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 14:42:19 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c50906f941so67157371fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 05:42:19 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c320900b0040644e699a0sm16610990wmp.45.2023.10.24.05.42.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 05:42:18 -0700 (PDT)
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
X-Inumbo-ID: c506ba92-726a-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698151339; x=1698756139; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nleuh30f60jeiNJDPgerM6LHIyJSmfHjZNXbgUudLV0=;
        b=J+KhTXtYUAONI9Z0DJyu2BI0aZUj74/sIDXsfFj5JwZjOdLrWQR+zYFDXlbQFlbFRY
         U5XGQaUcuxEP28d17kRst9kLIfg27LCJMgxM6zMaAEfKjiW1k/snl4zP7bRpQvepOt9y
         1teDJbHVc/GV/gljzNSCMx42+/gJe35FvpF6kCAEFW502z8qjcxe1rdA5jzpNl8BHIHW
         X4wTBaW6oUH8la920D98sK5N0Oi5oeDsdtqO4d9taM/Kz3TWvAMZcMldp7+n42zWcKhH
         gB4dOyRVUDzhfZZf53764GWa+S7P26R3xM61+e2mX5UZT6e16KI5prXRhHhHPqEzZHfm
         htnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698151339; x=1698756139;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nleuh30f60jeiNJDPgerM6LHIyJSmfHjZNXbgUudLV0=;
        b=VTAH7lGbxDJGEtyd/1a5zUk9EgoQSE8xnfWjmRyVDB66wSMZnoo4FVSBcjaIsmQWsC
         HjAqMhKF86HYUMNB9C+ZmYQ2ubE9LjeE4IUQK6NxcK8BF3SIXY5J+JDc2O4R5Q4jnL8H
         jOJe1RLCCK46b3H15KIsHAdGyqxp4c21GgiQhVJ6eDmUkIh4kKDtL9Mhbk8868+NSG6l
         J5rrzF0yZsRCm+kqOpjyEncrRG1JCvDpcZ+dbnEDPKPJEzq5tmhxu8/5xYUpQe9xZloH
         zq6l2qPl4c22n8jhqZAKqcp8l4VrUG5GaxMP4Dctj1WiX1NgIWsvPTsv0177W5ChI85l
         QHRw==
X-Gm-Message-State: AOJu0Yxe8hDEJZ3/VFCNjHaJ1GtGlUXFFaeejGCSsNiRnbrYmw2KwomD
	GcEmlqB2xcuOKedy549F/z4=
X-Google-Smtp-Source: AGHT+IG7xfJEIBpaao1AVHuot+7nF+K9gT+jAPeV2BLTz6q/or9dTrt+5Pf96dJ2k8c2f9XmlagJlQ==
X-Received: by 2002:a2e:aa28:0:b0:2be:54b4:ff90 with SMTP id bf40-20020a2eaa28000000b002be54b4ff90mr7826766ljb.53.1698151339104;
        Tue, 24 Oct 2023 05:42:19 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <5ef43a7c-e535-496d-8a14-bccbadab3bc0@xen.org>
Date: Tue, 24 Oct 2023 13:42:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 06/12] hw/xen: add get_frontend_path() method to
 XenDeviceClass
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org
References: <20231016151909.22133-1-dwmw2@infradead.org>
 <20231016151909.22133-7-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20231016151909.22133-7-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/10/2023 16:19, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The primary Xen console is special. The guest's side is set up for it by
> the toolstack automatically and not by the standard PV init sequence.
> 
> Accordingly, its *frontend* doesn't appear in …/device/console/0 either;
> instead it appears under …/console in the guest's XenStore node.
> 
> To allow the Xen console driver to override the frontend path for the
> primary console, add a method to the XenDeviceClass which can be used
> instead of the standard xen_device_get_frontend_path()
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/xen/xen-bus.c         | 10 +++++++++-
>   include/hw/xen/xen-bus.h |  2 ++
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
> index ece8ec40cd..cc524ed92c 100644
> --- a/hw/xen/xen-bus.c
> +++ b/hw/xen/xen-bus.c
> @@ -711,8 +711,16 @@ static void xen_device_frontend_create(XenDevice *xendev, Error **errp)
>   {
>       ERRP_GUARD();
>       XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
> +    XenDeviceClass *xendev_class = XEN_DEVICE_GET_CLASS(xendev);
>   
> -    xendev->frontend_path = xen_device_get_frontend_path(xendev);
> +    if (xendev_class->get_frontend_path) {
> +        xendev->frontend_path = xendev_class->get_frontend_path(xendev, errp);
> +        if (!xendev->frontend_path) {
> +            return;

I think you need to update errp here to note that you are failing to 
create the frontend.

   Paul



