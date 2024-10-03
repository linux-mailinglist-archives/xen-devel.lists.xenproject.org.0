Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C0898F80B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 22:24:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809866.1222431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swSMy-0004OV-8b; Thu, 03 Oct 2024 20:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809866.1222431; Thu, 03 Oct 2024 20:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swSMy-0004Ln-5p; Thu, 03 Oct 2024 20:24:16 +0000
Received: by outflank-mailman (input) for mailman id 809866;
 Thu, 03 Oct 2024 20:24:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g6hD=Q7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1swSMw-0004Lf-TZ
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 20:24:14 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73a33fce-81c5-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 22:24:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 24B05A40807;
 Thu,  3 Oct 2024 20:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA8AC4CECC;
 Thu,  3 Oct 2024 20:24:10 +0000 (UTC)
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
X-Inumbo-ID: 73a33fce-81c5-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727987051;
	bh=KvrSMVbDp/uwY0BL2iyNQdGPQ2wBJNEtsQ7HwX7FiMY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QQmmaD7JmaqU2Eq+U0XDqomNI0iZIyne8/o+xOVgIRV+UcVIhYi+Kdyy2m2Piw0Ro
	 +c8zKREpT12cmnVBYr1zQ2eoxyZ2yfWGzKRk9d/Wao+hhsVW72KfoVvhoibRhl+dSo
	 1V9Qfqog5UGWxlcdyg/McD7Yhcb6gNBwVQwy+6UtvmO2xxV+kjWx3SJrjZ1Hmdb14O
	 4m57mIb3qgleeGs+41DcuZj3Pl7f3J2szyZ/V5xlM+O3O5ylsCeDgaW0ZN42fVwFbw
	 NopOqvjCs1AyUZRGLD/rADax37NxNflRFxD5yHyNP5QMDbvnOw3Lt6wLiaveEOkncE
	 opSLf06RqWUWg==
Date: Thu, 3 Oct 2024 13:24:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] automation: add a smoke test for xen.efi on X86
In-Reply-To: <alpine.DEB.2.22.394.2410021731490.1138574@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2410031323020.1138574@ubuntu-linux-20-04-desktop>
References: <20241002124245.716302-1-marmarek@invisiblethingslab.com> <20241002124245.716302-2-marmarek@invisiblethingslab.com> <alpine.DEB.2.22.394.2410021516180.1138574@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2410021517500.1138574@ubuntu-linux-20-04-desktop>
 <Zv3Pbx1gkeypGQem@mail-itl> <alpine.DEB.2.22.394.2410021618540.1138574@ubuntu-linux-20-04-desktop> <Zv3kVEljCcM-Ww91@mail-itl> <alpine.DEB.2.22.394.2410021731490.1138574@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-850876684-1727987009=:1138574"
Content-ID: <alpine.DEB.2.22.394.2410031323470.1138574@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-850876684-1727987009=:1138574
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2410031323471.1138574@ubuntu-linux-20-04-desktop>

On Wed, 2 Oct 2024, Stefano Stabellini wrote:
> On Thu, 3 Oct 2024, Marek Marczykowski-Górecki wrote:
> > On Wed, Oct 02, 2024 at 04:30:25PM -0700, Stefano Stabellini wrote:
> > > On Thu, 3 Oct 2024, Marek Marczykowski-Górecki wrote:
> > > > The problem is this doesn't work. The group-level variable overrides the
> > > > one in yaml. See the commit message and the link there...
> > > 
> > > Now I understand the problem, well spotted, thanks!
> > > 
> > > The idea behind having TEST_TIMEOUT defined as a project CI/CD variable
> > > is that it depends on the test infrastructure rather than the Xen code.
> > > So if we suddenly had slower runners we could change TEST_TIMEOUT
> > > without having to change the Xen code itself. So I think we should keep
> > > TEST_TIMEOUT as a project CI/CD variable.
> > > 
> > > I am not a fan of overwriting the TEST_TIMEOUT variable in the test
> > > scripts, because one test script can be used for multiple different
> > > tests, possibly even with different runners. For instance
> > > qubes-x86-64.sh works with a couple of different hardware runners that
> > > could have different timeout values. But I think it would work OK for
> > > now for our hardware-based tests (e.g. xilinx-smoke-dom0less-arm64.sh
> > > and qubes-x86-64.sh could overwrite TEST_TIMEOUT).
> > > 
> > > For this specific XTF test, I am not sure it is worth optimizing the
> > > timeout, maybe we should leave it as default. 
> > 
> > The default of 25min is quite wasteful for XTF test that failed...
> > 
> > > However if we wanted to
> > > lower the timeout value, overwriting it the way you did is OKish as I
> > > cannot think of another way.
> > 
> > If we'd need this option more often, Maybe we could set
> > TEST_TIMEOUT_OVERRIDE in test yaml, and then test script use that (if
> > present) instead? Or maybe have few "classes" of timeouts set globally
> > (TEST_TIMEOUT_SHORT, TEST_TIMEOUT_MEDIUM, TEST_TIMEOUT_LONG? or some
> > better named categories). But I don't think it's worth it for this XTF
> > test yet.
> 
> Agreed, and good idea about TEST_TIMEOUT_OVERRIDE

I decided to send a patch to implement it as I didn't want to keep the
TEST_TIMEOUT as is (ignored) for the Xilinx jobs

https://marc.info/?l=xen-devel&m=172798685928204


You should be able to use TEST_TIMEOUT_OVERRIDE in your test.yaml for
this test
--8323329-850876684-1727987009=:1138574--

