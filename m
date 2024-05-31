Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2175D8D5780
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 03:04:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733180.1139306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCqgG-0005hc-AI; Fri, 31 May 2024 01:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733180.1139306; Fri, 31 May 2024 01:03:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCqgG-0005g6-7a; Fri, 31 May 2024 01:03:40 +0000
Received: by outflank-mailman (input) for mailman id 733180;
 Fri, 31 May 2024 01:03:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h8zp=NC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sCqgF-0005fz-44
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 01:03:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b0786d0-1ee9-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 03:03:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 349F162A3F;
 Fri, 31 May 2024 01:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24F5C2BBFC;
 Fri, 31 May 2024 01:03:31 +0000 (UTC)
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
X-Inumbo-ID: 9b0786d0-1ee9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717117413;
	bh=aVd5LuN6M3XAeK8UOhR8JfGPaq/mAscPNc2cSB/MUdo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gOeiix9t5lSPUwppW8w5GC4F3X9sq9EF7R/SKLBfomCF8Gcuptl6ELMJ24cFle74u
	 wDIwQL//hmA5qfT8Rqv+/iknnjZBADB89DSSGWzgnP64lbo/tDLaqRQVln1HFnaatA
	 c4g0GUMyjfqgCxLOVQ63Giu1WMZIrilIDh8i5I6H1KwArWErR5uv0fFImhQ++1O1GT
	 gSQGnSbwhv7Re+lNUR4uXdIR/mzre27J1/Vr27bsRfSIsoU6g6adhJGV2RM9VtHYcD
	 MSj9qCPOIpb2+g9KEe1dzgC0nK24wY3G5OZ3LK5aPHOq2sa/ezfaf67W1heGce1yTt
	 vwz700xjVgyzw==
Date: Thu, 30 May 2024 18:03:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 05/13] xen/bitops: Implement generic_f?sl() in lib/
In-Reply-To: <7305a8b9-5f43-47e4-987b-c5ca76bcc312@suse.com>
Message-ID: <alpine.DEB.2.22.394.2405301803050.2557291@ubuntu-linux-20-04-desktop>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com> <20240524200338.1232391-6-andrew.cooper3@citrix.com> <7305a8b9-5f43-47e4-987b-c5ca76bcc312@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 27 May 2024, Jan Beulich wrote:
> On 24.05.2024 22:03, Andrew Cooper wrote:
> > generic_f?s() being static inline is the cause of lots of the complexity
> > between the common and arch-specific bitops.h
> > 
> > They appear to be static inline for constant-folding reasons (ARM uses them
> > for this), but there are better ways to achieve the same effect.
> > 
> > It is presumptuous that an unrolled binary search is the right algorithm to
> > use on all microarchitectures.  Indeed, it's not for the eventual users, but
> > that can be addressed at a later point.
> > 
> > It is also nonsense to implement the int form as the base primitive and
> > construct the long form from 2x int in 64-bit builds, when it's just one extra
> > step to operate at the native register width.
> > 
> > Therefore, implement generic_f?sl() in lib/.  They're not actually needed in
> > x86/ARM/PPC by the end of the cleanup (i.e. the functions will be dropped by
> > the linker), and they're only expected be needed by RISC-V on hardware which
> > lacks the Zbb extension.
> > 
> > Implement generic_fls() in terms of generic_flsl() for now, but this will be
> > cleaned up in due course.
> > 
> > Provide basic runtime testing using __constructor inside the lib/ file.  This
> > is important, as it means testing runs if and only if generic_f?sl() are used
> > elsewhere in Xen.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with a suggestion and a question.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> > I suspect we want to swap CONFIG_DEBUG for CONFIG_BOOT_UNIT_TESTS in due
> > course.  These ought to be able to be used in a release build too.
> 
> +1

+1

