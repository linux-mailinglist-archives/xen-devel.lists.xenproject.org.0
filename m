Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F33261E56F
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 20:02:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438680.692772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orkuH-0007G6-8o; Sun, 06 Nov 2022 19:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438680.692772; Sun, 06 Nov 2022 19:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orkuH-0007E6-5m; Sun, 06 Nov 2022 19:02:09 +0000
Received: by outflank-mailman (input) for mailman id 438680;
 Sun, 06 Nov 2022 19:02:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1orkuF-0007E0-8y
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 19:02:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orkuE-0006Si-Vy; Sun, 06 Nov 2022 19:02:06 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orkuE-0002Rn-Ol; Sun, 06 Nov 2022 19:02:06 +0000
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
	bh=v1UFhayc9LFvevF+A40nQDQisahupmXqmvzNZjqoq/4=; b=Lhi+7OSf5Aelvzs7XUvkhrNPC8
	TyS0N3e2tRdY9ZYCqRm9uPklhJNBLilcp3G1e9sEU6nxWbOvEIx45uhMlwPNE11PabROJ1sblRlFF
	VDw/k9xTyVIluUxO6BsKN9UNfYfRXV25UlaS3FwZmSjQ3rcm7H7DN0FyzeFHB09n7oXw=;
Message-ID: <9c3bfa0c-2c8f-2160-46d1-3be234b5bcaf@xen.org>
Date: Sun, 6 Nov 2022 19:02:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v6 00/11] xen/arm: Add Armv8-R64 MPU support to Xen -
 Part#1
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221104100741.2176307-1-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wei,

On 04/11/2022 10:07, Wei Chen wrote:
> The Armv-R architecture profile was designed to support use cases
> that have a high sensitivity to deterministic execution. (e.g.
> Fuel Injection, Brake control, Drive trains, Motor control etc)
> 
> Arm announced Armv8-R in 2013, it is the latest generation Arm
> architecture targeted at the Real-time profile. It introduces
> virtualization at the highest security level while retaining the
> Protected Memory System Architecture (PMSA) based on a Memory
> Protection Unit (MPU). In 2020, Arm announced Cortex-R82,
> which is the first Arm 64-bit Cortex-R processor based on Armv8-R64.
> The latest Armv8-R64 document can be found [1]. And the features of
> Armv8-R64 architecture:
>    - An exception model that is compatible with the Armv8-A model
>    - Virtualization with support for guest operating systems
>    - PMSA virtualization using MPUs In EL2.
>    - Adds support for the 64-bit A64 instruction set.
>    - Supports up to 48-bit physical addressing.
>    - Supports three Exception Levels (ELs)
>          - Secure EL2 - The Highest Privilege
>          - Secure EL1 - RichOS (MMU) or RTOS (MPU)
>          - Secure EL0 - Application Workloads
>   - Supports only a single Security state - Secure.
>   - MPU in EL1 & EL2 is configurable, MMU in EL1 is configurable.
> 
> These patch series are implementing the Armv8-R64 MPU support
> for Xen, which are based on the discussion of
> "Proposal for Porting Xen to Armv8-R64 - DraftC" [1].
> 
> We will implement the Armv8-R64 and MPU support in three stages:
> 1. Boot Xen itself to idle thread, do not create any guests on it.

I read this as I can build Xen and see it boots (not creating domain). 
However... HAS_MPU is not defined and I was expecting mm.c to be 
modified to cater the MPU support. So I am a bit ensure what the series 
is actually doing.

Cheers,

-- 
Julien Grall

