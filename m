Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810CD8061CC
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 23:38:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648502.1012573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAe35-0002iW-Am; Tue, 05 Dec 2023 22:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648502.1012573; Tue, 05 Dec 2023 22:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAe35-0002gn-6w; Tue, 05 Dec 2023 22:37:51 +0000
Received: by outflank-mailman (input) for mailman id 648502;
 Tue, 05 Dec 2023 22:37:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQDs=HQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rAe33-0002gf-DQ
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 22:37:49 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8935b27-93be-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 23:37:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 77658CE1B22;
 Tue,  5 Dec 2023 22:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E39C433C7;
 Tue,  5 Dec 2023 22:37:39 +0000 (UTC)
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
X-Inumbo-ID: e8935b27-93be-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701815860;
	bh=sREbz9DKSjqXuLOUL8jwggcX4KntV1Kh5sSgOifiQyE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=arznWVpT85zXKYCMx2p9VwmS5C5YWedRxPvFBC90LJYoCFk3NcqnIXTMZpgAbE0L1
	 8wp7jgeiX6waz631/gRYN7zVbaDcPP8QwkjdU38PlAy+3VRuiNbfyvtXvGeKwHg+Og
	 J25uOw2o1GNnMo7LZA0iKsqosECXODo0BStzoOOexxlzoKIBSvbC+/ez+urAlbyml0
	 dWfY8OMyh2MnRrNJhF0XvPes4rJLKgirZ8+OVH7NzRvcJzKD7iCVUZWk81uihxoFlp
	 jcInj9Lrxy1nNoWxu5wrMwGOVXtgG/GcCznWSH+uk9jczslHFcH18kayl6nld/vhtf
	 vvjUsDOKrKJHA==
Date: Tue, 5 Dec 2023 14:37:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: linux-kernel@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org, Pry Mar <pryorm09@gmail.com>
Subject: Re: [PATCH] xen: update PV-device interface headers
In-Reply-To: <20231205115121.11627-1-jgross@suse.com>
Message-ID: <alpine.DEB.2.22.394.2312051437330.110490@ubuntu-linux-20-04-desktop>
References: <20231205115121.11627-1-jgross@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Dec 2023, Juergen Gross wrote:
> Update the Xen PV-device interface headers in order to avoid undefined
> behavior with flexible arrays being defined with one array element.
> 
> Reported-by: Pry Mar <pryorm09@gmail.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  include/xen/interface/io/displif.h | 2 +-
>  include/xen/interface/io/ring.h    | 2 +-
>  include/xen/interface/io/sndif.h   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/xen/interface/io/displif.h b/include/xen/interface/io/displif.h
> index 18417b017869..60e42d3b760e 100644
> --- a/include/xen/interface/io/displif.h
> +++ b/include/xen/interface/io/displif.h
> @@ -537,7 +537,7 @@ struct xendispl_dbuf_create_req {
>  
>  struct xendispl_page_directory {
>  	grant_ref_t gref_dir_next_page;
> -	grant_ref_t gref[1]; /* Variable length */
> +	grant_ref_t gref[];
>  };
>  
>  /*
> diff --git a/include/xen/interface/io/ring.h b/include/xen/interface/io/ring.h
> index ba4c4274b714..4fef1efcdcab 100644
> --- a/include/xen/interface/io/ring.h
> +++ b/include/xen/interface/io/ring.h
> @@ -95,7 +95,7 @@ struct __name##_sring {                                                 \
>      RING_IDX req_prod, req_event;                                       \
>      RING_IDX rsp_prod, rsp_event;                                       \
>      uint8_t __pad[48];                                                  \
> -    union __name##_sring_entry ring[1]; /* variable-length */           \
> +    union __name##_sring_entry ring[];                                  \
>  };                                                                      \
>                                                                          \
>  /* "Front" end's private variables */                                   \
> diff --git a/include/xen/interface/io/sndif.h b/include/xen/interface/io/sndif.h
> index 445657cdb1de..b818517588b5 100644
> --- a/include/xen/interface/io/sndif.h
> +++ b/include/xen/interface/io/sndif.h
> @@ -659,7 +659,7 @@ struct xensnd_open_req {
>  
>  struct xensnd_page_directory {
>  	grant_ref_t gref_dir_next_page;
> -	grant_ref_t gref[1]; /* Variable length */
> +	grant_ref_t gref[];
>  };
>  
>  /*
> -- 
> 2.35.3
> 

