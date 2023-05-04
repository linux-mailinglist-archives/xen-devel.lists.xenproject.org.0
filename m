Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAA16F6D6C
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 16:01:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529785.824563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puZU8-0007nJ-Ia; Thu, 04 May 2023 13:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529785.824563; Thu, 04 May 2023 13:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puZU8-0007kM-F4; Thu, 04 May 2023 13:59:04 +0000
Received: by outflank-mailman (input) for mailman id 529785;
 Thu, 04 May 2023 13:59:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qVjO=AZ=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1puZU6-0007kG-Ry
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 13:59:02 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d22b68e6-ea83-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 15:59:00 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso4104285e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 May 2023 06:59:00 -0700 (PDT)
Received: from [192.168.2.1] (82-64-138-184.subs.proxad.net. [82.64.138.184])
 by smtp.googlemail.com with ESMTPSA id
 k1-20020a7bc301000000b003eddc6aa5fasm5024354wmj.39.2023.05.04.06.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 06:58:59 -0700 (PDT)
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
X-Inumbo-ID: d22b68e6-ea83-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20221208.gappssmtp.com; s=20221208; t=1683208740; x=1685800740;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=741OYHclmnary9o8QuEmWBLI/yLKwj6EVSWqvcmDpPk=;
        b=Ktoj4Y2WCFKxcd/Bza2FkWvcDKZaHrNjIp9fNFMB/s8f2XwFstTADuCWQlqwahabB1
         nuFtlvPM3aU9Iq5UhlTcalJERgrJGINvm1/05NnuA3L89nRgEPepkaJ+E0f3Dn5Qai6T
         y3Ny/8rjCrjgV6W1W3upx51duZdUMdIpG53mapkad30WPe2BE+uFBZx4vpf2yGzCerU7
         Y8JDR4dxk1f+Uke9oXCEC6xoS4FO5POEs91cgFvpN7JBgDwmA/Xb43lX4kjZI2TWkuO3
         rXYvU5SCfiykJGHPap2ki5o8eQj+8rGb9ExUgJG46GG4CIpLPdRuMrbXnM75F147QyH2
         u46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683208740; x=1685800740;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=741OYHclmnary9o8QuEmWBLI/yLKwj6EVSWqvcmDpPk=;
        b=dAV4FcsaE7TcXqwMSg1yCFz2opC72hm6EnD/llRVMUxzKr9A/ohX+TnwP+P9cM/Wzk
         HJQJXkhaXSwNsTwdaNgQJF76tnV5//Mvy8sFwXFqlIxmSC6LhyHIo23rs7PHjJTPHZ2t
         Xw25EaKjvONLdYBEe7sU7SSNtTMII/bgjeyxrOa8snQZNznhrIiHFfbxh6aTLL09hSBN
         m6L9/R/yfwku43fyss4xFqUhJGazcQu95ILJP5OFsJ/cC9ASgivSTBAwzeqsGtrS/8/I
         XNyzAAoJxJWaT2WKkZUlnT616uTEMzzYwlZUai1bxgYRbhiKgmw6v/3xNH2ittiue6Fs
         UMug==
X-Gm-Message-State: AC+VfDwqeoXCwcJbMTfbE7xhpKWLZAsFz33GTjSrsNx4Ki+rgTtdtsc7
	m+omT3P0lJpi9Vnw/Pca8FVc2Hya4w2HlQp8zm8uIw==
X-Google-Smtp-Source: ACHHUZ4vGVlTodkKYjJUmbu4stY+lxNumSzjMlNzBnYPHHXxS4yamNQKYTPQb180khL0pdtR1pRp/A==
X-Received: by 2002:a7b:c015:0:b0:3f1:662a:93d0 with SMTP id c21-20020a7bc015000000b003f1662a93d0mr17906533wmb.15.1683208740096;
        Thu, 04 May 2023 06:59:00 -0700 (PDT)
Message-ID: <50bf6b82-965b-d17c-7c5a-49c703991504@rabbit.lu>
Date: Thu, 4 May 2023 15:58:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: zithro <slack@rabbit.lu>
Subject: Re: xenstored: EACCESS error accessing control/feature-balloon 1
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
 <edwin.torok@cloud.com>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Yann Dirson <yann.dirson@vates.fr>
References: <3065c524-07c7-6458-ff4c-ba68ff78c946@rabbit.lu>
 <474b531f-2067-a5d4-8b01-5b8ef1f7061d@citrix.com>
 <678df1ff-df18-b063-eda3-2a1aed6d40f8@vates.fr>
Content-Language: en-US
In-Reply-To: <678df1ff-df18-b063-eda3-2a1aed6d40f8@vates.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

[ snipped for brevity, report summary:
XAPI daemon in domU tries to write to a non-existent xenstore node in a 
non-XAPI dom0 ]

On 12 Apr 2023 18:41, Yann Dirson wrote:
> Is there anything besides XAPI using this node, or the other data
> published by xe-daemon?

On my vanilla Xen (ie. non-XAPI), I have no node about "balloon"-ing in 
xenstore (either dom0 or domU nodes, but I'm not using ballooning in both).

> Maybe the original issue is just that there is no reason to have
> xe-guest-utilities installed in this setup?

That's what I thought as I'm not using XAPI, so maybe the problem should 
only be addressed to the truenas team ? I posted on their forum but got 
no answer.
I killed the 'xe-daemon' in both setups without loss of functionality.

My wild guess is that 'xe-daemon', 'xe-update-guest-attrs' and all 
'xenstore* commands' are leftovers from when Xen was working as a dom0 
under FreeBSD (why would a *domU* have them ?).


But Julien Grall went further by reacting to a suggestion by Yann Dirson 
(no snip here so you have the full patch details) :

On 12 Apr 2023 22:04, Julien Grall wrote:
>  From a brief look, this is very similar to the patch below that was 
> sent 3 years ago. I bet no-one ever tested the driver against libxl.
> 
> commit 30a970906038
> Author: Vitaly Kuznetsov <vkuznets@redhat.com>
> Date:   Tue Sep 4 13:39:29 2018 +0200
> 
>      libxl: create control/sysrq xenstore node
> 
>      'xl sysrq' command doesn't work with modern Linux guests with the 
> following
>      message in guest's log:
> 
>       xen:manage: sysrq_handler: Error -13 writing sysrq in control/sysrq
> 
>      xenstore trace confirms:
> 
>       IN 0x24bd9a0 20180904 04:36:32 WRITE (control/sysrq )
>       OUT 0x24bd9a0 20180904 04:36:32 ERROR (EACCES )
> 
>      The problem seems to be in the fact that we don't pre-create 
> control/sysrq
>      xenstore node and libxl_send_sysrq() doing libxl__xs_printf() 
> creates it as
>      read-only. As we want to allow guests to clean 'control/sysrq' 
> after the
>      requested action is performed, we need to make this node writable.
> 
>      Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>      Acked-by: Wei Liu <wei.liu2@citrix.com>
> 
> diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
> index 60676304e9b5..dcfde7787e2c 100644
> --- a/tools/libxl/libxl_create.c
> +++ b/tools/libxl/libxl_create.c
> @@ -695,6 +695,9 @@ retry_transaction:
>                           GCSPRINTF("%s/control/feature-s4", dom_path),
>                           rwperm, ARRAY_SIZE(rwperm));
>       }
> +    libxl__xs_mknod(gc, t,
> +                    GCSPRINTF("%s/control/sysrq", dom_path),
> +                    rwperm, ARRAY_SIZE(rwperm));
>       libxl__xs_mknod(gc, t,
>                       GCSPRINTF("%s/device/suspend/event-channel", 
> dom_path),
>                       rwperm, ARRAY_SIZE(rwperm));
> 
>>
>> I suspect the best (/least bad) thing to do here is formally introduce
>> feature-ballon as a permitted node, and have the toolstack initialise it
>> to "" like we do with all other nodes, after which TrueNAS ought to be
>> able to set it successfully and not touch it a second time.
> 
> +1. This would match how libxl already deal "feature-s3" & co.

So, I will file a bug against truenas anyways, but are you going to 
alter the xenstore/toolstack ?
In that case it may be good to tell them at the same time.

Thanks all,

Kind regards,

zithro/Cyril

