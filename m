Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61298BB3B5
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 21:08:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716642.1118768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2yFw-0002vI-Ac; Fri, 03 May 2024 19:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716642.1118768; Fri, 03 May 2024 19:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2yFw-0002tJ-6r; Fri, 03 May 2024 19:07:40 +0000
Received: by outflank-mailman (input) for mailman id 716642;
 Fri, 03 May 2024 19:07:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvfX=MG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2yFv-0002tD-DK
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 19:07:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66b52c7a-0980-11ef-b4bb-af5377834399;
 Fri, 03 May 2024 21:07:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D350361E0C;
 Fri,  3 May 2024 19:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7838C116B1;
 Fri,  3 May 2024 19:07:32 +0000 (UTC)
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
X-Inumbo-ID: 66b52c7a-0980-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714763254;
	bh=iiNH2csW/wExCYmnJzB9cYm+1os13nvklaTb7La4veo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YGEPZRcqoHmlvqub8K5sX0+3i4n/J4Ib59/yDCnFQC9LPHdAosIOUxDvNcPbqVyF/
	 YsnrqDvADqAi+deuyDlJYIW0V2VLQh18GD7dRYFZESfp4ZB/vpzrHsnso4enfSY/BR
	 NgAZE814gcFPm0KxF+kpFx1N0Wyxy2mtU78X9R+tBkktis2UEFGLFKkm6G7N2Pm7mh
	 VV5BSJ7+5Kdvw2OY1P+TrgKQtIlw0LbLwXxZHY0wB7TOJb8wEIe7szrqiKIrEadAb2
	 VAQuggZrV+SsjAv1jf/VD8idWjdqSCkOODqXA4SjuU6ni+Bb/YiSkGYgBBDHbupEz/
	 8dx9i/OAHCNQQ==
Date: Fri, 3 May 2024 12:07:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 8/8] xen: allow up to 16383 cpus
In-Reply-To: <b3299df2-e726-49eb-a893-cbc547b2419c@xen.org>
Message-ID: <alpine.DEB.2.22.394.2405031159240.1151289@ubuntu-linux-20-04-desktop>
References: <20240327152229.25847-1-jgross@suse.com> <20240327152229.25847-9-jgross@suse.com> <da1662ac-70f1-4ae4-9737-e10e617c8036@suse.com> <637c755a-9f24-4b86-af12-7c7d50bf40c8@suse.com> <d0714064-c544-47d3-84c0-a19391ccf496@xen.org>
 <29296e11-8d21-4867-9d31-fc94af828214@suse.com> <146fbd43-d8b8-4d73-8650-c60024498324@xen.org> <alpine.DEB.2.22.394.2405021111540.624854@ubuntu-linux-20-04-desktop> <b3299df2-e726-49eb-a893-cbc547b2419c@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1617437709-1714763254=:1151289"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1617437709-1714763254=:1151289
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 3 May 2024, Julien Grall wrote:
> Hi Stefano,
> 
> On 02/05/2024 19:13, Stefano Stabellini wrote:
> > On Mon, 29 Apr 2024, Julien Grall wrote:
> > > Hi Juergen,
> > > 
> > > On 29/04/2024 12:28, Jürgen Groß wrote:
> > > > On 29.04.24 13:04, Julien Grall wrote:
> > > > > Hi Juergen,
> > > > > 
> > > > > Sorry for the late reply.
> > > > > 
> > > > > On 29/04/2024 11:33, Juergen Gross wrote:
> > > > > > On 08.04.24 09:10, Jan Beulich wrote:
> > > > > > > On 27.03.2024 16:22, Juergen Gross wrote:
> > > > > > > > With lock handling now allowing up to 16384 cpus (spinlocks can
> > > > > > > > handle
> > > > > > > > 65535 cpus, rwlocks can handle 16384 cpus), raise the allowed
> > > > > > > > limit
> > > > > > > > for
> > > > > > > > the number of cpus to be configured to 16383.
> > > > > > > > 
> > > > > > > > The new limit is imposed by IOMMU_CMD_BUFFER_MAX_ENTRIES and
> > > > > > > > QINVAL_MAX_ENTRY_NR required to be larger than 2 *
> > > > > > > > CONFIG_NR_CPUS.
> > > > > > > > 
> > > > > > > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > > > > > 
> > > > > > > Acked-by: Jan Beulich <jbeulich@suse.com>
> > > > > > > 
> > > > > > > I'd prefer this to also gain an Arm ack, though.
> > > > > > 
> > > > > > Any comment from Arm side?
> > > > > 
> > > > > Can you clarify what the new limits mean in term of (security)
> > > > > support?
> > > > > Are we now claiming that Xen will work perfectly fine on platforms
> > > > > with up
> > > > > to 16383?
> > > > > 
> > > > > If so, I can't comment for x86, but for Arm, I am doubtful that it
> > > > > would
> > > > > work without any (at least performance) issues. AFAIK, this is also an
> > > > > untested configuration. In fact I would be surprised if Xen on Arm was
> > > > > tested with more than a couple of hundreds cores (AFAICT the Ampere
> > > > > CPUs
> > > > > has 192 CPUs).
> > > > 
> > > > I think we should add a security support limit for the number of
> > > > physical
> > > > cpus similar to the memory support limit we already have in place.
> > > > 
> > > > For x86 I'd suggest 4096 cpus for security support (basically the limit
> > > > we
> > > > have with this patch), but I'm open for other suggestions, too.
> > > > 
> > > > I have no idea about any sensible limits for Arm32/Arm64.
> > > 
> > > I am not entirely. Bertrand, Michal, Stefano, should we use 192 (the
> > > number of
> > > CPUs from Ampere)?
> > 
> > I am OK with that. If we want to be a bit more future proof we could say
> > 256 or 512.
> 
> Sorry, I don't follow your argument. A limit can be raised at time point in
> the future. The question is more whether we are confident that Xen on Arm will
> run well if a user has a platform with 256/512 pCPUs.
> 
> So are you saying that from Xen point of view, you are expecting no difference
> between 256 and 512. And therefore you would be happy if to backport patches
> if someone find differences (or even security issues) when using > 256 pCPUs?

It is difficult to be sure about anything that it is not regularly
tested. I am pretty sure someone in the community got Xen running on an
Ampere, so like you said 192 is a good number. However, that is not
regularly tested, so we don't have any regression checks in gitlab-ci or
OSSTest for it.

One approach would be to only support things regularly tested either by
OSSTest, Gitlab-ci, or also Xen community members. I am not sure what
would be the highest number with this way of thinking but likely no
more than 192, probably less. I don't know the CPU core count of the
biggest ARM machine in OSSTest.

Another approach is to support a "sensible" number: not something tested
but something we believe it should work. No regular testing. (In safety,
they only believe in things that are actually tested, so this would not
be OK. But this is security, not safety, just FYI.) With this approach,
we could round up the number to a limit we think it won't break. If 192
works, 256/512 should work? I don't know but couldn't think of something
that would break going from 192 to 256.

It depends on how strict we want to be on testing requirements. I am not
sure what approach was taken by x86 so far. I am OK either way.
--8323329-1617437709-1714763254=:1151289--

