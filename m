Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3418C7F4BAD
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 16:54:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638865.995780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5pYl-0005W4-Up; Wed, 22 Nov 2023 15:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638865.995780; Wed, 22 Nov 2023 15:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5pYl-0005U0-Ro; Wed, 22 Nov 2023 15:54:39 +0000
Received: by outflank-mailman (input) for mailman id 638865;
 Wed, 22 Nov 2023 15:54:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aeb/=HD=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r5pYj-0005Tu-Ka
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 15:54:37 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f13b3d0-894f-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 16:54:35 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4094301d505so32275675e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 07:54:35 -0800 (PST)
Received: from [10.95.134.92] (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a05600c4f4300b0040b297fce5fsm2622058wmq.10.2023.11.22.07.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 07:54:34 -0800 (PST)
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
X-Inumbo-ID: 6f13b3d0-894f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700668475; x=1701273275; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oNuaujgkfiBu0D3cBBFv01kMivKccYiWE/OU0x8Hvjg=;
        b=jTWg4l00eSGFAP9fShHha1fpN45mZB/Aye3bvYzY9Yz4t6y+JX6t5CqOEJX3E/H9uR
         K9kikxLSeGkx4UHTV6k8Szi6fyPUuucJop44b6ONdFTNwGsPXQKDBvU8KzhQXPV0RH0Q
         WvhQW7svXtVkv3EDBU0Q11WnS35w+EyBz5KXKSE7aG8WT3A7VMvMJWJQrbDH4gJq8osJ
         DbhkvdNF4hKj0FrRnM6iPOb5ECCgOGiM4I7CJRLB1THSWablM4rbIwrckgkLN4Gww5Tv
         GTM691AA8RWw5ze43ZDnehpLXsaQuZHPG5CLrqBy8ZTh9VLZzd+8wWmH8Y2ah9CIvIz0
         +nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700668475; x=1701273275;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNuaujgkfiBu0D3cBBFv01kMivKccYiWE/OU0x8Hvjg=;
        b=n47tnO8uFO3pmvC4MMMA0lUnJUO8Uve0duZLoBrs/CaQZMNtMGDOxxc6q3zMMetk0C
         kbEuHG65w1D/TdUA1I2dQHXMOhZxt6MdML+s09tGTGtw5P79O/DJQTuQKnt0eg6a9nTV
         3DjNyZr2rzlRKCWs6+Uyv1n9wMpJOUYIEOOsVWmIzMzEgCpXw1eNC9jCYXCAPUs+1z3s
         CYd4lILXE0tWlPB0EXdY8vvUotEuJALK4bPweb4YSytMwS5vGzWMO80ksWyRmHAl6lzu
         pOOUB3jb9cM2msGmdwVdce6pxMIu0kn34Md4Ssc+NVYcWugp3sqwLDMfK896wntDrTr0
         OHRw==
X-Gm-Message-State: AOJu0YwG6aWHw2Evmy5nXty/X0BnUsGkuNd8tK0plY6mxag06edgOe4/
	MKyQEHzgx9V3AsELKQT0JTM=
X-Google-Smtp-Source: AGHT+IF+NU9imeSVoGdzlL8QTTPC502lMgEP/qmUPOwdJnpB0DB0k1UIS4J7qULNnyd+Cqp0H3sq3w==
X-Received: by 2002:a05:600c:a43:b0:401:a0b1:aef6 with SMTP id c3-20020a05600c0a4300b00401a0b1aef6mr2594869wmq.2.1700668474803;
        Wed, 22 Nov 2023 07:54:34 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <dcb3f2ef-e05b-4636-8a85-d9864cf619d4@xen.org>
Date: Wed, 22 Nov 2023 15:54:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 1/6] hw/xen: Set XenBackendInstance in the XenDevice
 before realizing it
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-2-volodymyr_babchuk@epam.com>
Organization: Xen Project
In-Reply-To: <20231121221023.419901-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2023 22:10, Volodymyr Babchuk wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> This allows a XenDevice implementation to know whether it was created
> by QEMU, or merely discovered in XenStore after the toolstack created
> it. This will allow us to create frontend/backend nodes only when we
> should, rather than unconditionally attempting to overwrite them from
> a driver domain which doesn't have privileges to do so.
> 
> As an added benefit, it also means we no longer have to call the
> xen_backend_set_device() function from the device models immediately
> after calling qdev_realize_and_unref(). Even though we could make
> the argument that it's safe to do so, and the pointer to the unreffed
> device *will* actually still be valid, it still made my skin itch to
> look at it.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/block/xen-block.c         | 3 +--
>   hw/char/xen_console.c        | 2 +-
>   hw/net/xen_nic.c             | 2 +-
>   hw/xen/xen-bus.c             | 4 ++++
>   include/hw/xen/xen-backend.h | 2 --
>   include/hw/xen/xen-bus.h     | 2 ++
>   6 files changed, 9 insertions(+), 6 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


