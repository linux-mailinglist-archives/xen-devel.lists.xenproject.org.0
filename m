Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 181C1AEA278
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 17:28:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026699.1401894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUoWj-0000NM-Uu; Thu, 26 Jun 2025 15:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026699.1401894; Thu, 26 Jun 2025 15:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUoWj-0000LI-S1; Thu, 26 Jun 2025 15:28:37 +0000
Received: by outflank-mailman (input) for mailman id 1026699;
 Thu, 26 Jun 2025 15:28:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uUoWi-0000LC-Me
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 15:28:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uUoWh-003gRL-2R;
 Thu, 26 Jun 2025 15:28:35 +0000
Received: from [15.248.2.232] (helo=[10.24.67.104])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uUoWh-00712Y-1i;
 Thu, 26 Jun 2025 15:28:35 +0000
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
	bh=PeCm88sX+Bt3VwHD1/H6v9mTFtlIeva0wm74H3Qc7QE=; b=sVqEg/0RXo5zr/b9yYFHZLDF7I
	esE8WpO9Ozdu0/yspg5+VtMvGf/G4kym1G6W7Goay9WIhdgEfpKTBaJbId/cBXmUqfvHIwiq+IVKU
	KuXiBWrcdGR7hFjv5yYyw4nmrs54JuhyCvOxLxDLK/UzqWfmB0+r9FpOz8rLnTXYq0ZM=;
Message-ID: <fc3a5a07-a3f7-4f2e-8165-53457ad5d585@xen.org>
Date: Thu, 26 Jun 2025 16:28:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen: move __ro_after_init section symbols to
 xen/sections.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <1254ad9fd9f9fefc71ff8a5f5d23f5037d854943.1750237599.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1254ad9fd9f9fefc71ff8a5f5d23f5037d854943.1750237599.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 18/06/2025 10:13, Oleksii Kurochko wrote:
> Instead of declaring __ro_after_init_{start,end} in each architecture's
> asm/setup.h, move these declarations to the common header xen/sections.h.
> 
> This centralizes the declarations and reduces duplication across
> architectures.
> 
> No functional change intended.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Julien Grall <jgrall@amazon.com>

I also don't have a strong opinion either way about Jan's comment about 
the placement.

Cheers,

-- 
Julien Grall


