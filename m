Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F2081BED7
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 20:11:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659120.1028580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGORf-0000QA-A4; Thu, 21 Dec 2023 19:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659120.1028580; Thu, 21 Dec 2023 19:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGORf-0000O0-6F; Thu, 21 Dec 2023 19:10:59 +0000
Received: by outflank-mailman (input) for mailman id 659120;
 Thu, 21 Dec 2023 19:10:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rGORe-0000Nu-Im
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 19:10:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rGORd-0007iH-Hd; Thu, 21 Dec 2023 19:10:57 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rGORd-0006Vp-Cq; Thu, 21 Dec 2023 19:10:57 +0000
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
	bh=N18FdFbII2fykYI6eJp05ZQHjGkR0xkqoPOQN9H3JQA=; b=RidgUamkiOfpZ1vGanF3ILvh6f
	+xy++hGcMcMTqZKSc7MxbiceFJ/5S6ntLdOyHPXoQdazM04Fjbv77wNeOFeBF/uw0X6YvSJLafj0r
	BFxoj8VptJxJbJ5YQaJUbZfPbdn1QmmK4NpbYe1GXfBplbSGeBFu3k5tL44uF2bortcc=;
Message-ID: <2899e5df-4617-418b-ad2d-45f8b923375a@xen.org>
Date: Thu, 21 Dec 2023 19:10:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] xen/asm-generic: introduce stub header softirq.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
 <ab66dbcdc2eb919577d6cc90d9f5f27d00e423be.1703072575.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ab66dbcdc2eb919577d6cc90d9f5f27d00e423be.1703072575.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oksii,

On 20/12/2023 14:08, Oleksii Kurochko wrote:
> <asm/softirq.h> is common between Arm, PPC and RISC-V so it is
> moved to asm-generic.
> 
> Drop Arm and PPC's softirq.h and use asm-generic version instead.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

