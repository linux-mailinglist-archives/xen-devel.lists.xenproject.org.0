Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA56E9F014C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 01:55:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856387.1269018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLtwK-0001uz-3X; Fri, 13 Dec 2024 00:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856387.1269018; Fri, 13 Dec 2024 00:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLtwK-0001tW-0s; Fri, 13 Dec 2024 00:53:56 +0000
Received: by outflank-mailman (input) for mailman id 856387;
 Fri, 13 Dec 2024 00:53:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQ2+=TG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tLtwI-0001tQ-5x
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 00:53:54 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b838b41c-b8ec-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 01:53:52 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CA471A407E7;
 Fri, 13 Dec 2024 00:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B64C4CECE;
 Fri, 13 Dec 2024 00:53:49 +0000 (UTC)
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
X-Inumbo-ID: b838b41c-b8ec-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734051230;
	bh=NyuJI6XNqmKZXrETVVV29wBB2MR8InJJ+U3680Zl94k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=otasr8A1QoZKSZp4BcqBL704QnCoDzrHWoaEEMh/DK0YQU56D16/3qXPgsda4Fuhv
	 3oqnjViJrygUoLxqbLZwYplzqqS2gKjHvbamd4X3u58/O8tTX2WJSrZ83N9JCNPMpm
	 Av1z4PYd2JlnKV4ICsKT+hmte2TZ4KgMkxNaMcLtb1LOGhk6bzbpvPDdGVeMrLT+CK
	 WU8VO0P4R4FnyAEm5mLxNVS3P/GwVuMIS/QyTvQagdnjA7lAWkxgjFy28N9M3puizC
	 kwFvTqM+9FB1hunWijbK+Dleb1gL69kS/cbBGkkqF3Acdbm5ne0QQdK5okjtULa58t
	 BaabOnfBSonsw==
Date: Thu, 12 Dec 2024 16:53:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: address violation of MISRA C Rule 11.1
In-Reply-To: <26600bb0-93af-45b5-a341-5771bad844a1@suse.com>
Message-ID: <alpine.DEB.2.22.394.2412121647450.463523@ubuntu-linux-20-04-desktop>
References: <7debd63f3900bad62bcbcc03081e4c04e6099135.1733914487.git.alessandro.zucchelli@bugseng.com> <bded3d90-0644-46c2-a43e-d6b06faa5650@suse.com> <alpine.DEB.2.22.394.2412111826440.463523@ubuntu-linux-20-04-desktop>
 <26600bb0-93af-45b5-a341-5771bad844a1@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Dec 2024, Jan Beulich wrote:
> On 12.12.2024 03:27, Stefano Stabellini wrote:
> > On Wed, 11 Dec 2024, Jan Beulich wrote:
> >> On 11.12.2024 12:02, Alessandro Zucchelli wrote:
> >>> Rule 11.1 states as following: "Conversions shall not be performed
> >>> between a pointer to a function and any other type".
> >>>
> >>> Functions "__machine_restart" and "__machine_halt" in "x86/shutdown.c"
> >>> and "halt_this_cpu" in "arm/shutdown.c" are defined as noreturn
> >>> functions and subsequently passed as parameters to function calls.
> >>> This violates the rule in Clang, where the "noreturn" attribute is
> >>> considered part of the function"s type.
> >>
> >> I'm unaware of build issues with Clang, hence can you clarify how Clang's
> >> view comes into play here? In principle various attributes ought to be
> >> part of a function's type; iirc that's also the case for gcc. Yet how
> >> that matters to Eclair is still entirely unclear to me.
> >>
> >>> By removing the "noreturn"
> >>> attribbute and replacing it with uses of the ASSERT_UNREACHABLE macro,
> >>> these violations are addressed.
> >>
> >> Papered over, I'd say. What about release builds, for example?
> >>
> >> Deleting the attribute also has a clear downside documentation-wise. If
> >> we really mean to remove them from what the compiler gets to see, I think
> >> we ought to still retain them in commented-out shape.
> > 
> > Another option would be to #define noreturn to nothing for ECLAIR builds ?
> 
> That again would feel like papering over things. Plus I don't know if that's
> an option at all.

What is "papering over" and what is a "nice solution" is often up to the
personal opinions.

From my point of view, Alessandro's patch doesn't make the code worse.
The ASSERT_UNREACHABLE solution is OK. I do agree with you that it
should not be required for us to remove "noreturn", but I don't think we
have used it consistently anyway across the Xen codebase.
ASSERT_UNREACHABLE is also a form of documentation that the function
does not return.

In conclusion, I think all three options are acceptable:
1) this patch as is
2) this patch plus /* noreturn */ as a comment
3) #define noreturn to nothing just for ECLAIR builds

I don't mind either way, maybe option 2) is the best compromise.

