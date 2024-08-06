Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A429497A6
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 20:41:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773076.1183530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbP79-0000RE-8C; Tue, 06 Aug 2024 18:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773076.1183530; Tue, 06 Aug 2024 18:40:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbP79-0000Os-5O; Tue, 06 Aug 2024 18:40:55 +0000
Received: by outflank-mailman (input) for mailman id 773076;
 Tue, 06 Aug 2024 18:40:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sbP77-0000Og-EL
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 18:40:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sbP77-0003vh-0Z; Tue, 06 Aug 2024 18:40:53 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sbP76-0001iJ-Rl; Tue, 06 Aug 2024 18:40:52 +0000
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
	bh=SZUvY6J/pe1Wzj0NT8f5dbKruV7K0c98HtuX/dzyPrs=; b=c44cRCbQAWfwJacg43tMx63XOU
	mZekMUFOPQ4RIib+ziAm9uw+66i5+agNoyP3Y6MzJEydcs3WLkIg3S2lb0HhAzq70SKrB2lq5wS89
	JyPJJKinUzrTy3YaaAl6x6t+VQByLVz3rTObs+fMoniGB5SRyD5Nm1AvS50oJQ2UJTqA=;
Message-ID: <b093e07a-d9b7-47f1-9f02-0e43d50b8c7e@xen.org>
Date: Tue, 6 Aug 2024 19:40:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Common device tree stuff
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1722941799.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cover.1722941799.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/08/2024 12:41, Oleksii Kurochko wrote:
> The current patch series introduces the common device tree functions
> between several architectures: Arm, PPC, RISC-V.
> 
> Originally these patches were a part of Shawn's patch series [1].
> At that moment it was v4 version of this patches.
> 
> After RISC-V started to need this changes these patches have been
> rebased on top of the current staging with addional updates after
> rebase.
> For some time, these patches from v5 to v7 version were the part of
> the patch series [2] but not to block almost ready patches for merging
> it was decided to move them to separate patch series.
> 
> CI tests results:
>   https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1402476423
> 
> [1]
> https://lore.kernel.org/xen-devel/cover.1712893887.git.sanastasio@raptorengineering.com/
> 
> [2]
> https://lore.kernel.org/xen-devel/cover.1721834549.git.oleksii.kurochko@gmail.com/
> ---
> Changes in v2:
>   - add Acked-by: Julien Grall <julien@xen.org> for Patch 2
>   - rename xen/common/device_tree.c to xen/common/device-tree.c
>   - update MAINTAINERS file: drop xen/common/device_tree.c from it.
>   - make diff smaller using git's options:
>        --diff-algorithm=minimal --find-renames
> ---
> 
> Shawn Anastasio (2):
>    xen/device-tree: Move Arm's setup.c bootinfo functions to common
>    xen/common: Move Arm's bootfdt.c to common

I have committed the series.

Cheers,

-- 
Julien Grall


