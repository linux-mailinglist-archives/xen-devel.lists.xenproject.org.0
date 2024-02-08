Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D6E84EB50
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 23:11:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678509.1055873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYCaq-0006CE-3W; Thu, 08 Feb 2024 22:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678509.1055873; Thu, 08 Feb 2024 22:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYCap-00067c-WD; Thu, 08 Feb 2024 22:10:04 +0000
Received: by outflank-mailman (input) for mailman id 678509;
 Thu, 08 Feb 2024 22:10:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rYCao-0005nd-43
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 22:10:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rYCan-0000BQ-6Z; Thu, 08 Feb 2024 22:10:01 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rYCan-0005XU-1O; Thu, 08 Feb 2024 22:10:01 +0000
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
	bh=Ahx8HJ9+2fDL1QsSyj6wZYq1mf3TI5yQerJobR7IVJg=; b=hr2M/ZU0ip6znJhYTkdVSpDZpe
	su+1kd453cjoJPby/y1DkUB1h2+fm19F9ra69PQhztjBFYhv9SSvDXfR5v1UYBEaVwA6RI552Sjap
	oLXuDHZ2rkqCfPZkG2c+etitvygVR9wz6c4xNP6Hupf4plwg1T8M80HjfOmrn/0Q4Fmo=;
Message-ID: <0bbe2028-946c-459f-b6cc-419869d22b35@xen.org>
Date: Thu, 8 Feb 2024 22:09:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] keyhandler: drop regs parameter from
 handle_keyregs()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
 <5258d8a9-a7ef-4342-9b5c-fc0078139bb2@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5258d8a9-a7ef-4342-9b5c-fc0078139bb2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/02/2024 13:28, Jan Beulich wrote:
> In preparation for further removal of regs parameters, drop it here. In
> the two places where it's actually needed, retrieve IRQ context if
> available, or else guest context.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> As an alternative to the new boolean parameter, I wonder if we couldn't
> special-case the idle vCPU case: It's only there where we would not have
> proper context retrievable via guest_cpu_user_regs().

I am trying to understand the implication. Looking at the code, it seems 
in the case where we pass NULL, we would expect to call 
run_in_exception_handler().

If I am not mistaken, at least for Arm, regs would not be the same as 
guest_cpu_user_regs(). So I think your current approach is more correct.

Did I miss anything?

Cheers,

-- 
Julien Grall

