Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D29B8748252
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 12:41:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559052.873738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzwP-0007gf-PR; Wed, 05 Jul 2023 10:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559052.873738; Wed, 05 Jul 2023 10:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzwP-0007ef-MN; Wed, 05 Jul 2023 10:40:57 +0000
Received: by outflank-mailman (input) for mailman id 559052;
 Wed, 05 Jul 2023 10:40:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGzwN-0007eZ-Kw
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 10:40:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGzwN-00054D-3m; Wed, 05 Jul 2023 10:40:55 +0000
Received: from [15.248.3.5] (helo=[10.24.67.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGzwM-0000w5-U1; Wed, 05 Jul 2023 10:40:55 +0000
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
	bh=YCuZM3j36LKscsvZbyWgzojDDQZP1lgWsD/23JEmPD4=; b=NBwdeMBxzJi9N5WLTiivrM55Kn
	hjgRFUZFTezTkMePEixcJGVg/sRbkNYBM/v36nR14e2xoAmZzxZc5UNQrQ/D+s/7NxYgdMPZobIPa
	wU7MeeZpd6MCJQ3gsE0kL7/O01wzKxxdh8K8aKGjP1p/j2uAuTie7w4q06RLY4CgdeIY=;
Message-ID: <bab83c9f-dda8-460c-40ee-c2e0b95f20fd@xen.org>
Date: Wed, 5 Jul 2023 11:40:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 00/52] xen/arm: Add Armv8-R64 MPU support to Xen -
 Part#1
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 26/06/2023 04:33, Penny Zheng wrote:
> So sorry for the long long wait before v3 serie, since I got sidetracked to
> a new high priority internal project for quite a time.
> 
> The Armv8-R architecture profile was designed to support use cases
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
> "Proposal for Porting Xen to Armv8-R64 - DraftC" [2].
> 
> We will implement the Armv8-R64 and MPU support in three stages:
> 1. Support to boot MMU domains on Armv8-R64 Xen.
> 2. Support to boot MPU domains on Armv8-R64 Xen.
> 3. SMP and other advanced features of Xen support on Armv8-R64.
> 
> For having a overall undestanding for reviewers about MPU framework on Xen,
> we have introduced a large patch serie here, including 52 commits. At this
> stage, we could successfully boot a linux guest on FVP_BaseR_AEMv8R
> model[3].
> 
> We will split these patches to several parts, this series is the
> part#1, v1 is in [4], the full PoC can be found in [5]. More software for
> Armv8-R64 can be found in [6];
> 
> [1] https://developer.arm.com/documentation/ddi0600/latest
> [2] https://lists.xenproject.org/archives/html/xen-devel/2022-05/msg00643.html
> [3] https://developer.arm.com/tools-and-software/simulation-models/fixed-virtual-platforms/arm-ecosystem-models
> [4] https://lists.xenproject.org/archives/html/xen-devel/2022-11/msg00289.html
> [5] https://gitlab.com/xen-project/people/weic/xen/-/tree/integration/mpu_v3

The first few patches in this tree seems to be different compare to this 
series. Can you provide a tree with all the patches from this series 
applied?

Cheers,

-- 
Julien Grall

