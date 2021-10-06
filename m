Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E02942463E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 20:47:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203144.358211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYBw5-0003r1-6R; Wed, 06 Oct 2021 18:46:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203144.358211; Wed, 06 Oct 2021 18:46:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYBw5-0003p5-3S; Wed, 06 Oct 2021 18:46:37 +0000
Received: by outflank-mailman (input) for mailman id 203144;
 Wed, 06 Oct 2021 18:46:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mYBw3-0003oz-ML
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 18:46:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mYBw2-0001jU-UP; Wed, 06 Oct 2021 18:46:34 +0000
Received: from [92.174.63.74] (helo=[192.168.1.232])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mYBw2-0006Nk-NK; Wed, 06 Oct 2021 18:46:34 +0000
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
	bh=+uva9TnyBVL23NIo076URFYFZColAv390fCIpXLLNcU=; b=hLquBk+ndgG9QkxCalkPhl0fW2
	7hO2zzuuBbbuxMIFc8Ssh/FtU4JQu8yWMuAEyHQvk3J/uRcXNXJ8MuzwWX+Gf122g2BG0LV8iGtXu
	hHaPI63Lixs0DYCWJMSfcQpxJucOExj5rMHaId6H7TJHp4hE8/8YLLrlp5Yc6dagBfSA=;
Message-ID: <e612c225-cda6-2c41-bf20-73314ebceb02@xen.org>
Date: Wed, 6 Oct 2021 20:46:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.2
Subject: Re: [PATCH] xen/arm: optee: Fix arm_smccc_smc's a0 for
 OPTEE_SMC_DISABLE_SHM_CACHE
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, tee-dev@lists.linaro.org
References: <1632750850-28600-1-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2109272151260.5022@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.21.2109272151260.5022@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 28/09/2021 06:52, Stefano Stabellini wrote:
> On Mon, 27 Sep 2021, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Fix a possible copy-paste error in arm_smccc_smc's first argument (a0)
>> for OPTEE_SMC_DISABLE_SHM_CACHE case.
>>
>> This error causes Linux > v5.14-rc5 (b5c10dd04b7418793517e3286cde5c04759a86de
>> optee: Clear stale cache entries during initialization) to stuck
>> repeatedly issuing OPTEE_SMC_DISABLE_SHM_CACHE call and waiting for
>> the result to be OPTEE_SMC_RETURN_ENOTAVAIL which will never happen.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> I added Fixes: and Backport: tags to the commit
Per SUPPORT.MD, OP-TEE is still a technical preview. So I would argue 
that we should not do any backport because the feature itself is not 
officially considered supported.

That said, what's missing to make the feature officially supported?

Cheers,

-- 
Julien Grall

