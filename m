Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FD243D77C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 01:26:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217533.377627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfsJe-0007Ix-3E; Wed, 27 Oct 2021 23:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217533.377627; Wed, 27 Oct 2021 23:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfsJe-0007H9-09; Wed, 27 Oct 2021 23:26:42 +0000
Received: by outflank-mailman (input) for mailman id 217533;
 Wed, 27 Oct 2021 23:26:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RMc=PP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mfsJc-0007H1-Fx
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 23:26:40 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ef3e9c5-40a3-4d8d-9565-cce436c1c195;
 Wed, 27 Oct 2021 23:26:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88C25603E8;
 Wed, 27 Oct 2021 23:26:38 +0000 (UTC)
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
X-Inumbo-ID: 5ef3e9c5-40a3-4d8d-9565-cce436c1c195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635377199;
	bh=UwG3nGU7iQVLhkp+Nj2/VLD26FJbiYfUpKXWLSkCa0c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o7o0TPin+LcwXywwXuZZqTSWBJRcdtpYq/uQEQBnjoV+B5aZVDmFMjzL/c8lkj1AY
	 Q/NxL2ZjaIVp5LD5AFNOxql9z8Od/EOq9ModO5HuXqIJMhY/b4kTH9SvxwsS7NrH+m
	 GtkcNPe0y/e8T3v9bGeBknSGGHaAtBn2K6zZ4AC54vftVJW3CbmCpccgMomE8NWbsl
	 yFVv2G8JitBxONh0ax9/aOyiffUVd0eHKjG0MeHrCuwJUTWsA/Jr0Cjocq88BfAsFc
	 eDbUbjXUzgi9CcJ7WHHFaVW8S9/9aWY3BnxK/czTxpH4IYdfR0yKTyNk3awHpCl9y1
	 kCj/9Fjmw10cw==
Date: Wed, 27 Oct 2021 16:26:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Anthony PERARD <anthony.perard@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, iwj@xenproject.org, cardoe@cardoe.com, 
    wl@xen.org, andrew.cooper3@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2 3/3] automation: add a QEMU based x86_64 Dom0/DomU
 test
In-Reply-To: <YXleke8ciibv/1qt@perard>
Message-ID: <alpine.DEB.2.21.2110271429370.20134@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110251836020.4586@sstabellini-ThinkPad-T480s> <20211026014200.32102-3-sstabellini@kernel.org> <YXleke8ciibv/1qt@perard>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Oct 2021, Anthony PERARD wrote:
> On Mon, Oct 25, 2021 at 06:42:00PM -0700, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > Introduce a test based on QEMU to run Xen, Dom0 and start a DomU.
> > This is similar to the existing qemu-alpine-arm64.sh script and test.
> > The only differences are:
> > - use Debian's qemu-system-x86_64 (on ARM we build our own)
> > - use ipxe instead of u-boot and ImageBuilder
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > ---
> >  automation/gitlab-ci/test.yaml           | 24 ++++++
> >  automation/scripts/qemu-alpine-x86_64.sh | 95 ++++++++++++++++++++++++
> >  2 files changed, 119 insertions(+)
> >  create mode 100755 automation/scripts/qemu-alpine-x86_64.sh
> > 
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> > index 91a10febbf..43d248a604 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -47,6 +47,30 @@ qemu-alpine-arm64-gcc:
> >      - /^coverity-tested\/.*/
> >      - /^stable-.*/
> >  
> > +qemu-alpine-x86_64-gcc:
> > +  stage: test
> > +  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> > +  variables:
> > +    CONTAINER: debian:stretch
> > +  script:
> > +    - ./automation/scripts/qemu-alpine-x86_64.sh 2>&1 | tee qemu-smoke-arm64.log
> 
> Maybe the log file should be called "qemu-smoke-x86_64.log" ? Or just
> "qemu-smoke.log"?

Good catch! This could be fixed on commit.

 
> I'm still not happy about the `apt install` in the middle of the test,
> but I guess that will do for now:
> 
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks!

Now the series is fully acked and Ian gave his reviewed-by. If people
are OK with that I could commit it in a couple of days (and by the end
of this week).

