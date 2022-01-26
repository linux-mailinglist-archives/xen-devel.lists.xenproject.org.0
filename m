Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3049049CB44
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 14:47:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260915.451185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCidx-0000vC-F1; Wed, 26 Jan 2022 13:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260915.451185; Wed, 26 Jan 2022 13:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCidx-0000nn-AH; Wed, 26 Jan 2022 13:47:25 +0000
Received: by outflank-mailman (input) for mailman id 260915;
 Wed, 26 Jan 2022 13:47:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xtl2=SK=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1nCidv-0000mK-OR
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 13:47:23 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ce8618c-7eae-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 14:47:22 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 n12-20020a05600c3b8c00b0034eb13edb8eso1917953wms.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jan 2022 05:47:22 -0800 (PST)
Received: from [10.7.237.6] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id p8sm3873089wrr.16.2022.01.26.05.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 05:47:21 -0800 (PST)
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
X-Inumbo-ID: 7ce8618c-7eae-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4VWrmponanBoZjuBiqM+aKR3MrRMA0UiGhMwRZriHI0=;
        b=JCXrVw5w8jmMfAHuQXyfZWeBFVP+FfRIIwA/nHcX4GH6GeLxKlZR6B4Oq/4IU8fhhB
         w5U/MwDVapNuCxttoSQIiVeqbQbPAGyt0jKJLjGDHNeKX8Qswfkt6l6iMsnuMqb4vot8
         HDpO1CwmmYiBaNA3/bBtfV3N+ixi5q+SiqaZHImKVcNKQWXKFeoA1H7H0RH1hRE7d/n2
         ZKGcrCZ2h6bm8s9kWePYdkrj3lUiaBkfhSXP5xyS8pQP9rqft1od306SPGNciA7MRSu4
         gpo554ksHPUu0fpj4LSkzTjQYKRaSzuPCTx9cCF4cF9UjuD0VlXSL9fPjoF9cm6ZnIDM
         HX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4VWrmponanBoZjuBiqM+aKR3MrRMA0UiGhMwRZriHI0=;
        b=qurjscOCrDaX3N0iYwrOxZIwPHcMO1l79/jabhDwg7U6Pu1fMBwNfd0HYS/EsW0n8e
         8C3faGPoKs9o14r8axX7gdyTNLj+/mMwmsSHXn3wXhtpdIqg1DjhKxJZlGFNKV/ATwCE
         jnNOlwIUXjZ8TZb+Qj14eF1CBxd0aOlOA+UTAKDgwiYXT0qFkTR+cL1PlkUcaZkYnu9K
         UXLDWrBCN8gikynHDsGHhpR9T1bqIcpYTSxjjSJS4BPCNfF1DSbRcXu9/4fFQAdNfNQb
         /9b90WpBKcq2s4vw6sleyN0PkgnmOH4OjY+PCdrynkEGRZIF3kGd6rH8+M7y9y0DFFHH
         4iBA==
X-Gm-Message-State: AOAM532gJDjpqeMXM9VSGzKRRx964vOMTbVDUahglqaxG0b4+WOAONDN
	a7V/PgOA9sffnv8ttDYU1kE=
X-Google-Smtp-Source: ABdhPJz6bCth0FuLHkr3FlcNdgVZJzrqlzHciCO36Yn2SuiNT64swHO+PdQ5i81QyfsYsH4Q5yvUlw==
X-Received: by 2002:a05:600c:4ec7:: with SMTP id g7mr7480705wmq.171.1643204842294;
        Wed, 26 Jan 2022 05:47:22 -0800 (PST)
Message-ID: <2ebaf0d6-a84a-e929-5ac2-597c81d40230@gmail.com>
Date: Wed, 26 Jan 2022 13:47:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Reply-To: paul@xen.org
Subject: Re: [PATCH] xen-hvm: Allow disabling buffer_io_timer
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
Cc: QEMU <qemu-devel@nongnu.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20211210193434.75566-1-jandryuk@gmail.com>
 <adfe1c14-f773-0592-e304-d80da8380cc0@gmail.com>
 <CAKf6xpv0=ex+OrFb1z4TpaULsmMaPQqmmsxoY_d4yJRt6Zx3sw@mail.gmail.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <CAKf6xpv0=ex+OrFb1z4TpaULsmMaPQqmmsxoY_d4yJRt6Zx3sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/01/2022 13:43, Jason Andryuk wrote:
> On Tue, Dec 14, 2021 at 8:40 AM Durrant, Paul <xadimgnik@gmail.com> wrote:
>>
>> On 10/12/2021 11:34, Jason Andryuk wrote:
>>> commit f37f29d31488 "xen: slightly simplify bufioreq handling" hard
>>> coded setting req.count = 1 during initial field setup before the main
>>> loop.  This missed a subtlety that an early exit from the loop when
>>> there are no ioreqs to process, would have req.count == 0 for the return
>>> value.  handle_buffered_io() would then remove state->buffered_io_timer.
>>> Instead handle_buffered_iopage() is basically always returning true and
>>> handle_buffered_io() always re-setting the timer.
>>>
>>> Restore the disabling of the timer by introducing a new handled_ioreq
>>> boolean and use as the return value.  The named variable will more
>>> clearly show the intent of the code.
>>>
>>> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>>
>> Reviewed-by: Paul Durrant <paul@xen.org>
> 
> Thanks, Paul.
> 
> What is the next step for getting this into QEMU?
> 

Anthony, can you queue this?

   Paul

> To re-state more plainly, this patch fixes a bug to let QEMU go idle
> for longer stretches of time.  Without it, buffer_io_timer continues
> to re-arm and fire every 100ms even if there is nothing to do.
> 
> Regards,
> Jason


