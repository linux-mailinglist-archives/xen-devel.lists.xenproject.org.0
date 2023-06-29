Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8307742CF4
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 21:12:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557021.869993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEx35-00023B-2h; Thu, 29 Jun 2023 19:11:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557021.869993; Thu, 29 Jun 2023 19:11:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEx34-00020t-W4; Thu, 29 Jun 2023 19:11:22 +0000
Received: by outflank-mailman (input) for mailman id 557021;
 Thu, 29 Jun 2023 19:11:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWGL=CR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qEx33-00020n-Ag
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 19:11:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b87f08ff-16b0-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 21:11:19 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D49476159D;
 Thu, 29 Jun 2023 19:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B61FC433C0;
 Thu, 29 Jun 2023 19:11:13 +0000 (UTC)
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
X-Inumbo-ID: b87f08ff-16b0-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688065875;
	bh=BPLBbT088jb5drwGw4dM/CX78qFH2AmCELMWN6iP06A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=f9+myklHnJKy0+4KYkd11J7uw7dhI+qod3x+Lzh7XOmzS5iwAGneJzKnPbvsiMTED
	 oT2rSF9AFSSwKdw5JEUNQ5tId26VQuedzE4RL7x6ozT/M8YCFhM76YJtefUO6cz0Xy
	 H+/PvPiqfYDSodeNo/ZxEGn1Wa2R4aOJd0nrPGLRvdc0UEcDa9GHz8bjaoXMI3l5sn
	 ix6b0u4Gq7Lvco+ncSO8+/FKxR+VOvKrP/mNhAatWQRu3yO6xx4BmZvB8uzepGUYq3
	 tm1hpd7SeXGYEv2Zix6KIHDXmUzeZvuv9+csLQVm24Lv06ue6SzxkYmvSHIRyqWCX9
	 Yz6fjfwU55fYw==
Date: Thu, 29 Jun 2023 12:11:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "michal.orzel@amd.com" <michal.orzel@amd.com>, 
    "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>, 
    "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>, 
    "consulting@bugseng.com" <consulting@bugseng.com>, 
    "jbeulich@suse.com" <jbeulich@suse.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "julien@xen.org" <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v3 1/3] xen/arch/arm: fix violations of MISRA C:2012
 Rule 3.1
In-Reply-To: <5FD86C4C-3BD6-4ED3-A910-683DCC86613D@arm.com>
Message-ID: <alpine.DEB.2.22.394.2306291211060.3936094@ubuntu-linux-20-04-desktop>
References: <cover.1688032865.git.nicola.vetrini@bugseng.com> <7996a8bb62e62076d48bdf289e37352bb5e43b52.1688032865.git.nicola.vetrini@bugseng.com> <5FD86C4C-3BD6-4ED3-A910-683DCC86613D@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1949525725-1688065875=:3936094"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1949525725-1688065875=:3936094
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 29 Jun 2023, Luca Fancellu wrote:
> > On 29 Jun 2023, at 11:06, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
> > 
> > In the files `xen/arch/arm/include/asm/arm(32|64)/flushtlb.h' there are a
> > few occurrences of nested '//' character sequences inside C-style comment
> > blocks, which violate Rule 3.1. The patch aims to resolve those by changing
> > the inner comments to arm asm comments, delimited by ';' instead.
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Can I suggest another commit title:
> “xen/arm: tlbflush: fix violations of MISRA C:2012 Rule 3.1"
> 
> Sometimes when I am not sure on how to deal with prefixes, I check to the git
> history of the line I am changing, for these lines there was a commit from
> Julien using these prefixes. I’m using vs code with GitLens extension, that
> ease a lot this kind of checks.
> 
> Apart from that, the changes looks good to me:
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

With Luca's suggestion (can be done on commit):

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1949525725-1688065875=:3936094--

