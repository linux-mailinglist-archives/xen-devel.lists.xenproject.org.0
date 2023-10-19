Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 539AD7CFF86
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 18:27:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619529.964753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVr9-0008H2-WE; Thu, 19 Oct 2023 16:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619529.964753; Thu, 19 Oct 2023 16:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVr9-0008Eg-Sh; Thu, 19 Oct 2023 16:26:43 +0000
Received: by outflank-mailman (input) for mailman id 619529;
 Thu, 19 Oct 2023 16:26:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZCy=GB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtVr8-0008DC-35
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 16:26:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4815393f-6e9c-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 18:26:40 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3226261558;
 Thu, 19 Oct 2023 16:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25972C433C8;
 Thu, 19 Oct 2023 16:26:37 +0000 (UTC)
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
X-Inumbo-ID: 4815393f-6e9c-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697732798;
	bh=nyApptNkWd+CPREbFSCN0nP5KYXfmJxqXafHn0SVEU0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZUfU+Piq68rAua6BGR4XULI9LSx+cw1XAPupDW/SR+8njOFsg1qjR03E7R4T5kzk2
	 xbJqfspWnDLlm2n3mR4fzPfYTehLA2JxrWjcB6Ym8/W+YWik/oarkUDUsR54xG+Ktp
	 PL/w8Nr3UHw8kBkgSfT06MPsodA1R9tIq5i7dU7J5IhYnZzTjc2b9Jd8uehE7tHjKu
	 AVcwxuiByJgJWIGJ5H9INrjrayBMHIg84vSA2XQHCSBWmUOTAltb9YVGecPcpuQI+Q
	 u4X/ZLtMxD5t77rLOxbgLQQiPFxIdeqEt4DqkeVzb4aH5ozTq/YJPk22EV7GTO9798
	 0A1qdSbvAxJmg==
Date: Thu, 19 Oct 2023 09:26:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Federico Serafini <federico.serafini@bugseng.com>, consulting@bugseng.com, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Henry Wang <henry.wang@arm.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3] xen/mm: address violations of MISRA C:2012 Rules
 8.2 and 8.3
In-Reply-To: <30e35f13-d2d0-eaf3-9660-c508655b84ce@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310190921020.1945130@ubuntu-linux-20-04-desktop>
References: <eedcfeb8d1c81527b7e18fcc0eca252577f00035.1696344012.git.federico.serafini@bugseng.com> <d7cd7a02-b960-384e-4af2-f70b425e5ad1@suse.com> <alpine.DEB.2.22.394.2310181543030.965337@ubuntu-linux-20-04-desktop>
 <30e35f13-d2d0-eaf3-9660-c508655b84ce@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Oct 2023, Jan Beulich wrote:
> On 19.10.2023 00:43, Stefano Stabellini wrote:
> > On Mon, 16 Oct 2023, Jan Beulich wrote:
> >> On 03.10.2023 17:24, Federico Serafini wrote:
> >>> --- a/xen/arch/x86/mm.c
> >>> +++ b/xen/arch/x86/mm.c
> >>> @@ -5901,17 +5901,17 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
> >>>   * a problem.
> >>>   */
> >>>  void init_or_livepatch modify_xen_mappings_lite(
> >>> -    unsigned long s, unsigned long e, unsigned int _nf)
> >>> +    unsigned long s, unsigned long e, unsigned int nf)
> >>>  {
> >>> -    unsigned long v = s, fm, nf;
> >>> +    unsigned long v = s, fm, flags;
> >>
> >> While it looks correct, I consider this an unacceptably dangerous
> >> change: What if by the time this is to be committed some new use of
> >> the local "nf" appears, without resulting in fuzz while applying the
> >> patch? Imo this needs doing in two steps: First nf -> flags, then
> >> _nf -> nf.
> > 
> > Wouldn't it be sufficient for the committer to pay special attention
> > when committing this patch? We are in code freeze anyway, the rate of
> > changes affecting staging is low.
> 
> Any kind of risk excludes a patch from being a 4.18 candidate, imo.

I agree on that. I think it is best to commit it for 4.19 when the tree
opens.


> That was the case in early RCs already, and is even more so now. Paying
> special attention is generally a possibility, yet may I remind you that
> committing in general is intended to be a purely mechanical operation?

Sure, and I am not asking for a general process change. I am only
suggesting that this specific concern on this patch is best solved in
the simplest way: by a committer making sure the patch is correct on
commit. It is meant to save time for everyone.

Jan, if you are OK with it, we could just trust you to commit it the
right away as the earliest opportunity.

