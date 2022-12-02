Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 365D2640104
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 08:28:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451509.709265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p10SW-0006n7-C5; Fri, 02 Dec 2022 07:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451509.709265; Fri, 02 Dec 2022 07:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p10SW-0006kb-8N; Fri, 02 Dec 2022 07:27:44 +0000
Received: by outflank-mailman (input) for mailman id 451509;
 Fri, 02 Dec 2022 07:27:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6g/C=4A=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1p10SV-0006kV-GC
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 07:27:43 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce33cf10-7212-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 08:27:41 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 o7-20020a05600c510700b003cffc0b3374so3610652wms.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Dec 2022 23:27:42 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c351400b003c6cd82596esm13400449wmq.43.2022.12.01.23.27.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 23:27:41 -0800 (PST)
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
X-Inumbo-ID: ce33cf10-7212-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p3aB0mnOQ+ZWhak1nLkfu9FqkmgJit9mNfH8A6i2La4=;
        b=yG712CVpxij29FVeedIFV5f4Sda6349it4wloq9uXkPmF+kxUEjMmriknqlV6jZLZp
         jgctrIRqBlaJpxDb1MdhYBr9EPam+GUxXWeewGe/PHrGm/9YP2SmY2aUGsjYEg+86+sT
         OpO9auSJocldxlADDXZzuqiis9SgZs+WTthpMSqDIsvSemQT9lu1l0Qxyh1o6NsQInu6
         eVe1dlOynNiIPJKN1XOIyRp7ZD5f4LJdDPPPRXV0iE5oy2t8EQQdcf2YOuTr0tr9iPb8
         qOa3la7e2mWgHQbKUan2ZY+BaNLMm7Tqt4vfDyXIhVqC7yB7LA8XBlh18DcBFRMD+8F/
         Ku8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p3aB0mnOQ+ZWhak1nLkfu9FqkmgJit9mNfH8A6i2La4=;
        b=d9JuzqdeROQqAAkpebCokAmDtY5puwne/9UpfmEheKL8Ycb+fXWTYhjeiIxW+OyIxa
         H2mJ6pYO9B1oNaGgMnx3m6GNV0WH4Sbr/CNkwCGvLQ5hnEPwVjHaxdB/gq4Phx42KCoo
         PvJ7L65tkA1FoZONmJCxMfUl7Ve11JjPHNTjbNsXLR57r8Z0XtkV1T95ZKh8tSJdpE+c
         bKOk66Xd832sJwVt+2aiASRFEDxUT0nXdQ6B0NFVawk/6pXTUboRXwcceQsbGnnUucKK
         hi5k/A7SeSbyyroTywgBF4N2U0X4r808CG/QZ3pUWFPvK1tZMwJsEHNM+7d99Mt3IxN7
         JfYA==
X-Gm-Message-State: ANoB5plYPaCLUjc2sbW7m9TEU6l1eJiedU9yP0dCeJ/PPFjHZ+Y0IkD4
	H6v7alUg+n1CR2oAvZUUDJ1SOg==
X-Google-Smtp-Source: AA0mqf4Pv2F57J6qsiF3Ay5oqePGdDmBDyK04oa/2DfZ1Ogn7g2NjAIFUFxPtvHmjc5ytZPSBTTeiQ==
X-Received: by 2002:a7b:c2aa:0:b0:3cf:5d41:bea1 with SMTP id c10-20020a7bc2aa000000b003cf5d41bea1mr39428515wmk.118.1669966061821;
        Thu, 01 Dec 2022 23:27:41 -0800 (PST)
Message-ID: <e7922267-9a87-8936-942e-e73a789672f9@linaro.org>
Date: Fri, 2 Dec 2022 08:27:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [QEMU][PATCH v2 07/11] hw/xen/xen-hvm-common: Use g_new and
 error_setg_errno
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-dev@xilinx.com
Cc: stefano.stabellini@amd.com, alex.bennee@linaro.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-8-vikram.garhwal@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202030003.11441-8-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/12/22 03:59, Vikram Garhwal wrote:
> Replace g_malloc with g_new and perror with error_setg_errno.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>   hw/xen/xen-hvm-common.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)


> @@ -717,7 +717,7 @@ void destroy_hvm_domain(bool reboot)
>       xc_interface *xc_handle;
>       int sts;
>       int rc;
> -
> +    Error *errp = NULL;
>       unsigned int reason = reboot ? SHUTDOWN_reboot : SHUTDOWN_poweroff;
>   
>       if (xen_dmod) {
> @@ -726,7 +726,7 @@ void destroy_hvm_domain(bool reboot)
>               return;
>           }
>           if (errno != ENOTTY /* old Xen */) {
> -            perror("xendevicemodel_shutdown failed");
> +            error_setg_errno(&errp, errno, "xendevicemodel_shutdown failed");

See "qapi/error.h":

  * = Passing errors around =
  *
  * Errors get passed to the caller through the conventional @errp
  * parameter.

Here you are not passing the error to the caller.

Maybe you are looking for the "qemu/error-report.h" API?

>           }
>           /* well, try the old thing then */
>       }


> @@ -857,16 +857,17 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
>                           MemoryListener xen_memory_listener)
>   {
>       int rc;
> +    Error *errp = NULL;
>   
>       state->xce_handle = xenevtchn_open(NULL, 0);
>       if (state->xce_handle == NULL) {
> -        perror("xen: event channel open");
> +        error_setg_errno(&errp, errno, "xen: event channel open");
>           goto err;
>       }
>   
>       state->xenstore = xs_daemon_open();
>       if (state->xenstore == NULL) {
> -        perror("xen: xenstore open");
> +        error_setg_errno(&errp, errno, "xen: xenstore open");
>           goto err;
>       }
>   

Ditto.

