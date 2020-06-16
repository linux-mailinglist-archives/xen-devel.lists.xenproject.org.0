Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 545E01FA727
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 05:51:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl2cs-0006eK-Os; Tue, 16 Jun 2020 03:51:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pcvR=75=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1jl2cr-0006eF-9L
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 03:51:05 +0000
X-Inumbo-ID: 9a16ec56-af84-11ea-bca7-bc764e2007e4
Received: from mail-pl1-x643.google.com (unknown [2607:f8b0:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a16ec56-af84-11ea-bca7-bc764e2007e4;
 Tue, 16 Jun 2020 03:51:04 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id bh7so7778457plb.11
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 20:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yCzz3ohVOu5XuO1kEDpexGnGERf5ty0vT5A2CFZMtV8=;
 b=XflChHkglKPf3esLBmCpQ3Rm3sQt/HYOIcYkol7QmE5VBtGa+7X9D+BV4ALE1mxVUI
 wx0D7o34uLNdoZt4y28WwlmAsis3GEMgRn1V9TPGGxGnkhiTZqmOqwXXDNdWnpWBCQ15
 4p4accTkX1kRRjCHKlY0m+1qqRIuOhgErnXBC5eJnoUyr8SLJpk1RrDU3PTEIXi75M7h
 jm6XD4BYZTKv2YgLboQvp9saD/DL79OGRN+y77xKcP8CG9ZIcPuBqNfJT6bN+aZhf63a
 4tTLXRCTuzUi8eUM8wcoWEJOtuCMQrV9K2QcWMAqwzxhWz6SY+xSuuWUu8zHa2xAsZqr
 BKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yCzz3ohVOu5XuO1kEDpexGnGERf5ty0vT5A2CFZMtV8=;
 b=sYCV3UVlGW/zn5maLoST/EyuPhJ0E1aulyOC0a8UFemJPBjO9zt6YqsRwdpAJwkfH4
 y7yvCTWz2tSOBQTMK4GqVD+ywxlApDf/J+QUxjt8QMD9MMBiaSTqNUAkqJl3wFaNLrIx
 xBlGrvwjTWkuAleCagQ3Yd/G6Nz43oDvTAW5lyBfbVwsOCHn/CKxo+O2NwbHKd33pvyj
 MW7qstF6E1ZpxK4YeiVjYt2saDZmRVpfBAs38eQ9ztVYxkXPMTc5AVFQ7Mny9D/gY6Rl
 wjP2ea/luh+ItShHxAH9UhIfNcJVEDqLXaXy5fbRtKqQ/Re0sL7n4ZEmLPe7T3UgoO0m
 dhCw==
X-Gm-Message-State: AOAM5310I3erplx7DMz9ICzgcf8zVpblVDNkgYk8lGwALJGqC05xUxlb
 rlpgIX/sqzuxbursKQSRpTQ=
X-Google-Smtp-Source: ABdhPJzjpJc5bPHETGOc7VNjE+m2Xcmyn9qOYZilfENKep1CkOkHk960im/I44HXgvq5BObkgT735A==
X-Received: by 2002:a17:902:b196:: with SMTP id
 s22mr412625plr.152.1592279463795; 
 Mon, 15 Jun 2020 20:51:03 -0700 (PDT)
Received: from piano ([2601:1c0:4202:2e60::a569])
 by smtp.gmail.com with ESMTPSA id 12sm16031353pfb.3.2020.06.15.20.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 20:51:02 -0700 (PDT)
Date: Mon, 15 Jun 2020 20:51:00 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Subject: Re: [RFC XEN PATCH 00/23] xen: beginning support for RISC-V
Message-ID: <20200616035100.GA19383@piano>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
 <alpine.DEB.2.21.2006151802470.9074@sstabellini-ThinkPad-T480s>
 <f1bff09cf101b185efe7c2f7d53d64b0aeee84a2.camel@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1bff09cf101b185efe7c2f7d53d64b0aeee84a2.camel@wdc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "dan@dlrobertson.com" <dan@dlrobertson.com>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "bobby.eshleman@starlab.io" <bobby.eshleman@starlab.io>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 16, 2020 at 01:10:17AM +0000, Alistair Francis wrote:
> On Mon, 2020-06-15 at 18:03 -0700, Stefano Stabellini wrote:
> > Any updates? I am looking forward to this :-)
> 

It has been on a slow burn since I became a new dad (shortly after the RFC).
I've gradually regained free time, and so I've been able to change that
slow burn to a moderate burn in the last couple weeks.

Most of my progress has been around build environment improvements.  I've done
some work stripping it down to the bare minimum required to build a new arch
and rooting the commit history from there, and some work with incorporating it
into the gitlab CI, containerizing the build and QEMU run, etc...

As far as hypervisor status:  I'm just about done with incorporating the boot
module FDT parsing code, extracting kernel info and ram regions
(taken/generalized from arch/arm), plus implementing the arch-specific pieces
of domain_create().

On the verge of being able to dive into a guest kernel and see what breaks
first :)

I'm expected to commit an extra day or two per week in the next month or so at
Vates, so this will considerably bump up my cadence in comparison to the last
few months.

> FYI, I would like to talk more about RISC-V Xen at the Xen Virtual
> summit. I'll put it forward as a BoF subject.
> 
> I haven't worked on this, although the RISC-V Hypervisor spec is
> progressing towards ratification.
> 
> Alistair
> 

That would be great :)

-Bobby

