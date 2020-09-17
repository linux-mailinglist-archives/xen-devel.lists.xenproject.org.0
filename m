Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2642726CFF7
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 02:31:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIhpT-0006l9-PW; Thu, 17 Sep 2020 00:31:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfqP=C2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kIhpS-0006l1-Ae
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 00:31:14 +0000
X-Inumbo-ID: c3ffc81e-57f5-4aaf-b4d3-b1718828b6a2
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3ffc81e-57f5-4aaf-b4d3-b1718828b6a2;
 Thu, 17 Sep 2020 00:31:13 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 910C2206C9;
 Thu, 17 Sep 2020 00:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600302672;
 bh=u/jF1RLNK1Y8pI+dhnthjbSqWs7YamSglbS3WjKP8Bc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=xs0m5krZDl+JfaAeQgDYMKUhe3Vv7NOvmVB4i4FhH72h8nP2RNP/I8k5lQcviexIa
 tO5g8b+9yvWKZCkmh4oNqWrO8Sn7hh2PttcV2qpbttnd1MFc2ui+XN7zErXUqT9Ru3
 QSzCv7ek5jjRBeeycIGZOPl0l8cTfxzE+yf9nA8w=
Date: Wed, 16 Sep 2020 17:31:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Daniel Wagner2 <Daniel.Wagner2@itk-engineering.de>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Bertrand Marquis <Bertrand.Marquis@arm.com>, 
 Andre Przywara <andre.przywara@arm.com>
Subject: Re: DT with memory bank of size 0 (WAS: Re: AW: AW: Colibri imx8qxp:
 Missing kernel boot module)
In-Reply-To: <45400b8b-6379-e00e-50de-941bb2ff423c@xen.org>
Message-ID: <alpine.DEB.2.21.2009161727100.27508@sstabellini-ThinkPad-T480s>
References: <bdb15b12e6f345249ea8bc685ca88787@itk-engineering.de>
 <b97ddb1f-fa6c-b5ea-4fd8-1d0c09c7a693@xen.org>
 <e421d4214c8a4201a917a9aa833de939@itk-engineering.de>
 <45400b8b-6379-e00e-50de-941bb2ff423c@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 16 Sep 2020, Julien Grall wrote:
> On 14/09/2020 15:26, Daniel Wagner2 wrote:
> > Hi Julien,
> 
> Hi Daniel,
> 
> I am moving the thread to xen-devel and adding a couple of more folks.
> 
> > > 
> > > > 
> > > > this is the full version of the fdt that threw the error:
> > > > https://pastebin.com/63TZ9z3k
> > > > The problematic memory node appears in line 126
> > > 
> > > Thanks! The output looks corrupted as some of the lines are not valid DTB:
> > > 
> > > fsl,pins = * 0x000000009300184c [0x00000048];
> > > 
> > > Although, I am not sure if it is just U-boot dumping the DTB differently.
> > > 
> > > Anyway, after removing the "corrupted" line, I managed to get a compile
> > the
> > > DTB. I don't have a Colibri IMX8QXP. However, given this is an early
> > parsing
> > > error, I have just embed the DTB in Xen binary via CONFIG_DTB_FILE.
> > > 
> > > Unfortunately I couldn't reproduce your error. This either suggests the
> > DTB gets
> > > corrupted or Xen doesn't access the DTB with the correct memory attribute.
> > > 
> > > Do you have the DTB in hand?
> > 
> > Sorry for the corrupted version, I've uploaded the DTB
> > (fsl-imx8qxp-colibri-eval-v3.dtb) to
> > https://drive.google.com/drive/folders/1jbpnz35sC0NbCyEjrkLqelBsKBztW1S6?usp
> > =sharing
> > 
> > I have also uploaded my modified xen source files.
> > 1. arch/arm/bootfdt.c
> > where I have added the additional printk's seen in the log and
> > 2. arch/arm/setup.c
> > where I rerun the devicetree parser in line 935 to get the logs, since the
> > console is not yet initialised when the function is called for the first
> > time and I
> > didn't manage to enable earlyprintk.
> > 
> > I think the breaking point is the second memory bank which appears in the
> > logs (see the output line marked with "!!")  with start=0x8 8000 0000 and
> > size=0.
> > It isn't specified in the DTB, so I am not sure where this comes from.
> > It has size=0 so
> > if ( !size )
> >      {
> >          printk("invalid size, bank %d\n",i);
> >          return -EINVAL;
> >      }
> > In bootfdt.c makes the function stop.
> > 
> > Log:
> > (XEN) arch/arm/bootfdt.c: early_scan_node
> > (XEN) -> fdt: node `memory@80000000': parsing
> > (XEN) -> process_memory_node
> > (XEN)
> > (XEN) arch/arm/bootfdt.c: process_memory_node
> > (XEN) ->found memory:reg
> > (XEN) ->cell=
> > (XEN) ->banks=2
> > (XEN) ->mem->nr_banks=1
> > (XEN) ->NR_MEM_BANKS=128
> > (XEN) ->start=0x80200000 size=0x7fe00000
> > !! (XEN) ->start=0x880000000 size=0
> > (XEN) invalid size, bank 1
> > (XEN) END of arch/arm/bootfdt.c: process_memory_node
> 
> When I tried to run it on the model I get:
> 
> (XEN) device_tree_for_each_node: memory@80000000
> (XEN)
> (XEN) arch/arm/bootfdt.c: early_scan_node
> (XEN) -> fdt: node `memory@80000000': parsing
> (XEN) -> process_memory_node
> (XEN)
> (XEN) arch/arm/bootfdt.c: process_memory_node
> (XEN) ->found memory:reg
> (XEN) ->cell=
> (XEN) ->banks=1
> (XEN) ->mem->nr_banks=0
> (XEN) ->NR_MEM_BANKS=128
> (XEN) ->start=0x80000000 size=0x40000000
> (XEN) END of arch/arm/bootfdt.c: process_memory_node
> 
> > 
> > Btw 8_8000_0000 is the start address of this systems DDR Main memory,
> > according to the Reference Manual of the i.MX8QXP.
> I couldn't find this value in the DT. It is possible that U-boot is modifying
> the memory node before jumping to Xen (or Linux).
> 
> Looking at Linux, they seem to ignore any bank with size == 0. I am starting
> to wonder whether your DT is (ab)using it.
> 
> Do you have Linux running on baremetal on this board? If so would you mind to
> dump the DT from the userspace (via /proc/device-tree) this time?
> 
> In any case, we may want to relax the check in Xen. Any opinions?

Yeah, ignoring a bank with size=0 is fine. I checked the epapr and it
doesn't specify that size=0 is invalid, so I think it is actually better
to ignore it and continue even from a spec perspective.

