Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A852C6F70
	for <lists+xen-devel@lfdr.de>; Sat, 28 Nov 2020 12:15:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39925.72957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiyBU-0007ke-ET; Sat, 28 Nov 2020 11:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39925.72957; Sat, 28 Nov 2020 11:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiyBU-0007kF-BR; Sat, 28 Nov 2020 11:14:32 +0000
Received: by outflank-mailman (input) for mailman id 39925;
 Sat, 28 Nov 2020 11:14:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kiyBT-0007kA-KE
 for xen-devel@lists.xenproject.org; Sat, 28 Nov 2020 11:14:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kiyBR-0004ip-1p; Sat, 28 Nov 2020 11:14:29 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kiyBQ-00041b-Pn; Sat, 28 Nov 2020 11:14:28 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=l6Zt80HSdZpb46yg8WFz7BJxgkfut/ni9w1dWOSSvmg=; b=f8HAai3TUXXp5cpnFI5rYc37IH
	V+3LJG9CyrgM5cqbeI+/DMlyfE52slHEdBAyZGBltQm3lN1lxWlPex2LDfXfI6Zp1WZ5t26tN4smy
	NuHXO1jQXAzmGDyNh52YyYDJ0+/ujTndvP6bb8RuOW3iJf8FEr4GHDrLXNymOAjH83cI=;
Subject: Re: [PATCH RFC 1/6] xen/arm: mm: Remove special case for CPU0 in
 dump_hyp_walk()
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Julien Grall <jgrall@amazon.com>
References: <20201119190751.22345-1-julien@xen.org>
 <20201119190751.22345-2-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <3a783a3d-4c4d-f107-1583-16f04fe76ae0@xen.org>
Date: Sat, 28 Nov 2020 11:14:26 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201119190751.22345-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 19/11/2020 19:07, Julien Grall wrote:
> From: Stefano Stabellini <sstabellini@kernel.org>
> 
> There is no need to have a special case for CPU0 when converting the
> page-table virtual address into a physical address. The helper
> virt_to_maddr() is able to translate any address as long as the root
> page-tables is mapped in the virtual address. This is the case for all
> the CPUs at the moment.
> 
> So use the same BUG_ON() regardless the CPU.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> [julien: Rework the commit message]
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> I went back through the conversation in [1] regarding the issue when
> loading Xen below 2MB on Arm32. The example provided is wrong because to
> find the physical address, we need to add 'phys_offset', not substract.
> 
> So I removed the comment regarding the code was buggy.
> 
> [1] https://marc.info/?l=xen-devel&m=157081398022401

Stefano, can you confirm that you are happy with the new commit message?

Cheers,

-- 
Julien Grall

