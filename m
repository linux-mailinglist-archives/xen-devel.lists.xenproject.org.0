Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3E364BEC4
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 22:45:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461238.719310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5D4r-0006f8-H9; Tue, 13 Dec 2022 21:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461238.719310; Tue, 13 Dec 2022 21:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5D4r-0006d4-EJ; Tue, 13 Dec 2022 21:44:41 +0000
Received: by outflank-mailman (input) for mailman id 461238;
 Tue, 13 Dec 2022 21:44:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5D4p-0006cy-Be
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 21:44:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5D4p-0004AL-9B
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 21:44:39 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5D4p-0001ew-4H; Tue, 13 Dec 2022 21:44:39 +0000
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
	bh=4HNjL+OHMW2gJM/h6kTzNG1P4lyBer7zcyLQRNkABTM=; b=6uuky+PdRpSGApD66pYNRivJgY
	ZtATHU8lOjiTyKp0HXDLWZpQHk7uOAu2W4tCubXWKa7eli4n5Yz68bfU34Ax0+5mQdyf2vFdIzOdv
	YllMAP+4VOPKeZzHx5E/PQI8loWLElQRQwBsdvQ6o39q2cv0aFVb+jqJ1JicHbx5ebn0=;
Message-ID: <46fefa9d-5bba-0738-2ea9-86c07fbcfde2@xen.org>
Date: Tue, 13 Dec 2022 21:44:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <214c9ec9-b948-1ca6-24d6-4e7f8852ac45@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH RFC 03/10] domain: GADDR based shared guest area
 registration alternative - teardown
In-Reply-To: <214c9ec9-b948-1ca6-24d6-4e7f8852ac45@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/10/2022 08:40, Jan Beulich wrote:
> In preparation of the introduction of new vCPU operations allowing to
> register the respective areas (one of the two is x86-specific) by
> guest-physical address, add the necessary domain cleanup hooks.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: Zapping the areas in pv_shim_shutdown() may not be strictly
>       necessary: Aiui unmap_vcpu_info() is called only because the vCPU
>       info area cannot be re-registered. Beyond that I guess the
>       assumption is that the areas would only be re-registered as they
>       were before. If that's not the case I wonder whether the guest
>       handles for both areas shouldn't also be zapped.

I don't know the code enough to be able to answer it.

The code itself looks good to me. With one remark below:

Reviewed-by: Julien Grall <jgrall@amazon.com>

[...]

> @@ -1555,6 +1559,15 @@ void unmap_vcpu_info(struct vcpu *v)
>       put_page_and_type(mfn_to_page(mfn));
>   }
>   
> +/*
> + * This is only intended to be used for domain cleanup (or more generally only
> + * with at least the respective vCPU, if it's not the current one, reliably
> + * paused).
> + */
> +void unmap_guest_area(struct vcpu *v, struct guest_area *area)
> +{

IIUC, you will add the ASSERT() we discussed in patch #7 in this patch. 
I would be fine if you keep my reviewed-by.

Cheers,

-- 
Julien Grall

