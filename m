Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B66E7478AA
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 21:25:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558665.872996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGleE-0002cV-Jb; Tue, 04 Jul 2023 19:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558665.872996; Tue, 04 Jul 2023 19:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGleE-0002ZO-Gj; Tue, 04 Jul 2023 19:25:14 +0000
Received: by outflank-mailman (input) for mailman id 558665;
 Tue, 04 Jul 2023 19:25:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGleD-0002ZI-P6
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 19:25:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGleD-0000Vd-BD; Tue, 04 Jul 2023 19:25:13 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGleD-00022W-5k; Tue, 04 Jul 2023 19:25:13 +0000
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
	bh=ExZBwSF/hEg//G9LvJbhNJn/z7huKgumMcmLZn3V4VI=; b=xE/lbv9YWcDymoMFvW6HzEuMbK
	hiGdzU0vrpENFuaXR1AGIktHI8D0qHevZXfNoa9VfuEDGnwwXUIvrWcTXi8TVFCGZ+341a2jMtRrM
	LTblYOa4ET0bK69jcsi16LCiPvYDQT3F9uQNT2s2tAESDZ27evJiepYfTZ6MyarCgbuY=;
Message-ID: <14ea91dc-2af1-f7c7-5888-22df8fd9133d@xen.org>
Date: Tue, 4 Jul 2023 20:25:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 09/52] xen/arm: use PA == VA for
 EARLY_UART_VIRTUAL_ADDRESS on MPU systems
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-10-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230626033443.2943270-10-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 26/06/2023 04:34, Penny Zheng wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> There is no VMSA support on MPU systems, so we can not map early
> UART to FIXMAP_CONSOLE. In stead, we can use PA == VA for early
> UART on MPU systems.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Is this change necessary for the MMU split? If not, I will skip the 
review for now.

Cheers,

-- 
Julien Grall

