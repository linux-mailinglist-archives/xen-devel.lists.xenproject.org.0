Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8938A368E3
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 00:05:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889131.1298362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj4ja-0004jM-Fm; Fri, 14 Feb 2025 23:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889131.1298362; Fri, 14 Feb 2025 23:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj4ja-0004fy-Ct; Fri, 14 Feb 2025 23:04:34 +0000
Received: by outflank-mailman (input) for mailman id 889131;
 Fri, 14 Feb 2025 23:04:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83Ve=VF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tj4jZ-00048v-Bl
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 23:04:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c34761c-eb28-11ef-9896-31a8f345e629;
 Sat, 15 Feb 2025 00:04:31 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0F7EF5C5DF5;
 Fri, 14 Feb 2025 23:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC381C4CED1;
 Fri, 14 Feb 2025 23:04:28 +0000 (UTC)
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
X-Inumbo-ID: 0c34761c-eb28-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739574270;
	bh=uCqM9IdkcfSdTHtQrqfihNhbAMkjLAyJfwXTNQqsRsE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sSVe77UuJ5m4EDOnqk29WW6QheMtN5abZtSMxVlsKp3rnpQFrYuFDbozM0FJRCVSM
	 KDIAeOqbZvZh5QNJA4zkzXBWEZBNnS3Y98wuW5jxSb81Ks54pymiT8+idZGfp0X9Vj
	 OxNsUVEn4bjDH5tCTNGMu/JDg92RnsnuTvpxBTDnC9lKGB8AJQaBoflzxhGMy7BRAW
	 zGnTRfgrawLa39NoP6G75hZXYJurW+/+BeWBM1nTwpcPlpASOj8Ht627g0xhXHyI6n
	 BZdta49OPn929N8P+W4uy/yAZffZcCFTYaApITtcbcEYnzG30+1b/5+SjGFVfo0lRG
	 FI+FGn7QCTz2w==
Date: Fri, 14 Feb 2025 15:04:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Dario Faggioli <dfaggioli@suse.com>, 
    Meng Xu <mengxu@cis.upenn.edu>, Juergen Gross <jgross@suse.com>, 
    George Dunlap <gwd@xenproject.org>
Subject: Re: [XEN PATCH 2/3] xen/sched: address violation of MISRA C Rule
 8.2
In-Reply-To: <36cd255a8d4068a66ad8cf45060d60b84b9d4c6d.1739564781.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2502141303380.3858257@ubuntu-linux-20-04-desktop>
References: <cover.1739564781.git.nicola.vetrini@bugseng.com> <36cd255a8d4068a66ad8cf45060d60b84b9d4c6d.1739564781.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 14 Feb 2025, Nicola Vetrini wrote:
> Rule 8.2 states: "Function types shall be in prototype form with
> named parameters".
> 
> The parameter name is missing from the function pointer type
> that constitutes the first parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> This small fix is needed in order to keep the rule clean in the
> follow-up patch that changes the Xen configuration under static
> analysis.
> 
> I wasn't really certain about the right name to give to the parameter,
> so if there are better options I'd be happy to accept them.
> ---
>  xen/common/sched/rt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
> index f368e0fdd5a5..0300d2d2e454 100644
> --- a/xen/common/sched/rt.c
> +++ b/xen/common/sched/rt.c
> @@ -500,7 +500,7 @@ deadline_queue_remove(struct list_head *queue, struct list_head *elem)
>  }
>  
>  static inline bool
> -deadline_queue_insert(struct rt_unit * (*qelem)(struct list_head *),
> +deadline_queue_insert(struct rt_unit * (*qelem)(struct list_head *q_iter),

I think it should be "elem" instead of "q_iter"

Other than that:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

The small change can be done on commit.


>                        struct rt_unit *svc, struct list_head *elem,
>                        struct list_head *queue)
>  {
> -- 
> 2.43.0
> 

