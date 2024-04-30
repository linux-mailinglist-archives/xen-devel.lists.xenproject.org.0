Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FC68B765D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 14:55:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714851.1116200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1n0h-0001no-DK; Tue, 30 Apr 2024 12:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714851.1116200; Tue, 30 Apr 2024 12:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1n0h-0001lW-9E; Tue, 30 Apr 2024 12:55:03 +0000
Received: by outflank-mailman (input) for mailman id 714851;
 Tue, 30 Apr 2024 12:55:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BF+G=MD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s1n0g-0001JK-0l
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 12:55:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db0e36ce-06f0-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 14:55:01 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 8F7B04EE0738;
 Tue, 30 Apr 2024 14:55:00 +0200 (CEST)
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
X-Inumbo-ID: db0e36ce-06f0-11ef-909b-e314d9c70b13
MIME-Version: 1.0
Date: Tue, 30 Apr 2024 14:55:00 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: Fix MISRA regression on R1.1, flexible array
 member not at the end
In-Reply-To: <20240430110922.15052-3-luca.fancellu@arm.com>
References: <20240430110922.15052-1-luca.fancellu@arm.com>
 <20240430110922.15052-3-luca.fancellu@arm.com>
Message-ID: <fab66060c4aeec0d3ee9d3f24054a12b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-30 13:09, Luca Fancellu wrote:
> Commit 2209c1e35b47 ("xen/arm: Introduce a generic way to access memory
> bank structures") introduced a MISRA regression for Rule 1.1 because a
> flexible array member is introduced in the middle of a struct, 
> furthermore
> this is using a GCC extension that is going to be deprecated in GCC 14 
> and
> a warning to identify such cases will be present
> (-Wflex-array-member-not-at-end) to identify such cases.
> 
> In order to fix this issue, use the macro __struct_group to create a
> structure 'struct membanks_hdr' which will hold the common data among
> structures using the 'struct membanks' interface.
> 
> Modify the 'struct shared_meminfo' and 'struct meminfo' to use this new
> structure, effectively removing the flexible array member from the 
> middle
> of the structure and modify the code accessing the .common field to use
> the macro container_of to maintain the functionality of the interface.
> 
> Given this change, container_of needs to be supplied with a type and so
> the macro 'kernel_info_get_mem' inside arm/include/asm/kernel.h can't 
> be
> an option since it uses const and non-const types for struct membanks, 
> so
> introduce two static inline, one of which will keep the const 
> qualifier.
> 
> Given the complexity of the interface, which carries a lot of benefit 
> but
> on the other hand could be prone to developer confusion if the access 
> is
> open-coded, introduce two static inline helper for the
> 'struct kernel_info' .shm_mem member and get rid the open-coding
> shm_mem.common access.
> 
> Fixes: 2209c1e35b47 ("xen/arm: Introduce a generic way to access memory 
> bank structures")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/acpi/domain_build.c        |  2 +-
>  xen/arch/arm/domain_build.c             |  6 +++---
>  xen/arch/arm/include/asm/kernel.h       | 11 ++++++++++-
>  xen/arch/arm/include/asm/setup.h        | 18 ++++++++++--------
>  xen/arch/arm/include/asm/static-shmem.h | 12 ++++++++++++
>  xen/arch/arm/static-shmem.c             | 19 +++++++++----------
>  6 files changed, 45 insertions(+), 23 deletions(-)
> 

 From a MISRA perspective the regression on R1.1 is resolved (see [1]).

[1] https://gitlab.com/xen-project/patchew/xen/-/jobs/6748211368

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

