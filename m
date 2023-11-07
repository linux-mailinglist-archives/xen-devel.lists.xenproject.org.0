Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CC17E49F7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 21:37:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629027.981070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0SpL-0007ya-M0; Tue, 07 Nov 2023 20:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629027.981070; Tue, 07 Nov 2023 20:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0SpL-0007wX-IM; Tue, 07 Nov 2023 20:37:35 +0000
Received: by outflank-mailman (input) for mailman id 629027;
 Tue, 07 Nov 2023 20:37:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FGpL=GU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r0SpK-0007wR-2q
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 20:37:34 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79c7ab7f-7dad-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 21:37:32 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 94C37B818EF;
 Tue,  7 Nov 2023 20:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D47C433C7;
 Tue,  7 Nov 2023 20:37:29 +0000 (UTC)
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
X-Inumbo-ID: 79c7ab7f-7dad-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699389450;
	bh=/KhwW/iXe2feXEw1E7heYO8MgvgwqAcHL7R+lGzr0Nk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Qq0PIA376ZL4HLILvD7QkxBpeGwb/wAM8U0pBYr65RzZkEOUmizEou4pC3S8o4VLo
	 JxxxiQL4+J/TtUL1ikvlLg/6RX0l4PaalXFcnGLlItNe4bvdUg8kpAc9U3FdY5a1sh
	 lk7b0AP0qXCjItq/K0J+SRxFLn8I+k6jWwqaktH1extzQDj4BJ3xkVlrQsn+IhYaLy
	 hgAKEKxTZnmZEAwXvEwtXXULJIQlbCZGrJoXZWoMucH2wyv3Ef8ln9wy01AOFSwVLy
	 h3cNWqQ9y/tlasupyptqmIY45phFdP2VkUEiurtRZYDt+v2J6z4sNJo5TeV/UG4fy/
	 7cCSslY7Y9TaA==
Date: Tue, 7 Nov 2023 12:37:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Federico Serafini <federico.serafini@bugseng.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, consulting@bugseng.com, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH 07/10] arm/traps: address a violation of MISRA C:2012
 Rule 8.2
In-Reply-To: <18a1bb98-0eb4-4fc9-89e1-b32707cdcf9e@xen.org>
Message-ID: <alpine.DEB.2.22.394.2311071237090.3478774@ubuntu-linux-20-04-desktop>
References: <cover.1697207038.git.federico.serafini@bugseng.com> <dbc0e965cd9f93848d27e7ebf0ffcfca05499d58.1697207038.git.federico.serafini@bugseng.com> <7db6d930-8a06-4a1b-b668-94df62972caa@xen.org> <18a1bb98-0eb4-4fc9-89e1-b32707cdcf9e@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-464047518-1699389450=:3478774"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-464047518-1699389450=:3478774
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 7 Nov 2023, Julien Grall wrote:
> Hi Stefano,
> 
> On 16/10/2023 10:02, Julien Grall wrote:
> > Hi,
> > 
> > On 13/10/2023 16:24, Federico Serafini wrote:
> > > Add missing parameter name, no functional change.
> > > 
> > > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > > ---
> > >   xen/arch/arm/traps.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> > > index ce89f16404..5aa14d4707 100644
> > > --- a/xen/arch/arm/traps.c
> > > +++ b/xen/arch/arm/traps.c
> > > @@ -1236,7 +1236,7 @@ int do_bug_frame(const struct cpu_user_regs *regs,
> > > vaddr_t pc)
> > >       if ( id == BUGFRAME_run_fn )
> > >       {
> > > -        void (*fn)(const struct cpu_user_regs *) = (void
> > > *)regs->BUG_FN_REG;
> > > +        void (*fn)(const struct cpu_user_regs *regs) = (void
> > > *)regs->BUG_FN_REG;
> > 
> > Now the line will be over 80 characters. I think we should introduce a
> > typedef. This would also help in the longer run to validate that the
> > function passed to run_in_exception_handle() has the expected prototype.
> 
> I see this patch was committed in your for-4.19 branch. But this comment was
> unaddressed. Can you drop the patch because your branch is committed in
> staging?

I dropped the patch. Federico, please address Julien's feedback.
--8323329-464047518-1699389450=:3478774--

