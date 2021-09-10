Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF9F4073C8
	for <lists+xen-devel@lfdr.de>; Sat, 11 Sep 2021 01:18:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184844.333619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOpmp-0005hl-A1; Fri, 10 Sep 2021 23:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184844.333619; Fri, 10 Sep 2021 23:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOpmp-0005f2-6l; Fri, 10 Sep 2021 23:18:23 +0000
Received: by outflank-mailman (input) for mailman id 184844;
 Fri, 10 Sep 2021 23:18:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGUI=OA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOpmo-0005ew-3v
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 23:18:22 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6378dffc-128d-11ec-b292-12813bfff9fa;
 Fri, 10 Sep 2021 23:18:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C5D261167;
 Fri, 10 Sep 2021 23:18:20 +0000 (UTC)
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
X-Inumbo-ID: 6378dffc-128d-11ec-b292-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631315900;
	bh=HNuFXlUzzdE3O5BLAoHNZ+FVASkIymP1ujqpRkY0Rrw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=vMjSAGX3eIpKKZ/2aboK5CtMRUyJ851TY0/yJLTuynzkG56DVaLrA0/4BQnNPuSAA
	 s9E3eJNRFsxeQ1g6+5CAU+W/vsRqEdaL5k+H1UFLsA09myTLjSUK5ilOvW/TKw1CaY
	 zmFJLiQWOD3Ox3UVyhthYpzR2hEEjvXGe8SsUbUqMqg5ZSon32sGzkG3ZHySvwsqtP
	 2SXkUNorUoCBNZVNblByQWetiBDvRdGwUTZl1egiCDnbrb1L2qJABEIA35Znsj0/ma
	 4unw9gFtcb8SI3Rk7IXEivt+urmWWJLFGSJgvbTE4vDk4yY5V8+waHBNk/EKlycYl3
	 3q4waikb+Y5Rg==
Date: Fri, 10 Sep 2021 16:18:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    lkml <linux-kernel@vger.kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 05/12] swiotlb-xen: suppress certain init retries
In-Reply-To: <56477481-87da-4962-9661-5e1b277efde0@suse.com>
Message-ID: <alpine.DEB.2.21.2109101617290.10523@sstabellini-ThinkPad-T480s>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com> <56477481-87da-4962-9661-5e1b277efde0@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Sep 2021, Jan Beulich wrote:
> Only on the 2nd of the paths leading to xen_swiotlb_init()'s "error"
> label it is useful to retry the allocation; the first one did already
> iterate through all possible order values.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> I'm not convinced of the (lack of) indentation of the label, but I made
> the new one matzch the existing one.
> 
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -184,7 +184,7 @@ retry:
>  		order--;
>  	}
>  	if (!start)
> -		goto error;
> +		goto exit;
>  	if (order != get_order(bytes)) {
>  		pr_warn("Warning: only able to allocate %ld MB for software IO TLB\n",
>  			(PAGE_SIZE << order) >> 20);
> @@ -214,6 +214,7 @@ error:
>  		pr_info("Lowering to %luMB\n", bytes >> 20);
>  		goto retry;
>  	}
> +exit:
>  	pr_err("%s (rc:%d)\n", xen_swiotlb_error(m_ret), rc);
>  	return rc;
>  }
> 

