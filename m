Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AEE4749AB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 18:37:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246985.425989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBjX-0004Dv-UQ; Tue, 14 Dec 2021 17:36:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246985.425989; Tue, 14 Dec 2021 17:36:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBjX-0004B8-R4; Tue, 14 Dec 2021 17:36:59 +0000
Received: by outflank-mailman (input) for mailman id 246985;
 Tue, 14 Dec 2021 17:36:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxBjW-0004B2-76
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 17:36:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxBjV-0005A0-Kf; Tue, 14 Dec 2021 17:36:57 +0000
Received: from [54.239.6.190] (helo=[192.168.26.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxBjV-0006pt-Dz; Tue, 14 Dec 2021 17:36:57 +0000
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
	bh=OC7sxcFPGkiDzQI1wEyryA9hcrz9jfCs4oCwHco0SoI=; b=Fb3e9Oi6Zsyg9+bOSl9grOum0/
	vx97KNkXggQ5THJlrFUIPbj7OcEzqE64tQtdLg7pC87JVHIiy7oVU4YJLm2ryiT43x6O/Bo53fjRn
	Lo/vrC5BHNMb5D6toDIsfN9NrF73pPS1jxXymfgOjGkESwS492VwmTzpViwYaUGa3zYY=;
Message-ID: <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org>
Date: Tue, 14 Dec 2021 17:36:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v3 02/13] xen: harmonize return types of hypercall
 handlers
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>
References: <20211208155606.20029-1-jgross@suse.com>
 <20211208155606.20029-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211208155606.20029-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/12/2021 15:55, Juergen Gross wrote:
> Today most hypercall handlers have a return type of long, while the
> compat ones return an int. There are a few exceptions from that rule,
> however.

So on Arm64, I don't think you can make use of the full 64-bit because a 
32-bit domain would not be able to see the top 32-bit.

In fact, this could potentially cause us some trouble (see [1]) in Xen.
So it feels like the hypercalls should always return a 32-bit signed 
value on Arm.

The other advantage is it would be clear that the top 32-bit are not 
usuable. Stefano, what do you think?

> 
> Get rid of the exceptions by letting compat handlers always return int
> and others always return long.
> 
> For the compat hvm case use eax instead of rax for the stored result as
> it should have been from the beginning.
> 
> Additionally move some prototypes to include/asm-x86/hypercall.h
> as they are x86 specific. Move the do_physdev_op() prototype from both
> architecture dependant headers to the common one. Move the
> compat_platform_op() prototype to the common header.
> 
> Switch some non style compliant types (u32, s32, s64) to style compliant
> ones.

TBH, I think this should have been split because the modifications are 
done on lines that are untouched.

The extra patch would have made the review easier (even if this patch is 
still quite small).

> 
> Rename paging_domctl_continuation() to do_paging_domctl_cont() and add
> a matching define for the associated hypercall.
> 
> Make do_callback_op() and compat_callback_op() more similar by adding
> the const attribute to compat_callback_op()'s 2nd parameter.
> 
> Change the type of the cmd parameter for [do|compat]_kexec_op() to
> unsigned int, as this is more appropriate for the compat case.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Cheers,

[1] [1] 
https://lore.kernel.org/xen-devel/20211206142032.27536-1-michal.orzel@arm.com/

-- 
Julien Grall

