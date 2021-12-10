Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A83AC46FD35
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 10:00:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243619.421451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvblJ-0006p9-9W; Fri, 10 Dec 2021 09:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243619.421451; Fri, 10 Dec 2021 09:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvblJ-0006mq-6X; Fri, 10 Dec 2021 09:00:17 +0000
Received: by outflank-mailman (input) for mailman id 243619;
 Fri, 10 Dec 2021 09:00:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mvblH-0006mi-Pg
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 09:00:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mvblH-0001Zo-Gr; Fri, 10 Dec 2021 09:00:15 +0000
Received: from [54.239.6.184] (helo=[192.168.9.67])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mvblH-0001Ad-Ai; Fri, 10 Dec 2021 09:00:15 +0000
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
	bh=51fupHlQ7AG8fcpgeLRn9cvT9ODgKLKSrME4rZEgGNw=; b=NJIl49wBbZhDX/15EwrA8fznY8
	L7Elm9T/5gCefh1TdfhVI8gUcDhNtjiN+771GuKOjFB5ukhgGPU24zSaJp+kNulrXuQ23dxE/+SPO
	CKIkZt4/tsiJJzAOtsZvm+gVPshS4foPf+gzvG5IIOhyAW9kDqOu44kLOzHVvmluGRyI=;
Message-ID: <9602b019-6c20-cdc7-23f3-9e4f8fd720f6@xen.org>
Date: Fri, 10 Dec 2021 09:00:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH] arm/docs: Drop mentioning of ACPI for properties under
 "hypervisor" node
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <1639083050-31782-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1639083050-31782-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 09/12/2021 20:50, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Remove the following sentence:
> "This property is unnecessary when booting Dom0 using ACPI."
> for "reg" and "interrupts" properties as the initialization is not
> done via device-tree "hypervisor" node in that case anyway.

Why do you think that? On ACPI, the hypervisor node is used to discover 
whether the OS is running on top of Xen (see [1]).

For dom0, Xen will actually create the hypervisor node with the 
compatible property and the uefi bits (see [2]).

The properties "regs" and "interrupts" are not created for ACPI and 
therefore this should be mentioned in the Device-Tree bindings.

> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>   docs/misc/arm/device-tree/guest.txt | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/guest.txt b/docs/misc/arm/device-tree/guest.txt
> index c115751..2b974bb 100644
> --- a/docs/misc/arm/device-tree/guest.txt
> +++ b/docs/misc/arm/device-tree/guest.txt
> @@ -15,11 +15,9 @@ the following properties:
>     or equal to gnttab_max_grant_frames()).
>     Regions 1...N are extended regions (unused address space) for mapping foreign
>     GFNs and grants, they might be absent if there is nothing to expose.
> -  This property is unnecessary when booting Dom0 using ACPI.
>   
>   - interrupts: the interrupt used by Xen to inject event notifications.
>     A GIC node is also required.
> -  This property is unnecessary when booting Dom0 using ACPI.
>   
>   To support UEFI on Xen ARM virtual platforms, Xen populates the FDT "uefi" node
>   under /hypervisor with following parameters:

Cheers,

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/xen/enlighten.c#n253

[2] 
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/acpi/domain_build.c;h=bbdc90f92c003c0c6d0f0b0290a1776336224719;hb=HEAD#l90

-- 
Julien Grall

