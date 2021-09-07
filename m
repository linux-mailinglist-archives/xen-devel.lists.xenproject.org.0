Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69318403174
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 01:18:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181386.328476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNkLV-0008Ov-NQ; Tue, 07 Sep 2021 23:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181386.328476; Tue, 07 Sep 2021 23:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNkLV-0008Mt-JJ; Tue, 07 Sep 2021 23:17:41 +0000
Received: by outflank-mailman (input) for mailman id 181386;
 Tue, 07 Sep 2021 23:17:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDhR=N5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mNkLT-0008MB-SU
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 23:17:39 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id caacbc92-1031-11ec-b132-12813bfff9fa;
 Tue, 07 Sep 2021 23:17:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8F1B60F14;
 Tue,  7 Sep 2021 23:17:37 +0000 (UTC)
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
X-Inumbo-ID: caacbc92-1031-11ec-b132-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631056657;
	bh=XA9IMkep5CyFBW7EaXh7yuXdS92Q2DxXSqumrb+GRfg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=prsFy9ld4u6dcUI5qwFjPyEYdvofujezsY1Tbg7zSxFIpBKmFB/WPgxIhDpUSquKT
	 f1O1/chMuzqiB3UH9x0WmUeDqtscIB1+2zDWKReVKk0bbGGdt7mbf2z3XwwFyw4dvR
	 CkNuESdDmAvzrhGrX9dfYFVr9p1Pk3NXCRUBCwSndEThCN6vcZ33pKHuvw6Wi4qyEU
	 kyTm+l16HtEx6taf8vWgQm/xw8XvoVLgsQ0QboMGyjFBIe5qAt2wCoGwn0iRXNpk5j
	 T6vOPWDSTi7Ieq2m8eQe2rL1mSd8JlimJXGLcaKeihXNhHl/pbYFGTkNi75TxySDA7
	 1AWB1402BJrbw==
Date: Tue, 7 Sep 2021 16:17:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] xen/arm: Sanitize CTR_EL0 and emulate it if
 needed
In-Reply-To: <F675C327-DA08-478D-ADA8-51D9DA63DE6D@arm.com>
Message-ID: <alpine.DEB.2.21.2109071616320.14059@sstabellini-ThinkPad-T480s>
References: <cover.1629897306.git.bertrand.marquis@arm.com> <a7482653a0c29d68854846f25553f4938a6279b9.1629897306.git.bertrand.marquis@arm.com> <14b1639e-c9e4-f8fb-e921-73d7f28681ac@xen.org> <98E8FB9D-3372-47D2-92F7-8AD401AC1092@arm.com>
 <6705127a-bde2-36cd-0fed-900eb1eace03@xen.org> <CA9E8DFA-E0D8-4C33-A277-E19EFFCAFDC4@arm.com> <alpine.DEB.2.21.2109031540470.26072@sstabellini-ThinkPad-T480s> <D0CCB87F-1CC1-450B-A612-E4B505B36B5B@arm.com> <7fc6e6b6-464a-a305-2693-42cba40ad869@xen.org>
 <F675C327-DA08-478D-ADA8-51D9DA63DE6D@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1027929738-1631056639=:14059"
Content-ID: <alpine.DEB.2.21.2109071617300.14059@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1027929738-1631056639=:14059
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109071617301.14059@sstabellini-ThinkPad-T480s>

On Tue, 7 Sep 2021, Bertrand Marquis wrote:
> Hi Julien,
> 
> > On 6 Sep 2021, at 18:36, Julien Grall <julien@xen.org> wrote:
> > 
> > Hi Bertrand,
> > 
> > On 06/09/2021 09:29, Bertrand Marquis wrote:
> >>> On 3 Sep 2021, at 23:49, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >>> 
> >>> On Tue, 31 Aug 2021, Bertrand Marquis wrote:
> >>>> Hi Julien,
> >>>> 
> >>>>> On 31 Aug 2021, at 15:47, Julien Grall <julien@xen.org> wrote:
> >>>>> 
> >>>>> 
> >>>>> 
> >>>>> On 31/08/2021 14:17, Bertrand Marquis wrote:
> >>>>>> Hi Julien,
> >>>>> 
> >>>>> Hi Bertrand,
> >>>>> 
> >>>>>>> On 27 Aug 2021, at 16:05, Julien Grall <julien@xen.org> wrote:
> >>>>>>> 
> >>>>>>> Hi Bertrand,
> >>>>>>> 
> >>>>>>> On 25/08/2021 14:18, Bertrand Marquis wrote:
> >>>>>>>> Sanitize CTR_EL0 value between cores.
> >>>>>>>> In most cases different values will taint Xen but if different
> >>>>>>>> i-cache policies are found, we choose the one which will be compatible
> >>>>>>>> between all cores in terms of invalidation/data cache flushing strategy.
> >>>>>>> 
> >>>>>>> I understand that all the CPUs in Xen needs to agree on the cache flush strategy. However...
> >>>>>>> 
> >>>>>>>> In this case we need to activate the TID2 bit in HCR to emulate the
> >>>>>>>> TCR_EL0 register for guests. This patch is not activating TID2 bit all
> >>>>>>>> the time to limit the overhead when possible.
> >>>>>>> 
> >>>>>>> as we discussed in an earlier version, a vCPU is unlikely (at least in short/medium) to be able move across pCPU of different type. So the vCPU would be pinned to a set of pCPUs. IOW, the guest would have to be big.LITTLE aware and therefore would be able to do its own strategy decision.
> >>>>>>> 
> >>>>>>> So I think we should be able to get away from trappings the registers.
> >>>>>> I do agree that we should be able to get away from that in the long term once
> >>>>>> we have cpupools properly set but right now this is the only way to have
> >>>>>> something useable (I will not say right).
> >>>>>> I will work on finding a way to setup properly cpupools (or something else as
> >>>>>> we discussed earlier) but in the short term I think this is the best we can do.
> >>>>> 
> >>>>> My concern is you are making look like Xen will be able to deal nicely with big.LITTLE when in fact there are a lot more potential issue by allow a vCPU moving accross pCPU of different type (the errata is one example).
> >>>> 
> >>>> I agree and this is why Xen is tainted.
> >>>> 
> >>>>> 
> >>>>>> An other solution would be to discard this patch from the serie for now until
> >>>>>> I have worked a proper solution for this case.
> >>>>>> Should we discard or merge or do you have an other idea ?
> >>>>> Please correct me if I am wrong, at the moment, it doesn't look like this patch will be part of the longer plan. If so, then I think it should be parked for now.
> >>>> 
> >>>> Not sure it depends on what the final solution would be but this is highly possible I agree.
> >>>> 
> >>>>> 
> >>>>> This would also have the advantage to avoid spending too much time on resolving the emulation issue I mentioned in my previous answer.
> >>>>> 
> >>>>> No need to resend a new version of this series yet. You can wait until the rest of the series get more feedback.
> >>>> 
> >>>> Ok, I will wait for feedback and next serie will not include this patch anymore.
> >>> 
> >>> Would it be worth keeping just the part that sanitizes ctr, without any
> >>> of the emulation stuff? That way we could still detect cases where there
> >>> is a mismatch between CPUs, print a useful message and taint Xen.
> >> That’s a good idea, it means removing the emulation part and just keep the sanitization.
> >> @Julien: would you be ok with that ?
> > 
> > I actually thought about suggesting it before Stefano did it. So I am OK with that.
> > 
> >> Should I send a v4 or should we use Stefano’s patch directly instead ?
> > 
> > I would suggest to send a v4. This needs a signed-off-by from Stefano and a new commit message.
> 
> Ok I will do that beginning of next week.

Of course you can add my signed-off-by and even my reviewed-by (although
it will look weird as it seems I reviewed my own patch)
--8323329-1027929738-1631056639=:14059--

