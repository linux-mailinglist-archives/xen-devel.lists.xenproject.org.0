Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DEDA36D1B
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 10:47:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889371.1298501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjElD-0004hN-Am; Sat, 15 Feb 2025 09:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889371.1298501; Sat, 15 Feb 2025 09:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjElD-0004fT-8A; Sat, 15 Feb 2025 09:46:55 +0000
Received: by outflank-mailman (input) for mailman id 889371;
 Sat, 15 Feb 2025 09:46:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tjElB-0004fN-C0
 for xen-devel@lists.xenproject.org; Sat, 15 Feb 2025 09:46:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tjElB-0030Qr-0L;
 Sat, 15 Feb 2025 09:46:52 +0000
Received: from [2a02:8012:3a1:0:c076:8426:eb1f:4b85]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tjElA-001Vb0-24;
 Sat, 15 Feb 2025 09:46:52 +0000
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
	bh=ES29oepUPsLxR2IZMEDp+0wu9EOrw0kAUKvEJsRvLDI=; b=AXsW/oAADeX+oiBgziS2xtlz1v
	kDqoTW0Wc4x87eanBITkHXPPd5IXS/OmcfrgTRGziPcm/7x0Dtpcf+4PWuTACqbKc++B/yoFuIxFF
	nhZvff8G9xkLLjlAG7MeQOzO175vFS7I5sUBPMYNgiXqoNtHgfNR2Fb8ZlJS5ea8noSI=;
Message-ID: <c8876005-13c1-428d-91be-cfd437249092@xen.org>
Date: Sat, 15 Feb 2025 09:46:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] xen: arm: enable stack protector feature
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250213220021.2897526-1-volodymyr_babchuk@epam.com>
 <20250213220021.2897526-4-volodymyr_babchuk@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250213220021.2897526-4-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

On 13/02/2025 22:00, Volodymyr Babchuk wrote:
> Enable previously added CONFIG_STACK_PROTECTOR feature for ARM
> platform. Initialize stack protector very early, at the very beginning
> of start_xen() function.

It would be worth explaining why this needs to be called very early 
given we have a default stack guard value. AFAIK, the only requirement 
is to have this enabled before we bring up any secondary CPUs.

This would be useful information if we decide to re-order the init code.

> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

With the remark above:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


