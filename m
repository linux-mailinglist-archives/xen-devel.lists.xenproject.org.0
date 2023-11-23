Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 583BA7F5A01
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 09:30:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639426.996783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6562-0003ju-8P; Thu, 23 Nov 2023 08:30:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639426.996783; Thu, 23 Nov 2023 08:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6562-0003gP-5C; Thu, 23 Nov 2023 08:30:02 +0000
Received: by outflank-mailman (input) for mailman id 639426;
 Thu, 23 Nov 2023 08:30:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRmN=HE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r6560-0003gA-Mc
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 08:30:00 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cc91b88-89da-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 09:29:58 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-332d2948170so374516f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 00:29:58 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 f6-20020adff586000000b00332e1c46dddsm1006616wro.98.2023.11.23.00.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 00:29:57 -0800 (PST)
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
X-Inumbo-ID: 7cc91b88-89da-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700728198; x=1701332998; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vP+w6RYkjPtTtCQctLEkfhmmauSXZnrpv1vCfCCJGIA=;
        b=QkrsxxskAl6xjZ5kuBPR58jE7+Xkf6DJ4+7aQjk4lBUk7PcLZaizRwWtikGtgZHvfN
         RXuSk2pM3lLM+NK3k+T0OIN3zwWia8vUGpyZ7KBnb6k9PkYzeKfcg3ns05JaF8wcv9YX
         jjQ/0JD3SIUTVdB6vshmsrnJATwNcbWxXdpgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700728198; x=1701332998;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vP+w6RYkjPtTtCQctLEkfhmmauSXZnrpv1vCfCCJGIA=;
        b=FlD+G67l9qOMIvosRP4E1aPfeh/Eam1h2lnVY27LJ5LDlCnGEmMXernMvgSVD9V70l
         aVpXfnWJG632KdUh+pLttdAB6LT3a94MYudgys4Tdqn6E1OLA60GZaJv8m2yyzuKya8s
         7T897gaswsrsZ3SRfy35Jeu58G7Nv3X1RHrKxdf+iXZlaELgTHrbKRMMmRdbS8Ocxqaw
         37FmEbdNBK++e+Gzjmz7bFyM0BaSaxsBDcJn5HMwyBj9fe2XwGqKhfsJkHeIK47NF1rE
         /8gxKH3HfoyzrNUwFPRsRh1hiG106pYj+z5y+V10tjlEBKAV74KJnTjQ9gee2din24ED
         xjSw==
X-Gm-Message-State: AOJu0YxRNul68B6TE7qC/4OQRtb7awo7+Xcnmwx6dJJPdI3+CZ/r2Vr+
	ELigGx1FM48LNpp/5Wd91+EH3A==
X-Google-Smtp-Source: AGHT+IFykie6bUjHTiwqTpYG+2mnJDivvBLuUSk5aIv9rERVGUwns40hdZmPXXGLn0Qo7ONDNcE6pA==
X-Received: by 2002:a05:6000:178c:b0:332:d07a:6fc0 with SMTP id e12-20020a056000178c00b00332d07a6fc0mr3403176wrg.10.1700728198044;
        Thu, 23 Nov 2023 00:29:58 -0800 (PST)
Date: Thu, 23 Nov 2023 09:29:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien@xen.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
Message-ID: <ZV8NhPohwTDWXOTk@macbook>
References: <87a5rc4gk7.fsf@epam.com>
 <770aaef8-09f4-480a-95b8-cc0448ad07ff@xen.org>
 <8734x43zxi.fsf@epam.com>
 <alpine.DEB.2.22.394.2311171339010.773207@ubuntu-linux-20-04-desktop>
 <87edgo2f6j.fsf@epam.com>
 <alpine.DEB.2.22.394.2311171633190.773207@ubuntu-linux-20-04-desktop>
 <87ttpg0wdx.fsf@epam.com>
 <alpine.DEB.2.22.394.2311211712090.2053963@ubuntu-linux-20-04-desktop>
 <ZV3r1uc3av1wQu4W@macbook>
 <alpine.DEB.2.22.394.2311221306060.2053963@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2311221306060.2053963@ubuntu-linux-20-04-desktop>

On Wed, Nov 22, 2023 at 01:18:32PM -0800, Stefano Stabellini wrote:
> On Wed, 22 Nov 2023, Roger Pau Monné wrote:
> > On Tue, Nov 21, 2023 at 05:12:15PM -0800, Stefano Stabellini wrote:
> > > Let me expand on this. Like I wrote above, I think it is important that
> > > Xen vPCI is the only in-use PCI Root Complex emulator. If it makes the
> > > QEMU implementation easier, it is OK if QEMU emulates an unneeded and
> > > unused PCI Root Complex. From Xen point of view, it doesn't exist.
> > > 
> > > In terms if ioreq registration, QEMU calls
> > > xendevicemodel_map_pcidev_to_ioreq_server for each PCI BDF it wants to
> > > emulate. That way, Xen vPCI knows exactly what PCI config space
> > > reads/writes to forward to QEMU.
> > > 
> > > Let's say that:
> > > - 00:02.0 is PCI passthrough device
> > > - 00:03.0 is a PCI emulated device
> > > 
> > > QEMU would register 00:03.0 and vPCI would know to forward anything
> > > related to 00:03.0 to QEMU, but not 00:02.0.
> > 
> > I think there's some work here so that we have a proper hierarchy
> > inside of Xen.  Right now both ioreq and vpci expect to decode the
> > accesses to the PCI config space, and setup (MM)IO handlers to trap
> > ECAM, see vpci_ecam_{read,write}().
> > 
> > I think we want to move to a model where vPCI doesn't setup MMIO traps
> > itself, and instead relies on ioreq to do the decoding and forwarding
> > of accesses.  We need some work in order to represent an internal
> > ioreq handler, but that shouldn't be too complicated.  IOW: vpci
> > should register devices it's handling with ioreq, much like QEMU does.
> 
> I think this could be a good idea.
> 
> This would be the very first IOREQ handler implemented in Xen itself,
> rather than outside of Xen. Some code refactoring might be required,
> which worries me given that vPCI is at v10 and has been pending for
> years. I think it could make sense as a follow-up series, not v11.

That's perfectly fine for me, most of the series here just deal with
the logic to intercept guest access to the config space and is
completely agnostic as to how the accesses are intercepted.

> I think this idea would be beneficial if, in the example above, vPCI
> doesn't really need to know about device 00:03.0. vPCI registers via
> IOREQ the PCI Root Complex and device 00:02.0 only, QEMU registers
> 00:03.0, and everything works. vPCI is not involved at all in PCI config
> space reads and writes for 00:03.0. If this is the case, then moving
> vPCI to IOREQ could be good.

Given your description above, with the root complex implemented in
vPCI, we would need to mandate vPCI together with ioreqs even if no
passthrough devices are using vPCI itself (just for the emulation of
the root complex).  Which is fine, just wanted to mention the
dependency.

> On the other hand if vPCI actually needs to know that 00:03.0 exists,
> perhaps because it changes something in the PCI Root Complex emulation
> or vPCI needs to take some action when PCI config space registers of
> 00:03.0 are written to, then I think this model doesn't work well. If
> this is the case, then I think it would be best to keep vPCI as MMIO
> handler and let vPCI forward to IOREQ when appropriate.

At first approximation I don't think we would have such interactions,
otherwise the whole premise of ioreq being able to register individual
PCI devices would be broken.

XenSever already has scenarios with two different user-space emulators
(ie: two different ioreq servers) handling accesses to different
devices in the same PCI bus, and there's no interaction with the root
complex required.

> I haven't run any experiements, but my gut feeling tells me that we'll
> have to follow the second approach because the first is too limiting.

Iff there's some case where a change to a downstream PCI device needs
to be propagated to the root complex, then such mechanism should be
implemented as part of the ioreq interface, otherwise the whole model
is broken.

Thanks, Roger.

