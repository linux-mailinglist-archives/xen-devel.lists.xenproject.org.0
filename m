Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8C3799054
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 21:39:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598168.932737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qehIe-0005hR-73; Fri, 08 Sep 2023 19:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598168.932737; Fri, 08 Sep 2023 19:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qehIe-0005ek-4T; Fri, 08 Sep 2023 19:37:52 +0000
Received: by outflank-mailman (input) for mailman id 598168;
 Fri, 08 Sep 2023 19:37:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmm/=EY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qehId-0005ee-Be
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 19:37:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3102b96f-4e7f-11ee-8783-cb3800f73035;
 Fri, 08 Sep 2023 21:37:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC5046155E;
 Fri,  8 Sep 2023 19:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD3FC433CC;
 Fri,  8 Sep 2023 19:37:45 +0000 (UTC)
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
X-Inumbo-ID: 3102b96f-4e7f-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694201867;
	bh=hwU94QLWm3VT/oIzW4/JAXvt0rAsPWiXDSXnC297hP8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kd85WwKj74AN1ltrACmK6ja+j1iWqWxmn79ZItOyhZs8HwfCjDALhC/HGeW9XXknR
	 TTevSynyIRid+v80Sx3yVwJKS3O23vBGS71Urv2HzqFRHjiIqwk1LERFZkT6KHicmL
	 LnFHYCumXs1Mrz7MFAM85NKQZeDuDkxnWLuF2fk8Tllv0ES9JcfLdzJQili9BTPrcX
	 vZyYU3tMVk9zsLf+64YZvk2Cpsjc6PyExr7QoqohsNRdApjDgshq5kGdQX69L0aVPi
	 Xt/tOaE+ja6UHlTGNhQljaHdTQvFxrDYN6hFQr2shO8bNlGUCPm/rPXeIjekIeJ8uE
	 Earh/bcaMF08g==
Date: Fri, 8 Sep 2023 12:37:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] xen/types: address Rule 10.1 for macro
 BITS_TO_LONGS
In-Reply-To: <3d44b3b0b185418482ab60a693d930a9@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309081236360.6458@ubuntu-linux-20-04-desktop>
References: <b3aaaf5265c7e7ce6228ba2146f57aaae09f55e6.1693899008.git.nicola.vetrini@bugseng.com> <540ae128-a934-8c4c-6fec-e475dd072c3e@suse.com> <aa2084eb925ade9caa4e1dfbfb425537@bugseng.com> <9b673dec-f391-9948-3ce9-25ddff8c9d7b@suse.com>
 <948c3c6c0b9dff859df58eab419d01f6@bugseng.com> <7937ae31-e511-8e41-9cbb-98d8666e66b8@suse.com> <alpine.DEB.2.22.394.2309061828360.6458@ubuntu-linux-20-04-desktop> <6818e3ac47edca6ba107b8eeff95955a@bugseng.com> <a52733a0-ec5a-3b49-ccec-7a7e8e775c4c@suse.com>
 <7d07fc38-14e8-6cc7-2b0c-816bc68c7317@suse.com> <3d44b3b0b185418482ab60a693d930a9@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Sep 2023, Nicola Vetrini wrote:
> On 08/09/2023 13:59, Jan Beulich wrote:
> > On 08.09.2023 13:57, Jan Beulich wrote:
> > > On 08.09.2023 10:48, Nicola Vetrini wrote:
> > > > There is a build error due to -Werror because of a pointer comparison at
> > > > line 469 of common/numa.c:
> > > > i = min(PADDR_BITS, BITS_PER_LONG - 1);
> > > > where
> > > > #define PADDR_BITS              52
> > > > 
> > > > I guess PADDR_BITS can become unsigned or gain a cast
> > > 
> > > While generally converting constants to unsigned comes with a certain
> > > risk, I think for this (and its siblings) this ought to be okay. As to
> > > the alternative of a cast - before considering that, please consider
> > > e.g. adding 0u (as we do elsewhere in the code base to deal with such
> > > cases).
> > 
> > And just after sending I realized that this would still be disliked by
> > Misra's type system. (Much like then aiui the 1 above will need to
> > become 1u. Which is all pretty horrible.)
> > 
> > Jan
> 
> I have a proposal: in our tests we enabled an ECLAIR configuration that allows
> to bypass the
> constraint imposed by Rule 10.4 that warrants the 1U iff the value is constant
> and both types
> can represent it correctly (in this case BITS_PER_LONG -1). This would allow
> using the proposed
> solution and documenting why it's ok not to respect R10.4. What do you think?

I think that would be OK. I think we would want to document this in
rules.rst. Please send a patch.

