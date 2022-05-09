Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E105204A1
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 20:38:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324755.546952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no8Gw-0000KP-9w; Mon, 09 May 2022 18:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324755.546952; Mon, 09 May 2022 18:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no8Gw-0000IR-5f; Mon, 09 May 2022 18:38:18 +0000
Received: by outflank-mailman (input) for mailman id 324755;
 Mon, 09 May 2022 18:38:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1no8Gu-0000Gh-Oc
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 18:38:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1no8Gs-0003Qs-Jc; Mon, 09 May 2022 18:38:14 +0000
Received: from [54.239.6.187] (helo=[192.168.22.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1no8Gs-0006cG-Co; Mon, 09 May 2022 18:38:14 +0000
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
	bh=tAY/67Q+Kq7e/CWJjPVJjGE18LY2xrMUriNunhgLuGc=; b=SQF+au6AousHCyi9SpNgfwDx5h
	6pk/J9Kn2DNr2yLlNoH87VIH+7D/5CMOHthzHlu1+G0Zoqzeskosfy+KxkcZofdKJTaUcG9MthCpq
	sPpurjNO8kaSy+Chj1dIVwCVfXG21d3OAeZavVS6si6ti1IizoNlah08kKyIRFnt9oSI=;
Message-ID: <abad832f-9007-d056-f280-c7463d80eed3@xen.org>
Date: Mon, 9 May 2022 19:38:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v6 1/2] xsm: create idle domain privileged and demote
 after setup
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Cc: scott.davis@starlab.io, jandryuk@gmail.com, christopher.clark@starlab.io,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220503111731.12642-1-dpsmith@apertussolutions.com>
 <20220503111731.12642-2-dpsmith@apertussolutions.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220503111731.12642-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 03/05/2022 12:17, Daniel P. Smith wrote:
> There are new capabilities, dom0less and hyperlaunch, that introduce internal
> hypervisor logic which needs to make resource allocation calls that are
> protected by XSM access checks. This creates an issue as a subset of the
> hypervisor code is executed under a system domain, the idle domain, that is
> represented by a per-CPU non-privileged struct domain. To enable these new
> capabilities to function correctly but in a controlled manner, this commit
> changes the idle system domain to be created as a privileged domain under the
> default policy and demoted before transitioning to running. A new XSM hook,
> xsm_set_system_active(), is introduced to allow each XSM policy type to demote
> the idle domain appropriately for that policy type. In the case of SILO, it
> inherits the default policy's hook for xsm_set_system_active().
> 
> For flask a stub is added to ensure that flask policy system will function
> correctly with this patch until flask is extended with support for starting the
> idle domain privileged and properly demoting it on the call to
> xsm_set_system_active().
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> ---
>   xen/arch/arm/setup.c    |  4 ++++
>   xen/arch/x86/setup.c    |  5 +++++
>   xen/common/sched/core.c |  7 ++++++-
>   xen/include/xsm/dummy.h | 17 +++++++++++++++++
>   xen/include/xsm/xsm.h   |  6 ++++++
>   xen/xsm/dummy.c         |  1 +
>   xen/xsm/flask/hooks.c   | 23 +++++++++++++++++++++++
>   7 files changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index d5d0792ed4..39a654926d 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -1048,6 +1048,10 @@ void __init start_xen(unsigned long boot_phys_offset,
>       /* Hide UART from DOM0 if we're using it */
>       serial_endboot();
>   
> +    if ( (rc = xsm_set_system_active()) != 0 )
> +        panic("xsm(err=%d): "
> +              "unable to set hypervisor to SYSTEM_ACTIVE privilege\n", rc);

We usually don't split error message over multiple lines (even if they 
are over 80 characters).

> +
>       system_state = SYS_STATE_active;
>   
>       for_each_domain( d )
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 6f20e17892..36a60ce884 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -620,6 +620,11 @@ static void noreturn init_done(void)
>   {
>       void *va;
>       unsigned long start, end;
> +    int err;
> +
> +    if ( (err = xsm_set_system_active()) != 0 )
> +        panic("xsm(err=%d): "
> +              "unable to set hypervisor to SYSTEM_ACTIVE privilege\n", err);

Same here.

Other than the two remarks above and Luca's one:

Acked-by: Julien Grall <jgrall@amazon.com> # arm

Cheers,

-- 
Julien Grall

