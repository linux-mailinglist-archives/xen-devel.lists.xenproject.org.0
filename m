Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3850F76FD24
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 11:22:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577016.903801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRr13-0004Fd-U4; Fri, 04 Aug 2023 09:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577016.903801; Fri, 04 Aug 2023 09:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRr13-0004Di-RP; Fri, 04 Aug 2023 09:22:37 +0000
Received: by outflank-mailman (input) for mailman id 577016;
 Fri, 04 Aug 2023 09:22:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HS9z=DV=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qRr12-0004Dc-WA
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 09:22:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72583f47-32a8-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 11:22:35 +0200 (CEST)
Received: from [192.168.1.15] (host-79-35-203-138.retail.telecomitalia.it
 [79.35.203.138])
 by support.bugseng.com (Postfix) with ESMTPSA id 4FDC64EE0737;
 Fri,  4 Aug 2023 11:22:34 +0200 (CEST)
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
X-Inumbo-ID: 72583f47-32a8-11ee-8613-37d641c3527e
Message-ID: <a32cd7f5-7efa-39b1-ba09-09fd4ca01049@bugseng.com>
Date: Fri, 4 Aug 2023 11:22:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] x86/mm: address violations of MISRA C:2012 Rules 8.2
 and 8.3
Content-Language: en-US, it
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <7f4d7be410aecaab6e356947bb79e703037f4101.1691139867.git.federico.serafini@bugseng.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <7f4d7be410aecaab6e356947bb79e703037f4101.1691139867.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/08/23 11:05, Federico Serafini wrote:
> Give a name to unnamed parameters to address violations of
> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
> named parameters").
> Keep consistency between parameter names used in function
> declarations and the ones used in the corresponding function
> definitions, thus addressing violations of MISRA C:2012 Rule 8.3
> ("All declarations of an object or function shall use the same names
> and type qualifiers").
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>   xen/arch/x86/include/asm/mm.h | 20 ++++++++++----------
>   xen/arch/x86/mm.c             | 33 ++++++++++++++++++---------------
>   xen/include/xen/mm.h          |  2 +-
>   3 files changed, 29 insertions(+), 26 deletions(-)
> 

>   
>   int xenmem_add_to_physmap_one(struct domain *d, unsigned int space,
>                                 union add_to_physmap_extra extra,
> -                              unsigned long idx, gfn_t gfn);
> +                              unsigned long idx, gfn_t gpfn);

I am seeing now that this will cause a violation in the arm code,
I will propose a v2.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

