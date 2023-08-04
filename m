Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A24676FF95
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 13:45:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577115.904011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRtEd-0004bA-5Q; Fri, 04 Aug 2023 11:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577115.904011; Fri, 04 Aug 2023 11:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRtEd-0004ZV-2Y; Fri, 04 Aug 2023 11:44:47 +0000
Received: by outflank-mailman (input) for mailman id 577115;
 Fri, 04 Aug 2023 11:44:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HS9z=DV=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qRtEb-0004ZP-Pu
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 11:44:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e1e9bc9-32bc-11ee-b26b-6b7b168915f2;
 Fri, 04 Aug 2023 13:44:44 +0200 (CEST)
Received: from [192.168.1.15] (host-79-35-203-138.retail.telecomitalia.it
 [79.35.203.138])
 by support.bugseng.com (Postfix) with ESMTPSA id 9FE4D4EE0737;
 Fri,  4 Aug 2023 13:44:43 +0200 (CEST)
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
X-Inumbo-ID: 4e1e9bc9-32bc-11ee-b26b-6b7b168915f2
Message-ID: <916de98d-95c5-988e-2fe2-6d8cfaf7c90e@bugseng.com>
Date: Fri, 4 Aug 2023 13:44:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] x86/processor: drop bool_t from mcheck_init()
 parameter
Content-Language: en-US, it
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <26b30382b1b3daffb829ceb34d39c14185e9e147.1691146541.git.federico.serafini@bugseng.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <26b30382b1b3daffb829ceb34d39c14185e9e147.1691146541.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 04/08/23 12:56, Federico Serafini wrote:
> Drop bool_t to make the function declaration consistent with the
> corresponding definition.
> This addresses a violation of MISRA C:2012 Rule 8.3 ("All declarations
> of an object or function shall use the same names and type qualifiers").
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>   xen/arch/x86/include/asm/processor.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
> index 0989748be6..ae43ba5dc9 100644
> --- a/xen/arch/x86/include/asm/processor.h
> +++ b/xen/arch/x86/include/asm/processor.h
> @@ -415,7 +415,7 @@ void noreturn fatal_trap(const struct cpu_user_regs *regs, bool_t show_remote);
>   extern void mtrr_ap_init(void);
>   extern void mtrr_bp_init(void);
>   
> -void mcheck_init(struct cpuinfo_x86 *c, bool_t bsp);
> +void mcheck_init(struct cpuinfo_x86 *c, bool bsp);
>   
>   void do_nmi(const struct cpu_user_regs *regs);
>   void do_machine_check(const struct cpu_user_regs *regs);

I can do better and drop bool_t from the entire file.
I will do it in a v2.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

