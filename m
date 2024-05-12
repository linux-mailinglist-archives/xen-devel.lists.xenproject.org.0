Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EBB8C36C1
	for <lists+xen-devel@lfdr.de>; Sun, 12 May 2024 15:53:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720573.1123534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s69c8-0002j9-U1; Sun, 12 May 2024 13:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720573.1123534; Sun, 12 May 2024 13:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s69c8-0002ha-R9; Sun, 12 May 2024 13:51:44 +0000
Received: by outflank-mailman (input) for mailman id 720573;
 Sun, 12 May 2024 13:51:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=or6S=MP=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1s69c8-0002hU-5X
 for xen-devel@lists.xenproject.org; Sun, 12 May 2024 13:51:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2e84fd6-1066-11ef-909d-e314d9c70b13;
 Sun, 12 May 2024 15:51:43 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 1CADD4EE073E;
 Sun, 12 May 2024 15:51:41 +0200 (CEST)
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
X-Inumbo-ID: c2e84fd6-1066-11ef-909d-e314d9c70b13
MIME-Version: 1.0
Date: Sun, 12 May 2024 15:51:41 +0200
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu
 <ppircalabu@bitdefender.com>
Subject: Re: [XEN PATCH v3] arm/mem_access: add conditional build of
 mem_access.c
Reply-To: alessandro.zucchelli@bugseng.com
Mail-Reply-To: alessandro.zucchelli@bugseng.com
In-Reply-To: <d659e73f-762a-48c9-8936-94bbc771218c@xen.org>
References: <b3f03c4f5a78b86b01750f10bb0cebcdb2fd35cc.1715265720.git.alessandro.zucchelli@bugseng.com>
 <d659e73f-762a-48c9-8936-94bbc771218c@xen.org>
Message-ID: <0857b27d0e832a281e0bddb87d51d16a@bugseng.com>
X-Sender: alessandro.zucchelli@bugseng.com
Organization: BUGSENG Srl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-05-10 22:59, Julien Grall wrote:
> Hi,
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

Hi,
Thanks for the feedback,
> 
> I am afraid, I don't understand this one as you don't seem to modify 
> xen/mem_access.h. Is this meant to be part of the changelog?
> 
you are right, this should be part of the changelog as it referes to the 
revert of a previous patch's changes.
I approve of the commit message you provided.

Cheers,

-- 
Alessandro Zucchelli, B.Sc.

Software Engineer, BUGSENG (https://bugseng.com)

