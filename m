Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2281F819E6C
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 12:48:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657731.1026785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFv43-0000Fw-Qs; Wed, 20 Dec 2023 11:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657731.1026785; Wed, 20 Dec 2023 11:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFv43-0000Dq-O3; Wed, 20 Dec 2023 11:48:39 +0000
Received: by outflank-mailman (input) for mailman id 657731;
 Wed, 20 Dec 2023 11:48:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFv42-0000DU-EP
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:48:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFv41-0003QO-VG; Wed, 20 Dec 2023 11:48:37 +0000
Received: from 82-132-247-3.dab.02.net ([82.132.247.3] helo=[172.20.10.6])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFv41-0002By-Ni; Wed, 20 Dec 2023 11:48:37 +0000
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
	bh=pxCChW35No+rJfSSfjI+Wshm5ryTpscDxnxYa6d2I6A=; b=Xd23ur7cLnXXFXcg0EMk8QjT/n
	ytXmOeBm6C0yrA90wwC5YEGdv12ldQfc6yyv1iMGR2jpNLjjhesxDCy6PWtyhRLTFa7u937KUssgS
	VqfCzZOKFzO8+H85smEdjUlvbNInmRhhEQQEGLx/VPDW8a3YcGEZUeABT9zCNY5Ov54I=;
Message-ID: <0200354e-08b9-4136-b6e9-3220a51256af@xen.org>
Date: Wed, 20 Dec 2023 11:48:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/7] xen/arm: v{cp,sys}reg: address violations of
 MISRA C:2012 Rule 16.3
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1703066935.git.federico.serafini@bugseng.com>
 <541bc4fd47d26b12ea131590bf0c49f7c92d9368.1703066935.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <541bc4fd47d26b12ea131590bf0c49f7c92d9368.1703066935.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Federico,

On 20/12/2023 11:03, Federico Serafini wrote:
> Refactor of the switch-clauses to have a return statement at the end.
> This satisfies the requirements to deviate Rule 16.3 ("An unconditional
> `break' statement shall terminate every switch-clause).
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>   xen/arch/arm/arm64/vsysreg.c | 4 ++--
>   xen/arch/arm/vcpreg.c        | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index b5d54c569b..247f08ad8d 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -210,8 +210,8 @@ void do_sysreg(struct cpu_user_regs *regs,
>           /* RO at EL0. RAZ/WI at EL1 */
>           if ( regs_mode_is_user(regs) )
>               return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
> -        else
> -            return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
> +
> +        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);

I don't 100% like this change (mostly because I find if/else clearer 
here). But I have the feeling any other solution would probably be 
worse. So:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

