Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BCB227D8A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 12:48:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxpoS-0006GU-4V; Tue, 21 Jul 2020 10:47:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXjz=BA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jxpoQ-0006GD-73
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 10:47:54 +0000
X-Inumbo-ID: a08c6e86-cb3f-11ea-a09d-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a08c6e86-cb3f-11ea-a09d-12813bfff9fa;
 Tue, 21 Jul 2020 10:47:53 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id j18so2345470wmi.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 03:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0HXvjZ8pm71TLoeB9M4HW/CVr4atdMl4DEn66RZi/Dc=;
 b=hH4oBpkG5IJGoLTOG8q+qJm0rnG6lwHdlqyiGoay7t93qudUVETH3ghmahQje1SH9q
 Xb5g89UJoZzDrdNNpaJ9yPlWWpoIPxvAAhm97x5ytm9YiVpx02HvEnSqAW0ZRcNUnHQ1
 jLxVCnOIjWMvqcMmbh3uUttq8BFo26f3LaBgtD+T04+Q4zQrhudqFXNbX23MVPu4iUja
 jZn2aWH7lOzo3hgWqdjgII3iSJpYrWlwKr5opKUvIXCY7OB/04LMyTrd9lJ8Ftaem9v2
 vWJTF68YvWl2L0wMLnjbiiF8RTKuJoALeFrKcZVCIHz4NNGt7OCbyfR+q4bBnMG8AKII
 gRbw==
X-Gm-Message-State: AOAM530diZrOX3uRKoQRKIxWmXv17lHES5hlGagnQ56BXWVeY+8LFOdC
 vffPosR0rh7Zm50LYiTcS5Y=
X-Google-Smtp-Source: ABdhPJxeNk9Wuj1AFGQlP/TXlc5pnEchhfH9z+29B+8E7qsm2xT1csN8v7U3DhKRv32HWNh1fyBJIw==
X-Received: by 2002:a7b:c154:: with SMTP id z20mr3711386wmi.118.1595328472143; 
 Tue, 21 Jul 2020 03:47:52 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id t13sm13388492wru.65.2020.07.21.03.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 03:47:51 -0700 (PDT)
Date: Tue, 21 Jul 2020 10:47:50 +0000
From: Wei Liu <wl@xen.org>
To: Julien Grall <julien@xen.org>
Subject: Re: Kexec and libxenctlr.so
Message-ID: <20200721104750.l4zsqlzq4vsee7yv@liuwe-devbox-debian-v2>
References: <7a88218d-981e-6583-15a5-3fcaffb05294@amazon.com>
 <20200626110812.hxeoomagamkdceu7@liuwe-devbox-debian-v2>
 <aa5ad259-5848-e8c4-61e8-6649bb65ece5@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa5ad259-5848-e8c4-61e8-6649bb65ece5@xen.org>
User-Agent: NeoMutt/20180716
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
Cc: Wei Liu <wl@xen.org>, "paul@xen.org" <paul@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 daniel.kiper@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jul 02, 2020 at 06:34:48PM +0100, Julien Grall wrote:
> Hi Wei,
> 
> On 26/06/2020 12:08, Wei Liu wrote:
> > On Thu, Jun 11, 2020 at 03:57:37PM +0100, Julien Grall wrote:
> > > Hi all,
> > > 
> > > kexec-tools has an option to load dynamically libxenctlr.so (not .so.4.x)
> > > (see [1]).
> > > 
> > > Given that the library has never been considered stable, it is probably a
> > > disaster that is waiting to happen.
> > > 
> > > Looking at the tree kexec is using the follow libxc functions:
> > >     - xc_kexec_get_range()
> > >     - xc_kexec_load()
> > >     - xc_kexec_unload()
> > >     - xc_kexec_status()
> > >     - xc_kexec_exec()
> > >     - xc_version()
> > >     - xc_interface_open()
> > >     - xc_interface_close()
> > >     - xc_get_max_cpus()
> > >     - xc_get_machine_memory_map()
> > > 
> > > I think it is uncontroversial that we want a new stable library for all the
> > > xc_kexec_* functions (maybe libxenexec)?
> > 
> > That sounds fine to me.
> > 
> > Looking at the list of functions, all the xc_kexec_* ones are probably
> > already rather stable.
> 
> That's my understanding as well.
> 
> Although, we may want to rethink some of the hypercalls (such as
> KEXEC_cmd_kexec_get_range) in the future as they have different layout
> between 32-bit and 64-bit. Thanksfully this wasn't exposed outside of libxc,
> so it shouldn't be an issue to have a stable library.
> 

Oh, that's good to hear.

> > 
> > For xc_interface_open / close, they are perhaps used only to obtain an
> > xc handle such that it can be used to make hypercalls. You new kexec
> > library is going to expose its own handle with a xencall handle wrapped
> > inside, so you can do away with an xc handle.
> 
> I have already a PoC for the new library. I had to tweak a bit the list of
> helpers as some use hypercalls arguments directly. Below, the proposed
> interface:
> 
> /* Callers who don't care don't need to #include <xentoollog.h> */
> struct xentoollog_logger;
> 
> typedef struct xenkexec_handle xenkexec_handle;
> 
> typedef struct xenkexec_segments xenkexec_segments;
> 
> xenkexec_handle *xenkexec_open(struct xentoollog_logger *logger,
>                                unsigned int open_flags);
> int xenkexec_close(xenkexec_handle *khdl);
> 
> int xenkexec_exec(xenkexec_handle *khdl, int type);
> int xenkexec_get_range(xenkexec_handle *khdl, int range, int nr,
>                        uint64_t *size, uint64_t *start);
> int xenkexec_load(xenkexec_handle *khdl, uint8_t type, uint16_t arch,
>                   uint64_t entry_maddr, uint32_t nr_segments,
>                   xenkexec_segments *segments);
> int xenkexec_unload(xenkexec_handle *khdl, int type);
> int xenkexec_status(xenkexec_handle *khdl, int type);
> 
> xenkexec_segments *xenkexec_allocate_segments(xenkexec_handle *khdl,
>                                               unsigned int nr);
> void xenkexec_free_segments(xenkexec_handle *khdl, xenkexec_segments *segs);
> 
> int xenkexec_update_segment(xenkexec_handle *khdl, xenkexec_segments *segs,
>                             unsigned int idx, void *buffer, size_t
> buffer_size,
>                             uint64_t dest_maddr, size_t dest_size);
> 

You definitely have more experience in kexec than I do. This list looks
sensible.

> 
> > 
> > > 
> > > However I am not entirely sure where to put the others.
> > > 
> > > I am thinking to introduce libxensysctl for xc_get_max_cpus() as it is a
> > > XEN_SYSCTL. We could possibly include xc_get_machine_memory_map() (despite
> > > it is a XENMEM_).
> > > 
> > 
> > Introducing an libxensysctl before we stabilise sysctl interface seems
> > wrong to me. We can bury the call inside libxenkexec itself for the time
> > being.
> 
> That would work for me.
> 
> > 
> > > For xc_version(), I am thinking to extend libxentoolcore to also include
> > > "stable xen API".
> > > 
> > 
> > If you can do without an xc handle, do you still need to call
> > xc_version?
> 
> Looking at kexec, xc_version() is used by crashdump to determine which
> architecture is used by Xen (in this case 32-bit x86 vs 64-bit x86).
> 
> The was introcuded by commit:
> 
> commit cdbc9b011fe43407908632d842e3a39e495e48d9
> Author: Ian Campbell <ian.campbell@xensource.com>
> Date:   Fri Mar 16 10:10:24 2007 +0000
> 
>     Set crash dump ELF header e_machine field based on underlying hypervisor
> architecture.
> 
>     This is necessary when running Xen with a 64 bit hypervisor and 32 bit
>     domain 0 since the CPU crash notes will be 64 bit.
> 
>     Detecting the hypervisor archiecture requires libxenctrl and therefore
> this
>     support is optional and disabled by default.
> 
>     Signed-off-by: Ian Campbell <ian.campbell@xensource.com>
>     Acked-by: Magnus Damm <magnus@valinux.co.jp>
>     Signed-off-by: Simon Horman <horms@verge.net.au>
> 
> As we drop support for 32-bit Xen quite a long time ago, we may be able to
> remove the call to xc_version().
> 

Does Arm care about the bitness of the hypervisor?

Wei.

> Cheers,
> 
> -- 
> Julien Grall

