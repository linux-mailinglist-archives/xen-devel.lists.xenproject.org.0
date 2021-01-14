Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 492F22F6578
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 17:11:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67356.120088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l05Dj-0001gP-OI; Thu, 14 Jan 2021 16:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67356.120088; Thu, 14 Jan 2021 16:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l05Dj-0001g0-Ku; Thu, 14 Jan 2021 16:11:35 +0000
Received: by outflank-mailman (input) for mailman id 67356;
 Thu, 14 Jan 2021 16:11:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l05Di-0001fv-0Y
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 16:11:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l05Dh-0007mc-Uz
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 16:11:33 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l05Dh-0004sG-Tk
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 16:11:33 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l05Dd-0004RX-6s; Thu, 14 Jan 2021 16:11:29 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=H5Fjgo/bZ3MWk90rgt4dMN64N0aXtxxeW2GdrHz3TfQ=; b=la55JQehGvESbhFPDNVDyoFXMC
	/ijLCFfUKirAGykG2ryYugayYZBjC5vn1onmC9tHMagC0IjZP9g6ZAF37nB+Pl0+VQIGJN8C43u1X
	B5x/a36Gzt+2ZX9uluQ6ubtzSJYXorcHx8jOiGTJJ5wklZJi+eIOtnsMwfO6ruxiZJbU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24576.27952.975905.92719@mariner.uk.xensource.com>
Date: Thu, 14 Jan 2021 16:11:28 +0000
To: Oleksandr <olekstysh@gmail.com>
Cc: Julien Grall <julien@xen.org>,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH V4 00/24] IOREQ feature (+ virtio-mmio) on Arm
In-Reply-To: <6f5a592f-10a5-059b-7d63-bf86764e3fbb@gmail.com>,
	<d88f8dc5-da96-0efa-09f2-fb7884f2f703@gmail.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
	<AM0PR08MB37471AF1CDF1B930A919C3449EA80@AM0PR08MB3747.eurprd08.prod.outlook.com>
	<d88f8dc5-da96-0efa-09f2-fb7884f2f703@gmail.com>
	<24567.7198.846779.557032@mariner.uk.xensource.com>
	<6f5a592f-10a5-059b-7d63-bf86764e3fbb@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Hi, thanks for giving this update.

Since you were the only person who took the time to send such an
update I feel I can spend some time on trying to help with any
obstacles you may face.  Hence this enquiry:

Oleksandr writes ("Re: [ANNOUNCE] Xen 4.15 release schedule and feature tracking"):
> I work on virtio-mmio on Arm which involves x86's IOREQ/DM features.
> Currently I am working on making the said features common, implementing 
> missing bits, code cleanup an hardening, etc.
> I don't think the virtio-mmio is a 4.15 material, but it would be great 
> have at least "common" IOREQ/DM in 4.15.
..
> > P: your current estimate of the probability it making 4.15, as a %age
> 
> Difficult to say, it depends ...
> RFC was posted Aug 3, 2020, The last posted version is V3. Currently I 
> am in the middle of preparing v4, still need to find a common ground for 
> few bits.

So, I'm replying to V4 here.  Did you resolve your issues ?
What are the major outstanding risks to this series and do you need
any help from the Xen Project (eg from me as Release Manager) ?

NB I have not been following this series in detail - I'm just looking
at your mail and your 00/ posting and so on.  So if there is some
blocker or risk I am probably unaware of it.

I notice that there's one libxl RFC patch in there.  Since that's in
my bailiwick I will try to review it soon.

Regards,
Ian.

