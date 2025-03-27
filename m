Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F53AA734F9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 15:50:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929512.1332217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txoY3-0005hr-RS; Thu, 27 Mar 2025 14:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929512.1332217; Thu, 27 Mar 2025 14:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txoY3-0005fa-OP; Thu, 27 Mar 2025 14:49:35 +0000
Received: by outflank-mailman (input) for mailman id 929512;
 Thu, 27 Mar 2025 14:49:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1txoY1-0005fU-SU
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 14:49:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1txoY1-00BqFN-0t;
 Thu, 27 Mar 2025 14:49:33 +0000
Received: from [15.248.2.232] (helo=[10.24.66.240])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1txoY1-001oYV-0A;
 Thu, 27 Mar 2025 14:49:33 +0000
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
	bh=mIG8unSEZJF49ZqJfHBmX5KZnZ3MEop0BjwSI4pTdfY=; b=S+mxAMeNT3Qrn0gRmPZcWfMCsC
	32PMhcFFd9mxhsRpvpVQ6ElAFhGwJK1QUhrLbaojba9W7Geowe2JX4ybRoHyOJhG74IPmVKU3mE8j
	scJPAaYs9gaylTSSixEmokAczY6v/GOf+NxmIadBJjbPEUemAboFllFKFEWvf83SIVJ4=;
Message-ID: <89043421-49b5-40cc-91c8-f4cd7dd2f6d1@xen.org>
Date: Thu, 27 Mar 2025 14:49:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] trace: convert init_trace_bufs() to constructor
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <e1e556c4-ed71-41f7-acfc-b7fa866a0d3e@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e1e556c4-ed71-41f7-acfc-b7fa866a0d3e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 13/03/2025 13:38, Jan Beulich wrote:
> There's no need for each arch to invoke it directly, and there's no need
> for having a stub either. With the present placement of the calls to
> init_constructors() it can easily be a constructor itself.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> Same could then apparently be done for heap_init_late(). Thoughts?

Looking at the code, I couldn't figure out whether any of the 
constructors may rely on some changes done by heap_init_late().

The only issue I can think of is scrubbing. In the case it is 
synchronous, would the memory allocated before hand be scrubbed?

Cheers,

-- 
Julien Grall


