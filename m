Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE982459614
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 21:30:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229058.396427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpFwz-0001m1-NQ; Mon, 22 Nov 2021 20:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229058.396427; Mon, 22 Nov 2021 20:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpFwz-0001iI-Jd; Mon, 22 Nov 2021 20:30:05 +0000
Received: by outflank-mailman (input) for mailman id 229058;
 Mon, 22 Nov 2021 20:30:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K8Dp=QJ=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1mpFwy-0001S2-3h
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 20:30:04 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8a3a359-4bd2-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 21:30:03 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id r25so45387198edq.7
 for <xen-devel@lists.xenproject.org>; Mon, 22 Nov 2021 12:30:03 -0800 (PST)
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
X-Inumbo-ID: f8a3a359-4bd2-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IuCHejB/LG0IUCSJQwdJZM4SkthWJomzEmtTIRN4NFc=;
        b=E+JnS2gdyDogfcWIPncObWBbwDwIkofmax0PlT7Vw62ZNWW1pwI+NgVH9Cbyxmmu09
         oeg46Y+WTJgI/LXD+8RHDVa6rtoZ6fS3z8cL9RAD6aj03chlrn2HigrSxAcv5crvIIlJ
         2fNxWTEMXym5kO4QoK0AGYsSEIo9Nwj4wXvZYF1FCP90feyijasdAx0NuLCFQNv5IJql
         y6ybTsGdJ8OzJ2W0Py4FfpXrz9pZnj4l37FCqerpg6M9EqfX1Au+RH5c54nv8zbqu5W9
         DabSEDgJc3DfQuMgbERURRqmwLBqVUTEVlu5zzwoJEExYIX4KGfY+V9er/D6RZGL8AnL
         VW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IuCHejB/LG0IUCSJQwdJZM4SkthWJomzEmtTIRN4NFc=;
        b=EYtYZWmqclASUCZyShATae6i+NMDvvU2cbgA8yZVJvzgzxhPmR9ktT21Ub+4s4GnO7
         1RxRTHc1DGQt5Wt+X0992pfWIl51mCss+SP42AP7aPFNxS1GM55npX4/HFbbjKCrkc+E
         hKdjfecG3rzeykLQ6LmUqUASjk+wqqlSree9eNgWh83ZhMTysNaB/Zdb9k9jgS8U6g+p
         0fNJAnNswQ5aVrH4CMUwA951B3nP5ZKVTwevjaU2D7P+X7jjnZfEuS74kDsfCTWKzU42
         PvBcfwKK3c6p84FskvQNuJOjSVpvbITT4NjhHLC1JUQll7MJRk88c8tfq3D9OwCeOEIk
         iEGA==
X-Gm-Message-State: AOAM533HBOi/bGxt38aocSkPVR9xKZJvCGRCHGcVEMQcE0nLX346oAyR
	qIgzCAG24r+dw2J4NS0VWp3Ax3ZM/dVXds2qEpw=
X-Google-Smtp-Source: ABdhPJzcATdSFt6cH9YPoPwXFVMBhSk6bApxWasc6aKwRz45QXkbCm9tlZTG4SjxpTtKVFKivRHdeuiO2SKbTXQymb8=
X-Received: by 2002:a17:906:dff1:: with SMTP id lc17mr44091140ejc.215.1637613002677;
 Mon, 22 Nov 2021 12:30:02 -0800 (PST)
MIME-Version: 1.0
References: <20211119165202.42442-1-ayankuma@xilinx.com> <647a76f8-fea9-57b3-eb64-82a67adba1fb@xen.org>
 <5a2f681a-c6ef-bc3a-ed09-e378dc6abc90@xilinx.com> <alpine.DEB.2.22.394.2111221157050.1412361@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2111221157050.1412361@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 22 Nov 2021 20:29:52 +0000
Message-ID: <CAJ=z9a1L5v2+wC7-aaA2PjV2FzrFXjT-5t_0ijznGKvwywvd5A@mail.gmail.com>
Subject: Re: [RFC PATCH] Added the logic to decode 32 bit ldr/str
 post-indexing instructions
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <wei.chen@arm.com>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, Jan Beulich <jbeulich@suse.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Rahul Singh <rahul.singh@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, 22 Nov 2021 at 19:59, Stefano Stabellini <sstabellini@kernel.org> wrote:
>
> On Mon, 22 Nov 2021, Ayan Kumar Halder wrote:
> > Stefano > It doesn't look like we are setting dabt->write anywhere.
> >
> > Ayan > Yes, this is a miss. Depending on the opc, this should be upadeted
> > accordingly in decode_64bit_loadstore_postindexing().
> >
> > Stefano > Also, is info.gpa in try_handle_mmio already updated in the
> > pre-index
> > case? If not, do we need to apply the offset manually here?
> >
> > Ayan > Sorry, I did not understand you. This patch is only related to the post
> > indexing ldr/str issue. Why do we need to check for pre-indexing ?
>
> I thought you were trying to handle both post-indexing and pre-indexing.
> It is OK if you intend to only handle post-indexing but considering that
> most of the code is shared between the two, we might as well also make
> pre-indexing work (unless it turns out it is more difficult).

Wouldn't this effectively be dead code?

>
> In the pre-indexing case, I would imagine we need to update the base
> address before taking any other actions.

From my understanding, this would have already been performed by the
HW when the syndrome is valid. This may also be the case for
the non-valid case, but I haven't checked the Arm Arm.

Cheers,

