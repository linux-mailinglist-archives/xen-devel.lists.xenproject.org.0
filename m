Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2070A7AA50F
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 00:30:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606632.944605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjSBe-0007W3-SI; Thu, 21 Sep 2023 22:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606632.944605; Thu, 21 Sep 2023 22:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjSBe-0007Tz-PW; Thu, 21 Sep 2023 22:30:18 +0000
Received: by outflank-mailman (input) for mailman id 606632;
 Thu, 21 Sep 2023 22:30:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fi77=FF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qjSBd-0007Tt-Iq
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 22:30:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f947875-58ce-11ee-878a-cb3800f73035;
 Fri, 22 Sep 2023 00:30:16 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C8A8E620D1;
 Thu, 21 Sep 2023 22:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2338CC433C8;
 Thu, 21 Sep 2023 22:30:13 +0000 (UTC)
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
X-Inumbo-ID: 6f947875-58ce-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695335414;
	bh=dVEjkPwYs8THTagXuaJyDmZVI0EP90ti3yIQRfN/Hu0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nrV25QsDVstRtjr9O1qbcESGcsb243apSxQSmAgzKV9iBhyqf3Ya4q1i7FkZdJ+8m
	 ubZDSryJNyJGdGCxWaUIAQ/kbycExaXJKl7LA+/azOllG99TD1ym/soQ+s7YY2hLnU
	 IiyQJgnOmTGmPa9VCM/Zft6qwMKZMKMe7rwwiBFRZ8mDBYUue/1pxaQ/u/yr4mYCji
	 +GLtUQ0FjVEIiCYdjpaxf6xe0tsJaQp37B4Otk74pyHcd+1XLoqrgKoSvH59d25nK8
	 FnCcM71Jz1cOHFL/12Ldq79t7PPoQZSAXMuDSwf0Ckk8Fs4UzGmqX5Bnlap8UX2cvQ
	 TdZDacROuV/4A==
Date: Thu, 21 Sep 2023 15:30:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen/numa: address a violation of MISRA C:2012 Rule
 8.3
In-Reply-To: <2b1c7a05a2ddd3c9f83e1a147ebf295e55ddcbe9.1695305387.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309211529550.3563@ubuntu-linux-20-04-desktop>
References: <2b1c7a05a2ddd3c9f83e1a147ebf295e55ddcbe9.1695305387.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Sep 2023, Federico Serafini wrote:
> Make object declarations consistent. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/include/xen/numa.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> index 29b8c2df89..287e81ff66 100644
> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -60,7 +60,7 @@ static inline void clear_node_cpumask(unsigned int cpu)
>  /* Simple perfect hash to map pdx to node numbers */
>  extern unsigned int memnode_shift;
>  extern unsigned long memnodemapsize;
> -extern uint8_t *memnodemap;
> +extern nodeid_t *memnodemap;
>  
>  struct node_data {
>      unsigned long node_start_pfn;
> -- 
> 2.34.1
> 

