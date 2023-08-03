Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E6D76F3B9
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 21:58:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576593.902899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qReSK-0000KO-DH; Thu, 03 Aug 2023 19:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576593.902899; Thu, 03 Aug 2023 19:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qReSK-0000IK-AL; Thu, 03 Aug 2023 19:57:56 +0000
Received: by outflank-mailman (input) for mailman id 576593;
 Thu, 03 Aug 2023 19:57:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0usr=DU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qReSI-0000IE-Ej
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 19:57:54 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 061a4166-3238-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 21:57:51 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691092667791199.77173568139017;
 Thu, 3 Aug 2023 12:57:47 -0700 (PDT)
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
X-Inumbo-ID: 061a4166-3238-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1691092669; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EDsZzosFgYgJh8PKJJRISsmDyPI4f7p1mAOdIaVUg4FY7Nwy23IUbQxlIL7Tcov4k/uJ4eiU3W4+YWylfXdmU6wLGSE+spMXiWSY+smbPT86UwYjvHZk7Fjqs5knhgLP1UGKQvjUmTYc6OhGxsMKuRDt5rRdCZ08/6yPQQg7cq0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691092669; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=jUXgWDeDFZinWlrthFhxXoyj9zP+vaetJ6tzgDwrRuY=; 
	b=VLQH9S+MHabG1B0sEZBx6co3dR+HW2ZwxzG6q1A84C/yI198ZRptDPhYjdjubPfoCJbAGIY44oUrT/cGm4kP5tv+3PGzxFmu194xPAEuh8UfRkPGW+t+lx2EjdbSlYqJ2y2H3cPIjXEoEt74iZuJiFW+/lLXIDsUi5lxbi09IlI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691092669;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jUXgWDeDFZinWlrthFhxXoyj9zP+vaetJ6tzgDwrRuY=;
	b=abr9C0m/05aXKQDtnPIr/nACoDUmN4S5NxCtDEcgYmIK7IMBFktLHYDp56/zj4Pf
	cixjUduqwITAS+ZOe0l1ao4YuNYPegIQTU1ToUcd1h6SN6e3ziC7ZIwhEQVL7pxvpAK
	7jAcnidnB6PiMGhMAxNA0QVL5pTBdaqPfBZsSdIM=
Message-ID: <8a51be9e-0131-0590-9aea-bbec146ce239@apertussolutions.com>
Date: Thu, 3 Aug 2023 15:57:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] fdt: make fdt handling reusable across arch
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-3-dpsmith@apertussolutions.com>
 <CA8E22A7-D7E4-43E8-BE4E-D2C2B41D921C@arm.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <CA8E22A7-D7E4-43E8-BE4E-D2C2B41D921C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 8/3/23 14:05, Luca Fancellu wrote:
> Hi Daniel,
> 
> [...]
>> diff --git a/xen/common/fdt.c b/xen/common/fdt.c
>> new file mode 100644
>> index 0000000000..8d7acaaa43
>> --- /dev/null
>> +++ b/xen/common/fdt.c
>> @@ -0,0 +1,153 @@
>> +/*
>> + * Flattened Device Tree
>> + *
>> + * Copyright (C) 2012-2014 Citrix Systems, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
> 
> Can you add an empty line here, I think it improves readability, I know that some other
> headers don’t add it unfortunately

Yah, that is no problem.

>> +#include <xen/fdt.h>
>> +#include <xen/init.h>
>> +#include <xen/lib.h>
>> +#include <xen/libfdt/libfdt.h>
>> +#include <xen/types.h>
>> +
>> +bool __init device_tree_node_matches(
>> +    const void *fdt, int node, const char *match)
>> +{
> [...]
> 
> Empty line

Ack.

>> +#ifndef __XEN_FDT_H__
>> +#define __XEN_FDT_H__
>> +
>> +#include <xen/init.h>
>> +#include <xen/libfdt/libfdt.h>
>> +#include <xen/types.h>
> 
> For the new files, apart from Michal’s comments, if I remember correctly in the past I was asked
> to add these lines to the end of the file:
> 
> /*
> * Local variables:
> * mode: C
> * c-file-style: "BSD"
> * c-basic-offset: 4
> * indent-tabs-mode: nil
> * End:
> */

You are correct, I will get them added.

> Regarding the coding style, I think it’s better to keep the style you’ve found in the original file,
> and change only some bits when the code is not following it.
> 
> I know there is nothing enforcing parameters on the same line of the function definition at the
> moment, but it is how it’s done from the original file so I would stick with it.
> 
> Regarding the u32/u64 types, maybe since you are moving the code it can be the occasion to
> convert them, but check with the maintainer before.

I can leave the main code as is, but I do think header decl's should be 
styled correctly as there is no need to have them churn in the future 
over purely style changes.

> I’ve also tested this serie and it works fine! I’m not leaving any tag because this patch is going to
> change anyway.

No worries, thank you for taking the time to review the series.

v/r,
dps

