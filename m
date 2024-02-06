Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E6784B964
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 16:26:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676993.1053385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXNKu-0005mz-0P; Tue, 06 Feb 2024 15:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676993.1053385; Tue, 06 Feb 2024 15:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXNKt-0005lE-Su; Tue, 06 Feb 2024 15:26:11 +0000
Received: by outflank-mailman (input) for mailman id 676993;
 Tue, 06 Feb 2024 15:26:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onkB=JP=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1rXNKs-0005jM-BY
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 15:26:10 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a3e8872-c504-11ee-8a48-1f161083a0e0;
 Tue, 06 Feb 2024 16:26:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 8C8BFA0121;
 Tue,  6 Feb 2024 16:26:03 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uaO-G1aid_Ox; Tue,  6 Feb 2024 16:26:03 +0100 (CET)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 36986A00FA;
 Tue,  6 Feb 2024 16:26:03 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1rXNKk-0000000Ge82-3XMf; Tue, 06 Feb 2024 16:26:02 +0100
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
X-Inumbo-ID: 0a3e8872-c504-11ee-8a48-1f161083a0e0
Date: Tue, 6 Feb 2024 16:26:02 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org, julien@xen.org
Subject: Re: [PATCH] Mini-OS: fix 9pfs frontend error path
Message-ID: <20240206152602.5mbztpfam7x2ykcw@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org, julien@xen.org
References: <20240206061721.27297-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240206061721.27297-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le mar. 06 févr. 2024 07:17:21 +0100, a ecrit:
> The early error exit in p9_stat() returns without zeroing the p9_stat
> buffer, resulting in free() being called with an uninitialized pointer.
> 
> Fix that by doing the zeroing first.

This is not coherent with the usual conventions: when a function fails,
it is supposed not to have done anything, and thus the caller shouldn't
have to clean anything.

I.e. i'd rather see the free_stat() call be put after the check for
an error returned by p9_stat.

> Reported-by: Julien Grall <julien@xen.org>
> Fixes: 2d1dfccd3aa3 ("Mini-OS: add read and write support to 9pfsfront")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  9pfront.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/9pfront.c b/9pfront.c
> index 315089bc..33eaadce 100644
> --- a/9pfront.c
> +++ b/9pfront.c
> @@ -716,10 +716,11 @@ static int p9_stat(struct dev_9pfs *dev, uint32_t fid, struct p9_stat *stat)
>      uint16_t total;
>      int ret;
>  
> +    memset(stat, 0, sizeof(*stat));
> +
>      if ( !req )
>          return EAGAIN;
>  
> -    memset(stat, 0, sizeof(*stat));
>      req->cmd = P9_CMD_STAT;
>      send_9p(dev, req, "U", fid);
>      rcv_9p(dev, req, "uuuUQUUULSSSSSUUU", &total, &stat->size, &stat->type,
> -- 
> 2.35.3

