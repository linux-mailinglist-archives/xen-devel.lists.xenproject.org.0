Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E3B605EC0
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 13:23:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426615.675174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTdV-0002vV-9s; Thu, 20 Oct 2022 11:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426615.675174; Thu, 20 Oct 2022 11:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTdV-0002rn-6T; Thu, 20 Oct 2022 11:22:53 +0000
Received: by outflank-mailman (input) for mailman id 426615;
 Thu, 20 Oct 2022 11:22:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2/78=2V=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1olTdU-0002na-8v
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 11:22:52 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84135581-5069-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 13:22:44 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id bk15so33830865wrb.13
 for <xen-devel@lists.xenproject.org>; Thu, 20 Oct 2022 04:22:50 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c490600b003b95ed78275sm2415551wmp.20.2022.10.20.04.22.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:22:49 -0700 (PDT)
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
X-Inumbo-ID: 84135581-5069-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qeLuBqMrrf60ddrQS5kIMB1G0KMo/uMw/93o5j0BRbA=;
        b=EvhqqP0tsA+OhGXdbX1aSkmkLTgJ021o+8X8kgefgH7W3nnfKs1DEBShJ5+jx6QUbX
         w2FwrZb41vzWKi1pO9meI2F1joVbXKYR4sy+U21In4HCPtCFFqQzpfQQBzR4t+Gmp9/6
         yf2+UHMJXGvCAyNZfhUXNo1SVgtB8nDrZh6C8ipgBtXCSS1hCUu2KakLHjXkgb0oFYol
         VrPOUBo+YxCWuAMDq+IRpM0u6EjYYezdI1SE0ko4YhmRHYfK8Zr9pXuB0Gp6Z9+ISHJ5
         sgFs0vnttL8Hi1uwWjqu0LU0P919ckabIc/ocX96esOzyFtKk0q9Ix8wOSLyZgFC8HEK
         RjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qeLuBqMrrf60ddrQS5kIMB1G0KMo/uMw/93o5j0BRbA=;
        b=r5uqAjMDKM3fxA+vNrwmTl9SUToexGuTx8TaOBsT2QU+mVbdROZc2vqhjNx+HvJiI5
         g+SBYj2R2aX5Iu7tcMSBJmw9gPXYxRTqvK6MU3dmzqDyzsi3k+xgmPPXVrlkjrGZ6gea
         552VcLM+Q+GBs0oBDNFdXDf/erFUTbULjxz13F14JS7SMOdcjxQim8ZHyzg9zysoCYTt
         WOzfEJho4xVmk0iNMOQFBIDbDcxMimbrumuMKnSYQKu2yjf0ZnfR/dYOn+/Jx6pndGaI
         KB+HrFAqOhfJFlLL4yJciJHL+3zNRFaMEKWz+ZfXw4Ri2Xhj3yUFmo70GRtJPnNf8Uja
         5e8A==
X-Gm-Message-State: ACrzQf1ADrcii+KAeuoeOt62s3u7erUpFlbv3wfaYEHGnqQAD9mLIJ+z
	q8MzUMtpeDHegdoV4GBxuybWsw==
X-Google-Smtp-Source: AMsMyM40ThoQBavxHAlcW+lg4vJY0hKffuLqNqY4Acfc6gQvEbuZViG8MbqPa2YA3YkDkaON6sn1Qg==
X-Received: by 2002:adf:dd0f:0:b0:236:2f7f:4cce with SMTP id a15-20020adfdd0f000000b002362f7f4ccemr1256849wrm.347.1666264970374;
        Thu, 20 Oct 2022 04:22:50 -0700 (PDT)
Message-ID: <3e6d8138-ad6e-9e23-ebc0-f3e4d5afebe1@linaro.org>
Date: Thu, 20 Oct 2022 13:22:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v12 05/17] net: introduce qemu_set_info_str() function
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Anthony Perard
 <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
 <20221020091624.48368-6-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020091624.48368-6-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/10/22 11:16, Laurent Vivier wrote:
> Embed the setting of info_str in a function.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   hw/net/xen_nic.c  |  5 ++---
>   include/net/net.h |  1 +
>   net/l2tpv3.c      |  3 +--
>   net/net.c         | 17 ++++++++++++-----
>   net/slirp.c       |  5 ++---
>   net/socket.c      | 33 ++++++++++++++-------------------
>   net/tap-win32.c   |  3 +--
>   net/tap.c         | 13 +++++--------
>   net/vde.c         |  3 +--
>   net/vhost-user.c  |  3 +--
>   net/vhost-vdpa.c  |  2 +-
>   11 files changed, 41 insertions(+), 47 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


