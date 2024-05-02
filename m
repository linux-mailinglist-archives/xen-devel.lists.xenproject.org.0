Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA938BA01C
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 20:13:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716118.1118203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2avo-0007tv-T1; Thu, 02 May 2024 18:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716118.1118203; Thu, 02 May 2024 18:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2avo-0007ri-QJ; Thu, 02 May 2024 18:13:20 +0000
Received: by outflank-mailman (input) for mailman id 716118;
 Thu, 02 May 2024 18:13:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Qsp=MF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2avn-0007ra-AY
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 18:13:19 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a50c34f3-08af-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 20:13:17 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 541C7CE16DB;
 Thu,  2 May 2024 18:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 039A8C113CC;
 Thu,  2 May 2024 18:13:10 +0000 (UTC)
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
X-Inumbo-ID: a50c34f3-08af-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714673593;
	bh=fiyeFheWqFGsN3qj2iTlgwJMs98wz0J8HkiJWqRbeWA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GPPSIyx810EdZRJytMCosF0vzRwA+P7eUuYaqjLuW/fJ85AJjD2lFb1trzoyW5osb
	 8Z+qhMC8wxTkqwn6HrZOmAfaZZ+5oobyfbXwEF4LcWZeOvU5/c2UuVn4PoU2BtyXp9
	 WcL8untZ2UUzmhXgDwXqHHrW2VXwCBhcau2oNTOUxmZbMzqEkVxi8OTuKMg1J8Y7aG
	 hX2jGeSWSij2QJMcOHwl5r08/ffvWKNVszcelwN7W2JFC4smgjr9Ulz6nCydBsKzWi
	 AeT2C+LIwYpf92gO8lmBofNhkIQeD0IhPZu9MiNQ16Cgr+SKutEOOktTp26VN4gOCP
	 d68sH/fh3m1rg==
Date: Thu, 2 May 2024 11:13:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 8/8] xen: allow up to 16383 cpus
In-Reply-To: <146fbd43-d8b8-4d73-8650-c60024498324@xen.org>
Message-ID: <alpine.DEB.2.22.394.2405021111540.624854@ubuntu-linux-20-04-desktop>
References: <20240327152229.25847-1-jgross@suse.com> <20240327152229.25847-9-jgross@suse.com> <da1662ac-70f1-4ae4-9737-e10e617c8036@suse.com> <637c755a-9f24-4b86-af12-7c7d50bf40c8@suse.com> <d0714064-c544-47d3-84c0-a19391ccf496@xen.org>
 <29296e11-8d21-4867-9d31-fc94af828214@suse.com> <146fbd43-d8b8-4d73-8650-c60024498324@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2084856487-1714673594=:624854"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2084856487-1714673594=:624854
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 29 Apr 2024, Julien Grall wrote:
> Hi Juergen,
> 
> On 29/04/2024 12:28, Jürgen Groß wrote:
> > On 29.04.24 13:04, Julien Grall wrote:
> > > Hi Juergen,
> > > 
> > > Sorry for the late reply.
> > > 
> > > On 29/04/2024 11:33, Juergen Gross wrote:
> > > > On 08.04.24 09:10, Jan Beulich wrote:
> > > > > On 27.03.2024 16:22, Juergen Gross wrote:
> > > > > > With lock handling now allowing up to 16384 cpus (spinlocks can
> > > > > > handle
> > > > > > 65535 cpus, rwlocks can handle 16384 cpus), raise the allowed limit
> > > > > > for
> > > > > > the number of cpus to be configured to 16383.
> > > > > > 
> > > > > > The new limit is imposed by IOMMU_CMD_BUFFER_MAX_ENTRIES and
> > > > > > QINVAL_MAX_ENTRY_NR required to be larger than 2 * CONFIG_NR_CPUS.
> > > > > > 
> > > > > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > > > 
> > > > > Acked-by: Jan Beulich <jbeulich@suse.com>
> > > > > 
> > > > > I'd prefer this to also gain an Arm ack, though.
> > > > 
> > > > Any comment from Arm side?
> > > 
> > > Can you clarify what the new limits mean in term of (security) support?
> > > Are we now claiming that Xen will work perfectly fine on platforms with up
> > > to 16383?
> > > 
> > > If so, I can't comment for x86, but for Arm, I am doubtful that it would
> > > work without any (at least performance) issues. AFAIK, this is also an
> > > untested configuration. In fact I would be surprised if Xen on Arm was
> > > tested with more than a couple of hundreds cores (AFAICT the Ampere CPUs
> > > has 192 CPUs).
> > 
> > I think we should add a security support limit for the number of physical
> > cpus similar to the memory support limit we already have in place.
> > 
> > For x86 I'd suggest 4096 cpus for security support (basically the limit we
> > have with this patch), but I'm open for other suggestions, too.
> > 
> > I have no idea about any sensible limits for Arm32/Arm64.
> 
> I am not entirely. Bertrand, Michal, Stefano, should we use 192 (the number of
> CPUs from Ampere)?

I am OK with that. If we want to be a bit more future proof we could say
256 or 512. I leave this to you, as all the boards I have have a much
smaller CPU count.
--8323329-2084856487-1714673594=:624854--

