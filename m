Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B141EAB3B54
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 16:50:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981651.1368070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUU7-0000Ih-EE; Mon, 12 May 2025 14:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981651.1368070; Mon, 12 May 2025 14:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUU7-0000GT-BU; Mon, 12 May 2025 14:50:27 +0000
Received: by outflank-mailman (input) for mailman id 981651;
 Mon, 12 May 2025 14:50:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zSlO=X4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uEUU6-0000GN-KD
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 14:50:26 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f78f79b-2f40-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 16:50:24 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ad238c68b35so432754866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 07:50:24 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad22a3a1501sm503204766b.121.2025.05.12.07.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 07:50:23 -0700 (PDT)
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
X-Inumbo-ID: 6f78f79b-2f40-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747061424; x=1747666224; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6oZNQb/xEs5YyNa3I9FOEMw3ehWkBbYRL9ptJa2iUDs=;
        b=vBr9bGCPRZVonKLCDzfuuxQ/xGBHEolB5BdDsDsBoxNystfESHENvhNVQhfyV/meZK
         ChfECtFR7fe+6gdpEZeGX9o+2eKobrQge/TUf0oGFkc9qF54elLhbBwMu8YgVw/6fyp4
         0MNEpsHKCdmfDO6ZQV38ODPR/OySE7QAXDMfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061424; x=1747666224;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6oZNQb/xEs5YyNa3I9FOEMw3ehWkBbYRL9ptJa2iUDs=;
        b=dv1NzElZZRhjR94zWhqugEroTpBdPVuFFgei9AOirWNWiyPJpAo6G/80BUeyaD7io0
         6L8nJoKdqEvSEC0kV3nofxqHnRKhhdYpLzzI5ORChQZEGt8S2q9q4Gy7exC29vWPmV4G
         8BTgTkcpw7XPSHZXt1RygIAAtRcbeyoL1YhzUiyzqB0tkolYQciLR+HI9aT9XuDoRGeJ
         kYQ9Qh6nH8oinAN0fvgVDBRNPg/HGhDpgRKnL/R0gEWE0mcf86aepAUn27VvDSXLHuIP
         BZKggQQE2HRXkuZCVebZbucYqk5MTyalv6U8+OU285OBJBcmmYro2VwddBt45bk2hA1L
         csnw==
X-Gm-Message-State: AOJu0YzV9GuxdqCCKa/nTtDCo/Xz9hwlLnWC24fi3o8cvLPOwtkoUREG
	FFu78ijZ/nOFar393rfAQdixxRm7ip3oXXWhK3mePnokQcltdkkfDCAKdr5Qd+BEY+AvP0Xtg7/
	p
X-Gm-Gg: ASbGncvU6C5ps87L1LdPR8ilXq6ZryxVQesZTnd2Ll/xrKNCOOF1ild4WQG8YchbXDV
	f8ir0gKu/lyXSpRX7BRJommzpWrnydCWlHvfBPUGeiwNr3XU39yFXVsYBwbi5I+dQz/+TVwDDGh
	dHobIEFBDD/IIB85HO12Y1fI5bOEcD3cLVM9rA/eABH5w6nCON0F8PD/T3rRA0NMIU808UYoDju
	ofsiBym1qsB/CUaY1a7LNtttyFwYd04BPwuCWWDRUoJuqGY8I5UTvp2iSbVHd0XmfrGIHXCKElF
	v0/rg9LWx75e2Hero/GHG5v2vYlfOkM/0LIquMjjXGa738wQ3ksK9gJO
X-Google-Smtp-Source: AGHT+IFs7VjS7QiiNngk4TZCclha7Qvs9KkdCp7ReDVoSqhKJBBKPwaq4fNuAl6TMIzdDX8rKyXT2Q==
X-Received: by 2002:a17:907:3e8d:b0:ad2:3555:f535 with SMTP id a640c23a62f3a-ad23555f608mr879059566b.5.1747061423758;
        Mon, 12 May 2025 07:50:23 -0700 (PDT)
Date: Mon, 12 May 2025 16:50:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Issues on Zen4 (hw12) runner
Message-ID: <aCIKrs0B5ZEi1v_z@macbook.lan>
References: <aB0XtEor2rCxBKWR@mail-itl>
 <aCHMwWd7cq-ZIMOl@macbook.lan>
 <aCH4MnNQ7IzhJfkl@mail-itl>
 <aCIDj_8tDcjR1nUS@macbook.lan>
 <aCIIXkYar0TNP7H_@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCIIXkYar0TNP7H_@mail-itl>

On Mon, May 12, 2025 at 04:40:29PM +0200, Marek Marczykowski-Górecki wrote:
> On Mon, May 12, 2025 at 04:19:59PM +0200, Roger Pau Monné wrote:
> > On Mon, May 12, 2025 at 03:31:19PM +0200, Marek Marczykowski-Górecki wrote:
> > > On Mon, May 12, 2025 at 12:26:09PM +0200, Roger Pau Monné wrote:
> > > > On Thu, May 08, 2025 at 10:44:36PM +0200, Marek Marczykowski-Górecki wrote:
> > > > > Hi,
> > > > > 
> > > > > I wanted to post another revision of the series adding hw12 runner,
> > > > > hoping that all known issues are fixed now, but unfortunately there is
> > > > > still something broken. I've rebased my series on top of staging
> > > > > (ed9488a0d) and got this pipeline:
> > > > > 
> > > > > https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1807819142
> > > > > (note due to some added debugging, some tests are incorrectly marked as
> > > > > success even if they failed...)
> > > > > 
> > > > > 1. USB ethernet doesn't work on PVH dom0: https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9978694739
> > > > > There supposed to be an USB ethernet device connected to the USB
> > > > > controller at c3:00.4. In the PV dom0 case it's detected as:
> > > > > 
> > > > >     [    3.911555] usb 7-1.4: new high-speed USB device number 3 using xhci_hcd
> > > > >     [    4.004201] usb 7-1.4: New USB device found, idVendor=0bda, idProduct=8153, bcdDevice=30.00
> > > > >     [    4.004675] usb 7-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=6
> > > > >     [    4.005079] usb 7-1.4: Product: USB 10/100/1000 LAN
> > > > >     [    4.005349] usb 7-1.4: Manufacturer: Realtek
> > > > >     [    4.005599] usb 7-1.4: SerialNumber: 684D35
> > > > > 
> > > > > But it's not there on PVH. The USB controller itself is detected, just
> > > > > not device(s) connected to it. This applies to other controllers too
> > > > > (there should be about 3 or 4 other USB devices - none of them show up).
> > > > > 
> > > > > 2. There is a bunch of "unhandled memory read" errors during PVH dom0
> > > > > startup: https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9978694739
> > > > > 
> > > > >     (XEN) [    4.026323] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory read from 0xfedc0020 size 1
> > > > >     (XEN) [    4.026789] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory read from 0xfedc0021 size 1
> > > > >     (XEN) [    4.027247] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory read from 0xfedc0020 size 1
> > > > >     (XEN) [    4.027671] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory read from 0xfedc0021 size 1
> > > > >     ...
> > > > > 
> > > > > This repeats several times. Could be related to the USB issue above?
> > > > 
> > > > Can you try with dom0=pf-fixup?  Those unhandled accesses might be the
> > > > cause of the USB issues.
> > > 
> > > It did got rid of those messages, but USB still doesn't work:
> > > https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10006580289
> > 
> > Hm, is it possible that the usage of console=xhci is interfering with
> > USB devices?  Could you try to boot without console=xhci and see if
> > you can still reproduce the issue?  You will need the physical device
> > by your side, which I'm not sure it's possible.  Don't know if you
> > host those remotely somewhere.
> 
> I can try, but will need a proper driver there (in dom0?) - AFAIR VGA
> nor efifb doesn't output to HDMI there (and eDP is not connected).
> Anyway, it's IMO unlikely, given it works just fine with PV dom0...

Oh, I see, that's a good data point that it works with PV dom0.
Handling of r/o subpage accesses is still different between PV and PVH
which could maybe explain this, but it's less likely.

Maybe I'm not spotting it, but I don't see any specific errors (like
timeouts) from the XHCI controller on the log?  Neither there seems to
be any errors or warnings from Xen.

Thanks, Roger.

