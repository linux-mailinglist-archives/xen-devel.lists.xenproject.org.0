Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C0C46ACE7
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:42:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240007.416122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMgD-0001s5-RD; Mon, 06 Dec 2021 22:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240007.416122; Mon, 06 Dec 2021 22:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMgD-0001pK-OA; Mon, 06 Dec 2021 22:41:53 +0000
Received: by outflank-mailman (input) for mailman id 240007;
 Mon, 06 Dec 2021 22:41:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYkR=QX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1muMgC-0001pE-0t
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:41:52 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b397eaa1-56e5-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:41:50 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 77B0CB815B0;
 Mon,  6 Dec 2021 22:41:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E588FC341C6;
 Mon,  6 Dec 2021 22:41:47 +0000 (UTC)
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
X-Inumbo-ID: b397eaa1-56e5-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638830508;
	bh=ybxb1Cs1iC1zy+8FjGpNML/IjtZYDAOJfwLd5cIiNM4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sUPQLM+WjPb3DqLvk0wYZmzffZail/VBHfWBCIxTaABkGAir4iou/JeXlSzWCPzGl
	 GJJHjKPhyh94cDbJoRJnLIzGaZn4JN9m2JrqVPI4Oj82nHR7CJeeG66nTLi60a2rao
	 hLusu2s8jRbIqjGLpIV50pKuS9qZubVmwvEWg5pCbgDMMfU6Y9W4A4P0zl+I6/WZP/
	 R6zBBUs4rgZF3FI7Ik8k7aQso2aaiJtrsQFo5Sukk951hFKTQN2wJtUeuvd3JDwahH
	 hxaoGNLyMsvIs7ij6/cMvXr/meSvujGGdHI63j1v6U9D5Tb1b6k6QCHPSuU9X5l8E/
	 XbAs6QoQxsMcQ==
Date: Mon, 6 Dec 2021 14:41:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>, 
    Andre Przywara <Andre.Przywara@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    "stefanos@xilinx.com" <stefanos@xilinx.com>, 
    "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, 
    "jbeulich@suse.com" <jbeulich@suse.com>
Subject: Re: [XEN v2] xen/arm64: io: Decode 32-bit ldr/str post-indexing
 instructions
In-Reply-To: <4315f3f8-4431-3257-dc95-a3089532237b@xen.org>
Message-ID: <alpine.DEB.2.22.394.2112061438300.4091490@ubuntu-linux-20-04-desktop>
References: <20211129191638.19877-1-ayankuma@xilinx.com> <20211130094950.1bf368d6@donnerap.cambridge.arm.com> <a69d41f1-7b57-c127-ae73-2de5a581dddd@xilinx.com> <D8811539-65F2-4D40-BFEF-CE72EA8E902A@arm.com> <4315f3f8-4431-3257-dc95-a3089532237b@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 6 Dec 2021, Julien Grall wrote:
> On 01/12/2021 08:41, Bertrand Marquis wrote:
> > Hi Ayan,
> > 
> > > On 30 Nov 2021, at 19:13, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
> > > wrote:
> > > 
> > > Hi Andre,
> > > 
> > > Thanks for your comments. They are useful.
> > > 
> > > On 30/11/2021 09:49, Andre Przywara wrote:
> > > > On Mon, 29 Nov 2021 19:16:38 +0000
> > > > Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
> > > > Hi,
> > > > > At the moment, Xen is only handling data abort with valid syndrome
> > > > > (i.e.
> > > > > ISV=0). Unfortunately, this doesn't cover all the instructions a
> > > > > domain
> > > > > could use to access MMIO regions.
> > > > > 
> > > > > For instance, Xilinx baremetal OS will use:
> > > > > 
> > > > >          volatile u32 *LocalAddr = (volatile u32 *)Addr;
> > > > >          *LocalAddr = Value;
> > > > > 
> > > > > This leave the compiler to decide which store instructions to use.
> > > > As mentioned in the other email, this is wrong, if this points to MMIO:
> > > > don't let the compiler do MMIO accesses. If a stage 2 fault isn't in
> > > > an MMIO area, you should not see traps that you cannot handle already.
> > > > So I don't think it's a good idea to use that as an example. And since
> > > > this patch only seems to address this use case, I would doubt its
> > > > usefulness in general.
> > > Yes, I should have fixed the comment.
> > > 
> > > Currently, I am testing with baremetal app which uses inline assembly code
> > > with post indexing instructions, to access the MMIO.
> > > 
> > > ATM, I am testing with 32 bit MMIO only.
> > > 
> > > On the usefulness, I am kind of torn as it is legitimate for post indexing
> > > instructions to be used in an inline-assembly code for accessing MMIO.
> > > However, that may not be something commonly seen.
> > > 
> > > @Stefano/Bertrand/Julien/Volodymyr :- As you are the Arm mantainers, can
> > > you comment if we should have decoding logic or not ?
> > 
> > Andre gave you the official statement from Arm and there is nothing more I
> > can say.
> 
> I think this would be handy for other hypervisor and OS developper to know
> what they can expect when running in a virtualized environment. So would it be
> possible to update the Arm Arm reflecting this statement?
> 
> > I will leave this decision to Stefano and Julien.
> 
> I have had a chat on IRC with Stefano about this. I think the main sticking
> point is the Arm Arm doesn't clearly state those instructions should not be
> used by a virtualized OS on MMIO regions.
> 
> To me, this topic looks similar to the set/way instruction dilemma. They are a
> pain to virtualize (and the Arm Arm clearly hint it) but we had to do it
> because some OSes relied on them.
> 
> I think the main difference is the Arm Arm doesn't hint they should not be
> used (it only says a valid syndrome is not provided) and the implementation
> should hopefully be smaller and self-contained.
> 
> So I would be inclined to allow Xen to decode post-indexing instructions
> (pending the review).

I am of the same opinion.

(FYI in any case we'll also work internally to improve Xilinx baremetal.)

