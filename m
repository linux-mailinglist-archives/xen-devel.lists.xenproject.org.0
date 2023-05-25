Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6BD71081E
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 10:57:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539418.840262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26mb-0003jU-Ui; Thu, 25 May 2023 08:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539418.840262; Thu, 25 May 2023 08:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26mb-0003gd-QS; Thu, 25 May 2023 08:57:17 +0000
Received: by outflank-mailman (input) for mailman id 539418;
 Thu, 25 May 2023 08:57:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q26ma-0003gJ-Ab
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 08:57:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q26mZ-0000RH-V1; Thu, 25 May 2023 08:57:15 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.31.224]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q26mZ-0005Ib-Nx; Thu, 25 May 2023 08:57:15 +0000
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
	bh=2Cr5YdIAm+OmCFzy0YZ2QOgndjiPq6HghzQKMO5ZyQA=; b=YPAGZkAF+kQf8uFTnN9HteFCTL
	X4JOg9ftqOA5rZnVWZrsN9Uxv40huYVh1ES63T3INKPaMhRn9Kf3UPKiCslUwdG8QV28TG78uygdz
	v7hmukPotSdjAabK+1HHzaBf6CkqYWPUAXHUbRHR3C08qIDZiGdVYmqpcRo8fD8fxsnY=;
Message-ID: <a22d37ae-46f5-6ead-26df-e4b34d23f4ac@xen.org>
Date: Thu, 25 May 2023 09:57:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v7 01/12] xen/arm: enable SVE extension for Xen
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-2-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230523074326.3035745-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/05/2023 08:43, Luca Fancellu wrote:
> Enable Xen to handle the SVE extension, add code in cpufeature module
> to handle ZCR SVE register, disable trapping SVE feature on system
> boot only when SVE resources are accessed.
> While there, correct coding style for the comment on coprocessor
> trapping.
> 
> Now cptr_el2 is part of the domain context and it will be restored
> on context switch, this is a preparation for saving the SVE context
> which will be part of VFP operations, so restore it before the call
> to save VFP registers.
> To save an additional isb barrier, restore cptr_el2 before an
> existing isb barrier and move the call for saving VFP context after
> that barrier. To keep a (mostly) specularity of ctxt_switch_to()
> and ctxt_switch_from(), move vfp_save_state() up in the function.
> 
> Change the KConfig entry to make ARM64_SVE symbol selectable, by
> default it will be not selected.
> 
> Create sve module and sve_asm.S that contains assembly routines for
> the SVE feature, this code is inspired from linux and it uses
> instruction encoding to be compatible with compilers that does not
> support SVE, imported instructions are documented in
> README.LinuxPrimitives.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

