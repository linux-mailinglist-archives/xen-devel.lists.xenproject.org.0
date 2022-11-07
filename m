Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE6B61EE4F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 10:10:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439150.693134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ory8a-00061J-7A; Mon, 07 Nov 2022 09:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439150.693134; Mon, 07 Nov 2022 09:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ory8a-0005yv-3t; Mon, 07 Nov 2022 09:09:48 +0000
Received: by outflank-mailman (input) for mailman id 439150;
 Mon, 07 Nov 2022 09:09:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ory8Z-0005yp-8b
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 09:09:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ory8Y-0001Nf-C9; Mon, 07 Nov 2022 09:09:46 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.25.99]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ory8Y-0001pX-4Y; Mon, 07 Nov 2022 09:09:46 +0000
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
	bh=KYbuF6I8yKepSM7c9qyxAcB4e/ao6uXH366lmrUEvdI=; b=kRahJINS3UGodvyAeiaXF52F1A
	P/W5AtfavsmRzGlcegf4xCX9B2xkEZEZ4//YHEutkn2FVLN/bPry/fq10YG6TfGXzWmJuf2oS4yNw
	g4d1kpSrPxRQ9HRZDbclOipUTyUSnInAh3X/dH1d8tehiYK1si+f/w5pJeErLU1VvVOg=;
Message-ID: <11459f47-8d9a-9e19-ef1e-b369c7c5e60f@xen.org>
Date: Mon, 7 Nov 2022 09:09:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v6 02/11] xen/arm: add iounmap after initrd has been
 loaded in domain_build
To: Henry Wang <Henry.Wang@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-3-wei.chen@arm.com>
 <a3b0c695-3e2f-7529-39c6-2e4c23ee9b78@xen.org>
 <AS8PR08MB7991425E19561C127C62B5E3923C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991425E19561C127C62B5E3923C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/11/2022 01:33, Henry Wang wrote:
> Hi Julien,

Hi Henry,

> 
>> -----Original Message-----
>> Subject: Re: [PATCH v6 02/11] xen/arm: add iounmap after initrd has been
>> loaded in domain_build
>>
>> (+ Henry)
>> I think this wants to be in 4.17. This will avoid Xen to have two
>> mappings with different caching attribute (initrd is part of the RAM and
>> therefore directmap).
> 
> Sounds good to me, I am wondering if we need to include also patch #1 though.

If we were earlier in the release, I would have say yes. But now, it is 
a no as this just a cleanup (having extra definitions is harmless).

> 
> If this patch wants to be in 4.17:
> 
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Thanks!

Cheers,

-- 
Julien Grall

