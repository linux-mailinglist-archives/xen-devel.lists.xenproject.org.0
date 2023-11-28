Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E48327FC8E3
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 22:59:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643552.1003865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r866I-000880-4X; Tue, 28 Nov 2023 21:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643552.1003865; Tue, 28 Nov 2023 21:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r866I-00085S-1w; Tue, 28 Nov 2023 21:58:38 +0000
Received: by outflank-mailman (input) for mailman id 643552;
 Tue, 28 Nov 2023 21:58:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Vht=HJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1r866F-00085M-Si
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 21:58:35 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45dd557e-8e39-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 22:58:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 84E0E82857EA;
 Tue, 28 Nov 2023 15:58:32 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WOEmYFTdA4yf; Tue, 28 Nov 2023 15:58:31 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 947FD8285803;
 Tue, 28 Nov 2023 15:58:31 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id MRUSkrEkCOM9; Tue, 28 Nov 2023 15:58:31 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id EE99082857EA;
 Tue, 28 Nov 2023 15:58:30 -0600 (CST)
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
X-Inumbo-ID: 45dd557e-8e39-11ee-9b0e-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 947FD8285803
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701208711; bh=4v6G1EuCRG17MgKiv3UwTD56E8TEVbVzeNRD8z/twu4=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=NGo5l5g06gikczbJJDV45DGFji+YVQTXX62j337rQk9zZvmBVqZ8k8P7BaT5in6RE
	 zRUV63WV7XpNQTi/T692J5+ahhcnjdn+vr7R1aOedg/X/edZ8ZFHZgU9yzLAfqrI4I
	 ++EGO75q3MjVLZrU+OySZsCLoVksa9gkqXmyfLQA=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <3fdd6ebe-d9ff-4881-a59e-86d5ad46dd2f@raptorengineering.com>
Date: Tue, 28 Nov 2023 15:58:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/14] xen/asm-generic: introduce generic header
 percpu.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <7f10cbda3885a91e108e1a303fe74ffc21d1025c.1701093907.git.oleksii.kurochko@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <7f10cbda3885a91e108e1a303fe74ffc21d1025c.1701093907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
> The patch introduces generic percpu.h which was based on Arm's version
> with the following changes:
>  * makes __per_cpu_data_end[] constant
>  * introduce get_per_cpu_offset() for macros this_cpu() and this_cpu_ptr()
>  * add inclustion of <asm/current.h> as get_per_cpu_offset() is located there.
> 
> Also it was changed a place where <asm/percpu.h> is included in <xen/percpu.h>
> because asm-generic version of percpu.h started to include <asm/current.h> which
> requires definition of DECLARE_PER_CPU.
> 
> As well the patch switches Arm, PPC and x86 architectures to use asm-generic
> version of percpu.h.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
> ---
> Changes in V4:
>  - Added FIXME comment in ppc/current.h for get_per_cpu_offset()

Sorry I missed the discussion on this in v3, but yes, the PPC
implementation of this will need to be fixed (this was also the case
before your patch in PPC's current percpu.h but it was conspicuously
missing a TODO comment).

In any case,

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

