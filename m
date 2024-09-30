Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172E798B08A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 00:53:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807665.1219250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svPGl-0008N7-F9; Mon, 30 Sep 2024 22:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807665.1219250; Mon, 30 Sep 2024 22:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svPGl-0008KC-CZ; Mon, 30 Sep 2024 22:53:31 +0000
Received: by outflank-mailman (input) for mailman id 807665;
 Mon, 30 Sep 2024 22:53:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJxO=Q4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1svPGj-0008K6-Vc
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 22:53:29 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdfbdc09-7f7e-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 00:53:27 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 31C6BA418C5;
 Mon, 30 Sep 2024 22:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DBBC4CEC7;
 Mon, 30 Sep 2024 22:53:25 +0000 (UTC)
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
X-Inumbo-ID: cdfbdc09-7f7e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727736806;
	bh=TfJhImQo+pUZg9exQyjud2/Wduxmg3FAc6+gHIxLPY4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=r/1FAQW2aBvcko1hdZ+T1N3EYA60HtNZLOK3PR3VOMaldfC7JGTx9CIJvzKSSo+Pt
	 8PzTdWNSttOHUfkK+UU40Ks+2LKFzewfKRoUpExsp0Q+L2d4PWAOBfJ76AQlRVIJQN
	 cfpdB3MSsk6gYIhp6wzBzq/vbNcjHdVYylBLM/UT6IyUNWb0sjJ76ztpKy2VmPuP0m
	 yckMz0F0qdW6uo7Md1nTamdvJVIl2cAj8U1fz4CidDnLJ5/12AbIF9+hl4k1/ctPoP
	 euhr78XTr/bjfTdCdjXUEQnStnl+ny8kK7WtjO++LzTCP9TRUUm3sCMXL1MB4+6phy
	 z1zjyTn8v0Xxg==
Date: Mon, 30 Sep 2024 15:53:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 2/3] xen/gnttab: address a violation of MISRA C
 Rule 13.6
In-Reply-To: <cfd2873eb69707ec3f33ea888951ae5676c43bab.1727690180.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2409301549100.451631@ubuntu-linux-20-04-desktop>
References: <cover.1727690180.git.federico.serafini@bugseng.com> <cfd2873eb69707ec3f33ea888951ae5676c43bab.1727690180.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Sep 2024, Federico Serafini wrote:
> guest_handle_ok()'s expansion contains a sizeof() involving its
> first argument guest_handle_cast().
> The expansion of the latter, in turn, contains a variable
> initialization.
> 
> Since MISRA considers the initialization (even of a local variable)
> a side effect, the chain of expansions mentioned above violates
> MISRA C:2012 Rule 13.6 (The operand of the `sizeof' operator shall not
> contain any expression which has potential side effect).
> 
> Refactor the code to address the rule violation.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

There is a pending interesting comment from Jan on patch #1 that affects
this patch too, but I think this patch is good even just as a
readability improvement so I'll review it as is


> ---
> Changes in v2:
> - better description;
> - preserved original indentation.
> ---
>  xen/common/compat/grant_table.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/common/compat/grant_table.c b/xen/common/compat/grant_table.c
> index 5ad0debf96..bbb717bf64 100644
> --- a/xen/common/compat/grant_table.c
> +++ b/xen/common/compat/grant_table.c
> @@ -78,12 +78,15 @@ int compat_grant_table_op(
>          cmd_op = cmd;
>      switch ( cmd_op )
>      {
> -#define CASE(name) \
> -    case GNTTABOP_##name: \
> -        if ( unlikely(!guest_handle_okay(guest_handle_cast(uop, \
> -                                                           gnttab_##name##_compat_t), \
> -                                         count)) ) \
> -            rc = -EFAULT; \
> +#define CASE(name)                                                  \
> +    case GNTTABOP_ ## name:                                         \
> +    {                                                               \
> +        XEN_GUEST_HANDLE_PARAM(gnttab_ ## name ## _compat_t) h =    \
> +            guest_handle_cast(uop, gnttab_ ## name ## _compat_t);   \
> +                                                                    \
> +        if ( unlikely(!guest_handle_okay(h, count)) )               \
> +            rc = -EFAULT;                                           \
> +    }                                                               \
>          break

We would typically put the break within the case { }

Other than that, I think this. With that change:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



>  #ifndef CHECK_gnttab_map_grant_ref
> -- 
> 2.43.0
> 

