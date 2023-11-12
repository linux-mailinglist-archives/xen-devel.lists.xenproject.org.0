Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 823CA7E92B4
	for <lists+xen-devel@lfdr.de>; Sun, 12 Nov 2023 21:37:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631216.984256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2HD3-0004bx-4E; Sun, 12 Nov 2023 20:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631216.984256; Sun, 12 Nov 2023 20:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2HD3-0004aF-1U; Sun, 12 Nov 2023 20:37:33 +0000
Received: by outflank-mailman (input) for mailman id 631216;
 Sun, 12 Nov 2023 20:37:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mXgX=GZ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r2HD1-0004a9-BA
 for xen-devel@lists.xenproject.org; Sun, 12 Nov 2023 20:37:31 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c270a02-819b-11ee-9b0e-b553b5be7939;
 Sun, 12 Nov 2023 21:37:29 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40806e4106dso21551145e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 12 Nov 2023 12:37:29 -0800 (PST)
Received: from [192.168.199.91] (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b0040586360a36sm11700180wmb.17.2023.11.12.12.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Nov 2023 12:37:28 -0800 (PST)
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
X-Inumbo-ID: 4c270a02-819b-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699821449; x=1700426249; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=piE5yixx1rUhhuatPeS2Qkl4Lqntg8uWoigQoIXZVfM=;
        b=Z4H2IYNqg5GcDs9ZMuJQPWYCHSiGSxRAluDd46enI4+Amq/RuK2kumjICZmg7jsWP8
         Hp39CyMqZCxmC7uJSSMXEKxQWRyehNHOhEYDSUKnJ7EJv4lfhscdQgjmPbUIZ4CwK8Ui
         q+uPEmg97OmUgq6nQ9zwaTfzj/n45GFwKi9xq+P5e+a4ihg2Z+LmjZzV1MxWrzWyRXSw
         y4KxOQu2zuS7eXwsjpVDu1etSH/mu7HKCEMoMEDSd/oIMawYHCr1B3NJWADly0xtpzkR
         I7RSTKWaYoPdcXlRYJc20JxXIlJFAMkFtMKIZFW3mAor0p4/aWejZmuC70gmAjGrrz5t
         hndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699821449; x=1700426249;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=piE5yixx1rUhhuatPeS2Qkl4Lqntg8uWoigQoIXZVfM=;
        b=LImXaknRaFMr6k3c9/vEsdxlsxdvXn9Px0dSgoDvtjFFNNLi7FcdQIBd05MdSkhKhQ
         OdbVCa4pR8dLip0zHj3I5/KDkRCrkSBPhGxl0EqHjtOW1LLqo7n/R7gL2AChyV1uasbY
         JdDQb/xeW+jWvx+ItiT6jkGJiWjb++UNAOEE+Y7gXRSKVopP0d11/MajRchDdmIsY15p
         yIIdrwYT35hSOJvfKT/ozWL8DA7IvFhrae0MgmYJNXHI/33t4jmYE25ZuUBSyk3n0vIM
         y8VK8UYoov+SfwYhSlBi6ANnFmWXWked6W7ZG8oeU0gV/Hdn+/00q4o99AbpZ1I3la9X
         +3GQ==
X-Gm-Message-State: AOJu0YzU50nNNDFN119EK8xPSK39sdXJm1jLOCnyjkMM17W0LDeJTu+u
	Fe92F/A3uC64M66SaJY77yQ=
X-Google-Smtp-Source: AGHT+IEuwcbyYUDhvrPtmS85IhFf5GK/mXVIP6g0nWCkiXCysRWPG1vLV3lKVXc5aU+3iV291pJu6g==
X-Received: by 2002:a05:600c:1992:b0:406:51a0:17ea with SMTP id t18-20020a05600c199200b0040651a017eamr4677083wmq.10.1699821448803;
        Sun, 12 Nov 2023 12:37:28 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <4886e994-6f4b-4d9f-97fc-9f6d7a8b3641@xen.org>
Date: Sun, 12 Nov 2023 15:37:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v1 5/7] xen-bus: Set offline if backend's state is
 XenbusStateClosed
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20231110204207.2927514-1-volodymyr_babchuk@epam.com>
 <20231110204207.2927514-6-volodymyr_babchuk@epam.com>
Organization: Xen Project
In-Reply-To: <20231110204207.2927514-6-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2023 15:42, Volodymyr Babchuk wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Both state (XenbusStateClosed) and online (0) are expected by
> toolstack/xl devd to completely destroy the device. But "offline"
> is never being set by the backend resulting in timeout during
> domain destruction, garbage in Xestore and still running Qemu
> instance.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>   hw/xen/xen-bus.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
> index 75474d4b43..6e7ec3af64 100644
> --- a/hw/xen/xen-bus.c
> +++ b/hw/xen/xen-bus.c
> @@ -519,6 +519,10 @@ static void xen_device_backend_changed(void *opaque, const char *path)
>           xen_device_backend_set_state(xendev, XenbusStateClosed);
>       }
>   
> +    if (xen_device_backend_get_state(xendev) == XenbusStateClosed) {
> +        xen_device_backend_set_online(xendev, false);
> +    }
> +
>       /*
>        * If a backend is still 'online' then we should leave it alone but,
>        * if a backend is not 'online', then the device is a candidate

I don't understand what you're trying to do here. Just a few lines up 
from this hunk there is:

  506    if (xen_device_backend_scanf(xendev, "online", "%u", &online) 
!= 1) {
  507        online = 0;
  508    }
  509
  510    xen_device_backend_set_online(xendev, !!online);

Why is this not sufficient? What happens if the frontend decides to stop 
and start (e.g. for a driver update)? I'm guessing the backend will be 
destroyed... which is not very friendly.

   Paul

