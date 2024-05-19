Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 504508C946F
	for <lists+xen-devel@lfdr.de>; Sun, 19 May 2024 13:38:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.725591.1130054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8ert-00088C-Dx; Sun, 19 May 2024 11:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 725591.1130054; Sun, 19 May 2024 11:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8ert-00086f-BA; Sun, 19 May 2024 11:38:21 +0000
Received: by outflank-mailman (input) for mailman id 725591;
 Sun, 19 May 2024 11:38:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s8err-00086Y-Pf
 for xen-devel@lists.xenproject.org; Sun, 19 May 2024 11:38:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s8err-0007KV-Ci; Sun, 19 May 2024 11:38:19 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s8err-0001Sa-5L; Sun, 19 May 2024 11:38:19 +0000
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
	bh=EiDRjJxzgRWuRqpy1Hv/AAFEHRo2iP6ZmpPuMy+bNjk=; b=Ad7WzhkCE8R2+pJHV+zh7GDfVb
	anPUfIbsagYETTU1iutR8ZxZHEF9HV128t+CjinwP0MXQj3xxFWeLmp2gPd9zxAfEDAIfJA94cOoF
	1+NZTOn4KDIoRhh1t9ITNzERfQ1tSJY50W4En2xEoLjeMKEbaWoZt/AVF6SK6/1ps3TI=;
Message-ID: <10e1ec4f-d15f-4d24-9542-b3fd8b642b79@xen.org>
Date: Sun, 19 May 2024 12:38:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] xen: arm: Set state to SYS_STATE_smp_boot before
 smp initialization
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, dpsmith@apertussolutions.com
References: <20240320185455.3409182-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240320185455.3409182-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

Sorry this patch fell through the cracks.

On 20/03/2024 18:54, Ayan Kumar Halder wrote:
> This is similar to what is being done on x86.


OOI, how did you find this issue?

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>


> ---
>   xen/arch/arm/setup.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 424744ad5e..3d110685bc 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -787,6 +787,8 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset+
>   
>       processor_id();
>   
> +    system_state = SYS_STATE_smp_boot;
> +

This is not quite the samem position as x86. The system state will be 
updated just before do_presmp_initcalls().

Can you explain the difference?

Cheers,

-- 
Julien Grall

