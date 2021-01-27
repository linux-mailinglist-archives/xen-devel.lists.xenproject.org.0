Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD7530653B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 21:34:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76418.137894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4rWJ-0001ct-K1; Wed, 27 Jan 2021 20:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76418.137894; Wed, 27 Jan 2021 20:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4rWJ-0001cU-G0; Wed, 27 Jan 2021 20:34:31 +0000
Received: by outflank-mailman (input) for mailman id 76418;
 Wed, 27 Jan 2021 20:34:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5d38=G6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l4rWI-0001cP-Eq
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 20:34:30 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ffafbf2-d5a2-495c-8c17-4acf4e97c886;
 Wed, 27 Jan 2021 20:34:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3AB7360C3D;
 Wed, 27 Jan 2021 20:34:28 +0000 (UTC)
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
X-Inumbo-ID: 4ffafbf2-d5a2-495c-8c17-4acf4e97c886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611779668;
	bh=RTTccxXM1QwrSl6dMdXtBcH0gynbdSrlFfMsGg//aqY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=r2h/zPnKlWDFjsLtCtHeUyiItdROAz2cwFqdsEXOYEY8I/7EbNnWwT1mAI1gPxuRc
	 jctjvBWRLf2xjr2eh4Tkr95Gh6QAlMvGSvxGs0k607EcVGgq5uR7nEgtgiOaWVpwiK
	 H6+7Qm0RbHSATL7YyFj+y3RZiWdqAUOnkflvlEaolQr22DEExpB5EPoZYkjc0qFTtw
	 LlckDxG1Xwdi6++B/EGhkHdJxyx9rtH7Dr1D3FkStgDLSGt4dQ8vLGy/TXXQv2TdG4
	 bK71uMSNfQeVRN470Gsollf10/aCesW5/bsLsND33wnYJsjVDrmnphqB/wE9GpU5GI
	 SO3sE6F/v3cSw==
Date: Wed, 27 Jan 2021 12:34:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V5 15/22] xen/arm: Call vcpu_ioreq_handle_completion()
 in check_for_vcpu_work()
In-Reply-To: <0d1a9eed-f898-079f-6176-ca05d2374059@gmail.com>
Message-ID: <alpine.DEB.2.21.2101271233440.9684@sstabellini-ThinkPad-T480s>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com> <1611601709-28361-16-git-send-email-olekstysh@gmail.com> <75703470-5a5a-98e5-bdfa-ca91a5cf439b@xen.org> <0d1a9eed-f898-079f-6176-ca05d2374059@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1984081347-1611779668=:9684"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1984081347-1611779668=:9684
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 27 Jan 2021, Oleksandr wrote:
> On 27.01.21 16:49, Julien Grall wrote:
> > Hi Oleksandr,
> 
> Hi Julien, Stefano
> 
> 
> > 
> > On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
> > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > 
> > > This patch adds remaining bits needed for the IOREQ support on Arm.
> > > Besides just calling vcpu_ioreq_handle_completion() we need to handle
> > > it's return value to make sure that all the vCPU works are done before
> > > we return to the guest (the vcpu_ioreq_handle_completion() may return
> > > false if there is vCPU work to do or IOREQ state is invalid).
> > > For that reason we use an unbounded loop in leave_hypervisor_to_guest().
> > > 
> > > The worse that can happen here if the vCPU will never run again
> > > (the I/O will never complete). But, in Xen case, if the I/O never
> > > completes then it most likely means that something went horribly
> > > wrong with the Device Emulator. And it is most likely not safe
> > > to continue. So letting the vCPU to spin forever if the I/O never
> > > completes is a safer action than letting it continue and leaving
> > > the guest in unclear state and is the best what we can do for now.
> > > 
> > > Please note, using this loop we will not spin forever on a pCPU,
> > > preventing any other vCPUs from being scheduled. At every loop
> > > we will call check_for_pcpu_work() that will process pending
> > > softirqs. In case of failure, the guest will crash and the vCPU
> > > will be unscheduled. In normal case, if the rescheduling is necessary
> > > the vCPU will be rescheduled to give place to someone else.
> > > 
> > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > CC: Julien Grall <julien.grall@arm.com>
> > > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > > [On Arm only]
> > > Tested-by: Wei Chen <Wei.Chen@arm.com>
> > > 
> > > ---
> > > Please note, this is a split/cleanup/hardening of Julien's PoC:
> > > "Add support for Guest IO forwarding to a device emulator"
> > > 
> > > Changes V1 -> V2:
> > >     - new patch, changes were derived from (+ new explanation):
> > >       arm/ioreq: Introduce arch specific bits for IOREQ/DM features
> > > 
> > > Changes V2 -> V3:
> > >     - update patch description
> > > 
> > > Changes V3 -> V4:
> > >     - update patch description and comment in code
> > > 
> > > Changes V4 -> V5:
> > >     - add Stefano's R-b
> > 
> > Reviewed-by means the person reviewed the code and confirmed it is correct.
> > Given the changes you made below, I don't think this tag can hold.
> > 
> > Please confirm with Stefano he is happy with the tag to be carried.
> 
> I think you are right, sorry for that. I should have either clarified this
> question with Stefano in advance or dropped this tag.
> 
> @Stefano, are you happy with the changes for V4 -> V5 (would you mind if your
> R-b still stands)?

Yes, I am.
--8323329-1984081347-1611779668=:9684--

