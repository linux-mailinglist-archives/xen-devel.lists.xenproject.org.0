Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0188FB36BAB
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 16:48:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094698.1449948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquxo-0003L7-BI; Tue, 26 Aug 2025 14:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094698.1449948; Tue, 26 Aug 2025 14:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquxo-0003Je-8V; Tue, 26 Aug 2025 14:47:56 +0000
Received: by outflank-mailman (input) for mailman id 1094698;
 Tue, 26 Aug 2025 14:47:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Or/=3G=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uquxm-0003JX-8k
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 14:47:54 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4fff7d1-828b-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 16:47:53 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45a1b004a31so43894905e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 07:47:53 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c7119c4200sm16453015f8f.53.2025.08.26.07.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 07:47:52 -0700 (PDT)
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
X-Inumbo-ID: a4fff7d1-828b-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756219672; x=1756824472; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TrnhhXIbSz2xUUxxE43S3WDwnGU6xIjyhEbvvALbdEQ=;
        b=teGkklPmv/2f4NzR9TldTyjh5Bvnz3p1XxBsPdXRNdtBNEN6iA5JiyarLpoipoaqKU
         1vCXINIdnF/2pQnobnKiqdC0BDB3aQa/71cR3Q2rta31fYbA22r9YE7SRq1fmv6d5EnX
         jAZzKilgDMUrdFiXq8aSxdrwa1TiE8SsZWFAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756219672; x=1756824472;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TrnhhXIbSz2xUUxxE43S3WDwnGU6xIjyhEbvvALbdEQ=;
        b=lA0rMpHGPfHdreNd9wV4NgGrb1lkoNKcQB2tREpFz0lqVEJSKGrur5QWFbbpM+hSmV
         p0IKkiaRtsb0ERvABNTggojU36DQp52kel8bAjXPFDSUvJH9TB1VTsOUppx56YI9Eufw
         ObzSgmmr/B622bkLZWltkQO0rd8yx/EyGK0t2VuwEsRZfE2GajPBMcx36Qzcdq3s2kBB
         SX7YQv2DdEvboAAf1DF1h9RiQuRx8SBF1rmiCgi8QFzHUfj9MU0GVLCvRdUZdXEcq4/L
         RQLKI7WSx0aYbnYtEt+R4KFrObgnjGJ9RHa+B1reS1TZFKP22ekPNlB5AgHSVpFM1V9x
         Qn9A==
X-Forwarded-Encrypted: i=1; AJvYcCVsoGU4mT5TxZeAxp3IGLx+p5AVIX3OhkMRRX/v83h1akGrRZ8hQzGf6rcBpyfB82eoUofwMfKtWNk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfmbPfPc4Hsjzf0sNuvN1vHUSzeXhRQXio/zCpyDSbShf1Dagt
	Ti+hEOdwfQZ5rD9cM/GZM91HG4fMJzlt42obWuwKzeMGV5RjeFh/1TqDFWoilf/g0VU=
X-Gm-Gg: ASbGnct1+OjB1ZeO2oUOSKQswo6/D5ao8oik2wBfOkebOONGJopd5OZBXCvRMdBUVlp
	eDHDedt/DPSsn9JPy3LVf7RRMjYh9UQHvBYqsG4NAAoSm4oaTTrc4m/VoBEqIurfk/5bsJ2bRg9
	4Z1sPXTYI2SRjybBbKF488pnJOrAAOoIS5fosf5OWdAXYYiwKGUM7kVlJzvWhdIJUEwbo6OmrdE
	KP7VmTy5qnjQumrXNMA/R/i4OrnPKBvHoBqeflHBMdpI7gN4ZfrHOHTf/5s0Y8sromEjsNZX4Ts
	L0h4a3i2n4/zqCozrWO4c3t0cwC1XelQuNp1BlCO9x7f3YkrFOMaLf6vSwdk82z53DC28nPKo6W
	h/4pu69LbM1gXHw0zbLt+nXLtagdVDcLI2SUUu3eKbM/7DIU3oFe0YDcrpzXCrZ8URXgFWOc=
X-Google-Smtp-Source: AGHT+IG/zoA3/JJPjJ5HbpDg9sLVVQH20QQf2tNggWn/naGVvfDeIswjUjsYVpfoyp0e9Tr86zqUDQ==
X-Received: by 2002:a05:600c:1c20:b0:458:c059:7d9c with SMTP id 5b1f17b1804b1-45b5d48ea24mr92009545e9.6.1756219672303;
        Tue, 26 Aug 2025 07:47:52 -0700 (PDT)
Date: Tue, 26 Aug 2025 16:47:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: MSI-X cleanup(?) issue with passthrough after domU restart
Message-ID: <aK3JFqFHMZgWHzy7@Mac.lan>
References: <aK0St0oUkJzR9lO0@mail-itl>
 <2aafbace-3aa2-4f58-8f6c-2815cd2315ad@suse.com>
 <aK1wSKTg5LcuzBDc@macbook.local>
 <aK2TLuB_yKlWjFgM@mail-itl>
 <aK28ubf5F3x-of3X@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aK28ubf5F3x-of3X@mail-itl>

On Tue, Aug 26, 2025 at 03:55:05PM +0200, Marek Marczykowski-Górecki wrote:
> On Tue, Aug 26, 2025 at 12:57:50PM +0200, Marek Marczykowski-Górecki wrote:
> > On Tue, Aug 26, 2025 at 10:28:56AM +0200, Roger Pau Monné wrote:
> > > On Tue, Aug 26, 2025 at 08:16:56AM +0200, Jan Beulich wrote:
> > > > On 26.08.2025 03:49, Marek Marczykowski-Górecki wrote:
> > > > > Hi,
> > > > > 
> > > > > I'm hitting an MSI-X issue after rebooting the domU. The symptoms are
> > > > > rather boring: on initial domU start the device (realtek eth card) works
> > > > > fine, but after domU restart, the link doesn't come up (there is no
> > > > > "Link is Up" message anymore). No errors from domU driver or Xen. I
> > > > > tracked it down to MSI-X - if I force INTx (via pci=nomsi on domU
> > > > > cmdline) it works fine. Convincing the driver to poll instead of waiting
> > > > > for an interrupt also workarounds the issue.
> > > > > 
> > > > > I noticed also some interrupts are not cleaned up on restart. The list
> > > > > of MSIs in 'Q' debug key output grows:
> > > > > 
> > > > >     (XEN) 0000:03:00.0 - d22 - node -1  - MSIs < 41 42 43 44 45 46 47 >
> > > > >     restart sys-net domU
> > > > >     (XEN) 0000:03:00.0 - d24 - node -1  - MSIs < 41 42 43 44 45 46 47 48 >
> > > > >     restart sys-net domU
> > > > >     (XEN) 0000:03:00.0 - d26 - node -1  - MSIs < 41 42 43 44 45 46 47 48 49 >
> > > > > 
> > > > > and 'M' output is:
> > > > > 
> > > > >     (XEN)  MSI-X   41 vec=b1 lowest  edge   assert  log lowest dest=00000001 mask=1/H /1
> > > > >     (XEN)  MSI-X   42 vec=b9 lowest  edge   assert  log lowest dest=00000004 mask=1/HG/1
> > > > >     (XEN)  MSI-X   43 vec=c1 lowest  edge   assert  log lowest dest=00000010 mask=1/HG/1
> > > > >     (XEN)  MSI-X   44 vec=d9 lowest  edge   assert  log lowest dest=00000001 mask=1/HG/1
> > > > >     (XEN)  MSI-X   45 vec=e1 lowest  edge   assert  log lowest dest=00000001 mask=1/HG/1
> > > > >     (XEN)  MSI-X   46 vec=e9 lowest  edge   assert  log lowest dest=00000040 mask=1/HG/1
> > > > >     (XEN)  MSI-X   47 vec=32 lowest  edge   assert  log lowest dest=00000004 mask=1/HG/1
> > > > >     (XEN)  MSI-X   48 vec=3a lowest  edge   assert  log lowest dest=00000040 mask=1/HG/1
> > > > >     (XEN)  MSI-X   49 vec=42 lowest  edge   assert  log lowest dest=00000010 mask=1/ G/1
> > > > > 
> > > > > And also, after starting and stopping the domU, `xl pci-assignable-remove 03:00.0`
> > > > > makes pciback to complain:
> > > > > 
> > > > >     [ 1180.919874] pciback 0000:03:00.0: xen_pciback: MSI-X release failed (-16)
> > > > > 
> > > > > This is all running on Xen 4.19.3, but I don't see much changes in this
> > > > > area since then.
> > > > > 
> > > > > Some more info collected at https://github.com/QubesOS/qubes-issues/issues/9335
> > > > > 
> > > > > My question is: what should be responsible for this cleanup on domain
> > > > > destroy? Xen, or maybe device model (which is QEMU in stubdomain here)?
> > > > 
> > > > The expectation is that qemu invokes the necessary cleanup, but of course ...
> > > > 
> > > > > I see some cleanup (apparently not enough) happening via QEMU when the
> > > > > domU driver is unloaded, but logically correct cleanup shouldn't depend
> > > > > on correct domU operation...
> > > > 
> > > > ... Xen may not make itself dependent upon either DomU or QEMU.
> > > 
> > > AFAICT free_domain_pirqs() called by arch_domain_destroy() should take
> > > care of unbinding and freeing pirqs (but obviously not in this case).
> > > Can you repeat the test with a debug=y hypervisor and post the
> > > resulting serial or dmesg here?  Some of the errors on those paths are
> > > printed with dprintk() and won't be visible unless using a Xen debug
> > > build.
> > 
> > Sure, will do.
> 
> Output collected during domU shutdown and subsequent startup (dom0 logs
> to Xen console here too):
> https://gist.github.com/marmarek/6dc3ac14d3ba840482e6361fcbd37c30
> 
> I don't see any errors there...

Hm, yes, I don't see any errors either.  Do you think you could
instrument unmap_domain_pirq() and figure out whether it gets called,
and if such call to unmap the PIRQ succeeds?

There's one silent error path in the return value of
xsm_unmap_domain_irq(), but that shouldn't be taken since the call to
unmap_domain_pirq() executed when destroying the domain is done with
d->is_dying == true.

> As for the domU-triggered cleanup, I just checked - if I unload the
> driver in domU before restarting, it works fine on subsequent startup.

Yeah, the unbind an unmap is then done by QEMU, and that seems to
work fine.  What doesn't seem to work fine is the cleanup done as part
of domain destroy.

Don't we have any Gitlab tests that do PCI passthrough?  Maybe those
don't do any domU resets?

Thanks, Roger.

