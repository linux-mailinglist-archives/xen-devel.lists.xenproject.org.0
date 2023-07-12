Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A487513BE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 00:43:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562870.879617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJiYT-0006p9-Kj; Wed, 12 Jul 2023 22:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562870.879617; Wed, 12 Jul 2023 22:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJiYT-0006nC-GR; Wed, 12 Jul 2023 22:43:29 +0000
Received: by outflank-mailman (input) for mailman id 562870;
 Wed, 12 Jul 2023 22:43:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eU4r=C6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qJiYR-0006n6-R2
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 22:43:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8346d7de-2105-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 00:43:26 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 462A26197C;
 Wed, 12 Jul 2023 22:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7A4C433CA;
 Wed, 12 Jul 2023 22:43:22 +0000 (UTC)
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
X-Inumbo-ID: 8346d7de-2105-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689201804;
	bh=Wp2RkSBZ1d9tlr3YrJGZaC2S9ApRBwd88ZF5B4+vwYo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bVWYkDF7/vDGj540mpbziTMw49IhBUDLfv/hCAzptpSJ+62iuqHy8fR7DrKZBP3pY
	 jbmWtqnMMhD/u23CXpl/k/vkNA6fI0+WYDIin7VhCkBibyxzcZ2bhXCsql4lH9t9G9
	 t1F1809ZuTIJ/puRdoqvIfwyZuxFYsunoea8FiMzR3jfeM3h+Nwn/Qs98/Kk46aUl9
	 mBjVr68XCtxm+yRCzYrCHcByUcF1e+yT+T5A9lM2LCYJGbFL73Fpz1iTcHcM/28pZD
	 +aRPpspBWdldVYJPfPcT/dcywyT366dB7jmh4+Y+Pzq2mP6VoyEeOX2vteVe/YFW+e
	 bqSx1khlMdN4w==
Date: Wed, 12 Jul 2023 15:43:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3 07/15] x86/vmx: fix violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <301fda12-33bb-325f-2ca7-8f177ddf89b2@suse.com>
Message-ID: <alpine.DEB.2.22.394.2307121543080.761183@ubuntu-linux-20-04-desktop>
References: <cover.1689152719.git.gianluca.luparini@bugseng.com> <c4953517b9675b2099841be704f0c67989e76342.1689152719.git.gianluca.luparini@bugseng.com> <301fda12-33bb-325f-2ca7-8f177ddf89b2@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Jul 2023, Jan Beulich wrote:
> On 12.07.2023 12:32, Simone Ballarin wrote:
> > From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> > 
> > The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> > headline states:
> > "A 'u' or 'U' suffix shall be applied to all integer constants
> > that are represented in an unsigned type".
> > 
> > Add the 'U' suffix to integers literals with unsigned type.
> > 
> > For the sake of uniformity, the following changes are made:
> > - add the 'U' suffix to macros near
> >   'CPU_BASED_ACTIVATE_SECONDARY_CONTROLS' and
> >   'SECONDARY_EXEC_NOTIFY_VM_EXITING' macros in 'vmcs.h'
> > - add the 'U' suffix to macros near 'INTR_INFO_VALID_MASK'
> >   macro in 'vmx.h'
> > 
> > Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > ---
> > Changes in v3:
> > - change 'Signed-off-by' ordering
> > - change commit message
> > - remove unnecessary changes in 'vvmx.c'
> > - add 'uint32_t' casts in 'vvmx.c'
> > - add missing 'U' in 'vmcs.h' macros
> > - change macro to '(1u << 31)' in 'vmx.h'
> > - remove unnecessary changes to 'vmx.h'
> 
> With this many changes I don't think you can retain an R-b, unless
> the person it came from really explicitly agreed with at least all
> not purely cosmetic changes (which I don't think was the case here).

I re-reviewed it:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> Irrespective:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Jan
> 

