Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E2384BDFB
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 20:15:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677099.1053522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXQua-0006Qn-RM; Tue, 06 Feb 2024 19:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677099.1053522; Tue, 06 Feb 2024 19:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXQua-0006NB-Nf; Tue, 06 Feb 2024 19:15:16 +0000
Received: by outflank-mailman (input) for mailman id 677099;
 Tue, 06 Feb 2024 19:15:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onkB=JP=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1rXQuZ-0006Mg-8k
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 19:15:15 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c5d9e84-c524-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 20:15:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id ED6E6A0112;
 Tue,  6 Feb 2024 20:15:10 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dvuld9gsIx-b; Tue,  6 Feb 2024 20:15:10 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 9300AA00DD;
 Tue,  6 Feb 2024 20:15:10 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1rXQuU-0000000HSQe-0cV0; Tue, 06 Feb 2024 20:15:10 +0100
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
X-Inumbo-ID: 0c5d9e84-c524-11ee-98f5-efadbce2ee36
Date: Tue, 6 Feb 2024 20:15:10 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org, julien@xen.org
Subject: Re: [PATCH v2] Mini-OS: fix 9pfs frontend error path
Message-ID: <20240206191510.zzlla3r2w7df3hvq@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org, julien@xen.org
References: <20240206191125.13065-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240206191125.13065-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le mar. 06 févr. 2024 20:11:25 +0100, a ecrit:
> The early error exit in p9_stat() returns without zeroing the p9_stat
> buffer, resulting in free() being called with an uninitialized pointer.
> 
> Fix that by calling free_stat() in p9_stat() in case of returning an
> error and potentially having allocated strings.
> 
> Reported-by: Julien Grall <julien@xen.org>
> Fixes: 2d1dfccd3aa3 ("Mini-OS: add read and write support to 9pfsfront")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

> ---
> V2:
> - call free_stat() in p9_stat() in case of returning an error
>   (Samuel Thibault)
> ---
>  9pfront.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/9pfront.c b/9pfront.c
> index 315089bc..042879a7 100644
> --- a/9pfront.c
> +++ b/9pfront.c
> @@ -728,6 +728,8 @@ static int p9_stat(struct dev_9pfs *dev, uint32_t fid, struct p9_stat *stat)
>             &stat->extension, &stat->n_uid, &stat->n_gid, &stat->n_muid);
>  
>      ret = req->result;
> +    if ( ret )
> +        free_stat(&stat);
>  
>      put_free_req(dev, req);
>  
> @@ -932,13 +934,13 @@ static int write_9pfs(struct file *file, const void *buf, size_t nbytes)
>      if ( f9pfs->append )
>      {
>          ret = p9_stat(f9pfs->dev, f9pfs->fid, &stat);
> -        free_stat(&stat);
>          if ( ret )
>          {
>              errno = EIO;
>              return -1;
>          }
>          file->offset = stat.length;
> +        free_stat(&stat);
>      }
>  
>      ret = p9_write(f9pfs->dev, f9pfs->fid, file->offset, buf, nbytes);
> -- 
> 2.35.3

