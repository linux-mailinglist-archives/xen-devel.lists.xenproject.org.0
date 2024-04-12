Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8CF8A363C
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 21:14:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704941.1101510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvMLa-0001tf-5f; Fri, 12 Apr 2024 19:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704941.1101510; Fri, 12 Apr 2024 19:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvMLa-0001p5-1l; Fri, 12 Apr 2024 19:14:02 +0000
Received: by outflank-mailman (input) for mailman id 704941;
 Fri, 12 Apr 2024 19:14:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvpr=LR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rvMLY-0001jK-88
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 19:14:00 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf9a9731-f900-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 21:13:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 97E88828553E;
 Fri, 12 Apr 2024 14:13:56 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 3AjrrN6n53jx; Fri, 12 Apr 2024 14:13:56 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E30C38285ABA;
 Fri, 12 Apr 2024 14:13:55 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id KuibNSFzVizz; Fri, 12 Apr 2024 14:13:55 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 37B2F828553E;
 Fri, 12 Apr 2024 14:13:55 -0500 (CDT)
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
X-Inumbo-ID: cf9a9731-f900-11ee-94a3-07e782e9044d
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com E30C38285ABA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1712949235; bh=QGUbACwX+V5ICdTyu89weu87hBEo9UP6Xeah4z5IzGg=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=lDTLD+j48/FkR8ne9GCYAp9O/KsC7C+ka21B2rdmz3KtKppXpp5Wmiuy7RVHJ/jcB
	 gRmE31lWjGTduERnGWgxybtO275xj8n+6C7ihypMH8IJRW8PG9ti+uP9Qb+f57sKOJ
	 6UdLODIFGAYOFbYDPp5SNtqpqoOQO8evlCQwdamk=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <601d4c6d-c919-432c-89c7-72536e378c29@raptorengineering.com>
Date: Fri, 12 Apr 2024 14:13:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/19] xen/bitops: put __ffs() into linux compatible
 header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <854994adfdbaafb4d140fffb72ff5ade6b0aeb1e.1712137031.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <854994adfdbaafb4d140fffb72ff5ade6b0aeb1e.1712137031.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 4/3/24 5:19 AM, Oleksii Kurochko wrote:
> The mentioned macros exist only because of Linux compatible purpose.
> 
> The patch defines __ffs() in terms of Xen bitops and it is safe
> to define in this way ( as __ffs() - 1 ) as considering that __ffs()
> was defined as __builtin_ctzl(x), which has undefined behavior when x=0,
> so it is assumed that such cases are not encountered in the current code.
> 
> To not include <xen/linux-compat.h> to Xen library files __ffs() and __ffz()
> were defined locally in find-next-bit.c.
> 
> Except __ffs() usage in find-next-bit.c only one usage of __ffs() leave
> in smmu-v3.c. It seems that it __ffs can be changed to ffsl(x)-1 in
> this file, but to keep smmu-v3.c looks close to linux it was deciced just
> to define __ffs() in xen/linux-compat.h and include it in smmu-v3.c
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

For the PPC part:
Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

