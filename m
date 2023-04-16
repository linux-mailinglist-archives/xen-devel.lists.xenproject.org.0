Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7156E395E
	for <lists+xen-devel@lfdr.de>; Sun, 16 Apr 2023 16:38:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521588.810367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po3Vy-0007t9-Fs; Sun, 16 Apr 2023 14:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521588.810367; Sun, 16 Apr 2023 14:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po3Vy-0007qR-D1; Sun, 16 Apr 2023 14:38:02 +0000
Received: by outflank-mailman (input) for mailman id 521588;
 Sun, 16 Apr 2023 14:38:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1po3Vw-0007qL-Fh
 for xen-devel@lists.xenproject.org; Sun, 16 Apr 2023 14:38:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1po3Vw-00056L-7B; Sun, 16 Apr 2023 14:38:00 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.23.18]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1po3Vw-0000N0-1B; Sun, 16 Apr 2023 14:38:00 +0000
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
	bh=0u4RjbN6qXFZNpjJVhhdtHZg4RuQj4KR2WWQfd6YgLU=; b=IxCmwu++Kds5D9kODzrQLGdv6X
	mtEAzCuRR1zHF07Re0hZF2rbBstlZxyvDTTnah7VjSrusiQECIS0vnFYm9E6Z+BNEAU46KRzuS5n2
	M5Bz+qL14Ys3I7RL7i6dJxe9AdRdoaZ3M+43zIOsj6aQnIJttGxUPWiWp1vhuJ5KasL8=;
Message-ID: <5faadbe5-d019-3fe0-eedc-4e07f86b38ce@xen.org>
Date: Sun, 16 Apr 2023 15:37:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 3/4] xen/arm: Defer GICv2 CPU interface mapping until
 the first access
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230328071334.2098429-1-Henry.Wang@arm.com>
 <20230328071334.2098429-4-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230328071334.2098429-4-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 28/03/2023 08:13, Henry Wang wrote:
> Currently, the mapping of the GICv2 CPU interface is created in
> arch_domain_create(). This causes some troubles in populating and
> freeing of the domain P2M pages pool. For example, a default 16
> P2M pages are required in p2m_init() to cope with the P2M mapping
> of 8KB GICv2 CPU interface area, and these 16 P2M pages would cause
> the complexity of P2M destroy in the failure path of
> arch_domain_create().
> 
> As per discussion in [1], similarly as the MMIO access for ACPI, this
> patch defers the GICv2 CPU interface mapping until the first MMIO
> access. This is achieved by moving the GICv2 CPU interface mapping
> code from vgic_v2_domain_init()/vgic_v2_map_resources() to the
> stage-2 data abort trap handling code. The original CPU interface
> size and virtual CPU interface base address is now saved in
> `struct vgic_dist` instead of the local variable of
> vgic_v2_domain_init()/vgic_v2_map_resources().
> 
> Take the opportunity to unify the way of data access using the
> existing pointer to struct vgic_dist in vgic_v2_map_resources() for
> new GICv2.
> 
> Since gicv2_map_hwdom_extra_mappings() happens after domain_create(),
> so there is no need to map the extra mappings on-demand, and therefore
> keep the hwdom extra mappings as untouched.
> 
> [1] https://lore.kernel.org/xen-devel/e6643bfc-5bdf-f685-1b68-b28d341071c1@xen.org/
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

