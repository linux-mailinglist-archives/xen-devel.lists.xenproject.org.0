Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B90E5080D4
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 08:03:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308815.524634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3Qj-00025F-Dr; Wed, 20 Apr 2022 06:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308815.524634; Wed, 20 Apr 2022 06:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3Qj-00022a-As; Wed, 20 Apr 2022 06:03:09 +0000
Received: by outflank-mailman (input) for mailman id 308815;
 Wed, 20 Apr 2022 06:03:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGXA=U6=inria.fr=julia.lawall@srs-se1.protection.inumbo.net>)
 id 1nh3Qi-00022U-7L
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 06:03:08 +0000
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bbc5b4f-c06f-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 08:03:06 +0200 (CEST)
Received: from 203.107.68.85.rev.sfr.net (HELO hadrien) ([85.68.107.203])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 08:03:05 +0200
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
X-Inumbo-ID: 8bbc5b4f-c06f-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=AOOcnU+E44vIs+pheMoJXhmNTxpxQArBK8PCjZDPu1k=;
  b=JeAqI8DLZD09zSdr45+0R8EO5Cgdby5+SpBtSnfHFkLwVpvLlmM/8hJ9
   wfe3mkqS1RL5WtqKsk7VTWq8kMEy8kh2kMthaDBOjZovZNbHjvj+M86gZ
   koeT8tRdLUdXrJXhjOnVGaG2G2dAAAAGX9BQtqO3MLoqF5FQ2TTUjsuDn
   A=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,274,1643670000"; 
   d="scan'208";a="32427415"
Date: Wed, 20 Apr 2022 08:03:05 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
cc: outreachy@lists.linux.dev, boris.ostrovsky@oracle.com, jgross@suse.com, 
    sstabellini@kernel.org, xen-devel@lists.xenproject.org, 
    linux-kernel@vger.kernel.org, ira.weiny@intel.com
Subject: Re: [PATCH v2] xen:  Convert kmap() to kmap_local_page()
In-Reply-To: <20220419234328.10346-1-eng.alaamohamedsoliman.am@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204200759080.2937@hadrien>
References: <20220419234328.10346-1-eng.alaamohamedsoliman.am@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 20 Apr 2022, Alaa Mohamed wrote:

> kmap() is being deprecated and these usages are all local to the thread
> so there is no reason kmap_local_page() can't be used.
>
> Replace kmap() calls with kmap_local_page().

OK, so from a Coccinelle point of view, could we do

@@
expression e1,e2,x,f;
@@

e1 =
- kmap
+ kmap_local_page
    (e2)
... when != x = e1 // not stored in any location and not passed to another function
    when != f(...,e1,...)
    when != x = e2
    when != f(...,e2,...)
-kunmap(e2)
+kunmap_local(e1)

julia

>
> Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
> ---
> changes in V2:
> 	-edit commit subject
> 	-edit commit message
> ---
>  drivers/xen/gntalloc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/xen/gntalloc.c b/drivers/xen/gntalloc.c
> index 4849f94372a4..55acb32842a3 100644
> --- a/drivers/xen/gntalloc.c
> +++ b/drivers/xen/gntalloc.c
> @@ -178,9 +178,9 @@ static void __del_gref(struct gntalloc_gref *gref)
>  	unsigned long addr;
>
>  	if (gref->notify.flags & UNMAP_NOTIFY_CLEAR_BYTE) {
> -		uint8_t *tmp = kmap(gref->page);
> +		uint8_t *tmp = kmap_local_page(gref->page);
>  		tmp[gref->notify.pgoff] = 0;
> -		kunmap(gref->page);
> +		kunmap_local(tmp);
>  	}
>  	if (gref->notify.flags & UNMAP_NOTIFY_SEND_EVENT) {
>  		notify_remote_via_evtchn(gref->notify.event);
> --
> 2.35.2
>
>
>

