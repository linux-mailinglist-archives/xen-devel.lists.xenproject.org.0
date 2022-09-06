Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E925AF711
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:39:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400235.641948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgIP-0007DZ-4r; Tue, 06 Sep 2022 21:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400235.641948; Tue, 06 Sep 2022 21:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgIO-000710-79; Tue, 06 Sep 2022 21:39:48 +0000
Received: by outflank-mailman (input) for mailman id 400235;
 Tue, 06 Sep 2022 21:39:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCHN=ZJ=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oVgHL-0000Cs-69
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:38:43 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77817fd5-2df6-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 17:13:31 +0200 (CEST)
Received: by mail-pl1-x62a.google.com with SMTP id u22so11572406plq.12
 for <xen-devel@lists.xenproject.org>; Tue, 06 Sep 2022 08:13:31 -0700 (PDT)
Received: from leoy-huanghe.lan (n058152048222.netvigator.com. [58.152.48.222])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00176ae5c0f3dsm4612341plb.171.2022.09.06.08.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 08:13:29 -0700 (PDT)
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
X-Inumbo-ID: 77817fd5-2df6-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=jA89J5PXWFSo0e0TqoV7gOHS44VOEBuMtm2R8Su092w=;
        b=cp2rtOrnzJS3wbldxOBy+V7nGWzxJIjTr7pwwkD0dyDexznSGikxJRK2/RzvLruA0z
         E8H9PSYBBQCpo4oJ9h3xdPtkRgaSeKUEjQwXyDXffk0WfQPi2oDNMzR+VI/xJiMHNtBD
         fKEtVgDoG7NpQKnzwV1Is1k2koaW44tUhY1OFMqXlvaXUKe1s+bQlfeMJBp3d9YHgynu
         IIznmJ6v+DnQ++XXPtpNZzxBrwArAAXjsmqZpkrmKKmzELd2EsABKSMkkHUzPWgJ1NLY
         N63bMg8XkRc20GX7QaiDXS2t6juTD97kzcUDP6DUe1CoL4NYx3jYDgSLNuCH3TD1z3EP
         SrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=jA89J5PXWFSo0e0TqoV7gOHS44VOEBuMtm2R8Su092w=;
        b=6NIdTXZpfdbKbU9Sn5jSAp/v/BOXGDyYTL471NT1UwC1FxuAVQvJNnk0/LQQEwBNF6
         I87L9IXADzem0zsseiJVfI/vyfoixGvHGtZZ0Wl9ODNzXnq2VefJ+yBTXjoFL10NSQle
         YetMio83uKfKI0sWbemd68XA5KFoHwjQn/18Sf1x6DYeSFmb3K/NkWvWZ9pm2bG7C1Z7
         9iVPDJEksEClmk8zy/QEIO5CjWfv9YcxC071AYhpcIkpgrOkU3ijEsbd6NeXTmjkqzDX
         p5AVHmvhvbsH/0Qgc3hs8zD3OlQ/hRXnNT3Hi0DwS6RZG1+8LbWuGRCDUbZ8jtYwH7YE
         Izrw==
X-Gm-Message-State: ACgBeo3hsLo0e/tTXD2UCimuZAm3+WoeSZ+AM+TsJFDHwwz2Mhy+DCUc
	StG37ukCxu47Xx+/4bu33LOVuw==
X-Google-Smtp-Source: AA6agR4WewInFzFmv6YhxACWQaFEDh/Lc3sUXlRsCzH7xXMcaUoc77SE2+K7/mZAaAGR6MRmT7o+LA==
X-Received: by 2002:a17:902:e844:b0:172:d21c:3fe2 with SMTP id t4-20020a170902e84400b00172d21c3fe2mr54473636plg.43.1662477210088;
        Tue, 06 Sep 2022 08:13:30 -0700 (PDT)
Date: Tue, 6 Sep 2022 23:13:25 +0800
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
Message-ID: <YxdjlddwusPJ4GTU@leoy-huanghe.lan>
References: <871qtcsacd.wl-maz@kernel.org>
 <Ywcr1849LiEHezd3@leoy-huanghe>
 <12a8c169-55aa-5e9f-19f8-acd77ea2a8fe@xen.org>
 <YwdiDr2uLXGEl2TC@leoy-huanghe>
 <52f24132-ba2b-d4ab-ebd0-613f673b5658@xen.org>
 <YweJ6ZpRhMkT5bab@leoy-yangtze.lan>
 <CALZQ+UN8cQ4avggxqgjed=DsitfEteQpuhEqb+p747vmeFCyUA@mail.gmail.com>
 <87r10puiey.wl-maz@kernel.org>
 <Yxbz+pOs5+1RkEkx@leoy-huanghe.lan>
 <87leqxq6qp.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87leqxq6qp.wl-maz@kernel.org>

On Tue, Sep 06, 2022 at 08:53:02AM +0100, Marc Zyngier wrote:

[...]

> > Okay, I think have two questions for you:
> > 
> > - The first question is if we really need to reserve persistent memory
> >   for RD pending table and configuration table when Linux kernel runs
> >   in Xen domain?
> 
> I have no idea, and really I don't want to know. The architecture
> doesn't make it safe to reuse that memory, and the driver does the
> right thing by always reserving that memory when the FW is supposed to
> support it.
> 
> The "oh but it is safe on so and so" approach doesn't scale. If you
> want to have such a thing, just convince people at ARM that it is
> possible to implement a GICv3-compliant system without the RD tables,
> get them to update the architecture to allow this scheme and advertise
> it in a discoverable register. Xen could then implement it, Linux
> could check this bit, and we'd all be a happy family.

I agree that my patch is not based on a scale approach, this is also
my concern.

To be honest, convincing Arm GIC team is a bit out of my working scope.
I am working on automative project, when I saw verbose log with bunch of
kernel warnings with Xen, it motivated me to chase down, this is the
main reason I tried to explore some solutions at here.

> Because that's really what this is: it isn't that you don't care about
> the RD tables being reserved. It is that you don't care about them at
> all because they are never used by Xen as the GIC implementation. Your
> approach of "huh, let's not reserve it" just papers over this.

> > - If the first question's answer is no, so it's not necessary to reserve
> >   RD pending table and configuration table for Xen, then what's the good
> >   way to dismiss the kernel oops?
> 
> A warning, not an oops.
> 
> > 
> > IIUC, you consider the general flow from architecture view, so you prefer
> > to ask Xen to implement EFI stub to comply the general flow for EFI
> > booting sequence, right?
> 
> If you want to use ACPI, you use EFI, and not a vague emulation of
> it. If you use DT, you can reserve the memory upfront. The various
> alternatives are in this thread.

Given I proposed two fixes, one is for Xen and another is for kernel,
but both are rejected, so I would like to hold on a bit for this.

Maybe it's a good point for Xen maintainers to review if it needs to
support EFI stub, or welcome any other suggestions.

> > If the conclusion is to change Xen for support EFI stub, then this
> > would be fine for me and I will hold on and leave Xen developers to work
> > on it.
> > 
> > > > [1] https://lore.kernel.org/lkml/20220906024040.503764-1-leo.yan@linaro.org/T/#u
> > > 
> > > I'm totally baffled by the fact you're trying to add some extra hacks
> > > to Linux just to paper over some of the Xen's own issues.
> > 
> > I have a last question for why kernel reserves RD pending table and
> > configuration table for kexec.  As we know, the primary kernel and
> > the secondary kernel use separate memory regions,
> 
> No, you got it wrong. Only with *kdump* do you get separate memory
> regions. kexec reuses all of the memory visible by the primary kernel.

Thanks for correction.

> > this means there have
> > no race condition that secondary kernel modifies the tables whilist the
> > GIC accesses the table if the secondary kernel allocates new pages for
> > RD tables.  So only one potential issue I can image is the secondary
> > kernel sets new RD pending table and configuration table, which might
> > introduce inconsistent issue with rest RDs in the system.
> > 
> > Could you confirm if my understanding is correct or not?
> 
> It isn't correct.
> 
> - There is no race condition. Once the RD tables are configured, they
>   cannot be changed.
> 
> - When the kdump kernel boots, none of the primary OS memory is
>   reused, so it is safe to continue and use the same tables in place
> 
> - When the kexec kernel boots, all of the memory except for the
>   reserved memory is reused. If your RD tables are used for anything,
>   you'll see memory corruption as the GIC writes pending bits in the
>   pending table, and you'll be unable to configure interrupts
>   correctly.

This gives me impression that when do a power cycle, CPUs are reset
but GIC is still alive, so for every booting time the same memory
region should be reserved for RD tables.

To be honest, it's a bit weird for me that if a system cannot reset
CPUs and GIC together.

> In conclusion, using kexec with GICv3 is completely unsafe if you
> don't reserve the memory allocated to the RDs.
> 
> > Sorry for noise and many questions.  I understand this is a complex
> > and difficult topic for me, and it's very likely that I am absent
> > sufficient knowledge for this part, this is just what I want to
> > learn from the discussion and from you :-)
> 
> I suggest you read the architecture spec, which has all the details.

Thank you for many suggestions!  I read a bit for GICv3/v4 arch spec
at last week, but I need to do more homework.

Thanks,
Leo

