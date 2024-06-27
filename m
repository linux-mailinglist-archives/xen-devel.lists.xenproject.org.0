Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E0E919CE9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 03:23:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749632.1157866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMdqJ-00079l-Dz; Thu, 27 Jun 2024 01:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749632.1157866; Thu, 27 Jun 2024 01:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMdqJ-000777-As; Thu, 27 Jun 2024 01:22:31 +0000
Received: by outflank-mailman (input) for mailman id 749632;
 Thu, 27 Jun 2024 01:22:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDhR=N5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMdqH-000771-Fl
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 01:22:29 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b54fe793-3423-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 03:22:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A8B4CCE2D30;
 Thu, 27 Jun 2024 01:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5A0C116B1;
 Thu, 27 Jun 2024 01:22:15 +0000 (UTC)
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
X-Inumbo-ID: b54fe793-3423-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719451337;
	bh=ppBMDbHWombTqVCft7o5PJQQJ6xnxnPuHVKKBZRQRV4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DsaW4/tui+QRQ54+M8HpR783A2UWAkCc6ARCHwxmqtoQsdQKNlBGwjL5aT1jRTO1g
	 hSOVHWX7/AgkcYuyCTvCCLoYw1fR1ZWyWeRzMGYNAngwwKlLuQahDhY7M9JLBawrD6
	 sj1nJGTgAkc+XWixAi9cDDCZuBkeN5yrk0338FSJCXn46IpTtwBSB3ek4lt4qEthyG
	 gRyF1YbneXfwOLQr1lnSkeVlAdmHiF4P2p4nJ3WoCKhbX8a/vxkk+TPP8nj0jTTG8s
	 XHi4pY+DG+BjPSq/F/9ayijproghw/RUAstZTky4U0WQnSSrZf0esxp2s0uXpusndW
	 4HROvz6F5teLg==
Date: Wed, 26 Jun 2024 18:22:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: oleksii.kurochko@gmail.com
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [XEN PATCH v2 0/6][RESEND] address violations of MISRA C Rule
 20.7
In-Reply-To: <9814c00d116f14a1ce238b131b9eba19fa130986.camel@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2406261821060.3635@ubuntu-linux-20-04-desktop>
References: <cover.1718378539.git.nicola.vetrini@bugseng.com>  <alpine.DEB.2.22.394.2406241743480.3870429@ubuntu-linux-20-04-desktop>  <88127f41-a3e3-4d05-b9f2-3e4117bf1503@suse.com> <9814c00d116f14a1ce238b131b9eba19fa130986.camel@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jun 2024, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-06-25 at 08:39 +0200, Jan Beulich wrote:
> > On 25.06.2024 02:47, Stefano Stabellini wrote:
> > > I would like to ask for a release-ack as the patch series makes
> > > very few
> > > changes outside of the static analysis configuration. The few
> > > changes to
> > > the Xen code are very limited, straightforward and makes the code
> > > better, see patch #3 and #5.
> > 
> > While continuing to touch automation/ may be okay, I really think
> > time has
> > passed for further Misra changes in 4.19, unless they're fixing
> > actual bugs
> > of course. Just my personal view though ...
> I am not quite sure I understand the concern. From my perspective, the
> patch series addresses several MISRA violations without introducing any
> functional changes. It seems safe to incorporate these MISRA changes
> even at this stage of the release.

I agree with you but I guess Jan's point is that every change even small
could introduce a regression. This is your decision.

This is the updated version:
https://marc.info/?l=xen-devel&m=171940854121984

