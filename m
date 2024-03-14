Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E7587C4E5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 22:54:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693502.1081646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkt23-0004a9-67; Thu, 14 Mar 2024 21:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693502.1081646; Thu, 14 Mar 2024 21:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkt23-0004XV-2m; Thu, 14 Mar 2024 21:54:35 +0000
Received: by outflank-mailman (input) for mailman id 693502;
 Thu, 14 Mar 2024 21:54:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=69K2=KU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rkt22-0004XP-42
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 21:54:34 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f5636a4-e24d-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 22:54:32 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 91931CE1E63;
 Thu, 14 Mar 2024 21:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BC1C433C7;
 Thu, 14 Mar 2024 21:54:25 +0000 (UTC)
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
X-Inumbo-ID: 6f5636a4-e24d-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710453266;
	bh=KYWOMQ6ABttkyI7aGru1cUWLR2Va7H8yGpFLnOxdBSU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KVMDgzVmn8YogsCkB8aKM3tPEHIa2aaa1AdfFcDzab4jAzEZfYaxval2h+rNfb6oA
	 zJ19IDrSpZ8EZVLLwtTXHG4vvK+51Q/0kFgfLlfTwqVJDZT+iwWcn8kVMXLIWq8Izy
	 TCupHTbnpj2sGqJGR0ufd1LZl+pCSlVfnNHgnx/oiI1DcgQn2uXCeDTeD4PBsOTuv7
	 H1hj275WlIR8yZdz9qy4jRDMB/GvjNcT8egGzXL1zhpHNKZXrRAO2E6DeTxS3nwGcT
	 XXxizL0sJNRDljT97jppCcfx0aEEuYU+rRQZNP8QewXvlnE4IMKxy2T20itqG/s/dV
	 MjCbBpJ9RKTSw==
Date: Thu, 14 Mar 2024 14:54:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, bertrand.marquis@arm.com, julien@xen.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] amd/iommu: add fixed size to function parameter of
 array type
In-Reply-To: <a10bf170-da69-45c2-aa7a-97d94995d4db@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403141453140.853156@ubuntu-linux-20-04-desktop>
References: <533a2d4f0c92d7fe92aa200b64434389de546f69.1710343652.git.nicola.vetrini@bugseng.com> <6186b676-660c-4bfa-a825-18ff7f0d7f62@suse.com> <503aa63b5204e9b9eab5a21235df7c6c@bugseng.com> <a10bf170-da69-45c2-aa7a-97d94995d4db@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Mar 2024, Jan Beulich wrote:
> On 14.03.2024 10:25, Nicola Vetrini wrote:
> > On 2024-03-14 09:32, Jan Beulich wrote:
> >> On 14.03.2024 08:42, Nicola Vetrini wrote:
> >>> The 'cmd' parameter of amd_iommu_send_guest_cmd is passed
> >>> to a function that expects arrays of size 4, therefore
> >>> specifying explicitly the size also in amd_iommu_send_guest_cmd
> >>> allows not to accidentally pass a smaller array or assume that
> >>> send_iommu_command handles array sizes >4 correctly.
> >>>
> >>> No functional change.
> >>>
> >>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >>> ---
> >>> All current users pass an array of size 4, hence this patch is 
> >>> addressing
> >>> a potential issue noticed by the analyzer in the context of Rule 17.5
> >>> ("The function argument corresponding to a parameter declared to have 
> >>> an array
> >>> type shall have an appropriate number of elements"), not an actual 
> >>> problem in
> >>> the sources.
> >>
> >> While true, I think we want to consider alternatives. First one being 
> >> to rip
> >> out this dead code (thus addressing other Misra concerns as well). 
> >> Second,
> >> if we meant to keep it, to properly do away with the (ab)use of u32[].
> >>
> > 
> > I'm not understanding what you consider dead code.
> 
> iommu_guest.c:guest_iommu_{init,destroy,set_base,add_event_log}() have
> no callers; guest_iommu_add_ppr_log() having one is suspicious, but the
> function will still bail early due to domain_iommu() never returning
> non-NULL in practice. With that I'm pretty sure nothing else in the file
> is actually reachable.

I also prefer removing the code that is not used


> > I see three users of amd_iommu_send_guest_cmd
> 
> All in said file.
> 
> > and seven for send_iommu_command.
> 
> Well, this one of course isn't dead.
> 
> > I can adjust u32 for sure. There are also other u32/uint32_t 
> > incosistencies in that header.
> 
> Which we're going to take care of over time.
> 
> Jan
> 

