Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C746E722FBC
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 21:22:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543881.849227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Fmq-0005WS-4P; Mon, 05 Jun 2023 19:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543881.849227; Mon, 05 Jun 2023 19:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Fmq-0005TM-1g; Mon, 05 Jun 2023 19:22:40 +0000
Received: by outflank-mailman (input) for mailman id 543881;
 Mon, 05 Jun 2023 19:22:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6Fmo-0005TG-3k
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 19:22:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6Fmn-0003xN-FX; Mon, 05 Jun 2023 19:22:37 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6Fmn-0001Bc-Am; Mon, 05 Jun 2023 19:22:37 +0000
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
	bh=cM5ix9aTDV29dbGvMIF8m6W84UDvrtqkJg2724X31W8=; b=AHrzR6BNlVBo/6XcE4FKueewxO
	qAJfvFheVIy37ofMI1Moc5LFaEOwcx90b4cf6nau6foxAkMaLE8vaAZnqetJQxvcrmfaYlzNhQmoK
	HVVlGKID6CZPihdD2Q/HB63puGGRVbeswUTwMLcOCCk384ZzL69K5msfNsOPWjXRnU4I=;
Message-ID: <1d4705b1-8e0d-ace9-333c-1e23d30c8afb@xen.org>
Date: Mon, 5 Jun 2023 20:22:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [XEN][PATCH v7 09/19] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
To: Michal Orzel <michal.orzel@amd.com>,
 Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, jbeulich@suse.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-10-vikram.garhwal@amd.com>
 <a818b17e-c471-7920-d650-fa9736b514f3@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a818b17e-c471-7920-d650-fa9736b514f3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/06/2023 08:45, Michal Orzel wrote:
> 
> On 02/06/2023 02:48, Vikram Garhwal wrote:
>> diff --git a/xen/include/xen/iommu-private.h b/xen/include/xen/iommu-private.h
>> new file mode 100644
>> index 0000000000..5615decaff
>> --- /dev/null
>> +++ b/xen/include/xen/iommu-private.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> + /*
> incorrect indentation (<< 1)
> 
>> + * xen/iommu-private.h
>> + *
>> + *
>> + * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
>> + * Written by Vikram Garhwal <vikram.garhwal@amd.com>
> I'm not sure if placing the copyright is appropriate, given a single prototype for a function
> not really implemented by you with just spinlocks removed. But I might be wrong.

I agree. If you want to add a copyright then it should be the one from 
the original author.

But in this case, I don't think we should add an copyright as there is 
nothing really interesting in the header.

Cheers,

-- 
Julien Grall

