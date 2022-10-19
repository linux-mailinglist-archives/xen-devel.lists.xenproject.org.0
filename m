Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B63604CC8
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 18:09:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425914.674042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olBdF-0005PG-Oc; Wed, 19 Oct 2022 16:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425914.674042; Wed, 19 Oct 2022 16:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olBdF-0005Mj-Lw; Wed, 19 Oct 2022 16:09:25 +0000
Received: by outflank-mailman (input) for mailman id 425914;
 Wed, 19 Oct 2022 16:09:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V6HZ=2U=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1olBdE-0005Md-CO
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 16:09:24 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 657e3d95-4fc8-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 18:09:23 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id bv10so29842937wrb.4
 for <xen-devel@lists.xenproject.org>; Wed, 19 Oct 2022 09:09:23 -0700 (PDT)
Received: from [192.168.16.131] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a05600c34cc00b003b435c41103sm536772wmq.0.2022.10.19.09.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 09:09:22 -0700 (PDT)
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
X-Inumbo-ID: 657e3d95-4fc8-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/gaivNtOvRrmGFG6RPtNgIZb7CGAKiq1jjE5q+NEHYU=;
        b=cwrXMjtw99DxuvfQpNVOsjORQFtxpP4N7aw5W673k40lx5roGxVPn5LnRPAqpw3HpA
         2K6LE+lZH2DbtOtMGwWXYLrMkOqprxQXXS9f6IWj7sbOY2AVuKDNjJL+QGzXSji1rnrC
         k0k8mLrMRqKzFQ3Y6hhqpqlk62WabsCRp4WAW4ZMTItbMtvKYX23oAH/ETrp5nXYB/WH
         iUVY/87IgTYjiVzascblXfdp65nlqXn+LGUlB0hNiQp9bhapWbBZW+kBl4SvEeC8W+86
         qTcMz19B8zxy4v5XKjywPyZe2LLJrSMpkg8CaPpZDbG8uwEDzRN7gJTzlywi4zK6TPI1
         Es+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/gaivNtOvRrmGFG6RPtNgIZb7CGAKiq1jjE5q+NEHYU=;
        b=grBG69kIROtyGHS2cieMcdd/FqODNgt6np17iCCsVb66K7rZk5PULHn1SdRfm3vqr2
         0WCQ6rGd/TxlwFw2kUvK2NP5qGR1HLa+5Uw/85OXLJJNZ+/ZrbWPxxqHn8CxkMDW/Eb3
         PxOk7tHMxkgPzD+2uuLDK3WYEO+PM3BgEaLi+qExkKJIiFtMycWTwmfnlaLpfyCdPKKZ
         85kkForisU/wcFvduj9g6nk2d8O0V0xPtU75P1572ZNZWSaA0rJdF3MpJ03tOcDYIpzm
         D7nJby+yXUwbyxnPsM7MZKB0Cv1oxw71WwNiIT4F5yt4PCpqf/np2BV3WGvRHFGR569+
         wvvg==
X-Gm-Message-State: ACrzQf2Qs/MzC8jJiNVeyIqp0ax01qft+kT9+1uolY8X9Vj7nMA0d7Gq
	pjT83ICCqkRZeTNTvGhU1FI=
X-Google-Smtp-Source: AMsMyM7AqcpGVOsCXg9XMM+zrskrCjvD7TOGamHI2Z1R4J3KaR7LgpJ+lBr1vVn8AO35vwlVfZ754Q==
X-Received: by 2002:a5d:58d3:0:b0:22c:e8e4:1461 with SMTP id o19-20020a5d58d3000000b0022ce8e41461mr5783598wrf.227.1666195762924;
        Wed, 19 Oct 2022 09:09:22 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <0cd7b6e5-b20f-6bab-ea7b-65723c16a065@xen.org>
Date: Wed, 19 Oct 2022 17:09:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 05/12] hw/i386/xen/xen-hvm: create arch_handle_ioreq
 and arch_xen_set_memory
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: stefano.stabellini@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-6-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20221015050750.4185-6-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2022 06:07, Vikram Garhwal wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> In preparation to moving most of xen-hvm code to an arch-neutral location,
> move the x86-specific portion of xen_set_memory to arch_xen_set_memory.
> 
> Also move handle_vmport_ioreq to arch_handle_ioreq.
> 
> NOTE: This patch breaks the build. Next patch fixes the build issue.
> Reason behind creating this patch is because there is lot of new code addition
> and pure code movement done for enabling Xen on ARM. Keeping the this patch
> separate is done to make it easier to review.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Paul Durrant <paul@xen.org>


