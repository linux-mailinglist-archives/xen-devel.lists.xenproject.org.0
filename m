Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E747B7F4DCA
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 18:05:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638935.995933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5qfI-0002IV-D1; Wed, 22 Nov 2023 17:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638935.995933; Wed, 22 Nov 2023 17:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5qfI-0002Gg-AI; Wed, 22 Nov 2023 17:05:28 +0000
Received: by outflank-mailman (input) for mailman id 638935;
 Wed, 22 Nov 2023 17:05:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aeb/=HD=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r5qfG-0002GR-K9
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 17:05:26 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54669d9f-8959-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 18:05:25 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40b344101f2so248825e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 09:05:25 -0800 (PST)
Received: from [10.95.134.92] (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id
 je19-20020a05600c1f9300b004090798d29csm41802wmb.15.2023.11.22.09.05.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 09:05:24 -0800 (PST)
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
X-Inumbo-ID: 54669d9f-8959-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700672725; x=1701277525; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I0J5fqyt8wQQyv6C5hr9LFPK+QBnNAlvdW52k/8SMic=;
        b=D7crWWrdOlcz+TGhu2J/x98+0roKq+Vw65cC2V+wqqNW0Fyk8m4P0SoVIzs9Zfkure
         U1tBntJsRPtdULffwgjTHqxY6zcASNmw/nASqoXPnwds2Fp3Kh3hHi2++jsoThahX+vM
         LnfGLoDnBscln2x5Ts+c3t8VF/iUzmErdcxd3At5+9rlA9buQaLL33hSFvBE8NgePyPS
         rtXSAtAG7XmhZ67vG5jMl/ZloI6zh43Hb1fbl/a2acvNbtCKare920z4Ep3uHNlqc0vm
         MCewb6Wh1DM9wrSrFLYCMKaQGqnwsfhqIC1khWWGFcb/EEeqYIyN9MaWdObityAtHAks
         1FOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700672725; x=1701277525;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0J5fqyt8wQQyv6C5hr9LFPK+QBnNAlvdW52k/8SMic=;
        b=VUDuONyx0sT2GhOd3GcVdCaVJ8P5E3JpJ2cpqQpNvDTSKECIWJCg62DhodKKHI+xZk
         AMu53fEEjmcO5wHkI91GOvy5g6MljyxqZ5AQ8OIQf0kSeFJEWzJZmAjbRzhRFyyN1CHf
         6dWQSjhkp3SauesZb2a+6r20CHep5JmziUxAB8VlyjRhitqTPwyfRzppyYiQD125+eXH
         Mpmj32/YCC4Gaj69Wjo9S2pasBQFx4TOOzzqCECf9BcDEyN115FgEc9uZqTE1aPcJAh8
         FwWBvQLeFx80sE4qo/66RczOVfnOQ6melrTQdA7uApS1yGqJW0OEt/r58e0u8GWBaByi
         WHew==
X-Gm-Message-State: AOJu0YzbkEs7IiouV4OBHJa2lb+hD8x4ZM/ZbxPoJ0e/ayF0hlSh1BTt
	Oz9L7Ii84XNuDFsKqlnxEB8=
X-Google-Smtp-Source: AGHT+IEekpdm4N30KUcOe9rHlR/EVEZelxqqJbkx9shFbPTurKDYLNG5QWTqQ/mqdsgflEk5QYRwpw==
X-Received: by 2002:a05:600c:1d12:b0:40b:2a62:a2b6 with SMTP id l18-20020a05600c1d1200b0040b2a62a2b6mr85353wms.1.1700672724957;
        Wed, 22 Nov 2023 09:05:24 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <e1663064-247d-41e3-9a36-16f81303fb94@xen.org>
Date: Wed, 22 Nov 2023 17:05:23 +0000
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

Actually, I think you should probably update 
xen_backend_try_device_destroy() in this patch too. It currently uses 
xen_backend_list_find() to check whether the specified XenDevice has an 
associated XenBackendInstance.

   Paul


