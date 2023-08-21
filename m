Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2C7782F0B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 19:05:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587771.919164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY8Kj-0007Dt-4e; Mon, 21 Aug 2023 17:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587771.919164; Mon, 21 Aug 2023 17:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY8Kj-0007CI-1Z; Mon, 21 Aug 2023 17:04:53 +0000
Received: by outflank-mailman (input) for mailman id 587771;
 Mon, 21 Aug 2023 17:04:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qY8Kh-0007BI-MG
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 17:04:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY8Kg-00049Y-Rm; Mon, 21 Aug 2023 17:04:50 +0000
Received: from [54.239.6.178] (helo=[192.168.0.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY8Kg-0004IE-Jk; Mon, 21 Aug 2023 17:04:50 +0000
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
	bh=xMKydJGaHlyLJycJp0kcQ3ufIr0iXqXRlwyyBW+2SWM=; b=kddMa857fHNVT5NRmFRHsaMEMr
	CQaUg4Hu0j4/uLgeEvmkBhqxkPqifM98rrGRTRp4Md4Ozq6xYlhbWMoMcK5IwqBp8a0B5fPHqnJAp
	lWas8jbmufg9ZcmCI6KHcx0k+l1aAkedziWvodGYTq5Z8Z0C9baAebs8g/cCdefoaEK0=;
Message-ID: <b027d568-8ca7-4fb6-a010-a42e7336ee53@xen.org>
Date: Mon, 21 Aug 2023 18:04:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/13] xen/arm64: prepare for moving MMU related code
 from head.S
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Julien Grall <jgrall@amazon.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-4-Henry.Wang@arm.com>
 <d6afb536-e0b6-42fd-81ea-cc37c00192f7@xen.org>
 <0D2191B5-C084-4AE7-852E-A18A555C93CB@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0D2191B5-C084-4AE7-852E-A18A555C93CB@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 21/08/2023 09:54, Henry Wang wrote:
>> On Aug 21, 2023, at 16:44, Julien Grall <julien@xen.org> wrote:
>> On 14/08/2023 05:25, Henry Wang wrote:
>>> From: Wei Chen <wei.chen@arm.com>
>>> We want to reuse head.S for MPU systems, but there are some
>>> code are implemented for MMU systems only. We will move such
>>> code to another MMU specific file. But before that we will
>>> do some indentations fix in this patch to make them be easier
>>> for reviewing:
>>> 1. Fix the indentations and incorrect style of code comments.
>>> 2. Fix the indentations for .text.header section.
>>> 3. Rename puts() to asm_puts() for global export
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>> Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>
>> Is this patch depends on the first two? If not, I will commit it before v6.
> 
> Good point, no this patch is independent from the first two. Also I just
> tested applying this patch on top of staging and building with and without
> Earlyprintk. Xen and Dom0 boot fine on FVP for both cases.

Thanks for confirming. It is now ...

> 
> So please commit this patch if you have time. Thanks!

... committed.

Cheers,

-- 
Julien Grall

