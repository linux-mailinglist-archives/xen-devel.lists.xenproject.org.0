Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 209367CA345
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 11:03:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617366.959887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsJV4-0005Z8-HP; Mon, 16 Oct 2023 09:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617366.959887; Mon, 16 Oct 2023 09:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsJV4-0005WU-ER; Mon, 16 Oct 2023 09:02:58 +0000
Received: by outflank-mailman (input) for mailman id 617366;
 Mon, 16 Oct 2023 09:02:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qsJV3-0005WO-NF
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 09:02:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsJV3-0004Xp-0M; Mon, 16 Oct 2023 09:02:57 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsJV2-0004hJ-Ru; Mon, 16 Oct 2023 09:02:56 +0000
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
	bh=H9QYC46kR+1MBbhFHgbRK5jNzYmS36utkZ0fLS9FiOs=; b=TgLlUKgAuYl3zcTTJIi6xINUsq
	6hEHNZoplN+beS7XK3oPy1OApHAqWP8OIA1UcTnJlwVvpNyckilq9xNfS7is4DNFO2DFhW8DblPc9
	enSbN39/njimQB/ZRbbOjQkwsxQWpjuk69/bS3oBDTKwZg2ayGxTUeis79KGxWexkwuo=;
Message-ID: <7db6d930-8a06-4a1b-b668-94df62972caa@xen.org>
Date: Mon, 16 Oct 2023 10:02:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 07/10] arm/traps: address a violation of MISRA C:2012
 Rule 8.2
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <henry.wang@arm.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
 <dbc0e965cd9f93848d27e7ebf0ffcfca05499d58.1697207038.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <dbc0e965cd9f93848d27e7ebf0ffcfca05499d58.1697207038.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/10/2023 16:24, Federico Serafini wrote:
> Add missing parameter name, no functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>   xen/arch/arm/traps.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index ce89f16404..5aa14d4707 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1236,7 +1236,7 @@ int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
>   
>       if ( id == BUGFRAME_run_fn )
>       {
> -        void (*fn)(const struct cpu_user_regs *) = (void *)regs->BUG_FN_REG;
> +        void (*fn)(const struct cpu_user_regs *regs) = (void *)regs->BUG_FN_REG;

Now the line will be over 80 characters. I think we should introduce a 
typedef. This would also help in the longer run to validate that the 
function passed to run_in_exception_handle() has the expected prototype.

Cheers,

-- 
Julien Grall

