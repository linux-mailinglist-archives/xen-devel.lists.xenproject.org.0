Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C469CFE2C
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2024 11:31:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838721.1254697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCG4j-0007YE-On; Sat, 16 Nov 2024 10:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838721.1254697; Sat, 16 Nov 2024 10:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCG4j-0007Vn-Lt; Sat, 16 Nov 2024 10:30:45 +0000
Received: by outflank-mailman (input) for mailman id 838721;
 Sat, 16 Nov 2024 10:30:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tCG4i-0007UP-MG
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2024 10:30:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCG4i-007zzU-0R;
 Sat, 16 Nov 2024 10:30:44 +0000
Received: from [2a02:8012:3a1:0:dc92:b14d:2764:76ac]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCG4i-007vZg-0S;
 Sat, 16 Nov 2024 10:30:44 +0000
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
	bh=mQuOpBfZQ83r/LU+UeQYj8h0ylM8+0Kv3cUv99LVbaA=; b=qx5IE2K8Mm+ODk1Ci8BqtAZ4ZN
	dSrSLfBM90M/2qr84MbbVjJ/npmUTR7heDBbvGSyHV7zVE9G312xCjkAP6vc2bEQrWP6owcugEZS4
	u/TIyfwjWcgBpZ8a2vNSWAX4NskHBOiIl1F3PXcmhvPqoOpm9UZtjeYRQtLiMoITQ4ro=;
Message-ID: <96ac3dfd-8019-40b4-86eb-8d377880cdc0@xen.org>
Date: Sat, 16 Nov 2024 10:30:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/arm: mpu: Create boot-time MPU protection
 regions
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241107150330.181143-1-ayan.kumar.halder@amd.com>
 <20241107150330.181143-2-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241107150330.181143-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 07/11/2024 15:03, Ayan Kumar Halder wrote:
> +/*
> + * Macro to prepare and set a EL2 MPU memory region.
> + * We will also create an according MPU memory region entry, which
> + * is a structure of pr_t,  in table \prmap.
> + *
> + * Inputs:
> + * sel:         region selector

``sel`` is now also an output. But looking at the description, we don't 
seem to say which registers are preserved or not. For instance, both ..

> + * base:        reg storing base address (should be page-aligned) > + * limit:       reg storing limit address

... the two registers above will be clobbered. On the other hand...

> + * prbar:       store computed PRBAR_EL2 value
> + * prlar:       store computed PRLAR_EL2 value
> + * maxcount:    maximum number of EL2 regions supported

... this will be preserved. So I think we need to clarify it. For 
instance, this is the description of create_table_entry_from_paddr:

/*
  * Macro to create a page table entry in \ptbl to \tbl
  * ptbl:    table symbol where the entry will be created
  * tbl:     physical address of the table to point to
  * virt:    virtual address
  * lvl:     page-table level
  * tmp1:    scratch register
  * tmp2:    scratch register
  *
  * Preserves \virt
  * Clobbers \tbl, \tmp1, \tmp2
  *
  * Note that all parameters using registers should be distinct.
  */

-- 
Julien Grall

