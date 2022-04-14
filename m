Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E5E500E1E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 14:52:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304717.519419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neyxQ-0004Pt-OX; Thu, 14 Apr 2022 12:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304717.519419; Thu, 14 Apr 2022 12:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neyxQ-0004O2-LU; Thu, 14 Apr 2022 12:52:20 +0000
Received: by outflank-mailman (input) for mailman id 304717;
 Thu, 14 Apr 2022 12:52:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jucj=UY=gmail.com=wei.liu.xen@srs-se1.protection.inumbo.net>)
 id 1neyxP-0004Nu-JM
 for xen-devel@lists.xen.org; Thu, 14 Apr 2022 12:52:19 +0000
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b65fef44-bbf1-11ec-8fbd-03012f2f19d4;
 Thu, 14 Apr 2022 14:52:16 +0200 (CEST)
Received: by mail-wm1-f42.google.com with SMTP id
 m15-20020a7bca4f000000b0038fdc1394b1so2369738wml.2
 for <xen-devel@lists.xen.org>; Thu, 14 Apr 2022 05:52:16 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a5d64cd000000b0020787751295sm1927597wri.35.2022.04.14.05.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 05:52:14 -0700 (PDT)
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
X-Inumbo-ID: b65fef44-bbf1-11ec-8fbd-03012f2f19d4
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2NIdeOW9T8yLTPuKGR+tbh8GRu0Fo0tWpAOfcknAD7I=;
        b=lzAmUf7yrAPiKdmetSDKLbPY8KBka0Jc8YO0p62qnge1yytoJRs6pmqO1M8C5LNmBd
         poPNorUXMaN+pSCD+GXP/xbQYEZcvia/D28xEmRzpnxM4arnVUG7q0RhLx4Oy05pmd2y
         zAx9hj6gszZNSCqOIGkfNpXNi4WAnOP8H4SjBdcr6QLhrWze9n5jUIxfbMP6ziILznSR
         +F9IFyNJ0xJ/PGQDYfHaagAAIQ2aJh97NgNBZgzIYwn/SBrg2ZM7BG6XA5lhATx0DFdC
         F+HsSv/39KSeyhsoqB/VKMEctjl4rbB5TwtsJxlnvzf8kZg4KDRxDiNEoSlo5ZHv3diR
         4Npw==
X-Gm-Message-State: AOAM531J89hQnemClvJIXN/gSmt9avnqQAjHfvFPyRYqKwgA3XrWH+cQ
	OiIZTC69IOVX90cT9DLq23Q=
X-Google-Smtp-Source: ABdhPJxdwymHp0jGOsyF/8sRvp0aasCjeW1pDDo5yCYB8lkbiVsa2f9OJk/BbDodfJek9ZLvN2AKxg==
X-Received: by 2002:a05:600c:1e1e:b0:38e:baaa:aae0 with SMTP id ay30-20020a05600c1e1e00b0038ebaaaaae0mr2949022wmb.157.1649940736051;
        Thu, 14 Apr 2022 05:52:16 -0700 (PDT)
Date: Thu, 14 Apr 2022 12:52:13 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Viresh Kumar <viresh.kumar@linaro.org>,
	"stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
	"xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: Virtio on Xen with Rust
Message-ID: <20220414125213.6qqn5wcphau5j3i3@liuwe-devbox-debian-v2>
References: <20220414091538.jijj4lbrkjiby6el@vireshk-i7>
 <20220414092358.kepxbmnrtycz7mhe@vireshk-i7>
 <20220414114557.4myrs4ud4qi2hnrz@liuwe-devbox-debian-v2>
 <2a735486-a464-3997-642a-3b0660b11b9e@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a735486-a464-3997-642a-3b0660b11b9e@citrix.com>

On Thu, Apr 14, 2022 at 12:07:10PM +0000, Andrew Cooper wrote:
> On 14/04/2022 12:45, Wei Liu wrote:
> > Hi Viresh
> >
> > This is very cool.
> >
> > On Thu, Apr 14, 2022 at 02:53:58PM +0530, Viresh Kumar wrote:
> >> +xen-devel
> >>
> >> On 14-04-22, 14:45, Viresh Kumar wrote:
> >>> Hello,
> >>>
> >>> We verified our hypervisor-agnostic Rust based vhost-user backends with Qemu
> >>> based setup earlier, and there was growing concern if they were truly
> >>> hypervisor-agnostic.
> >>>
> >>> In order to prove that, we decided to give it a try with Xen, a type-1
> >>> bare-metal hypervisor.
> >>>
> >>> We are happy to announce that we were able to make progress on that front and
> >>> have a working setup where we can test our existing Rust based backends, like
> >>> I2C, GPIO, RNG (though only I2C is tested as of now) over Xen.
> >>>
> >>> Key components:
> >>> --------------
> >>>
> >>> - Xen: https://github.com/vireshk/xen
> >>>
> >>>   Xen requires MMIO and device specific support in order to populate the
> >>>   required devices at the guest. This tree contains four patches on the top of
> >>>   mainline Xen, two from Oleksandr (mmio/disk) and two from me (I2C).
> >>>
> >>> - libxen-sys: https://github.com/vireshk/libxen-sys
> >>>
> >>>   We currently depend on the userspace tools/libraries provided by Xen, like
> >>>   xendevicemodel, xenevtchn, xenforeignmemory, etc. This crates provides Rust
> >>>   wrappers over those calls, generated automatically with help of bindgen
> >>>   utility in Rust, that allow us to use the installed Xen libraries. Though we
> >>>   plan to replace this with Rust based "oxerun" (find below) in longer run.
> >>>
> >>> - oxerun (WIP): https://gitlab.com/mathieupoirier/oxerun/-/tree/xen-ioctls
> >>>
> >>>   This is Rust based implementations for Ioctl and hypercalls to Xen. This is WIP
> >>>   and should eventually replace "libxen-sys" crate entirely (which are C based
> >>>   implementation of the same).
> >>>
> > I'm curious to learn why there is a need to replace libxen-sys with the
> > pure Rust implementation. Those libraries (xendevicemodel, xenevtchn,
> > xenforeignmemory) are very stable and battle tested. Their interfaces
> > are stable.
> 
> Very easy.  The library APIs are mess even if they are technically
> stable, and violate various commonly-agreed rules of being a libary such
> as not messing with stdout/stderr behind the applications back, and
> everything gets more simple when you remove an unnecessary level of C
> indirection.

You don't have to use the stdio logger FWIW. I don't disagree things can
be simpler though.

Wei.

> 
> ~Andrew

