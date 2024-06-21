Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6A7912F24
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 23:04:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745588.1152724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKlQe-0000Cm-Mp; Fri, 21 Jun 2024 21:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745588.1152724; Fri, 21 Jun 2024 21:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKlQe-0000AU-KE; Fri, 21 Jun 2024 21:04:16 +0000
Received: by outflank-mailman (input) for mailman id 745588;
 Fri, 21 Jun 2024 21:04:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/NIW=NX=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sKlQd-0000AO-9w
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 21:04:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf808892-3011-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 23:04:12 +0200 (CEST)
Received: from [192.168.1.20] (host-87-12-240-97.business.telecomitalia.it
 [87.12.240.97])
 by support.bugseng.com (Postfix) with ESMTPSA id EF2684EE0738;
 Fri, 21 Jun 2024 23:04:11 +0200 (CEST)
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
X-Inumbo-ID: cf808892-3011-11ef-b4bb-af5377834399
Message-ID: <fd5e03bd-2a56-45a9-8511-496de24569e9@bugseng.com>
Date: Fri, 21 Jun 2024 23:04:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] common/sched: address a violation of MISRA C Rule
 8.8
To: victorm.lira@amd.com, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, George Dunlap <george.dunlap@cloud.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>
References: <994b423128711b2a912401ff4cb13107ad5c6a9d.1718999221.git.victorm.lira@amd.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <994b423128711b2a912401ff4cb13107ad5c6a9d.1718999221.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/06/24 21:59, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
> 
> Rule 8.8: "The static storage class specifier shall be used in all
> declarations of objects and functions that have internal linkage"

What you are addressing with this patch seems to be a violation of
Rule 8.7: "Functions and objects should not be defined with external
linkage if they are referenced in only one translation unit".

> 
> This patch fixes this by adding the static specifier.
> No functional changes.
> 
> Reported-by: Stewart Hildebrand stewart.hildebrand@amd.com
> Signed-off-by: Victor Lira <victorm.lira@amd.com>
> Acked-by: George Dunlap <george.dunlap@cloud.com>
> ---
> Changes from v1:
> - adjust indentation and line width.
> ---
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Dario Faggioli <dfaggioli@suse.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: xen-devel@lists.xenproject.org
> ---
>   xen/common/sched/credit2.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
> index 685929c290..b4e03e2a63 100644
> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -1476,8 +1476,8 @@ static inline void runq_remove(struct csched2_unit *svc)
>       list_del_init(&svc->runq_elem);
>   }
>   
> -void burn_credits(struct csched2_runqueue_data *rqd, struct csched2_unit *svc,
> -                  s_time_t now);
> +static void burn_credits(struct csched2_runqueue_data *rqd,
> +                         struct csched2_unit *svc, s_time_t now);
>   
>   static inline void
>   tickle_cpu(unsigned int cpu, struct csched2_runqueue_data *rqd)
> @@ -1855,8 +1855,8 @@ static void reset_credit(int cpu, s_time_t now, struct csched2_unit *snext)
>       /* No need to resort runqueue, as everyone's order should be the same. */
>   }
>   
> -void burn_credits(struct csched2_runqueue_data *rqd,
> -                  struct csched2_unit *svc, s_time_t now)
> +static void burn_credits(struct csched2_runqueue_data *rqd,
> +                         struct csched2_unit *svc, s_time_t now)
>   {
>       s_time_t delta;
>   

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

