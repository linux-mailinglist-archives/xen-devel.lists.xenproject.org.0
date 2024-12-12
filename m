Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F2A9EDDA7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 03:28:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855482.1268381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLYva-00006N-AT; Thu, 12 Dec 2024 02:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855482.1268381; Thu, 12 Dec 2024 02:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLYva-0008WI-7N; Thu, 12 Dec 2024 02:27:46 +0000
Received: by outflank-mailman (input) for mailman id 855482;
 Thu, 12 Dec 2024 02:27:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XAJU=TF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tLYvY-0008WC-GT
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 02:27:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9adfab4-b830-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 03:27:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7A5F85C6874;
 Thu, 12 Dec 2024 02:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DFCC4CED2;
 Thu, 12 Dec 2024 02:27:39 +0000 (UTC)
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
X-Inumbo-ID: a9adfab4-b830-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733970460;
	bh=Sn2MqdtLFyzeJw8pL4qtS/NeuKLuVvVft1TCzYNDnmA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ch6rebkayVJ8g7jfy0N/IWIY/GPHk9QlCzr/yYcmKs0joiKiyrXxWBsFDHUQTqKda
	 3mrUE+MLKt9B28okK5Vw4LO2ia6FQYhxOLhQjgcQUr4XhkgVqPQvdpQCtFh62GYQve
	 rSQexM0CU/4xKXJ4u8bjpXI6u3VDxO5UV7EbPquGH1KDH1XT9UMnMwgc037Ngr9BF5
	 yiXmG9kKfxb8EmfvFyfmnYaEJMNza5nuCinOyicn7S/ysyEvWRHjYx9YuY19ywKr3i
	 e3Q0Jl3o8HuWIuacHo+9EjVOoybHaW2n2yX+zcSyh/NVW1E+UGfSH47toCa2of4c3h
	 sIcpH1SuAFC1Q==
Date: Wed, 11 Dec 2024 18:27:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: address violation of MISRA C Rule 11.1
In-Reply-To: <bded3d90-0644-46c2-a43e-d6b06faa5650@suse.com>
Message-ID: <alpine.DEB.2.22.394.2412111826440.463523@ubuntu-linux-20-04-desktop>
References: <7debd63f3900bad62bcbcc03081e4c04e6099135.1733914487.git.alessandro.zucchelli@bugseng.com> <bded3d90-0644-46c2-a43e-d6b06faa5650@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Dec 2024, Jan Beulich wrote:
> On 11.12.2024 12:02, Alessandro Zucchelli wrote:
> > Rule 11.1 states as following: "Conversions shall not be performed
> > between a pointer to a function and any other type".
> > 
> > Functions "__machine_restart" and "__machine_halt" in "x86/shutdown.c"
> > and "halt_this_cpu" in "arm/shutdown.c" are defined as noreturn
> > functions and subsequently passed as parameters to function calls.
> > This violates the rule in Clang, where the "noreturn" attribute is
> > considered part of the function"s type.
> 
> I'm unaware of build issues with Clang, hence can you clarify how Clang's
> view comes into play here? In principle various attributes ought to be
> part of a function's type; iirc that's also the case for gcc. Yet how
> that matters to Eclair is still entirely unclear to me.
> 
> > By removing the "noreturn"
> > attribbute and replacing it with uses of the ASSERT_UNREACHABLE macro,
> > these violations are addressed.
> 
> Papered over, I'd say. What about release builds, for example?
> 
> Deleting the attribute also has a clear downside documentation-wise. If
> we really mean to remove them from what the compiler gets to see, I think
> we ought to still retain them in commented-out shape.

Another option would be to #define noreturn to nothing for ECLAIR builds ?

