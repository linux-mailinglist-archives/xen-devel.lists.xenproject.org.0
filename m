Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4718098BD
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 02:45:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650320.1015755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBPvr-0004aF-JF; Fri, 08 Dec 2023 01:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650320.1015755; Fri, 08 Dec 2023 01:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBPvr-0004YK-Ga; Fri, 08 Dec 2023 01:45:35 +0000
Received: by outflank-mailman (input) for mailman id 650320;
 Fri, 08 Dec 2023 01:45:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBPvp-0004YE-Go
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 01:45:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78189a53-956b-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 02:45:31 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ADFAC6223E;
 Fri,  8 Dec 2023 01:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B54C433C8;
 Fri,  8 Dec 2023 01:45:28 +0000 (UTC)
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
X-Inumbo-ID: 78189a53-956b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701999929;
	bh=vLc1uRakr9TmI+nUcaT0DcgRdkZuxW00VBXiSP6Z/hc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PJLXqr8aWQO/nZE9na8sMQDop4gDRTaBiUVJhUtAvxlOoaD3XVGEQ5xW88RXsSdzp
	 LY52O2zTq8BmFRo7n+c8dDJ5pPmjESc2YYvNt39X4tCEHrDpYnokFLZ6Aptj3L6364
	 c/2hTxokSI2KQkaFnpRqHKVo9c8V8rBGTAxWKEXa8GOYaqA5p0bOFFfP+E5IJxWvwA
	 TA4ULzvH5k1JjUJC/fhsQ4fcONT7curvLTOxav3uItkEDbUHDAshPjRLzKye6N1+Gr
	 HGOU20Ps4aX4veNxlJUII0t76YUR7XWKU5dcgG7W/dM4+lX5hR+rmaL3mWNjnuXcU9
	 E4JLbmWj4OIKw==
Date: Thu, 7 Dec 2023 17:45:26 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>, Michal Orzel <michal.orzel@amd.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Wei Chen <wei.chen@arm.com>
Subject: Re: [PATCH 1/5] automation: Add a Dockerfile for running FVP_Base
 jobs
In-Reply-To: <alpine.DEB.2.22.394.2312071722250.1265976@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2312071743220.1265976@ubuntu-linux-20-04-desktop>
References: <20231207135318.1912846-1-Henry.Wang@arm.com> <20231207135318.1912846-2-Henry.Wang@arm.com> <alpine.DEB.2.22.394.2312071722250.1265976@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Dec 2023, Stefano Stabellini wrote:
> On Thu, 7 Dec 2023, Henry Wang wrote:
> > Fixed Virtual Platforms (FVPs) are complete simulations of an Arm
> > system, including processor, memory and peripherals. These are set
> > out in a "programmer's view", which gives programmers a comprehensive
> > model on which to build and test software. FVP can be configured to
> > different setups by its cmdline parameters, and hence having the FVP
> > in CI will provide us with the flexibility to test Arm features and
> > setups that we find difficult to use real hardware or emulators.
> > 
> > This commit adds a Dockerfile for the new arm64v8 container with
> > FVP installed, based on the debian bookworm-arm64v8 image. This
> > container will be used to run the FVP test jobs. Compared to the
> > debian bookworm-arm64v8 image, the packages in the newly added FVP
> > container does not contain the `u-boot-qemu`, and adds the `expect`
> > to run expect scripts introduced by following commits, `telnet` to
> > connect to FVP, and `tftpd-hpa` to provide the TFTP service for
> > the FVP.
> > 
> > Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> > ---
> >  .../debian/bookworm-arm64v8-fvp.dockerfile    | 64 +++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> >  create mode 100644 automation/build/debian/bookworm-arm64v8-fvp.dockerfile
> > 
> > diff --git a/automation/build/debian/bookworm-arm64v8-fvp.dockerfile b/automation/build/debian/bookworm-arm64v8-fvp.dockerfile
> > new file mode 100644
> > index 0000000000..3b87dc5a5b
> > --- /dev/null
> > +++ b/automation/build/debian/bookworm-arm64v8-fvp.dockerfile
> 
> Please move this container under automation/tests-artifacts/ because the
> container is only meant to be used for tests as opposed as to build Xen.
> I know that in other cases we have reused the build container but that
> just because it was already there an working for the purpose.
> 
> Also please name it based on the fvp rather than debian:
> 
> automation/tests-artifacts/armfvp/11.23_9-arm64v8.dockerfile
> 
> Everything else looks fine.

I take it back. We even have
automation/build/ubuntu/xenial-xilinx.dockerfile and
automation/build/debian/bookworm-cppcheck.dockerfile

At one point I think we should separate the build containers from the
ones we use for testing but I won't ask it here.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

