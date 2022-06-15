Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7393654CD60
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 17:49:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350224.576492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1VFP-0002fB-TV; Wed, 15 Jun 2022 15:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350224.576492; Wed, 15 Jun 2022 15:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1VFP-0002cN-QA; Wed, 15 Jun 2022 15:47:59 +0000
Received: by outflank-mailman (input) for mailman id 350224;
 Wed, 15 Jun 2022 15:47:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wv+x=WW=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1o1VFO-0002cD-2H
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 15:47:58 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86838183-ecc2-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 17:47:56 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id 20so19546696lfz.8
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jun 2022 08:47:56 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a2e150f000000b0025567cf8633sm1710514ljd.85.2022.06.15.08.47.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 08:47:55 -0700 (PDT)
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
X-Inumbo-ID: 86838183-ecc2-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=VTCGWujNv4+ZeNU9inSiK0tI+fyoxm0X3NKXlbOy8Y8=;
        b=GphwJd+LsGEWeN2UG4hGNyGvnzO74SuULFcCInrrgMlqBx8ENwGzXPt2mYReWKHevc
         0XbVfNJOky5MmRd3j4yfAIyRzYLYgHv7/n0cn0R+GFOpDUVDUC81hCn2m1oE1UxPUoWo
         +qgBpWgoy4aIdpBjLJl1r0T+ju62jYqHcOMRTctNqp2bWSn4QS6F2IVeElVNzK99mGrb
         WoIIyfTwWKcNpy2mXR+SKnP/cc6nh07OU48gAhRTmgRycemIPRHP9oukemCczQWi7JJt
         yTgLZ7YWzIi/Z/8M+yheAOjE60UQs2PPXenesWMsQyrdGX7sZMb2PDXbl3/Vz9sxlg/l
         vnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=VTCGWujNv4+ZeNU9inSiK0tI+fyoxm0X3NKXlbOy8Y8=;
        b=CjYi5jZsG1CjVFP0GchHzFnEAq9Lrz7RfRsseZHqFJSpExMD3MjbKyxCEtj2U7LTcA
         yZJcTDUZEt3qZiHNLSfWgkssGvmMQrK2WWjSI+1oWQKe6X7gcTHojg+guw1DgWEQ8uro
         B8oyuPUJDwyf0D7zCVKuv05BhqdaFsMwE3cOIewGKaJm8Cda34n6jTHc1PhMeRQb3vY2
         2WoZdfRmG2XBmOupUWxVus7UvnnKHllWt+i1qfnJ2XwX7x9KfjKA/fj0JoBNr9nm97sS
         N9PUvTy0Oqr0MxVgiY8eZy/EFwmeVEI73vOMdjCdIe6H6F4eltAuW4Rsl5fx0yYiPO+1
         Trhg==
X-Gm-Message-State: AJIora8lhGDtd0IlcYrxVkHhWMvKguLqCausOCfPWAdzrEs+JXaTdq3C
	hhkwjP0ZzqJi17For2HhGU0=
X-Google-Smtp-Source: AGRyM1vcCVXtE8TdfCiHOURs9ffWBcnlUTL+yi36mILI8l9ZN3HWHOYcewv5RFV18a3Ky1FRl+oYTA==
X-Received: by 2002:a05:6512:39cb:b0:47d:a4c6:40eb with SMTP id k11-20020a05651239cb00b0047da4c640ebmr62321lfu.597.1655308076206;
        Wed, 15 Jun 2022 08:47:56 -0700 (PDT)
Subject: Re: [PATCH] xen: don't require virtio with grants for non-PV guests
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20220615084835.27113-1-jgross@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <6f5b1562-1270-5e83-bf9f-a9a7afc5a725@gmail.com>
Date: Wed, 15 Jun 2022 18:47:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220615084835.27113-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 15.06.22 11:48, Juergen Gross wrote:

Hello Juergen

> Commit fa1f57421e0b ("xen/virtio: Enable restricted memory access using
> Xen grant mappings") introduced a new requirement for using virtio
> devices: the backend now needs to support the VIRTIO_F_ACCESS_PLATFORM
> feature.
>
> This is an undue requirement for non-PV guests, as those can be operated
> with existing backends without any problem, as long as those backends
> are running in dom0.
>
> Per default allow virtio devices without grant support for non-PV
> guests.
>
> The setting can be overridden by using the new "xen_virtio_grant"
> command line parameter.
>
> Add a new config item to always force use of grants for virtio.
>
> Fixes: fa1f57421e0b ("xen/virtio: Enable restricted memory access using Xen grant mappings")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Thank you for the fix.


I have tested it on Arm64 guest (XEN_HVM_DOMAIN), it works.

With the "__init" fix (pointed out by Viresh) applied you can add my:

Tested-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com> #Arm64 only


[snip]


-- 
Regards,

Oleksandr Tyshchenko


