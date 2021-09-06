Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C78BB4019EE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 12:38:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179609.325963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNC1D-0003E3-1D; Mon, 06 Sep 2021 10:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179609.325963; Mon, 06 Sep 2021 10:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNC1C-0003C8-TN; Mon, 06 Sep 2021 10:38:26 +0000
Received: by outflank-mailman (input) for mailman id 179609;
 Mon, 06 Sep 2021 10:38:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNC1B-0003C2-BE
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 10:38:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNC18-0001ey-1b; Mon, 06 Sep 2021 10:38:22 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNC17-0005RK-R2; Mon, 06 Sep 2021 10:38:21 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=vRQKbF9dIKn56RN0QBCOcsQEJRISlyCnZKN8myk/D8Q=; b=A2FI9XHsrW4R+hJqG8RLklILc4
	+jqR2/HiZZsgEJ7qd5LKq/H+b5zoIkxsdrW9rXAOOMu58TJQ1tAHkJDJR0bJ0EfuvYDMHjL4BxyPI
	9g9i6+gMZ+giS19dbtYl/ImncQ9QvLwgUTqQCj/DG6fhI7UDrW2u+i03QWw05rwhcwkY=;
Subject: Re: [PATCH 11/11] xen/arm: Process pending vPCI map/unmap operations
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-12-andr2000@gmail.com>
 <bc3bc53a-4a86-8ef3-b040-6e983f02ebf1@xen.org>
 <f8760f77-1ba7-b0ed-0562-d63527aa1cfa@epam.com>
 <7da7f759-eab0-5e97-e8e4-980db5db1e79@xen.org>
 <b5b761bd-f5d7-34e6-691d-735af7c8b0ae@epam.com>
 <f950a37d-2773-fce5-9e77-163a64925d7d@xen.org>
 <71e0a54f-da69-5712-f826-9c38eecfa244@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9482457a-fae2-eb8e-79dc-b5d7bcf2fa0a@xen.org>
Date: Mon, 6 Sep 2021 11:38:19 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <71e0a54f-da69-5712-f826-9c38eecfa244@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 06/09/2021 11:06, Oleksandr Andrushchenko wrote:
> On 06.09.21 12:53, Julien Grall wrote:
>>>>>> However, looking at the rest of the code, we already have a check for vpci in the common IOREQ code.
>>>>>
>>>>> Which may not be enabled as it depends on CONFIG_IOREQ_SERVER.
>>>>
>>>> Right. My point is when CONFIG_IOREQ_SERVER is set then you would end up to call twice vpci_process_pending(). This will have an impact how on long your vCPU is going to running because you are doubling the work.
>>>
>>> So, you suggest that we have in the common IOREQ code something call like
>>>
>>> arch_vpci_process_pending? In case of x86 it will have the code currently found in the
>>>
>>> common IOREQ sources and for Arm it will be nop?
>>
>> No I am suggesting to move the call of the IOREQ code to hvm_do_resume() (on x86) and check_for_vcpu_work() (on Arm).
> 
> Ok, I can move vPCI code to hvm_do_resume, but vPCI is only used for x86 PVH Dom0.

AFAIK, Roger is planning to use it for x86 PVH guest.

> 
> Do you still think hvm_do_resume is the right place?
I think so. AFAICT, on x86, the only caller of 
vcpu_ioreq_handle_completion() is hvm_do_resume(). So it makes sense to 
push one layer up.

Cheers,

-- 
Julien Grall

