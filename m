Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677E67F5CA9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 11:41:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639525.997022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r678q-00067z-BS; Thu, 23 Nov 2023 10:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639525.997022; Thu, 23 Nov 2023 10:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r678q-00064X-8a; Thu, 23 Nov 2023 10:41:04 +0000
Received: by outflank-mailman (input) for mailman id 639525;
 Thu, 23 Nov 2023 10:41:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r678o-00064P-Pf
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 10:41:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r678o-0007bz-81; Thu, 23 Nov 2023 10:41:02 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.119]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r678o-0006sY-0W; Thu, 23 Nov 2023 10:41:02 +0000
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
	bh=TPEMQialDu/qCDDuF7GqwHtQOTUz7GPkGLINYXpUtMg=; b=e5fYQz15jXYiPfZ6LQrKv6WoDz
	q3wSR10sWUfPkBoVGxk41xsSYw9+DkJRfz4xKSYE9i+gJFhVJb6eMnLRtjPILHJGvcOvvtXISb4zv
	nIHw5x4LX8bPnIntbPIZq/HWqOXq0hZG8H9xyjOKsvqvzAF30W9ABteWvOWTPEbBTWsk=;
Message-ID: <3e848cc5-622a-4a5f-bbb5-8a4455975283@xen.org>
Date: Thu, 23 Nov 2023 10:40:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm/efi: Simplify efi_arch_handle_cmdline()
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
 <20231121201540.1528161-5-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231121201540.1528161-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 21/11/2023 20:15, Andrew Cooper wrote:
> -Wwrite-strings is unhappy with assigning "xen" to a mutable pointer, but this
> logic looks incorrect.  It was inherited from the x86 side, where the logic
> was redundant and has now been removed.
> 
> In the ARM case it inserts the image name into "xen,xen-bootargs" and there is
> no logic at all to strip this before parsing it as the command line.
> 
> The absence of any logic to strip an image name suggests that it shouldn't
> exist there, or having a Xen image named e.g. "hmp-unsafe" in the filesystem
> is going to lead to some unexpected behaviour on boot.

I have noticed this behavior a few years ago but never really looked why 
  we added the name. So thanks for looking at it.

> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

