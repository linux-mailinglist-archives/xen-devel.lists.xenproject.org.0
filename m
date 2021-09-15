Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9F940BD3B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 03:32:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187156.335925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQJmo-0006xg-9H; Wed, 15 Sep 2021 01:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187156.335925; Wed, 15 Sep 2021 01:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQJmo-0006us-2t; Wed, 15 Sep 2021 01:32:30 +0000
Received: by outflank-mailman (input) for mailman id 187156;
 Wed, 15 Sep 2021 01:32:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+tO=OF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mQJmm-0006um-HD
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 01:32:28 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8f4742e-15c4-11ec-b48a-12813bfff9fa;
 Wed, 15 Sep 2021 01:32:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86E4260FC0;
 Wed, 15 Sep 2021 01:32:26 +0000 (UTC)
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
X-Inumbo-ID: c8f4742e-15c4-11ec-b48a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631669546;
	bh=O0mnt61XzFZv3YViYVdAusceV0LVpem+l+yeZjoFIqI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sS6YyoqIA2RwTdXvF+ptBb092bimPh1pTtr1ZY5CBDl1DoAIRkxYmbNAmdRGF/8qd
	 ZFzRJ4eXm+oU/y/wDfCMgDa8kbefPpEeDVjTS6hOE5AR6pW6Lb3SeS3Oqgcn8g6yG1
	 3AzCxCQoB+i7Uz7IhogKMOfYys0+NuSybBVM17Hlf8v2+doSi3YE+Q6t7FbK/PuiYF
	 a/6SPdlhNy+wobyNfxG8Y+2MTDHotbqriQ50NoETZrhtweDp5Jxn8C50WPInhEYgsF
	 q5HMGNEudXFsM2a3HaZ/fFdNuHHFUcnmFO0ErS+nUmaV+TIf6itNnI3jZVXrL7NvUg
	 /DUd12+jmROeQ==
Date: Tue, 14 Sep 2021 18:32:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Sai Kiran Kumar Reddy Y <ysaikiran1997@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    kannan@cimware.in
Subject: Re: Xen Booting Problem on ARM Machine
In-Reply-To: <CAEsO4uwpiDO2QoqLRTOxpsYM9YSPAsbX0P=gagdEy21pk1VsPQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2109141825330.21985@sstabellini-ThinkPad-T480s>
References: <33C29853-D896-4E4E-91D3-4D2FA89A9B91@hxcore.ol> <eb5fd47b-6bc9-2eec-7f46-9ab9a42c9f1f@xen.org> <CAEsO4uzsCnsTtTmYHAT4NN6=girCY2NHHdAHbH6GG33D7jwe_A@mail.gmail.com> <alpine.DEB.2.21.2109131437030.10523@sstabellini-ThinkPad-T480s>
 <CAEsO4uwpiDO2QoqLRTOxpsYM9YSPAsbX0P=gagdEy21pk1VsPQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1943811075-1631669172=:21985"
Content-ID: <alpine.DEB.2.21.2109141831220.21985@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1943811075-1631669172=:21985
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109141831221.21985@sstabellini-ThinkPad-T480s>

Something is off. When you enabled earlyprintk in Xen, you should see
something like this at boot time:
https://marc.info/?l=xen-devel&m=158829968025334

All the Xen logs starting with "(XEN)" on the serial. Do you have access
to the serial of the machine? Without it, it is going to be hard to
debug.


On Tue, 14 Sep 2021, Sai Kiran Kumar Reddy Y wrote:
> In the folder "/var/log", there's a file called "xen", which is empty. As far as the boot logs are concerned, I don't see any debug
> messages related to xen. I am attaching the log files, "kern.txt" and "boot.txt"
> 
> On Tue, Sep 14, 2021 at 3:08 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       On Mon, 13 Sep 2021, Sai Kiran Kumar Reddy Y wrote:
>       > On Fri, Sep 10, 2021 at 7:30 PM Julien Grall <julien@xen.org> wrote:
>       >
>       >
>       >       On 08/09/2021 11:43, Sai Kiran wrote:
>       >       > Hello,
>       >
>       >       Hi,
>       >
>       >       Thank you for the report. Moving the discussion back to xen-devel
>       >       because this looks like a potential issue in the UEFI stub in Xen.
>       >
>       >       > I have Xen-4.15.0 on an ARM Machine, with Debian 11 installed on it.
>       >
>       >       Would you be able to give more details on the Arm machine you are using?
>       >       Also, are you using ACPI or DT to boot?
>       >
>       >
>       >    Sai >> DT . ACPI configuration is disabled in Boot settings    
>       >
>       >       >  I
>       >       > am able to do “make world” and “make install”, after “./configure”, as
>       >       > specified in README file. When I reboot the system, I get the following
>       >       > message:
>       >       >
>       >       > Warning: All 128 bootinfo mem banks exhausted.
>       >       >
>       >       > Warning: All 128 bootinfo mem banks exhausted.
>       >
>       >       Hmmm... This means that you have more than 128 memory regions described
>       >       in the EFI memory map. That's quite a lot.
>       >
>       >       Although, this should be harmless as it means Xen will not use the extra
>       >       memory banks.
>       >
>       >       >
>       >       > Cannot exit boot services: ErrCode: 0x8000000000000002
>       >
>       >       This means EFI_INVALID_PARAMETER. We have code to retry because AFAICT
>       >       ExitBootServices() may sometime fails (I have CCed Jan may have more
>       >       idea what's happening).
>       >
>       >       Would you be able to provide more details on the UEFI firmware you are
>       >       using? Is it EDK2 or U-boot?
>       >
>       > Sai >>  EDK2 
>       >       Also, do you know if Linux is boot on the same system?
>       >
>       > Sai >> Yes 
>       >       However, AFAICT, the error message would not prevent Xen to continue
>       >       booting. So you may get stuck later in the boot process.
>       >
>       >       My suggestion would be to enable earlyprintk for your platform. You can
>       >       setup it up from the menuconfig in "Debugging Options".
>       >
>       > Sai >> Yes, I have enabled earlyprintk.
>       > I tried changing NR_MEM_BANKS(in xen/include/asm-arm/setup.h) value to 256, from 128. The error message is no longer seen,
>       but the device
>       > is stuck in the boot process.
> 
>       Could you please post the boot logs now that you enabled earlyprintk?
>       Ideally not a camera picture but a textual copy/paste from the target
>       serial?
> 
>       Earlyprintk is pretty verbose, we should be able to figure out where it
>       gets stuck.
> 
> 
> 
--8323329-1943811075-1631669172=:21985--

