Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB828089F9
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 15:14:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649907.1015008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBF92-0002rJ-74; Thu, 07 Dec 2023 14:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649907.1015008; Thu, 07 Dec 2023 14:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBF92-0002p8-3M; Thu, 07 Dec 2023 14:14:28 +0000
Received: by outflank-mailman (input) for mailman id 649907;
 Thu, 07 Dec 2023 14:14:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fZpn=HS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rBF91-0002p0-7S
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 14:14:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ece2f238-950a-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 15:14:25 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id CE5FD4EE073A;
 Thu,  7 Dec 2023 15:14:24 +0100 (CET)
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
X-Inumbo-ID: ece2f238-950a-11ee-9b0f-b553b5be7939
MIME-Version: 1.0
Date: Thu, 07 Dec 2023 15:14:24 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 3/3] xen/mm: add declaration for first_valid_mfn
In-Reply-To: <f57fad10-f5c9-4a28-8c46-bc398bdc2dd3@xen.org>
References: <cover.1701947290.git.nicola.vetrini@bugseng.com>
 <2c02524be7d02064fdf2f5003ef1c507034e4437.1701947290.git.nicola.vetrini@bugseng.com>
 <f57fad10-f5c9-4a28-8c46-bc398bdc2dd3@xen.org>
Message-ID: <e603f22d6f6db36000d126453eb300f3@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-07 14:52, Julien Grall wrote:
> Hi,
> 
> On 07/12/2023 11:11, Nicola Vetrini wrote:
>> Such declaration is needed to comply with MISRA C Rule 8.4, because a
>> compatible declaration is not visible in xen/common/page_alloc.c, 
>> where the
>> variable is defined. That variable can't yet be static because of the 
>> lack of
>> support from ARM and PPC for NUMA.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Having this declaration essentially sidesteps the current 
>> impossibility
>> of having a static variable, as described in the comments in
>> ARM and PCC's asm/numa.h.
> With this change, is there any reason to keep the various declaration 
> of first_valid_mfn in numa.h?
> 
> Cheers,

Good point: no reason comes to mind. I didn't think of it while revising 
the patch.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

