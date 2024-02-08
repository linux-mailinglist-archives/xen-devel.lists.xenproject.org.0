Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7730684EB0D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 23:00:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678504.1055863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYCRZ-0004SZ-38; Thu, 08 Feb 2024 22:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678504.1055863; Thu, 08 Feb 2024 22:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYCRZ-0004Qi-0P; Thu, 08 Feb 2024 22:00:29 +0000
Received: by outflank-mailman (input) for mailman id 678504;
 Thu, 08 Feb 2024 22:00:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rYCRX-0004Qc-Qq
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 22:00:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rYCRW-0008SK-Dh; Thu, 08 Feb 2024 22:00:26 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rYCRW-00056e-61; Thu, 08 Feb 2024 22:00:26 +0000
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
	bh=xqIygMEEMqNnKk6z7W/Cg0G0pnuI7QEEgqbBRap4qYE=; b=ovQw6dY4et1496NnnQyfvAFG68
	FT0o/AFzPSCdsYRtDr2JGqVxWVI+mNXmv6HBWPHohdylsgGGE366JKHl2U5N2MVGtwBV+n4Bj8pxU
	8vxEBqyi4BVROl37vnnt4gHNXRUtgt0gcc2eXSVKu8rHX4sS5ixNN+LYPn0ZpZEBczSY=;
Message-ID: <b591cd2a-2b49-436e-9cf7-788d9064a778@xen.org>
Date: Thu, 8 Feb 2024 22:00:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] serial: fake IRQ-regs context in poll handlers
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
 <893be03d-22cc-4b8c-8a54-6479961c5aa2@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <893be03d-22cc-4b8c-8a54-6479961c5aa2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/02/2024 13:27, Jan Beulich wrote:
> In preparation of dropping the register parameters from
> serial_[rt]x_interrupt() and in turn from IRQ handler functions,
> register state needs making available another way for the few key
> handlers which need it. Fake IRQ-like state.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The use of guest_cpu_user_regs() in dbc_uart_poll() is inconsistent with
> other console poll functions we have, and it's unclear whether that's
> actually generally correct.

Is it? Looking at ns16550_poll() we would pass guest_user_regs() if 
run_in_exception() doesn't exist. But looking at the caller, no-on seems 
to care about the 'regs'. So is this just a latent bug?

BTW, do you have an idea why the poll function is not run in an 
exception handler?

> 
> Andrew suggested to move set_irq_regs() to BUGFRAME_run_fn handling;
> it's not clear to me whether that would be (a) correct from an abstract
> pov (that's exception, not interrupt context after all) 

I agree with that.

> and (b) really beneficial.

I guess this could help to reduce the amount of churn. I can't really 
make my mind whether this is worth it or not. So I would keep it as you did.

Cheers,

-- 
Julien Grall

