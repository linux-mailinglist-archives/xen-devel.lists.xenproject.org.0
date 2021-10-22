Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1C8437A4B
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 17:48:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215143.374150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdwl7-00033M-4e; Fri, 22 Oct 2021 15:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215143.374150; Fri, 22 Oct 2021 15:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdwl7-00031Z-1b; Fri, 22 Oct 2021 15:47:05 +0000
Received: by outflank-mailman (input) for mailman id 215143;
 Fri, 22 Oct 2021 15:47:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZlF=PK=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mdwl5-00031T-Ua
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 15:47:04 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c0425cf-334f-11ec-83c8-12813bfff9fa;
 Fri, 22 Oct 2021 15:47:02 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1634917617999463.14123576632755;
 Fri, 22 Oct 2021 08:46:57 -0700 (PDT)
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
X-Inumbo-ID: 4c0425cf-334f-11ec-83c8-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1634917621; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L6i8OcuXs3Gk5mZxNMMklATyInx8pZj8xfmLD/9edXNbLNBmXwuqWLphuLGJTbcTWjsHQNdwuwEL7WyBLTgaIsFEpGDOb1Ndf11kZkOk9qmTQku6G6r+zFphUopH96hq2QgftuxHTkzJfqYxTmaLBqLtR186itE89066+EhX420=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1634917621; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=wVSldqCk0cvU2+ib2AagL3niuW4Ej9KCLbBqbxcPsBM=; 
	b=OGLQrYkz3GTVQs+yIr5PPYLIZxvNNneD2nRpP7hbVPrEpKbtt9+bgUfWHIGh72AFpIlodNsxe02rWzFPFWd27plEuuoNLzVT0LhLFzdyUlMZrbRC6lp3kCsARQxDUyxzt97MACMxwZwC72dRKgyXe+MsKu9LUGFGVmz8deTqzrc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1634917621;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wVSldqCk0cvU2+ib2AagL3niuW4Ej9KCLbBqbxcPsBM=;
	b=hydbCi2zLgx21dJT+d2ek1UvStvPMGgvs/i62gSG3WUVtDLX31Z7XC5tsZyYRBzO
	svEfu423tgCTRzwSb//hdCbO6kQ98yKHi1T85A55s9HOuYCAaWXMkfqzz96UjNgYEMu
	SZxj6LSWyRnoMVRde+KAUGHnY0PTyIjztIzcYMik=
Subject: Re: [PATCH v2 5/7] xen/xsm: Switch to byteswap.h
To: Lin Liu <lin.liu@citrix.com>, xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <cover.1634897942.git.lin.liu@citrix.com>
 <400efbc5c394140bb01664e5847046e8c4a38ea2.1634897942.git.lin.liu@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <037139aa-e274-a0fe-4d2f-10c457650d3e@apertussolutions.com>
Date: Fri, 22 Oct 2021 11:46:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <400efbc5c394140bb01664e5847046e8c4a38ea2.1634897942.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/22/21 6:47 AM, Lin Liu wrote:
> Update to use byteswap.h to swap bytes
> 
> No functional change
> 
> Signed-off-by: Lin Liu <lin.liu@citrix.com>
> ---
> Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
> Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> ---
>  xen/xsm/flask/ss/avtab.c       | 2 +-
>  xen/xsm/flask/ss/conditional.c | 2 +-
>  xen/xsm/flask/ss/ebitmap.c     | 2 +-
>  xen/xsm/flask/ss/policydb.c    | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/xsm/flask/ss/avtab.c b/xen/xsm/flask/ss/avtab.c
> index bfc91c8b0c..1fa796f625 100644
> --- a/xen/xsm/flask/ss/avtab.c
> +++ b/xen/xsm/flask/ss/avtab.c
> @@ -19,8 +19,8 @@
>  
>  /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
>  
> +#include <xen/byteswap.h>
>  #include <xen/lib.h>
> -#include <asm/byteorder.h>
>  #include <xen/types.h>
>  #include <xen/xmalloc.h>
>  #include <xen/errno.h>
> diff --git a/xen/xsm/flask/ss/conditional.c b/xen/xsm/flask/ss/conditional.c
> index 3e58aea551..059f6e07e5 100644
> --- a/xen/xsm/flask/ss/conditional.c
> +++ b/xen/xsm/flask/ss/conditional.c
> @@ -9,7 +9,7 @@
>  
>  /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
>  
> -#include <asm/byteorder.h>
> +#include <xen/byteswap.h>
>  #include <xen/lib.h>
>  #include <xen/types.h>
>  #include <xen/errno.h>
> diff --git a/xen/xsm/flask/ss/ebitmap.c b/xen/xsm/flask/ss/ebitmap.c
> index e1d0a586a7..1550437c6f 100644
> --- a/xen/xsm/flask/ss/ebitmap.c
> +++ b/xen/xsm/flask/ss/ebitmap.c
> @@ -10,7 +10,7 @@
>  
>  /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
>  
> -#include <asm/byteorder.h>
> +#include <xen/byteswap.h>
>  #include <xen/lib.h>
>  #include <xen/xmalloc.h>
>  #include <xen/errno.h>
> diff --git a/xen/xsm/flask/ss/policydb.c b/xen/xsm/flask/ss/policydb.c
> index 9426164353..595005c3b7 100644
> --- a/xen/xsm/flask/ss/policydb.c
> +++ b/xen/xsm/flask/ss/policydb.c
> @@ -22,7 +22,7 @@
>  
>  /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
>  
> -#include <asm/byteorder.h>
> +#include <xen/byteswap.h>
>  #include <xen/lib.h>
>  #include <xen/types.h>
>  #include <xen/xmalloc.h>
> 

Reviewed by: Daniel P. Smith <dpsmith@apertussolutions.com>

