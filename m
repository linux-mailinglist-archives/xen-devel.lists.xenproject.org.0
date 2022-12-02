Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB046400FB
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 08:19:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451486.709231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p10Kc-000427-0b; Fri, 02 Dec 2022 07:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451486.709231; Fri, 02 Dec 2022 07:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p10Kb-0003zc-UE; Fri, 02 Dec 2022 07:19:33 +0000
Received: by outflank-mailman (input) for mailman id 451486;
 Fri, 02 Dec 2022 07:19:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6g/C=4A=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1p10Ka-0003zW-2m
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 07:19:32 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a93f50bd-7211-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 08:19:30 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id bx10so6541647wrb.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Dec 2022 23:19:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n28-20020a05600c3b9c00b003d0891678f2sm453972wms.10.2022.12.01.23.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 23:19:29 -0800 (PST)
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
X-Inumbo-ID: a93f50bd-7211-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6AGdXosVaRM6yNToejqFo9FecdDcMcuPJiWoM+bR+O4=;
        b=WDh9kTq233gGos50mkI7FCbn19rh+z4Hb1wMacXNCkzSoM/ZTuk/5sDXM8ZWSLXIGA
         t0OKnduohK7Z8OEnmMF2QVHH4ZHFdyvTFp0xH4fQSxmWfDdNddIudtIqoGIs+WLu3hoS
         EtCKzbLMOWSwElu4WCvHzkomLd6W8bJ9jLcVGDzZcY5orZDyxAcwHz/8Ku+1B7RMxkzB
         M/iDlMAzfXMZxY/kCTNPAfVcPuGHWqJfS/VRg4XLHAD5o5kMGtEm//6ct622En/sEkM2
         fx04wLYqzzFyaPR3gXQUqDRYmigvOJ9o3Ij8HaEpzj/CZ27LzoIxv4D4jfXE+wBdhpHx
         icaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6AGdXosVaRM6yNToejqFo9FecdDcMcuPJiWoM+bR+O4=;
        b=iWnIW6yLkEu5yehOkXHzxLdjhDlxzwMqSwh9d0dGyQGA2beqeV1T5qQQLjcoWFhTQe
         EMq1Yy7XTQgWqs8TpfC8nDgAsZymgbuFnG8xpBDphrUokcUk4X1EWZi+Ta5MKCscg52o
         Y5hG6h4ESym2X12WrplolS/f2FAkV+7G7GRvuOx8m9sD3W/Oxf7YfH2BLQSXHBUxDLHF
         EhelUEZXqQ5y/WVVwdpsqRxFklmp2Xa+To15SHRG6pycetvFFbutnix2U3DXP0FZRxaS
         pBDoSaiFrDffsv78ePYvadlFCJtMmWtSfOKHSeY2o4eTPr0Xy/BXPjTqCIPol/+1rSRu
         kJWA==
X-Gm-Message-State: ANoB5pny7kCQUkl5EiRNIvQw7TONntfz2uUTqmUZI5pk02SZnYqdaMzv
	tpm6o1Dj3KgY9bu/8Vve7P1Jkg==
X-Google-Smtp-Source: AA0mqf7xc/dh8mx/yihRRVdBAa5aHsDHPj/31uoIlgXptsUgi+yG+zMMeqbPjdX0gao+chxJFxvZLg==
X-Received: by 2002:a05:6000:1e1b:b0:242:29d7:1004 with SMTP id bj27-20020a0560001e1b00b0024229d71004mr7617583wrb.208.1669965569566;
        Thu, 01 Dec 2022 23:19:29 -0800 (PST)
Message-ID: <a45c902a-043d-5256-7961-40c8aabd89b4@linaro.org>
Date: Fri, 2 Dec 2022 08:19:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [QEMU][PATCH v2 05/11] include/hw/xen/xen_common: return error
 from xen_create_ioreq_server
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-dev@xilinx.com
Cc: stefano.stabellini@amd.com, alex.bennee@linaro.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-6-vikram.garhwal@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202030003.11441-6-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano and Vikram,

On 2/12/22 03:59, Vikram Garhwal wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> This is done to prepare for enabling xenpv support for ARM architecture.
> On ARM it is possible to have a functioning xenpv machine with only the
> PV backends and no IOREQ server. If the IOREQ server creation fails,
> continue to the PV backends initialization.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>   include/hw/xen/xen_common.h | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
> index 77ce17d8a4..6510ac15e0 100644
> --- a/include/hw/xen/xen_common.h
> +++ b/include/hw/xen/xen_common.h
> @@ -467,9 +467,10 @@ static inline void xen_unmap_pcidev(domid_t dom,
>   {
>   }
>   
> -static inline void xen_create_ioreq_server(domid_t dom,
> -                                           ioservid_t *ioservid)

How long are we supposed to maintain this code? Per [*]:

   In general XenProject.org supports stable branches for 18 months full
   support plus 18 months security fixes. When a new X.Y.0 release is
   made there is usually one more release on the to-be-retired stable
   branch to mop up any loose patches sitting in the repository at which
   point the branch is retired.

4.17 was just released. 4.5 was 7 years ago. IIUC EOL'ed 4 years ago.

[*] 
https://wiki.xenproject.org/wiki/Xen_Project_Maintenance_Releases#Stable_Maintenance_Branches

Regards,

Phil.

