Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F6666B91E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 09:36:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478425.741608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHKyX-0008Ed-Qt; Mon, 16 Jan 2023 08:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478425.741608; Mon, 16 Jan 2023 08:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHKyX-0008CR-NL; Mon, 16 Jan 2023 08:36:17 +0000
Received: by outflank-mailman (input) for mailman id 478425;
 Mon, 16 Jan 2023 08:36:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHKyW-0008CL-Si
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 08:36:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHKyW-0000A4-Jb; Mon, 16 Jan 2023 08:36:16 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[192.168.9.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHKyW-0002B0-DG; Mon, 16 Jan 2023 08:36:16 +0000
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
	bh=yGVQUYQ8k4N8zOcI+y5VfNe6HVyMZcuTfH2wfXekJY0=; b=ybcjhYapwtIaXhh0NIZItqIoGv
	uDTp5CYbwtBr+VJQoEGI4hcQDSF1A+9q30rHuzziQ/EszLXGjLNX33T5ZyjYQJSYvcRN/1oubxhqM
	KYDpd+NvauVArxOqHF01rHouQk+6DvzlqkaAAmXcln21N1NNgznbCwvEdvsXMbjb2Fa8=;
Message-ID: <853c086f-b556-e204-6f4d-eb844d710af9@xen.org>
Date: Mon, 16 Jan 2023 08:36:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 02/14] xen/arm64: flushtlb: Implement the TLBI repeat
 workaround for TLB flush by VA
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-3-julien@xen.org>
 <C8CAEAFE-50FB-4DBB-8EDC-8AB87920EB06@arm.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <C8CAEAFE-50FB-4DBB-8EDC-8AB87920EB06@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 13/01/2023 17:56, Luca Fancellu wrote:
> 
> 
>> On 13 Jan 2023, at 10:11, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Looking at the Neoverse N1 errata document, it is not clear to me
>> why the TLBI repeat workaround is not applied for TLB flush by VA.
>>
>> The TBL flush by VA helpers are used in flush_xen_tlb_range_va_local()

s/TBL/TLB/

>> and flush_xen_tlb_range_va(). So if the range size if a fixed size smaller
> 
> NIT: is a fixed size

Thanks. I will fix it on commit unless there is another round needed.

Cheers,

-- 
Julien Grall

