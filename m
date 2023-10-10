Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B367C459D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 01:41:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615187.956443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqMKU-000762-Pr; Tue, 10 Oct 2023 23:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615187.956443; Tue, 10 Oct 2023 23:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqMKU-00073B-Mr; Tue, 10 Oct 2023 23:39:58 +0000
Received: by outflank-mailman (input) for mailman id 615187;
 Tue, 10 Oct 2023 23:39:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z25Z=FY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qqMKT-000735-NK
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 23:39:57 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5000ccdb-67c6-11ee-98d3-6d05b1d4d9a1;
 Wed, 11 Oct 2023 01:39:55 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DF5B9CE21B7;
 Tue, 10 Oct 2023 23:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22EBBC433C8;
 Tue, 10 Oct 2023 23:39:47 +0000 (UTC)
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
X-Inumbo-ID: 5000ccdb-67c6-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696981189;
	bh=IG8tgLyPg/ZpmazdKQoGy1TuYfR5jdYUGh+mZHLUsNQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SCctL5geusnu+qlz6I6JgBf5rwTOSee8NFMSVvjr+FsBbIUJJHjkcOLRP+RBSZRhI
	 gHzePG9bpajQSNyFrUNBUyjAXcBnPsz/NN4ELqWyyowS92iowt4Q9eXBuBzY6kF+jN
	 +aESKT6aht+jl1gdNGI32SP9afpnHl8JCraZECWariwq4BYYmFu2P3+1JL0yd8xNW9
	 UGnQOzGdznKB5qml8BjHQLt+iJJsNATxxfaqozJig2SatcxVXqHq72h6yZdC6+Wd/v
	 8SpG+zmByA6Z0Yi/lwMURNX21hgMv+LX7eeRrZanOcbCt3Dp84aS38T3E/m43NCdlC
	 sd5arnts4MIWg==
Date: Tue, 10 Oct 2023 16:39:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Luca Fancellu <Luca.Fancellu@arm.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    "michal.orzel@amd.com" <michal.orzel@amd.com>, 
    "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    "consulting@bugseng.com" <consulting@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Henry Wang <Henry.Wang@arm.com>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
In-Reply-To: <8c3d7933-c139-49dd-8c62-2d4543176f8f@xen.org>
Message-ID: <alpine.DEB.2.22.394.2310101635280.3431292@ubuntu-linux-20-04-desktop>
References: <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop> <e1736215-52ba-4737-9da3-8f1ba7e832a6@citrix.com> <DB96C095-5FAF-40A1-9CA8-002291AA1933@arm.com>
 <2894008e8f612296da84267346ae4240@bugseng.com> <B00BC78B-E707-4043-A0B4-D320C6717472@arm.com> <alpine.DEB.2.22.394.2310041625170.2348112@ubuntu-linux-20-04-desktop> <9DD525D9-DB6D-4888-9266-FB45906A0E0F@arm.com> <alpine.DEB.2.22.394.2310051756360.2348112@ubuntu-linux-20-04-desktop>
 <C2DDFAB5-D943-4A24-9C14-AF35BE2A7C90@arm.com> <alpine.DEB.2.22.394.2310061741130.3431292@ubuntu-linux-20-04-desktop> <1ceb5aa0-d374-4357-964f-1341468d542e@xen.org> <alpine.DEB.2.22.394.2310091251080.3431292@ubuntu-linux-20-04-desktop>
 <8c3d7933-c139-49dd-8c62-2d4543176f8f@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Oct 2023, Julien Grall wrote:
> Hi Stefano,
> 
> On 09/10/2023 23:19, Stefano Stabellini wrote:
> > > 
> > > I am not sure this is better. This is a long line to read. But this is a
> > > personal opinion.
> > > 
> > > On the technical side, can we easily teach a tool to format this kind of
> > > exception? If not, then this should not be an exception we should
> > > implement.
> > 
> > I am not sure I understand what you mean by "can we easily teach a tool
> > to format this kind of exception". Do you mean whether we can teach a
> > tool to interpret a multiline statement as a single statement?
> 
> Sorry for the wording was not clear. I was referring to tools formatting the
> code (e.g. clang-format). Hopefully, at some point, we will finally have a way
> to automatically format the code. So we need a coding style that can be easily
> be checked.
> 
> It is not clear to me whether your proposed exception would work. We may have
> to allow longer lines (and this has drawback).

Yes, that's a good point. It will probably be an issue with clang-format.


> > /* cppcheck tag */
> > line1
> > /* cppcheck tag */
> > line2
> > /* cppcheck tag */
> > line3
> > 
> > and that would end up changing the line numbers in the source files so
> > the cppcheck report wouldn't match with the original line numbers any
> > longer
> 
> Would cppcheck accepts tag at the end of the line? If so, the following would
> not modify the line count:
> 
> /* cppcheck tag */
> line1 /* added cppcheck tag */
> line2 /* added cppcheck tag */
> line3 /* added cppcheck tag */

Luca answered to a similar, more generic, question a few days ago about
Coverity: https://marc.info/?l=xen-devel&m=169657904027210

So even if we get cppcheck to work like that, we would lose Coverity
support.

It doesn't seem there are a lot of good options here. In this case Luca
came up with a good idea on how to refactor the code so we should be
good.

But it doesn't seem we'll be able to come up with a general solution to
the multiline statement problem.

