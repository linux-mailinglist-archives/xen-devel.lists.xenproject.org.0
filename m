Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A8252A99A
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 19:51:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331363.554863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr1Lr-0002Cd-MJ; Tue, 17 May 2022 17:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331363.554863; Tue, 17 May 2022 17:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr1Lr-00029n-JQ; Tue, 17 May 2022 17:51:19 +0000
Received: by outflank-mailman (input) for mailman id 331363;
 Tue, 17 May 2022 17:51:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nr1Lp-00029h-Mf
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 17:51:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nr1Lp-00015e-9D; Tue, 17 May 2022 17:51:17 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227] helo=[10.95.147.55])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nr1Lp-0000P6-2t; Tue, 17 May 2022 17:51:17 +0000
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
	bh=uiHi4V+i15cuTqOokjchtGZX18UqSzhLGnwSdDAe9eI=; b=dgYb8PREkzHWYXkVRmlH2I+ki+
	jzrK9J9kR5OHC1VFZmgeA+yEzdSxDFpoFwG7lUjnjp0RdOOyakt1bySczFKEB4XJVJEjhbcWzmQdH
	Q4JdQLPWwLNpLpGWjJVHnXUA/ESS6YR1Ub/CeDV+W4VIiUq63vVuO9rFqNp95UkfhjVw=;
Message-ID: <6a741494-bab9-3679-8bfa-155d2b591ae1@xen.org>
Date: Tue, 17 May 2022 18:51:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [XEN][RFC PATCH v3 04/14] libfdt: overlay: change
 overlay_get_target()
To: Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com,
 volodymyr_babchuk@epam.com
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-5-fnu.vikram@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220308194704.14061-5-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 08/03/2022 19:46, Vikram Garhwal wrote:
> Rename overlay_get_target() to fdt_overlay_target_offset() and remove static
> function type.
> 
> This is done to get the target path for the overlay nodes which is very useful
> in many cases. For example, Xen hypervisor needs it when applying overlays
> because Xen needs to do further processing of the overlay nodes, e.g. mapping of
> resources(IRQs and IOMMUs) to other VMs, creation of SMMU pagetables, etc.
> 
> This commit is also applied to git://github.com/dgibson/dtc:

NIT: I have tried to use this URL and git clone got stuck. Looking at 
github, they don't seem to list the git:// version. So maybe use https://

>      commit: ad9cf6bde5b90d4c1e5a79a2803e98d6344c27d7.

We have introduced a tag Origin to help tracking commit from other 
project. The tag looks like:

Origin: <repository> <commit-id>

The commit-id is first the 12-characters of the commit ID.

Please also retain the tags:

     Message-Id: <1637204036-382159-2-git-send-email-fnu.vikram@xilinx.com>
     Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Cheers,

-- 
Julien Grall

