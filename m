Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047E275CDF2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 18:16:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567648.886961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMsn7-00047l-VO; Fri, 21 Jul 2023 16:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567648.886961; Fri, 21 Jul 2023 16:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMsn7-00044U-Rh; Fri, 21 Jul 2023 16:15:41 +0000
Received: by outflank-mailman (input) for mailman id 567648;
 Fri, 21 Jul 2023 16:15:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R0zQ=DH=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qMsn6-00044M-IM
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 16:15:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3f9efae-27e1-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 18:15:37 +0200 (CEST)
Received: from [172.20.10.2] (unknown [37.160.253.240])
 by support.bugseng.com (Postfix) with ESMTPSA id 689014EE0C89;
 Fri, 21 Jul 2023 18:15:36 +0200 (CEST)
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
X-Inumbo-ID: d3f9efae-27e1-11ee-8611-37d641c3527e
Message-ID: <7a051200-a11d-81f9-3efc-ef67a2f494ea@bugseng.com>
Date: Fri, 21 Jul 2023 18:15:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] atomic: change parameter name in atomic_cmpxchg()
 definition
Content-Language: en-US, it
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cace061a0b574d56f9b12a43a7c82276ef56654f.1689953642.git.federico.serafini@bugseng.com>
 <fa0c651f-2e02-e058-a3e5-efdaced81456@xen.org>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <fa0c651f-2e02-e058-a3e5-efdaced81456@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Julien,

On 21/07/23 17:44, Julien Grall wrote:> Title:
> 
> Please add "xen/arm: " to clarify this is a patch touching the Arm code.

Ok.

> On 21/07/2023 16:37, Federico Serafini wrote:
>> Change parameter name from 'ptr' to 'v' in the function definition thus
>> addressing violations of MISRA C:2012 Rule 8.3: "All declarations of an
>> object or function shall use the same names and type qualifiers".
> 
> The parameters are consistent between arm32 and arm64. Naming wise, any 
> reason you picked the x86 name? Personally, I have a slight preference 
> to keep 'ptr' because this is more obvious than 'v'.
I picked 'v' because in xen/arch/arm/include/asm/arm64/atomic.h,
all the parameters having 'atomic_t *' type are named in that way.
The same is true for xen/include/xen/atomic.h.

If you prefer I can go for 'ptr'.

> But I will not strongly argue against it. That said, if you are looking 
> for consistency, you should also modify arm32.
> 
> Cheers,

After deciding what to do, I will propagate the change to arm32.

Regards
-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

