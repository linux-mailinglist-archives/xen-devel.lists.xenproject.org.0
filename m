Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4910675088
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 10:18:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481512.746449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pInWg-0008UO-DS; Fri, 20 Jan 2023 09:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481512.746449; Fri, 20 Jan 2023 09:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pInWg-0008SK-As; Fri, 20 Jan 2023 09:17:34 +0000
Received: by outflank-mailman (input) for mailman id 481512;
 Fri, 20 Jan 2023 09:17:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pInWe-0008SE-HV
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 09:17:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pInWd-00009J-Nm; Fri, 20 Jan 2023 09:17:31 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pInWd-0003x1-GA; Fri, 20 Jan 2023 09:17:31 +0000
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
	bh=5676djTPa2pge/e7UnPJo9SKFwnDti2WjFGbGt5H56c=; b=c0zuvtvKCqauQWjr+v5fWwIMlC
	D2iCveWlyAWJhZnIZN/atKt88ksm2EPXeR0O5No7mxa32vYDDX6jakKnipviFiCOIjux2N5FRoZ94
	spQC/LlMm6j5/FAn8K7puAuSS/8CRK/p0j9W5SDuOUmHbvtTumgdeEK6XcmReJqZk160=;
Message-ID: <0ec33871-96fa-bd9f-eb1b-eb37d3d7c982@xen.org>
Date: Fri, 20 Jan 2023 09:17:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v5 4/5] xen/riscv: introduce early_printk basic stuff
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Bobby Eshleman <bobby.eshleman@gmail.com>
References: <cover.1674131459.git.oleksii.kurochko@gmail.com>
 <8d7ac0dc51a6331d3efa7fcda433616670b46700.1674131459.git.oleksii.kurochko@gmail.com>
 <aefd4cb9-9a60-4ef1-ff45-dedfb6c37203@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <aefd4cb9-9a60-4ef1-ff45-dedfb6c37203@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/01/2023 00:48, Andrew Cooper wrote:
> On 19/01/2023 2:07 pm, Oleksii Kurochko wrote:
>> diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.c
>> new file mode 100644
>> index 0000000000..6f590e712b
>> --- /dev/null
>> +++ b/xen/arch/riscv/early_printk.c
>> @@ -0,0 +1,45 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * RISC-V early printk using SBI
>> + *
>> + * Copyright (C) 2021 Bobby Eshleman <bobbyeshleman@gmail.com>
>> + */
>> +#include <asm/early_printk.h>
>> +#include <asm/sbi.h>
>> +
>> +/*
>> + * early_*() can be called from head.S with MMU-off.
>> + *
>> + * The following requiremets should be honoured for early_*() to
>> + * work correctly:
>> + *    It should use PC-relative addressing for accessing symbols.
>> + *    To achieve that GCC cmodel=medany should be used.
>> + */
>> +#ifndef __riscv_cmodel_medany
>> +#error "early_*() can be called from head.S with MMU-off"
>> +#endif
> 
> This comment is false, and the check is bogus.

You are already said that in the previous version and ... I reply back 
explaining why I think this is correct (see [1]).

>  > It needs deleting.

That might be the second step. The first step is we settle down on the 
approach.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/CAF3u54C2ewEfBN+ZT6VPaVu4vsqS_+12gr3YJ_jsg1sGHDhZ1A@mail.gmail.com/

-- 
Julien Grall

