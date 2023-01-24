Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E035467A2E8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 20:31:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483709.750041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKP0U-0005wd-Vq; Tue, 24 Jan 2023 19:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483709.750041; Tue, 24 Jan 2023 19:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKP0U-0005uS-SD; Tue, 24 Jan 2023 19:30:58 +0000
Received: by outflank-mailman (input) for mailman id 483709;
 Tue, 24 Jan 2023 19:30:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pKP0T-0005uM-7g
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 19:30:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKP0S-0002tl-QK; Tue, 24 Jan 2023 19:30:56 +0000
Received: from [54.239.6.189] (helo=[192.168.20.46])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKP0S-0002we-K2; Tue, 24 Jan 2023 19:30:56 +0000
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
	bh=7YdYPJl312OnHEj+UbDLejAvKnI79E7H68dLcKXm0eE=; b=ntku88/Nzcguov7lpxUwVrUSuH
	R9smszwqprQsVodjomKvbV90fbIhMsw2bRA2mfPJyN5XhOU+Udlt0E/S0Tdpb3saymldfqxWm8p8K
	HiMNAQ/0Sin/fKqw4t8vCG28JObVWd+n/WPXSpPfafNGaEt2ScdHcgcODZjjG+XywxyI=;
Message-ID: <0b185f5f-6d0c-8c4c-1332-b064befdc3ee@xen.org>
Date: Tue, 24 Jan 2023 19:30:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 05/14] xen/arm: Clean-up the memory layout
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-6-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230113101136.479-6-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/01/2023 10:11, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> In a follow-up patch, the base address for the common mappings will
> vary between arm32 and arm64. To avoid any duplication, define
> every mapping in the common region from the previous one.
> 
> Take the opportunity to:
>      * add missing *_SIZE for FIXMAP_VIRT_* and XEN_VIRT_*
>      * switch to MB()/GB() to avoid hexadecimal (easier to read)
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

There was a context conflict with Michal's recent patch (see 
b2220f85256a). As this is minor, I have decided to handle it on commit.

Cheers,

-- 
Julien Grall

