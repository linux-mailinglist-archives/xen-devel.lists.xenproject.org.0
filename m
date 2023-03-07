Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AE06AE26F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 15:30:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507449.780951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYKn-0006L8-7T; Tue, 07 Mar 2023 14:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507449.780951; Tue, 07 Mar 2023 14:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYKn-0006IQ-4h; Tue, 07 Mar 2023 14:30:33 +0000
Received: by outflank-mailman (input) for mailman id 507449;
 Tue, 07 Mar 2023 14:30:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZYKm-0006IK-9l
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 14:30:32 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d05cd61-bcf4-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 15:30:31 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso10538657wmq.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 06:30:31 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a05600c12cc00b003de2fc8214esm12845019wmd.20.2023.03.07.06.30.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:30:30 -0800 (PST)
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
X-Inumbo-ID: 9d05cd61-bcf4-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678199431;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lI7njEETZfbtZhY4ryxwf6AgQBevQ9BycQ5nRxlv40E=;
        b=KDLHCAg4VKsV4+wx8FZLc475Kq2fcW7k97rBoPbbr1Xg2RRbP6bAg17fcMHKJYynxj
         qvncC0Nz1cb+s+xbRvEExVUm4lV6btuFoRVvbtd0tCQy031r7m3+LexBc5oaBgeh3Rd1
         DQzEwQqDOtfMSl4KAoSzQCBZCECh03FWxkUOU0o/utqO4X2qFL9Fn/y5zO8SCFcjmE8V
         at/btXNafsNNGjnbfkKDV0ycU5G9lf8pB9g/LyygV2Hf9s6Z1fmTysKT2LS3ya/kC1P/
         4bOKVayyvLFpqUXnlCaEZ166v73Ikhq+pS+5rzpxeVxrESS4T1eaBYSRUcSI++tlRY+m
         CQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678199431;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lI7njEETZfbtZhY4ryxwf6AgQBevQ9BycQ5nRxlv40E=;
        b=J/6f8CUlnLrWUmhWmTHJTh/xWZ5kqo4OjjhGB8Sps3+DjxLgPiHk/7MdpnNWCpVmz+
         KSjRg6I+yNYACXv2BHI1cet33q14gh1sVa8sBZgnAqPUp3Lz7yj2QZX+AsuSj4IWJTkG
         8dcIr1hPOuVVU3dC2m6UaLkS/Ny7mG3FrCpGwAffpH+hc/+yM19N9WhJOpHRcmYFaUI7
         jFBASqcFTsSfXzhLT8btVww9dUp7tmd+riD0itkwQbV268He2VEjeWpYGUtxH+dwOt/F
         hA/MjFhYKo982k6qx4MfqkjcuZ/QqPj9MK8Q+NudHQOliGBIDhssvQSUQcpVXy28SFo5
         CPvg==
X-Gm-Message-State: AO0yUKXde7J3qfeXouuyqnuQeKm7Okv3N5Ua+z3F/XqJ1JbADqN7Fok/
	1YmWNOvLZcrrA+nvA6cH528=
X-Google-Smtp-Source: AK7set/r76LMNSw/ok5klQNRFQSycL7zdWrfke+YueXkMJLikpP0WP8+eAAfuOPN4RdwZR/Seb/1uQ==
X-Received: by 2002:a05:600c:45d3:b0:3e7:cee4:f8a with SMTP id s19-20020a05600c45d300b003e7cee40f8amr13037923wmo.29.1678199430711;
        Tue, 07 Mar 2023 06:30:30 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <4c5938c7-dc09-435d-1da3-6e9842c64d21@xen.org>
Date: Tue, 7 Mar 2023 14:30:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 11/25] hw/xen: Pass grant ref to gnttab unmap
 operation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-12-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-12-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The previous commit introduced redirectable gnttab operations fairly
> much like-for-like, with the exception of the extra arguments to the
> ->open() call which were always NULL/0 anyway.
> 
> This *changes* the arguments to the ->unmap() operation to include the
> original ref# that was mapped. Under real Xen it isn't necessary; all we
> need to do from QEMU is munmap(), then the kernel will release the grant,
> and Xen does the tracking/refcounting for the guest.
> 
> When we have emulated grant tables though, we need to do all that for
> ourselves. So let's have the back ends keep track of what they mapped
> and pass it in to the ->unmap() method for us.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/9pfs/xen-9p-backend.c            |  7 ++++---
>   hw/block/dataplane/xen-block.c      |  1 +
>   hw/char/xen_console.c               |  2 +-
>   hw/net/xen_nic.c                    | 13 ++++++++-----
>   hw/usb/xen-usb.c                    | 21 ++++++++++++++++-----
>   hw/xen/xen-bus.c                    |  4 ++--
>   hw/xen/xen-legacy-backend.c         |  4 ++--
>   hw/xen/xen-operations.c             |  9 ++++++++-
>   include/hw/xen/xen-bus.h            |  2 +-
>   include/hw/xen/xen-legacy-backend.h |  6 +++---
>   include/hw/xen/xen_backend_ops.h    |  7 ++++---
>   11 files changed, 50 insertions(+), 26 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


