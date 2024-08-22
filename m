Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88C895B2B4
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 12:16:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781692.1191180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh4rU-0001Fw-8G; Thu, 22 Aug 2024 10:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781692.1191180; Thu, 22 Aug 2024 10:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh4rU-0001Dv-5j; Thu, 22 Aug 2024 10:16:12 +0000
Received: by outflank-mailman (input) for mailman id 781692;
 Thu, 22 Aug 2024 10:16:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sh4rS-0001CH-GW
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 10:16:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sh4rS-0001rb-2G; Thu, 22 Aug 2024 10:16:10 +0000
Received: from [15.248.2.26] (helo=[10.24.67.18])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sh4rR-0002Q9-Ra; Thu, 22 Aug 2024 10:16:09 +0000
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
	bh=JG5LJlgUb/WFvE5Nr/hvC07BAGFOQSaVkucS05qzdmA=; b=5SCY6GacipZvvnEe87xMC96ETj
	9xjLYaMFkOMjaHN5etIT2TsjntUKC2zt5UR4zEE3qOxHCjGCGzrjwzOKne2xNhymxVdzNUjlDWF8d
	27nzEPF2uUPK9HT8ooTiVqK3KALu5MW6VlcNYq0O/zSN9MlF/WPvqGScbwLg5gGYQehU=;
Message-ID: <29fa0e7f-3b39-4434-b23b-43a41bfd1da1@xen.org>
Date: Thu, 22 Aug 2024 11:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm: Drop {boot_}phys_offset usage
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240814094303.23611-1-michal.orzel@amd.com>
 <20240814094303.23611-2-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240814094303.23611-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 14/08/2024 10:43, Michal Orzel wrote:
> boot_phys_offset stores the physical offset (PA-VA), is calculated in
> the startup head.S code and passed to start_xen() as a first argument.
> There is no point in using it given that we can ask MMU to translate
> a VA for us using e.g. virt_to_{mfn,maddr}. Drop usage of these
> variables from the C world.

I think the code is a remanant of when Xen would be relocated to the top 
of the RAM. In this case, virt_to_mfn() would not have worked.

This was removed by f60658c6ae47 ("xen/arm: Stop relocating Xen") and I 
don't expect the relocation code to be re-introduced. So...

> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

...

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


