Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9AE686D26
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 18:34:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488382.756435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNGzn-0002k5-PR; Wed, 01 Feb 2023 17:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488382.756435; Wed, 01 Feb 2023 17:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNGzn-0002hc-Mo; Wed, 01 Feb 2023 17:34:07 +0000
Received: by outflank-mailman (input) for mailman id 488382;
 Wed, 01 Feb 2023 17:34:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UnMf=55=gmail.com=bobbyeshleman@srs-se1.protection.inumbo.net>)
 id 1pNGzl-0002hW-Vq
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 17:34:06 +0000
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9daa0f9c-a256-11ed-b63b-5f92e7d2e73a;
 Wed, 01 Feb 2023 18:34:02 +0100 (CET)
Received: by mail-pf1-x42c.google.com with SMTP id a184so13118073pfa.9
 for <xen-devel@lists.xenproject.org>; Wed, 01 Feb 2023 09:34:02 -0800 (PST)
Received: from localhost (c-73-164-155-12.hsd1.wa.comcast.net. [73.164.155.12])
 by smtp.gmail.com with ESMTPSA id
 k81-20020a628454000000b00589a7824703sm11777283pfd.194.2023.02.01.09.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 09:33:59 -0800 (PST)
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
X-Inumbo-ID: 9daa0f9c-a256-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2hmwrUgUOIbjgvFn8W+IluO6qX/UXyIsHKI+wzMRXgg=;
        b=U9ZjveU9+peSh8EQCXwF2AHmHoS6Un9vWLs8lReKU/0kGU/mNenp5pUgy7TRvbNebB
         UiNAMboijyauBoIOvzS9PQyzTJoDfgiZaTFjlpT+YToDglGdMgHTST0tTvt4rl48wG25
         v2vyThYls+IwQUmbDAQ8FYI/CzUQ4pDB6a7U9MHU+6o4htIWTFu/7yeNf9s7WhbGqZ34
         QpuJlUBD20PjYJlVxjHCu0+FU43Ofu4oKsfTbJFkCdPUANpeO1VkhQDtf725AO1ViQKB
         2kO+DLll2egLhDUC9e2H20xQ/6qgZBv138uaj5TGjgQSsohJ8hIO6J2rT5FMn037VSXB
         Ay3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2hmwrUgUOIbjgvFn8W+IluO6qX/UXyIsHKI+wzMRXgg=;
        b=bu6Rji0nyTJUHVfx/qFalIJAa+1dkmwMgLBDUqZXRnXKv2mxotUJQyaJBv+t5d+YXS
         FlHJSgN4xnTE0yVkWSNeFl9C5fGqLQKSNVuCDpqhXhZoay43NzrWX4kMcLVTRno52EaV
         GW9zh7RWa1uC72Ghk/2jPpnv+pydbLslA6ystDjgP+tHCL2cPXfQY1dDGr+fvrbzfUgb
         B4eHPytCelBRekAjtlFDPEcwzyBiKPjtTIOQNoRIr5kYDIQ4lBoLHgACDS6xj6ZCO+w9
         qWu8PbdTBTfX4pTUAj5ur/fezI1sAmB+lII+a50r1fRZ0uzlHwLHkUJIje7pVmRPpP3z
         gdKQ==
X-Gm-Message-State: AO0yUKWjkCXjUnW13m4EdsHsGAIYgl0DRvq+aN+mfIqWVp2q/O4B1LSb
	/SLePmKVjlvm2NDB2rKCeHM=
X-Google-Smtp-Source: AK7set9QVGlj7ScO2rzN3XQJ0Wjt5oaaNjxzcbyA8EaCvKipqHYHSsHwEHMVK5Jmp3pOiQ8iCvJnsQ==
X-Received: by 2002:a62:d0c1:0:b0:593:e6d9:d4c0 with SMTP id p184-20020a62d0c1000000b00593e6d9d4c0mr3203892pfg.32.1675272840635;
        Wed, 01 Feb 2023 09:34:00 -0800 (PST)
Date: Wed, 1 Feb 2023 17:33:59 +0000
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <amc96@srcf.net>, Alistair Francis <alistair23@gmail.com>,
	Oleksii <oleksii.kurochko@gmail.com>,
	xen-devel@lists.xenproject.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Bobby Eshleman <bobby.eshleman@gmail.com>
Subject: Re: [PATCH v7 1/2] xen/riscv: introduce early_printk basic stuff
Message-ID: <Y9qih7mHbZBzAtUE@bullseye>
References: <cover.1674819203.git.oleksii.kurochko@gmail.com>
 <06c2c36bd68b2534c757dc4087476e855253680a.1674819203.git.oleksii.kurochko@gmail.com>
 <f5cd1bfb116bfcc86fc2848df7eead05cd1a24c0.camel@gmail.com>
 <CAKmqyKMGiDiPRZBekdKan=+YduSmkB2DoWo5btrtVQ8nS3KMAg@mail.gmail.com>
 <2f6a3b17-4e41-fe9a-1713-4942b3bd3585@xen.org>
 <CAKmqyKNwH4-D3dKGQEsW_Zup4OT32C1RwaA7_Sey4fo_jOzFcA@mail.gmail.com>
 <9d5841b2-5d0b-390f-6e95-cf492e99e5a2@srcf.net>
 <1a1e9b46-e665-f33a-b122-31a5af5b22da@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a1e9b46-e665-f33a-b122-31a5af5b22da@xen.org>

On Wed, Feb 01, 2023 at 09:06:21AM +0000, Julien Grall wrote:
> Hi Andrew,
> 
> On 01/02/2023 00:21, Andrew Cooper wrote:
> > On 31/01/2023 11:17 pm, Alistair Francis wrote:
> > > On Tue, Jan 31, 2023 at 10:03 PM Julien Grall <julien@xen.org> wrote:
> > > > On 31/01/2023 11:44, Alistair Francis wrote:
> > > > > On Sat, Jan 28, 2023 at 12:15 AM Oleksii <oleksii.kurochko@gmail.com> wrote:
> > > > > 
> > > >   From my understanding, on RISC-V, the use of PC-relative address is
> > > > only guaranteed with medany. So if you were going to change the cmodel
> > > > (Andrew suggested you would), then early_*() may end up to be broken.
> > > > 
> > > > This check serve as a documentation of the assumption and also help the
> > > > developer any change in the model and take the appropriate action to
> > > > remediate it.
> > > > 
> > > > > I think this is safe to remove.
> > > > Based on what I wrote above, do you still think this is safe?
> > > With that in mind it's probably worth leaving in then. Maybe the
> > > comment should be updated to make it explicit why we want this check
> > > (I find the current comment not very helpful).
> > 
> > The presence of this check pre-supposes that Xen will always relocate
> > itself, and this simply not true.  XIP for example typically does not
> > 
> > Furthermore it's not checking the property wanted.  The way C is
> > compiled has no bearing on what relocation head.S uses to call it.
> 
> I think we are still cross-talking each other because this is not my point.
> I am not sure how to explain differently...
> 
> This check is not about how head.S call early_*() but making sure the C
> function can be executed with the MMU off. In which case, you will likely
> have VA != PA.
> 
> In theory head.S could apply some relocations before hand, but it may be too
> complicated to do it before calling early_*().
> 
> > 
> > It is a given that we compile the hypervisor with a consistent code
> > model, meaning that the properly actually making the check do what is
> > wanted is also the property that means it is not needed in the first place.
> 
> See above.
> 
> > 
> > This check is literally not worth the bytes it's taking up on disk, and
> > not worth the added compiler time, nor the wasted time of whoever comes
> > to support something like XIP in the future finds it to be in the way.
> > Xen as a whole will really genuinely function as intended in models
> > other than medany, and it demonstrates a misunderstanding of the topic
> > to put in such a check to begin with.
> 
> Then enlight me :). So far it looks more like you are not understanding my
> point: I am talking about C function call with MMU off (e.g. VA != PA) and
> you are talking about Xen as a whole.
> 
> I guess the only way to really know is to implement a different model. At
> which point there are three possible outcome:
>   1) We had the compiler check, it fired and the developper will take action
> to fix it (if needed).
>   2) We have no compiler check, the developper knew what to do it and fixed
> it.
>   3) We have no compiler check, the developper where not aware of the
> problem and we will waste time.
> 

I tend to favor the check because outcome #1 is so desirable, and I do
think that checking for medany is sufficient for the bulk of future
work. But that said, I do see Andrew's point now.

If Xen were to a) not relocate itself, b) be executed under the 2GB
range, c) be compiled under medlow, and d) the MMU is off or on but Xen
is identity mapped, then C functions should still be safe to call in
early boot. Checking medany does protect developers from accidental bad
configuration now, but it is a somewhat imperfect proxy.

One alternative that may be more long term is for the self relocation
code to be Kconfig-able and to require/force medany. Anyone wanting to
develop something like XIP could deselect relocation, which would allow
them to use medlow if they wanted/needed. The early C functions would
still be callable under both in this case. The help strings could offer
explanation too.

Thanks,
Bobby

> Even if you disagree with the check, then I think 1 is still the best
> because it would explain our assumption. Yes it may waste a few minutes to
> the developer switching the model. But that probably nothing compare to the
> time you could waste if you don't notice it.
> 
> Anyway, Alistair has now all the information to take an informative
> decision.
> 
> Cheers,
> 
> -- 
> Julien Grall
> 

