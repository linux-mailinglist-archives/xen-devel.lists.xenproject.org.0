Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B5A81A6CF
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 19:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658218.1027301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG1Er-0002l7-7i; Wed, 20 Dec 2023 18:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658218.1027301; Wed, 20 Dec 2023 18:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG1Er-0002i5-4Z; Wed, 20 Dec 2023 18:24:13 +0000
Received: by outflank-mailman (input) for mailman id 658218;
 Wed, 20 Dec 2023 18:24:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wrkk=H7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rG1Ep-0002hx-J4
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 18:24:11 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5eb2e84-9f64-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 19:24:07 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E6794B81A3E;
 Wed, 20 Dec 2023 18:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D455C433C7;
 Wed, 20 Dec 2023 18:24:03 +0000 (UTC)
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
X-Inumbo-ID: f5eb2e84-9f64-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703096645;
	bh=l7riXBcImvGLyPZ96P7SlqWIalY5Olr42ZYWcbnmOtM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fF3BD3jiHZxYi9sxkItCCjc9JPbNwfBIXcecC7QJ+1Rxq5nTnibIqcT47IUxvKex7
	 mqS1gtm5t6jetcyMxraf3OxfY7inQ7M/EZZ1CkFxNInYCLRkxUBEIy10vw0YfySaE3
	 HO2Q+hcQTmKiZ1YuU3kn2EwAEg8JO/AYL2Z7G+myLZzB7/agLoYgCzqPZF2+9jUsPi
	 62cVanIZfewdyAX/LVMGgVXggeRmGgcsAhVgng1BZVVF5ZlNqd0fv6tdSiCyVkuzuT
	 pfy94NqRynj2HFM0jBnYNS+YWC+ztkM1R/uq04dFa9wniLtRkJ6jk0aa68GRwHdXd4
	 8S7wTk/sgLLTQ==
Date: Wed, 20 Dec 2023 10:23:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [XEN PATCH v2] xen: move declaration of first_valid_mfn to
 xen/numa.h
In-Reply-To: <83a14a83-e186-4c91-936b-58743f1e136d@suse.com>
Message-ID: <alpine.DEB.2.22.394.2312201023540.685950@ubuntu-linux-20-04-desktop>
References: <ad7ee70bd00c0de4b6dad48c91281929e98ef95c.1702911455.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2312181748430.3175268@ubuntu-linux-20-04-desktop> <83a14a83-e186-4c91-936b-58743f1e136d@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Dec 2023, Jan Beulich wrote:
> On 19.12.2023 02:48, Stefano Stabellini wrote:
> > On Mon, 18 Dec 2023, Nicola Vetrini wrote:
> >> Such declaration is moved in order to provide it for Arm and PPC,
> >> whilst not violating MISRA C:2012 Rule 8.4 in common/page_alloc.c:
> >> "A compatible declaration shall be visible when an object or
> >> function with external linkage is defined".
> >>
> >> Signed-off-by: Julien Grall <julien@xen.org>
> >> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > 
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> I was about to submit my replacement, just to find that this was committed
> during my night. I have to admit that I absolutely do not understand the
> need for rushing here; I thought I said quite clearly that I will come
> forward with a patch dealing with two issues in one go. Now I need to go
> and re-base my change, because all of what this patch touches is also
> touched by my change, as the 2nd issue (the pointless presence of
> asm/numa.h and the need for RISC-V to introduce a 3rd instance if nothing
> is done up front) is still there.


Hi Jan,

Sorry about that. As you might have noticed I typically wait at least
1-2 days but this time I wasn't sure I would be able to come back online
before the Holidays and I was trying to clean things up. I apologize.

