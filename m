Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F817374395
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 19:44:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123253.232471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leLZY-00018k-Ot; Wed, 05 May 2021 17:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123253.232471; Wed, 05 May 2021 17:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leLZY-00015V-Lh; Wed, 05 May 2021 17:44:32 +0000
Received: by outflank-mailman (input) for mailman id 123253;
 Wed, 05 May 2021 17:44:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zu7P=KA=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1leLZX-00015P-CA
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 17:44:31 +0000
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e7ec46c-3aae-4770-a7b3-43cbc90c91ee;
 Wed, 05 May 2021 17:44:30 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 a10-20020a05600c068ab029014dcda1971aso1794126wmn.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 May 2021 10:44:30 -0700 (PDT)
Received: from [192.168.1.186]
 (host86-180-176-157.range86-180.btcentralplus.com. [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id f6sm24181718wru.72.2021.05.05.10.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 10:44:29 -0700 (PDT)
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
X-Inumbo-ID: 1e7ec46c-3aae-4770-a7b3-43cbc90c91ee
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ojVaaEUcq5yFWfKGP37S9IFum4ExwHTnU4DANKZUVC0=;
        b=F09lbqS2Jp9Mk94IzrycRvHhuUtDpQvmXn4KhrImDMIDNiSHov9ij6EwzeRyN1lgcn
         jAq5QqmOOuAc62s6ORKq9D/oujZaaYIwEVzedas63clK3twA1mhcLhzWuEFCmWAQUo5U
         Q7QyzJZVLxL7DcDbxREEeHRGz0V5FxBJOrO/MWWUv78ipZheqCE8qzmuaBBx9K0zPpyZ
         fQaZ4o1cGL9ivwi2/oFqGFsnYIWFy2Oyw946ZjLm0x0QA2Z21FkjpcMDtIwCoVVkR8Os
         J6fI7XREPbQe4GnIb9MeK0VeYGNoXwK5itvvTdPV9MfXF2/19mOEJkbTtbxS+VEbioXt
         sUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ojVaaEUcq5yFWfKGP37S9IFum4ExwHTnU4DANKZUVC0=;
        b=MP+0KswdHhm9eeRsWuxMQlAKUMLrh8mhAbwGCjs9vtHnX1wwb3E6IZMYteRlcO6F+B
         scJT+f6HEqpuRCsCQfisc2SuSwYQUAfscLGtD352F05wl0H5N6DYdQb3kf/KNu65FqS2
         TJP+jyHY/igDT9Twed13zymm4RPQbuPRxBae0Uc7UQvGhrEU1POQE2ddhb9kUO6Aher6
         ZreMQf1HVN4H5d2Wm7y76Pspj8f5B5duGg/ULI7VmQDgOFH4SYEI6+EyRqfC76343aXM
         gHFks7YFyWDTx+Z+2MDjt/kXPvzvGTuy1xokw+7/YQ8ZvCfgIAzwZtVPxLHqtNBWg+/3
         VOLg==
X-Gm-Message-State: AOAM5304Fc+qPLlCC/YWvyN0l2GG+mg/JVicZW+kaW6Ss/EbP1Z8u5F9
	qX/6tlXgAuL6/8iJOFGNIYU=
X-Google-Smtp-Source: ABdhPJyD4Xmy2bYWbn2ga0q7SPczJa65W03cnti5XHp4QguJjivbml8Wn45eEAn/1KgXS4ug/r7a9Q==
X-Received: by 2002:a1c:6606:: with SMTP id a6mr10938884wmc.160.1620236669808;
        Wed, 05 May 2021 10:44:29 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH] xen-block: Use specific blockdev driver
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Kevin Wolf
 <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org
References: <20210430163432.468894-1-anthony.perard@citrix.com>
Message-ID: <05554fc3-e900-e5b2-eef7-3155f8c9b4b4@xen.org>
Date: Wed, 5 May 2021 18:44:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210430163432.468894-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30/04/2021 17:34, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@citrix.com>
> 
> ... when a xen-block backend instance is created via xenstore.
> 
> Following 8d17adf34f50 ("block: remove support for using "file" driver
> with block/char devices"), using the "file" blockdev driver for
> everything doesn't work anymore, we need to use the "host_device"
> driver when the disk image is a block device and "file" driver when it
> is a regular file.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Paul Durrant <paul@xen.org>

> ---
>   hw/block/xen-block.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index 83754a434481..674953f1adee 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -728,6 +728,8 @@ static XenBlockDrive *xen_block_drive_create(const char *id,
>       XenBlockDrive *drive = NULL;
>       QDict *file_layer;
>       QDict *driver_layer;
> +    struct stat st;
> +    int rc;
>   
>       if (params) {
>           char **v = g_strsplit(params, ":", 2);
> @@ -761,7 +763,17 @@ static XenBlockDrive *xen_block_drive_create(const char *id,
>       file_layer = qdict_new();
>       driver_layer = qdict_new();
>   
> -    qdict_put_str(file_layer, "driver", "file");
> +    rc = stat(filename, &st);
> +    if (rc) {
> +        error_setg_errno(errp, errno, "Could not stat file '%s'", filename);
> +        goto done;
> +    }
> +    if (S_ISBLK(st.st_mode)) {
> +        qdict_put_str(file_layer, "driver", "host_device");
> +    } else {
> +        qdict_put_str(file_layer, "driver", "file");
> +    }
> +
>       qdict_put_str(file_layer, "filename", filename);
>       g_free(filename);
>   
> 


