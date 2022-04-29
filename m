Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44725147D0
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 13:15:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317228.536474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkOa4-0002y0-6z; Fri, 29 Apr 2022 11:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317228.536474; Fri, 29 Apr 2022 11:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkOa4-0002v8-3l; Fri, 29 Apr 2022 11:14:36 +0000
Received: by outflank-mailman (input) for mailman id 317228;
 Fri, 29 Apr 2022 11:14:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R1X1=VH=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nkOa2-0002v2-OZ
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 11:14:34 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bba5812-c7ad-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 13:14:33 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id q185so10098341ljb.5
 for <xen-devel@lists.xenproject.org>; Fri, 29 Apr 2022 04:14:33 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 bd25-20020a05651c169900b0024f3d1daea9sm248921ljb.49.2022.04.29.04.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 04:14:32 -0700 (PDT)
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
X-Inumbo-ID: 8bba5812-c7ad-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=24Yu851L+dS2yEvP/EMPHQtSULte7iLzPxRBpYBqDEY=;
        b=YBE2bmybOlQIbBR8yW2m1tU+shkpzVmJbD8mYmt6TDhH1Zk1vU/8RkxPKQF+hXw79n
         zFe5GhmIzQEuzMT/bpLzofXP4kv11QMyPiwJ36NM7ePhPCfSXtvd0h9Ab3V4UswUf4Qw
         86q1xqcHL0jWhlCgnfQ3RGpaTdluTLe06Qi/IQBcsduQHFY4P4Foc1lJSA6qzt7gGhDz
         PCvG6kbUAv20pru1dFqGX4MWJK2GsfuuolWNbNqYpzkFtJG0AzYlbkwIeEccNMlGIc9w
         OzTGw8HLwrP2n27u5sSLpSwso82sjXDUve2OKBApY10iJ+Ff4zQaOOOGvQhf8//a/F1h
         p3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=24Yu851L+dS2yEvP/EMPHQtSULte7iLzPxRBpYBqDEY=;
        b=nGV16s+hXMqZBaJyuD3QSz/w1+//+seuSfRgZC2mLX44iJZCaumWxZNvKlt/GDqw/o
         yI+yDHfgY8xui9Jjvlt/PHQBvzU4Zv9tWxKEbcFk4TPKhkbv8VwdiZF9Tdv9SkBxxAWR
         uZhnaSPWBqSvEqw5ymC8bqeANwSeQXW4A5d4Qes4GI43n2s43AxgB/TDCJvK4uJ6/rIe
         7mDVclR6rg3gTs3yISSC0u8Ubf/Ha2kBzjV/ErMfFvn5ikVz+qQ2q9JFDKeebTzGOiuh
         GZTha54jDk+VMs+gzHDBmyrlepMPeJnfJfu9BvFB2AbVRsBOhylM5T1YiPJdkC4k9r3V
         /UTw==
X-Gm-Message-State: AOAM532OnJWX/oejWiy9t5gWQCfEybVifTqvwpDjAFSsoTsQptRSJ+Pm
	kmqmxChZ4jqJtBWotzySqU8=
X-Google-Smtp-Source: ABdhPJzrKftalINu7jCLWocTUmyljWcsSyLXxDTZBnqFWEcP3kASnELbeSx9y5Q0htvxAD7qjDbn8w==
X-Received: by 2002:a2e:9f49:0:b0:24f:a4f:955a with SMTP id v9-20020a2e9f49000000b0024f0a4f955amr19407945ljk.374.1651230872469;
        Fri, 29 Apr 2022 04:14:32 -0700 (PDT)
Subject: Re: Virtio on Xen with Rust
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Mathieu Poirier <mathieu.poirier@linaro.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>
References: <20220414091538.jijj4lbrkjiby6el@vireshk-i7>
 <CAPD2p-ks4ZxWB8YT0pmX1sF_Mu2H+n_SyvdzE8LwVP_k_+Biog@mail.gmail.com>
 <20220429034808.dr647727dphnx6zk@vireshk-i7>
 <20220429035917.xu5ecgldwzfnxbos@vireshk-i7>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <ca4c642d-a218-26f2-0661-c356f79d15e5@gmail.com>
Date: Fri, 29 Apr 2022 14:14:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220429035917.xu5ecgldwzfnxbos@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 29.04.22 06:59, Viresh Kumar wrote:


Hello Viresh


> On 29-04-22, 09:18, Viresh Kumar wrote:
>> Now, it was just yesterday that I started looking into MMIO modern stuff as the
>> GPIO device needs it and you sent me working code to look how to do it as well.
>> You saved at least 1-2 days of my time :)
> One question though, do we need to support Legacy mode at all in the work we are
> doing ?


I am not 100% sure I can answer precisely here. virtio-disk backend 
worked perfectly fine in legacy virtio-mmio transport mode
with the latest vanilla Linux. For the "restricted memory access using 
Xen grant mappings" feature to work I had to switch it to use modern 
virtio-mmio transport.
CONFIG_ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS requires the virtio 
devices to support VIRTIO_F_VERSION_1. In addition, we do need 64-bit 
addresses in the virtqueue.

BTW, the virtio-iommu also requires VIRTIO_F_VERSION_1.



>
-- 
Regards,

Oleksandr Tyshchenko


