Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7BE7F7284
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 12:15:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640558.998975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6U9Y-0005Cu-Cg; Fri, 24 Nov 2023 11:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640558.998975; Fri, 24 Nov 2023 11:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6U9Y-0005Aj-A2; Fri, 24 Nov 2023 11:15:20 +0000
Received: by outflank-mailman (input) for mailman id 640558;
 Fri, 24 Nov 2023 11:15:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r6U9W-00059P-PO
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 11:15:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r6U9V-0002by-Gw; Fri, 24 Nov 2023 11:15:17 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r6U9V-000825-BC; Fri, 24 Nov 2023 11:15:17 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=i701ve6J2ULnPxm/sCiZwJ/RKRZCvdmvTlqHYMDAX94=; b=W2xziZQ5v8TpExKSumfUqKV4L1
	DnvJ2OVOH0USUYEhjbr9VdWcG02udblTYEH62jmk4zHL1NpB/anVtWmRDCvC6P0jCM9C4NfLabd2J
	09Mud+MspQ4CFmV+VfLP4ENsamrBSjOCiCcMwMD2pj27+mWzpqqlXGHcsIkbmDiH5J38=;
Message-ID: <f23c52dc-0dd4-4959-918f-6f3a40c4d8ce@xen.org>
Date: Fri, 24 Nov 2023 11:15:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/14] xen/asm-generic: introduce generic header
 percpu.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
 <51ce486a825a1654998db01c4e07c127e4b1b38b.1700221559.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <51ce486a825a1654998db01c4e07c127e4b1b38b.1700221559.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 17/11/2023 12:24, Oleksii Kurochko wrote:
> The patch introduces generic percpu.h which was based on Arm's version
> with the following changes:
>   * makes __per_cpu_data_end[] constant
>   * introduce get_per_cpu_offset() for macros this_cpu() and this_cpu_ptr()
>   * add inclustion of <asm/current.h> as get_per_cpu_offset() is located there.
> 
> Also it was changed a place where <asm/percpu.h> is included in <xen/percpu.h>
> because asm-generic version of percpu.h started to include <asm/current.h> which
> requires definition of DECLARE_PER_CPU.
> 
> As well the patch switches Arm, PPC and x86 architectures to use asm-generic
> version of percpu.h.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V3:
>   - switch all architectures to asm-generic version of percpu.h
>   - introduce get_per_cpu_offset() and implement it architectures.
>   - make __per_cpu_data_end constamt.
>   - update the commit message.
> ---
> Changes in V2:
> 	- use smp_processor_id() instead of get_processor_id().
>   	- update commit message .
> ---
>   xen/arch/arm/include/asm/Makefile             |  1 +
>   xen/arch/arm/include/asm/current.h            |  3 +++

The changes for Arm and common looks good to me. I saw Jan thought the 
include movement is fragile, I don't have any strong opinion about the 
placement so long it compiles :). So feels free to add my ack:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

