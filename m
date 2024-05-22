Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBC18CC60E
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 20:06:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727831.1132511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9qL0-0006kM-1s; Wed, 22 May 2024 18:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727831.1132511; Wed, 22 May 2024 18:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9qKz-0006hH-VD; Wed, 22 May 2024 18:05:17 +0000
Received: by outflank-mailman (input) for mailman id 727831;
 Wed, 22 May 2024 18:05:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MVRZ=MZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s9qKy-0006hB-Iy
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 18:05:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6468b06-1865-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 20:05:14 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 484994EE0738;
 Wed, 22 May 2024 20:05:13 +0200 (CEST)
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
X-Inumbo-ID: d6468b06-1865-11ef-90a0-e314d9c70b13
MIME-Version: 1.0
Date: Wed, 22 May 2024 20:05:13 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu
 <ppircalabu@bitdefender.com>
Subject: Re: [XEN PATCH v3] arm/mem_access: add conditional build of
 mem_access.c
In-Reply-To: <d659e73f-762a-48c9-8936-94bbc771218c@xen.org>
References: <b3f03c4f5a78b86b01750f10bb0cebcdb2fd35cc.1715265720.git.alessandro.zucchelli@bugseng.com>
 <d659e73f-762a-48c9-8936-94bbc771218c@xen.org>
Message-ID: <6b7fee28e8f54799fe8ec7fdc6d4001d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-05-10 22:59, Julien Grall wrote:
> Hi,

Hi,

> 
> On 10/05/2024 13:32, Alessandro Zucchelli wrote:
>> In order to comply to MISRA C:2012 Rule 8.4 for ARM the following
>> changes are done:
>> revert preprocessor conditional changes to xen/mem_access.h which
>> had it build unconditionally, add conditional build for 
>> xen/mem_access.c
> 
> I am afraid, I don't understand this one as you don't seem to modify 
> xen/mem_access.h. Is this meant to be part of the changelog?
> 
> You also don't seem to mention the change in Makefile. This is the one 
> I was asking for in the previous version. So what about:
> 
> "xen/arm: mem_access: Conditionally compile mem_access.c
> 
> Commit 634cfc8beb ("Make MEM_ACCESS configurable") intended to make 
> MEM_ACCESS configurable on Arm to reduce the code size when the user 
> doesn't need it.
> 
> However, this didn't cover the arch specific code. None of the code in 
> arm/mem_access.c is necessary when MEM_ACCESS=n, so it can be compiled 
> out. This will require to provide some stub for functions called by the 
> common code.
> 
> This is also fixing violation of the MISRA C:2012 Rule 8.4 reported by 
> ECLAIR.
> "
> 
> The patch itself loks good so once we agree on the commit message, then 
> I am happy to update it on commit.
> 
> Cheers,

since Julien is ok with the patch, with the commit message he proposed, 
I think this needs an R-by or an A-by in order to commit for 4.19.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

