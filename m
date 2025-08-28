Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F0EB39C9B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 14:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098620.1452625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbWU-0001qI-G2; Thu, 28 Aug 2025 12:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098620.1452625; Thu, 28 Aug 2025 12:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbWU-0001op-DR; Thu, 28 Aug 2025 12:14:34 +0000
Received: by outflank-mailman (input) for mailman id 1098620;
 Thu, 28 Aug 2025 12:14:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1urbWT-0001oj-IZ
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 12:14:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1urbWT-00AuSq-02;
 Thu, 28 Aug 2025 12:14:33 +0000
Received: from [15.248.2.24] (helo=[10.24.67.148])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1urbWT-005lcG-02;
 Thu, 28 Aug 2025 12:14:33 +0000
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
	bh=jOTzAeGVYjpq5jUAsknJhDwW82hwsLFiSmK2taft3WA=; b=f2B8dEgolqrOHFnoEojlCb/44p
	6HdxPf9gJH7UDJx9gk+jGZ+WXOgmp1aaEIsiTdDemo6dzZqkV9aShST5aZjvpho0Y/X5CAXvYZBhd
	MFJmmWF7WsnAS++Ent3GZE8C4Vzxr1XGOFx/7d4clJ/VATs8uOTIeRSIviDSjlD3Xi1M=;
Message-ID: <de8af641-6b65-4cb6-9ae8-64ada41dc8f9@xen.org>
Date: Thu, 28 Aug 2025 13:14:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] xen/arm: vgic: implement helper functions for
 virq checks
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "olekstysh@gmail.com" <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
 <65b148aea56b1a35fa061b0d8284584da97153a9.1756317702.git.leonid_komarianskyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <65b148aea56b1a35fa061b0d8284584da97153a9.1756317702.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leonid,

On 27/08/2025 19:24, Leonid Komarianskyi wrote:
> Introduced two new helper functions for vGIC: vgic_is_valid_line and
> vgic_is_spi. The functions are similar to the newly introduced
> gic_is_valid_line and gic_is_spi, but they verify whether a vIRQ
> is available for a specific domain, while GIC-specific functions
> validate INTIDs for the real GIC hardware. For example, the GIC may
> support all 992 SPI lines, but the domain may use only some part of them
> (e.g., 640), depending on the highest IRQ number defined in the domain
> configuration. Therefore, for vGIC-related code and checks, the
> appropriate functions should be used. Also, updated the appropriate
> checks to use these new helper functions.
> 
> The purpose of introducing new helper functions for vGIC is essentially
> the same as for GIC: to avoid potential confusion with GIC-related
> checks and to consolidate similar code into separate functions, which
> can be more easily extended by additional conditions, e.g., when
> implementing extended SPI interrupts.
> 
> Only the validation change in vgic_inject_irq may affect existing
> functionality, as it currently checks whether the vIRQ is less than or
> equal to vgic_num_irqs. Since IRQ indexes start from 0 (where 32 is the
> first SPI), the check should behave consistently with similar logic in
> other places and should check if the vIRQ number is less than
> vgic_num_irqs. The remaining changes, which replace open-coded checks
> with the use of these new helper functions, do not introduce any
> functional changes, as the helper functions follow the current vIRQ
> index verification logic.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


