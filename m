Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 808386AE2E7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 15:41:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507455.780972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYUn-0008Ut-DX; Tue, 07 Mar 2023 14:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507455.780972; Tue, 07 Mar 2023 14:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYUn-0008Sj-AH; Tue, 07 Mar 2023 14:40:53 +0000
Received: by outflank-mailman (input) for mailman id 507455;
 Tue, 07 Mar 2023 14:40:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZYUm-0008Sd-5O
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 14:40:52 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dfedb23-bcf6-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 15:40:50 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so7337963wmq.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 06:40:50 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c3b1200b003db0ad636d1sm18553965wms.28.2023.03.07.06.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:40:49 -0800 (PST)
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
X-Inumbo-ID: 0dfedb23-bcf6-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678200050;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cd7r0E6egEeOQJKPiGStKR4A/mQxjInl3PZyVX0qqN4=;
        b=boRiul5MDGRzTHWvmpZKeuB3QNhk9U3VoOjDYMlNZHbzck0rRn7HMVqK8eT0VxhhGh
         iFB7HJFP4280Jcc8UyvJghLSGOf2182uwqQm8JCSiu5m5hPoJBfviZ2d25Kov3PuU6lW
         pSKkay3ZOQUtve1U0WcTksrFbtRH3LmZmzwb7bYvEh9I6rrLRVTvJqG9qUBhO/EcoEfE
         zecP8azTx1dmdX+LxcVETQjhaFNrTsIskJb3cH5ndyBnWsgzEd7oz1KBxaYIroz+90LV
         eMErCDVSFZlkQRj9pfIaSIaAZAXNoovsAR5g8lc8q2ODcHn4PLo0ewXo/pe8r20njYXg
         s70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678200050;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cd7r0E6egEeOQJKPiGStKR4A/mQxjInl3PZyVX0qqN4=;
        b=onNRnO7E8gqTNJesI3lkGpnpn2GIjoDsw8Vpq2UJC4nhWtgX0BbMtTnJKdxTZ5ERq3
         CuffUFb/Y0jAdVHQ4BXQGs+zeDXYK8pumBPSqSLTwmlKCoQ8L7Uui1h0Aj0Y8yZc+2cC
         kDombM6AcRhG5eQEPgV1NeWi7tGppYsV8iBSt7a06Mqv7JqbGA0wXaSfFLQ78dFDvgLf
         tkLJPL+MHHbqiqpy21Cfbyo0yX367nO580L0o7ja4mP3XBzTZtlPBG+mAHMu57dElQcZ
         95rOzpsoJ70ZPdZyhCwDjHgh0pAjFfucmf6B5sOfdC2vFmAc0WW1jDIMhaaYB+d3dJyh
         oMsA==
X-Gm-Message-State: AO0yUKVuu4jQfBLiryuTAPgojIBT2Fil8vQqI2dm4sDdM+hygMxb4L9j
	I9jqYVuVOQQ/4eNM60rVFI0=
X-Google-Smtp-Source: AK7set9ka4HjGPxXSbVhfdpPv+uZeUTPWrsODgLJe+MS+2XAXrYwMmCaoipDOHJZ+PqHIYxTcZDr7Q==
X-Received: by 2002:a05:600c:4f14:b0:3eb:1d0c:ad71 with SMTP id l20-20020a05600c4f1400b003eb1d0cad71mr12613828wmq.23.1678200049812;
        Tue, 07 Mar 2023 06:40:49 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <470e51bf-5159-fd32-93b5-03f5bdf5f050@xen.org>
Date: Tue, 7 Mar 2023 14:40:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 12/25] hw/xen: Add foreignmem operations to allow
 redirection to internal emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-13-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-13-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
>   hw/char/xen_console.c            |  8 +++---
>   hw/display/xenfb.c               | 20 +++++++-------
>   hw/xen/xen-operations.c          | 45 ++++++++++++++++++++++++++++++++
>   include/hw/xen/xen_backend_ops.h | 26 ++++++++++++++++++
>   include/hw/xen/xen_common.h      | 13 ---------
>   softmmu/globals.c                |  1 +
>   tests/unit/test-xs-node.c        |  1 +
>   7 files changed, 88 insertions(+), 26 deletions(-)
> 
[snip]
> diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
> index d4d10d3ff1..632ce617cc 100644
> --- a/include/hw/xen/xen_common.h
> +++ b/include/hw/xen/xen_common.h
> @@ -32,19 +32,6 @@ typedef xc_interface xenforeignmemory_handle;
>   #define xenforeignmemory_open(l, f) xen_xc
>   #define xenforeignmemory_close(h)
>   
> -static inline void *xenforeignmemory_map(xc_interface *h, uint32_t dom,
> -                                         int prot, size_t pages,
> -                                         const xen_pfn_t arr[/*pages*/],
> -                                         int err[/*pages*/])
> -{
> -    if (err)
> -        return xc_map_foreign_bulk(h, dom, prot, arr, err, pages);
> -    else
> -        return xc_map_foreign_pages(h, dom, prot, arr, pages);
> -}
> -
> -#define xenforeignmemory_unmap(h, p, s) munmap(p, s * XC_PAGE_SIZE)
> -

Actually, probably best 'static inline' that, or at least put brackets 
round the 'p' and 's' for safety.

With either one of those options chosen...

Reviewed-by: Paul Durrant <paul@xen.org>


