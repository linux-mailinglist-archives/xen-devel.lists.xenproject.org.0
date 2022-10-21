Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C634A6074E3
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 12:19:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427544.676717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olp76-0002an-Fw; Fri, 21 Oct 2022 10:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427544.676717; Fri, 21 Oct 2022 10:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olp76-0002YT-CP; Fri, 21 Oct 2022 10:18:52 +0000
Received: by outflank-mailman (input) for mailman id 427544;
 Fri, 21 Oct 2022 10:18:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RYXF=2W=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1olp74-0002YN-Ly
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 10:18:50 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9da8e5e2-5129-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 12:17:50 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id a14so1264204wru.5
 for <xen-devel@lists.xenproject.org>; Fri, 21 Oct 2022 03:18:49 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a5d5009000000b0022e3d7c9887sm18427284wrt.101.2022.10.21.03.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 03:18:48 -0700 (PDT)
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
X-Inumbo-ID: 9da8e5e2-5129-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gSvLyqT2me3HwSX6zm/t5Hpc98ZaHpehQTZBKXuZF2o=;
        b=PZWl2AiJok3eJRD/+48hjCoQcX8/5ZIhFwo9HyNB94SJ3qoTnTU7D94wGDxEomBxAB
         CIVlCjw3ftJm7h/3+aQzjFjaOGwphovUFlccAvvjHlDXcZhfg8rn14C8brEVfbvIOLST
         PG74pnUZhk/Mrv+cZjt+6lXXncFe/CZnwmoMusJLFZID2ih23+3zpJj2lg7ivQB6nSuP
         WukR7G7o7x5o/BMyrR06XfSuSfgGp15g+hFZlmSACSOIv4PNYk54i3C8YUu9nZM0j6Mf
         H2KG4Br8hZatH7gFjPEbszjid8RIH6RPzEwRJjAsWGzNVFZ5/YOlxKRBS+67kCcDFmlU
         4p8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gSvLyqT2me3HwSX6zm/t5Hpc98ZaHpehQTZBKXuZF2o=;
        b=dsvx94UNOidVtPbDNiCMyY+qx7ISW6AP5E2xSF4mXjiXgqD5/tBznbUF6ZWuQfgV/t
         UeVm6rXmy6MvlsrAHF2h0LpjMfDellr8cWCcoc1XyIoVt3oNZt8YF6zGQgA7Y5QNPpO4
         6nbt6z422/ZQFzZB/t0Z+B8UuXF0WTyt7VRyC/DJ5+A6OxPUB9RPiG2uNkRHEIVHUzV5
         yOGOsK7HhAxwM8gKkzCYRrXCZ7lGsFzTrAOgia6gNhtTHUstUdrBP5/p5FFdc97OeWqr
         tNEBZmr7WnvRrEY/IJuL4muApyiyF5uBxTv7mf+FObkJpJAJ4KPFUkl2ChiBV+DJKUpb
         IQrA==
X-Gm-Message-State: ACrzQf3y+ND6AspMSY/1GHQRDzemC47PUx1OBvAruZBxqCsd5W3mloL8
	WR5fmmbuSizS1qFZWi08teOT6Q==
X-Google-Smtp-Source: AMsMyM4J2oFrG2ayVaLyVj/gKPYm/vOmdGpMXDgE2bXapnVZsvvxjFKhOy/05+vEq1gluYAIazV3rg==
X-Received: by 2002:a5d:65d0:0:b0:236:580e:c3f9 with SMTP id e16-20020a5d65d0000000b00236580ec3f9mr384228wrw.101.1666347529225;
        Fri, 21 Oct 2022 03:18:49 -0700 (PDT)
Message-ID: <e6470da4-41a9-b625-1298-3d92532aa61d@linaro.org>
Date: Fri, 21 Oct 2022 12:18:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v14 13/17] qemu-sockets: move and rename
 SocketAddress_to_str()
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
 <20221021090922.170074-14-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021090922.170074-14-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/10/22 11:09, Laurent Vivier wrote:
> Rename SocketAddress_to_str() to socket_uri() and move it to
> util/qemu-sockets.c close to socket_parse().
> 
> socket_uri() generates a string from a SocketAddress while
> socket_parse() generates a SocketAddress from a string.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   include/qemu/sockets.h |  2 +-
>   monitor/hmp-cmds.c     | 23 +----------------------
>   util/qemu-sockets.c    | 20 ++++++++++++++++++++
>   3 files changed, 22 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


