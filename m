Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8EB5AE0C9
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 09:17:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399469.640648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSpn-0000Ho-FX; Tue, 06 Sep 2022 07:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399469.640648; Tue, 06 Sep 2022 07:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSpn-0000ER-CS; Tue, 06 Sep 2022 07:17:23 +0000
Received: by outflank-mailman (input) for mailman id 399469;
 Tue, 06 Sep 2022 07:17:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCHN=ZJ=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oVSpm-0000EJ-Gu
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 07:17:22 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f14fcb6a-2db3-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 09:17:19 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id bj12so21055930ejb.13
 for <xen-devel@lists.xenproject.org>; Tue, 06 Sep 2022 00:17:21 -0700 (PDT)
Received: from leoy-huanghe.lan ([104.245.99.30])
 by smtp.gmail.com with ESMTPSA id
 jr23-20020a170906515700b0073ddd36ba8csm6155158ejc.145.2022.09.06.00.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 00:17:20 -0700 (PDT)
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
X-Inumbo-ID: f14fcb6a-2db3-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=rl0u1aqEkK/yqRyJx+719gi2bJ4faMggjt+D/zEIqp8=;
        b=DWqrlnEhQoDijF4/BrL+LO8ixFulKUP8Qbft8FVqsV81OnQcaqRwyNlsl8Y55rredp
         PkuCeFROEuiOODehGXpxlMViU3yhkfFwpW3gVcpY7y+t1yips2cGFd3M9qHTaw8Xd9XV
         ymioNPOhN4FkEQjkkmQHHXQZl/NL4nsAv+eybQT94+OkS0WKkRv/ev0f4AlGv+NmYXfX
         Uux7WLsqWTT7RmqT6EU1j/vYRgbbC3h3NavMclFQGOSzt4N6T6pxO4MoLx8qsmIEX75o
         ghAJlC2vmNv3XjTGMP1z0tm3U/AU/skK0BbHxQdKvVcj9nPDdtsxgb6rRt0S4n08TRks
         FbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=rl0u1aqEkK/yqRyJx+719gi2bJ4faMggjt+D/zEIqp8=;
        b=1DuSfkZJSjD1qoiEtDpRmhulOf1+PQq42CW8W+HWujz8DczzP4xyiiO/W97g2RYPhY
         sZFRr9k17MET/Vx0jtSaWqcg8CtfkZlLcrE1x4B4AUL4kqzZwHDoY7nupFzGDGU/CVdk
         4/Tzxw7hE9XecIRaQelPRPY3b7Tl4AEy6SCbzjD98Rh0oMbYm1oMu3TtijvduiSfO+ca
         5BBnFHvc0RiGQVo1FfzkY2NYrvtk+sUDkiSR7dQkp5CtlvrTdYQD3Ztemwq8s2kyh35E
         aYo+5zBOW4WTF4pzaB/PSV0NAX7UL5Dipl0NixosWJ7lUBBvhp84Iv1sRpqDXvZWTZV9
         A3xw==
X-Gm-Message-State: ACgBeo0bzC6l77Olwf9Ugz57IdklyTpF4kpULe/ushGbeAx+hP3k6/Ni
	NFCp7GknEBj14JaI2zkvXThqhg==
X-Google-Smtp-Source: AA6agR5lf4dhGbtsv0f1ahlTaIg/tinOOaDKFBbeYz8+s4qYEj3F3TAjEaCrIlmnXrbK12lkELQljA==
X-Received: by 2002:a17:907:9603:b0:742:9ed3:3af2 with SMTP id gb3-20020a170907960300b007429ed33af2mr21431653ejc.510.1662448640559;
        Tue, 06 Sep 2022 00:17:20 -0700 (PDT)
Date: Tue, 6 Sep 2022 15:17:14 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Julien Grall <julien@xen.org>, Ard Biesheuvel <ardb@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Julien Grall <jgrall@amazon.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
Message-ID: <Yxbz+pOs5+1RkEkx@leoy-huanghe.lan>
References: <Yv5fii2GvIeHEHZX@leoy-yangtze.lan>
 <CAMj1kXGZ0ThmPT2FU4M07waB=Q9tXxs81TGTysV5dG5fm0D0Gw@mail.gmail.com>
 <871qtcsacd.wl-maz@kernel.org>
 <Ywcr1849LiEHezd3@leoy-huanghe>
 <12a8c169-55aa-5e9f-19f8-acd77ea2a8fe@xen.org>
 <YwdiDr2uLXGEl2TC@leoy-huanghe>
 <52f24132-ba2b-d4ab-ebd0-613f673b5658@xen.org>
 <YweJ6ZpRhMkT5bab@leoy-yangtze.lan>
 <CALZQ+UN8cQ4avggxqgjed=DsitfEteQpuhEqb+p747vmeFCyUA@mail.gmail.com>
 <87r10puiey.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r10puiey.wl-maz@kernel.org>

Hi Marc,

On Tue, Sep 06, 2022 at 07:27:17AM +0100, Marc Zyngier wrote:
> On Tue, 06 Sep 2022 03:52:37 +0100,
> Leo Yan <leo.yan@linaro.org> wrote:
> > 
> > On Thu, Aug 25, 2022 at 10:40:41PM +0800, Leo Yan wrote:
> > 
> > [...]
> > 
> > > > > But here I still cannot create the concept that how GIC RD tables play
> > > > > roles to support the para virtualization or passthrough mode.
> > > >
> > > > I am not sure what you are actually asking. The pending tables are just
> > > > memory you give to the GICv3 to record the state of the interrupts.
> > >
> > > For more specific, Xen has its own RD pending table, and we can use
> > > this pending table to set state for SGI/PPI/LPI for a specific CPU
> > > interface.  Xen works as hypervisor, it saves and restores the pending
> > > table according to switched in VM context, right?
> > >
> > > On the other hand, what's the purpose for Linux kernel's GIC RD
> > > pending table?  Is it only used for nested virtulisation?  I mean if
> > > Linux kernel's GIC RD pending table is not used for the drivers in
> > > Dom0 or DomU, then it's useless to pass it from the primary kernel to
> > > secondary kernel; as result, we don't need to reserve the persistent
> > > memory for the pending table in this case.
> > 
> > I don't receive further confirmation from Marc, anyway, I tried to cook
> > a kernel patch to mute the kernel oops [1].
> 
> What sort of confirmation do you expect from me? None of what you
> write above make much sense in the face of the architecture.

Okay, I think have two questions for you:

- The first question is if we really need to reserve persistent memory
  for RD pending table and configuration table when Linux kernel runs
  in Xen domain?

- If the first question's answer is no, so it's not necessary to reserve
  RD pending table and configuration table for Xen, then what's the good
  way to dismiss the kernel oops?

IIUC, you consider the general flow from architecture view, so you prefer
to ask Xen to implement EFI stub to comply the general flow for EFI
booting sequence, right?

If the conclusion is to change Xen for support EFI stub, then this
would be fine for me and I will hold on and leave Xen developers to work
on it.

> > [1] https://lore.kernel.org/lkml/20220906024040.503764-1-leo.yan@linaro.org/T/#u
> 
> I'm totally baffled by the fact you're trying to add some extra hacks
> to Linux just to paper over some of the Xen's own issues.

I have a last question for why kernel reserves RD pending table and
configuration table for kexec.  As we know, the primary kernel and
the secondary kernel use separate memory regions, this means there have
no race condition that secondary kernel modifies the tables whilist the
GIC accesses the table if the secondary kernel allocates new pages for
RD tables.  So only one potential issue I can image is the secondary
kernel sets new RD pending table and configuration table, which might
introduce inconsistent issue with rest RDs in the system.

Could you confirm if my understanding is correct or not?

Sorry for noise and many questions.  I understand this is a complex
and difficult topic for me, and it's very likely that I am absent
sufficient knowledge for this part, this is just what I want to
learn from the discussion and from you :-)

Thanks,
Leo

