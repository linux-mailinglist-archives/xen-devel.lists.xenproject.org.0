Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DE09D43C5
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 23:07:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841203.1256709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDsq0-0006Mx-IM; Wed, 20 Nov 2024 22:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841203.1256709; Wed, 20 Nov 2024 22:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDsq0-0006LH-FA; Wed, 20 Nov 2024 22:06:16 +0000
Received: by outflank-mailman (input) for mailman id 841203;
 Wed, 20 Nov 2024 22:06:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zf15=SP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tDspz-0006L8-71
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 22:06:15 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a18474e1-a78b-11ef-a0cc-8be0dac302b0;
 Wed, 20 Nov 2024 23:06:03 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7CCD1A4340F;
 Wed, 20 Nov 2024 22:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE8EC4CECD;
 Wed, 20 Nov 2024 22:05:59 +0000 (UTC)
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
X-Inumbo-ID: a18474e1-a78b-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDQ6MTM4MDo0NWQxOmVjMDA6OjMiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6ImExODQ3NGUxLWE3OGItMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMTQwMzYzLjUyNDE2OCwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732140361;
	bh=u0UT7MrgCrfxHbyxFukhOG6IJ6tvCIYsrvxY9PZs+KM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CAtV3i0XN+Ahy1eLxvkYOXcwf8OsLNLjT7yLp8FxYTwLP+AL9oeUtvGpPPckOeBf6
	 8Hj7MlnAkjqjS09/B0qKIs2Adg5iku+rgYWPNrRDs8NoNEgQz6Wv1INvwnVVOcZWwn
	 /SnwVDDzJYtspnT1z0n7fq+12WjwR11JCy/2uxvGN5TmWDYD7HNzsJOAsLweslWN8Q
	 pyUiA44dgLPBKYxLMf4iyelcekGbdA97gk2tFoWQA+HFev93+/aYaiiGswK4X9N0UK
	 +4r6cUPEb2ZUl2wIjliIWaYFeCXLsWavysZqVbqc1MLs7AtlxzwBKm7pQRaOMOEpcK
	 2RRyReX6JylxA==
Date: Wed, 20 Nov 2024 14:05:56 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, Dario Faggioli <dfaggioli@suse.com>, 
    Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: Re: [RFC PATCH] xen: add libafl-qemu fuzzer support
In-Reply-To: <Zz05dJdAOvaKKrag@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2411201405510.3516911@ubuntu-linux-20-04-desktop>
References: <20241114224636.1942089-1-volodymyr_babchuk@epam.com> <alpine.DEB.2.22.394.2411181737570.1160299@ubuntu-linux-20-04-desktop> <875xojmexk.fsf@epam.com> <Zz05dJdAOvaKKrag@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1286687619-1732140361=:3516911"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1286687619-1732140361=:3516911
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 20 Nov 2024, Marek Marczykowski-Górecki wrote:
> On Tue, Nov 19, 2024 at 03:16:56PM +0000, Volodymyr Babchuk wrote:
> > > Honestly, aside from these two comments, this looks quite good. I would
> > > suggest adding a GitLab CI job to exercise this, if nothing else, to
> > > serve as an integration point since multiple components are required for
> > > this to work.
> > 
> > I was considering this as well. Problem is that fuzzing should be
> > running for a prolonged periods of time. There is no clear consensus on
> > "how long", but most widely accepted time period is 24 hours. So looks
> > like it should be something like "nightly build" task. Fuzzer code
> > needs to be extended to support some runtime restriction, because right
> > now it runs indefinitely, until user stops it.
> 
> Regardless of the actual fuzzing (which takes time), I'd suggest to add
> a gitlab job that does sanity test, checks if stuff still builds etc. It
> can probably be limited to 1min fuzzing or such.

+1
--8323329-1286687619-1732140361=:3516911--

