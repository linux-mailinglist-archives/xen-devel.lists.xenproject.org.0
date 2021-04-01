Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B25351635
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 17:30:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104620.200332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRzH3-0003tk-83; Thu, 01 Apr 2021 15:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104620.200332; Thu, 01 Apr 2021 15:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRzH3-0003tJ-4T; Thu, 01 Apr 2021 15:30:21 +0000
Received: by outflank-mailman (input) for mailman id 104620;
 Thu, 01 Apr 2021 15:30:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SiKL=I6=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lRzH1-0003tB-QP
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 15:30:19 +0000
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 842243dd-051f-4d1c-a6f8-2d0b98ec9554;
 Thu, 01 Apr 2021 15:30:18 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so3044134wmy.5
 for <xen-devel@lists.xenproject.org>; Thu, 01 Apr 2021 08:30:18 -0700 (PDT)
Received: from ?IPv6:2a00:23c5:5785:9a01:ac48:6475:41e4:208d?
 ([2a00:23c5:5785:9a01:ac48:6475:41e4:208d])
 by smtp.gmail.com with ESMTPSA id u3sm10203825wrt.82.2021.04.01.08.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 08:30:17 -0700 (PDT)
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
X-Inumbo-ID: 842243dd-051f-4d1c-a6f8-2d0b98ec9554
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ctKzUn0Maxydea/rVCUEByI/2Y+D8SuD1VtC232Yjgo=;
        b=dQnXePUxnurTtxoXoogjlFshU8fZTtwvOA4oSh6RzkOic1OiH4fE7NZLB/1bKfAJiW
         ky3O554V+zfe2satPFK8sQHRPuz4uReUiv3vrvJgGP+RZZ6tjahkfcvlz/lPNCT+qJAT
         0+WANOqWC+DemD5d0JmfcUcboKusItZH0XqoiOscK6fG2dE0VNe+k3CEadSAstFscDug
         WicZgXDngr9/PirWCXGxvpA70n2yiDm3VBN06CJ6gRZyGqbHNTQW+PtDS9VjNQ4CIpDj
         nuMrFAmdaooz3vlyB1HOjhQzxjMc/hJRF7AEnbtllC4bX/nP0+OWVByHVDwxQzMzk+I8
         OJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ctKzUn0Maxydea/rVCUEByI/2Y+D8SuD1VtC232Yjgo=;
        b=Cvt5Kt0re47UAEMRUOaT5pdawipMM2F2mX/x0kldpnSp2+wtRCxk30AQcDB0foNnFz
         93hnPI+yKcrz4pdvaTLwLOErSKkt4zxgpRr88GEvfCoM8oz4UnhW5r71fH77uJ6bg33+
         G98c3G92xMHcI9nwpfG3N4ycSfLAgAkXD8dVc6phKX3HTXZUBjAmZxgDKqXiwi6HfjML
         PK2V2Z/W2zYn7ZK6hFOy96K5FpXqNQkT6koJOq8G2pA7BUPJvlISSmXOCkSt+tyVoWgg
         oROq+C9zQKynUsw1ufEP3de01QKBv+FN0JYmL7+7I6MonM9ZNPZ7hmjXXAjv3mHqB/ms
         QXfg==
X-Gm-Message-State: AOAM532AFaiIOkQvKvViWOD43dl5QmjkOzN3t8h6tTw9Gz+rXDdSqvig
	GH0dT9j7HMaWo2bkQvhDMDc=
X-Google-Smtp-Source: ABdhPJywF4MI+2gExSCuT4k3JR5O617RLPZWeG6qw6CwDa/R4+Vl0UcXrU4xWkhePqvztFnAHz1+Iw==
X-Received: by 2002:a05:600c:4f89:: with SMTP id n9mr8779799wmq.133.1617291017536;
        Thu, 01 Apr 2021 08:30:17 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH for-4.15 2/7] CHANGELOG.md: xl PCI configuration doc,
 xenstore MTU entries
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>
References: <20210401133827.362216-1-george.dunlap@citrix.com>
 <20210401133827.362216-2-george.dunlap@citrix.com>
Message-ID: <054f2098-0ec6-7809-74db-e71f45941c4b@xen.org>
Date: Thu, 1 Apr 2021 16:30:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210401133827.362216-2-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/04/2021 14:38, George Dunlap wrote:
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> ---
> CC: Paul Durrant <paul@xen.org>
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Wei Liu <wl@xen.org>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>   CHANGELOG.md | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index f7ce6682b9..086a0e50d0 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -15,6 +15,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>    - Switched MSR accesses to deny by default policy.
>    - Intel Processor Trace support (Tech Preview)
>    - Named PCI devices for xl/libxl
> + - Improved documentation for xl PCI configuration format
>    - Support for zstd-compressed dom0 (x86) and domU kernels
>    - Library improvements from NetBSD ports upstreamed
>    - CI loop: Add Alpine Linux, Ubuntu Focal targets; drop CentOS 6
> @@ -23,7 +24,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>    - x86: Allow domains to use AVX-VNNI instructions
>    - Factored out HVM-specific shadow code, improving code clarity and reducing the size of PV-only hypervisor builds
>    - Added XEN_SCRIPT_DIR configuration option to specify location for Xen scripts, rather than hard-coding /etc/xen/scripts
> -
> + - xennet: Documented a way for the backend (or toolstack) to specify MTU to the frontend
>   
>   ### Removed / support downgraded
>   
> 


