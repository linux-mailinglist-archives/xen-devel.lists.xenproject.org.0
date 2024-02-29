Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0273386D715
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 23:57:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687442.1070915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfpKc-0000q4-UT; Thu, 29 Feb 2024 22:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687442.1070915; Thu, 29 Feb 2024 22:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfpKc-0000nd-R5; Thu, 29 Feb 2024 22:56:50 +0000
Received: by outflank-mailman (input) for mailman id 687442;
 Thu, 29 Feb 2024 22:56:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI6L=KG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rfpKb-0000nV-LQ
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 22:56:49 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d006947f-d755-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 23:56:47 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0A2F1CE0C50;
 Thu, 29 Feb 2024 22:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C92C433C7;
 Thu, 29 Feb 2024 22:56:42 +0000 (UTC)
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
X-Inumbo-ID: d006947f-d755-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709247404;
	bh=WIv2SbTkcmK9Wn3JUKPksz+Ccji2UinT1E7Ev6UMVFI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QqzGJhRJnMgjanFj0J6Kit3RpaEAlWXcRZ0dYF2eSJvr3fXtgXjn2NJUhAkYDG9Km
	 ZsqTyGUpWVutpv2I56SEyWrVzIKdoe3pcW7iv1qcKmf29U+ye+aMXWrA/hLuG5fJt+
	 TdyC5nJeT2gcYttNH8DgpSR10hoVUMyPdY1zwBo3HmqZCkeSmkyL9h3FWKYzVzpbGr
	 147YRXFZ3UEx7tJ36aKSojCoSfKssMc+0qg1/DDtHE42BX1JDNfTj1pVh5di/wF9Yf
	 FP6DXuESRq1w5ajNd0s+DFXBsfw+2EASuudgtUgpupDg6kqknszDanKmkQ4m64zO+O
	 dpx3SuBWx506w==
Date: Thu, 29 Feb 2024 14:56:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, bertrand.marquis@arm.com, julien@xen.org, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 09/10] xen/include: tasklet: address violations of
 MISRA C Rule 20.7
In-Reply-To: <952d13bdb830cb1d8d3282e49333323bc8755cd5.1709219010.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2402291456150.853156@ubuntu-linux-20-04-desktop>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com> <952d13bdb830cb1d8d3282e49333323bc8755cd5.1709219010.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Feb 2024, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/include/xen/tasklet.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/xen/tasklet.h b/xen/include/xen/tasklet.h
> index 593d6a2400fb..78760b694a39 100644
> --- a/xen/include/xen/tasklet.h
> +++ b/xen/include/xen/tasklet.h
> @@ -27,7 +27,7 @@ struct tasklet
>  
>  #define _DECLARE_TASKLET(name, func, data, softirq)                     \
>      struct tasklet name = {                                             \
> -        LIST_HEAD_INIT(name.list), -1, softirq, 0, 0, func, data }
> +        LIST_HEAD_INIT((name).list), -1, softirq, 0, 0, func, data }
>  #define DECLARE_TASKLET(name, func, data)               \
>      _DECLARE_TASKLET(name, func, data, 0)
>  #define DECLARE_SOFTIRQ_TASKLET(name, func, data)       \

In reality this is not required due to "struct tasklet name", but for
uniformity:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

