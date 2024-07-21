Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42850938425
	for <lists+xen-devel@lfdr.de>; Sun, 21 Jul 2024 11:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761376.1171338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVSSh-00036J-3U; Sun, 21 Jul 2024 09:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761376.1171338; Sun, 21 Jul 2024 09:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVSSh-000348-0F; Sun, 21 Jul 2024 09:02:35 +0000
Received: by outflank-mailman (input) for mailman id 761376;
 Sun, 21 Jul 2024 09:02:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sVSSf-000342-1b
 for xen-devel@lists.xenproject.org; Sun, 21 Jul 2024 09:02:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sVSSe-0002bd-BE; Sun, 21 Jul 2024 09:02:32 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sVSSe-0006xg-2r; Sun, 21 Jul 2024 09:02:32 +0000
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
	bh=jJJglVn+D8ES6A0X9VS1zYpwfNBwTUhTj9ffjNQISe0=; b=fxg2tJG8K3q5Ui+zWQfrDukXW/
	Tgfy27E8l35uoT1Apv3YpysYcqu8WFyPMT8r+k714SY9Tm27IWUIFtcGsGOJY/mOGH7CDqOgwPUZ5
	CZoZCyr6ATMN5GTk4Uhws89t6jfu3VkDewmLXEBMEiZLR2mhKfE540QOrDDqTMVH4IsU=;
Message-ID: <5187f606-0a1c-4812-8f8c-13301f0aba8c@xen.org>
Date: Sun, 21 Jul 2024 10:02:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] xen/riscv: introduce generic Xen page table
 handling
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <f2d7f538edb7db8990bf26b791df9da3d390bf05.1720799926.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f2d7f538edb7db8990bf26b791df9da3d390bf05.1720799926.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/07/2024 17:22, Oleksii Kurochko wrote:
> At least, between Arm and RISC-V most of the code related to Xen page
> table handling are common.
> 
> This GENERIC_PT code is based on Arm's arm/mmu/pt.c except some minor
> changes such as introduction of the following functions:
>    * get_root_page()
>    * xen_pt_check_contig()
>    * set_pte_table_bit()
>    * sanity_arch_specific_pte_checks()
>    * get_contig_bit()
>    * set_pte_permissions()
>    * flush_xen_tlb_range_va()
> It was done because not every functions has the generic pte_flags and
> it could be a different positions of the PTE bits in a PTE.
While I am always in favor of trying to avoid code duplication, I am not 
sure the page-tables are one that should be.

For instance, you don't have the concept of contiguous page in RISC-V (I 
see you introduce dummy flags, but IMHO this is a bit of a hack). All 
the code was also written in a way to avoid temporary conflict mappings. 
This is to avoid using Break-Before-Make. But on newer hardware this 
could be relaxed.

I am interested to know what the others thinks.

Cheers,

-- 
Julien Grall

