Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB39B1EDA6
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 19:10:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074898.1437373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukQbj-0005kW-8B; Fri, 08 Aug 2025 17:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074898.1437373; Fri, 08 Aug 2025 17:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukQbj-0005ir-5W; Fri, 08 Aug 2025 17:10:19 +0000
Received: by outflank-mailman (input) for mailman id 1074898;
 Fri, 08 Aug 2025 17:10:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ukQbh-0005il-Jr
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 17:10:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ukQbh-008358-02;
 Fri, 08 Aug 2025 17:10:17 +0000
Received: from [2a02:8012:3a1:0:a91b:b567:8726:98f7]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ukQbg-009MZF-2d;
 Fri, 08 Aug 2025 17:10:16 +0000
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
	bh=Risfi83inZ5256jtnn+XLkdIpym8WWNbCkv3WmHFzPQ=; b=0sNmpZzcHPATnhHPJrfhnqrzsY
	6ZZIneIXJweW+KXUA5U/Qvr5sua8AOHGzHr1Y87pRE/cYIrkBkQodY5IjhPzMKT7G8biDnOirRSlD
	5dPpnaD+y8o8EntOQE9ENj528fTxpRp9YXTMgq2tVSaMlWwsKboR9yLrd2SSZHABjDfE=;
Message-ID: <f6631efb-8929-4c5e-8e20-7aec4ff84574@xen.org>
Date: Fri, 8 Aug 2025 18:10:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] kconfig: turn PDX compression into a choice
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>
References: <20250805095257.74975-1-roger.pau@citrix.com>
 <20250805095257.74975-2-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250805095257.74975-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 05/08/2025 10:52, Roger Pau Monne wrote:
> Rename the current CONFIG_PDX_COMPRESSION to CONFIG_PDX_MASK_COMPRESSION,
> and make it part of the PDX compression choice block, in preparation for
> adding further PDX compression algorithms.
> 
> The PDX compression defaults should still be the same for all
> architectures, however the choice block cannot be protected under EXPERT
> and still have a default choice being unconditionally selected.  As a
> result, the new "PDX (Page inDeX) compression" item will be unconditionally
> visible in Kconfig, even on architectures like x86 that previously had no
> way to enable PDX compression.
> 
> As part of this preparation work to introduce new PDX compressions, adjust
> some of the comments on pdx.h to note they apply to a specific PDX
> compression.  Also shuffle function prototypes and dummy implementations
> around to make it easier to introduce a new PDX compression.  Note all
> PDX compression implementations are expected to provide a
> pdx_is_region_compressible() that takes the same set of arguments.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


