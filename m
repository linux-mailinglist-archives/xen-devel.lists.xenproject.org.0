Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1835606851
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 20:40:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427040.675871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olaSN-0002lg-Dq; Thu, 20 Oct 2022 18:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427040.675871; Thu, 20 Oct 2022 18:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olaSN-0002jj-B6; Thu, 20 Oct 2022 18:39:51 +0000
Received: by outflank-mailman (input) for mailman id 427040;
 Thu, 20 Oct 2022 18:39:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1olaSM-0002jd-NL
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 18:39:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olaSM-0006cg-8h; Thu, 20 Oct 2022 18:39:50 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olaSM-0000kc-2l; Thu, 20 Oct 2022 18:39:50 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=ApSeXlvRr6kjjbP2G5Q/MYoHG0NT4WzHgyAqDG3LpHw=; b=Z4/Yq4HRjjMMt49UPQbHlyd3nH
	IE7WmCtFS2kziVPQyh07RZwVWYWRnK1/IO62m1JV/qDktOdfCMuOXcyHH7wTRE5wXFYXY4XA7HAo6
	vSTCiOLuFgB0VL30ZzySeYN1x2yfdAUiQslUZaVrWpc3yiuV+PXb6MmARJP3/J8QAQVM=;
Message-ID: <60cd3b64-3b3e-f650-741e-8e09e2ddab38@xen.org>
Date: Thu, 20 Oct 2022 19:39:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>
References: <81c08d76-0937-32d1-c6ac-439c4bf33883@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3][4.17] EFI: don't convert memory marked for runtime use
 to ordinary RAM
In-Reply-To: <81c08d76-0937-32d1-c6ac-439c4bf33883@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

Sorry I missed this patch.

On 11/10/2022 10:41, Jan Beulich wrote:
> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
> higher priority than the type of the range. To avoid accessing memory at
> runtime which was re-used for other purposes, make
> efi_arch_process_memory_map() follow suit. While in theory the same would
> apply to EfiACPIReclaimMemory, we don't actually "reclaim" or clobber
> that memory (converted to E820_ACPI on x86) there (and it would be a bug
> if the Dom0 kernel tried to reclaim the range, bypassing Xen's memory
> management, plus it would be at least bogus if it clobbered that space),
> hence that type's handling can be left alone.
> 
> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
> Fixes: facac0af87ef ("x86-64: EFI runtime code")
> Fixes: 6d70ea10d49f ("Add ARM EFI boot support")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

