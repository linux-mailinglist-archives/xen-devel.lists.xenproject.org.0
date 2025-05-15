Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C38A5AB7FC9
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 10:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984877.1370817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFTcV-0004Eb-R8; Thu, 15 May 2025 08:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984877.1370817; Thu, 15 May 2025 08:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFTcV-0004CG-Nz; Thu, 15 May 2025 08:07:11 +0000
Received: by outflank-mailman (input) for mailman id 984877;
 Thu, 15 May 2025 08:07:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT6j=X7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFTcT-0003lo-PY
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 08:07:09 +0000
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98c2ed40-3163-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 10:07:09 +0200 (CEST)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-7410c18bb00so933851b3a.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 01:07:09 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b23b521b709sm9775379a12.10.2025.05.15.01.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 01:07:07 -0700 (PDT)
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
X-Inumbo-ID: 98c2ed40-3163-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747296427; x=1747901227; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zJNWzpEPEoWleDHoP7ApvrE9rksrKufzgl30z/65ImU=;
        b=qp7SF0YO3ZhuJVHTuM4HE5pRCoyLl9rX9oIdrMM5cj53iuYWDAbyGoRkRSmpj+gf97
         4Uf5a+aJXoo7KoDskXhb0fOgIlv7uuSGm9wHnGt7C7IUDVUqq082uXDgQFxmqlFmz3tM
         DcOtHFuNvSR9KaQ/j8tmGtRC6p+j/qmjrIMMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747296427; x=1747901227;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zJNWzpEPEoWleDHoP7ApvrE9rksrKufzgl30z/65ImU=;
        b=RsmJDGbaALvgFu/rX1tQ0fCEwu1bmwPy7SUeIgbvf0Mxr1fa17VFjYJ+ZMWTbHhDR/
         lbD32Myz2jywI2LY06uVE8576paSR5cP+KEQ5m4l2L9l/qaxv80RSu68CtobxNxcClip
         R3nXCzqjA3z3qRgINgt9ouVESZg33dgOLAY10iOv66h0SKndaKA+jirdRVwaNcswH5dk
         fn0e1HQdxWPoPAPjwjNxNNZeMDwOrGV/QG6VTMIKkTrEpBzIa6nOhM012F+jQYWKBJMe
         f0m1zjbaVEKVW0vvBzzZT/wFnwm2gwE40KI7ffohB0FBctk1wBgTndxRajMoRMS9cxuC
         P08Q==
X-Gm-Message-State: AOJu0YxbEVkqkVn5HSFKgM2y2gGhoB536MiGOIeB1ePEbw8C0gXTIPTq
	qERoBhPiTQiqOFFOXhx6+CSPLVLyVtJf2vOHQAFUjGZhFtElgEcwNDwJsZYRNdnl08xcGuEGVeI
	E
X-Gm-Gg: ASbGncuPkamJlDch7IxHOBJsDTCOyACFlcHYq41YitaP1OfvZm9N9POL6dZPTozIAcu
	oLXQ6Xx9UokrGa3pPvJBY63OiIlVI27fOIWIuG2NZPLqHHuGbfxswdFllsFRhEDnj2lrMLItUvP
	lJDojmLYjtehMSWxduSpXc74eQjRxTFDuuUQL7u86c4cHCHt1b7pL2Rj4lrBhOvZ2xfBnZ/RZSm
	pShoVUSeOh02qslMPLTco1B1jKYNRtJlvnDEO+nA9LYgfnkm70oXLpQ1tOdm9h9pb2a3oEqZkCa
	WjATd+ONCEhF9wmR1/HRmexeIuzj3gcwf66rotNfpwsJEShZXryYDMAS
X-Google-Smtp-Source: AGHT+IGvDCm1yH+jcYC5l3+0jZfp+rn1Zq681CmTbvTAGh4Wn7WrDEvIuLa8WZYjv10F/b7opi4GsQ==
X-Received: by 2002:a05:6a21:6da3:b0:1fd:f8eb:d232 with SMTP id adf61e73a8af0-216115573b2mr2195766637.24.1747296427591;
        Thu, 15 May 2025 01:07:07 -0700 (PDT)
Date: Thu, 15 May 2025 10:07:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Issues on Zen4 (hw12) runner
Message-ID: <aCWgpp4fwNUgIDQJ@macbook.lan>
References: <aB0XtEor2rCxBKWR@mail-itl>
 <aCHMwWd7cq-ZIMOl@macbook.lan>
 <aCH4MnNQ7IzhJfkl@mail-itl>
 <aCIDj_8tDcjR1nUS@macbook.lan>
 <aCIIXkYar0TNP7H_@mail-itl>
 <aCIKrs0B5ZEi1v_z@macbook.lan>
 <aCIPuXoGm8-CsXBN@mail-itl>
 <aCUHNP5o78QQh_V0@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCUHNP5o78QQh_V0@mail-itl>

On Wed, May 14, 2025 at 11:12:20PM +0200, Marek Marczykowski-Górecki wrote:
> On Mon, May 12, 2025 at 05:11:53PM +0200, Marek Marczykowski-Górecki wrote:
> > On Mon, May 12, 2025 at 04:50:22PM +0200, Roger Pau Monné wrote:
> > > On Mon, May 12, 2025 at 04:40:29PM +0200, Marek Marczykowski-Górecki wrote:
> > > > On Mon, May 12, 2025 at 04:19:59PM +0200, Roger Pau Monné wrote:
> > > > > On Mon, May 12, 2025 at 03:31:19PM +0200, Marek Marczykowski-Górecki wrote:
> > > > > > On Mon, May 12, 2025 at 12:26:09PM +0200, Roger Pau Monné wrote:
> > > > > > > On Thu, May 08, 2025 at 10:44:36PM +0200, Marek Marczykowski-Górecki wrote:
> > > > > > > > Hi,
> > > > > > > > 
> > > > > > > > I wanted to post another revision of the series adding hw12 runner,
> > > > > > > > hoping that all known issues are fixed now, but unfortunately there is
> > > > > > > > still something broken. I've rebased my series on top of staging
> > > > > > > > (ed9488a0d) and got this pipeline:
> > > > > > > > 
> > > > > > > > https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1807819142
> > > > > > > > (note due to some added debugging, some tests are incorrectly marked as
> > > > > > > > success even if they failed...)
> > > > > > > > 
> > > > > > > > 1. USB ethernet doesn't work on PVH dom0: https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9978694739
> > > > > > > > There supposed to be an USB ethernet device connected to the USB
> > > > > > > > controller at c3:00.4. In the PV dom0 case it's detected as:
> > > > > > > > 
> > > > > > > >     [    3.911555] usb 7-1.4: new high-speed USB device number 3 using xhci_hcd
> > > > > > > >     [    4.004201] usb 7-1.4: New USB device found, idVendor=0bda, idProduct=8153, bcdDevice=30.00
> > > > > > > >     [    4.004675] usb 7-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=6
> > > > > > > >     [    4.005079] usb 7-1.4: Product: USB 10/100/1000 LAN
> > > > > > > >     [    4.005349] usb 7-1.4: Manufacturer: Realtek
> > > > > > > >     [    4.005599] usb 7-1.4: SerialNumber: 684D35
> > > > > > > > 
> > > > > > > > But it's not there on PVH. The USB controller itself is detected, just
> > > > > > > > not device(s) connected to it. This applies to other controllers too
> > > > > > > > (there should be about 3 or 4 other USB devices - none of them show up).
> > > > > > > > 
> > > > > > > > 2. There is a bunch of "unhandled memory read" errors during PVH dom0
> > > > > > > > startup: https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9978694739
> > > > > > > > 
> > > > > > > >     (XEN) [    4.026323] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory read from 0xfedc0020 size 1
> > > > > > > >     (XEN) [    4.026789] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory read from 0xfedc0021 size 1
> > > > > > > >     (XEN) [    4.027247] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory read from 0xfedc0020 size 1
> > > > > > > >     (XEN) [    4.027671] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory read from 0xfedc0021 size 1
> > > > > > > >     ...
> > > > > > > > 
> > > > > > > > This repeats several times. Could be related to the USB issue above?
> > > > > > > 
> > > > > > > Can you try with dom0=pf-fixup?  Those unhandled accesses might be the
> > > > > > > cause of the USB issues.
> > > > > > 
> > > > > > It did got rid of those messages, but USB still doesn't work:
> > > > > > https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10006580289
> > > > > 
> > > > > Hm, is it possible that the usage of console=xhci is interfering with
> > > > > USB devices?  Could you try to boot without console=xhci and see if
> > > > > you can still reproduce the issue?  You will need the physical device
> > > > > by your side, which I'm not sure it's possible.  Don't know if you
> > > > > host those remotely somewhere.
> > > > 
> > > > I can try, but will need a proper driver there (in dom0?) - AFAIR VGA
> > > > nor efifb doesn't output to HDMI there (and eDP is not connected).
> > > > Anyway, it's IMO unlikely, given it works just fine with PV dom0...
> > > 
> > > Oh, I see, that's a good data point that it works with PV dom0.
> > > Handling of r/o subpage accesses is still different between PV and PVH
> > > which could maybe explain this, but it's less likely.
> > > 
> > > Maybe I'm not spotting it, but I don't see any specific errors (like
> > > timeouts) from the XHCI controller on the log?  Neither there seems to
> > > be any errors or warnings from Xen.
> > 
> > I don't see any either...
> 
> Roger, it looks like your balloon patch fixes the USB case too :)

Oh, that's great to hear.  I hope I can merge that one together with
the xen.config change soon.  Would you mind giving a Tested-by to the
balloon patch?

https://lore.kernel.org/xen-devel/20250514080427.28129-1-roger.pau@citrix.com/

Thanks, Roger.

