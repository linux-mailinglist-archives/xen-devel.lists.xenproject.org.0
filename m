Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F614D50E5
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 18:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288580.489402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMxV-0006cM-L8; Thu, 10 Mar 2022 17:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288580.489402; Thu, 10 Mar 2022 17:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMxV-0006ZH-HZ; Thu, 10 Mar 2022 17:52:17 +0000
Received: by outflank-mailman (input) for mailman id 288580;
 Thu, 10 Mar 2022 17:52:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jEEf=TV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nSMxU-0006ZB-H3
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 17:52:16 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d15eeab4-a09a-11ec-853a-5f4723681683;
 Thu, 10 Mar 2022 18:52:14 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1053BB82794;
 Thu, 10 Mar 2022 17:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 430B2C340E8;
 Thu, 10 Mar 2022 17:52:12 +0000 (UTC)
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
X-Inumbo-ID: d15eeab4-a09a-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646934732;
	bh=EibqyvZ2uaiAGPgf3LcwpDdQJvPaXhwvTgjJ+0WaCKE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=R2l5+XKsK1iHvGGtTTqXoVQYMm15odSGmOfQeG+3JBBoYYN/EGwizUsKKbW+RPCU/
	 rYZMRLgNhSeeol9zZHBbOuapap+oq3vIfV9bIk0gbIRuqc9f2Usje8AnfHoXSIntSn
	 sshVBaeiy87gRbbvEURWV9INLhKzBEdGD1oD69h5LpqwIKpVKw4PCHChd5gam561cG
	 5ZCdgoeXBml7xrcKJIKJBRFczo0Ph+UX104iaz+0dfMiOeg9Ib+oQR33TWJssdb4cx
	 4Jgxu1zcYu6A/TebFgivNDUKoa+/1QkJlhbzo8moZBl0zsRHSZqNEQabOKpQ5m7WlS
	 Jif201jiIbDOA==
Date: Thu, 10 Mar 2022 09:52:11 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    George Dunlap <george.dunlap@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Anthony Perard <anthony.perard@citrix.com>
Subject: Re: preparations for 4.16.1
In-Reply-To: <3c7b7e00-1134-2ce3-26e7-b3d11782daaa@xen.org>
Message-ID: <alpine.DEB.2.22.394.2203100951290.3261@ubuntu-linux-20-04-desktop>
References: <b9be95eb-7a6e-9f1b-6b68-6d08d6329cd1@suse.com> <4fe170af-9120-0203-bed9-895380a2ff0a@xen.org> <4DE5BBE4-F228-4584-81AD-D0A41858FDB9@arm.com> <3c7b7e00-1134-2ce3-26e7-b3d11782daaa@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Mar 2022, Julien Grall wrote:
> On 10/03/2022 10:02, Bertrand Marquis wrote:
> > Hi,
> > > On 10 Mar 2022, at 09:04, Julien Grall <julien@xen.org> wrote:
> > > On 10/03/2022 08:57, Jan Beulich wrote:
> > > > the release is due in a few weeks time.
> > > > Please point out backports you find missing from the respective staging
> > > > branch, but which you consider relevant. One I have queued already, but
> > > > which I'd like to put in only once the pending fix to it ("x86: avoid
> > > > SORT_BY_INIT_PRIORITY with old GNU ld") has also landed in staging, is
> > > > 4b7fd8153ddf x86: fold sections in final binaries
> > > 
> > > For arm, I would like to propose backporting:
> > > 
> > > 32365f3476: xen/arm64: Zero the top 32 bits of gp registers on entry...
> > > 
> > 
> > Agree (not changing the fact that Stefano should confirm)
> > 
> > I would like the following one to also be considered:
> > f3999bc: arm/efi: Handle Xen bootargs from both xen.cfg and DT
> > f1f38e2: xen/arm: increase memory banks number define value
> 
> I am fine with both.

Agree and done

