Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A6DB44F43
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 09:23:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111395.1460120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuQnD-0007cK-40; Fri, 05 Sep 2025 07:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111395.1460120; Fri, 05 Sep 2025 07:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuQnD-0007aN-0y; Fri, 05 Sep 2025 07:23:31 +0000
Received: by outflank-mailman (input) for mailman id 1111395;
 Fri, 05 Sep 2025 07:23:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uuQnC-0007aH-CF
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 07:23:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uuQnB-007pKi-2F;
 Fri, 05 Sep 2025 07:23:29 +0000
Received: from [2a02:8012:3a1:0:2cb0:b4e5:ef93:763c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uuQnB-00GiUT-2D;
 Fri, 05 Sep 2025 07:23:29 +0000
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
	bh=AtJ887wmxWLfsHZXOhrGSKBxCXzV07vT2QcFkyzVjsM=; b=qu84HmV9R4MjY1qt0Q4PTFJYHh
	pDNSprFE/Ang3KrcG29de4E/a3DsKIBAwtqV2dA0aqoroOy4lPxjVe9TnsnKiuDhD1ZP3HHxVihTc
	hhtwvjvtk/UtKcFqSK3vfhfqQOCV4uy96hPf7BjDwW+/BtBF8yKXLHSo4KgGiLBNl/+8=;
Message-ID: <ba5e55a9-8791-4488-b8d7-124506717f37@xen.org>
Date: Fri, 5 Sep 2025 08:23:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/12] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "olekstysh@gmail.com" <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
 <4a5c8a903c7b03716ea8c76b3e1dafd529a8684e.1757015865.git.leonid_komarianskyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4a5c8a903c7b03716ea8c76b3e1dafd529a8684e.1757015865.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leonid,

On 04/09/2025 21:01, Leonid Komarianskyi wrote:
> To properly deactivate physical eSPI routed to a domain and allow them to
> be retriggered after the initial trigger, the LR needs to be updated. The
> current implementation ignores interrupts outside the range specified by
> the mask 0x3FF, which only covers IRQ numbers up to 1023. To enable
> processing of eSPI interrupts, this patch updates the mask to 0x1FFF.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


