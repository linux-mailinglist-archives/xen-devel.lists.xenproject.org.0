Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 982EA7BF005
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 03:03:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614533.955679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq18Y-0004UZ-1I; Tue, 10 Oct 2023 01:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614533.955679; Tue, 10 Oct 2023 01:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq18X-0004Rq-Ux; Tue, 10 Oct 2023 01:02:13 +0000
Received: by outflank-mailman (input) for mailman id 614533;
 Tue, 10 Oct 2023 01:02:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z25Z=FY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qq18W-0004Rj-7i
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 01:02:12 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a43b8336-6708-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 03:02:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 83817B818C8;
 Tue, 10 Oct 2023 01:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470F1C433C7;
 Tue, 10 Oct 2023 01:02:08 +0000 (UTC)
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
X-Inumbo-ID: a43b8336-6708-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696899729;
	bh=OPWkVPjvYvfNB7SF+9vkwQe3e6bfeNuc3c2yjKgJehU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Zz2QgsWqsobxCnYuP0GFdaUrQOKYlJpnoE1AOdvOBdeNkBZ7fjODBTXisTMG2SOq2
	 pc5KsvtnJjw/5Uex1LYpNoA5/I1D2UtMeDD7FInGTDtNBlR6XqpK1KYK9LU6daP8i7
	 yCbCtD7hLpMY0pk+Vrpzk4+ggN1rVO2XMF+LDcUARSRjo3jX8Ge/cxH0rwPZ9G6Tyq
	 oHX50p+bS7pd5q2w1vmbV2U46jjHR/KWv/feUH6FBvv1Hsj022QwnitVCBikd2GTHO
	 Jf9C4O12Xxx71nZjyaqIoeWd2JkuLntomZVi5yUEcTa2YVMvEtB6AtWElrtkiLv0ye
	 +qHYfVQV0Yu3A==
Date: Mon, 9 Oct 2023 18:02:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 9/9] xen/compat: address Rule 10.1 for macros
 CHECK_SIZE
In-Reply-To: <7edf60c0e7bd0680d8b8f8d3aec1264ee5a43878.1696514677.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310091749380.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com> <7edf60c0e7bd0680d8b8f8d3aec1264ee5a43878.1696514677.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 Oct 2023, Nicola Vetrini wrote:
> The essential type of the result of an inequality operator is
> essentially boolean, therefore it shouldn't be used as an argument of
> the multiplication operator, which expects an integer.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/include/xen/compat.h | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/include/xen/compat.h b/xen/include/xen/compat.h
> index f2ce5bb3580a..5ffee6a9fed1 100644
> --- a/xen/include/xen/compat.h
> +++ b/xen/include/xen/compat.h
> @@ -151,12 +151,14 @@ CHECK_NAME_(k, n, T)(k xen_ ## n *x, \
>      return x == c; \
>  }
>  
> +#define SIZE_NEQUAL(a, b) \
> +    (sizeof(a) != sizeof(b) ? 1 : 0)
>  #define CHECK_SIZE(name) \
> -    typedef int CHECK_NAME(name, S)[1 - (sizeof(xen_ ## name ## _t) != \
> -                                         sizeof(compat_ ## name ## _t)) * 2]
> +    typedef int CHECK_NAME(name, S)[1 - (SIZE_NEQUAL(xen_ ## name ## _t, \
> +                                                     compat_ ## name ## _t)) * 2]
>  #define CHECK_SIZE_(k, n) \
> -    typedef int CHECK_NAME_(k, n, S)[1 - (sizeof(k xen_ ## n) != \
> -                                          sizeof(k compat_ ## n)) * 2]
> +    typedef int CHECK_NAME_(k, n, S)[1 - (SIZE_NEQUAL(k xen_ ## n, \
> +                                                      k compat_ ## n)) * 2]

I think this style is easier to read but I'll let the x86 maintainers
decide

    typedef int CHECK_NAME(name, S)[(sizeof(xen_ ## name ## _t) == \
                                     sizeof(compat_ ## name ## _t)) ? 1 : -1]

Also am I reading this correctly that we are using -1 as array index? I
must have made a calculation mistake?

