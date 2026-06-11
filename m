Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nnymCas1K2o+4QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 00:24:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B375F6759A1
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 00:24:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xen.org header.s=20200302mail header.b=wcZQfg3i;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none
Received: from list by lists.xenproject.org with outflank-mailman.1336194.1598074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXnof-0007vK-Jm; Thu, 11 Jun 2026 22:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336194.1598074; Thu, 11 Jun 2026 22:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXnof-0007tJ-GO; Thu, 11 Jun 2026 22:24:01 +0000
Received: by outflank-mailman (input) for mailman id 1336194;
 Thu, 11 Jun 2026 22:24:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wXnoe-0007sz-Qf
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 22:24:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wXnob-004y0q-0T;
 Thu, 11 Jun 2026 22:23:56 +0000
Received: from [2a02:8012:3a1:0:51e8:2886:7874:ff19]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wXnoa-001tuw-0Y;
 Thu, 11 Jun 2026 22:23:56 +0000
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
	bh=JAjXi+ZrCjFY2J266ZrUbMCgFoT3yFFiliMAHJYti9g=; b=wcZQfg3idYWhUef05pC/KPEACE
	d7L+yncA3DIJaLCZpKvve7Vwb877FNEsM1G9YbFv190QJ3gx95kRf6NW6mQp+ABKmFQ3Ri/Ot6Wl1
	MkH65idCi5fT4cSpOh3KSFt+lBMnfmgiWDSViQTuiEnYkHzvvlPNV3Yv8AhB/yLfdAlc=;
Message-ID: <1fe76e3d-ad48-4b75-a690-accff86f0fd2@xen.org>
Date: Thu, 11 Jun 2026 23:23:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/sched: Link CPU topology to scheduler
Content-Language: en-GB
To: Hirokazu Takahashi <taka@valinux.co.jp>, xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>
References: <20260610111320.133784-1-taka@valinux.co.jp>
 <20260610111320.133784-3-taka@valinux.co.jp>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260610111320.133784-3-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[xen.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[xen.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B375F6759A1

Hi,

On 10/06/2026 12:13, Hirokazu Takahashi wrote:
> Make CPU topology information available to the Xen scheduler.
> Additionally, ensure that this topology information is displayed
> when executing the 'xl info -n' command.
> 
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
> ---
>   xen/arch/arm/include/asm/processor.h  |  4 ---
>   xen/arch/arm/smpboot.c                | 10 ++++--
>   xen/common/device-tree/cpu-topology.c | 51 +++++++++++++++++++++++++++
>   xen/common/sched/credit2.c            |  3 ++
>   xen/common/sysctl.c                   |  1 +
>   xen/include/xen/cpu-topology.h        | 10 ++++++
>   6 files changed, 72 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index a3753c317f..41fa73cfc4 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -613,10 +613,6 @@ void show_stack(const struct cpu_user_regs *regs);
>   
>   #define cpu_relax() barrier() /* Could yield? */
>   
> -/* All a bit UP for the moment */
> -#define cpu_to_core(_cpu)   (0)
> -#define cpu_to_socket(_cpu) (0)
> -
>   struct vcpu;
>   void vcpu_regs_hyp_to_user(const struct vcpu *vcpu,
>                              struct vcpu_guest_core_regs *regs);
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index c071f1494f..b25d98c109 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -91,13 +91,17 @@ static int setup_cpu_sibling_map(int cpu)
>            !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
>           return -ENOMEM;
>   
> +#ifdef CONFIG_DT_CPU_TOPOLOGY

For Arm, we support both ACPI and Device-Tree in a single binary. That's 
fine if we don't support NUMA with ACPI for now, but we need to make 
sure this doesn't regress for now.

With that in mind, I was expecting some runtime checks based on whether 
ACPI or DT is used. Can you explain why this is not the case?

Cheers,

-- 
Julien Grall


