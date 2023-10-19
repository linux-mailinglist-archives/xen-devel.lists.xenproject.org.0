Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D04C7CF50D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 12:22:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619110.963710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQAf-00065O-Vd; Thu, 19 Oct 2023 10:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619110.963710; Thu, 19 Oct 2023 10:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQAf-00063h-Qq; Thu, 19 Oct 2023 10:22:29 +0000
Received: by outflank-mailman (input) for mailman id 619110;
 Thu, 19 Oct 2023 10:22:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qtQAf-00062v-B5
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 10:22:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtQAf-0003wU-3a; Thu, 19 Oct 2023 10:22:29 +0000
Received: from [15.248.3.1] (helo=[10.24.67.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtQAe-0006Ny-TY; Thu, 19 Oct 2023 10:22:29 +0000
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
	bh=ULrLjZWhGuhOk7NlaC+5RDq8kjphw9tBnAQPN8dxbI0=; b=V+h7yI3iFz6pMvmeoqEtOVDHvs
	R5fCUgPInTYGtvCuUFFVdd1lQk21gzBDFlSXm184fS8RWuVKCIlq2A74JS3hcOXmWh83wgmZIhlCd
	957rXYMIVEbe9u1WQVtJOV+Bx0rzbhJ/J+pJO1+RSE9hGLA1Ir6YPgn3Uipyf4mi93o0=;
Message-ID: <dd3ac31c-6f9e-4e33-8b9f-8866e72ff9e8@xen.org>
Date: Thu, 19 Oct 2023 11:22:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] xen/riscv: introduce identity mapping
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1691507564.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cover.1691507564.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/08/2023 16:14, Oleksii Kurochko wrote:
> The patch series introduces things necessary to implement identity mapping:
>    1. Make identity mapping for the entire Xen.
>    2. Enable MMU.
>    3. Jump to the virtual address world
>    4. Remove identity mapping.
> 
> Also current patch series introduces the calculation of physical offset before
> MMU is enabled as access to physical offset will be calculated wrong after
> MMU will be enabled because access to phys_off variable is PC-relative and
> in the case when linker address != load address, it will cause MMU fault.
> 
> The reason for this patch series can be found here:
> https://lore.kernel.org/xen-devel/4e336121-fc0c-b007-bf7b-430352563d55@citrix.com/

During the last community call it was pointed out that this is missing a 
formal ack. Now that we have no RISC-V maintainers, this would fall to 
the REST.

@Jan, you reviewed the previous version of the series. Would you be able 
to provide a formal ack?

Cheers,

-- 
Julien Grall

