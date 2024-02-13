Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B2C8538C8
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 18:40:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680112.1057981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZwlg-0007cU-JS; Tue, 13 Feb 2024 17:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680112.1057981; Tue, 13 Feb 2024 17:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZwlg-0007a9-Gk; Tue, 13 Feb 2024 17:40:28 +0000
Received: by outflank-mailman (input) for mailman id 680112;
 Tue, 13 Feb 2024 17:40:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rZwle-0007a3-VR
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 17:40:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rZwld-0004XT-Kd; Tue, 13 Feb 2024 17:40:25 +0000
Received: from [15.248.2.25] (helo=[10.24.67.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rZwld-0001OJ-Ad; Tue, 13 Feb 2024 17:40:25 +0000
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
	bh=dqFCjYFXnPyxVCcP1xlWDNnuPp5d/WLL6xFEIoLefso=; b=1YrEfDIUxU0+YJ8PL4SHmJK3Jb
	DZE0BmwpZgEppVxEklWSxaNKSUOd4OUC3cYGN7DtHmed09dn7L70GRiRAi5Mk/byXQeu1MbvZ4xmS
	wE0orfrnO/kDdeW5tfr2mGT1NNA9BxflbLMXheiWeFnG0qKNFbIsJ4PVfforkWsSz0dk=;
Message-ID: <e12914b8-5c6a-4085-b5e8-03c5bdcc2c27@xen.org>
Date: Tue, 13 Feb 2024 17:40:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/7] xen/asm-generic: introduce stub header monitor.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
 <84568b0c24a5ec96244f3f34537e9a148367facf.1707499278.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <84568b0c24a5ec96244f3f34537e9a148367facf.1707499278.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 09/02/2024 18:00, Oleksii Kurochko wrote:
> The header is shared between several archs so it is
> moved to asm-generic.
> 
> Switch partly Arm and PPC to asm-generic/monitor.h and only
> arch_monitor_get_capabilities() left in arch-specific/monitor.h.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
> ---
> Changes in V8:
>   - Add Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
> ---
> Changes in V7:
>   - Drop definition of arch_monitor_domctl_event for PPC.
>   - define arch_monitor_domctl_event in asm-generic/monitor.h.
>   - add "define HAS_ARCH_MONITOR_DOMCTL_EVENT" in arm/.../monitor.h as it has arch specific implementation.
> ---
> Changes in V6:
>   - Rebase only.
> ---
> Changes in V5:
>    - Switched partly Arm and PPC to asm-generic monitor.h only
>      arch_monitor_get_capabilities() left in arch-specific/monitor.h.
>    - Updated the commit message.
> ---
> Changes in V4:
>   - Removed the double blank line.
>   - Added Acked-by: Jan Beulich <jbeulich@suse.com>.
>   - Update the commit message
> ---
> Changes in V3:
>   - Use forward-declaration of struct domain instead of " #include <xen/sched.h> ".
>   - Add ' include <xen/errno.h> '
>   - Drop PPC's monitor.h.
> ---
> Changes in V2:
> 	- remove inclusion of "+#include <public/domctl.h>"
> 	- add "struct xen_domctl_monitor_op;"
> 	- remove one of SPDX tags.
> ---
>   xen/arch/arm/include/asm/monitor.h | 25 +-----------
>   xen/arch/ppc/include/asm/monitor.h | 28 +------------

Looking at MAINTAINERS, monitor.h was covered by "VM EVENT, MEM ACCESS 
and MONITOR". As you move to ...

>   xen/arch/ppc/stubs.c               |  8 ----
>   xen/include/asm-generic/monitor.h  | 64 ++++++++++++++++++++++++++++++

... asm-generic/, I believe it will now fall under "THE REST". So I 
think MAINTAINERS needs to be updated to also cover asm-generic/monitor.h.

Looking at what was already committed, I think asm-generic/vm_event.h 
should also be added in MAINTAINERS. Can you send a separate patch for that?

Cheers,

-- 
Julien Grall

