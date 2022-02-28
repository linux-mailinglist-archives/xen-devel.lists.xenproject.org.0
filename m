Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A764C777C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 19:21:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280724.478768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOkch-0005ZV-Sg; Mon, 28 Feb 2022 18:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280724.478768; Mon, 28 Feb 2022 18:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOkch-0005Xf-Pi; Mon, 28 Feb 2022 18:19:51 +0000
Received: by outflank-mailman (input) for mailman id 280724;
 Mon, 28 Feb 2022 18:19:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VtgV=TL=gmail.com=this.is.a0lson@srs-se1.protection.inumbo.net>)
 id 1nOkcf-0005XX-Tx
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 18:19:50 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01a01c52-98c3-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 19:19:48 +0100 (CET)
Received: by mail-qv1-xf35.google.com with SMTP id d3so13966050qvb.5
 for <xen-devel@lists.xenproject.org>; Mon, 28 Feb 2022 10:19:46 -0800 (PST)
Received: from development (c-73-166-253-254.hsd1.tx.comcast.net.
 [73.166.253.254]) by smtp.gmail.com with ESMTPSA id
 p20-20020a05620a22b400b00648ca1458b4sm5303454qkh.5.2022.02.28.10.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:19:44 -0800 (PST)
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
X-Inumbo-ID: 01a01c52-98c3-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5yx/d6Vxb/4eHUVrcRLPUEMBCOXADteCGvx/kV/VGSM=;
        b=PnXCi02pjarlYqMAHVYG1Z2Eji2JMmqQNoyUbx3t7UptrnT/ro9EshSdr6stDoNR1J
         32agAXSWu1ltNmdnHeauh1bVe2M7hwzT3PH2JBAiYL8sYs8e43qzwEpEfn1S8CC8kGVo
         ELIW6wqRGtJh5QlhsRBpqNzI55LPXJOAdocf/qkQeB1nGxOBUfVzs77YCotatUEDTQE9
         sU/6GMH9LOLlJVXneDzfEbSv8NlORtCH2OiHIEN3bH9y7o2GjODTH0tWRCzob4ITLVJT
         Stmxzoq7yWNNcDaBj2OjEHbusbQkJcrr8QzqvsuLWahgL/xrPk/MVxQQy0ic6wVQ3cb5
         BkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5yx/d6Vxb/4eHUVrcRLPUEMBCOXADteCGvx/kV/VGSM=;
        b=YcMazFx2BlKiVThzcbz++79stZ17oB/nodG0RjtTSoz3WVJyfJ6wrk2EVI63qQoXJG
         mmbk7Hwy8o4xxOy1OyqG0Sw08vko+RGGlI8E+I8dFxSjFBhY7oFHcexAHb0501m9QMaj
         fMH3y9N2CxQFOdwV7ivhYoC8t0zAEv0WNvw4bT+2CNeRYiuzwAIrsYTU0EYdx/u6XyXY
         k9vZH0GN78plMJ3YsEMqcEf9IsfevTUISVp6OiMmvh6LQgdcTmy4x9RzKtMvcu5WF4f7
         JSGKnaFNsv9PqwXQlngQM0oGgIxw3W5P0Cg1pC10vMvdjm/S0+3CQVou4fvacxC/soMg
         hLqQ==
X-Gm-Message-State: AOAM5318rRmJeyrEj4kxOiOTcc+1Z3S+paxCZBsw32BHVgBEP24QiWIs
	FJFN8JChcurQ7Zp2mevxv90LiLjsOHoBjw==
X-Google-Smtp-Source: ABdhPJyAQJDZroUeWUXPGxWa7C21PdRZq/jdNNzeOfKbW6wPnzHHN/fBrXhL7F7oxLwkNQ8CEqLAeA==
X-Received: by 2002:a05:622a:1713:b0:2de:889:f00d with SMTP id h19-20020a05622a171300b002de0889f00dmr16931778qtk.169.1646072384892;
        Mon, 28 Feb 2022 10:19:44 -0800 (PST)
Message-ID: <3986c91f62cb1bf3a042f669c40b900653f1ab51.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] vpci/msix: fix PBA accesses
From: Alex Olson <this.is.a0lson@gmail.com>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Date: Mon, 28 Feb 2022 12:19:43 -0600
In-Reply-To: <Yhn8rzRIC/TNiPv2@Air-de-Roger>
References: <20220225153956.1078-1-roger.pau@citrix.com>
	 <20220225153956.1078-3-roger.pau@citrix.com>
	 <d8da3251985684ab9099ce95a8329a7e35535a7b.camel@gmail.com>
	 <Yhn8rzRIC/TNiPv2@Air-de-Roger>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Roger,

The revised patch looks good.  The PBA writes seen during ioatdma driver
initialization (self-test) complete successfully and the driver doesn't complain
(I see two interrupts per ioatdma device).   The driver has a self-test feature
which appears to exercise MSIX interrupts and has code which appears to cause a
PBA write.

Feel free to add "Tested-by: Alex.Olson@starlab.io" to your patchset.

Thanks also for the pointer to your 2018 work on SR-IOV, I'll give it a try. 


FYI, with this patch,  I was seeing  msix_read() and msix_write() being called
during the driver's self-test on physical address 0xfbc01800, corresponding to
the beginning of the PBA (lspci excerpt below):


02:00.0 System peripheral: Intel Corporation Xeon Processor D Family QuickData Technology Register DMA Channel 0
...
        Region 0: Memory at fbc06000 (64-bit, non-prefetchable) [size=8K]
...
        Capabilities: [ac] MSI-X: Enable+ Count=1 Masked-
                Vector table: BAR=0 offset=00001000
                PBA: BAR=0 offset=00001800
...
        Kernel modules: ioatdma



The functions involved on the Linux kernel side are:

ioat_probe()
 -> ioat3_dma_self_test()
  -> ioat_dma_self_test()
   -> ioat_free_chan_resources()
    ->  ioat_reset_hw()

drivers/dma/ioat/dma.c:   ioat_reset_hw()
...
    ioat_dma->msixpba = readq(ioat_dma->reg_base + 0x1800);
...
    writeq(ioat_dma->msixpba, ioat_dma->reg_base + 0x1800);


Thanks,

-Alex

On Sat, 2022-02-26 at 11:10 +0100, Roger Pau Monné wrote:
> On Fri, Feb 25, 2022 at 11:57:05AM -0600, Alex Olson wrote:
> > I think there is an issue in the spin_lock handling of patch 2 for the
> > "msix_write" function as it results in the lock being taken a second time
> > while
> > held (hangs). 
> > 
> > The lock taken before checking "VMSIX_ADDR_IN_RANGE" isn't unlocked for the
> > non-
> > PBA case and a second lock is attempted just before the call to get_entry()
> > later in the same function.  It looks like either the added lock should
> > either
> > be moved inside the PBA case or the lock before get_entry() should be
> > removed.
> 
> Sorry, was in a rush to send this before leaving yesterday and didn't
> refresh the commit before generating the patch, v2.1 should be fixed.
> 
> Could you provide a 'Tested-by' if it work for you?
> 
> > On my server, upon loading the ioatdma driver, it now successfully attempts
> > an
> > PBA write (which now doesn't crash the system), but I'm not sure I have a
> > way to
> > fully exercise it...
> 
> Urg, that's weird, PBA should be read-only only according to the spec.
> Writes to PBA have undefined behavior.
> 
> > I also see a different (related) issue in which modify_bars is called on a
> > virtual function seemingly before the BAR addresses are initialized/known
> > and
> > will start a different thread for that topic.
> 
> SR-IOV is not supported on PVH dom0 yet, so that's not going to work.
> I've posted a series in 2018 to enable it, but sadly had no time to
> work on it anymore:
> 
> https://lore.kernel.org/xen-devel/20180717094830.54806-1-roger.pau@citrix.com/
> 
> It's likely not going to apply cleanly, and there's a lot of comments
> to be fixed up there.
> 
> Thanks, Roger.


